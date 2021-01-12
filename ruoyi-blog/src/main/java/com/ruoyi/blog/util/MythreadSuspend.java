package com.ruoyi.blog.util;

/**
 * @author yumuyi
 * @version 1.0
 * @date 2020/4/29 0:07
 */
public class MythreadSuspend {
    static  int num = 100;

    public static void main(String[] args) {

        Thread aa = new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    while (true) {
                        if (Thread.interrupted()) {
                            System.out.println("当前线程中断");
                            return;
                        //    throw new InterruptedException();

                        }
                        try {
                            Thread.sleep(100l);
                        } catch (InterruptedException e) {
                            e.printStackTrace();
                        }
                        num--;
                        System.out.println(Thread.currentThread() + "2--->" + num);
                        if (num <= 0) break;
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
        aa.start();
        try {
            Thread.sleep(100l);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        aa.interrupt();
        while (true) {
            try {
                Thread.sleep(100l);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }            num--;
            System.out.println(Thread.currentThread() + "3--->" + num);
            if (num<=0) break;
        }
    }
}
