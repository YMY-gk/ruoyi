package com.ruoyi.system.mapper;

import com.ruoyi.system.VO.TagVo;
import com.ruoyi.system.domain.Tag;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TagMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Tag record);

    int insertSelective(Tag record);

    Tag selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Tag record);

    int updateByPrimaryKey(Tag record);

    List<TagVo> ListTagTop(@Param("size")Integer size);

    List<Tag> getTagList(@Param("blog_id")Long blog_id);
}