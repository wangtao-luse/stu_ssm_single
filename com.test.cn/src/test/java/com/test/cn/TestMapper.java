package com.test.cn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.test.cn.dao.DeptMapper;
import com.test.cn.dao.EmpMapper;
import com.test.cn.model.Emp;
/*
 * 
 * 测试dao层的工作
 * 推荐spring的项目可以使用spring的单元测试，可以自动注入我们需要的组件
 * 1.导入SpringTest模块
 * 2.使用@ContextConfiguration指定Spring配置文件的位置
 * 3.直接autoWired要使用的组件
 * 4.spring4测试需要servlet-api 3.0的支持
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring/application.xml" })
public class TestMapper {
	@Autowired
	DeptMapper deptMapper;
	@Autowired
	EmpMapper  empMapper;
	@Autowired
	SqlSessionTemplate sqlSession;


	
	
@Test
public void testCRUD() {
	//1.使用java代码方//1.创建SpringIOC容器
	/*ApplicationContext ioc=new ClassPathXmlApplicationContext("spring/application.xml");
	 //2.从容器中获取mapper
	ComboPooledDataSource dataSource=(ComboPooledDataSource)ioc.getBean("dpoolDataSource");
	System.out.println(dataSource.getJdbcUrl());
	 DeptMapper bean = ioc.getBean(DeptMapper.class);
	 System.out.println(bean);*/
	System.out.println(deptMapper);
	System.out.println(empMapper);
	//1.批量操作创建sqlSession
  /*  EmpMapper mapper = sqlSession.getMapper(EmpMapper.class);
    for (int i = 0; i < 1000; i++) {
    	Emp record=new Emp();
    	 mapper.insert(record);
		
	}
    System.out.println("批量完成");*/
	 //根据id查询
	 Emp record=new Emp();
	 Emp selectByPrimaryKey = empMapper.selectByPrimaryKey(Short.valueOf("7369"));
	 System.out.println(selectByPrimaryKey);
	 List<Emp> selectByPrimaryListWidthDept = empMapper.selectByPrimaryListWidthDept(record);
	 System.out.println(selectByPrimaryListWidthDept);
	 
	
             
}


}
