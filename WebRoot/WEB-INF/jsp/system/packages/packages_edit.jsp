<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<!-- 下拉框 -->
		<link rel="stylesheet" href="static/css/chosen.css" />
		
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		
		<link rel="stylesheet" href="static/css/datepicker.css" /><!-- 日期框 -->
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
<script type="text/javascript">
	
	
	//保存
	function save(){
			if($("#PRODUCTID").val()==""){
			$("#PRODUCTID").tips({
				side:3,
	            msg:'请输入产品ID',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PRODUCTID").focus();
			return false;
		}
		if($("#PACKAGE_NAME").val()==""){
			$("#PACKAGE_NAME").tips({
				side:3,
	            msg:'请输入名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PACKAGE_NAME").focus();
			return false;
		}
		if($("#PACKAGE_PRICE").val()==""){
			$("#PACKAGE_PRICE").tips({
				side:3,
	            msg:'请输入单价',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PACKAGE_PRICE").focus();
			return false;
		}
		if($("#BAK30").val()==""){
			$("#BAK30").tips({
				side:3,
	            msg:'请输入备注预留字段',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#BAK30").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
		window.close();
	
</script>
	</head>
<body>
	<form action="packages/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="PACKAGES_ID" id="PACKAGES_ID" value="${pd.PACKAGES_ID}"/>
		<input type="hidden" name="PRODUCTID" id="PRODUCTID" value="${pd.PRODUCTS_ID}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">产品名称:</td>
				<td><input type="text" name="PRODUCT_NAME" id="PRODUCT_NAME" value="${pd.PRODUCT_NAME}" maxlength="32" placeholder="" title="产品名称" readonly="readonly"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">套餐名称:</td>
				<td><input type="text" name="PACKAGE_NAME" id="PACKAGE_NAME" value="${pd.PACKAGE_NAME}" maxlength="32" placeholder="这里输入名称" title="名称"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">单价:</td>
				<td><input type="number" name="PACKAGE_PRICE" id="PACKAGE_PRICE" value="${pd.PACKAGE_PRICE}" maxlength="32" placeholder="这里输入单价" title="单价"/></td>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="10">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
		
	</form>
	
	
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		<script type="text/javascript">
		$(top.hangge());
		$(function() {
			
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
		});
		
		</script>
</body>
</html>