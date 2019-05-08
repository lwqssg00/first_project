package com.sz.controller;

import com.sz.pojo.AppCategory;
import com.sz.service.AppCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class AppCategoryController {

    @Autowired
    private AppCategoryService appCategoryService;

    //根据levelone id 查 levelTwo
    @ResponseBody
    @PostMapping("/queryLevelTwoByLevelOne/{levelOneId}")
    public  List<AppCategory> queryLevelTwoByLevelOne(@PathVariable("levelOneId")Long id){
       List<AppCategory> appCategoriesTwo =  appCategoryService.queryTwoByLevelOne(id);
        return appCategoriesTwo;
    }
    @ResponseBody
    @PostMapping("/queryLevelThreeByLevelTwo/{levelTwoId}")
    public  List<AppCategory> queryLevelThreeByLevelTwo(@PathVariable("levelTwoId")Long id){
        List<AppCategory> appCategoriesTwo =  appCategoryService.queryTwoByLevelOne(id);
        return appCategoriesTwo;
    }

}
