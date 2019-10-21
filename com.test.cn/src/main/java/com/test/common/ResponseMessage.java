package com.test.common;

import java.util.HashMap;
import java.util.Map;

public class ResponseMessage {
//00成功 10失败
private String code;
private String meesage;
private Map<String ,Object> result=new HashMap<String, Object>();
public ResponseMessage() {
}
public ResponseMessage(String meesage) {
	super();
	this.meesage = meesage;
}

public ResponseMessage(String code, String meesage) {
	super();
	this.code = code;
	this.meesage = meesage;
}
public static ResponseMessage success() {
	return new ResponseMessage(Constant.SUCCESS, Constant.SUCCESSMSG);
}
public static ResponseMessage fail() {
	return new ResponseMessage(Constant.FAIL, Constant.FAILSMSG);
}
public ResponseMessage add(String key,Object object) {
	 this.getResult().put(key, object);
	return this;
}
public String getCode() {
	return code;
}
public void setCode(String code) {
	this.code = code;
}
public String getMeesage() {
	return meesage;
}
public void setMeesage(String meesage) {
	this.meesage = meesage;
}
public Map<String, Object> getResult() {
	return result;
}
public void setResult(Map<String, Object> result) {
	this.result = result;
}

}
