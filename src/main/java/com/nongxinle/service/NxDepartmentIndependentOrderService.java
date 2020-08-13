package com.nongxinle.service;

/**
 * 
 *
 * @author lpy
 * @date 08-01 13:09
 */

import com.nongxinle.entity.NxDepartmentIndependentOrderEntity;

import java.util.List;
import java.util.Map;

public interface NxDepartmentIndependentOrderService {
	
	NxDepartmentIndependentOrderEntity queryObject(Integer nxDepIndependentOrderId);
	
	List<NxDepartmentIndependentOrderEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(NxDepartmentIndependentOrderEntity nxDepartmentIndependentOrder);
	
	void update(NxDepartmentIndependentOrderEntity nxDepartmentIndependentOrder);
	
	void delete(Integer nxDepIndependentOrderId);
	
	void deleteBatch(Integer[] nxDepIndependentOrderIds);

    List<NxDepartmentIndependentOrderEntity> queryGroupTodayIndependentOrders(Integer nxDuDepartmentId);
}
