package com.ruoyi.blog.controller;

import com.ruoyi.blog.service.BlogService;
import com.ruoyi.blog.service.TypeService;
import com.ruoyi.blog.vo.BlogQuery;
import com.ruoyi.system.VO.TypeVo;
import com.ruoyi.system.domain.Type;
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
public class TypeShowController {
    @Autowired
    private TypeService typeServiceImpl;


    @Autowired
    private BlogService blogServiceImpl;


    @GetMapping("/types/{id}")
    public String types(Model model) {

        List<TypeVo> types = typeServiceImpl.listTypeTop(10000);
        Long id =0l;
        if (id == -1){
            id = types.get(0).getId();
        }
        BlogQuery blogQuery = new BlogQuery();
        blogQuery.setTypeId(id);
        model.addAttribute("types",types);
        model.addAttribute("page",null);
        model.addAttribute("avtiveTypeId",id);
        return "types";
    }

}
