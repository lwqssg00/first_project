package com.sz.service;

import com.sz.pojo.DataDictionary;

import java.util.List;

public interface DataDictionaryService {
    List<DataDictionary> queryAllType();

    List<DataDictionary> queryAllStatus();
}
