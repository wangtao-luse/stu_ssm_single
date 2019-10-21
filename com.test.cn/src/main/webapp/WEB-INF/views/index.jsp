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
<script type="text/javascript" src="${APP_PATH}/static/common/common.js"></script>
<script type="text/javascript">
$(function(){
	//加载时调用第一页数据
	to_page("1");
	//新增
	$("#emp_add_btn").click(function(){
		rest_add_form("#emp_add_Modal form");
		//获取部门信息
		getDepts("#emp_add_Modal select");
		//打开模式框
		var options={backdrop:"static"};
		$("#emp_add_Modal").modal(options);
	});
	//新增保存
	 $("#emp_modal_add_btn").click(function(){
		//alert($("#emp_add_Modal form").serialize());
		 var status=$(this).attr("ajax_va");
			if(status=="error"){
				show_validate_msg("#inputEname3","error","该员工已经存在！");
				return false;
			}
		if(!validate_add_form()){
			return false;
		}
		
		$.ajax({
			url:"${APP_PATH}/saveEmp",
			data:$("#emp_add_Modal form").serialize(),
			type:"post",
			success:function(result){
				if(result.code=="00"){
					$('#emp_add_Modal').modal('hide');
					//location.reload();
					to_page("1");
					
				}else if(result.code=="10"){
					var ename=result.result.errorFile.ename;
					if(undefined!=ename){
						show_validate_msg("#inputEname3","error",ename);
					}
				}
				//alert(result.meesage);
			   // location.reload();
			    
			}
		});
	}); 
	//新增关闭按钮
	$("#emp_modal_cancel_btn").click(function(){
		$('#emp_add_Modal').modal('hide');
	});
	//判断用户名是否重复
	$("#inputEname3").change(function(){
		var ename=$(this).val();
		$.ajax({
			url:"${APP_PATH}/checkEname",
			data:{"ename":ename},
			type:"post",
			success:function(result){
				var code=result.code;
				if(code=="00"){
					show_validate_msg("#inputEname3","success",result.result.val_msg);
					$("#emp_modal_add_btn").attr("ajax_va","success");
					
				}else if(code=="10"){
					show_validate_msg("#inputEname3","error",result.result.val_msg);
					$("#emp_modal_add_btn").attr("ajax_va","error");
				}
			}
		});
	});
	//修改页面
	$(document).on("click",".edit_btn",function(){
		//1.打开模式框
		var options={backdrop:"static"};
		open_Modal("#emp_update_Modal",options);
		var edit_id=$(this).attr("edit_id");
		$("#emp_modal_update_btn").attr("edit_id",edit_id);
		//2.显示员工
		getEmp(edit_id);
		//3.显示部门信息
		getDepts("#emp_update_Modal select");
		
	});
	//修改
	$("#emp_modal_update_btn").click(function(){
		//1.验证
		if(!validate_update_form()){
			return false;
		}
		//2.修改
		$.ajax({
			url:"${APP_PATH}/updateEmp/"+$(this).attr("edit_id"),
			data:$("#emp_update_Modal").serialize()+"&_method=PUT",
			type:"post",
			success:function(result){
			alert("操作成功");
			}
		});
	});
	
});

// 重置表单元素
function rest_add_form(ele){
	$(ele)[0].reset();
	$(ele).find("*").removeClass("has-error has-success");
	$(ele).find(".help-block").text("");
	
}
//显示提示信息
function show_validate_msg(ele,status,message){
	$(ele).parent().removeClass("has-error has-success");
	$(ele).next("span").text("");
	if("error"==status){
		$(ele).parent().addClass("has-error");
		$(ele).next("span").text(message);
	}else if("success"==status){
		$(ele).parent().addClass("has-success");
		$(ele).next("span").text(message);
	}
}
//验证表达新增表单信息
function validate_add_form(){
	var ename=$("#inputEname3").val();
	var job=$("#inputJob3").val();
	var sal=$("#inputSal3").val();
	var regename=/^[\w]{4,10}$/;
	var regjob=/^[\w]{4,10}$/;
	var regsal=/^\d{4,16}$/;
	 if(!regename.test(ename)){
		 show_validate_msg("#inputEname3","error","姓名必须由下划线,数字,字母组成！");
		//alert("请输入正确姓名！");
		return false;
	}else{
		 show_validate_msg("#inputEname3","success","");
	}
 
	if(!regjob.test(job)){
		//alert("请输入正确工作！");
	 show_validate_msg("#inputJob3","error","职位必须4到10位由下划线,数字,字母组成！");
		return false;
	}else{
		show_validate_msg("#inputJob3","success","");
	}
	if(!regsal.test(sal)){
		//alert("请输入合理的工资！");
		show_validate_msg("#inputSal3","error","请输入合理的工资！");
		return false
	}else{
		show_validate_msg("#inputSal3","success","");
	}
	return true;
}
//修改表达验证
function validate_update_form(){
	var job=$("#emp_update_inputJob3").val();
	var sal=$("#emp_update_inputSal3").val();
	
	var regjob=/^[\w]{4,10}$/;
	var regsal=/^\d{4,16}$/;
 
	if(!regjob.test(job)){
		//alert("请输入正确工作！");
	 show_validate_msg("#emp_update_inputJob3","error","职位必须4到10位由下划线,数字,字母组成！");
		return false;
	}else{
		show_validate_msg("#emp_update_inputJob3","success","");
	}
	if(!regsal.test(sal)){
		//alert("请输入合理的工资！");
		show_validate_msg("#emp_update_inputSal3","error","请输入合理的工资！");
		return false
	}else{
		show_validate_msg("#emp_update_inputSal3","success","");
	}
	return true;
}

