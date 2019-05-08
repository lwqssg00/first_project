package com.sz.controller;

import com.github.pagehelper.PageInfo;
import com.sz.obj.AppUntilObj;
import com.sz.obj.CommontCantainer;
import com.sz.pojo.AppCategory;
import com.sz.pojo.AppInfo;
import com.sz.pojo.DataDictionary;
import com.sz.service.AppCategoryService;
import com.sz.service.AppInfoService;
import com.sz.service.DataDictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AppInfoController {

    @Autowired
    private AppInfoService appInfoService;

    @Autowired
    private DataDictionaryService dataDictionaryService;


    @Autowired
    private AppCategoryService appCategoryService;

    @RequestMapping("/index/devId/{id}")
    public String queryByDevUseId(@PathVariable("id")Long id, Model model, HttpSession session){
        AppUntilObj appUntilObj = new AppUntilObj();

        session.setAttribute("id",id);

        appUntilObj.setId(id);
        PageInfo<AppInfo> pageInfo = new PageInfo<>();
        pageInfo.setPageNum(CommontCantainer.PAGE_NUMBER);
        pageInfo.setPageSize(5);
        //根据条件查询
        pageInfo = appInfoService.queryByALL(appUntilObj,pageInfo);
        //查询所有的平台
        List<DataDictionary> dictionariesType= dataDictionaryService.queryAllType();
        //查询所有状态

        List<DataDictionary> dictionariesStatus= dataDictionaryService.queryAllStatus();
        //查询所有的分类
        List<AppCategory> appCategoriesOne = appCategoryService.queryAllLevelOne();
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("dictionariesType",dictionariesType);
        model.addAttribute("dictionariesStatus",dictionariesStatus);
        model.addAttribute("appCategoriesOne",appCategoriesOne);
        return "app/index";
    }

    /**
     * 结合所有条件去查询
     * @return
     */
    @PostMapping("/index/devId/queryAll")
    public String queryByAll(AppUntilObj untilObj, Model model, HttpSession session, Integer pageNumber, HttpServletRequest httpServletRequest){
        Object obj = session.getAttribute("id");
        if(obj!=null){
            Long i= (Long) obj;
            untilObj.setId(i);
            PageInfo<AppInfo> pageInfo = new PageInfo<>();
            pageInfo.setPageNum(pageNumber);
            pageInfo.setPageSize(CommontCantainer.PAGE_SIZE);
            //根据条件查询
            pageInfo = appInfoService.queryByALL(untilObj,pageInfo);
            //查询所有的平台
            List<DataDictionary> dictionariesType= dataDictionaryService.queryAllType();

            //查询所有状态

            List<DataDictionary> dictionariesStatus= dataDictionaryService.queryAllStatus();

            //查询所有的分类
            List<AppCategory> appCategoriesOne = appCategoryService.queryAllLevelOne();
            model.addAttribute("pageInfo",pageInfo);
            model.addAttribute("dictionariesType",dictionariesType);
            model.addAttribute("dictionariesStatus",dictionariesStatus);
            model.addAttribute("appCategoriesOne",appCategoriesOne);
            model.addAttribute("untilObj",untilObj);
            return "app/index";
        }else{
            return "redirect:/";
        }

    }

    /**
     * 跳转页面
     * @return
     */

    @GetMapping("/appInfo/ToAdd")
    public String toAdd(Model model){
        //查询所有的平台
        List<DataDictionary> dictionariesType= dataDictionaryService.queryAllType();
        //查询所有状态

        List<DataDictionary> dictionariesStatus= dataDictionaryService.queryAllStatus();
        //查询所有的分类
        List<AppCategory> appCategoriesOne = appCategoryService.queryAllLevelOne();

        model.addAttribute("dictionariesType",dictionariesType);
        model.addAttribute("dictionariesStatus",dictionariesStatus);
        model.addAttribute("appCategoriesOne",appCategoriesOne);

        return "app/add";
    }


    @PostMapping("/appInfo/ToAdd")
    public String add(AppInfo appInfo,HttpSession session){

        Object obj =session.getAttribute("id");

        long userId = Long.parseLong(obj.toString());

        appInfoService.add(appInfo,userId);
        return "forward:/index/devId/"+userId;
    }


    @GetMapping("/appInfo/del/{id}")
    public String del(@PathVariable("id")Long id,HttpSession session){

        Object obj =session.getAttribute("id");

        long userId = Long.parseLong(obj.toString());
        boolean r = appInfoService.del(id);

        return "redirect:/index/devId/"+userId;
    }

    @GetMapping("/appInfo/queryDetail/{id}")
    public  String  queryDetail(@PathVariable("id")long id, Model model){
        AppInfo appInfo= appInfoService.queryDetail(id);
        model.addAttribute("app",appInfo);
        return "app/appDetail";
    }


    @GetMapping("/appInfo/update/{id}")
    public String todeit(@PathVariable("id")long id,Model model){
        AppInfo app= appInfoService.queryDetail(id);
        List<DataDictionary> dictionariesType= dataDictionaryService.queryAllType();
        //查询所有状态
        List<DataDictionary> dictionariesStatus= dataDictionaryService.queryAllStatus();
        //查询所有的分类
        List<AppCategory> appCategoriesOne = appCategoryService.queryAllLevelOne();
        model.addAttribute("app",app);
        model.addAttribute("dictionariesType",dictionariesType);
        model.addAttribute("dictionariesStatus",dictionariesStatus);
        model.addAttribute("appCategoriesOne",appCategoriesOne);
        return "app/edit";

    }

    @PostMapping("/appInfo/edit")
    public String deit(AppInfo appInfo, HttpSession session, Model model){

       Object id =  session.getAttribute("id");
       long modifyId = (Long) id;
        boolean l = appInfoService.update(appInfo,modifyId);
        if(l){
            model.addAttribute("updateMsg","修改成功");
            return "redirect:/index/devId/"+modifyId;
        }else{
            model.addAttribute("updateMsg","修改出现错误");
            return "app/index";
        }
    }


}
