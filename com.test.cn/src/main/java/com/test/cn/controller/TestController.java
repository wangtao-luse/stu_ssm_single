package com.test.cn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
@RequestMapping("/test")
public String  toTestReg() {
	return "test/TestReg";
}
}
