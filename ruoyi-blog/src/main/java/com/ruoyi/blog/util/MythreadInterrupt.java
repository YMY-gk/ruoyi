package com.ruoyi.blog.util;

import org.springframework.jdbc.core.BatchPreparedStatementSetter;

import java.sql.PreparedStatement;
import java.util.Arrays;

/**
 * @author yumuyi
 * @version 1.0
 * @date 2020/4/29 0:07
 */
public class MythreadInterrupt {
    static  int num = 100;
    public static void main(String[] args) throws Exception {
        String[] list = {"aaa", "bbb", "ccc", "ddd","eee","fff","ggg","hhh","jjj","lll"};
        for (int j=0;j<10;j++){
            String[] list1= list.clone();
            list1[j] = j+list1[j];
            new Thread(new Runnable() {
                @Override
                public void run() {

                    try {
                        batchInsertRows(list1);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                }
            }).start();

        }
        batchInsertRows(list);


    }

    public static void batchInsertRows(final String[] dataSet) throws Exception{

        BatchPreparedStatementSetter setter=new BatchPreparedStatementSetter(){

            public int getBatchSize(){
                return dataSet.length;
            }
            public void setValues(PreparedStatement ps, int i){

                System.out.println( Thread.currentThread()+"----->"+i  +"------->" +   dataSet[i]);

            }
        };
        System.out.println( Thread.currentThread()+"dataSet----->"+ Arrays.toString(dataSet));

    }

}
