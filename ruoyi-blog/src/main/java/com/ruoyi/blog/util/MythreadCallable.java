package com.ruoyi.blog.util;

import java.util.concurrent.*;

/**
 * @author yumuyi
 * @version 1.0
 * @date 2020/4/29 0:07
 */
public class MythreadCallable {
    static  int num = 100;

    public static void main(String[] args) {
        ExecutorService executorService = Executors.newCachedThreadPool();
       Callable aa=new Callable<String>() {
            @Override
            public String call() throws Exception {
                    while (true) {
                        if (Thread.interrupted()) {
                            System.out.println("当前线程中断");

                            throw new InterruptedException();

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
                    return "123";
            }
        };
        Callable bb=new Callable<String>() {
            @Override
            public String call() throws Exception {

                System.out.println(Thread.currentThread() + "333--->5555555555555555555555555" );

                return "123";
            }
        };
        Future asser = executorService.submit(aa);

        Future  bbb= executorService.submit(bb);
        try {
            System.out.println(Thread.currentThread() + "3--->" + asser.get());
            System.out.println(Thread.currentThread() + "3--->" + bbb.get());

        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }
        System.out.println(Thread.currentThread() + "4-------------------------------------->" );
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