//列表查询
function to_page(pn){
	/*  var url="${APP_PATH}/emps";
	var date={"pn":pn};
	 postAjax(url, JSON.stringify(date),function (data) {
		  alert(data.description);
	  }, {cache: false, async: false});  */
	 $.ajax({
		url:"${APP_PATH}/emps",
		data:{"pn":pn},
		type:"post",
		success:function(result){
			console.log(result);
			builder_emp(result);
			builder_pageInfo(result);
			builder_nav(result); 
		}
	});  
}
//构建表格
function builder_emp(result){
	$("#table_emp tbody").empty();
	$.each(result.result.PageInfo.list,function(index,item){
		var empno=$("<td></td>").append(item.empno);
		var ename=$("<td></td>").append(item.ename);
		var job=$("<td></td>").append(item.job);
		var hiredate=$("<td></td>").append(item.hiredate);
		var sal=$("<td></td>").append(item.sal);
		var dname=$("<td></td>").append(item.dept.dname);
		var loc=$("<td></td>").append(item.dept.loc);
		var editbtn=$("<button></button>").addClass("btn btn-success btn-sm edit_btn").append("<span></span>").addClass("glyphicon glyphicon-pencil").append("编辑").attr("edit_id",item.empno);
		var deletebtn=$("<button></button>").addClass("btn btn-danger btn-sm del_btn").append("<span></span>").addClass("glyphicon glyphicon-trash").append("删除").attr("del_id",item.empno);
		var btn=$("<td></td>").append(editbtn).append(" ").append(deletebtn);
		$("<tr></tr>")
		       .append(empno)
		       .append(ename)
		       .append(job)
		       .append(hiredate)
		       .append(sal)
		       .append(dname)
		       .append(loc)
		       .append(btn)
		       .appendTo("#table_emp tbody");
	});
}
//构建分页信息
function builder_pageInfo(result){
	 $("#page_info").empty();
	var res=result.result.PageInfo;
	console.log(res);
	 $("#page_info").append("当前"+res.pageNum+"页,总"+res.pages+"页,总"+res.total+"条记录。");
}
//构建分页条
function builder_nav(result){
	$("#page_nav_area").empty();
	var ul=$("<ul></ul>").addClass("pagination");
	var date=result.result.PageInfo;
	var firstPageLi=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
	var previousLi=$("<li></li>").append($("<a></a>").attr("href","#").append($("<span></span>").append("&laquo;")));
	if(date.hasPreviousPage==false){
		firstPageLi.addClass("disabled");
		previousLi.addClass("disabled");
	}else{
		 firstPageLi.click(function(){
			  to_page("1");
		  });
		previousLi.click(function(){
			 to_page(date.pageNum-1);
		});
	}
	var nextPageLi=$("<li></li>").append($("<a></a>").attr("href","#").append($("<span></span>").append("&raquo;")));
	var lasttPageLi=$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
	if(date.hasNextPage==false){
		nextPageLi.addClass("disabled");
		lasttPageLi.addClass("disabled");
	}else{
		nextPageLi.click(function(){
			 to_page(date.pageNum+1);
		});
		lasttPageLi.click(function(){
			 to_page(date.pages);
		});
	}
	var datas=result.result.PageInfo.navigatepageNums;
	ul.append(firstPageLi)
	  .append(previousLi)
	  
	 
	
	$.each(datas,function(index,item){
		var navNums= $("<li></li>").append($("<a></a>").attr("href","#").append(item));
		 if(item==date.pageNum){
			 navNums.addClass("active") 
		 }
		 navNums.click(function(){
			 to_page(item);
		 });
		ul.append(navNums);
	});
	ul.append(nextPageLi)
	  .append(lasttPageLi);
	var nav=$("<nav></nav>").append(ul);
	nav.appendTo("#page_nav_area");
}
//查询部门信息
function getDepts(ele){
	$(ele).empty();
	$.ajax({
		url:"${APP_PATH}/depts",
		data:{},
		type:"post",
		success:function(result){
			var date=result.result.depts;
			$.each(result.result.depts,function(){
			var optionEle=$("<option></option>").text(this.dname).attr("value",this.deptno);
			optionEle.appendTo(ele);
			})
			
		}
	
		
	});
}
//打开模式框
function open_Modal(ele,options){
	$(ele).modal(options);
}
//获取修改员工信息
function getEmp(edit_id){
    var update_date=$("#emp_update_Modal form").serialize();
	$.ajax({
		url:"${APP_PATH}/getEmp/"+edit_id,
		data:update_date,
		type:"get",
		success:function(result){
			var emp=result.result.emp;
			$("#emp_update_inputEname3").text(emp.ename);
			$("#emp_update_inputJob3").val(emp.job);
			$("#emp_update_inputSal3").val(emp.sal);
			$("#emp_modal_update_btn").attr("edit_id",emp.empno);
			}
		});
		
}
</script>
</head>
<body>
<!-- 新增 模态框-->
<div class="modal fade" id="emp_add_Modal"  role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">新增</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
		  <div class="form-group">
		    <label for="" class="col-sm-2 control-label">ENAME</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="ename" id="inputEname3" placeholder="ENAME">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="" class="col-sm-2 control-label">JOB</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="job" id="inputJob3" placeholder="JOB">
		       <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="" class="col-sm-2 control-label">SAL</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="inputSal3" name="sal" placeholder="SAL">
		       <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="" class="col-sm-2 control-label">部门</label>
		    <div class="col-sm-10">
		      <select class="form-control" name="deptno">
				</select>
		    </div>
		  </div>

		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" id="emp_modal_add_btn" >保存</button>
        <button type="button" class="btn btn-primary" id="emp_modal_cancel_btn">关闭</button>
      </div>
    </div>
  </div>
