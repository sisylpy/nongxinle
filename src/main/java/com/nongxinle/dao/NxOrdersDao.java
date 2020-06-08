package com.nongxinle.dao;

/**
 * 
 *
 * @author lpy
 * @date 2020-03-22 18:07:28
 */

import com.nongxinle.entity.NxOrdersEntity;

import java.util.List;
import java.util.Map;


public interface NxOrdersDao extends BaseDao<NxOrdersEntity> {

    List<NxOrdersEntity> queryOrders(Map<String, Object> map);

    List<NxOrdersEntity> queryOrdersToWeigh(Map<String, Object> map);

    List<NxOrdersEntity> queryOrdersInformation(Map<String, Object> map);

    List<NxOrdersEntity> queryOrdersPaymentInformation(Map<String, Object> map);

    List<NxOrdersEntity> queryCustomerOrder(Map<String, Object> map);

    List<NxOrdersEntity> queryDeliveryOrders(Map<String, Object> map);
}
