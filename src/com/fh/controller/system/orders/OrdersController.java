package com.fh.controller.system.orders;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpResponse;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.util.AppUtil;
import com.fh.util.DateUtil2;
import com.fh.util.ObjectExcelView;
import com.fh.util.Const;
import com.fh.util.PageData;
import com.fh.util.SmsUtil;
import com.fh.util.Tools;
import com.fh.util.Jurisdiction;
import com.fh.service.system.dictionaries.DictionariesService;
import com.fh.service.system.orders.OrdersService;
import com.fh.service.system.packages.PackagesService;
import com.fh.service.system.products.ProductsService;
import com.google.gson.Gson;

/** 
 * 类名称：OrdersController
 * 创建人：DHC 
 * 创建时间：2016-12-01
 */
@Controller
@RequestMapping(value="/orders")
public class OrdersController extends BaseController {
	
	String menuUrl = "orders/list.do"; //菜单地址(权限用)
	@Resource(name="ordersService")
	private OrdersService ordersService;
	@Resource(name="productsService")
	private ProductsService productsService;
	@Resource(name="packagesService")
	private PackagesService packagesService;
	@Resource(name="dictionariesService")
	private DictionariesService dictionariesService;
	
	/**
	 * html新增
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public synchronized void save(HttpServletResponse response) throws Exception{
		logBefore(logger, "html新增Orders");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		/*
		 * 用户ip
		 */
		
		HttpServletRequest request = this.getRequest();
		String ip = "";
		if (request.getHeader("x-forwarded-for") == null) {  
			ip = request.getRemoteAddr();  
	    }else{
	    	ip = request.getHeader("x-forwarded-for");  
	    }
		pd.put("IP", ip);//用户ip
		/*
		 * 赋值
		 */
		//套餐拆分
		//System.out.println(pd.get("PACKAGEID").toString());
		String packages[]=pd.get("PACKAGES_ID").toString().split("-");
		pd.put("PACKAGEID",packages[0]);
		pd.put("PACKAGENAME",packages[1]);
		
		pd.put("PRODUCTID", pd.get("PRODUCTS_ID"));//产品id
		pd.put("QUANTITY", pd.get("mun"));//数量
		if(pd.get("price").toString().equals(pd.get("zfbprice").toString())){
			pd.put("AMOUNT", pd.get("price"));//金额
		}else{
			String url="../"+Const.HTMLPATH+"error.html";
			response.sendRedirect(url);
		}
		//pd.put("ORDERS_ID", this.get32UUID());	//主键
		pd.put("INPUTDATE", DateUtil2.getNowDateTime());	//录入日期
		pd.put("LAST_MODIFY", DateUtil2.getNowDateTime());	//录入日期
		pd.put("ORDERSTATUS",1);	//状态1:下单未确认 2:已确认正在出库 3:已发货 4:已收货 5:退货 6拒收 7取消
		//HOUR_OF_DAY  这是小时
		//pd.put("BAK40", DateUtil2.getTimeStamp("yyyy-MM-dd HH:mm:ss",DateUtil2.getDateFromNow(Calendar.DAY_OF_YEAR, 1, "yyyy-MM-dd HH:mm:ss")));	//有效时间戳+1天（24小时）
		pd.put("BAK40", DateUtil2.getDateFromNow(Calendar.DAY_OF_YEAR, 1, "yyyy-MM-dd HH:mm:ss"));	//有效时间戳+1天（24小时）
		
		StringBuffer sbaddress=new StringBuffer();
		sbaddress.append(pd.get("province").toString());
		sbaddress.append(pd.get("city").toString());
		sbaddress.append(pd.get("area").toString());
		sbaddress.append(pd.get("ADDRESS").toString());
		pd.put("ADDRESS", sbaddress.toString());
		ordersService.save(pd);
		
