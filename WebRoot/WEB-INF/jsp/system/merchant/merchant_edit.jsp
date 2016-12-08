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
		
		<style type="text/css">
			.radioclass {
				opacity: 0;
				cursor: pointer;
				-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
				filter: alpha(opacity=0);
			}
			.on {
				background-position: 0 0;
			}
		</style>
<script type="text/javascript">
	
	
	//保存
	function save(){
			if($("#MERCHANT_NAME").val()==""){
			$("#MERCHANT_NAME").tips({
				side:3,
	            msg:'请输入商户名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#MERCHANT_NAME").focus();
			return false;
		}
		if($("#MERCHANT_LINKMAN").val()==""){
			$("#MERCHANT_LINKMAN").tips({
				side:3,
	            msg:'请输入商户联系人',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#MERCHANT_LINKMAN").focus();
			return false;
		}
		if($("#MERCHANT_PHONE").val()==""){
			$("#MERCHANT_PHONE").tips({
				side:3,
	            msg:'请输入商户电话',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#MERCHANT_PHONE").focus();
			return false;
		}
		if($("#MERCHANT_ADDRESS").val()==""){
			$("#MERCHANT_ADDRESS").tips({
				side:3,
	            msg:'请输入商户地址',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#MERCHANT_ADDRESS").focus();
			return false;
		}
		if($("#MERCHANT_QQ").val()==""){
			$("#MERCHANT_QQ").tips({
				side:3,
	            msg:'请输入商户QQ',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#MERCHANT_QQ").focus();
			return false;
		}
		if($("#USERID").val()==""){
			$("#USERID").tips({
				side:3,
	            msg:'请输入所属销售ID',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#USERID").focus();
			return false;
		}
		if($("#EXPLAINS").val()==""){
			$("#EXPLAINS").tips({
				side:3,
	            msg:'请输入描述',
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
	<form action="merchant/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="MERCHANT_ID" id="MERCHANT_ID" value="${pd.MERCHANT_ID}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">商户名:</td>
				<td><input type="text" name="MERCHANT_NAME" id="MERCHANT_NAME" value="${pd.MERCHANT_NAME}" maxlength="32" placeholder="这里输入商户名" title="商户名"/></td>
				<td style="width:70px;text-align: right;padding-top: 13px;">商户联系人:</td>
				<td><input type="text" name="MERCHANT_LINKMAN" id="MERCHANT_LINKMAN" value="${pd.MERCHANT_LINKMAN}" maxlength="32" placeholder="这里输入商户联系人" title="商户联系人"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">商户电话:</td>
				<td><input type="text" name="MERCHANT_PHONE" id="MERCHANT_PHONE" value="${pd.MERCHANT_PHONE}" maxlength="32" placeholder="这里输入商户电话" title="商户电话"/></td>
				<td style="width:70px;text-align: right;padding-top: 13px;">商户地址:</td>
				<td><input type="text" name="MERCHANT_ADDRESS" id="MERCHANT_ADDRESS" value="${pd.MERCHANT_ADDRESS}" maxlength="32" placeholder="这里输入商户地址" title="商户地址"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">商户QQ:</td>
				<td><input type="text" name="MERCHANT_QQ" id="MERCHANT_QQ" value="${pd.MERCHANT_QQ}" maxlength="32" placeholder="这里输入商户QQ" title="商户QQ"/></td>
				<td style="width:70px;text-align: right;padding-top: 13px;">所属销售:</td>
				<td>
					<select class="chzn-select" name="USERID" id="USERID" data-placeholder="请选择销售" style="vertical-align:top;width: 220px;">
						<option value="">- 请选择 -</option>
						<c:forEach items="${userList}" var="user">
							<option value="${user.USER_ID}" <c:if test="${pd.USERID == user.USER_ID}">selected</c:if>>${user.NAME}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">商户状态:</td>
				<td colspan="3">
					<label style="float:left;padding-left: 5px;">
						<input name="MERCHANTSTATUS" id="form-field-radio1" onclick="setType('2');" type="radio" value="2" <c:if test="${pd.MERCHANTSTATUS ne 3}">checked="checked"</c:if>>
							<span class="lbl">正常</span>
					</label>
					<label style="float:left;padding-left: 5px;">
						<input name="MERCHANTSTATUS" id="form-field-radio2" onclick="setType('3');" type="radio" value="3" <c:if test="${pd.MERCHANTSTATUS eq 3}">checked="checked"</c:if>>
						<span class="lbl">异常</span>
					</label>
				</td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">描述:</td>
				<td colspan="3">
					<%--<input type="text" name="EXPLAIN" id="EXPLAIN" value="${pd.EXPLAIN}" maxlength="32" placeholder="这里输入描述" title="描述"/>--%>
					<textarea name="EXPLAINS" id="EXPLAINS" style="width:500px" rows="5">${pd.EXPLAINS}</textarea>
				</td>
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