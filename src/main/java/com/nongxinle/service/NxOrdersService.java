package com.nongxinle.service;

/**
 * 
 *
 * @author lpy
 * @date 2020-03-22 18:07:28
 */

import com.nongxinle.entity.NxOrdersEntity;
import org.omg.PortableInterceptor.INACTIVE;

import java.util.List;
import java.util.Map;

public interface NxOrdersService {
	
	NxOrdersEntity queryObject(Integer nxOrdersId);
	
	List<NxOrdersEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(NxOrdersEntity nxOrders);
	
	void update(NxOrdersEntity nxOrders);
	
	void delete(Integer nxOrdersId);
	
	void deleteBatch(Integer[] nxOrdersIds);

    List<NxOrdersEntity> queryOrders(Map<String, Object> map);

	Map<String, Object> queryDistributerIndexData(Integer communityId);

	List<NxOrdersEntity> queryOrdersToWeigh(Map<String, Object> map);

	void updateSub(NxOrdersEntity arr);

	List<NxOrdersEntity> queryOrdersDetail(Map<String, Object> map);

	List<NxOrdersEntity> queryOrdersPaymentInformation(Map<String, Object> map);

	Integer  updatePaymentStatus(Map<String, Object> map);

	List<NxOrdersEntity> queryCustomerOrder(Map<String, Object> map);

	List<NxOrdersEntity> queryDeliveryOrder(Map<String, Object> map);

}