</div>
<!--  修改 -->
<div class="modal fade" id="emp_update_Modal"  role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">修改</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
		  <div class="form-group">
		    <label for="" class="col-sm-2 control-label">ENAME</label>
		    <div class="col-sm-10">
		      <p class="form-control-static" id="emp_update_inputEname3"></p>
		      <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="" class="col-sm-2 control-label">JOB</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="job" id="emp_update_inputJob3" placeholder="JOB">
		       <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="" class="col-sm-2 control-label">SAL</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="emp_update_inputSal3" name="sal" placeholder="SAL">
		       <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="" class="col-sm-2 control-label">部门</label>
		    <div class="col-sm-10">
		      <select class="form-control" name="deptno">
				</select>
		    </div>
		  </div>

		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" id="emp_modal_update_btn" >修改</button>
        <button type="button" class="btn btn-primary" id="emp_modal_update_cancel_btn">关闭</button>
      </div>
    </div>
  </div>
</div>
<div class="container">
   <!-- 标题 -->
  <div class="row">
  	<div class="col-md-12"><h1>CURD</h1></div>
  </div>
   <!-- 按钮 -->
  <div class="row">
   <div class="col-md-4 col-md-offset-8">
   	 <button type="button" class="btn btn-success" id="emp_add_btn">新增</button>
  	 <button type="button" class="btn btn-danger">删除</button>
   </div>
  </div>
  <!-- 表格 -->
  <div class="row">
   <div class="col-md-12">
     <table class="table table-hover" id="table_emp">
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
      </tbody>
    </table>
   </div>
   
  </div>
  <!-- 分页信息 -->
  <div class="row">
     <!-- 分页文字信息 -->
    <div class="col-md-6" id="page_info">
    </div>
    <!-- 分页条 -->
    <div class="col-md-6" id="page_nav_area">
	
    </div>
  </div>

</div> 

</body>
</html>