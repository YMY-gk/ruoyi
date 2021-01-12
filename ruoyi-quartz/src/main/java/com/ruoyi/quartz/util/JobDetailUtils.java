package com.ruoyi.quartz.util;

import com.ruoyi.common.constant.ScheduleConstants;
import com.ruoyi.common.exception.job.TaskException;
import com.ruoyi.common.exception.job.TaskException.Code;
import com.ruoyi.quartz.domain.SysJob;
import org.quartz.*;

/**
 * 定时任务工具类
 * 
 * @author ruoyi
 *
 */
public class JobDetailUtils
{


    public static JobDetail getJobDetail(SysJob sysJob, JobKey jk, Class<? extends Job> jobClass) {
        JobDetail jobDetail = JobBuilder.newJob(jobClass).withIdentity(jk).build();
        return jobDetail;
    }
}