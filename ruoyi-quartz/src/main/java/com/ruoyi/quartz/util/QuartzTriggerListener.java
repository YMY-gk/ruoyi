package com.ruoyi.quartz.util;

import org.quartz.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * job监听
 *
 * @author ruoyi
 */
public  class QuartzTriggerListener implements TriggerListener
{
    private static final Logger log = LoggerFactory.getLogger(QuartzTriggerListener.class);


    @Override
    public String getName() {
        return "TriggerListener监听器";
    }

    /**
     * 当与监听器相同的trigger执行,job未被执行时执行
     * @param trigger
     * @param jobExecutionContext
     */
    @Override
    public void triggerFired(Trigger trigger, JobExecutionContext jobExecutionContext) {
        log.debug("TriggerListener------>监听开始");

    }

    /**
     * job将被执行时加入判断条件来否定执行
     * @param trigger
     * @param jobExecutionContext
     * @return
     */
    @Override
    public boolean vetoJobExecution(Trigger trigger, JobExecutionContext jobExecutionContext) {
        log.debug("TriggerListener------>监听开始");

        return false;
    }

    /**
     * 出现定时任务超时执行时
     * @param trigger
     */
    @Override
    public void triggerMisfired(Trigger trigger) {
        log.debug("TriggerListener------>监听开始");

    }

    /**
     * 执行完成后
     * @param trigger
     * @param jobExecutionContext
     * @param completedExecutionInstruction
     */
    @Override
    public void triggerComplete(Trigger trigger, JobExecutionContext jobExecutionContext, Trigger.CompletedExecutionInstruction completedExecutionInstruction) {
        log.debug("TriggerListener------>监听完成");

    }
}
