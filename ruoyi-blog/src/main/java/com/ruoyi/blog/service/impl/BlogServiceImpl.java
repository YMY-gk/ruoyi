package com.ruoyi.blog.service.impl;

import com.ruoyi.blog.service.BlogService;
import com.ruoyi.blog.util.MarkdownUtils;
import com.ruoyi.blog.util.NotFoundException;
import com.ruoyi.system.VO.BlogVo;
import com.ruoyi.system.domain.Blog;
import com.ruoyi.system.mapper.BlogMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * @Auther: 南迪叶先生:https://www.cnblogs.com/ye888/
 * @Date: 2019/10/3
 * @Description: com.yrp.service.impl
 * @version: 1.0
 */
@Service
public class BlogServiceImpl implements BlogService
{

    @Autowired
    private BlogMapper blogRepository;


    @Override
    public Blog getBlog(Long id) {
        return blogRepository.selectByPrimaryKey(id);
    }

    @Override
    public Blog getAadConvertBlog(Long id) {
        Blog blog = blogRepository.selectByPrimaryKey(id);
        if (blog == null){
            throw new NotFoundException("该博客不存在！");
        }
        Blog b = new Blog();
        BeanUtils.copyProperties(blog,b);
        b.setContent(MarkdownUtils.markdownToHtmlExtensions(b.getContent()));
        blogRepository.updateViews(id);
        return b;
    }

//    @Override
//    public Page<Blog> ListBlog(Pageable pageable, BlogQuery blog) {
//        return null;
//    }
//
         @Override
         public Map<String,Object> ListBlog(int size, int page){
            HashMap<String,Object> map = new HashMap<>();
            Integer count = blogRepository.fundBlogCount();
            int cpage= (page-1)*size;
             List<BlogVo>  list = blogRepository.fundBlogLimit(cpage,size);


             map.put("totalElements",count);
             map.put("content",list);
             map.put("totalPages",page);
             map.put("number",size);
             map.put("first",cpage);

             return map;
        }
//
//    @Override
//    public Page<Blog> ListBlog(Long tagId, Pageable pageable) {
//
//        return null;
//    }
//
//    @Override
//    public Page<Blog> ListBlog(Pageable pageable, String query) {
//        return null;
//    }

    @Override
    public List<BlogVo> listRecommendBlogTop(Integer size) {

        List<BlogVo>  list =  blogRepository.findTop(size);
        return list;
    }

    @Override
    public Map<String, List<Blog>> archiveBlog() {

        return null;
    }

    @Override
    public Long countBlog() {
        return null;
    }

    /**
     * 发布博客
     *          (如何是新增博客,需要添加创建时间和修改时间、以及初始化浏览量view = 0)
     *          (如果是修改博客,需要添加修改时间)
     * @param blog
     * @return
     */
    @Transactional
    @Override
    public Blog saveBlog(Blog blog) {
        //博客新增
        return null;
    }

    /**
     * 所谓的修改其实是查询+保存
     * @param id
     * @param blog
     * @return
     */
    @Transactional
    @Override
    public Blog updateBlog(Long id, Blog blog) {
        return null;
    }

    @Transactional
    @Override
    public void deleteBlog(Long id) {

    }
}
