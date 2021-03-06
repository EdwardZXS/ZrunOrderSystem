package com.fh.service.system.products;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;

import oracle.sql.DATE;


@Service("productsService")
public class ProductsService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(PageData pd)throws Exception{
		dao.save("ProductsMapper.save", pd);
		//上传图片到图片表
		PageData pdimg=new PageData();
		int type;
		// PRODUCTID
		pdimg.put("PRODUCTID", pd.get("PRODUCTS_ID"));
		// CREATEDATE
		pdimg.put("CREATEDATE", new Date());
		String path1 = pd.getString("path1");// 商品封面
		String path2 = pd.getString("path2");// 物流信息
		String path3 = pd.getString("path3");// 商品介绍
		if(path1 != null) {
			type = 1;
			// PATH
			pdimg.put("PATH", path1);
			// TYPE
			pdimg.put("TYPE", type);
			// SEQUENCE
			pdimg.put("SEQUENCE", 1);
			// 保存图片
			dao.save("ImgsMapper.save", pdimg);
		}
		if(path2 != null) {
			type = 2;
			// PATH
			pdimg.put("PATH", path2);
			// TYPE
			pdimg.put("TYPE", type);
			// SEQUENCE
			pdimg.put("SEQUENCE", 2);
			// 保存图片
			dao.save("ImgsMapper.save", pdimg);
		}
		if(path3 != null) {
			type = 3;
			pdimg.put("TYPE", type);
			String[] path3s = path3.split(";");
			for (String p3 : path3s) {
				pdimg.put("PATH", p3);
				pdimg.put("SEQUENCE", type++);
				dao.save("ImgsMapper.save", pdimg);
			}
		}
		/*
		 * 默认添加个原产品
		 */
		PageData pdpa=new PageData();
		pdpa.put("PRODUCTID",pd.get("PRODUCTS_ID"));//
		pdpa.put("PACKAGE_NAME", "产品原件");//
		pdpa.put("PACKAGE_PRICE", pd.get("PRODUCT_UNIT"));//
		dao.save("PackagesMapper.save", pdpa);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("ProductsMapper.delete", pd);
	}
	
	/*
	* 修改
	* 注意：若修改商品的图片，要先将原有的图片删除
	*/
	public void edit(PageData pd)throws Exception{
		/*PageData pdimg = new PageData();
		pdimg.put("PRODUCTID", pd.getString("PRODUCTS_ID"));
		// 根据商品的ID去图片表现删除相关数据
		dao.delete("ImgsMapper.delete", pdimg);
		
		// 删除以后重新保存图片信息
		int type;
		// PRODUCTID
		pdimg.put("PRODUCTID", pd.get("PRODUCTS_ID"));
		// CREATEDATE
		pdimg.put("CREATEDATE", new Date());
		String path1 = pd.getString("path1");// 商品封面
		String path2 = pd.getString("path2");// 物流信息
		String path3 = pd.getString("path3");// 商品介绍
		if (path1 != null) {
			type = 1;
			// PATH
			pdimg.put("PATH", path1);
			// TYPE
			pdimg.put("TYPE", type);
			// SEQUENCE
			pdimg.put("SEQUENCE", 1);
			// 保存图片
			dao.save("ImgsMapper.save", pdimg);
		}
		if (path2 != null) {
			type = 2;
			// PATH
			pdimg.put("PATH", path2);
			// TYPE
			pdimg.put("TYPE", type);
			// SEQUENCE
			pdimg.put("SEQUENCE", 2);
			// 保存图片
			dao.save("ImgsMapper.save", pdimg);
		}
		if (path3 != null) {
			type = 3;
			pdimg.put("TYPE", type);
			String[] path3s = path3.split(";");
			for (String p3 : path3s) {
				pdimg.put("PATH", p3);
				pdimg.put("SEQUENCE", type++);
				dao.save("ImgsMapper.save", pdimg);
			}
		
		// 根据商品的id去查询商品下的所有照片
		PageData pdimg = new PageData();
		pdimg.put("PRODUCTID", pd.getString("PRODUCTS_ID"));
		Object findForList = dao.findForList("ImgsMapper.listAll", pdimg);
		}*/
		dao.update("ProductsMapper.edit", pd);
	}
	
	/*
	*列表
	*/
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ProductsMapper.datalistPage", page);
	}
	
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ProductsMapper.listAll", pd);
	}
	
	/*
	* 通过id获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ProductsMapper.findById", pd);
	}
	/*
	 * 通过id获取数据+商户信息
	 */
	public PageData findByIdAndM(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ProductsMapper.findByIdAndM", pd);
	}
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("ProductsMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

