package com.sz.service.Impl;

import com.sz.mapper.AppCategoryMapper;
import com.sz.pojo.AppCategory;
import com.sz.service.AppCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("appCategoryService")
public class AppCategoryServiceImpl implements AppCategoryService {

    @Autowired
    private AppCategoryMapper appCategoryMapper;

    @Override
    public List<AppCategory> queryAllLevelOne() {
        return appCategoryMapper.queryAllLevelOne();
    }

    @Override
    public List<AppCategory> queryTwoByLevelOne(Long id) {
        return appCategoryMapper.queryParent(id);
    }
}
