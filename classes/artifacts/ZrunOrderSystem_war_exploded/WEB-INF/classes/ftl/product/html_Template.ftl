<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=GBK">

<meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport"> 
<meta content="yes" name="apple-mobile-web-app-capable"> 
<meta content="yes" name="apple-touch-fullscreen">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="320" name="MobileOptimized">
<meta content="telephone=no" name="format-detection">
<link rel="stylesheet" href="css/qdwap.css">
<title>${PRODUCT_NAME}</title>
<script src="js/jquery-1.11.0.min.js"></script>
<script src="js/time.lesser.js"></script>
<script src="js/demo.js"></script>
<script src="js/notorder.js"></script>
<style>
body{background: #c00000;}
#page{max-width:750px; }
</style>
</head>
 
<body>
<div id="page">
   <header>
    <h1>${PRODUCT_NAME}</h1>
   </header>
<div class="banner">
<p><img title="fengmian1.jpg" src="images/14805172005945600.jpg"></p>
</div>
    
    <section class="buy">
     <div class="row1">
       <strong>￥${PRODUCT_UNIT}</strong>
       <ol>
        <li><p>原价</p>￥${PRODUCT_PRICE}</li>
        <li><p>折扣</p>${DISCOUNT}</li>
        <li><p>节省</p>￥${SAVE}</li>
       </ol>
     </div>
     <div class="row2">
      <strong>${SALE_AMOUNT}人已购买</strong>
      <div class="djs">
                   <div class="time-count">
                        <div id="remainTime_1" class="jltimer"><span>01</span>天<span>12</span>小时<span>27</span>分<span>50</span>秒</div>
                        <script language="javascript">
                            addTimeLesser(1, 131321);
                        </script>
        </div>
       </div>             
     </div>
     <article class="des"></article>
     <a class="btn" href="#buy">立即购买</a>
    </section>  
    
  <article class="showcontent">    

<h2>抢购描述</h2>
<div class="btn">
	<p></p><p>
	<span style="font: 15px/normal 黑体, &quot;MS Sans Serif&quot;, sans-serif; color: rgb(255, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; font-size-adjust: none; font-stretch: normal; -webkit-text-stroke-width: 0px;">
	${EXPLAINS}
	</span>
	<span style="font: 15px/normal 黑体, &quot;MS Sans Serif&quot;, sans-serif; color: rgb(255, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; font-size-adjust: none; font-stretch: normal; -webkit-text-stroke-width: 0px;"></span>
	</p><p></p>
</div>

<h2>购买流程</h2>
<p><img title="" src="images/14804224099911528.jpg"></p>

<h2>产品简介</h2>
<p><br>
<#list fieldList as var>
	<img src="images/${var[2]}">
</#list>
<br>
</p>
<br>
<br>
 
<h2>联系我们</h2>
<div class="btn">
<a class="btn" href="#">热线咨询：客服都在帮忙打包，请自助购物，谢谢</a> 
<a class="btn" href="#">短信订购：${PHONE}</a> 
<a class="btn" href="#" style="background-position: 10% 50%;background-size: 32px 32px;background-repeat: no-repeat;background-color: #FF0081;display: block;width: 100%;margin: 5px 0;text-align: center;color: #fff;text-shadow: 1px 1px 1px #333;border-radius: 6px;">QQ咨询：${QQ}</a> 
</div>
    </article>  

   
<article>  
<h2>客户评价</h2>

<div class="container">  
<div style="display:none">
<iframe id="msg" name="msg" width="0" height="0"></iframe>
<div id="pingjia" class="pingjia">
   <ul class="allpj" id="allpj">
   <li class="le" style="height: 51px;">
   	<span class="touxiang"></span><img class="lj" src="images/l.png">
   	<section class="l">又是一次快乐的购物，非常满意，物美价廉。</section>
   </li>
   <li class="ri" style="height: 51px;">
   	<section class="r">很好，太值了。</section><img class="lj" src="images/r.png">
   	<span class="touxiang"></span>
   </li>
   <li class="le" style="height: 51px;">
   	<span class="touxiang"></span><img class="lj" src="images/l.png">
   	<section class="l">质量非常好，款式都很喜欢。</section>
   </li>
   <li class="ri" style="height: 51px;">
   	<section class="r">质量太好了，价格也太实惠了，这种质量的价位专柜可买不来，良心卖家，祝卖家生意兴隆，下次还要来买。</section><img class="lj" src="images/r.png">
   	<span class="touxiang"></span>
   </li>
   <li class="le" style="height: 51px;">
   	<span class="touxiang"></span><img class="lj" src="images/l.png">
   	<section class="l">老公喜欢的不得了。</section>
   </li>
   <li class="ri" style="height: 51px;">
   	<section class="r">特意穿了几天来评价的，特别好。</section><img class="lj" src="images/r.png">
   	<span class="touxiang"></span>
   </li>
   <li class="le" style="height: 51px;">
   	<span class="touxiang"></span><img class="lj" src="images/l.png">
   	<section class="l">型好看，很舒服，送人的，亲戚很喜欢，又订了几件。</section>
   </li>
   <li class="ri" style="height: 51px;">
   	<section class="r">产品已收到，拿到就给老爸，标准，质量都超级好，上档次，准备再订购两件。</section><img class="lj" src="images/r.png">
   	<span class="touxiang"></span>
   </li>
   <li class="le" style="height: 51px;">
   	<span class="touxiang"></span><img class="lj" src="images/l.png">
   	<section class="l">宝贝收到了和图片一致，老公很满意，客服也很好，咨询了半天都不耐烦的一一解答，谢谢服务业的亲们，</section>
   </li>
   <li class="ri" style="height: 51px;">
   	<section class="r">收到货就到我们这商场的专柜比对了一下，质量跟专柜的一模一样的，是正品，专柜卖的价格太高，这太划算了，果断的又购了几件送给亲戚。</section><img class="lj" src="images/r.png">
   	<span class="touxiang"></span>
   </li>
   <li class="le" style="height: 51px;">
   	<span class="touxiang"></span><img class="lj" src="images/l.png">
   	<section class="l">质量特别棒，和图片一样哦，物超所值。</section>
   </li>
   <li class="ri" style="height: 51px;">
   	<section class="r">宝贝已经收到，真的是太值了。质量非常好。</section><img class="lj" src="images/r.png">
   	<span class="touxiang"></span>
   </li>
   <li class="le" style="height: 51px;">
   	<span class="touxiang"></span><img class="lj" src="images/l.png">
   	<section class="l">产品和图片一致，面料很好，穿上合适，下次还会光顾。。</section>
   </li>
   <li class="ri" style="height: 51px;">
   	<section class="r">质量真不错，非常喜欢，妈妈说你终于买了个好的了，哈哈，谢谢店家。</section><img class="lj" src="images/r.png">
   	<span class="touxiang"></span>
   </li>
   <li class="le" style="height: 51px;">
   	<span class="touxiang"></span><img class="lj" src="images/l.png">
   	<section class="l">朋友看了也喜欢，呵呵，祝店家生意兴隆。。</section>
   </li>
   <li class="ri" style="height: 51px;">
   	<section class="r">很喜欢，质量太好了，价格也太实惠了，这种质量专柜都是买很贵呢，良心卖家，祝卖家生意兴隆，下次还要来买。</section><img class="lj" src="images/r.png">
   	<span class="touxiang"></span>
   </li>
<li class="ri">
	<section class="r">产品很好,大方,不错,价格实惠。</section><img class="lj" src="images/r.png">
	<span class="touxiang"></span>
</li>
<li class="le">
	<span class="touxiang"></span><img class="lj" src="images/l.png">
	<section class="l">呵呵刚好到外地还好赶上了，给五星质量很好，很满意！</section>
</li>
<li class="ri">
	<section class="r">又是一次快乐的购物物美价廉。</section><img class="lj" src="images/r.png">
	<span class="touxiang"></span>
</li>
<li class="le">
	<span class="touxiang"></span><img class="lj" src="images/l.png">
	<section class="l">不错,价格实惠。</section>
</li>
<li class="ri">
	<section class="r">给五星质量很好，很满意！</section><img class="lj" src="images/r.png">
	<span class="touxiang"></span>
</li>
    </ul>
</div>
</article>
  

     <article id="buy">
     <h2>订单信息</h2>
<!--订单-->
<div id="order"><script>var notzfbzk="0";</script>
    <div class="warp">
    ${BAK10}
    </div>
    <div class="warp">
        <form id="form" name="form" action="http://www.wangju580.com/notorder.asp" method="post" onsubmit="return postcheck()">
        <input type="hidden" name="PRODUCT_ID" value="${PRODUCT_ID}">
      
        <div class="bdbox">
            <label class="bdxx"><em>*</em>产品</label>
            <div class="dxbox red">
            <#list fieldList as var><!--套餐-->
                <label><input type="radio" name="PACKAGE_ID" value="${PACKAGE_ID}" alt="${PACKAGE_PRICE}" checked="" onclick="pricea()">${PACKAGE_NAME}</label><br>
            </#list>
            </div>
        </div>
<!--附加属性b-->
 
 <#if ${SIZEID} != null>
                <div class="bdbox">
                    <label class="bdxx"><em>*</em>尺码</label>
                    <div class="dxbox red">
					 <#list fieldList as var><!--尺码循环-->
                    	<label><input type="radio" name="chicun" value=" 185/XXL码(170斤以下）">&nbsp;&nbsp; 185/XXL码(170斤以下）</label><br>
                    <br>
                   	</#list>
                    </div>
                </div>
 </#if>
 
 <#if ${COLOUR} != null>
                <div class="bdbox">
                    <label class="bdxx"><em>*</em>颜色</label>
                    <div class="dxbox red">
					 <#list fieldList as var><!--颜色循环-->
                    	<label><input type="radio" name="chicun" value=" 185/XXL码(170斤以下）">&nbsp;&nbsp; 185/XXL码(170斤以下）</label><br>
                    <br>
                   	</#list>
                    </div>
                </div>
 </#if>
<!--附加属性e-->
        <div class="bdbox">
            <label class="bdxx"><em>*</em>姓名</label>
            <div class="textbox">
                <input type="text" name="name">
            </div>
        </div>
        <div class="bdbox">
            <label class="bdxx"><em>*</em>手机</label>
            <div class="textbox">
                <input type="text" name="mob">
            </div>
        </div>
        <div class="bdbox">
            <label class="bdxx"><em>*</em>地区</label>
            <div class="xlbox">
                <select name="province" class="dqxl"><option value="">选省份</option><option value="北京市">北京市</option><option value="天津市">天津市</option><option value="河北省">河北省</option><option value="山西省">山西省</option><option value="内蒙古自治区">内蒙古自治区</option><option value="辽宁省">辽宁省</option><option value="吉林省">吉林省</option><option value="黑龙江省">黑龙江省</option><option value="上海市">上海市</option><option value="江苏省">江苏省</option><option value="浙江省">浙江省</option><option value="安徽省">安徽省</option><option value="福建省">福建省</option><option value="江西省">江西省</option><option value="山东省">山东省</option><option value="河南省">河南省</option><option value="湖北省">湖北省</option><option value="湖南省">湖南省</option><option value="广东省">广东省</option><option value="广西壮族自治区">广西壮族自治区</option><option value="海南省">海南省</option><option value="重庆市">重庆市</option><option value="四川省">四川省</option><option value="贵州省">贵州省</option><option value="云南省">云南省</option><option value="西藏自治区">西藏自治区</option><option value="陕西省">陕西省</option><option value="甘肃省">甘肃省</option><option value="青海省">青海省</option><option value="宁夏回族自治区">宁夏回族自治区</option><option value="新疆维吾尔自治区">新疆维吾尔自治区</option><option value="香港特别行政区">香港特别行政区</option><option value="澳门特别行政区">澳门特别行政区</option><option value="台湾省">台湾省</option></select><select name="city" class="dqxl"><option value="">选城市</option></select><select name="area" class="dqxl"><option value="">选地区</option></select>
            </div>
        </div>
        <div class="bdbox">
            <label class="bdxx"><em>*</em>地址</label>
            <div class="textbox">
                <input type="text" name="address">
            </div>
        </div>
        <div class="bdbox">
            <label class="bdxx"><em>*</em>金额</label>
            <div class="text3box">
                <input type="hidden" name="zfbprice" value="369">
                <input name="price" value="369" readonly style="width:80px;"> 元 <span id="zfbyh"></span>
            </div>
        </div>
        <div class="bdbox">
            <label class="bdxx"><em>*</em>付款</label>
            <div class="dxbox">
                <input type="radio" checked="checked" name="pay" id="b1" value="cod" onclick="return changeItem(0);"><label for="b1"><img src="images/hdfk.gif"></label>
                
             
            </div>
        </div>

        <div class="bdbox">
            <label class="bdxx">留言</label>
            <div class="text2box">
                <textarea name="guest"></textarea>
            </div>
        </div>
          
        <script>getfrom();</script><input type="hidden" name="fromurl" value="http://www.sina.com.cn/"><input type="hidden" name="nowurl" value="http://www.wangju580.com/demo_index.asp?gzid=a4"><input type="hidden" name="keyword" value=""><input type="hidden" name="gzid" value="a4">
        <div class="subbox">
            <input type="submit" name="submit" value="立即提交订单">
        </div>
        </form>
        <div style="clear:both;"></div>
    </div>
</div>
<script>
var not3chanpin=new Array("8507藏青色加棉","8503深灰色加绒 ");
var not3yanse=new Array();
var not3chima=new Array(" 170/M码(120斤以下）","  175/L码(135斤以下）","  180/XL码(150斤以下）","  185/XXL码(170斤以下）","  190/XXXL码(180斤以下)","  ");
</script>
<div id="fahuo">
<script type="text/javascript" src="js/fahuo.js"></script>
</div>
<script type="text/javascript" src="js/diqu.js"></script>
<script type="text/javascript" src="js/not3.js"></script>
<!--订单-->
  </article>
   <footer>
	<p></p><center><img src="images/foot.png"></center><p></p>
	<p></p><center>花花公子国际加绒夹克旗舰店</center><p></p>
   </footer>
</div><!--/page-->
 
<nav>
  <ul class="Transverse">
     <li><a href="#buy"><strong>在线下单</strong></a></li> 
	 <li><a href="tel:010-12345678"><strong>电话咨询</strong></a></li>  
  	 <li><a href="sms:000000"><strong>短信订购</strong></a></li>
  </ul>
</nav>
</body></html>