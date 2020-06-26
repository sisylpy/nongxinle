package com.nongxinle.dao;

/**
 * 
 *
 * @author lpy
 * @date 2020-02-10 19:43:11
 */

import com.nongxinle.entity.NxGoodsEntity;

import java.util.List;
import java.util.Map;


public interface NxGoodsDao extends BaseDao<NxGoodsEntity> {

    List<NxGoodsEntity> getNxGoodsCateList();

    List<NxGoodsEntity> getNxFatherGoodsByFatherId(Integer fatherId);

    List<NxGoodsEntity> queryListWithFatherId(Map<String, Object> map);

    int queryTotalByFatherId(Integer fatherId);

    List<NxGoodsEntity> querySubNamesByFatherId(Integer nxGoodsId);

    List<NxGoodsEntity> queryGoodsCataByType(Integer type);

    List<NxGoodsEntity> queryDownloadGoods(String fatherId);

    List<NxGoodsEntity> queryGoodsTree();

    List<NxGoodsEntity> queryGoodsByFatherId(Integer fatherId);
}
