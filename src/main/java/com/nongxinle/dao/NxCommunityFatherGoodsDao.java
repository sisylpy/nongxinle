package com.nongxinle.dao;

/**
 * 
 *
 * @author lpy
 * @date 2020-02-24 17:06:57
 */

import com.nongxinle.entity.NxCommunityFatherGoodsEntity;

import java.util.List;


public interface NxCommunityFatherGoodsDao extends BaseDao<NxCommunityFatherGoodsEntity> {

    List<NxCommunityFatherGoodsEntity> queryFatherGoods(Integer dgGoodsFatherId);

    List<NxCommunityFatherGoodsEntity> queryCataListByCommunityId(Integer communityId);
}
