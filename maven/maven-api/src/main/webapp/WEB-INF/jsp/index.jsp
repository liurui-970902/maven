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
    <title>My JSP 'index.jsp' starting page</title>
     <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
  </head>
  
  <body>
  <br/>
  		<div id="content" style="margin-left:200px;">
		    	<label for="exampleInputEmail1">员工编号:</label>
			    <input type="text" class="form-control" style="width:300px;display: inline-block;" id="uName" value="">
			  
			    <input type="button" class="btn btn-default" value="查询"  onclick="select()"/>
			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			   <li><a href="<%=path%>/spring/api/tz">添加</a></li>
		    </div>
		    <br/>
  		<table class="table table-striped">
  			<tr>
  				<td>员工编号</td>
  				<td>员工姓名</td>
  				<td>员工年龄</td>
  				<td>员工性别</td>
  				<td>员工职务</td>
  				<td>操作</td>
  			</tr>
  			<c:forEach var="user" items="${requestScope.List }">
  				<tr>
  					<td>${user.id }</td>
  					<td>${user.name }</td>
  					<td>${user.age }</td>
  					<td>${user.sex }</td>
  					<td>${user.pssionsname}</td>
  					<td>
  						<div class="dropdown">
						  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
						    更多操作
						    <span class="caret"></span>
						  </button>
						  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
						    <li><a href="<%=path%>/spring/api/index?id=${user.id}">修改</a></li>
						    <li role="separator" class="divider"></li>
						    <li><a href="javascript:void(0)" onclick="isDelete(${user.id})">删除</a></li>
						  </ul>
						</div>
  					</td>
  				</tr>
  			</c:forEach>
		</table>
  		<script type="text/javascript" src="<%=path%>/static/js/jquery-1.12.4.js"></script>
  		<script type="text/javascript" src="<%=path %>/static/js/bootstrap.js"></script>
  		<script type="text/javascript">
  			function select(){
  			 var name= $("#uName").val();
  			 location.href="<%=path%>/spring/api/index?name="+name;
  			}
  			
  			function isDelete(id){
  			  $.ajax({
  			    url   : <%=path%>/spring/api/drop
  			     type        :      "post",
                 data        :      "id="+id,
                  dataType    :      "json",
                  success     :       function ccess(data){
                    var date =eval('data');
                         alert(date.message);
                         location.reload();
                    },
                    error      :    function err(){
                    alert("系统异常");
                    } 
  			  
  			  })
  			
  			}
  			
  			
  		</script>
  </body>
</html>
