package com.ruoyi.blog.service.impl;
import com.ruoyi.blog.service.TagService;
import com.ruoyi.system.VO.TagVo;
import com.ruoyi.system.domain.Tag;
import com.ruoyi.system.mapper.TagMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 标签实现
 */
@Service
public class TagServiceImpl implements TagService {

    @Autowired
    private TagMapper tagRepository;


    @Transactional
    @Override
    public Tag saveTag(Tag tag) {
        return null;
    }

    @Override
    public Tag getTag(Long id) {
        return null;
    }

//    @Override
//    public Page<Tag> ListTag(Pageable pageable) {
//        return null;
//    }

    @Override
    public List<TagVo> ListTagTop(Integer size) {
        List<TagVo> list = tagRepository.ListTagTop(size);
        return list;
    }

    @Override
    public List<Tag> ListTag() {
        return null;
    }

    @Override
    public List<Tag> ListTag(String ids) {
        return null;
    }

    @Override
    public Tag updateTag(Long id, Tag tag) {

        return null;
    }

    @Override
    public void deleteTag(Long id) {

    }

    @Override
    public Tag getTagByName(String name) {
        return null;
    }

    /*将字符串转化为集合*/
    private List<Long> convertToList(String ids) {
        List<Long> list = new ArrayList<>();
        if (!"".equals(ids) && ids != null) {
            String[] idarray = ids.split(",");
            for (int i=0; i < idarray.length;i++) {
                list.add(new Long(idarray[i]));
            }
        }
        return list;
    }
}
