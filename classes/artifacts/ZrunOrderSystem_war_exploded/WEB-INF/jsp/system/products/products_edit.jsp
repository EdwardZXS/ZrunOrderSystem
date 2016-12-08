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
			if($("#PRODUCT_NAME").val()==""){
			$("#PRODUCT_NAME").tips({
				side:3,
	            msg:'请输入产品名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PRODUCT_NAME").focus();
			return false;
		}
		if($("#DISCOUNT").val()==""){
			$("#DISCOUNT").tips({
				side:3,
				msg:'请输入折扣',
				bg:'#AE81FF',
				time:2
			});
			$("#DISCOUNT").focus();
			return false;
		}
		if($("#SAVE").val()==""){
			$("#SAVE").tips({
				side:3,
				msg:'请输入节省',
				bg:'#AE81FF',
				time:2
			});
			$("#SAVE").focus();
			return false;
		}
		if($("#SALE_AMOUNT").val()==""){
			$("#SALE_AMOUNT").tips({
				side:3,
				msg:'请输入销量',
				bg:'#AE81FF',
				time:2
			});
			$("#SALE_AMOUNT").focus();
			return false;
		}
		if($("#PRODUCT_ANOTHERNAME").val()==""){
			$("#PRODUCT_ANOTHERNAME").tips({
				side:3,
				msg:'请输入产品别名',
				bg:'#AE81FF',
				time:2
			});
			$("#PRODUCT_ANOTHERNAME").focus();
			return false;
		}

		if($("#PRODUCT_PRICE").val()==""){
			$("#PRODUCT_PRICE").tips({
				side:3,
	            msg:'请输入产品单价',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PRODUCT_PRICE").focus();
			return false;
		}
		if($("#ZD_ID").val()==""){
			$("#ZD_ID").tips({
				side:3,
	            msg:'请输入产品类型',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ZD_ID").focus();
			return false;
		}
		if($("#SIZE").val()==""){
			$("#SIZE").tips({
				side:3,
	            msg:'请输入尺码',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#SIZE").focus();
			return false;
		}
		if($("#COLOR").val()==""){
			$("#COLOR").tips({
				side:3,
	            msg:'请输入颜色',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#COLOR").focus();
			return false;
		}
		if($("#STOCK").val()==""){
			$("#STOCK").tips({
				side:3,
	            msg:'请输入库存',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#STOCK").focus();
			return false;
		}
		if($("#PRODUCTSTATUS").val()==""){
			$("#PRODUCTSTATUS").tips({
				side:3,
	            msg:'请输入状态',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PRODUCTSTATUS").focus();
			return false;
		}
		if($("#EXPLAINS").val()==""){
			$("#EXPLAINS").tips({
				side:3,
	            msg:'请输入产品描述',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#EXPLAINS").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="products/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="PRODUCTS_ID" id="PRODUCTS_ID" value="${pd.PRODUCTS_ID}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">产品名称:</td>
				<td><input type="text" name="PRODUCT_NAME" id="PRODUCT_NAME" value="${pd.PRODUCT_NAME}" maxlength="32" placeholder="这里输入产品名称" title="产品名称"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">产品别名:</td>
				<td><input type="text" name="PRODUCT_ANOTHERNAME" id="PRODUCT_ANOTHERNAME" value="${pd.PRODUCT_ANOTHERNAME}" maxlength="32" placeholder="这里输入产品别名" title="产品别名"/></td>
			</tr>
			<tr>
			<td style="width:70px;text-align: right;padding-top: 13px;">产品单价:</td>
				<td><input type="number" name="PRODUCT_PRICE" id="PRODUCT_PRICE" value="${pd.PRODUCT_PRICE}" maxlength="32" placeholder="这里输入产品单价" title="产品单价"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">产品类型:</td>
				<td><input type="text" name="ZD_ID" id="ZD_ID" value="${pd.ZD_ID}" maxlength="32" placeholder="这里输入产品类型" title="产品类型"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">尺码:</td>
				<td><input type="text" name="SIZE" id="SIZE" value="${pd.SIZE}" maxlength="32" placeholder="这里输入尺码" title="尺码"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">折扣:</td>
				<td><input type="text" name="DISCOUNT" id="DISCOUNT" value="${pd.DISCOUNT}" maxlength="32" placeholder="这里输入产品折扣" title="折扣"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">节省:</td>
				<td><input type="text" name="SAVE" id="SAVE" value="${pd.SAVE}" maxlength="32" placeholder="这里输入节省" title="节省"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">颜色:</td>
				<td><input type="text" name="COLOR" id="COLOR" value="${pd.COLOR}" maxlength="32" placeholder="这里输入颜色" title="颜色"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">销量:</td>
				<td><input type="text" name="SALE_AMOUNT" id="SALE_AMOUNT" value="${pd.SALE_AMOUNT}" maxlength="32" placeholder="这里输入销量" title="销量"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">库存:</td>
				<td><input type="text" name="STOCK" id="STOCK" value="${pd.STOCK}" maxlength="32" placeholder="这里输入库存" title="库存"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">状态:</td>
				<td><input type="number" name="PRODUCTSTATUS" id="PRODUCTSTATUS" value="${pd.PRODUCTSTATUS}" maxlength="32" placeholder="这里输入状态" title="状态"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">产品描述:</td>
				<td><input type="text" name="EXPLAINS" id="EXPLAINS" value="${pd.EXPLAINS}" maxlength="32" placeholder="这里输入产品描述" title="产品描述"/></td>
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