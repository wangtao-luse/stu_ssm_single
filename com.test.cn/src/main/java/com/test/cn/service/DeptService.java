package com.test.cn.service;

import java.util.List;

import com.test.cn.model.Dept;

public interface DeptService {
	int deleteByPrimaryKey(Short deptno);

    int insert(Dept record);

    int insertSelective(Dept record);

    Dept selectByPrimaryKey(Short deptno);
    
   List<Dept> selectDepts(Dept record);

    int updateByPrimaryKeySelective(Dept record);

    int updateByPrimaryKey(Dept record);
}
