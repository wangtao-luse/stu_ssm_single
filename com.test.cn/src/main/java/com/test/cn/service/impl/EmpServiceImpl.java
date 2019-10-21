package com.test.cn.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.test.cn.dao.EmpMapper;
import com.test.cn.model.Emp;
import com.test.cn.service.EmpService;
@Service
public class EmpServiceImpl implements EmpService {
@Autowired
  EmpMapper empMapper;
	public int deleteByPrimaryKey(Short empno) {
		// TODO Auto-generated method stub
		
		return 0;
	}
     @Transactional
	public int insert(Emp record) {
		// TODO Auto-generated method stub
		return this.empMapper.insert(record);
	}

	public int insertSelective(Emp record) {
		// TODO Auto-generated method stub
		return this.empMapper.insertSelective(record);
	}

	public Emp selectByPrimaryKey(Short empno) {
		// TODO Auto-generated method stub
		return this.empMapper.selectByPrimaryKey(empno);
	}

	public Emp selectByPrimaryKeyWidthDept(Short empno) {
		// TODO Auto-generated method stub
		return empMapper.selectByPrimaryKeyWidthDept(empno);
	}

	public List<Emp> selectByPrimaryListWidthDept(Emp emp) {
		// TODO Auto-generated method stub
		return empMapper.selectByPrimaryListWidthDept(emp);
	}

	public int updateByPrimaryKeySelective(Emp record) {
		// TODO Auto-generated method stub
		return this.empMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Emp record) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public boolean checkEname(String ename) {
		// TODO Auto-generated method stub
		Emp emp=new Emp();
		emp.setEname(ename);
		List<Emp> selectByPrimaryListWidthDept = this.empMapper.selectByPrimaryListWidthDept(emp);
		if(selectByPrimaryListWidthDept.size()>0) {
			return false;
		}else {
			return true;
		}
		
	}

}
