package com.fh.controller.system.merchant;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.fh.service.system.user.UserService;
import com.fh.util.*;

import org.apache.poi.hslf.dev.UserEditAndPersistListing;
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
import com.fh.service.system.merchant.MerchantService;

import static org.apache.shiro.web.filter.mgt.DefaultFilter.user;

/** 
 * 类名称：MerchantController
 * 创建人：DHC 
 * 创建时间：2016-12-01
 */
@Controller
@RequestMapping(value="/merchant")
public class MerchantController extends BaseController {
	
	String menuUrl = "merchant/list.do"; //菜单地址(权限用)
	@Resource(name="merchantService")
	private MerchantService merchantService;
	@Resource(name = "userService")
	private UserService userService;

	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, "新增Merchant");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		// pd.put("MERCHANT_ID", this.get32UUID());	//主键
		pd.put("INPUTDATE", new Date());	//输入日期
		pd.put("MERCHANTSTATUS", 2);	//状态
		pd.put("BAK1", "");	//备注预留字段
		merchantService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out){
		logBefore(logger, "删除Merchant");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			merchantService.delete(pd);
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
		logBefore(logger, "修改Merchant");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		merchantService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, "列表Merchant");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList = merchantService.list(page);	//列出Merchant列表
			List<PageData> userList = userService.listAllUser(pd);  // 列出User列表
			// String MERCHANT_NAME = pd.getString("MERCHANT_NAME");	// 查询回显
			// String MERCHANTSTATUS = pd.getString("MERCHANTSTATUS");
			mv.setViewName("system/merchant/merchant_list");
			mv.addObject("varList", varList);
			mv.addObject("userList", userList);
			mv.addObject("pd", pd);
			mv.addObject(Const.SESSION_QX,this.getHC());	//按钮权限
			// mv.addObject("QUERY_MERCHANT_NAME",MERCHANT_NAME);
			// mv.addObject("QUERY_MERCHANTSTATUS",MERCHANTSTATUS);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd() throws Exception {
		logBefore(logger, "去新增Merchant页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> userList = userService.listAllUser(pd);
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		try {
			mv.setViewName("system/merchant/merchant_edit");
			mv.addObject("msg", "save");
			mv.addObject("pd", pd);
			mv.addObject("userList",userList);
			mv.addObject("CUR_USER", user);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 去修改页面
	 * @throws Exception 
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit() throws Exception{
		logBefore(logger, "去修改Merchant页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> userList = userService.listAllUser(pd);
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		try {
			String CUR_USERID = pd.getString("USERID");// 获取商户创建人的ID
			pd = merchantService.findById(pd);	//根据ID读取
			mv.setViewName("system/merchant/merchant_edit");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
			mv.addObject("userList",userList);
			mv.addObject("CUR_USER", user);
			mv.addObject("CUR_USERID", CUR_USERID);
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
		logBefore(logger, "批量删除Merchant");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				merchantService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, "导出Merchant到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("商户名");	//1
			titles.add("商户联系人");	//2
			titles.add("商户电话");	//3
			titles.add("商户地址");	//4
			titles.add("商户QQ");	//5
			titles.add("商户编号");	//6
			titles.add("所属销售ID");	//7
			titles.add("输入日期");	//8
			titles.add("状态");	//9
			titles.add("描述");	//10
			titles.add("备注预留字段");	//11
			dataMap.put("titles", titles);
			List<PageData> varOList = merchantService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("MERCHANT_NAME"));	//1
				vpd.put("var2", varOList.get(i).getString("MERCHANT_LINKMAN"));	//2
				vpd.put("var3", varOList.get(i).getString("MERCHANT_PHONE"));	//3
				vpd.put("var4", varOList.get(i).getString("MERCHANT_ADDRESS"));	//4
				vpd.put("var5", varOList.get(i).getString("MERCHANT_QQ"));	//5
				vpd.put("var7", varOList.get(i).getString("USERID"));	//7
				vpd.put("var8", varOList.get(i).getString("INPUTDATE"));	//8
				vpd.put("var9", varOList.get(i).get("MERCHANTSTATUS").toString());	//9
				vpd.put("var10", varOList.get(i).getString("EXPLAINS"));	//10
				vpd.put("var11", varOList.get(i).getString("BAK1"));	//11
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
