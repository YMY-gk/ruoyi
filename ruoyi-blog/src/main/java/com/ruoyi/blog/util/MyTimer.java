package com.ruoyi.blog.util;

import java.util.Timer;
import java.util.TimerTask;

/**
 * @author yumuyi
 * @version 1.0
 * @date 2020/4/29 0:07
 */
public class MyTimer {
    static  int num = 100;

    public static void main(String[] args) {
        /**
         * Timer：是一个定时器工具，用来执行指定任务
         * TimerTask：是一个抽象类，他的子类可以代表一个被Timer计划的任务
         */
        TimerTask task = new TimerTask() {
            @Override
            public void run() {
                // task to run goes here
                // 执行的输出的内容
                System.out.println("Hello, stranger");
            }
        };
        Timer timer = new Timer();
        // 定义开始等待时间  --- 等待 5 秒
        // 1000ms = 1s
        long delay = 5000;
        // 定义每次执行的间隔时间
        long intevalPeriod = 5 * 1000;
        // schedules the task to be run in an interval
        // 安排任务在一段时间内运行
        timer.scheduleAtFixedRate(task, delay, intevalPeriod);

        try {
            Thread.sleep(100000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        timer.cancel();
        int aa=timer.purge();

        System.out.println("11111Hello, stranger---->"+aa);

    } // end of main

}
