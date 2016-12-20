package com.fh.controller.system.products;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.system.Packages;
import com.fh.util.Const;
import com.fh.util.Freemarker;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;
import com.fh.service.system.imgs.ImgsService;
import com.fh.service.system.merchant.MerchantService;
import com.fh.service.system.packages.PackagesService;
import com.fh.service.system.products.ProductsService;

/** 
 * 类名称：ProductsController
 * 创建人：DHC 
 * 创建时间：2016-12-01
 */
@Controller
@RequestMapping(value="/productsAddHtml")
public class ProductsAddHtmlController extends BaseController {
	
	@Resource(name="productsService")
	private ProductsService productsService;
	@Resource(name="imgsService")
	private ImgsService imgsService;
	@Resource(name="packagesService")
	private PackagesService packagesService;
	
	/**
	 * jsp预览页面
	 */
	@RequestMapping(value="/jspProducts")
	public ModelAndView jspProducts(){
		logBefore(logger, "jsp预览页面");
		ModelAndView mv = this.getModelAndView();
		//Map<String,Object> root = new HashMap<String,Object>();
		PageData root = new PageData();
		PageData pd = new PageData();
		pd = this.getPageData();
		//pd.put("PRODUCTS_ID",Id);
		        
		try {
			pd = productsService.findByIdAndM(pd);	//根据ID读取商品和商户信息
			pd.put("PRODUCTID", pd.get("PRODUCTS_ID"));//为了查询图片与套餐表
			
			/*
			 * 以下是给模版用的字段
			 */
			root.put("MERCHANT_NAME", pd.get("MERCHANT_NAME"));//为了查询图片与套餐表
			Integer sums=Integer.parseInt(pd.get("DATETIMES").toString())*86400;
			root.put("DATETIMES",sums.toString());//倒计时（天）
			root.put("PRODUCT_ANOTHERNAME", pd.get("PRODUCT_ANOTHERNAME"));//产品别名
			root.put("PRODUCTS_ID", pd.get("PRODUCTS_ID"));//主键ID
			root.put("MERCHANTID", pd.get("MERCHANTID"));//所属商户ID
			root.put("USERID", pd.get("USERID"));//创建人员ID
			root.put("PRODUCT_NAME", pd.get("PRODUCT_NAME"));//产品名称
			root.put("PRODUCT_PRICE", pd.get("PRODUCT_PRICE"));//产品原价
			root.put("PRODUCT_UNIT", pd.get("PRODUCT_UNIT"));//现销售价
			root.put("PHONE", pd.get("PHONE"));//手机号码
			root.put("QQ", pd.get("QQ"));//联系QQ
			root.put("DISCOUNT", pd.get("DISCOUNT"));//折扣
			root.put("SAVE", pd.get("SAVE"));//节省
			root.put("SALE_AMOUNT", pd.get("SALE_AMOUNT"));//销量
			root.put("STOCK", pd.get("STOCK"));//库存
			root.put("EXPLAINS", pd.get("EXPLAINS"));//抢购描述
			root.put("BAK10", pd.get("BAK10"));//订单描述
			root.put("SIZE", pd.get("SIZE"));//
			root.put("COLOR", pd.get("COLOR"));//
			
			/*万一获取不到换下一种
			 * String path = getRequest().getContextPath();
			String basePath = getRequest().getScheme()+"://"+getRequest().getServerName()+":"+getRequest().getServerPort()+path+"/";
			root.put("Url", basePath+Const.URL);//提交地址
			 */			
			ResourceBundle rb = ResourceBundle.getBundle("link");
			String basePath=rb.getString("url");//域名
			root.put("Url", basePath+Const.URL);//提交地址
			
			/*
			 * 根据产品查询出list
			 */
			//查询图片按顺序
			List<PageData> imgList = imgsService.listAll(pd);
			List<String> img1List = new ArrayList<String>();
			List<String> img2List = new ArrayList<String>();
			List<String> img3List = new ArrayList<String>();
			
			for (PageData pageData : imgList) {
				
					String strimg=pageData.get("TYPE").toString();
					switch(Integer.parseInt(strimg)){    //1:产品封面 2:产品详情 3:购买流程
			        case 1:   
			        	img1List.add(pageData.get("PATH").toString());
			            continue; 
			        case 2:    
			        	img2List.add(pageData.get("PATH").toString());
			            continue;   
			        case 3:    
			        	img3List.add(pageData.get("PATH").toString());
			            continue;   
			        } 
			}
			root.put("img1List",img1List);//赋值图片列表1:产品封面
			root.put("img2List",img2List);//赋值图片列表2:产品详情
			root.put("img3List",img3List);//赋值图片列表3:购买流程
			
			//查询套餐
			List<Packages> packagesList = packagesService.listAllBean(pd); 
			root.put("packagesList", packagesList);//赋值套餐列表
			root.put("PRODUCT_UNIT",packagesList.get(0).getPACKAGE_PRICE());
			//尺码数组转list
			if(pd.get("SIZE") !=null && (!pd.get("SIZE").toString().equals(""))){
				String sizeids[]=pd.get("SIZE").toString().split("#");
				root.put("sizeidList", sizeids);//赋值尺码列表
			}
			//颜色数组转list
			if(pd.get("COLOR") !=null && (!pd.get("COLOR").toString().equals(""))){
				String colors[]=pd.get("COLOR").toString().split("#");
				root.put("colorList", colors);//赋值颜色列表
			}
			
			mv.setViewName("system/products/jspProducts");
			mv.addObject("root", root);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	/**
	 * 生成HTML页面
	 */
	@RequestMapping(value="/htmlProducts")
	public void htmlProducts(PrintWriter out){
		logBefore(logger, "生成HTML页面");
		ModelAndView mv = this.getModelAndView();
		Map<String,Object> root = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		//pd.put("PRODUCTS_ID",Id);
		        
		try {
			pd = productsService.findByIdAndM(pd);	//根据ID读取
			pd.put("PRODUCTID", pd.get("PRODUCTS_ID"));//为了查询图片与套餐表
			
			/*
			 * 以下是给模版用的字段
			 */
			root.put("MERCHANT_NAME", pd.get("MERCHANT_NAME"));//为了查询图片与套餐表
			Integer sums=Integer.parseInt(pd.get("DATETIMES").toString())*86400;
			root.put("DATETIMES",sums.toString());//倒计时（天）
			root.put("PRODUCT_ANOTHERNAME", pd.get("PRODUCT_ANOTHERNAME"));//产品别名
			root.put("PRODUCTS_ID", pd.get("PRODUCTS_ID"));//主键ID
			root.put("MERCHANTID", pd.get("MERCHANTID"));//所属商户ID
			root.put("USERID", pd.get("USERID"));//创建人员ID
			root.put("PRODUCT_NAME", pd.get("PRODUCT_NAME"));//产品名称
			root.put("PRODUCT_PRICE", pd.get("PRODUCT_PRICE"));//产品原价
			root.put("PRODUCT_UNIT", pd.get("PRODUCT_UNIT"));//现销售价
			root.put("PHONE", pd.get("PHONE"));//手机号码
			root.put("QQ", pd.get("QQ"));//联系QQ
			root.put("DISCOUNT", pd.get("DISCOUNT"));//折扣
			root.put("SAVE", pd.get("SAVE"));//节省
			root.put("SALE_AMOUNT", pd.get("SALE_AMOUNT"));//销量
			root.put("STOCK", pd.get("STOCK"));//库存
			root.put("EXPLAINS", pd.get("EXPLAINS"));//抢购描述
			root.put("BAK10", pd.get("BAK10"));//订单描述
			if(pd.get("SIZE") != null && !pd.get("SIZE").toString().equals("")){
				root.put("SIZE", pd.get("SIZE"));//
			}
			if(pd.get("COLOR") != null && !pd.get("COLOR").toString().equals("")){
				root.put("COLOR", pd.get("COLOR"));//
			}
			
			/*String path = getRequest().getContextPath();
			String basePath = getRequest().getScheme()+"://"+getRequest().getServerName()+":"+getRequest().getServerPort()+path+"/";
			root.put("Url", basePath+Const.URL);//提交地址
			 */			
			ResourceBundle rb = ResourceBundle.getBundle("link");
			String basePath=rb.getString("url");//域名
			root.put("Url", basePath+Const.URL);//提交地址
			/*
			 * 根据产品查询出list
			 */
			//查询图片按顺序
			List<PageData> imgList = imgsService.listAll(pd);
			List<String> img1List = new ArrayList<String>();
			List<String> img2List = new ArrayList<String>();
			List<String> img3List = new ArrayList<String>();
			
			for (PageData pageData : imgList) {
				
					String strimg=pageData.get("TYPE").toString();
					switch(Integer.parseInt(strimg)){    //1:产品封面 2:产品详情 3:购买流程
			        case 1:   
			        	img1List.add(pageData.get("PATH").toString());
			            continue; 
			        case 2:    
			        	img2List.add(pageData.get("PATH").toString());
			            continue;   
			        case 3:    
			        	img3List.add(pageData.get("PATH").toString());
			            continue;   
			        } 
			}
			root.put("img1List",img1List);//赋值图片列表1:产品封面
			root.put("img2List",img2List);//赋值图片列表2:产品详情
			root.put("img3List",img3List);//赋值图片列表3:购买流程
			
			//查询套餐
			List<Packages> packagesList = packagesService.listAllBean(pd); 
			root.put("packagesList", packagesList);//赋值套餐列表
			root.put("PRODUCT_UNIT",packagesList.get(0).getPACKAGE_PRICE());
			//尺码数组转list
			if(pd.get("SIZE") !=null && (!pd.get("SIZE").toString().equals(""))){
				String sizeids[]=pd.get("SIZE").toString().split("#");
				root.put("sizeidList", sizeids);//赋值尺码列表
			}
			//颜色数组转list
			if(pd.get("COLOR") !=null && (!pd.get("COLOR").toString().equals(""))){
				String colors[]=pd.get("COLOR").toString().split("#");
				root.put("colorList", colors);//赋值颜色列表
			}
			

			/**
			 * 输出到输出到文件
			 * @param ftlName   ftl文件名
			 * @param root		传入的map
			 * @param outFile	输出后的文件全部路径（要生成的文件全名）
			 * @param ftlPath	生成的文件所在文件名称
			 */
			/*生成html页面*/
			//仿照这个做
			//String productName="htmlNAME";//html的文件名
			//pd是个MAP
			Freemarker.printFile2("html_Template.ftl", root, Const.HTMLPATH+pd.getString("PRODUCT_ANOTHERNAME")+".html","product");
			System.out.println(Const.HTMLPATH+pd.getString("PRODUCT_ANOTHERNAME")+".html");
			
			//修改产品静态页面字段
			
			pd.put("PRODUCT_URL", basePath+Const.HTMLPATH+pd.getString("PRODUCT_ANOTHERNAME")+".html");
			pd.put("PRODUCTSTATUS", 2);
			productsService.edit(pd);
			
			
			out.write("success");
			out.close();
		} catch (Exception e) {
			logger.error(e.toString(), e);
			out.write("error");
			out.close();
		}						
	}	
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	
}
