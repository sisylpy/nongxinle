package com.nongxinle.dao;

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


public interface NxOrdersSubDao extends BaseDao<NxOrdersSubEntity> {

    List<NxOrdersSubEntity> queryPurchaseGoods(Map<String, Object> map);

    List<NxOrdersSubEntity> querySubsByGoodsId(Map<String, Object> subMap);

    List<NxOrdersSubEntity> querySubOrdersByDisIdandStatus(Map<String, Object> map2);

    List<NxOrdersSubEntity> querySubOrdersByCustomerUserId(Map<String, Object> map);

    List<NxOrdersSubEntity>  queryListByOrderId(Map<String, Object> map);

    List<NxOrdersEntity> queryOutGoodsByType(Map<String, Object> map);

    List<NxOrdersSubEntity> querySubGoodsByOrderId(Integer integer);

    List<NxOrdersSubEntity> queryCommGoodsOfSubs(Integer fatherId);
}
