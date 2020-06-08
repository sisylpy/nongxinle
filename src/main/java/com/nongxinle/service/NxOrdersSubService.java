package com.nongxinle.service;

/**
 * 
 *
 * @author lpy
 * @date 2020-03-22 18:07:28
 */

import com.nongxinle.entity.NxOrdersEntity;
import com.nongxinle.entity.NxOrdersSubEntity;

import java.util.List;
import java.util.Map;

public interface NxOrdersSubService {
	
	NxOrdersSubEntity queryObject(Integer nxOrdersSubId);
	
	List<NxOrdersSubEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(NxOrdersSubEntity nxOrdersSub);
	
	void update(NxOrdersSubEntity nxOrdersSub);
	
	void delete(Integer nxOrdersSubId);
	
	void deleteBatch(Integer[] nxOrdersSubIds);

    List<NxOrdersSubEntity> queryToPurchaseGoods(Map<String, Object> map);

	List<NxOrdersSubEntity> querySubsByGoodsId(Map<String, Object> subMap);

	List<NxOrdersSubEntity> querySubOrdersByCustomerUserId(Map<String, Object> map);

    List<NxOrdersEntity> queryOutGoodsByType(Map<String, Object> map);
}
