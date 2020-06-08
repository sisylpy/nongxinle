package com.nongxinle.service;

/**
 * 
 *
 * @author lpy
 * @date 05-11 11:26
 */

import com.nongxinle.entity.NxDistributerSupplierEntity;

import java.util.List;
import java.util.Map;

public interface NxDistributerSupplierService {
	
	NxDistributerSupplierEntity queryObject(Integer nxDistributerSupplierId);
	
	List<NxDistributerSupplierEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(NxDistributerSupplierEntity nxDistributerSupplier);
	
	void update(NxDistributerSupplierEntity nxDistributerSupplier);
	
	void delete(Integer nxDistributerSupplierId);
	
	void deleteBatch(Integer[] nxDistributerSupplierIds);
}
