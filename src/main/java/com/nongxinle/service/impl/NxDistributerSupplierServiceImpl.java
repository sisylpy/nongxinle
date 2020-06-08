package com.nongxinle.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxDistributerSupplierDao;
import com.nongxinle.entity.NxDistributerSupplierEntity;
import com.nongxinle.service.NxDistributerSupplierService;



@Service("nxDistributerSupplierService")
public class NxDistributerSupplierServiceImpl implements NxDistributerSupplierService {
	@Autowired
	private NxDistributerSupplierDao nxDistributerSupplierDao;
	
	@Override
	public NxDistributerSupplierEntity queryObject(Integer nxDistributerSupplierId){
		return nxDistributerSupplierDao.queryObject(nxDistributerSupplierId);
	}
	
	@Override
	public List<NxDistributerSupplierEntity> queryList(Map<String, Object> map){
		return nxDistributerSupplierDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return nxDistributerSupplierDao.queryTotal(map);
	}
	
	@Override
	public void save(NxDistributerSupplierEntity nxDistributerSupplier){
		nxDistributerSupplierDao.save(nxDistributerSupplier);
	}
	
	@Override
	public void update(NxDistributerSupplierEntity nxDistributerSupplier){
		nxDistributerSupplierDao.update(nxDistributerSupplier);
	}
	
	@Override
	public void delete(Integer nxDistributerSupplierId){
		nxDistributerSupplierDao.delete(nxDistributerSupplierId);
	}
	
	@Override
	public void deleteBatch(Integer[] nxDistributerSupplierIds){
		nxDistributerSupplierDao.deleteBatch(nxDistributerSupplierIds);
	}
	
}
