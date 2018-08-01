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
<title>组织管理</title>
</head>
<body>

	<a href="javascript:addPage('org/goto_orgAdd.do');" class="easyui-linkbutton" iconcls="icon-add">添加</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-edit" >修改</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-remove" >删除</a>

	<table class="easyui-datagrid" id="dg">
		<thead>
			<tr>
				<th data-options="field:'id'">ID</th>
				
				<th data-options="field:'name'">机构名称</th>
				<th data-options="field:'parent_id'">上级部门</th>
				<th data-options="field:'address'">地址</th>
				<th data-options="field:'phone'">电话号码</th>
				<th data-options="field:'post_code'">邮政编号</th>
				<th data-options="field:'fax'">传真号</th>
				<th data-options="field:'type'">机构类型</th>
				<th data-options="field:'order_no'">排序号</th>
				<th data-options="field:'code'">机构编码</th>
				<th data-options="field:'principal_id'">机构负责人Id</th>
				<th data-options="field:'path'">机构路径</th>
				
				<th data-options="field:'create_time'">创建时间</th>
				<th data-options="field:'modify_time'">修改时间</th>
				<th data-options="field:'version'">版本</th>
				<th data-options="field:'status'">系统状态</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list_org }">
				<tr>
					<c:forEach begin="1" end="16" step="1">
						<td>查询出错</td>
					</c:forEach>
				</tr>			
			</c:if>
			<c:if test="${!empty list_org }">
				<c:forEach items="${list_org }" var="org">
					<tr>
						<td>${org.id }</td>
						
						<td>${org.name }</td>
						<td>${org.parentId }</td>
						<td>${org.address }</td>
						<td>${org.phone }</td>
						<td>${org.postCode }</td>
						<td>${org.fax }</td>
						<td>${org.type }</td>
						<td>${org.orderNo }</td>
						<td>${org.code }</td>
						<td>${org.principalId }</td>
						<td>${org.path }</td>
						
						<td>${org.createTime }</td>
						<td>${org.modifyTime }</td>
						<td>${org.version }</td>
						<td>${org.status }</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>

<script type="text/javascript">

		//报废的产品
		function addPage(url) {
			var content = '<iframe src="'
					+ url
					+ '" width="100%" height="99%" frameborder="0" scrolling="no"></iframe>';
			var divContent = '<div>';
			var win = $('<div/>').dialog({
				content : content,
				width : '500',
				height : '300',
				modal : true,
				title : '添加组织机构',
				cache : false,
				buttons : [ {
					text : '确定',
					iconCls : 'icon-add',
					handler : function() {
						var d = $(this).closest('.window-body');
						// 执行操作后关闭。。。。。。
						//d.dialog('destroy');
						
						//提交表单
					}
				} ],
				onClose : function() {
					$(this).dialog('destroy');
				}
			});

			win.dialog('open');
		}
</script>

</body>
</html>