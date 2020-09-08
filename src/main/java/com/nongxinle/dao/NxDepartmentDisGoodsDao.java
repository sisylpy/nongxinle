package com.nongxinle.dao;

/**
 * 
 *
 * @author lpy
 * @date 07-30 23:58
 */

import com.nongxinle.entity.*;

import java.util.List;
import java.util.Map;


public interface NxDepartmentDisGoodsDao extends BaseDao<NxDepartmentDisGoodsEntity> {

    List<NxDepartmentEntity> queryDepartmentsByDisGoodsId(Integer disGoodsId);

    List<NxDistributerFatherGoodsEntity> depGetDepDisGoodsCata(Integer depId);

    List<NxDepartmentDisGoodsEntity> queryDepGoodsByFatherId(Map<String, Object> map);

    List<NxDepartmentDisGoodsEntity> queryDisDepGoods(Map<String, Object> map);

    int queryDisGoodsTotal(Map<String, Object> map3);


//    //////


    List<NxGoodsEntity> querySearchStr(Map<String, Object> map);



}
