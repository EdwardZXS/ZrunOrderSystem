package com.fh.controller.system.products;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.druid.support.json.JSONUtils;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.Packages;
import com.fh.entity.system.User;
import com.fh.service.information.pictures.PicturesService;
import com.fh.service.system.channels.ChannelsService;
import com.fh.service.system.dictionaries.DictionariesService;
import com.fh.service.system.imgs.ImgsService;
import com.fh.service.system.merchant.MerchantService;
import com.fh.service.system.packages.PackagesService;
import com.fh.service.system.products.ProductsService;
import com.fh.service.system.user.UserService;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.Jurisdiction;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.PathUtil;
import com.google.gson.Gson;

/** 
 * 类名称：ProductsController
 * 创建人：DHC 
 * 创建时间：2016-12-01
 */
@Controller
@RequestMapping(value="/products")
public class ProductsController extends BaseController {
	
	String menuUrl = "products/list.do"; //菜单地址(权限用)
	@Resource(name="productsService")
	private ProductsService productsService;
	@Resource(name="dictionariesService")
	private DictionariesService dictionariesService;
	@Resource(name="merchantService")
	private MerchantService merchantService;
	@Resource(name = "userService")
	private UserService userService;
	@Resource(name = "imgsService")
	private ImgsService imgsService;
	@Resource(name="channelsService")
	private ChannelsService channelsService;
	@Resource(name="picturesService")
	private PicturesService picturesService;
	@Resource(name="packagesService")
	private PackagesService packagesService;
	
