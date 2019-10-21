<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- web路径
1.不以/开始的相对路径，找资源以当前资源的路径为基准，容易出问题;
2.以/开始的相对路径，找资源以服务器的路径为基准的,需要加上项目名;
 -->
 <% 
    pageContext.setAttribute("APP_PATH",request.getContextPath());
 %>
<link href="${APP_PATH}/static/bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${APP_PATH}/static/bootstrap-3.3.7/js/tests/vendor/jquery.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
<jsp:forward page="/emp"></jsp:forward>
</head>
<body>
<button type="button" class="btn btn-success">（成功）Success</button>
<h1>index.jsp</h1>

</body>
</html>