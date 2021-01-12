package com.ruoyi.blog.service;

import com.ruoyi.system.VO.TagVo;
import com.ruoyi.system.domain.Tag;

import java.util.List;

/**
 * 分类管理接口
 */
public interface TagService {

    /**
     * 新增
     * @return
     */
    Tag saveTag(Tag tag);


    /**
     * 单个查询
     * @param id
     * @return
     */
    Tag getTag(Long id);

    /**
     * 分页查询
     * @return
     */
//    Page<Tag> ListTag(Pageable pageable);


    List<TagVo> ListTagTop(Integer size);

    /**
     * 查询所有标签
     * @return
     */
    List<Tag> ListTag();

    List<Tag> ListTag(String ids);

    /**
     * 修改
     * @param id
     * @param tag
     * @return
     */
    Tag updateTag(Long id, Tag tag);

    /**
     * 删除
     * @param id
     */
    void deleteTag(Long id);

    /**
     * 通过分类名称
     * @return
     */
    Tag getTagByName(String name);

}
