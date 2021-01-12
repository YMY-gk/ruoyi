package com.ruoyi.quartz.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;

import javax.sql.DataSource;
import java.io.IOException;
import java.util.Properties;


public class QuartzConfig
{
    @Bean
    public SchedulerFactoryBean schedulerFactoryBean(DataSource dataSource)
    {


        return null;
    }
    @Bean
    public SchedulerFactoryBean schedulerFactoryBean01(DataSource dataSource) throws IOException {
        SchedulerFactoryBean factory = new SchedulerFactoryBean();

        return factory;
    }
}
