package com.ruoyi.quartz.util;

import org.quartz.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * job监听
 *
 * @author ruoyi
 */
public  class QuartzSchedulListener implements SchedulerListener
{
    private static final Logger log = LoggerFactory.getLogger(QuartzSchedulListener.class);

    /**
     *
     * @param trigger
     */
    @Override
    public void jobScheduled(Trigger trigger) {
        log.debug("QuartzSchedulListener------>监听完成部署");

    }

    /**
     *
     * @param triggerKey
     */
    @Override
    public void jobUnscheduled(TriggerKey triggerKey) {
        log.debug("QuartzSchedulListener------>监听完成卸载");

    }

    /**
     *
     * @param trigger
     */
    @Override
    public void triggerFinalized(Trigger trigger) {
        log.debug("QuartzSchedulListener------>监听完成移除");

    }

    /**
     *
     * @param triggerKey
     */
    @Override
    public void triggerPaused(TriggerKey triggerKey) {
        log.debug("QuartzSchedulListener------>监听完成暂停");

    }

    /**
     *
     * @param s
     */
    @Override
    public void triggersPaused(String s) {
        log.debug("QuartzSchedulListener------>监听完成暂停");

    }

    /**
     *
     * @param triggerKey
     */
    @Override
    public void triggerResumed(TriggerKey triggerKey) {
        log.debug("QuartzSchedulListener------>监听完成恢复");

    }

    /**
     *
     * @param s
     */
    @Override
    public void triggersResumed(String s) {
        log.debug("QuartzSchedulListener------>监听完成恢复");

    }

    /**
     *
     * @param jobDetail
     */
    @Override
    public void jobAdded(JobDetail jobDetail) {
        log.debug("QuartzSchedulListener------>监听完成job添加");

    }

    /**
     *
     * @param jobKey
     */
    @Override
    public void jobDeleted(JobKey jobKey) {
        log.debug("QuartzSchedulListener------>监听完成job删除");

    }

    /**
     *
     * @param jobKey
     */
    @Override
    public void jobPaused(JobKey jobKey) {
        log.debug("QuartzSchedulListener------>监听完成job暂停");

    }

    /**
     *
     * @param s
     */
    @Override
    public void jobsPaused(String s) {
        log.debug("QuartzSchedulListener------>监听完成job暂停");

    }

    /**
     *
     * @param jobKey
     */
    @Override
    public void jobResumed(JobKey jobKey) {
        log.debug("QuartzSchedulListener------>监听完成job恢复");

    }

    /**
     *
     * @param s
     */
    @Override
    public void jobsResumed(String s) {
        log.debug("QuartzSchedulListener------>监听完成恢复");

    }

    /**
     *
     * @param s
     * @param e
     */
    @Override
    public void schedulerError(String s, SchedulerException e) {
        log.debug("QuartzSchedulListener------>监听完成");

    }

    /**
     *
     */
    @Override
    public void schedulerInStandbyMode() {
        log.debug("QuartzSchedulListener------>监听完成");

    }

    /**
     *
     */
    @Override
    public void schedulerStarted() {
        log.debug("QuartzSchedulListener------>监听完成");

    }

    /**
     *
     */
    @Override
    public void schedulerStarting() {
        log.debug("QuartzSchedulListener------>监听完成");

    }

    /**
     *
     */
    @Override
    public void schedulerShutdown() {
        log.debug("QuartzSchedulListener------>监听完成");

    }

    /**
     *
     */
    @Override
    public void schedulerShuttingdown() {
        log.debug("QuartzSchedulListener------>监听完成");

    }

    /**
     *
     */
    @Override
    public void schedulingDataCleared() {
        log.debug("QuartzSchedulListener------>监听完成");

    }
}
