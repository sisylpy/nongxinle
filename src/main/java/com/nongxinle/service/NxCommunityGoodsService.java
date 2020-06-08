package com.nongxinle.service;

/**
 * 
 *
 * @author lpy
 * @date 2020-02-10 19:43:11
 */

import com.nongxinle.entity.NxCommunityGoodsEntity;

import java.util.List;
import java.util.Map;

public interface NxCommunityGoodsService {
	
	NxCommunityGoodsEntity queryObject(Integer communityGoodsId);
	
	List<NxCommunityGoodsEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(NxCommunityGoodsEntity nxDistributerGoods);
	
	void update(NxCommunityGoodsEntity nxDistributerGoods);
	
	void delete(Integer disGoodsId);
	
	void deleteBatch(Integer[] disGoodsIds);


	List<NxCommunityGoodsEntity> queryCommunityGoods(Map<String, Object> map);

	int queryTotalByFatherId(Map<String, Object> map);

	List<NxCommunityGoodsEntity> queryDisDownloadGoods(Map<String, Object> map);

//	NxCommunityGoodsEntity queryGoods(Map<String, Object> map);
//
//    List<NxCommunityGoodsEntity> queryPlanGoods(Map<String, Object> planMap);

	List<NxCommunityGoodsEntity> queryPurchaseGoods(Map<String, Object> map);

    List<NxCommunityGoodsEntity> queryCommunityDownloadGoods(Map<String, Object> map);

	List<NxCommunityGoodsEntity> querySupplierGoods(Map<String, Object> map);

	List<NxCommunityGoodsEntity>  queryHasNxGoodsFather(Map<String, Object> map);

    List<NxCommunityGoodsEntity> queryStockGoods(Map<String, Object> map);

	List<NxCommunityGoodsEntity> queryCommunityGoodsWithPinyin(Map<String, Object> map);
}
