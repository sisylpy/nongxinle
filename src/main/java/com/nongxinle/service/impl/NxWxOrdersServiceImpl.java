package com.nongxinle.service.impl;

import com.nongxinle.dao.NxCustomerUserDao;
import com.nongxinle.entity.NxCustomerUserEntity;
import com.nongxinle.entity.NxOrdersEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxWxOrdersDao;
import com.nongxinle.entity.NxWxOrdersEntity;
import com.nongxinle.service.NxWxOrdersService;

import javax.servlet.http.HttpServletRequest;



@Service("nxWxOrdersService")
public class NxWxOrdersServiceImpl implements NxWxOrdersService {
	@Autowired
	private NxWxOrdersDao nxWxOrdersDao;

	@Autowired
	private NxCustomerUserDao nxCustomerUserDao;


	@Override
	public NxWxOrdersEntity queryObject(Integer nxWxOrdersId){
		return nxWxOrdersDao.queryObject(nxWxOrdersId);
	}
	
	@Override
	public List<NxWxOrdersEntity> queryList(Map<String, Object> map){
		return nxWxOrdersDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return nxWxOrdersDao.queryTotal(map);
	}
	
	@Override
	public void save(NxWxOrdersEntity nxWxOrders){
		nxWxOrdersDao.save(nxWxOrders);
	}
	
	@Override
	public void update(NxWxOrdersEntity nxWxOrders){
		nxWxOrdersDao.update(nxWxOrders);
	}
	
	@Override
	public void delete(Integer nxWxOrdersId){
		nxWxOrdersDao.delete(nxWxOrdersId);
	}
	
	@Override
	public void deleteBatch(Integer[] nxWxOrdersIds){
		nxWxOrdersDao.deleteBatch(nxWxOrdersIds);
	}

    @Override
    public Boolean saveWxOrders(NxOrdersEntity nxOrders, HttpServletRequest request) {


		Integer ordersUserId = nxOrders.getNxOrdersUserId();
		NxCustomerUserEntity nxCustomerUserEntity = nxCustomerUserDao.queryObject(ordersUserId);
		String nxCuWxOpenId = nxCustomerUserEntity.getNxCuWxOpenId();




		NxWxOrdersEntity wxOrdersEntity = new NxWxOrdersEntity();
		wxOrdersEntity.setNxWxOrdersTotalFee(nxOrders.getNxWxOrdersTotalFee());
		wxOrdersEntity.setNxWxOrdersBody("ceshi zhifu zhuti.");
		wxOrdersEntity.setNxWxOrdersOutTradeNo("djfaklfdjalfj12323123fkjad");





         return false;
    }




}
