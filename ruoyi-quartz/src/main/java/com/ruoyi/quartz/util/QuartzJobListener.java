package com.ruoyi.quartz.util;

import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.constant.ScheduleConstants;
import com.ruoyi.common.utils.ExceptionUtil;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.bean.BeanUtils;
import com.ruoyi.common.utils.spring.SpringUtils;
import com.ruoyi.quartz.domain.SysJob;
import com.ruoyi.quartz.domain.SysJobLog;
import com.ruoyi.quartz.service.ISysJobLogService;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.JobListener;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Date;

/**
 * job监听
 *
 * @author ruoyi
 */
public  class QuartzJobListener implements JobListener
{
    private static final Logger log = LoggerFactory.getLogger(QuartzJobListener.class);


    @Override
    public String getName() {
        return "JoB测试监听器";
    }

    /**
     * 任务执行之前执行，
     * @param jobExecutionContext
     */
    @Override
    public void jobToBeExecuted(JobExecutionContext jobExecutionContext) {
        log.debug("JoB------>监听开始");
    }

    /**
     * 将要执行但是被拦截否定执行时调用用
     * @param jobExecutionContext
     */
    @Override
    public void jobExecutionVetoed(JobExecutionContext jobExecutionContext) {
        log.debug("JoB------->监听被否定");

    }

    /**
     * 执行结束时开始执行
     * @param jobExecutionContext
     * @param e
     */
    @Override
    public void jobWasExecuted(JobExecutionContext jobExecutionContext, JobExecutionException e) {
        log.debug("JoB------->监听结束");
    }
}
