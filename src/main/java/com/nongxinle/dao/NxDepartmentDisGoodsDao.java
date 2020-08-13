package com.nongxinle.dao;

/**
 * 
 *
 * @author lpy
 * @date 07-30 23:58
 */

import com.nongxinle.entity.NxDepartmentDisGoodsEntity;
import com.nongxinle.entity.NxGoodsEntity;

import java.util.List;
import java.util.Map;


public interface NxDepartmentDisGoodsDao extends BaseDao<NxDepartmentDisGoodsEntity> {

    List<NxDepartmentDisGoodsEntity> queryDisDepGoods(Map<String, Object> map);

    List<NxGoodsEntity> depGetDepDisGoodsCata(Integer depId);

    List<NxGoodsEntity> querySearchStr(Map<String, Object> map);

    List<NxGoodsEntity> queryDepGoodsByFatherId(Map<String, Object> map);

    List<NxGoodsEntity> queryResGoodsDetail(Integer depDisGoodsId);
}
