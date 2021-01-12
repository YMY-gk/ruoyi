package com.ruoyi.blog.service.impl;


import com.ruoyi.blog.service.CommentService;
import com.ruoyi.system.domain.Comment;
import com.ruoyi.system.mapper.CommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Auther: 南迪叶先生:https://www.cnblogs.com/ye888/
 * @Date: 2019/10/10
 * @Description: com.yrp.service.impl
 * @version: 1.0
 */
@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentRepository;

    @Override
    public List<Comment> listCommentByBlogId(Long blogId) {
        return null;
    }

    @Transactional
    @Override
    public Comment saveComment(Comment comment) {
        return null;
    }

}
