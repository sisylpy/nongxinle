package com.nongxinle.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxDepartmentIndependentOrderDao;
import com.nongxinle.entity.NxDepartmentIndependentOrderEntity;
import com.nongxinle.service.NxDepartmentIndependentOrderService;



@Service("nxDepartmentIndependentOrderService")
public class NxDepartmentIndependentOrderServiceImpl implements NxDepartmentIndependentOrderService {
	@Autowired
	private NxDepartmentIndependentOrderDao nxDepartmentIndependentOrderDao;
	
	@Override
	public NxDepartmentIndependentOrderEntity queryObject(Integer nxDepIndependentOrderId){
		return nxDepartmentIndependentOrderDao.queryObject(nxDepIndependentOrderId);
	}
	
	@Override
	public List<NxDepartmentIndependentOrderEntity> queryList(Map<String, Object> map){
		return nxDepartmentIndependentOrderDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return nxDepartmentIndependentOrderDao.queryTotal(map);
	}
	
	@Override
	public void save(NxDepartmentIndependentOrderEntity nxDepartmentIndependentOrder){
		nxDepartmentIndependentOrderDao.save(nxDepartmentIndependentOrder);
	}
	
	@Override
	public void update(NxDepartmentIndependentOrderEntity nxDepartmentIndependentOrder){
		nxDepartmentIndependentOrderDao.update(nxDepartmentIndependentOrder);
	}
	
	@Override
	public void delete(Integer nxDepIndependentOrderId){
		nxDepartmentIndependentOrderDao.delete(nxDepIndependentOrderId);
	}
	
	@Override
	public void deleteBatch(Integer[] nxDepIndependentOrderIds){
		nxDepartmentIndependentOrderDao.deleteBatch(nxDepIndependentOrderIds);
	}

    @Override
    public List<NxDepartmentIndependentOrderEntity> queryGroupTodayIndependentOrders(Integer nxDuDepartmentId) {
        return nxDepartmentIndependentOrderDao.queryGroupTodayIndependentOrder(nxDuDepartmentId);
    }

}
