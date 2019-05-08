package com.sz.service.Impl;

import com.sz.mapper.DataDictionaryMapper;
import com.sz.pojo.DataDictionary;
import com.sz.service.DataDictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("dataDictionaryService")
public class DataDictionaryServiceImpl implements DataDictionaryService {
    @Autowired
    private DataDictionaryMapper dataDictionaryMapper;
    @Override
    public List<DataDictionary> queryAllType() {
        return  dataDictionaryMapper.queryAllType();
    }

    @Override
    public List<DataDictionary> queryAllStatus() {
        return  dataDictionaryMapper.queryAllStatus();
    }
}
