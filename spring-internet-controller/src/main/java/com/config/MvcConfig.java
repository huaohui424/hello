package com.config;

import com.interceptor.FirstInterceptor;
import com.interceptor.SecondInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration   //设置配置类
@EnableWebMvc    //启用WebMvc
@ComponentScan({"com.controller.computer","com.controller.admin","com.controller.users","com.controller.bar","com.controller.login","com.controller.product","com.controller.upload","com.interceptor","com.exception"})   //扫描各个包下面的东西
public class MvcConfig implements WebMvcConfigurer {

    //视图解析器
    @Bean
    public InternalResourceViewResolver viewResolver(){
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("/WEB-INF/");  //设置前缀
        viewResolver.setSuffix(".jsp");      //设置后缀
        return viewResolver;
    }

    //文件上传
    @Bean
    public CommonsMultipartResolver multipartResolver(){
        CommonsMultipartResolver resolver = new CommonsMultipartResolver();
        resolver.setMaxUploadSize(1000000);
        return resolver;
    }

    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addFormatter(new DateFormatter("yyyy-MM-dd"));
    }

    //配置拦截器
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        InterceptorRegistration interceptorRegistration = registry.addInterceptor(new SecondInterceptor());
        interceptorRegistration.addPathPatterns("/**");
        interceptorRegistration.excludePathPatterns("/adminLogin");
        interceptorRegistration.excludePathPatterns("/");
        interceptorRegistration.excludePathPatterns("/static/**");
        interceptorRegistration.excludePathPatterns("/login");
        interceptorRegistration.excludePathPatterns("/productClassify");
        //InterceptorRegistration interceptorRegistration1 = registry.addInterceptor(new SecondInterceptor());
        //interceptorRegistration1.addPathPatterns("/employee/**");
        //interceptorRegistration1.addPathPatterns("/userInfo/**");

    }

    //处理静态资源
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        ResourceHandlerRegistration registration
                = registry.addResourceHandler("/static/**");
        registration.addResourceLocations("classpath:/static/");
    }


}
