package com.ruoyi.blog.controller;

import com.ruoyi.blog.service.BlogService;
import com.ruoyi.blog.service.TagService;
import com.ruoyi.blog.vo.BlogQuery;
import com.ruoyi.system.VO.TagVo;
import com.ruoyi.system.domain.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @Auther: 南迪叶先生:https://www.cnblogs.com/ye888/
 * @Date: 2019/10/12
 * @Description: com.yrp.controller
 * @version: 1.0
 */
@Controller
@RequestMapping("blog")
public class TagShowController {
    @Autowired
    private TagService tagServiceImpl;


    @Autowired
    private BlogService blogServiceImpl;


    @GetMapping("/tags/{id}")
    public String tags(Model model) {

        List<TagVo> tags = tagServiceImpl.ListTagTop(10000);
        Long id =0L;
        if (id == -1){
            id = tags.get(0).getId();
        }
        BlogQuery blogQuery = new BlogQuery();
        model.addAttribute("tags",tags);
        model.addAttribute("page",null);
        model.addAttribute("avtiveTagId",id);
        return "blog/tags";
    }

}
