package com.nongxinle.dao;

/**
 * 
 *
 * @author lpy
 * @date 07-27 17:38
 */

import com.nongxinle.entity.NxDistributerGoodsEntity;
import com.nongxinle.entity.NxGoodsEntity;

import java.util.List;
import java.util.Map;


public interface NxDistributerGoodsDao extends BaseDao<NxDistributerGoodsEntity> {

    List<NxDistributerGoodsEntity> queryDisGoodsByParams(Map<String, Object> map);

    int queryDisGoodsTotal(Map<String, Object> map3);

    List<NxDistributerGoodsEntity> queryDisGoodsListByDisFatherId(Integer nxDgDfgGoodsFatherId);





///////

    List<NxDistributerGoodsEntity> queryDisGoodsHasNxGoodsFather(Map<String, Object> map);

    List<NxDistributerGoodsEntity> queryAddDistributerNxGoods(Map<String, Object> map);

    List<NxGoodsEntity> queryAllDistributerGoodsCata(Integer disId);

    Integer queryGrandSubAmount(Integer nxGrandGoodsId);

    List<NxGoodsEntity> queryDisGoodsGrandList(Map<String, Object> map);

    NxDistributerGoodsEntity queryDisGoodsDetail(Integer disGoodsId);

    List<NxGoodsEntity> queryDisGoodsCata(Integer disId);

    Integer querySubAmount(Integer nxGoodsId);

    List<NxDistributerGoodsEntity> queryDisGoodsFatherList(Map<String, Object> map);

    List<NxGoodsEntity> queryDisGoodsListWithFatherId(Map<String, Object> map);

    List<NxDistributerGoodsEntity> queryQuickSearch(Map<String, Object> map);

    NxDistributerGoodsEntity queryDisGoodsWithStandards(Integer nxDdgDisGoodsId);




//    List<NxDistributerGoodsEntity> queryHasDisGrandGoodsFather(Map<String, Object> map);
//
//    List<NxDistributerGoodsEntity> queryHasDisGreatGrandGoodsFather(Map<String, Object> map);

//    List<NxDistributerGoodsEntity> queryDisGoodsByFatherId(Map<String, Object> map);
}
