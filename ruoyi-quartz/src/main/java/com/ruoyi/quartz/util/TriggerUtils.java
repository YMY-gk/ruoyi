package com.ruoyi.quartz.util;

import com.ruoyi.common.constant.ScheduleConstants;
import com.ruoyi.common.exception.job.TaskException;
import com.ruoyi.common.exception.job.TaskException.Code;
import com.ruoyi.quartz.domain.SysJob;
import org.quartz.*;

import static org.quartz.TriggerBuilder.newTrigger;

/**
 * 定时触发器工具类
 * 现有触发起主要有两种都是继承Trigger
 *     private TriggerKey key;  ---TriggerKey名称
 *     private String description;  -----描述
 *     private Date startTime = new Date();  ----开始时间
 *     private Date endTime;           ------结束时间
 *     private int priority = 5;      ---优先级
 *     private String calendarName;　　－－－－
 *     private JobKey jobKey;　　　　　－－－－工作区名称
 *
 *     private JobDataMap jobDataMap = new JobDataMap();　　－－－传递参数区
 *     private ScheduleBuilder<?> scheduleBuilder = null;－－－－定时任务选择区：CronScheduleBuilder－＞CronTrigger，simpleSchedule－－＞simpleTrigger
 *
 * @author gk
 * s
 */
public class TriggerUtils {

    public static Trigger createTrigger(SysJob job, JobKey jk, TriggerKey tk) throws SchedulerException, TaskException{

        ScheduleBuilder scheduleBuilder =getCronScheduleBuilder(job);
        Trigger tt = newTrigger()
                .withIdentity(tk)
                .forJob(jk)
                .withSchedule(scheduleBuilder) // execute job daily at 9:30
                .build();
          return tt;
    }
    public static ScheduleBuilder getCronScheduleBuilder(SysJob job) throws SchedulerException, TaskException{
        CronScheduleBuilder cronScheduleBuilder  = CronScheduleBuilder.cronSchedule(job.getCronExpression());
        ScheduleBuilder scheduleBuilder = handleCronScheduleMisfirePolicy(job, cronScheduleBuilder);
        return cronScheduleBuilder;
    }
    public static CronScheduleBuilder handleCronScheduleMisfirePolicy(SysJob job, CronScheduleBuilder cb)
            throws TaskException
    {
        switch (job.getMisfirePolicy())
        {
            case ScheduleConstants.MISFIRE_DEFAULT:
                return cb;
            case ScheduleConstants.MISFIRE_IGNORE_MISFIRES:
                return cb.withMisfireHandlingInstructionIgnoreMisfires();
            case ScheduleConstants.MISFIRE_FIRE_AND_PROCEED:
                return cb.withMisfireHandlingInstructionFireAndProceed();
            case ScheduleConstants.MISFIRE_DO_NOTHING:
                return cb.withMisfireHandlingInstructionDoNothing();
            default:
                throw new TaskException("The task misfire policy '" + job.getMisfirePolicy()
                        + "' cannot be used in cron schedule tasks", Code.CONFIG_ERROR);
        }
    }

}