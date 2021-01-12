package com.ruoyi.quartz.util;

import com.ruoyi.common.constant.ScheduleConstants;
import com.ruoyi.common.exception.job.TaskException;
import com.ruoyi.common.exception.job.TaskException.Code;
import com.ruoyi.quartz.domain.SysJob;
import org.quartz.*;
import org.quartz.impl.matchers.EverythingMatcher;
import org.quartz.impl.matchers.GroupMatcher;
import org.quartz.impl.matchers.KeyMatcher;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

/**
 * 定时任务工具类
 * 
 * @author ruoyi
 *
 */
public class ScheduleSpringUtils
{
    /**
     * 得到quartz任务类
     *
     * @param sysJob 执行计划
     * @return 具体执行任务类
     */
    private static Class<? extends Job> getQuartzJobClass(SysJob sysJob)
    {
        boolean isConcurrent = "0".equals(sysJob.getConcurrent());
        return isConcurrent ? QuartzJobExecution.class : QuartzDisallowConcurrentExecution.class;
    }

    /**
     * 构建任务触发对象
     */
    public static TriggerKey getTriggerKey(Long jobId, String jobGroup)
    {
        return TriggerKey.triggerKey(ScheduleConstants.TASK_CLASS_NAME + jobId, jobGroup);
    }

    /**
     * 构建任务键对象
     */
    public static JobKey getJobKey(Long jobId, String jobGroup)
    {
        return JobKey.jobKey(ScheduleConstants.TASK_CLASS_NAME + jobId, jobGroup);
    }

    /**
     * 创建定时任务
     */
    public static void createScheduleJob(Scheduler scheduler,SysJob sysJob) throws SchedulerException, TaskException
    {
        Class<? extends Job> jobClass = getQuartzJobClass(sysJob);
        // 构建job信息
        Long jobId = sysJob.getJobId();
        String jobGroup = sysJob.getJobGroup();
        JobKey jk=getJobKey(jobId, jobGroup);
        TriggerKey tk=getTriggerKey(jobId, jobGroup);
        Trigger trigger = TriggerUtils.createTrigger(sysJob,jk,tk);
        JobDetail jobDetail =  JobDetailUtils.getJobDetail(sysJob,jk,jobClass);
        jobDetail.getJobDataMap().put(ScheduleConstants.TASK_PROPERTIES, sysJob);
        // 判断是否存在
        if (scheduler.checkExists(getJobKey(jobId, jobGroup)))
        {
            // 防止创建时存在数据问题 先移除，然后在执行创建操作
            scheduler.deleteJob(getJobKey(jobId, jobGroup));
        }
        //加入JOB监听器全局
        scheduler.getListenerManager().addJobListener(new QuartzJobListener(), EverythingMatcher.allJobs());
        //加入JOB费全局监听器
        scheduler.getListenerManager().addJobListener(new QuartzJobListener(), KeyMatcher.keyEquals(jk));
        //加入Tringer监听器非全局的
        scheduler.getListenerManager().addTriggerListener(new QuartzTriggerListener(),  KeyMatcher.keyEquals(tk));
        //加入Tringer监听器全局的
        scheduler.getListenerManager().addTriggerListener(new QuartzTriggerListener(),EverythingMatcher.allTriggers());
        scheduler.getListenerManager().addSchedulerListener(new QuartzSchedulListener());
        scheduler.scheduleJob(jobDetail, trigger);
        // 暂停任务
        if (sysJob.getStatus().equals(ScheduleConstants.Status.PAUSE.getValue()))
        {
            scheduler.pauseJob(ScheduleUtils.getJobKey(jobId, jobGroup));
        }
    }
    /**
     * 创建定时任务
     */
    public static void startScheduleJob(Scheduler scheduler) throws SchedulerException, TaskException
    {
        List<String> list=scheduler.getJobGroupNames();
        List<String> list1=scheduler.getCalendarNames();
        List<String> list2=scheduler.getTriggerGroupNames();
        SchedulerContext list3=scheduler.getContext();
        Set<JobKey> jobKeySet = scheduler.getJobKeys(GroupMatcher.anyGroup());

        Iterator iterator =jobKeySet.iterator();
        while(iterator.hasNext()){
            JobKey jobKey = (JobKey) iterator.next();
            JobDetail jb=  scheduler.getJobDetail(jobKey);
            System.out.println(jb.toString());
        }
    }
}