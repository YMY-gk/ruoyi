package com.ruoyi.system.mapper;

import com.ruoyi.system.VO.BlogVo;
import com.ruoyi.system.domain.Blog;
import com.ruoyi.system.model.TypeQuery;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BlogMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Blog record);

    int insertSelective(Blog record);

    BlogVo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Blog record);

    int updateByPrimaryKeyWithBLOBs(Blog record);

    int updateByPrimaryKey(Blog record);

    void updateViews(Long id);

    List<BlogVo> findTop(@Param("size") Integer size);

    Integer fundBlogCount();

    List<BlogVo> fundBlogLimit(@Param("cpage") int cpage,@Param("size") int size);
    List<Blog> getBlogList(@Param("tags_id") Long tags_id);
    List<Blog> getBlogListByTypeId(@Param("type_id") Long type_id);

    List<BlogVo> fundBlogLimitByTypeId(TypeQuery typeQuery);

    Integer fundBlogCountByType(TypeQuery typeQuery);

    List<String> findGroupYear();

    List<BlogVo> findByYear(String year);
}