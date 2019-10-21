<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <% 
    pageContext.setAttribute("APP_PATH",request.getContextPath());
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${APP_PATH}/static/bootstrap-3.3.7/js/tests/vendor/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#test_btn").click(function(){
		var txt=$("#txt").val();
		var reg1=/^[a-zA-Z0-9_-]{4,16}$/;//以字母，数字，下划线，减号开头，至少出现4个最多出现16个
		if(!reg1.test(txt)){
			$("#span").text("测试失败!").css("color","red");
		}else{
			$("#span").text("测试成功！").css("color","green");
		}
	});
});

</script>
</head>
<body>
<input id="txt">
<input type="button" value="测试" id="test_btn"><span id="span"></span>

</body>
</html>