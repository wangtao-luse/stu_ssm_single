package com.test.cn;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.test.cn.model.Emp;
//spring4测试需要servlet-api 3.0的支持
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations={"classpath:spring/application.xml","classpath:springmvc/springMVC-servlet.xml" })
public class mvcTest {
//注入springmvc的ioc
@Autowired
WebApplicationContext context;
//虚拟mvc发送请求 返回处理结果
MockMvc mockMvc;
@Before
public void initMockMVc() {
	mockMvc=MockMvcBuilders.webAppContextSetup(context).build();
}
@Test
public void testPage() throws Exception {
	System.out.println(context);
	System.out.println(mockMvc);
	MvcResult andReturn = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "1")).andReturn();
	MockHttpServletRequest request = andReturn.getRequest();
	PageInfo page=(PageInfo)request.getAttribute("emp");
	System.out.println( "当前页码："+page.getPageNum());
	List<Emp> result = page.getList();
	System.out.println(result);
}
}
