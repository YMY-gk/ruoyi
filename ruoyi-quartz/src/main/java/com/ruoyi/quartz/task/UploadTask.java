package com.ruoyi.quartz.task;

import com.ruoyi.common.utils.StringUtils;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.stereotype.Component;

import java.util.Date;
@Component("quartzJob")
public class UploadTask  {

    public void sendSMS()
    {

    }

    public void sendEmail(String params)
    {
        System.out.println("执行有参方法：" + params);
    }

    public void sendFax()
    {
        System.out.println("执行无参方法");
    }

    public void sendWX()
    {
        System.out.println("执行无参方法");
    }
}