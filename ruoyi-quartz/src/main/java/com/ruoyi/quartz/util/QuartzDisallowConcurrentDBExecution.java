package com.ruoyi.quartz.util;

import com.ruoyi.quartz.domain.SysJob;
import org.quartz.DisallowConcurrentExecution;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

/**
 * 定时任务处理（禁止并发执行）
 * 
 * @author ruoyi
 *
 */
@DisallowConcurrentExecution
public class QuartzDisallowConcurrentDBExecution extends QuartzJobBean
{

    @Override
    protected void executeInternal(JobExecutionContext jobExecutionContext)  {
        try {
            JobInvokeUtil.invokeQiartz(jobExecutionContext);
            System.out.println();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
