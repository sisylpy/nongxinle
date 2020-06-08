package com.nongxinle.service;

/**
 * 
 *
 * @author lpy
 * @date 2020-02-24 17:06:57
 */

import com.nongxinle.entity.NxCommunityFatherGoodsEntity;

import java.util.List;
import java.util.Map;

public interface NxCommunityFatherGoodsService {

	NxCommunityFatherGoodsEntity queryObject(Integer nxDfgId);
	
	List<NxCommunityFatherGoodsEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(NxCommunityFatherGoodsEntity nxDistributerFatherGoods);
	
	void update(NxCommunityFatherGoodsEntity nxDistributerFatherGoods);
	
	void delete(Integer nxDfgId);
	
	void deleteBatch(Integer[] nxDfgIds);

    List<NxCommunityFatherGoodsEntity> queryFatherGoodsByFatherId(Integer dgGoodsFatherId);

	List<NxCommunityFatherGoodsEntity> queryCataListByCommunityId(Integer communityId);
}
