
//window.onerror = function(){return true;}
//function $(id){return document.getElementById(id);}  
//function getHeight(){$("fahuo").style.height=$("forml").offsetHeight-85+"px";}  
//window.onload = function(){getHeight();}  
/*///////////////////////////////////////// ORDERJSFGX /////////////////////////////////////////*/


//下面是新js代码


function postcheck(){ 	
	urlinfo=window.location.href; //获取当前页面的url 
	len=urlinfo.length;//获取url的长度 
	offset=urlinfo.indexOf("?");//设置参数字符串开始的位置 
	newsidinfo=urlinfo.substr(offset,len)//取出参数字符串 这里会获得类似“id=1”这样的字符串 
	newsids=newsidinfo.split("=");//对获得的参数字符串按照“=”进行分割 
	newsid=newsids[1];//得到参数值 
	if(newsid != "" && newsid !=undefined){
		document.getElementById("CHANNELS_ID").value=newsid;
	}
	
	
 try{
     var yanse = document.getElementsByName("COLOR");
     if (yanse.length != 0){
     var numa=0;
     for (var i=0; i<yanse.length; i++){
      if(yanse[i].checked) {
      numa++;
      }
     }
     if(numa==0) {
      alert("请选择要购买颜色");
      return false;
      }
      }
 }
 catch(ex){
 }

 try{
     var chicun = document.getElementsByName("SIZE");
     if (chicun.length != 0){
     var numb=0;
     for (var i=0; i<chicun.length; i++){
      if(chicun[i].checked) {
      numb++;
      }
     }
     if(numb==0) {
      alert("请选择要购买尺码");
      return false;
      }
      }
 }
 catch(ex){
 }


 /*try{
     var yanse = document.getElementsByName("chanpin1");
     if (yanse.length != 0){
     var numa=0;
     for (var i=0; i<yanse.length; i++){
      if(yanse[i].checked) {
      numa++;
      }
     }
     if(numa==0) {
      alert("还未选择【"+shuxing[0]+"】，请选择后再提交");
      return false;
      }
      }
 }
 catch(ex){
 }

 try{
     var chicun = document.getElementsByName("chanpin2");
     if (chicun.length != 0){
     var numb=0;
     for (var i=0; i<chicun.length; i++){
      if(chicun[i].checked) {
      numb++;
      }
     }
     if(numb==0) {
      alert("还未选择【"+shuxing[1]+"】，请选择后再提交");
      return false;
      }
      }
 }
 catch(ex){
 }
 
 try{
     var chicun = document.getElementsByName("chanpin3");
     if (chicun.length != 0){
     var numb=0;
     for (var i=0; i<chicun.length; i++){
      if(chicun[i].checked) {
      numb++;
      }
     }
     if(numb==0) {
      alert("还未选择【"+shuxing[2]+"】，请选择后再提交");
      return false;
      }
      }
 }
 catch(ex){
 }*/
 
 /*if (document.getElementById("zsid").value=="1") {
 alert(0);
  try{
     var chicun = document.getElementsByName("zengsong1");
     if (chicun.length != 0){
     var numb=0;
     for (var i=0; i<chicun.length; i++){
      if(chicun[i].checked) {
      numb++;
      }
     }
     if(numb==0) {
      alert("还未选择【"+zsshuxing[0]+"】，请选择后再提交");
      return false;
      }
      }
 }
 catch(ex){
 }
  try{
     var chicun = document.getElementsByName("zengsong2");
     if (chicun.length != 0){
     var numb=0;
     for (var i=0; i<chicun.length; i++){
      if(chicun[i].checked) {
      numb++;
      }
     }
     if(numb==0) {
      alert("还未选择【"+zsshuxing[1]+"】，请选择后再提交");
      return false;
      }
      }
 }
 catch(ex){
 }
  try{
     var chicun = document.getElementsByName("zengsong3");
     if (chicun.length != 0){
     var numb=0;
     for (var i=0; i<chicun.length; i++){
      if(chicun[i].checked) {
      numb++;
      }
     }
     if(numb==0) {
      alert("还未选择【"+zsshuxing[2]+"】，请选择后再提交");
      return false;
      }
      }
 }
 catch(ex){
 }
}*/



try{
		if (document.form.name.value==""){
			alert('请填写姓名！');
			document.form.CONSIGNEE.focus();
			return false;
		}
		var name = /^[\u4e00-\u9fa5]{2,6}$/;
		if (!name.test(document.form.CONSIGNEE.value)){
			alert('姓名格式不正确，请重新填写！');
			document.form.name.focus();
			return false;
		}
    }
    catch(ex){
    }
    try{
		if (document.form.MOBILE.value==""){
			alert('请填写手机号码！');
			document.form.MOBILE.focus();
			return false;
		}
		var form = /^1[3,4,5,6,7,8]\d{9}$/;
		if (!form.test(document.form.MOBILE.value)){
			alert('手机号码格式不正确，请重新填写！');
			document.form.MOBILE.focus();
			return false;
		}
    }
    catch(ex){
    } 	
    try{
		if (document.form.province.value==""){
			alert('请选择所在地区！');
			document.form.province.focus();
			return false;
		}
    }
    catch(ex){
    } 	
    try{
		if (document.form.ADDRESS.value==""){
			alert('请填写详细地址！');
			document.form.ADDRESS.focus();
			return false;
		}
    }
    catch(ex){
    } 	
   // document.form.submit.disabled = true;
   // document.form.submit.value="正在提交，请稍等 >>";
    return true;
}







