package com.ruoyi.blog.service;

import com.ruoyi.system.VO.BlogVo;
import com.ruoyi.system.domain.Blog;
import com.ruoyi.system.model.TypeQuery;

import java.util.List;
import java.util.Map;

/**
 * @Auther: 南迪叶先生:https://www.cnblogs.com/ye888/
 * @Date: 2019/10/3
 * @Description: com.yrp.po
 * @version: 1.0
 */
public interface BlogService {
    /**
     * 通过id查询单条博客
     * @param id
     * @return
     */
    BlogVo getBlog(Long id);

    /**
     * 通过id查询单条博客（前端使用）
     * @param id
     * @return
     */
    BlogVo getAadConvertBlog(Long id);


//    /**
//     * 分页查询博客
//     * @param pageable
//     * @param blog
//     * @return
//     */
//    Page<Blog> ListBlog(Pageable pageable, BlogQuery blog);
//
    /**
     * 分页查询显示博客列表
     * @param pageable
     * @param i
     * @param page
     * @return
     */
    Map<String,Object> ListBlog(int size, int page);
//
//
//    Page<Blog> ListBlog(Long tagId, Pageable pageable);
//
//    /**
//     * 模糊查询分页显示博客列表
//     * @param pageable
//     * @param query
//     * @return
//     */
//    Page<Blog> ListBlog(Pageable pageable, String query); /**
//     * 分页查询博客
//     * @param pageable
//     * @param blog
//     * @return
//     */
//    Page<Blog> ListBlog(Pageable pageable, BlogQuery blog);
//
//    /**
//     * 分页查询显示博客列表
//     * @param pageable
//     * @return
//     */
//    Page<Blog> ListBlog(Pageable pageable);
//
//
//    Page<Blog> ListBlog(Long tagId, Pageable pageable);
//
//    /**
//     * 模糊查询分页显示博客列表
//     * @param pageable
//     * @param query
//     * @return
//     */
//    Page<Blog> ListBlog(Pageable pageable, String query);

    /**
     * 显示推荐的博客列表
     * @return
     */
    List<BlogVo> listRecommendBlogTop(Integer size);

    /**
     * 显示归档信息
     * @return
     */
    Map<String ,List<BlogVo>> archiveBlog();


    Long countBlog();
    /**
     * 修改
     * @param blog
     * @return
     */
    Blog saveBlog(Blog blog);

    /**
     * 修改
     * @param id
     * @param blog
     * @return
     */
    Blog updateBlog(Long id, Blog blog);

    /**
     * 删除
     * @param id
     */
    void deleteBlog(Long id);


    Map<String,Object> ListBlogbyTypeId(TypeQuery typeQuery);
}
