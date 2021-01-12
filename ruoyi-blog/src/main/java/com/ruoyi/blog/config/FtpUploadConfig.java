package com.ruoyi.blog.config;


import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.springframework.context.annotation.Bean;

import java.io.IOException;

//@Configuration
public class FtpUploadConfig
{

    @Bean
    public FTPClient connectFtpServer() {
        FTPClient ftpClient = new FTPClient();
        ftpClient.setConnectTimeout(1000*30);//设置连接超时时间
        ftpClient.setControlEncoding("utf-8");//设置ftp字符集
        ftpClient.enterLocalPassiveMode();//设置被动模式，文件传输端口设置
        try {
            ftpClient.setFileType(FTP.BINARY_FILE_TYPE);//设置文件传输模式为二进制，可以保证传输的内容不会被改变
            ftpClient.connect("ftp://182.254.221.85/");
            ftpClient.login("gk","yumuyi01");
            int replyCode = ftpClient.getReplyCode();
            if (!FTPReply.isPositiveCompletion(replyCode)){
                ftpClient.disconnect();
                return null;
            }
        } catch (IOException e) {
            return null;
        }
        return ftpClient;
    }

}