try{	
new PCAS("province","city","area");
}
catch(ex){
} 	
try{	
	var thissrc = document.getElementById("yzm").src;
	function refreshCode(){
		document.getElementById("yzm").src=thissrc+"?"+Math.random(); 
	}
}
catch(ex){
} 	
/*///////////////////////////////////////// ORDERJSFGX /////////////////////////////////////////*/
function pricea(){
	var PACKAGES_ID = document.form.PACKAGES_ID.alt;
	for(var i=0;i<document.form.PACKAGES_ID.length;i++){
		if(document.form.PACKAGES_ID[i].checked==true){
			var PACKAGES_ID = document.form.PACKAGES_ID[i].alt;
			break;
		}
	}
    if(document.form.mun.value=="" || document.form.mun.value==0){	
		var mun=1;
	}
	else{
		var mun=document.form.mun.value;
	}	
	var price=PACKAGES_ID*mun;
    document.getElementById("b1").checked='checked';
	document.form.price.value=price;
	document.form.zfbprice.value=price;
	//document.getElementById("showprice").innerHTML=price;
	document.getElementById("zfbyh").innerHTML='';
}
function priceb(){
    var cpxljg = document.getElementById("product");
    var product = cpxljg.options[document.getElementById("product").options.selectedIndex].title; 
    if(document.form.mun.value=="" || document.form.mun.value==0){	
		var mun=1;
	}
	else{
		var mun=document.form.mun.value;
	}	
	var price=PACKAGES_ID*mun;
	document.getElementById("b1").checked='checked';
	document.form.price.value=price;
	document.form.zfbprice.value=price;
	//document.getElementById("showprice").innerHTML=price;
	document.getElementById("zfbyh").innerHTML='';
}

//***************************  支付宝价格  ***************************
function zfbprize(){
         sprice=document.form.zfbprice.value;
		// alert(sprice);
         document.form.price.value=(sprice*notzfbzk*0.1).toFixed(0)
}
/*///////////////////////////////////////// ORDERJSFGX /////////////////////////////////////////*/
function changeItem(i){

if (i==1) {
//document.getElementById("paydiv1").style.display = "block";
//document.getElementById("paydiv0").style.display = "none";
  if (notzfbzk != 0){
     zfbprize();
     document.getElementById("zfbyh").innerHTML='<font color=red><b><s>&nbsp;原价：'+document.form.zfbprice.value+'元&nbsp;</s>&nbsp;'+notzfbzk+'折</b></font>';
  }
}else{
//oprize1();
//document.getElementById("paydiv0").style.display = "block";
//document.getElementById("paydiv1").style.display = "none";
document.getElementById("zfbyh").innerHTML='';
document.form.price.value=document.form.zfbprice.value;
}
}

function addnumber(){
	$('#mun').val(parseInt($('#mun').val())+1);
	pricea();
}

function minnumber(){
	if($('#mun').val()>1){
	$('#mun').val(parseInt($('#mun').val())-1);
	pricea();
	}
}
function inputnumber(){
	var number=parseInt($('#mun').val());
	if(isNaN(number)||number<1){
		$('#mun').val('1');
	    pricea();
	}else{
		$('#mun').val(number);
        pricea();
	}
}


$(document).ready(function(){ 
	 $(".not3chanpin0 label").bind("click",function(){
			var o = $(this);
			if(!o.hasClass("now")){
				 $(".not3chanpin0 label").removeClass("now");
				o.addClass("now");
			}
		});
})
$(document).ready(function(){ 
	 $(".not3chanpin1 label").bind("click",function(){
			var o = $(this);
			if(!o.hasClass("now")){
				$(".not3chanpin1 label").removeClass("now");
				o.addClass("now");
			}
		});
})
$(document).ready(function(){ 
	 $(".not3chanpin2 label").bind("click",function(){
			var o = $(this);
			if(!o.hasClass("now")){
				$(".not3chanpin2 label").removeClass("now");
				o.addClass("now");
			}
		});
})
$(document).ready(function(){ 
	 $(".not3chanpin3 label").bind("click",function(){
			var o = $(this);
			if(!o.hasClass("now")){
				$(".not3chanpin3 label").removeClass("now");
				o.addClass("now");
			}
		});
})
$(document).ready(function(){ 
	 $(".zengsong1 label").bind("click",function(){
			var o = $(this);
			if(!o.hasClass("now")){
				$(".zengsong1 label").removeClass("now");
				o.addClass("now");
			}
		});
})
$(document).ready(function(){ 
	 $(".zengsong2 label").bind("click",function(){
			var o = $(this);
			if(!o.hasClass("now")){
				$(".zengsong2 label").removeClass("now");
				o.addClass("now");
			}
		});
})
$(document).ready(function(){ 
	 $(".zengsong3 label").bind("click",function(){
			var o = $(this);
			if(!o.hasClass("now")){
				$(".zengsong3 label").removeClass("now");
				o.addClass("now");
			}
		});
})
/*///////////////////////////////////////// ORDERJSFGX /////////////////////////////////////////*/
var llref = '';
if (document.referrer.length > 0){
	llref = document.referrer;
}
try{
	if (llref.length == 0 && opener.location.href.length > 0){
    llref = opener.location.href;
	}
}
catch (e){}

/*///////////////////////////////////////// ORDERJSEND /////////////////////////////////////////*/