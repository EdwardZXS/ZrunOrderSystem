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
		
		if($("#MERCHANTID").val()==""){
			$("#MERCHANTID").tips({
				side:3,
	            msg:'请输入产品名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#MERCHANTID").focus();
			return false;
		}
		
		if($("#USER_ID").val()==""){
			$("#USER_ID").tips({
				side:3,
	            msg:'请输入产品名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#USER_ID").focus();
			return false;
		}
		
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
		
		var reg1 = /^#.*/;
		var reg2 = /.*#$/;
		
		if(reg1.test($("#SIZE").val())||reg2.test($("#SIZE").val())){
			$("#SIZE").tips({
				side:3,
	            msg:'输入尺寸格式不对(不能以#开头或结尾)',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#SIZE").focus();
			return false;
		}
			
		if(reg1.test($("#COLOR").val())||reg2.test($("#COLOR").val())){
			$("#COLOR").tips({
				side:3,
	            msg:'输入颜色格式不对(不能以#开头或结尾)',
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
		if($("#DATETIMES").val()==""){
			$("#DATETIMES").tips({
				side:3,
	            msg:'请输入倒计时天数',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#DATETIMES").focus();
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
				<td style="width:70px;text-align: right;padding-top: 13px;">所属商户:</td>
				<td>
					<%-- <input type="text" name="PRODUCT_NAME" id="PRODUCT_NAME" value="${pd.PRODUCT_NAME}" maxlength="32" placeholder="这里输入产品名称" title="产品名称"/> --%>
					<select class="chzn-select" name="MERCHANTID" id="MERCHANTID" data-placeholder="请选择所属商户" style="vertical-align:top;width: 220px;">
						<option value=""></option>
						<option value="">全部</option>
						<c:forEach items="${merchList}" var="merch">
							<option value="${merch.MERCHANT_ID}" <c:if test="${pd.MERCHANTID == merch.MERCHANT_ID}">selected</c:if>>${merch.MERCHANT_NAME}</option>
						</c:forEach>
					</select>
				</td>
				<td style="width:70px;text-align: right;padding-top: 13px;">创建人员:</td>
				<td>
					<%-- <input type="text" name="PRODUCT_ANOTHERNAME" id="PRODUCT_ANOTHERNAME" value="${pd.PRODUCT_ANOTHERNAME}" maxlength="32" placeholder="这里输入产品别名" title="产品别名"/> --%>
					<select class="chzn-select" name="USERID" id="USERID" data-placeholder="请选择创建人员" style="vertical-align:top;width: 220px;">
						<option value=""></option>
						<option value="">全部</option>
						<c:forEach items="${userList}" var="user">
							<option value="${user.USER_ID}" <c:if test="${pd.USERID == user.USER_ID}">selected</c:if>>${user.NAME}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">产品名称:</td>
				<td><input type="text" name="PRODUCT_NAME" id="PRODUCT_NAME" value="${pd.PRODUCT_NAME}" maxlength="32" placeholder="这里输入产品名称" title="产品名称"/></td>
				<td style="width:70px;text-align: right;padding-top: 13px;">产品别名:</td>
				<td><input type="text" onblur=IsLetter()  name="PRODUCT_ANOTHERNAME" id="PRODUCT_ANOTHERNAME" value="${pd.PRODUCT_ANOTHERNAME}" maxlength="32" placeholder="这里输入产品别名" title="别名仅允许拼音"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">产品类型:</td>
				<%-- <td><input type="text" name="ZD_ID" id="ZD_ID" value="${pd.ZD_ID}" maxlength="32" placeholder="这里输入产品类型" title="产品类型"/></td> --%>
				<td>
					<%-- <input type="text" name="USERID" id="USERID" value="${pd.USERID}" maxlength="32" placeholder="这里输入所属销售ID" title="所属销售ID"/> --%>
					<select class="chzn-select" name="ZD_ID" id="ZD_ID" data-placeholder="请选择产品类型" style="vertical-align:top;width: 220px;">
						<option value=""></option>
						<option value="">全部</option>
						<c:forEach items="${dictList}" var="dict">
							<option value="${dict.ZD_ID}" <c:if test="${pd.ZD_ID == dict.ZD_ID}">selected</c:if>>${dict.NAME}</option>
						</c:forEach>
					</select>
				</td>
				<td style="width:70px;text-align: right;padding-top: 13px;">产品单价:</td>
				<td><input type="number" onkeyup=getDiscount() name="PRODUCT_PRICE" id="PRODUCT_PRICE" value="${pd.PRODUCT_PRICE}" maxlength="32" placeholder="这里输入产品单价" title="产品单价"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">现销售价:</td>
				<td><input type="number" onkeyup=getDiscount() name="PRODUCT_UNIT" id="PRODUCT_UNIT" value="${pd.PRODUCT_UNIT}" maxlength="32" placeholder="这里输入现销售价" title="现销售价"/></td>
				<td style="width:70px;text-align: right;padding-top: 13px;">折扣:</td>
				<td><input type="text" name="DISCOUNT" id="DISCOUNT" value="${pd.DISCOUNT}" maxlength="32" placeholder="这里输入产品折扣" title="折扣" readonly="readonly"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">尺码:</td>
				<td><input type="text" name="SIZE" id="SIZE" value="${pd.SIZE}" maxlength="32" placeholder="这里输入尺码" title="尺码不能以#号开头或结尾"/></td>
				<td style="width:70px;text-align: right;padding-top: 13px;">颜色:</td>
				<td><input type="text" name="COLOR" id="COLOR" value="${pd.COLOR}" maxlength="32" placeholder="这里输入颜色" title="颜色不能以#号开头或结尾"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">销量:</td>
				<td><input type="text" name="SALE_AMOUNT" id="SALE_AMOUNT" value="${pd.SALE_AMOUNT}" maxlength="32" placeholder="这里输入销量" title="销量"/></td>
				<td style="width:70px;text-align: right;padding-top: 13px;">库存:</td>
				<td><input type="text" name="STOCK" id="STOCK" value="${pd.STOCK}" maxlength="32" placeholder="这里输入库存" title="库存"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">商品状态:</td>
				<td colspan="3">
					<label style="float:left;padding-left: 5px;">
						<input name="PRODUCTSTATUS" id="form-field-radio1" onclick="setType('1');" type="radio" value="1" <c:if test="${pd.PRODUCTSTATUS ne 2 && pd.PRODUCTSTATUS ne 3}">checked="checked"</c:if>>
							<span class="lbl">未生成</span>
					</label>
					<label style="float:left;padding-left: 5px;">
						<input name="PRODUCTSTATUS" id="form-field-radio2" onclick="setType('2');" type="radio" value="2" <c:if test="${pd.PRODUCTSTATUS eq 2}">checked="checked"</c:if>>
						<span class="lbl">正常</span>
					</label>
					<label style="float:left;padding-left: 5px;">
						<input name="PRODUCTSTATUS" id="form-field-radio3" onclick="setType('3');" type="radio" value="3" <c:if test="${pd.PRODUCTSTATUS eq 3}">checked="checked"</c:if>>
						<span class="lbl">下架</span>
					</label>
				</td>
			</tr>
			<tr>
				<td>倒计时(天)</td>
				<td colspan="3"><input type="text" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onafterpaste="this.value=this.value.replace(/[^0-9]/g,'')" name="DATETIMES" id="DATETIMES" value="${pd.DATETIMES}" maxlength="32" placeholder="这里输入倒计时(天)" title="倒计时(天)"/></td>
			</tr>
			<tr>
			<tr>
				<c:if test="${msg eq 'save'}">
					<td style="width:70px;text-align: right;padding-top: 13px;">添加图片:</td>
				<td colspan="3">
				<table style="width: 100%;">
					<tr>
					<td width="100px">
					<a href="#myModal" onclick="uploadfiles('imgs1','path1');" role="button" class="btn" data-toggle="modal">商品封面</a>
					</td>
					<td>
					<div id="imgs1"></div><input style="float: left;" type="text" id="path1" name="path1" value=""/>
					<span class="widget-toolbar" style="line-height:7px;padding:0px;"><a data-action="close" onclick="deleInput('path1');" title="清空" ><i class="icon-remove"></i></a></span>
					</td>
					<td rowspan="3" width="130px"><span style="color: red;">如果修改图片请先清空输入框，再重新选择!!!</span></td>
					</tr>
					<tr>
					<td>
					<a href="#myModal" onclick="uploadfiles('imgs2','path2');" role="button" class="btn" data-toggle="modal">物流信息</a>
					</td>
					<td>
					<div id="imgs2"></div><input type="text" id="path2" name="path2" value=""/>
					<span class="widget-toolbar" style="line-height:7px;padding:0px;"><a data-action="close" onclick="deleInput('path2');" title="清空" ><i class="icon-remove"></i></a></span>
					</td>
					</tr>
					<tr>
					<td>
					<a href="#myModal" onclick="uploadfiles('imgs3','path3');" role="button" class="btn" data-toggle="modal">商品介绍</a>
					</td>
					<td>
					<div id="imgs3"></div><input type="text" id="path3" name="path3" value=""/>
					<span class="widget-toolbar" style="line-height:7px;padding:0px;"><a data-action="close" onclick="deleInput('path3');" title="清空" ><i class="icon-remove"></i></a></span>
					</td>
					</tr>
				</table>
				</td>
					
				</c:if>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">产品描述:</td>
				<%-- <td><input type="text" name="EXPLAINS" id="EXPLAINS" value="${pd.EXPLAINS}" maxlength="32" placeholder="这里输入产品描述" title="产品描述"/></td> --%>
				<td colspan="3">
					<textarea name="EXPLAINS" id="EXPLAINS" style="width:500px" rows="5">${pd.EXPLAINS}</textarea>
				</td>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="10">
					<c:if test="${msg eq 'edit'}">
						<a class="btn btn-mini btn-primary" target="_blank"  href="productsAddHtml/jspProducts.do?PRODUCTS_ID=${pd.PRODUCTS_ID}">预览</a>
					</c:if>
					<a class="btn btn-mini btn-success" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		
		 <!-- Modal -->
        <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="myModalLabel">Modal header</h3>
            </div>
            <div class="modal-body">
               <div id="imgsList"><ul id="imgsul"><li></li></ul></div>
               
               <div class="">
				<table style="width:100%;">
					<tr>
						<td style="vertical-align:top;">
						<div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">
							<a href="javascript:;" onclick="uploadfiles2('B')">上页</a><span id="dangqian">1</span><a href="javascript:;" onclick="uploadfiles2('A')">下页</a>
						</div></td>
					</tr>
				</table>
			</div>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                <button class="btn"  data-dismiss="modal" aria-hidden="true">Save</button>
            </div>
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
		
		<script type="text/javascript" src="static/js/dhc/layer.js"></script><!-- 选中效果 -->
		<link rel="stylesheet" href="static/js/dhc/layui.css" media="all"><!-- 选中效果 -->
		
		<script type="text/javascript">
		$(top.hangge());
		$(function() {
			
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
		//点击
			$('#imgsul').delegate('li','click',function(){
		  //如果点击后则状态不一样
		  if($(this).hasClass("selected")){
		  	$(this).attr("class","");
			var p=$("#imgsul").attr("title");
			if(p == 'path3'){
				var p3 = $("#"+p).val();//原有path
			  	//判断数组
			  	var obj2=p3.split(";");  
			  	//根据数组删除对应path
			  	alert(obj2.length);
			  	if(obj2.length>1){
			  		var ps = $(this).attr("id");//取消的id path
					p3=p3.replace(";"+ps,"");
					$("#"+p).val(p3);
			  	}else{
			  		var ps = $(this).attr("id");//取消的id path
					p3=p3.replace(ps,"");
					$("#"+p).val(p3);
			  	}
			  	
			   }else{
			  	 var p3=$("#"+p).val();//原有path
			  	 var ps = $(this).attr("id");//取消的id path
			  	 p3=p3.replace(ps,"");
			  	 $("#"+p).val(p3);
			   }
		   }else{
			$(this).attr("class","selected");
		   	 //这是赋值
			var p=$("#imgsul").attr("title");//哪个input名
			if(p == 'path3'){
				var p3 = $("#"+p).val();
			  	if(p3 == ''){
			  		p3=$(this).attr("id");//选中的id
			  	}else{
			  		p3+=";"+$(this).attr("id");
			  	}
			  	$("#"+p).val(p3);
			   }else{
			  	 $("#"+p).val($(this).attr("id"));
			   }
		   }
		    $("input").trigger("chosen:updated"); 
			});
		});
		
		// 判断输入的字符是否为英文字母    
		function IsLetter(){
			var str = document.getElementById('PRODUCT_ANOTHERNAME').value.trim();
			var url1 = "<%=basePath%>products/ajaxCheckAName.do?prAName="+$("#PRODUCT_ANOTHERNAME").val();
			if(str.length!=0){    
			reg=/^[a-zA-Z]+$/;     
			if(!reg.test(str)){// 判断别名是否为英文    
				$("#PRODUCT_ANOTHERNAME").tips({
					side:3,
		            msg:'别名仅允许为英文...',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PRODUCT_ANOTHERNAME").focus();
			}else {// 别名为英文,判断别名是否重复
				 $.getJSON(url1, function(json){  
		          		
		       			if(json.RESULT == 'NO'){// 重复不可用
		       				$("#PRODUCT_ANOTHERNAME").tips({
		    					side:3,
		    		            msg:'商品别名不可用',
		    		            bg:'#AE81FF',
		    		            time:2
		    		        });
		    				$("#PRODUCT_ANOTHERNAME").focus();
		       			}
		           });  
			}    
		}
		}     
		
		// 判断现销售价与产品单价
		function getDiscount(){
			var price = document.getElementById('PRODUCT_PRICE').value.trim(); 
			var unit = document.getElementById('PRODUCT_UNIT').value.trim(); 
			
			if(price != null && price != '' && unit != null && unit != ''){
				if(parseInt(unit) > parseInt(price)) {
					$("#PRODUCT_UNIT").tips({
						side:3,
			            msg:'现销售价需小于产品单价...',
			            bg:'#AE81FF',
			            time:2
			        });
					$("#PRODUCT_UNIT").focus();
				}
				
				if(price != null && price != '' && unit != null && unit != ''){
					var var1 = (unit*10 / price)+"";
					var var2 = var1.substring(0,3);
					$("#DISCOUNT").val(var2);
				}
			}
		}
		
		// 上传图片
		function uploadfile(type){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>imgs/goAdd.do';
			 diag.Width = 800;
			 diag.Height = 490;
			 diag.CancelEvent = function(){ //关闭事件
				 if('${page.currentPage}' == '0'){
					 top.jzts();
					 setTimeout("self.location=self.location",100);
				 }else{
					 nextPage(${page.currentPage});
				 }
				diag.close();
			 };
			 diag.show();
		}
		function deleInput(id){
			$("#"+id).val("");
			$("#"+id).trigger("chosen:updated"); 
		}
		// 选择图片
		function uploadfiles(imgs,paths){
		
	             //获取选中的
	            var url1 = "products/ajaxImg.do";
	          // top.jzts();
	           $("#imgsul").attr("title",paths);
	          $("#imgsul li").remove();
				$.ajax({
					type: "POST",
					url: url1,
					data:{pss:1},
					dataType:'json',
					//beforeSend: validateData,
					cache: false,
					//需要加个date:页数
					success: function(data){
						
						for ( var int = 0; int < data.length; int++) {
							var path = data[int].PATH;
							
							//alert(path);
							var imgpath="<div class='photo_list_img'><img width:50px;height:70px; src='html/product/"+path+"' /></div><div class='photo_list_selected'><div class='selected_mask_inner'></div><div class='selected_mask_icon'></div></div>";
							$("#imgsul").append(" <li id="+path+" style='list-style-type:none;float:left;'  value=html/product/"+path+">"+imgpath+"</li>");
							//onclick='clicksimg1('"+path+"')'
						}
							 $("#imgsul").trigger("chosen:updated"); 
					}
				}); 
	            
		}
		// 上下页图片
		function uploadfiles2(pasr){
		alert(pasr);
		var dang = parseInt($("#dangqian").text());
		if(dang == ''){
			dang=1;
		}
		if(pasr == 'A'){
			dang+=1;
		}
			if(pasr == 'B'){
				if(dang>1){
					dang-=1;
				}
			}
	             //获取选中的
	            var url1 = "products/ajaxImg.do";
	          $("#imgsul li").remove();
				$.ajax({
					type: "POST",
					url: url1,
					dataType:'json',
					//beforeSend: validateData,
					cache: false,
					//需要加个date:页数
					data:{"pss":dang},
					success: function(data){
						$("#dangqian").text(dang);
						 $("#dangqian").trigger("chosen:updated"); 
						for ( var int = 0; int < data.length; int++) {
							var path = data[int].PATH;
							
							//alert(path);
							var imgpath="<div class='photo_list_img'><img width:50px;height:70px; src='html/product/"+path+"' /></div><div class='photo_list_selected'><div class='selected_mask_inner'></div><div class='selected_mask_icon'></div></div>";
							$("#imgsul").append(" <li id="+path+" style='list-style-type:none;float:left;'  value=html/product/"+path+">"+imgpath+"</li>");
							//onclick='clicksimg1('"+path+"')'
						}
							 $("#imgsul").trigger("chosen:updated"); 
					}
				}); 
	            
		}
		
		
	
		</script>
</body>
</html>