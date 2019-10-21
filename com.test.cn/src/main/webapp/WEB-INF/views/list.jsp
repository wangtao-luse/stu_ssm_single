<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

</head>
<body>
<div class="container">
   <!-- 标题 -->
  <div class="row">
  	<div class="col-md-12"><h1>CURD</h1></div>
  </div>
   <!-- 按钮 -->
  <div class="row">
   <div class="col-md-4 col-md-offset-8">
   	 <button type="button" class="btn btn-success">新增</button>
  	 <button type="button" class="btn btn-danger">删除</button>
   </div>
  </div>
  <!-- 表格 -->
  <div class="row">
   <div class="col-md-12">
     <table class="table table-hover">
      <thead>
       <tr>
        <th>EMPNO</th>
        <th>ENAME</th>
        <th>JOB</th>
        <th>HIREDATE</th>
        <th>SAL</th>
        <th>DNAME</th>
        <th>LOC</th>
        <th>操作</th>
       </tr>
      </thead>
      <tbody>
      <c:forEach items="${pageInfo.list }" var="emp">
         <tr>
        <td>${emp.empno}</td>
        <td>${emp.ename }</td>
        <td>${emp.job }</td>
        <td>${emp.hiredate }</td>
        <td>${emp.sal }</td>
        <td>${emp.dept.dname }</td>
        <td>${emp.dept.loc }</td>
        <td>
         <button type="button" class="btn btn-success btn-sm">
         	<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>新增
         </button>
  	     <button type="button" class="btn btn-danger btn-sm">
  	           <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除
  	     
  	     </button>
  	    </td>
       </tr>
      </c:forEach>
      
      </tbody>
    </table>
   </div>
   
  </div>
  <!-- 分页信息 -->
  <div class="row">
     <!-- 分页文字信息 -->
    <div class="col-md-6">
        当前${pageInfo.pageNum}页,总${pageInfo.pages}页,总${pageInfo.total}条记录。
    </div>
    <!-- 分页条 -->
    <div class="col-md-6">
	 <nav aria-label="Page navigation">
	  <ul class="pagination">
	  <li><a href="${APP_PATH}/emps?pn=1">首页</a></li>
	  <c:if test="${pageInfo.hasPreviousPage }">
	   <li>
	      <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	    </li>
	  </c:if>
	  
	   
	    <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
	      <c:if test="${page_Num== pageInfo.pageNum}">
	         <li class="active"><a href="${APP_PATH}/emps?pn=${page_Num}">${page_Num}</a></li>
	      </c:if>
	      <c:if test="${page_Num!= pageInfo.pageNum}">
	         <li class="disabled"><a href="${APP_PATH}/emps?pn=${page_Num}">${page_Num}</a></li>
	      </c:if>
	    </c:forEach>
	    <c:if test="${pageInfo.hasNextPage }">
	    <li>
	      <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	    </c:if>
	    
	    <li><a href="${APP_PATH}/emps?pn=${pageInfo.pages}">末页</a></li>
	  </ul>
	 </nav>
    </div>
  </div>

</div>

</body>
</html>