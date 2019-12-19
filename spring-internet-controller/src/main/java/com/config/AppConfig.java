package com.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.github.pagehelper.PageInterceptor;
import org.apache.ibatis.logging.stdout.StdOutImpl;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;
import java.util.Properties;

@Configuration     //标明配置类
@ComponentScan({"com.service"})  //扫描service层
@MapperScan("com.dao")    //mybatis-spring提供的扫描mapper接口用来创建实现类
@PropertySource("classpath:db.properties")   //读取外部文件
@EnableTransactionManagement   //开启事务
public class AppConfig {
    @Value("root")
    private String username;
    @Value("${jdbc.url}")
    private String url;
    @Value("root")
    private String password;

    //连接池
    @Bean
    public DataSource dataSource(){
        DruidDataSource druidDataSource = new DruidDataSource();
        druidDataSource.setUsername(username);
        druidDataSource.setPassword(password);
        druidDataSource.setUrl(url);
        return druidDataSource;
    }

    //利用SqlSessionFactoryBean创建SqlSessionFactory
    @Bean
    public SqlSessionFactory sqlSessionFactory() throws Exception {
        SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
        factoryBean.setDataSource(dataSource());
        factoryBean.setPlugins(pageInterceptor());
        //PathMatchingResourcePatternResolver是一个Ant模式通配符的Resource查找器，可以用来查找类路径下或者文件系统中的资源。
        PathMatchingResourcePatternResolver resourcePatternResolver = new PathMatchingResourcePatternResolver();

        //classpath: 表示加载当前类路径中所有匹配的资源
        Resource[] resources = resourcePatternResolver.getResources("classpath:mappers/**/*.xml");
        factoryBean.setMapperLocations(resources);
        //日志
        factoryBean.setConfiguration(configuration());
        return factoryBean.getObject();
    }

    //分页插件
    private PageInterceptor pageInterceptor(){
        PageInterceptor pageInterceptor = new PageInterceptor();

        Properties properties = new Properties();
        properties.put("supportMethodsArguments", "true");
        properties.put("reasonable", "true");
        pageInterceptor.setProperties(properties);
        return pageInterceptor;
    }

    private org.apache.ibatis.session.Configuration configuration(){
        org.apache.ibatis.session.Configuration configuration = new org.apache.ibatis.session.Configuration();
        configuration.setLogImpl(StdOutImpl.class);
        configuration.setMapUnderscoreToCamelCase(true);
        return configuration;
    }

    //事务
    @Bean
    public PlatformTransactionManager transactionManager(){
        DataSourceTransactionManager transactionManager = new DataSourceTransactionManager();
        transactionManager.setDataSource(dataSource());
        return transactionManager;
    }
}