		/**
		 * 短信验证发送
		 */
		//1.先查询是否短信确认订单开启
		PageData pddiction = new PageData();
		pddiction.put("ZD_ID", "e2426bac58984776a56c21fdc136b9e2");
		pddiction = dictionariesService.findById(pddiction);
		if(pddiction.get("DVALUES").toString().equals("1")){
			
			//查询要显示的内容
			pddiction = new PageData();
			pddiction.put("ZD_ID", "aa7c4fb55ceb486ba73541f79e028a73");
			pddiction = dictionariesService.findById(pddiction);
			/**
			 * 短信内容签名
			 */
			//查询是否发货短信开启
			/*pddiction.put("ZD_ID", "27a3f302d50e436e95607017560fdc85");
			pddiction = dictionariesService.findById(pddiction);
			String sbstr = pddiction.getString("DVALUES");*/
			////////////////////////////////////////////////////////////////////////////////
			//替换文字
			String sbstr = pddiction.getString("DVALUES");
			sbstr = sbstr.replaceAll("#PRODUCTS", pd.getString("PRODUCT_NAME"));
			
			String str = SmsUtil.sendSms1(pd.getString("MOBILE"), sbstr);		//调用发短信函数1
			logBefore(logger, "*****短信发送状态："+str);
			if(str.indexOf("ok") != -1){
				String str2[]=str.split(":");
				pd.put("MIDS", str2[1]);
			}else{
				pd.put("MIDS", str);
			}
			ordersService.edit(pd);
			
		}
		
