package com.test.cn.service;

import java.util.List;

import com.test.cn.model.Emp;

public interface EmpService {
	int deleteByPrimaryKey(Short empno);

    int insert(Emp record);

    int insertSelective(Emp record);

    Emp selectByPrimaryKey(Short empno);
    
    Emp selectByPrimaryKeyWidthDept(Short empno);
    
    boolean checkEname(String ename);
    
    List<Emp> selectByPrimaryListWidthDept(Emp emp); 
    
    int updateByPrimaryKeySelective(Emp record);

    int updateByPrimaryKey(Emp record);
}
