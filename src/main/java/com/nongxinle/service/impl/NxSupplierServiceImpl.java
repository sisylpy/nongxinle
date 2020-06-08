package com.nongxinle.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxSupplierDao;
import com.nongxinle.entity.NxSupplierEntity;
import com.nongxinle.service.NxSupplierService;



@Service("nxSupplierService")
public class NxSupplierServiceImpl implements NxSupplierService {
	@Autowired
	private NxSupplierDao nxSupplierDao;
	
	@Override
	public NxSupplierEntity queryObject(Integer nxSupplierId){
		return nxSupplierDao.queryObject(nxSupplierId);
	}
	
	@Override
	public List<NxSupplierEntity> queryList(Map<String, Object> map){
		return nxSupplierDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return nxSupplierDao.queryTotal(map);
	}
	
	@Override
	public void save(NxSupplierEntity nxSupplier){
		nxSupplierDao.save(nxSupplier);
	}
	
	@Override
	public void update(NxSupplierEntity nxSupplier){
		nxSupplierDao.update(nxSupplier);
	}
	
	@Override
	public void delete(Integer nxSupplierId){
		nxSupplierDao.delete(nxSupplierId);
	}
	
	@Override
	public void deleteBatch(Integer[] nxSupplierIds){
		nxSupplierDao.deleteBatch(nxSupplierIds);
	}
	
}