		//String url="../"+Const.HTMLPATH+pd.getString("PRODUCT_ANOTHERNAME")+".html";//这是跳转回产品页面
		String url="../"+Const.HTMLPATH+"success.html";
		response.sendRedirect(url);
	}
	
	/**
	 * jsp新增
	 * @throws Exception
	 */
	@RequestMapping(value="/saveJSP")
	public synchronized ModelAndView saveJSP() throws Exception{
		logBefore(logger, "jsp新增Orders");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = null;
		pd = this.getPageData();
		
		//套餐拆分
		String packages[]=pd.get("PACKAGES_ID").toString().split("-");
		pd.put("PACKAGEID",packages[0]);
		pd.put("PACKAGENAME",packages[1]);
		
		//查询属商户
		pd.put("PRODUCTS_ID",pd.get("PRODUCTID"));
		PageData pdm = productsService.findById(pd);
		pd.put("MERCHANTID", pdm.get("MERCHANTID"));
		
		pd.put("IP", "127.0.0.1");//用户ip
		pd.put("INPUTDATE", DateUtil2.getNowDateTime());	//录入日期
		pd.put("LAST_MODIFY", DateUtil2.getNowDateTime());	//录入日期
		//pd.put("ORDERSTATUS",2);	//状态1:下单未确认 2:已确认正在出库 3:已发货 4:已收货 5:退货 6拒收 7取消
		//HOUR_OF_DAY  这是小时
		pd.put("BAK40", DateUtil2.getDateFromNow(Calendar.DAY_OF_YEAR, 1, "yyyy-MM-dd HH:mm:ss"));	//有效时间戳+1天（24小时）
		
		ordersService.save(pd);
		
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out){
		logBefore(logger, "删除Orders");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			ordersService.delete(pd);
			out.write("success");
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, "修改Orders");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//套餐拆分
		String packages[]=pd.get("PACKAGES_ID").toString().split("-");
		pd.put("PACKAGEID",packages[0]);
		pd.put("PACKAGENAME",packages[1]);
		
		//查询属商户
		pd.put("PRODUCTS_ID",pd.get("PRODUCTID"));
		PageData pdm = productsService.findById(pd);
		pd.put("MERCHANTID", pdm.get("MERCHANTID"));
				
		pd.put("LAST_MODIFY", DateUtil2.getNowDateTime());	//修改日期
		
		ordersService.edit(pd);
		
		/**
		 * 如果等于“已发货”则发送短信提示
		 */
		if(pd.get("ORDERSTATUS").toString().equals("3")){
			
			//查询是否发货短信开启
			PageData pddiction = new PageData();
			pddiction.put("ZD_ID", "d4ecbd73a4ad46c2a0cc77f8deb674fb");
			pddiction = dictionariesService.findById(pddiction);
			if(pddiction.get("DVALUES").toString().equals("1")){
				
				//查询要显示的内容
				pddiction = new PageData();
				pddiction.put("ZD_ID", "b45d87c51b0347998dd834b114afc46c");
				pddiction = dictionariesService.findById(pddiction);
				/**
				 * 短信内容签名
				 */
				//查询是否发货短信开启
				/*pddiction.put("ZD_ID", "27a3f302d50e436e95607017560fdc85");
				pddiction = dictionariesService.findById(pddiction);
				String sbstr = pddiction.getString("DVALUES");*/
				
				//替换文字
				String sbstr = pddiction.getString("DVALUES");
				//sbstr = sbstr.replaceAll("#PRODUCTS", pd.getString("PRODUCT_NAME"));
				String str = SmsUtil.sendSms1(pd.getString("MOBILE"), sbstr);		//调用发短信函数1
				logBefore(logger, "*****短信发送状态："+str);
				if(str.indexOf("ok") != -1){
					String str2[]=str.split(":");
					String smg=pd.get("MIDS").toString()+";"+str2[1];
					pd.put("MIDS", smg);
				}else{
					String smg=pd.get("MIDS").toString()+";"+str;
					pd.put("MIDS", smg);
				}
				ordersService.edit(pd);
			}
			
		}
		
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, "列表Orders");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		PageData pdpr = new PageData();//产品列表
		try{
			pd = this.getPageData();
			/*
			 * 如果是平台则都能看到否则只能看到本商户订单
			 */
			// shiro管理的session
			Subject currentUser = SecurityUtils.getSubject();
			Session session = currentUser.getSession();
			User user = (User) session.getAttribute(Const.SESSION_USER);
			if(user.getBZ() != 1){//商户1：北京中润 全部查询
				pd.put("MERCHANTID", user.getBZ());
				pdpr.put("MERCHANTID", user.getBZ());
			}
			
			List<PageData>	productList = productsService.listAll(pdpr);//产品列表
			
			
			
			
			page.setPd(pd);
			List<PageData>	varList = ordersService.list(page);	//列出Orders列表
			mv.setViewName("system/orders/orders_list");
			mv.addObject("varList", varList);
			mv.addObject("productList", productList);
			mv.addObject("pd", pd);
			mv.addObject(Const.SESSION_QX,this.getHC());	//按钮权限
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd(){
		logBefore(logger, "去新增Orders页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			
			/*查询产品
			 * 如果是平台则都能看到否则只能看到本商户订单
			 */
			// shiro管理的session
			Subject currentUser = SecurityUtils.getSubject();
			Session session = currentUser.getSession();
			User user = (User) session.getAttribute(Const.SESSION_USER);
			if(user.getBZ() != 1){//商户1：北京中润 全部查询
				pd.put("MERCHANTID", user.getBZ());
			}
			pd.put("PRODUCTSTATUS", 2);//1：未生成 2：正常3：下架
			List<PageData>	productList = productsService.listAll(pd);//产品列表
			
			
			mv.setViewName("system/orders/orders_edit");
			mv.addObject("msg", "saveJSP");
			mv.addObject("pd", pd);
			mv.addObject("productList", productList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * ajax产品的自己
	 */
	@RequestMapping(value="/ajaxProduct")
	@ResponseBody
	public String ajaxProduct(@RequestParam("prId") String prId) {
		PageData apd = new PageData();
		apd.put("PRODUCTS_ID",prId);
		try {
			PageData products = productsService.findById(apd);
			Gson g=new Gson();
			return g.toJson(products);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * ajax产品的套餐
	 */
	@RequestMapping(value="/ajaxPackages")
	@ResponseBody
	public String ajaxPackages(@RequestParam("prId") String prId) {
		PageData apd = new PageData();
		apd.put("PRODUCTID",prId);
		try {
			List<PageData>	adList = packagesService.listAll(apd);
			Gson g=new Gson();
			return g.toJson(adList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * ajax套餐自身
	 */
	@RequestMapping(value="/ajaxPackagesId")
	@ResponseBody
	public String ajaxPackagesId(@RequestParam("paId") String paId) {
		PageData apd = new PageData();
		String paId2[]=paId.split("-");
		apd.put("PACKAGES_ID",paId2[0]);
		try {
			PageData adList = packagesService.findById(apd);
			Gson g=new Gson();
			return g.toJson(adList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(){
		logBefore(logger, "去修改Orders页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			
			pd = ordersService.findById(pd);	//根据ID读取
			/*查询产品
			 * 如果是平台则都能看到否则只能看到本商户订单
			 */
			// shiro管理的session
			Subject currentUser = SecurityUtils.getSubject();
			Session session = currentUser.getSession();
			User user = (User) session.getAttribute(Const.SESSION_USER);
			PageData pd1 = new PageData();
			if(user.getBZ() != 1){//商户1：北京中润 全部查询
				pd1.put("MERCHANTID", user.getBZ());
			}
			
			pd1.put("PRODUCTSTATUS", 2);//1：未生成 2：正常3：下架
			List<PageData>	productList = productsService.listAll(pd1);//产品列表
			PageData pd2 = new PageData();
			pd2.put("PRODUCTID", pd.get("PRODUCTID"));
			List<PageData>	packageList = packagesService.listAll(pd2);//套餐列表
			
			
			
			
			mv.setViewName("system/orders/orders_edit");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
			mv.addObject("productList", productList);
			mv.addObject("packageList", packageList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 批量删除
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() {
		logBefore(logger, "批量删除Orders");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				ordersService.deleteAll(ArrayDATA_IDS);
				pd.put("msg", "ok");
			}else{
				pd.put("msg", "no");
			}
			pdList.add(pd);
			map.put("list", pdList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}
	
	/*
	 * 导出到excel
	 * @return
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel(){
		logBefore(logger, "导出Orders到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("产品ID");	//1
			titles.add("套餐ID");	//2
			titles.add("颜色");	//3
			titles.add("尺码");	//4
			titles.add("件数");	//5
			titles.add("订单总额");	//6
			titles.add("收货人");	//7
			titles.add("手机号");	//8
			titles.add("地址");	//9
			titles.add("邮编");	//10
			titles.add("备注");	//11
			titles.add("支付方式");	//12
			titles.add("选择物流");	//13
			titles.add("最后修改时间");	//14
			titles.add("状态");	//15
			titles.add("录入日期");	//16
			titles.add("备注预留字段");	//17
			dataMap.put("titles", titles);
			List<PageData> varOList = ordersService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).get("PRODUCTID").toString());	//1
				vpd.put("var2", varOList.get(i).get("PACKAGEID").toString());	//2
				vpd.put("var3", varOList.get(i).getString("COLOR"));	//3
				vpd.put("var4", varOList.get(i).getString("SIZE"));	//4
				vpd.put("var5", varOList.get(i).get("QUANTITY").toString());	//5
				vpd.put("var6", varOList.get(i).get("AMOUNT").toString());	//6
				vpd.put("var7", varOList.get(i).getString("CONSIGNEE"));	//7
				vpd.put("var8", varOList.get(i).getString("MOBILE"));	//8
				vpd.put("var9", varOList.get(i).getString("ADDRESS"));	//9
				vpd.put("var10", varOList.get(i).getString("POST_CODE"));	//10
				vpd.put("var11", varOList.get(i).getString("ORDER_REMARK"));	//11
				vpd.put("var12", varOList.get(i).get("PAY_MODE").toString());	//12
				vpd.put("var13", varOList.get(i).get("LOGISTICS").toString());	//13
				vpd.put("var14", varOList.get(i).getString("LAST_MODIFY"));	//14
				vpd.put("var15", varOList.get(i).get("ORDERSTATUS").toString());	//15
				vpd.put("var16", varOList.get(i).getString("INPUTDATE"));	//16
				vpd.put("var17", varOList.get(i).getString("BAK40"));	//17
				varList.add(vpd);
			}
			dataMap.put("varList", varList);
			ObjectExcelView erv = new ObjectExcelView();
			mv = new ModelAndView(erv,dataMap);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/* ===============================权限================================== */
	public Map<String, String> getHC(){
		Subject currentUser = SecurityUtils.getSubject();  //shiro管理的session
		Session session = currentUser.getSession();
		return (Map<String, String>)session.getAttribute(Const.SESSION_QX);
	}
	/* ===============================权限================================== */
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
