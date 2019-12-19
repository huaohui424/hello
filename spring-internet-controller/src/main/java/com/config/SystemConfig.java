package com.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class SystemConfig extends AbstractAnnotationConfigDispatcherServletInitializer {
    /**
     * 当你的项目只有一个spring 容器,那么只需要下面方法返回有值即可
     *
     * 如果有2个容器,那么这2个配置类的方法都需要返回配置类
     * @return
     */

    //配置root上下文,如Jpa数据源等等的配置
    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[]{AppConfig.class};
    }

    //配置dispatcher servlet，如果在root config指定了该转发规则就可以忽略
    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class[]{MvcConfig.class};
    }

    //指定开始被servlet处理的url,配置从/开始
    @Override
    protected String[] getServletMappings() {
        return new String[]{"/"};
    }
}
