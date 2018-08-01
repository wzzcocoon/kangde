<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>

<link rel="stylesheet" type="text/css" href="js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function b(){}
</script>
<title></title>
</head>
<body>
	<div style="padding:3px 2px;border-bottom:1px solid #ccc">添加组织相关信息</div>
	<center>
	<form id="addform" action="org/add.do" method="post">
		<table>
			<tr>
				<td>机构名称:</td>
				<td><input name="name" type="text"></input></td>
			</tr>
			<tr>
				<td>上级部门:</td>
				<td><input name="parentId" type="text"></input></td>
			</tr>
			<tr>
				<td>地址:</td>
				<td><input name="address" type="text"></input></td>
			</tr>
			<tr>
				<td>电话号码:</td>
				<td><input name="phone" type="text"></input></td>
			</tr>
			<tr>
				<td>邮政编号:</td>
				<td><input name="postCode" type="text"></input></td>
			</tr>
			<tr>
				<td>传真号:</td>
				<td><input name="fax" type="text"></input></td>
			</tr>
			<tr>
				<td>机构类型:</td>
				<td><input name="type" type="text"></input></td>
			</tr>
			<tr>
				<td></td>
				<td style="display:none"><input id="realSub" type="submit" value="Submit"></input></td>
			</tr>
		</table>
	</form>
	</center>	
	
</body>
</html>