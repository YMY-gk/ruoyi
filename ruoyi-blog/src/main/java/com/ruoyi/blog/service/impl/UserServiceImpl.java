package com.ruoyi.blog.service.impl;


import com.ruoyi.blog.service.Userservice;
import com.ruoyi.blog.util.MD5Utils;
import com.ruoyi.system.domain.BlogUser;
import com.ruoyi.system.mapper.BlogUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Auther: 南迪叶先生:https://www.cnblogs.com/ye888/
 * @Date: 2019/9/28
 * @Description: com.yrp.service.serviceimpl
 * @version: 1.0
 */
@Service
public class UserServiceImpl implements Userservice {

    @Autowired
    private BlogUserMapper userRepository;

    @Override
    public BlogUser checkUser(String username, String password) {
        System.out.println(username);
        System.out.println(password);
        System.out.println(MD5Utils.code(password));
        return null;
    }
}
