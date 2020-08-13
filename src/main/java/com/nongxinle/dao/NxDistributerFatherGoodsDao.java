package com.nongxinle.dao;

/**
 * 
 *
 * @author lpy
 * @date 07-27 17:38
 */

import com.nongxinle.entity.NxDistributerFatherGoodsEntity;

import java.util.List;
import java.util.Map;


public interface NxDistributerFatherGoodsDao extends BaseDao<NxDistributerFatherGoodsEntity> {

    List<NxDistributerFatherGoodsEntity> queryDistFatherGoods(Map<String, Object> map);
}
