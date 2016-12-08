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
		if($("#PACKAGEID").val()==""){
			$("#PACKAGEID").tips({
				side:3,
	            msg:'请输入套餐ID',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PACKAGEID").focus();
			return false;
		}
		if($("#COLOUR").val()==""){
			$("#COLOUR").tips({
				side:3,
	            msg:'请输入颜色',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#COLOUR").focus();
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
		if($("#QUANTITY").val()==""){
			$("#QUANTITY").tips({
				side:3,
	            msg:'请输入件数',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#QUANTITY").focus();
			return false;
		}
		if($("#AMOUNT").val()==""){
			$("#AMOUNT").tips({
				side:3,
	            msg:'请输入订单总额',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#AMOUNT").focus();
			return false;
		}
		if($("#CONSIGNEE").val()==""){
			$("#CONSIGNEE").tips({
				side:3,
	            msg:'请输入收货人',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CONSIGNEE").focus();
			return false;
		}
		if($("#MOBILE").val()==""){
			$("#MOBILE").tips({
				side:3,
	            msg:'请输入手机号',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#MOBILE").focus();
			return false;
		}
		if($("#ADDRESS").val()==""){
			$("#ADDRESS").tips({
				side:3,
	            msg:'请输入地址',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ADDRESS").focus();
			return false;
		}
		if($("#POST_CODE").val()==""){
			$("#POST_CODE").tips({
				side:3,
	            msg:'请输入邮编',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#POST_CODE").focus();
			return false;
		}
		if($("#ORDER_REMARK").val()==""){
			$("#ORDER_REMARK").tips({
				side:3,
	            msg:'请输入备注',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ORDER_REMARK").focus();
			return false;
		}
		if($("#PAY_MODE").val()==""){
			$("#PAY_MODE").tips({
				side:3,
	            msg:'请输入支付方式',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PAY_MODE").focus();
			return false;
		}
		if($("#LOGISTICS").val()==""){
			$("#LOGISTICS").tips({
				side:3,
	            msg:'请输入选择物流',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#LOGISTICS").focus();
			return false;
		}
		if($("#LAST_MODIFY").val()==""){
			$("#LAST_MODIFY").tips({
				side:3,
	            msg:'请输入最后修改时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#LAST_MODIFY").focus();
			return false;
		}
		if($("#ORDERSTATUS").val()==""){
			$("#ORDERSTATUS").tips({
				side:3,
	            msg:'请输入状态',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ORDERSTATUS").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="orders/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="ORDERS_ID" id="ORDERS_ID" value="${pd.ORDERS_ID}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">产品ID:</td>
				<td><input type="number" name="PRODUCTID" id="PRODUCTID" value="${pd.PRODUCTID}" maxlength="32" placeholder="这里输入产品ID" title="产品ID"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">套餐ID:</td>
				<td><input type="number" name="PACKAGEID" id="PACKAGEID" value="${pd.PACKAGEID}" maxlength="32" placeholder="这里输入套餐ID" title="套餐ID"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">颜色:</td>
				<td><input type="text" name="COLOUR" id="COLOUR" value="${pd.COLOUR}" maxlength="32" placeholder="这里输入颜色" title="颜色"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">尺码:</td>
				<td><input type="text" name="SIZE" id="SIZE" value="${pd.SIZE}" maxlength="32" placeholder="这里输入尺码" title="尺码"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">件数:</td>
				<td><input type="number" name="QUANTITY" id="QUANTITY" value="${pd.QUANTITY}" maxlength="32" placeholder="这里输入件数" title="件数"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">订单总额:</td>
				<td><input type="number" name="AMOUNT" id="AMOUNT" value="${pd.AMOUNT}" maxlength="32" placeholder="这里输入订单总额" title="订单总额"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">收货人:</td>
				<td><input type="text" name="CONSIGNEE" id="CONSIGNEE" value="${pd.CONSIGNEE}" maxlength="32" placeholder="这里输入收货人" title="收货人"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">手机号:</td>
				<td><input type="text" name="MOBILE" id="MOBILE" value="${pd.MOBILE}" maxlength="32" placeholder="这里输入手机号" title="手机号"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">地址:</td>
				<td><input type="text" name="ADDRESS" id="ADDRESS" value="${pd.ADDRESS}" maxlength="32" placeholder="这里输入地址" title="地址"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">邮编:</td>
				<td><input type="text" name="POST_CODE" id="POST_CODE" value="${pd.POST_CODE}" maxlength="32" placeholder="这里输入邮编" title="邮编"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">物流编号:</td>
				<td><input type="text" name="LOGISTICSNUM" id="LOGISTICSNUM" value="${pd.LOGISTICSNUM}" maxlength="32" placeholder="这里输入物流编号" title="物流编号"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">备注:</td>
				<td><input type="text" name="ORDER_REMARK" id="ORDER_REMARK" value="${pd.ORDER_REMARK}" maxlength="32" placeholder="这里输入备注" title="备注"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">支付方式:</td>
				<td><input type="number" name="PAY_MODE" id="PAY_MODE" value="${pd.PAY_MODE}" maxlength="32" placeholder="这里输入支付方式" title="支付方式"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">选择物流:</td>
				<td><input type="number" name="LOGISTICS" id="LOGISTICS" value="${pd.LOGISTICS}" maxlength="32" placeholder="这里输入选择物流" title="选择物流"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">最后修改时间:</td>
				<td><input type="text" name="LAST_MODIFY" id="LAST_MODIFY" value="${pd.LAST_MODIFY}" maxlength="32" placeholder="这里输入最后修改时间" title="最后修改时间"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">状态:</td>
				<td><input type="number" name="ORDERSTATUS" id="ORDERSTATUS" value="${pd.ORDERSTATUS}" maxlength="32" placeholder="这里输入状态" title="状态"/></td>
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