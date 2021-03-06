package com.sz.mapper;

import com.sz.pojo.DataDictionary;

import java.util.List;

public interface DataDictionaryMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table data_dictionary
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table data_dictionary
     *
     * @mbg.generated
     */
    int insert(DataDictionary record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table data_dictionary
     *
     * @mbg.generated
     */
    int insertSelective(DataDictionary record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table data_dictionary
     *
     * @mbg.generated
     */
    DataDictionary selectByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table data_dictionary
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(DataDictionary record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table data_dictionary
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(DataDictionary record);

    List<DataDictionary> queryAllType();

    List<DataDictionary> queryAllStatus();
}