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
<link rel="stylesheet" type="text/css" href="js/easyui/themes/color.css">
<link rel="stylesheet" type="text/css" href="js/easyui/demo/demo.css">
<script type="text/javascript" src="js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>

<script type="text/javascript">
	function add_tab(url,title){
		// add a new tab panel  
		var b = $('#tt').tabs('exists',title);
		if(!b){
			$('#tt').tabs('add',{    
			    title:title,    
			    href:url,    
			    closable:true,    
			    tools:[{    
			        iconCls:'icon-mini-refresh',    
			        handler:function(){    
			            alert('refresh');    
			        }    
			    }]    
			});
		}else{
			$('#tt').tabs('select',title);
		}
	}
	
	// 日期格式化函数
   	function formatPrice(val,row){
    	if(val == null || val == "" || typeof(val)=="undefined"){  
            return "";  
         }  
         var now = new Date(val);  
         var year = now.getFullYear();  
         var month =(now.getMonth() + 1).toString();  
         var day = (now.getDate()).toString();  
         if (month.length == 1) {  
              month = "0" + month;  
         }  
         if (day.length == 1) {  
              day = "0" + day;  
         }  
          var dateTime = year +"-"+ month +"-"+  day;  
        return dateTime;
    }
</script>
<title>首页</title>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false" style="height:75px;background:#B3DFDA;padding:10px">
		<center><h1>催账后台管理系统</h1></center>
	</div>
	<div data-options="region:'west',split:true,title:'导航菜单'" style="width:180px;padding:10px;">
		<div class="easyui-accordion" style="width:160px;">
			<div title="系统管理" data-options="iconCls:'icon-ok'" >
				<ul><li><a href="javascript:add_tab('','资源管理')">资源管理</a></li></ul>
				<ul><li><a href="javascript:add_tab('goto_Organization.do','组织机构')" style="color:red">组织机构管理</a></li></ul>
				<ul><li><a href="javascript:add_tab('goto_Position.do','职位管理')" style="color:red">职位管理</a></li></ul>
				<ul><li><a href="javascript:add_tab('goto_Role.do','角色配置')">角色配置</a></li></ul>
				<ul><li><a href="javascript:add_tab('goto_Entrust.do','委托方管理')" style="color:red">委托方管理</a></li></ul>
				<ul><li><a href="javascript:add_tab('goto_Employee.do','员工管理')" style="color:red">员工管理</a></li></ul>
			</div>
			<div title="业务模块" data-options="iconCls:'icon-ok'">
				<ul><li><a href="javascript:add_tab('goto_CaseBatch.do','批次管理')" style="color:red">批次管理</a></li></ul>
				<ul><li><a href="javascript:add_tab('goto_CaseInfo.do','催收管理')" style="color:red">催收管理</a></li></ul>
			</div>
		</div>
	</div>
	<div data-options="region:'south',border:false" style="height:50px;background:#A9FACD;padding:10px;">
		<center>京公网安备 11000002000088号|京ICP证070359号|Copyright © 2004 - 2018</center>
	</div>
	<div data-options="region:'center',title:''">
		<div id="tt" class="easyui-tabs" style="height:540px">
		</div>
	</div>

</body>
</html>