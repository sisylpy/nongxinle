package com.nongxinle.dao;

/**
 * 
 *
 * @author lpy
 * @date 06-17 23:53
 */

import com.nongxinle.entity.NxDepartmentGoodsEntity;

import java.util.List;
import java.util.Map;


public interface NxDepartmentGoodsDao extends BaseDao<NxDepartmentGoodsEntity> {

    List<NxDepartmentGoodsEntity> queryDepartmentGoods(Map<String, Object> map);

    List<NxDepartmentGoodsEntity> queryAllDepartmentGoods(Integer depId);

    List<NxDepartmentGoodsEntity> queryDepGoodsByFatherId(Map<String, Object> map);

    List<NxDepartmentGoodsEntity> queryIfHasDepartmentGoods(Map<String, Object> map);
}
