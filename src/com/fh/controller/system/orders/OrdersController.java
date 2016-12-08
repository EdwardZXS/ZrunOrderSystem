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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
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
import com.fh.util.Tools;
import com.fh.util.Jurisdiction;
import com.fh.service.system.orders.OrdersService;
import com.fh.service.system.products.ProductsService;

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
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public void save(HttpServletResponse response) throws Exception{
		logBefore(logger, "新增Orders");
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
		pd.put("ORDERSTATUS",1);	//状态1:下单未确认 2:已确认正在出库 3:已收货 4:退货 5:拒收
		//HOUR_OF_DAY  这是小时
		pd.put("BAK40", DateUtil2.getDateFromNow(Calendar.DAY_OF_YEAR, 1, "yyyy-MM-dd HH:mm:ss"));	//有效时间戳+1天（24小时）
		
		ordersService.save(pd);
		
		/**
		 * 短信
		 */
		
		
		
		
		
		
		
		//String url="../"+Const.HTMLPATH+pd.getString("PRODUCT_ANOTHERNAME")+".html";//这是跳转回产品页面
		String url="../"+Const.HTMLPATH+"success.html";
		response.sendRedirect(url);
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
		ordersService.edit(pd);
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
			mv.setViewName("system/orders/orders_edit");
			mv.addObject("msg", "save");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
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
			mv.setViewName("system/orders/orders_edit");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
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
