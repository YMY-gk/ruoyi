package com.ruoyi.blog.service.imp;

import com.ruoyi.common.exception.BusinessException;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
import sun.misc.BASE64Encoder;

import java.io.*;

/**
 * @author yumuyi
 * @version 1.0
 * @date 2020/12/21 13:50
 */

public class UploadServiceImp  {

    FTPClient ftpClient;

    /**
     *
     * @param inputStream 待上传文件的输入流
     * @param originName 文件保存时的名字
     */
    public void uploadFile(InputStream inputStream, String originName){
        try {
            if (ftpClient == null){
                ftpClient.login("gk","yumuyi01");
            }
            ftpClient.changeWorkingDirectory(originName);//进入到文件保存的目录
            Boolean isSuccess = ftpClient.storeFile(originName,inputStream);//保存文件
            if (!isSuccess){
                throw new BusinessException(originName+"---》上传失败！");
            }
            ftpClient.logout();
        } catch (IOException e) {
            throw new BusinessException(e.getMessage());
        }finally {
            if (ftpClient.isConnected()){
                try {
                    ftpClient.disconnect();
                } catch (IOException e) {
                    new BusinessException("disconnect fail ------->>>{}",e.getCause());
                }
            }
        }
    }

    public String readFileToBase64(String remoteFileName) {
        String base64 = "";
        InputStream inputStream = null;

        try {
            ftpClient.changeWorkingDirectory(remoteFileName);
            FTPFile[] ftpFiles = ftpClient.listFiles(remoteFileName);
            Boolean flag = false;
            //遍历当前目录下的文件，判断要读取的文件是否在当前目录下
            for (FTPFile ftpFile:ftpFiles){
                if (ftpFile.getName().equals(remoteFileName)){
                    flag = true;
                }
            }

            if (!flag){
                return null;
            }
            //获取待读文件输入流
            String remoteDir="";
            inputStream = ftpClient.retrieveFileStream(remoteDir+remoteFileName);

            //inputStream.available() 获取返回在不阻塞的情况下能读取的字节数，正常情况是文件的大小
            byte[] bytes = new byte[inputStream.available()];

            inputStream.read(bytes);//将文件数据读到字节数组中
            BASE64Encoder base64Encoder = new BASE64Encoder();
            base64 = base64Encoder.encode(bytes);//将字节数组转成base64字符串
            ftpClient.logout();
        } catch (IOException e) {
            return null;
        }finally {
            if (ftpClient.isConnected()){
                try {
                    ftpClient.disconnect();
                } catch (IOException e) {
                }
            }

            if (inputStream != null){
                try {
                    inputStream.close();
                } catch (IOException e) {
                }
            }

        }

        return base64;
    }

    public void download() {

    }

//    public static void main(String[] args) {
//        FTPClient ftpClient = new FTPClient();
//        ftpClient.setConnectTimeout(10000*30);//设置连接超时时间
//        ftpClient.setControlEncoding("utf-8");//设置ftp字符集
//        ftpClient.enterLocalPassiveMode();//设置被动模式，文件传输端口设置
//        try {
//            ftpClient.connect("182.254.221.85",21);
//            ftpClient.login("root","!@#$qwerASDF1234");
//            ftpClient.setFileType(FTP.BINARY_FILE_TYPE);//设置文件传输模式为二进制，可以保证传输的内容不会被改变
//
//            int replyCode = ftpClient.getReplyCode();
//            if (!FTPReply.isPositiveCompletion(replyCode)){
//                ftpClient.disconnect();
//            }
//            File file = new File("D:\\Users\\gk\\Desktop\\公司浅解.docx");
//            String remoteDir= "20201221";
//            InputStream is = new FileInputStream (file);
//            uploadFile(ftpClient,is,file.getName());
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }
//    public static void uploadFile(FTPClient ftpClient,InputStream inputStream, String originName){
//        try {
//
//            String remoteDir= "logs";
//
//            ftpClient.changeWorkingDirectory(remoteDir);//进入到文件保存的目录
//            Boolean isSuccess = ftpClient.storeFile(originName,inputStream);//保存文件
//            if (!isSuccess){
//                throw new BusinessException(originName+"---》 " +
//                        "" +
//                        "+上传失败！");
//            }
//            ftpClient.logout();
//        } catch (IOException e) {
//            throw new BusinessException(e.getMessage());
//        }finally {
//            if (ftpClient.isConnected()){
//                try {
//                    ftpClient.disconnect();
//                } catch (IOException e) {
//                    new BusinessException("disconnect fail ------->>>{}",e.getCause());
//                }
//            }
//        }
//    }
}
