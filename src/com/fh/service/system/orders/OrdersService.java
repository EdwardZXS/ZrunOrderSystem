package com.fh.service.system.orders;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.util.Const;
import com.fh.util.DateUtil2;
import com.fh.util.PageData;


@Service("ordersService")
public class OrdersService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	@Transactional
	public synchronized void save(PageData pd)throws Exception{
		//生成订单编号
		pd.put("ORDERS_NUMBER",DateUtil2.getObject());
		if(pd.get("CHANNELS_ID")!=null && !pd.get("CHANNELS_ID").toString().equals("")){
		}else{
			pd.put("CHANNELS_ID",0);
		}
		dao.save("OrdersMapper.save", pd);
		//修改购买人数+销量
		PageData pdPr=(PageData)dao.findForObject("ProductsMapper.findById", pd);
		int sum= Integer.parseInt(pdPr.get("SALE_AMOUNT").toString())+Integer.parseInt(pd.get("QUANTITY").toString());
		pdPr.put("SALE_AMOUNT", sum);
		dao.update("ProductsMapper.edit", pdPr);
	}
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("OrdersMapper.delete", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("OrdersMapper.edit", pd);
	}
	
	/*
	*列表
	*/
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("OrdersMapper.datalistPage", page);
	}
	
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("OrdersMapper.listAll", pd);
	}
	
	/*
	* 通过id获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("OrdersMapper.findById", pd);
	}
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("OrdersMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

