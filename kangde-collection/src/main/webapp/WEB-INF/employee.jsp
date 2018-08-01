<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	#fm {margin: 0;padding: 10px 30px;}
	.ftitle {font-size: 14px;font-weight: bold;padding: 5px 0;margin-bottom: 10px;border-bottom: 1px solid #ccc;}
	.fitem {margin-bottom: 5px;}
	.fitem label {display: inline-block;width: 80px;}
</style>
<title>组织管理</title>
</head>
<body>

	<div style="margin:10px;">
		<input id="ss" class="easyui-searchbox" style="width:300px;height:30px"
	    data-options="searcher:doSearch,prompt:'请输入要查询的信息',menu:'#mm'"></input>
    </div>
	<div id="mm" style="width:150px">
		<div data-options="name:'item1',selected:true">-选择-</div>
		<div data-options="name:'item2'">已启用</div>
		<div data-options="name:'item3'">未启用</div>
	</div>
	
	<div>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-add" 
        	onclick="newEmp()" plain="true">添加</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-edit"
            onclick="editEmp()" plain="true">修改</a> 
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-remove" 
        	onclick="delEmp()" plain="true">删除</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-edit" 
        	onclick="editUpdate('1')" plain="true">状态启用</a> 
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-edit" 
        	onclick="editUpdate('2')" plain="true">状态关闭</a> 
    </div>

	<table class="easyui-datagrid" id="dg_emp"
		data-options=" url:'emp/goto_emp_ajax.do',
				checkbox:true,
			    pagination: true,
				pageSize: 10">
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'status'" formatter="formatStutas">员工状态</th>
				<th data-options="field:'loginName'">账号</th>
				<th data-options="field:'userName'">姓名</th>
				<th data-options="field:'sex'">性别</th>
				<th data-options="field:'birthday'">生日</th>
				<th data-options="field:'nation'">民族</th>
				<th data-options="field:'married'">婚姻情况</th>
				<th data-options="field:'createTime'" formatter="formatPrice">创建时间</th>
				<th data-options="field:'modifyTime'" formatter="formatPrice">修改时间</th>
				<th data-options="field:'version'">版本号</th>
			</tr>
		</thead>
		<tbody id="tBody_emp">
		
<!-- 			id                 
				salt              盐值(MD5)      
				create_time       创建时间     
				modify_time       修改时间     
				version           版本号        
				number            员工编号     
				status            状态           
				personal_id       身份证号     
				birthday          生日           
				nation            民族           
				married           婚姻状况     
				province          省份           
				city              城市           
				email             邮箱           
				join_time         入职时间     
				cc_server         服务地址     
				      
				
				
				login_name        登录名 
				password          密码
				user_name         员工姓名     
				sex               性别           
				contact_mode      联系方式     
				cc_login          坐席用户
				cc_pwd            坐席密码   
				cc_phone          坐席号    
				position_id       岗位号        
				org_id            机构号
				attach_org_id     附加区域     
				attach_entrust_id 附加委托方
				   -->

		</tbody>
	</table>

	<div id="dlg_emp" class="easyui-dialog" buttons="#dlg_emp-buttons"
		style="width: 400px;" closed="true">
		<form id="fm_emp" method="post" novalidate style="margin:0;padding:20px 50px">
			<div class="fitem" style="margin-bottom:10px">
				<label> Id: </label> 
				<input class="easyui-textbox" name="id" style="width:100%">
    			<!-- data-options="valueField:'id',textField:'text',url:'get_data.php'" -->
			</div>
			<div class="fitem" style="margin-bottom:10px">
				<label> 账号: </label> 
				<input name="loginName" class="easyui-textbox" style="width:100%"/>
			</div>
			<div class="fitem" style="margin-bottom:10px">
				<label> 初始密码:</label> 
				<input name="password" class="easyui-textbox" style="width:100%"/>
			</div>
			<div class="fitem" style="margin-bottom:10px">
				<label> 姓名:</label> 
				<input name="userName"  style="width:100%"/>
			</div>
			<div class="fitem" style="margin-bottom:10px">
				<label> 性别 :</label> 
				<input name="sex" class="easyui-textbox" style="width:100%"/>
			</div>
			<div class="fitem" style="margin-bottom:10px">
				<label>  联系方式 :</label> 
				<input name="contactMode" class="easyui-textbox" style="width:100%"/>
			</div>
			<div class="fitem" style="margin-bottom:10px">
				<label>  坐席用户:</label> 
				<input name="ccLogin" class="easyui-textbox" style="width:100%"/>
			</div>
			<div class="fitem" style="margin-bottom:10px">
				<label>  坐席密码:</label> 
				<input name="ccPwd" class="easyui-textbox" style="width:100%"/>
			</div>
			<div class="fitem" style="margin-bottom:10px">
				<label> 坐席号:</label> 
				<input name="ccPhone" class="easyui-textbox" style="width:100%"/>
			</div>    
			<div class="fitem" style="margin-bottom:10px">
				<label>  岗位号:</label> 
				<input name="positionId" class="easyui-textbox" style="width:100%"/>
			</div>
			<div class="fitem" style="margin-bottom:10px">
				<label> 机构号:</label> 
				<input name="orgId" class="easyui-textbox" style="width:100%"/>
			</div>
			<div class="fitem" style="margin-bottom:10px">
				<label>  附加区域 :</label> 
				<input name="attachOrgId" class="easyui-combobox" style="width:100%"/>
			</div>
			<div class="fitem" style="margin-bottom:10px">
				<label> 附加委托方:</label> 
				<input name="attachEntrustId" class="easyui-combobox" style="width:100%"/>
			</div>
			<input type="hidden" name="action" id="hidtype" /> 
		</form>
	</div>
	<div id="dlg_emp-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			onclick="saveOrg()" iconcls="icon-save">保存</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			onclick="javascript:$('#dlg_emp').dialog('close')" iconcls="icon-cancel">取消</a>
	</div>


<script type="text/javascript">
		
		var url;
		var type;
		function newEmp() {
			$("#dlg_emp").dialog("open").dialog('setTitle', '添加员工信息');
			$("#fm_emp").form("clear");
			url = "emp/add.do";
			document.getElementById("hidtype").value = "submit";
		}
		function editEmp() {
			var row = $("#dg_emp").datagrid("getSelected");
			if (row) {
				$("#dlg_emp").dialog("open").dialog('setTitle', '编辑信息');
				$("#fm_emp").form("load", row);
				url = "emp/edit.do";
			}
		}
		function saveEmp() {
			$("#fm_emp").form("submit", {
				url : url,
				onsubmit : function() {
					return $(this).form("validate");
				},
				success : function(result) {
					if (result == "1") {
						$.messager.alert("提示信息", "操作成功");
						$("#dlg_emp").dialog("close");
						$("#dg_emp").datagrid("reload");
					} else {
						$.messager.alert("提示信息", "操作失败");
					}
				}
			});
		}
		function delEmp() {
			var row = $('#dg_emp').datagrid('getSelected');
			if (row) {
				$.messager.confirm('确认','你确定删除吗？',
					function(r) {
						if (r) {
							$.post('emp/del.do', {
								id : row.id
							}, function(result) {
								if (result == "1") {
									$('#dg_emp').datagrid('reload'); // reload the user data  
								} else {
									$.messager.show({ // show error message  
										title : '删除错误！',
									});
								}
							}, 'json');
						}
					}
				);
			}
		}
		function editUpdate(num) {
			var url = "";
			if(num == '1'){
				url = "emp/editUpdateIn.do";
			}else if(num == '2'){
				url = "emp/editUpdateUp.do";
			}
			var rows = $("#dg_emp").datagrid("getSelections");	//getChecked
			var jsonData = new Object();
	    	$.each(rows,function (i,row){
	    		jsonData["ids["+i+"]"] = row.id;
	    	});
			if (rows.length != 0) {
				 $.ajax({
		    		type : "post",
		    		url : url,
		    		data : jsonData,
		    		success:function(result) {
						if (result == "1") {
							$('#dg_emp').datagrid('reload'); 
						} else {
							alert("修改错误！");
						}
		    		}
		    	}); 
			}else{
				alert("请选择要启用的员工！");
			}
		}
		
		// 状态格式化
	   	function formatStutas(val,row){
	        var str = "";  
	         
	        if (val == 1) {  
	             str = "已启用";  
	        }
	        if(val == null || val == "" || typeof(val)=="undefined"){  
		           return "未启用";  
		    }   
	        return str;
	    }
		
		//搜索
		function doSearch(value,name){
			alert('You input: ' + value+'('+name+')');
		}
</script>

</body>
</html>