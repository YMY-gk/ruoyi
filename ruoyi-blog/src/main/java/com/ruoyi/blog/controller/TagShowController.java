package com.ruoyi.blog.controller;

import com.ruoyi.blog.service.BlogService;
import com.ruoyi.blog.service.TagService;
import com.ruoyi.blog.vo.BlogQuery;
import com.ruoyi.system.VO.TagVo;
import com.ruoyi.system.domain.Tag;
import com.ruoyi.system.model.TypeQuery;
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


    @GetMapping("/tags")
    public String tags(Model model, TypeQuery typeQuery) {

        List<TagVo> tags = tagServiceImpl.ListTagTop(10000);
        model.addAttribute("tags",tags);
        model.addAttribute("page",blogServiceImpl.ListBlogbyTypeId(typeQuery));
        model.addAttribute("avtiveTagId",typeQuery.getTagsId());
        return "blog/tags";
    }

}
