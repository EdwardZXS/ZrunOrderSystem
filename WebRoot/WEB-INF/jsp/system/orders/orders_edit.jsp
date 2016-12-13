<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/system/include/taglib.jsp"%>
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
		/* if($("#COLOR").val()==""){
			$("#COLOR").tips({
				side:3,
	            msg:'请输入颜色',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#COLOR").focus();
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
		} */
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
		/* if($("#POST_CODE").val()==""){
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
		} */
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
		/* if($("#LOGISTICS").val()==""){
			$("#LOGISTICS").tips({
				side:3,
	            msg:'请输入选择物流',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#LOGISTICS").focus();
			return false;
		} */
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
		<input type="hidden" name="MIDS" id="MIDS" value="${pd.MIDS}"/>
		<input type="hidden" name="CHANNEL_ID" id="CHANNEL_ID" value="${pd.CHANNEL_ID}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">产品ID:</td>
				<td style="width:260px;">
				<select class="chzn-select" name="PRODUCTID" id="PRODUCTID" data-placeholder="请选择产品" style="vertical-align:top;width: 220px;">
					<option value=""></option>
					<option value="">全部</option>
					<c:forEach items="${productList}" var="products">
						<option value="${products.PRODUCTS_ID}" <c:if test="${pd.PRODUCTID eq products.PRODUCTS_ID}"> selected="selected" </c:if>>${products.PRODUCT_NAME}</option>
					</c:forEach>
			  	</select>
				<%-- <input type="number" name="PRODUCTID" id="PRODUCTID" value="${pd.PRODUCTID}" maxlength="32" placeholder="这里输入产品ID" title="产品ID"/> --%>
				</td>
			
				<td style="width:70px;text-align: right;padding-top: 13px;">套餐:</td>
				
				<td style="width:260px;">
				<input type="hidden" id="PACKAGE_PRICE" name="PACKAGE_PRICE" value=""/>
					
					<c:if test="${empty pd.PACKAGEID }">
					<select name="PACKAGES_ID" id="PACKAGES_ID" data-placeholder="请选择套餐" style="vertical-align:top;width: 220px;">		
					<option value="请选择套餐"></option>
					</select>
					</c:if>
					<c:if test="${not empty pd.PACKAGEID }">
					<select class="chzn-select" name="PACKAGES_ID" id="PACKAGES_ID" data-placeholder="请选择套餐" style="vertical-align:top;width: 220px;">
							<option value=""></option>
							<option value="">全部</option>
							<c:forEach items="${packageList}" var="mt">
								<option value="${mt.PACKAGES_ID}-${mt.PACKAGE_NAME}" <c:if test="${pd.PACKAGEID eq mt.PACKAGES_ID}"> selected="selected" </c:if>>${mt.PACKAGE_NAME}</option>
							</c:forEach>
					</select>
					</c:if>
				<%-- <input type="number" name="PACKAGEID" id="PACKAGEID" value="${pd.PACKAGEID}" maxlength="32" placeholder="这里输入套餐ID" title="套餐ID"/> --%>
				</td>
			</tr>
			<tr id="yanse">
				<td style="width:70px;text-align: right;padding-top: 13px;">颜色:</td>
				<td colspan="3">
				
				<%-- <c:if test="${empty pd.COLOR }">
				<select name="COLOR" id="COLOR" data-placeholder="请选择颜色" style="vertical-align:top;width: 220px;">		
				<option value="请选择颜色"></option>
				</select>
				</c:if>
				<c:if test="${not empty pd.COLOR }">
				<select class="chzn-select" name="COLOR" id="COLOR" data-placeholder="请选择颜色" style="vertical-align:top;width: 220px;">
						<option value=""></option>
						<option value="">全部</option>
						<c:forEach items="${fn:split(COLOR,',')}" var="ys" begin="0" end="${fn:length(fn:split(COLOR,','))}" varStatus="stat">
							<option value="${ys}" <c:if test="${pd.COLOR eq ys}"> selected="selected" </c:if>>${ys}</option>
						</c:forEach>
				</select>
				</c:if> --%>
				<input type="text" name="COLOR" id="COLOR" value="${pd.COLOR}" maxlength="32" placeholder="这里输入颜色" title="颜色"/>
				<span id="yansezhujie" style="color: red;"></span>
				</td>
			</tr>
			<tr id="chima">
				<td style="width:70px;text-align: right;padding-top: 13px;">尺码:</td>
				<td colspan="3">
				<%-- <c:if test="${empty pd.SIZE }">
				<select name="SIZE" id="SIZE" data-placeholder="请选择尺码" style="vertical-align:top;width: 220px;">		
				<option value="请选择尺码"></option>
				</select>
				</c:if>
				<c:if test="${not empty pd.SIZE }">
				<select class="chzn-select" name="SIZE" id="SIZE" data-placeholder="请选择尺码" style="vertical-align:top;width: 220px;">
						<option value=""></option>
						<option value="">全部</option>
						<c:forEach items="${fn:split(SIZE,',')}" var="cm" begin="0" end="${fn:length(fn:split(SIZE,','))}" varStatus="stat">
							<option value="${cm}" <c:if test="${pd.SIZE eq cm}"> selected="selected" </c:if>>${cm}</option>
						</c:forEach>
				</select>
				</c:if> --%>
				<input type="text" name="SIZE" id="SIZE" value="${pd.SIZE}" maxlength="32" placeholder="这里输入尺码" title="尺码"/>
				<span id="chimazhujie" style="color: red;"></span>
				</td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">件数:</td>
				<td>
				<c:if test="${msg eq 'saveJSP'}">
					<input type="number" name="QUANTITY" id="QUANTITY" value="1" maxlength="32" placeholder="这里输入件数" title="件数"/>
				</c:if>
				<c:if test="${msg eq 'edit'}">
					<input type="number" name="QUANTITY" id="QUANTITY" value="${pd.QUANTITY}" maxlength="32" placeholder="这里输入件数" title="件数"/>
				</c:if>
				</td>
			
				<td style="width:70px;text-align: right;padding-top: 13px;">订单总额:</td>
				<td><input type="number" name="AMOUNT" id="AMOUNT" value="${pd.AMOUNT}" maxlength="32" placeholder="这里输入订单总额" title="订单总额"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">收货人:</td>
				<td><input type="text" name="CONSIGNEE" id="CONSIGNEE" value="${pd.CONSIGNEE}" maxlength="32" placeholder="这里输入收货人" title="收货人"/></td>
			
				<td style="width:70px;text-align: right;padding-top: 13px;">手机号:</td>
				<td><input type="text" name="MOBILE" id="MOBILE" value="${pd.MOBILE}" maxlength="32" placeholder="这里输入手机号" title="手机号"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">地址:</td>
				<td><input type="text" name="ADDRESS" id="ADDRESS" value="${pd.ADDRESS}" maxlength="32" placeholder="这里输入地址" title="地址"/></td>
			
				<%-- <td style="width:70px;text-align: right;padding-top: 13px;">邮编:</td>
				<td><input type="text" name="POST_CODE" id="POST_CODE" value="${pd.POST_CODE}" maxlength="32" placeholder="这里输入邮编" title="邮编"/></td> --%>
			
				<td style="width:70px;text-align: right;padding-top: 13px;">物流编号:</td>
				<td><input type="text" name="LOGISTICSNUM" id="LOGISTICSNUM" value="${pd.LOGISTICSNUM}" maxlength="32" placeholder="这里输入物流编号" title="物流编号"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">支付方式:</td>
				<td colspan="3">
					<label style="float:left;padding-left: 5px;"><input name="PAY_MODE" id="form-field-radio1" onclick="setType('1');" type="radio" value="1" <c:if test="${pd.PAY_MODE eq 1 or pd.PAY_MODE=='' or pd.PAY_MODE==null}">checked="checked"</c:if>><span class="lbl">货到付款</span></label>
					<label style="float:left;padding-left: 5px;"><input name="PAY_MODE" id="form-field-radio2" onclick="setType('2');" type="radio" value="2" <c:if test="${pd.PAY_MODE eq 2}">checked="checked"</c:if>><span class="lbl">线上付款</span></label>
					
				<%-- <input type="number" name="PAY_MODE" id="PAY_MODE" value="${pd.PAY_MODE}" maxlength="32" placeholder="这里输入支付方式" title="支付方式"/> --%>
				</td>
			
				<%-- <td style="width:70px;text-align: right;padding-top: 13px;">选择物流:</td>
				<td>
				<input type="number" name="LOGISTICS" id="LOGISTICS" value="${pd.LOGISTICS}" maxlength="32" placeholder="这里输入选择物流" title="选择物流"/>
				</td> --%>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">状态:</td>
				<td colspan="3">
					<label style="float:left;padding-left: 5px;"><input name="ORDERSTATUS" id="form-field-radio3" onclick="setType('1');" type="radio" value="1" <c:if test="${pd.ORDERSTATUS eq 1 }">checked="checked"</c:if>><span class="lbl">未确认单</span></label>
					<label style="float:left;padding-left: 5px;"><input name="ORDERSTATUS" id="form-field-radio4" onclick="setType('2');" type="radio" value="2" <c:if test="${pd.ORDERSTATUS eq 2 or pd.PAY_MODE=='' or pd.PAY_MODE==null}">checked="checked"</c:if>><span class="lbl">正在出库</span></label>
					<label style="float:left;padding-left: 5px;"><input name="ORDERSTATUS" id="form-field-radio5" onclick="setType('3');" type="radio" value="3" <c:if test="${pd.ORDERSTATUS eq 3 }">checked="checked"</c:if>><span class="lbl">已发货</span></label>
					<label style="float:left;padding-left: 5px;"><input name="ORDERSTATUS" id="form-field-radio6" onclick="setType('4');" type="radio" value="4" <c:if test="${pd.ORDERSTATUS eq 4 }">checked="checked"</c:if>><span class="lbl">已收货</span></label>
					<label style="float:left;padding-left: 5px;"><input name="ORDERSTATUS" id="form-field-radio7" onclick="setType('5');" type="radio" value="5" <c:if test="${pd.ORDERSTATUS eq 5 }">checked="checked"</c:if>><span class="lbl">退货</span></label>
					<label style="float:left;padding-left: 5px;"><input name="ORDERSTATUS" id="form-field-radio8" onclick="setType('6');" type="radio" value="6" <c:if test="${pd.ORDERSTATUS eq 6 }">checked="checked"</c:if>><span class="lbl">拒收</span></label>
					<label style="float:left;padding-left: 5px;"><input name="ORDERSTATUS" id="form-field-radio9" onclick="setType('7');" type="radio" value="7" <c:if test="${pd.ORDERSTATUS eq 7 }">checked="checked"</c:if>><span class="lbl">取消</span></label>
					
				<%-- <input type="number" name="ORDERSTATUS" id="ORDERSTATUS" value="${pd.ORDERSTATUS}" maxlength="32" placeholder="这里输入状态" title="状态"/> --%>
				</td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">备注:</td>
				<td colspan="3">
				<textarea name="ORDER_REMARK" id="ORDER_REMARK" rows="10" cols="150" placeholder="这里输入描述说明" style="margin: 0px 0px 10px; width: 526px; height: 100px;">${pd.ORDER_REMARK}</textarea>
				<%-- <input type="text" name="ORDER_REMARK" id="ORDER_REMARK" value="${pd.ORDER_REMARK}" maxlength="32" placeholder="这里输入备注" title="备注"/> --%>
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
			
			//级连查询-套餐-颜色-尺码
			$("#PRODUCTID").change(function(){
             	//清空下拉框中的内容，除提示信息外
	           $("#PACKAGES_ID").empty();//套餐
	           $("#PACKAGES_ID").trigger("chosen:updated"); 
	           
	           $("#COLOR").empty();//颜色
	           $("#COLOR").trigger("chosen:updated"); 
	           
	           $("#SIZE").empty();//尺码
	           $("#SIZE").trigger("chosen:updated"); 
	             //获取选中的
	            var url1 = "<%=basePath%>orders/ajaxProduct.do?prId="+$("#PRODUCTID").val();
	           $.getJSON(url1, function(json){  
	           		
           			if(json.COLOR == ''){
           				$("#yanse").css('display','none');//block
           			}else{
           				$("#yanse").css('display','');//block
           				$("#yansezhujie").text("这里只能输入(不能含'#'符号)："+json.COLOR);
	           			$("#yansezhujie").trigger("chosen:updated"); 
           			}
           			if(json.SIZE == ''){
           				$("#chima").css('display','none');//block
           			}else{
           				$("#chima").css('display','');//block
           				$("#chimazhujie").text("这里只能输入(不能含'#'符号)："+json.SIZE);
	           			$("#chimazhujie").trigger("chosen:updated"); 
           			}
	           		
	            });  
	             //获取选中的
	            var url = "<%=basePath%>orders/ajaxPackages.do?prId="+$("#PRODUCTID").val();
	           $.getJSON(url, function(json){  
	           var opt = $("<option/>").text("请选择").attr("value", ""); 
	            $("#PACKAGES_ID").append(opt);  
	                $(json).each(function(){  
	                    //创建option对象并设置相应的文本值和value值  
	                    opt = $("<option/>").text(this.PACKAGE_NAME).attr("value", this.PACKAGES_ID+"-"+this.PACKAGE_NAME); 
	                    //将option对象添加到匹配的jQuery对象中  
	                    $("#PACKAGES_ID").append(opt);  
	                    
	                    $("#PACKAGES_ID").trigger("chosen:updated"); 
	                });  
	            });  
	         });
			//根据套餐输出单价
			$("#PACKAGES_ID").change(function(){
				if($("#PACKAGES_ID").val()==''){
					alert("请选择套餐！");
				}else{
					 var url1 = "<%=basePath%>orders/ajaxPackagesId.do?paId="+$("#PACKAGES_ID").val();
	          		 $.getJSON(url1, function(json){  
		           		
	           			if(json.PACKAGE_PRICE == ''){
	           				alert("请重新选择！");
	           			}else{
	           				$("#PACKAGE_PRICE").val(json.PACKAGE_PRICE);//单价
	           				
	           				var pabate = Math.round(json.PACKAGE_PRICE*100)/100;//单价
	           				var qubate = Math.round($("#QUANTITY").val()*100)/100;//数量
	           				var sum=Math.round(0);
	           				sum=pabate*qubate;
	           				sum.toFixed(2);
	           				$("#AMOUNT").val(sum);
	           			}
           			
           			});
				}
			});
			//根据数量输出总价
			$("#QUANTITY").click(function(){
		           		
				var pabate = Math.round($("#PACKAGE_PRICE").val()*100)/100;//单价
				var qubate = Math.round($("#QUANTITY").val()*100)/100;//数量
				var sum=Math.round(0);
				sum=pabate*qubate;
				sum.toFixed(2);
				$("#AMOUNT").val(sum);
        			
			});
			
			//默认
		
		 var url1 = "<%=basePath%>orders/ajaxPackagesId.do?paId="+$("#PACKAGES_ID").val();
      		 $.getJSON(url1, function(json){  
        		
       			if(json.PACKAGE_PRICE == ''){
       				alert("请重新选择！");
       			}else{
       				$("#PACKAGE_PRICE").val(json.PACKAGE_PRICE);//单价
       				
       				/* 
       				var pabate = Math.round(json.PACKAGE_PRICE*100)/100;//单价
       				var qubate = Math.round($("#QUANTITY").val()*100)/100;//数量
       				var sum=Math.round(0);
       				sum=pabate*qubate;
       				sum.toFixed(2);
       				$("#AMOUNT").val(sum); */
       			}
      			
      			});
	
		});
		
		
		</script>
</body>
</html>