package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.BlogUser;

public interface BlogUserMapper {
    int deleteByPrimaryKey(Long id);

    int insert(BlogUser record);

    int insertSelective(BlogUser record);

    BlogUser selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(BlogUser record);

    int updateByPrimaryKey(BlogUser record);
}