package com.ruoyi.blog.controller;

import com.ruoyi.blog.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Auther: 南迪叶先生:https://www.cnblogs.com/ye888/
 * @Date: 2019/10/15
 * @Description: com.yrp.controller.admin
 * @version: 1.0
 */
@Controller
@RequestMapping("blog")
public class ArchiveShowController {
    @Autowired
    private BlogService blogServiceImpl;


    @GetMapping("/archives")
    public String archives(Model model) {
        model.addAttribute("archiveMap", blogServiceImpl.archiveBlog());
        model.addAttribute("blogCount", blogServiceImpl.countBlog());
        return "archives";
    }
}
