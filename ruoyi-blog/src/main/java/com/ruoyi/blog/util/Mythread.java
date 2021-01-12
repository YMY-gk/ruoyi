package com.ruoyi.blog.util;

/**
 * @author yumuyi
 * @version 1.0
 * @date 2020/4/29 0:07
 */
public class Mythread {
    static  int num = 100;

    public static void main(String[] args) {
         new Thread(new Runnable() {
            @Override
            public void run() {
                while (true) {
                    try {
                        Thread.sleep(100l);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    num--;
                    System.out.println(Thread.currentThread() + "1--->" + num);
                    if (num<=0) break;
                }
            }
        }).start();
        new Thread(new Runnable() {
            @Override
            public void run() {
                while (true) {
                    try {
                        Thread.sleep(100l);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }                    num--;
                    System.out.println(Thread.currentThread() + "2--->" + num);
                    if (num<=0) break;
                }
            }
        }).start();
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
