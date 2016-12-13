package com.fh.controller.system.products;

import java.io.File;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.druid.support.json.JSONUtils;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.service.system.dictionaries.DictionariesService;
import com.fh.service.system.imgs.ImgsService;
import com.fh.service.system.merchant.MerchantService;
import com.fh.service.system.products.ProductsService;
import com.fh.service.system.user.UserService;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.FileUpload;
import com.fh.util.Jurisdiction;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.PathUtil;

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
		HttpServletRequest request = this.getRequest();
		// 获取路径
		String realPath = request.getRealPath("");
		String dirName = DateUtil.getDays();
		// 算出节省 用原价减去现销售价
		double save = Double.parseDouble(pd.getString("PRODUCT_PRICE")) - Double.parseDouble(pd.getString("PRODUCT_UNIT"));
		// 获取文件的别名，用于
		String PRODUCT_ANOTHERNAME = pd.getString("PRODUCT_ANOTHERNAME");
		// 获取图片的上传路径
		String filePath = pd.getString("filePath");
		File file = new File(filePath);
		PageData filePd = imgsService.findById(pd);
		// 从临时存储到指定目录
		String newFileName = FileUpload.fileUp((MultipartFile)file, realPath + "/" + Const.FILEPATHIMG2 + "/" + dirName + "/", PRODUCT_ANOTHERNAME);
		String newFilePath= Const.FILEPATHIMG2+"/"+dirName+"/"+newFileName;
		// 获取商户的QQ和手机
		PageData merchant = merchantService.findById(pd);
		pd.put("PRODUCT_URL", PathUtil.PathAddress()+"html/product/"+pd.getString("PRODUCT_ANOTHERNAME")+".html");
		pd.put("PHONE", merchant.getString("MERCHANT_PHONE"));
		pd.put("QQ", merchant.getString("MERCHANT_QQ"));
		pd.put("SAVE", save);// 节省
		pd.put("INPUTDATE", new Date());	//输入日期
		pd.put("PRODUCTSTATUS", 1);
		pd.put("BAK10", "");	//备注预留字段
		productsService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		
		// 保存图片相关信息
		String PRODUCTS_ID = pd.getString("PRODUCTS_ID");// 获取新增商品的ID
		filePd.put("PRODUCTID", PRODUCTS_ID);
		filePd.put("PATH",newFilePath);
		imgsService.save(filePd);
		
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
		pddiction.put("PARENT_ID", "d39e791f50b64fbe93a4d8d0d85fdb57");
		try {
			List<PageData> merchList = merchantService.listAll(pd);
			List<PageData> userList = userService.listAllUser(pd);
			// List<PageData> dictList = dictionariesService.dictlistPage(page);
			List<PageData> dictList = dictionariesService.ListAllDict(pddiction);
			mv.setViewName("system/products/products_edit");
			mv.addObject("msg", "save");
			mv.addObject("pd", pd);
			mv.addObject("merchList", merchList);
			mv.addObject("userList", userList);
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
		try {
			pd = productsService.findById(pd);	//根据ID读取
			List<PageData> merchList = merchantService.listAll(pd);
			List<PageData> userList = userService.listAllUser(pd);
			List<PageData> dictList = dictionariesService.ListAllDict(pddiction);
			mv.setViewName("system/products/products_edit");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
			mv.addObject("merchList", merchList);
			mv.addObject("userList", userList);
			mv.addObject("dictList", dictList);
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
