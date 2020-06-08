package com.nongxinle.service;

/**
 * 
 *
 * @author lpy
 * @date 05-11 11:26
 */

import com.nongxinle.entity.NxSupplierEntity;

import java.util.List;
import java.util.Map;

public interface NxSupplierService {
	
	NxSupplierEntity queryObject(Integer nxSupplierId);
	
	List<NxSupplierEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(NxSupplierEntity nxSupplier);
	
	void update(NxSupplierEntity nxSupplier);
	
	void delete(Integer nxSupplierId);
	
	void deleteBatch(Integer[] nxSupplierIds);
}