	/**
	 * 生成静态前，检测是已添加套餐
	 * @throws Exception 
	 */
	@RequestMapping(value="checkPackage")
	public @ResponseBody String checkPackage() throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String, String> result = new HashMap<String, String>();
		// 查询该商品下的所有套餐
		List<Packages> packList = packagesService.listAllBean(pd);
		if(packList.size() != 0) {// 产品下有套餐
			result.put("RESULT", "YES");
			return JSONUtils.toJSONString(result);
		}else {// 产品无套餐
			result.put("RESULT", "NO");
			return JSONUtils.toJSONString(result);
		}
	}
	
	
	/**
	 * 检验别名是否重复
	 */
	@RequestMapping(value="ajaxCheckAName")
	public @ResponseBody String ajaxCheckAName(@RequestParam("prAName") String prAName) {
		PageData apd = new PageData();
		apd.put("PRODUCT_ANOTHERNAME", prAName);
		Map<String, String> result = new HashMap<String, String>();
		try{
			List<PageData> proList = productsService.listAll(apd);
			for (PageData pageData : proList) {
				if(prAName.equals(pageData.getString("PRODUCT_ANOTHERNAME"))){// 别名有重复
					result.put("RESULT", "NO");
					return JSONUtils.toJSONString(result);
				}else {
					result.put("RESULT", "YES");
					return JSONUtils.toJSONString(result);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, "新增Products");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		// 获取当前用户USERID和用户所属商户MERCHANTID
		pd.put("USERID", user.getUSER_ID());
		pd.put("MERCHANTID", user.getBZ());
		// 算出节省 用原价减去现销售价
		double save = Double.parseDouble(pd.getString("PRODUCT_PRICE")) - Double.parseDouble(pd.getString("PRODUCT_UNIT"));
		// 获取商户的QQ和手机
		pd.put("PRODUCT_URL", PathUtil.PathAddress()+"html/product/"+pd.getString("PRODUCT_ANOTHERNAME")+".html");
		pd.put("SAVE", save);// 节省
		pd.put("INPUTDATE", new Date());	//输入日期
		pd.put("PRODUCTSTATUS", 1);
		productsService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out){
		logBefore(logger, "删除Products");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			productsService.delete(pd);
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
		logBefore(logger, "修改Products");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData pdimg = new PageData();
		pdimg.put("PRODUCTID", pd.getString("PRODUCTS_ID"));
		// 根据商品的id获取商品下所有图片
		List<PageData> imgList = imgsService.listAll(pdimg);
		Integer type;
		String path;
		String path3 = "";
		PageData path3Pd = null;
		for (PageData pageData : imgList) {
			path3Pd = pageData;
			type = (Integer) pageData.get("TYPE");
			path = pageData.getString("PATH");// 从数据库中查出的path
			if(1 == type) {
				if(path != pd.getString("path1")) {// path1发生修改
					pageData.put("PATH", pd.getString("path1"));
					imgsService.edit(pageData);
				}
			}
			if(2 == type) {
				if(path != pd.getString("path2")) { // path2发生修改
					pageData.put("PATH", pd.getString("path2"));
					imgsService.edit(pageData);
				}
			}
			if(3 == type) {
				path3 = path3 + path + ";";
			}
			
		}
		if(path3.substring(0, path3.length()-1) != pd.getString("path3")){// path3发生修改
			// 分次保存
			String[] path3s = pd.getString("path3").split(";");
			for (String p3 : path3s) {
				path3Pd.put("path3", p3);
				imgsService.edit(path3Pd);
			}
		}
		// 判断图片是否修改
		productsService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, "列表Products");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		// shiro管理的session
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		List<PageData> varList;
		try{
			if(user.getBZ() == 1){//商户1：北京中润 全部查询
				
			}else{
				pd.put("MERCHANTID", user.getBZ());
			}
			page.setPd(pd);
			varList = productsService.list(page);
			mv.setViewName("system/products/products_list");
			mv.addObject("varList", varList);
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
	public ModelAndView goAdd(Page page){
		logBefore(logger, "去新增Products页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData pddiction = new PageData();
		PageData mPd = new PageData();
		// shiro管理的session
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		pddiction.put("PARENT_ID", "d39e791f50b64fbe93a4d8d0d85fdb57");
		mPd.put("MERCHANT_ID", user.getBZ());
		try {
			mPd = merchantService.findById(mPd);
			pd.put("PHONE", mPd.getString("MERCHANT_PHONE"));
			pd.put("QQ", mPd.getString("MERCHANT_QQ"));
			// List<PageData> userList = userService.listAllUser(pd);
			List<PageData> dictList = dictionariesService.ListAllDict(pddiction);
			mv.setViewName("system/products/products_edit");
			mv.addObject("msg", "save");
			mv.addObject("pd", pd);
			mv.addObject("dictList", dictList);
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
		logBefore(logger, "去修改Products页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData pddiction = new PageData();
		pddiction.put("PARENT_ID", "d39e791f50b64fbe93a4d8d0d85fdb57");
		PageData pdImgs = new PageData();
		pdImgs.put("PRODUCTID", pd.getString("PRODUCTS_ID"));
		try {
			pd = productsService.findById(pd);	//根据ID读取
			List<PageData> dictList = dictionariesService.ListAllDict(pddiction);
			// 查询商品下的图片列表
			List<PageData> imgList = imgsService.listAll(pdImgs);
			Integer type;
			String path;
			String path3 = "";
			for (PageData pdImg : imgList) {
				// type = pdImg.getString("TYPE");// 此张图片类型
				type = (Integer) pdImg.get("TYPE");
				path = pdImg.getString("PATH");// 此张图片的路径
				if(1 == type){// 封面
					pd.put("path1", path);
				}
				if(2 == type){// 物流
					pd.put("path2", path);
				}
				if(3 == type){// 详情
					path3 = path3 + path + ";";
					// pd.put("path3", path3);
				}
			}
			if(path3 != null && path3 != "") {
				pd.put("path3", path3.substring(0, path3.length()-1));
			}
			mv.setViewName("system/products/products_edit");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
			mv.addObject("dictList", dictList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	/**
	 * 去url查看页面
	 */
	@RequestMapping(value="/goUrls")
	public ModelAndView goUrls(){
		logBefore(logger, "去url查看页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = productsService.findById(pd);	//根据ID读取
			//查看此商户的渠道
			//pd.put("MERCHANTID", pd.get("MERCHANTID"));//这传来时已经赋值
			List<PageData> channelList = channelsService.listAll(pd);
		
			mv.setViewName("system/products/urlProducts");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
			mv.addObject("channelList", channelList);
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
		logBefore(logger, "批量删除Products");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				productsService.deleteAll(ArrayDATA_IDS);
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
	/**
	 * ajax图片
	 */
	@RequestMapping(value="/ajaxImg")
	@ResponseBody
	public String ajaxImg() {
		Page page = new Page();
		PageData mpd = new PageData();
		mpd = this.getPageData();
		page.setCurrentPage(Integer.parseInt(mpd.getString("pss")));
		// shiro管理的session
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		if(user.getBZ() == 1){//商户1：北京中润 全部查询
			
		}else{
			mpd.put("MASTER_ID", user.getBZ());
		}
		page.setPd(mpd);
		try {
			List<PageData>	varList = picturesService.ajaxlist(page);	//列出Pictures列表
			Gson g=new Gson();
			/*for (PageData pageData : varList) {
				
			}*/
			return g.toJson(varList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/*
	 * 导出到excel
	 * @return
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel(){
		logBefore(logger, "导出Products到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("所属商户ID");	//1
			titles.add("创建人员ID");	//2
			titles.add("产品名称");	//3
			titles.add("产品单价");	//5
			titles.add("产品类型");	//6
			titles.add("尺码");	//7
			titles.add("颜色");	//8
			titles.add("库存");	//9
			titles.add("输入日期");	//10
			titles.add("状态");	//11
			titles.add("静态页面地址");	//12
			titles.add("产品描述");	//13
			titles.add("备注预留字段");	//14
			dataMap.put("titles", titles);
			List<PageData> varOList = productsService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).get("MERCHANTID").toString());	//1
				vpd.put("var2", varOList.get(i).get("USERID").toString());	//2
				vpd.put("var3", varOList.get(i).getString("PRODUCT_NAME"));	//3
				vpd.put("var5", varOList.get(i).get("PRODUCT_PRICE").toString());	//5
				vpd.put("var6", varOList.get(i).getString("ZD_ID"));	//6
				vpd.put("var7", varOList.get(i).getString("SIZE"));	//7
				vpd.put("var8", varOList.get(i).getString("COLOR"));	//8
				vpd.put("var9", varOList.get(i).getString("STOCK"));	//9
				vpd.put("var10", varOList.get(i).getString("INPUTDATE"));	//10
				vpd.put("var11", varOList.get(i).get("PRODUCTSTATUS").toString());	//11
				vpd.put("var12", varOList.get(i).getString("PRODUCT_URL"));	//12
				vpd.put("var13", varOList.get(i).getString("EXPLAINS"));	//13
				vpd.put("var14", varOList.get(i).getString("BAK10"));	//14
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
