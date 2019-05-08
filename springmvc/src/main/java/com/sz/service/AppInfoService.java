package com.sz.service;

import com.github.pagehelper.PageInfo;
import com.sz.obj.AppUntilObj;
import com.sz.pojo.AppInfo;

public interface AppInfoService {


    PageInfo<AppInfo> queryByDevUseId(Long id, PageInfo pageInfo);

    PageInfo<AppInfo> queryByALL(AppUntilObj untilObj, PageInfo<AppInfo> pageInfo);

    boolean add(AppInfo appInfo,long id);

    boolean del(long id);

    AppInfo queryDetail(long id);

    boolean update(AppInfo appInfo,long id);
}
