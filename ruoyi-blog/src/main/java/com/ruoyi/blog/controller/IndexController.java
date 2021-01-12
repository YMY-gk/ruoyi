package com.ruoyi.blog.controller;


import com.ruoyi.blog.service.BlogService;
import com.ruoyi.blog.service.TagService;
import com.ruoyi.blog.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * 首页index.html
 */
@Controller
@RequestMapping("/blog")
public class IndexController {

	@Autowired
	private BlogService blogServiceImpl;

	@Autowired
	private TypeService typeServiceImpl;

	@Autowired
	private TagService tagServiceImpl;

	/**
	 * 首页面显示
	 * @return
	 */
	@GetMapping("/")
	public String index(Model model,@PathVariable("page") long page ){

	    //1. 获取分页的博客列表
		model.addAttribute("page",blogServiceImpl.ListBlog(4,1));
		//2. 获取分类的内容(显示6条)
		model.addAttribute("types",typeServiceImpl.listTypeTop(6));
		//3. 获取标签的内容
		model.addAttribute("tags",tagServiceImpl.ListTagTop(10));
		//4. 显示推荐博客列表
		model.addAttribute("recommendBlogs",blogServiceImpl.listRecommendBlogTop(8));
		return "blog/index";
	}

	/**
	 * 导航栏中的搜索功能实现
	 * @return
	 * @param model
	 */
    @PostMapping("/search")
    public String search( Model model) {
        model.addAttribute("page", null);
        model.addAttribute("query", null);
        return "blog/search";
    }

    @GetMapping("/blog/{id}")
    public  String blog(@PathVariable("id") Long id,Model model){
        model.addAttribute("blog",blogServiceImpl.getAadConvertBlog(id));
        return "blog/blog";
    }

    @GetMapping("/footer/newblog")
    public String newblos(Model model){
		model.addAttribute("newblogs",blogServiceImpl.listRecommendBlogTop(3));
    	return "blog/_fragments :: newblogList";
	}

}
