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

	<div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-add" 
        	onclick="newOrg()" plain="true">添加</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-edit"
            onclick="editOrg()" plain="true">修改</a> 
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-remove" 
        	onclick="delOrg()" plain="true">删除</a>
    </div>

	<table class="easyui-treegrid" id="dg"
		data-options=" url:'org/goto_org_ajax.do',    
			    idField:'id',    
			    treeField:'name',
			    pagination: true,
				pageSize: 10">
		<thead>
			<tr>
				<th data-options="field:'id'">ID</th>

				<th data-options="field:'name'">机构名称</th>
				<th data-options="field:'address'">地址</th>
				<th data-options="field:'phone'">电话号码</th>
				<th data-options="field:'postCode'">邮政编号</th>
				<th data-options="field:'fax'">传真号</th>
				<th data-options="field:'type'">机构类型</th>
				<th data-options="field:'orderNo'">排序号</th>
				<th data-options="field:'code'">机构编码</th>
				<th data-options="field:'principalId'">机构负责人Id</th>
				<th data-options="field:'path'">机构路径</th>

				<th data-options="field:'createTime'" formatter="formatPrice">创建时间</th>
				<th data-options="field:'modifyTime'" formatter="formatPrice">修改时间</th>
				<th data-options="field:'version'">版本</th>
				<th data-options="field:'status'">系统状态</th>
			</tr>
		</thead>
		<tbody id="tBody">

		</tbody>
	</table>

	<div id="dlg" class="easyui-dialog" buttons="#dlg-buttons"
		style="width: 400px;" closed="true">
		<form id="fm" method="post" novalidate style="margin:0;padding:20px 50px">
			<div class="fitem" style="margin-bottom:10px">
				<label> Id: </label> 
				<input class="easyui-textbox" name="id" style="width:100%">
    			<!-- data-options="valueField:'id',textField:'text',url:'get_data.php'" -->
			</div>
			<div class="fitem" style="margin-bottom:10px">
				<label> 机构名称: </label> 
				<input name="name" class="easyui-textbox" style="width:100%"/>
			</div>
			<div class="fitem" style="margin-bottom:10px">
				<label> 上级部门:</label> 
				<input name="parentId" class="easyui-combobox" style="width:100%"/>
			</div>
			<div class="fitem" style="margin-bottom:10px">
				<label> 地址:</label> 
				<input name="address" class="easyui-textbox" style="width:100%"/>
			</div>
			<div class="fitem" style="margin-bottom:10px">
				<label> 创建时间</label> 
				<input name="CreateTime" class="easyui-textbox" style="width:100%"/>
			</div>
			<div class="fitem" style="margin-bottom:10px">
				<label> 电话号码:</label> 
				<input name="phone" class="easyui-textbox" style="width:100%"/>
			</div>
			<div class="fitem" style="margin-bottom:10px">
				<label> 邮政编号:</label> 
				<input name="postCode" class="easyui-textbox" style="width:100%"/>
			</div>
			<div class="fitem" style="margin-bottom:10px">
				<label> 传真号:</label> 
				<input name="fax" class="easyui-textbox" style="width:100%"/>
			</div>
			<div class="fitem" style="margin-bottom:10px">
				<label> 机构类型:</label> 
				<input name="type" class="easyui-combobox" style="width:100%"/>
			</div>
			<input type="hidden" name="action" id="hidtype" /> 
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			onclick="saveOrg()" iconcls="icon-save">保存</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			onclick="javascript:$('#dlg').dialog('close')" iconcls="icon-cancel">取消</a>
	</div>


<script type="text/javascript">
		
		var url;
		var type;
		function newOrg() {
			$("#dlg").dialog("open").dialog('setTitle', '添加组织机构信息');
			$("#fm").form("clear");
			url = "org/add.do";
			document.getElementById("hidtype").value = "submit";
		}
		function editOrg() {
			var row = $("#dg").datagrid("getSelected");
			if (row) {
				$("#dlg").dialog("open").dialog('setTitle', '编辑信息');
				$("#fm").form("load", row);
				url = "org/edit.do";
			}
		}
		function saveOrg() {
			$("#fm").form("submit", {
				url : url,
				onsubmit : function() {
					return $(this).form("validate");
				},
				success : function(result) {
					if (result == "1") {
						$.messager.alert("提示信息", "操作成功");
						$("#dlg").dialog("close");
						$("#dg").datagrid("reload");
					} else {
						$.messager.alert("提示信息", "操作失败");
					}
				}
			});
		}
		function delOrg() {
			var row = $('#dg').datagrid('getSelected');
			if (row) {
				$.messager.confirm('确认','你确定删除吗？',
					function(r) {
						if (r) {
							$.post('org/del.do', {
								id : row.id
							}, function(result) {
								if (result == "1") {
									$('#dg').datagrid('reload'); // reload the user data  
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

</script>

</body>
</html>