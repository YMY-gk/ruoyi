package com.ruoyi.system.mapper;

import com.ruoyi.system.VO.TypeVo;
import com.ruoyi.system.domain.Type;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TypeMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Type record);

    int insertSelective(Type record);

    Type selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Type record);

    int updateByPrimaryKey(Type record);

    List<TypeVo> listTypeTop(@Param("size") Integer size);
}