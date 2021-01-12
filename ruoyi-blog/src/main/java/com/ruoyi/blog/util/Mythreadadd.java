package com.ruoyi.blog.util;

/**
 * @author yumuyi
 * @version 1.0
 * @date 2020/4/29 0:07
 */
public class Mythreadadd {
    static int num = 0;
    public static void main(String[] args) {

        new Thread(new Runnable() {
            @Override
            public void run() {
                int i=100;
                while (i-->0) {
                    System.out.println(Thread.currentThread() + "1----(num)--------->" + num);
                    num++;
                    System.out.println(Thread.currentThread() + "1----(num++)--------->" + num);
                    try {
                        Thread.sleep(100l);

                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    System.out.println(Thread.currentThread() + "1----(sleep num++)--------->" + num);
                }
            }
        }).start();
        new Thread(new Runnable() {
            @Override
            public void run() {
                int i=100;
                while (i-->0) {
                    System.out.println(Thread.currentThread() + "3num->" + num);
                    num--;
                    System.out.println(Thread.currentThread() + "3     ----(num--)->" + num);

                    try {
                        Thread.sleep(100l);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    System.out.println(Thread.currentThread() + "3     ----(sleep num--)->" + num);
                }
            }
        }).start();
    }
}
