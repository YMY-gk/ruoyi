package com.ruoyi.blog.service.impl;

import com.ruoyi.blog.service.TypeService;
import com.ruoyi.system.VO.TypeVo;
import com.ruoyi.system.domain.Type;
import com.ruoyi.system.mapper.TypeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


/**
 * @Auther: 南迪叶先生:https://www.cnblogs.com/ye888/
 * @Date: 2019/9/29
 * @Description: com.yrp.service.impl
 * @version: 1.0
 */
@Service
public class TypeServiceImpl implements TypeService {

    @Autowired
    private TypeMapper typeRepository;

    @Transactional
    @Override
    public Type saveType(Type type) {

        return null;
    }

    @Transactional
    @Override
    public Type getType(Long id) {
        return null;
    }

//    @Transactional
//    @Override
//    public Page<Type> ListType(Pageable pageable) {
//        return null;
//    }

    @Override
    public List<Type> listType() {
        return null;
    }

    @Override
    public List<TypeVo> listTypeTop(Integer size) {
        List<TypeVo>  list =  typeRepository.listTypeTop(size);
        return list;
    }

    @Transactional
    @Override
    public Type updateType(Long id, Type type) {

        return null;
    }

    @Transactional
    @Override
    public void deleteType(Long id) {

    }

    @Override
    public Type getTypeByName(String name) {
        return null;
    }
}
