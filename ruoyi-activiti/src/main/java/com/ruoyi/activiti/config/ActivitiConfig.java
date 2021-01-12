package com.ruoyi.activiti.config;

import org.activiti.engine.*;
import org.activiti.engine.impl.cfg.StandaloneProcessEngineConfiguration;
import org.activiti.engine.impl.history.HistoryLevel;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;
import java.io.IOException;

@Configuration
public class ActivitiConfig
{

    @Bean
    public ProcessEngine processEnginebuild(DataSource dataSource) throws IOException {
        ProcessEngineConfiguration processEngineConfiguration = StandaloneProcessEngineConfiguration.createStandaloneProcessEngineConfiguration();
        processEngineConfiguration.setDataSource(dataSource);

        processEngineConfiguration.setDatabaseSchema("ACTIVITI");
        processEngineConfiguration.setDatabaseSchemaUpdate("true");
        processEngineConfiguration.setHistoryLevel(HistoryLevel.FULL);
        processEngineConfiguration.setDbHistoryUsed(true);
        //jobExecutorActivate
        processEngineConfiguration.setAsyncExecutorActivate(false);
        return processEngineConfiguration.buildProcessEngine();
    }

//	<!-- 工作流仓储服务 --> <!--部署流程定义文件-->
    @Bean
    public RepositoryService getRepositoryService(ProcessEngine processEngine) throws IOException {
        return processEngine.getRepositoryService();
    }
//	<!-- 工作流运行服务 -->
    @Bean
    public RuntimeService getRuntimeService(ProcessEngine processEngine) throws IOException {
        return processEngine.getRuntimeService();
    }
//	<!-- 工作流任务服务 -->
    @Bean
    public TaskService getTaskService(ProcessEngine processEngine) throws IOException {
        return processEngine.getTaskService();
    }
//	<!-- 工作流历史数据服务 -->
     @Bean
    public HistoryService getHistoryService(ProcessEngine processEngine) throws IOException {
        return processEngine.getHistoryService();
    }
//	<!-- 工作流管理服务 -->
    @Bean
    public ManagementService getManagementService(ProcessEngine processEngine) throws IOException {
        return processEngine.getManagementService();
    }
//	<!-- 工作流唯一服务（用户服务） -->
    @Bean
    public IdentityService getIdentityService(ProcessEngine processEngine) throws IOException {
        return processEngine.getIdentityService();
    }
//	<!-- 表单服务 -->
     @Bean
    public FormService getFormService(ProcessEngine processEngine) throws IOException {
        return processEngine.getFormService();
    }
////	<bean id="dynamicBpmnService" factory-bean="processEngine" factory-method="getDynamicBpmnService"/>
    public DynamicBpmnService getDynamicBpmnService(ProcessEngine processEngine) throws IOException {
        return processEngine.getDynamicBpmnService();
    }
}
