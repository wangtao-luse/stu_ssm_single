package com.test.cn.dao;

import java.util.List;

import com.test.cn.model.Emp;

public interface EmpMapper {
    int deleteByPrimaryKey(Short empno);

    int insert(Emp record);

    int insertSelective(Emp record);

    Emp selectByPrimaryKey(Short empno);
    
    Emp selectByPrimaryKeyWidthDept(Short empno);
    
    List<Emp> selectByPrimaryListWidthDept(Emp emp); 
    
    int updateByPrimaryKeySelective(Emp record);

    int updateByPrimaryKey(Emp record);
}