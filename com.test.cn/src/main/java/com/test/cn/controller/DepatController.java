package com.test.cn.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.cn.model.Dept;
import com.test.cn.service.DeptService;
import com.test.common.ResponseMessage;

@Controller
public class DepatController {
@Autowired
private DeptService deptService;
@RequestMapping("/depts")
@ResponseBody
public ResponseMessage depts() {
	List<Dept> selectAll = this.deptService.selectDepts(null);
	return ResponseMessage.success().add("depts", selectAll);
}
}
