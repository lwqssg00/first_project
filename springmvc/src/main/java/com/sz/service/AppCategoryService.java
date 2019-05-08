package com.sz.service;

import com.sz.pojo.AppCategory;

import java.util.List;

public interface AppCategoryService {
    List<AppCategory> queryAllLevelOne();

    List<AppCategory> queryTwoByLevelOne(Long id);
}
