<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<#list img1List as var><!--封面循环-->
	<p><img title="${var}" src="${var}"></p>
</#list>
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
<#list img3List as var><!--流程循环-->
<p><img title="${var}" src="${var}"></p>
</#list>
<h2>产品简介</h2>
<p><br>
<#list img2List as var><!--产品简介循环-->
<p><img title="${var}" src="${var}"></p>
</#list>
<br>
</p>
<br>
<br>
 
<h2>联系我们</h2>
<div class="btn">
<a class="btn" href="javascript:volid(0);" style="background-position: 10% 50%;background-size: 32px 32px;background-repeat: no-repeat;background-color: #FF0081;display: block;width: 100%;margin: 5px 0;text-align: center;color: #fff;text-shadow: 1px 1px 1px #333;border-radius: 6px;">热线咨询：客服都在帮忙打包，请自助购物，谢谢</a> 
<a class="btn" href="javascript:volid(0);" style="background-position: 10% 50%;background-size: 32px 32px;background-repeat: no-repeat;background-color: #FF0081;display: block;width: 100%;margin: 5px 0;text-align: center;color: #fff;text-shadow: 1px 1px 1px #333;border-radius: 6px;">QQ咨询：${QQ}</a> 
</div>
    </article>  

   
<article>  
<h2>客户评价</h2>


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
        <form id="form" name="form" action="${Url}" method="post" onsubmit="return postcheck()">
        <input type="hidden" name="PRODUCTS_ID" value="${PRODUCTS_ID}">
        <input type="hidden" name="PRODUCT_ANOTHERNAME" value="${PRODUCT_ANOTHERNAME}">
        <input type="hidden" name="PRODUCT_NAME" value="${PRODUCT_NAME}">
        <input type="hidden" name="MERCHANTID" value="${MERCHANTID}">
        <input type="hidden" name="CHANNELS_ID" id="CHANNELS_ID" value="">
      
        <div class="bdbox">
            <label class="bdxx"><em>*</em>产品</label>
            <div class="dxbox red">
            <#list packagesList as packages><!--套餐-->
                <label><input type="radio" name="PACKAGES_ID" value="${packages.PACKAGES_ID}-${packages.PACKAGE_NAME}" alt="${packages.PACKAGE_PRICE}"  <#if PRODUCT_UNIT = packages.PACKAGE_PRICE>checked="checked" </#if> onclick="pricea()">&nbsp;&nbsp;${packages.PACKAGE_NAME}</label><br>
            </#list>
            </div>
        </div>
<!--附加属性b-->
 
 <#if SIZE??>
                <div class="bdbox">
                    <label class="bdxx"><em>*</em>尺码</label>
                    <div class="dxbox red">
					 <#list sizeidList as sizeids><!--尺码循环-->
                    	<label><input type="radio" name="SIZE" value="${sizeids}">&nbsp;&nbsp;${sizeids}</label><br>
                    <br>
                   	</#list>
                    </div>
                </div>
 </#if>
 
 <#if COLOR??>
                <div class="bdbox">
                    <label class="bdxx"><em>*</em>颜色</label>
                    <div class="dxbox red">
					 <#list colorList as colors><!--颜色循环-->
                    	<label><input type="radio" name="COLOR" value="${colors}">&nbsp;&nbsp;${colors}</label><br>
                    <br>
                   	</#list>
                    </div>
                </div>
 </#if>
<!--附加属性e-->
        <div class="bdbox">
            <label class="bdxx"><em>*</em>姓名</label>
            <div class="textbox">
                <input type="text" name="CONSIGNEE">
            </div>
        </div>
        <div class="bdbox"  >
            <label class="bdxx"><em>*</em>数量</label>
            <a class="jian" href="javascript:;" onclick="minnumber()">-</a>
            <input type="text" class="shuliang" size="4" value="1" name="mun" id="mun" onblur="inputnumber();" readonly>
            <a class="jia" href="javascript:;" onclick="addnumber()">+</a>
        </div>
        
        <div class="bdbox">
            <label class="bdxx"><em>*</em>手机</label>
            <div class="textbox">
                <input type="text" name="MOBILE">
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
                <input type="text" name="ADDRESS">
            </div>
        </div>
        <div class="bdbox">
            <label class="bdxx"><em>*</em>金额</label>
            <div class="text3box">
                <input type="hidden" name="zfbprice" value="${PRODUCT_UNIT}">
                <input name="price" value="${PRODUCT_UNIT}" readonly style="width:80px;"> 元 <span id="zfbyh"></span>
            </div>
        </div>
        <div class="bdbox">
            <label class="bdxx"><em>*</em>付款类型</label>
            <div class="dxbox">
                <input type="radio" checked="checked" name="PAY_MODE" id="b1" value="1" onclick="return changeItem(0);"><label for="b1"><img src="images/hdfk.gif"></label>
            </div>
        </div>

        <div class="bdbox">
            <label class="bdxx">留言</label>
            <div class="text2box">
                <textarea name="ORDER_REMARK"></textarea>
            </div>
        </div>
          
        <div class="subbox">
            <input type="submit" name="submit" value="立即提交订单">
        </div>
        </form>
        <div style="clear:both;"></div>
    </div>
</div>
<script type="text/javascript" src="js/fahuo.js"></script>
<script type="text/javascript" src="js/diqu.js"></script>
<script type="text/javascript" src="js/not3.js"></script>
<!--订单-->
  </article>
   <footer>
	<p></p><center><img src="images/foot.png"></center><p></p>
	<p></p><center>${MERCHANT_NAME}</center><p></p>
   </footer>
</div><!--/page-->
 
<nav>
  <ul class="Transverse">
     <li><a href="#buy"><strong>在线下单</strong></a></li> 
	 <li><a href="javascript:volid(0);"><strong>电话咨询:${PHONE}</strong></a></li>  
  	 
  </ul>
</nav>
</body></html>