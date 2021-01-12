package com.ruoyi.blog.util;

import com.ruoyi.system.domain.Comment;
import org.springframework.beans.BeanUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * 评论格式化工具
 */
public class CommentUtil {
    /**
     * 循环每个顶级的评论节点
     * @param comments
     * @return
     */
    public static List<Comment> eachComment(List<Comment> comments) {
        List<Comment> commentsView = new ArrayList<>();
        for (Comment comment : comments) {
            Comment c = new Comment();
            BeanUtils.copyProperties(comment,c);
            commentsView.add(c);
        }
        //合并评论的各层子代到第一级子代集合中
        combineChildren(commentsView);
        return commentsView;
    }

    /**
     *
     * @param comments root根节点，blog不为空的对象集合
     * @return
     */
    public static void combineChildren(List<Comment> comments) {


    }
    //存放迭代找出的所有子代的集合
    public static List<Comment> tempReplys = new ArrayList<>();
    /**
     * 递归迭代，剥洋葱
     * @param comment 被迭代的对象
     * @return
     */
    public static void recursively(Comment comment) {

    }
}
