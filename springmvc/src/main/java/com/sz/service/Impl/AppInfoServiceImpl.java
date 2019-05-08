package com.sz.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sz.mapper.AppInfoMapper;
import com.sz.mapper.AppVersionMapper;
import com.sz.obj.AppUntilObj;
import com.sz.pojo.AppInfo;
import com.sz.pojo.AppVersion;
import com.sz.pojo.DevUser;
import com.sz.service.AppInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service("appInfoService")
public class AppInfoServiceImpl implements AppInfoService {


    @Autowired
    private AppInfoMapper appInfoMapper;

    @Autowired
    AppVersionMapper appVersionMapper;

    @Override
    public PageInfo<AppInfo> queryByDevUseId(Long id, PageInfo pageInfo) {

        PageHelper.startPage(pageInfo.getPageNum(),pageInfo.getPageSize());

        List<AppInfo> appInfos = appInfoMapper.queryByDevUseId(id);
        PageInfo<AppInfo> pageInfo1 = new PageInfo<>(appInfos);

        return pageInfo1;
    }

    @Override
    public PageInfo<AppInfo> queryByALL(AppUntilObj untilObj, PageInfo<AppInfo> pageInfo) {

        PageHelper.startPage(pageInfo.getPageNum(),pageInfo.getPageSize());

        List<AppInfo> l = appInfoMapper.queryByALL(untilObj);
        PageInfo<AppInfo> pageInfo1 = new PageInfo<AppInfo>(l);
        return pageInfo1;
    }

    @Override
    public boolean add(AppInfo appInfo,long id) {

        appInfo.setCreationDate(new Date());

        DevUser user = new DevUser();

        user.setId(id);

        appInfo.setDevUser(user);

        appInfo.setCreatedBy(id);

        int row = appInfoMapper.add(appInfo);
        return row > 0?true:false;
    }

    @Override
    public boolean del(long id) {
        int row = appInfoMapper.deleteByPrimaryKey(id);
        return row >0?true:false;
    }

    @Override
    public AppInfo queryDetail(long id) {

       return  appInfoMapper.queryDetail(id);
    }

    @Override
    public boolean update(AppInfo appInfo,long id) {
        appInfo.setUpdateDate(new Date());
        appInfo.setModifyBy(id);

        if(appInfo.getNewAppVersion().getVersionNo()!=null){
            AppVersion a = appInfo.getNewAppVersion();
            a.setAppId(appInfo.getId());
            appVersionMapper.insert(appInfo.getNewAppVersion());
        }
        int row = appInfoMapper.updateByPrimaryKeySelective(appInfo);
        return row >0?true:false;
    }
}
