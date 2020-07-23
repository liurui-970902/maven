<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>用户操作</title>
     <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
  </head>
  <body>
  		<div>
			<c:choose>
				<c:when test="${not empty requestScope.List }">
					<h1>修改用户信息</h1>
				</c:when>
				<c:otherwise>
					<h1>添加用户信息</h1>
				</c:otherwise>
			</c:choose>  			
  		</div>
  		<form>
		  <div class="form-group">
		    <label for="exampleInputEmail1">用户姓名:</label>
		    <input type="text" class="form-control" style="width:300px;" value="${requestScope.List[0].name }" id="uName" placeholder="Name">
		  </div>
		  <div class="form-group">
		    <label for="exampleInputPassword1">用户年龄:</label>
		    <input type="text" class="form-control" style="width:300px;" value="${requestScope.List[0].age }" id="uAge" placeholder="Age">
		  </div>
		  <div class="form-group">
		    <label for="exampleInputPassword1">用户性别:</label>
		  <input type="text" class="form-control" style="width:300px;" value="${requestScope.List[0].sex }" id="uSex" placeholder="Age">
		  </div>
		  <div class="form-group">
		   <label for="exampleInputPassword1">职务:</label>
		  <select class="form-control" id="dId" style="width:300px;">
	    	<option value="0">请选择</option>
	    	<option value="1">系统管理员</option>
	    	<option value="2">普通员工</option>
	    	<option value="3">经理</option>
	    	<option value="4">店长</option>
	    	<option value="5">高级员工</option>
		  </select>
		  </div>
		  <c:choose>
		  		<c:when test="${not empty requestScope.List }">
		  			<button type="button" class="btn btn-default" id="update">修改</button>
		  		</c:when>
		  		<c:otherwise>
		  			<button type="button" class="btn btn-default" id="add">添加</button>
		  		</c:otherwise>
		  </c:choose>
		</form>
  		<script type="text/javascript" src="<%=path%>/static/js/jquery-1.12.4.js"></script>
  		<script type="text/javascript" src="<%=path %>/static/js/bootstrap.js"></script>
  		<script type="text/javascript">
  			
  			//修改按钮
  			$("#update").click(function(){
  				//用户输入
  				var id = '${requestScope.List[0].id}';
  				var name = $("#uName").val();
  				var age = $("#uAge").val();
  				var sex = $("#sex").val();
  				var pssionsid = $("#dId").val();
  				//非空
  				if(name == ""){
  					alert("用户名不能为空!");
  					return;
  				}
  				if(age == ""){
  					alert("年龄不能为空!");
  					return;
  				}
  				if(isNaN(age) == true){
  					alert("年龄必须为数字!");
  					return;
  				}
  				if(sex == ""){
  					alert("性别不能为空!");
  					return;
  				}
  				if(pssionsid == "0"){
  					alert("部门不能为空!");
  					return;
  				}
  				var ise = {
  					id:id,
  					name:name,
  					age:age,
  					sex:sex,
  					pssionsid:pssionsid
  				}
  				//使用ajax
  				$.ajax({
  					url		:		"<%=path%>/spring/api/baocun",
  					method	:		"post",
  					data	:		ise,
  					success	:		function(data){
  						var json = eval('('+data+')');
  						if(json.status == 1){
  							alert(json.message);
  							location.href="<%=path%>/spring/user/index";
  						}else{
  							alert(json.message);
  						}
  					}
  				});
  			});
  			
  			//添加按钮
  			$("#add").click(function(){
  				var uName = $("#uName").val();
  				var uAge = $("#uAge").val();
  				var uSex = $("#sex").val();
  				var dId = $("#dId").val();
  				//非空
  				if(uName == ""){
  					alert("用户名不能为空!");
  					return;
  				}
  				if(uAge == ""){
  					alert("年龄不能为空!");
  					return;
  				}
  				if(isNaN(uAge) == true){
  					alert("年龄必须为数字!");
  					return;
  				}
  				if(uSex == "0"){
  					alert("性别不能为空!");
  					return;
  				}
  				if(dId == "0"){
  					alert("部门不能为空!");
  					return;
  				}
  				var ise = {
  					name:uName,
  					age:uAge,
  					sex:uSex,
  					pssionsid:dId
  				};
  				//使用ajax
  				$.ajax({
  					url		:		"<%=path%>/spring/user/add",
  					method	:		"post",
  					data	:		ise,
  					success	:		function(data){
  						var json =eval('('+data+')');
  						if(json.status == 1){
  							alert(json.message);
  							location.href="<%=path%>/spring/user/list";
  						}else{
  							alert(json.message);
  						}
  					}
  				});
  			});
  		</script>
  </body>
</html>
