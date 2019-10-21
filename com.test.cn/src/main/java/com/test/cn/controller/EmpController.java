package com.test.cn.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.junit.runners.Parameterized.Parameters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.JsonObject;
import com.test.cn.model.Emp;
import com.test.cn.service.EmpService;
import com.test.common.ResponseMessage;



@Controller
public class EmpController {
@Autowired
EmpService empService;
/*@RequestMapping(value="/temp")
public String getEmps(@RequestParam(value="pn",defaultValue="1") Integer pn,@RequestParam(value="ps",defaultValue="10") Integer ps,Emp emp, Model model) {
	PageHelper.startPage(pn, ps);
	List<Emp> selectByPrimaryListWidthDept = empService.selectByPrimaryListWidthDept(emp);
	PageInfo page = new PageInfo(selectByPrimaryListWidthDept,5);
	model.addAttribute("pageInfo", page);
	return "list";
	
}*/
//去index页面
@RequestMapping(value="/emp")
public String getEmp() {
	return "index";
	
}
//查询员工页面
@RequestMapping(value="/emps")
@ResponseBody   //需要导入jackson.jar
public ResponseMessage getEmps(@RequestParam(value="pn",defaultValue="1") Integer pn,@RequestParam(value="ps",defaultValue="5") Integer ps,Emp emp, Model model) {
	PageHelper.startPage(pn, ps);
	List<Emp> selectByPrimaryListWidthDept = empService.selectByPrimaryListWidthDept(emp);
	PageInfo pageInfo = new PageInfo(selectByPrimaryListWidthDept,5);
	return ResponseMessage.success().add("PageInfo", pageInfo);
	
}
/*@RequestMapping(value="/emps")
@ResponseBody   //需要导入jackson.jar
public ResponseMessage getEmps(@RequestBody JSONObject jsonObject, Emp emp, Model model) {
	System.out.println(jsonObject);
	jsonObject.get("pn");
	PageHelper.startPage(pn, ps);
	List<Emp> selectByPrimaryListWidthDept = empService.selectByPrimaryListWidthDept(emp);
	PageInfo pageInfo = new PageInfo(selectByPrimaryListWidthDept,5);
	return ResponseMessage.success().add("PageInfo", pageInfo);
	
}*/
//保存员工信息
/**
 * 1.JSR303校验
 * 导入Hibernate-validator.jar
 * @param emp
 * @return
 */
@RequestMapping(value="saveEmp",method=RequestMethod.POST)
@ResponseBody
public ResponseMessage saveEmp(@Valid Emp emp,BindingResult result) {
	if(result.hasErrors()) {
		Map<String,Object> map=new HashMap<String,Object>();
		List<FieldError> fieldErrors = result.getFieldErrors();
		for (FieldError fieldError : fieldErrors) {
			//错误字段名
			String errorzd=fieldError.getField();
			String errorMsg=fieldError.getDefaultMessage();
			map.put(errorzd, errorMsg);
			
		}
		return ResponseMessage.fail().add("errorFile", map);
	}else {
		int insert = this.empService.insert(emp);
		if(insert<=0) {
			return ResponseMessage.fail();
		}
	}

	return ResponseMessage.success();
}
//判断员工姓名是否唯一
@RequestMapping(value="checkEname",method=RequestMethod.POST)
@ResponseBody
public ResponseMessage checkEname(@RequestParam("ename") String ename) {
	String reg="^[\\w]{4,10}$";
	if(!ename.matches(reg)){
		return ResponseMessage.fail().add("val_msg", "姓名必须由下划线,数字,字母4到10位字符组成");		
	}
	boolean checkEname = this.empService.checkEname(ename);
	if(checkEname) {
		return ResponseMessage.success();
	}else {
		return ResponseMessage.fail().add("val_msg", "用户名不可以用！");	
	}
	
 }

@RequestMapping(value="getEmp/{empno}",method=RequestMethod.GET)
@ResponseBody
public ResponseMessage selectById(Emp emp) {
	Emp selectByPrimaryKey = this.empService.selectByPrimaryKey(emp.getEmpno());
	return ResponseMessage.success().add("emp", selectByPrimaryKey);
	
}
@RequestMapping(value="updateEmp/{empno}",method=RequestMethod.PUT)
@ResponseBody
public ResponseMessage updateById(Emp emp,BindingResult result) {
	int count = this.empService.updateByPrimaryKeySelective(emp);
	if(count>0) {
		return ResponseMessage.success();
	}else {
		return ResponseMessage.fail();
	}
}

}
