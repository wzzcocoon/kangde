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

	<div>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-add" 
        	onclick="newPos()" plain="true">添加</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-edit"
            onclick="editPos()" plain="true">修改</a> 
        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-remove" 
        	onclick="delPos()" plain="true">删除</a>
    </div>

	<table class="easyui-datagrid" id="dg_pos"
		data-options=" url:'pos/goto_pos_ajax.do'">
		<thead>
			<tr>
				<th data-options="field:'id'">ID</th>
				<th data-options="field:'name'">职位名称</th>
				<th data-options="field:'type'">职位类型</th>
				<th data-options="field:'description'">职位描述</th>
				<th data-options="field:'createTime'" formatter="formatPrice">创建时间</th>
				<th data-options="field:'modifyTime'" formatter="formatPrice">修改时间</th>
			</tr>
		</thead>
		<tbody id="tBody_pos">
		
<!-- 			id   		 id                                                                
				name         职位名称                                                      
				parent_id    上级ID                                                          
				order_no     排序号                                                         
				description  描述                                                            
				path         职位路径                                                      
				type         岗位类型 对应字典1客服 2员工 3主任 4经理 5总监  
				create_time  创建时间                                                      
				modify_time  修改时间  -->

		</tbody>
	</table>

	<div id="dlg_pos" class="easyui-dialog" buttons="#dlg_pos-buttons"
		style="width: 400px;" closed="true">
		<form id="fm_pos" method="post" novalidate style="margin:0;padding:20px 50px">
			<div class="fitem" style="margin-bottom:10px">
				<label> Id: </label> 
				<input class="easyui-textbox" name="id" style="width:100%">
    			<!-- data-options="valueField:'id',textField:'text',url:'get_data.php'" -->
			</div>
			<div class="fitem" style="margin-bottom:10px">
				<label> 职位名称: </label> 
				<input name="name" class="easyui-textbox" style="width:100%"/>
			</div>
			<div class="fitem" style="margin-bottom:10px">
				<label> 排序号:</label> 
				<input name="orderNo"  style="width:100%"/>
			</div>
			<div class="fitem" style="margin-bottom:10px">
				<label> 描述 :</label> 
				<input name="description" class="easyui-textbox" style="width:100%"/>
			</div>
			<div class="fitem" style="margin-bottom:10px">
				<label> 岗位类型:</label> 
				<input name="type" class="easyui-textbox" style="width:100%"/>
			</div>
			<div class="fitem" style="margin-bottom:10px">
				<label> 创建时间 :</label> 
				<input name="createTime" class="easyui-textbox" style="width:100%"/>
			</div>
			<div class="fitem" style="margin-bottom:10px">
				<label> 修改时间:</label> 
				<input name="modifyTime" class="easyui-textbox" style="width:100%"/>
			</div>
			<input type="hidden" name="action" id="hidtype" /> 
		</form>
	</div>
	<div id="dlg_pos-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			onclick="savePos()" iconcls="icon-save">保存</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			onclick="javascript:$('#dlg_pos').dialog('close')" iconcls="icon-cancel">取消</a>
	</div>


<script type="text/javascript">
		
		var url;
		var type;
		function newPos() {
			$("#dlg_pos").dialog("open").dialog('setTitle', '添加职位信息');
			$("#fm_pos").form("clear");
			url = "pos/add.do";
			document.getElementById("hidtype").value = "submit";
		}
		function editPos() {
			var row = $("#dg_pos").datagrid("getSelected");
			if (row) {
				$("#dlg_pos").dialog("open").dialog('setTitle', '编辑信息');
				$("#fm_pos").form("load", row);
				url = "pos/edit.do";
			}
		}
		function savePos() {
			$("#fm_pos").form("submit", {
				url : url,
				onsubmit : function() {
					return $(this).form("validate");
				},
				success : function(result) {
					if (result == "1") {
						$.messager.alert("提示信息", "操作成功");
						$("#dlg_pos").dialog("close");
						$("#dg_pos").datagrid("reload");
					} else {
						$.messager.alert("提示信息", "操作失败");
					}
				}
			});
		}
		function delPos() {
			var row = $('#dg_pos').datagrid('getSelected');
			if (row) {
				$.messager.confirm('确认','你确定删除吗？',
					function(r) {
						if (r) {
							$.post('pos/del.do', {
								id : row.id
							}, function(result) {
								if (result == "1") {
									$('#dg_pos').datagrid('reload'); // reload the user data  
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