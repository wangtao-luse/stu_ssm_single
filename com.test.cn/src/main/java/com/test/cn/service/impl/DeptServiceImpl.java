package com.test.cn.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.cn.dao.DeptMapper;
import com.test.cn.model.Dept;
import com.test.cn.service.DeptService;
@Service
public class DeptServiceImpl  implements DeptService{
	@Autowired
private DeptMapper deptMapper;
	@Override
	public int deleteByPrimaryKey(Short deptno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Dept record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(Dept record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Dept selectByPrimaryKey(Short deptno) {
		// TODO Auto-generated method stub
		return this.deptMapper.selectByPrimaryKey(deptno);
	}
	@Override
	public List<Dept> selectDepts(Dept record) {
		// TODO Auto-generated method stub
		return this.deptMapper.selectDepts(record);
	}

	@Override
	public int updateByPrimaryKeySelective(Dept record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(Dept record) {
		// TODO Auto-generated method stub
		return 0;
	}

}
