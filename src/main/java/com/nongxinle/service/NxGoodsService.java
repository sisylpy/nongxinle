package com.nongxinle.service;

/**
 * 
 *
 * @author lpy
 * @date 2020-02-10 19:43:11
 */

import com.nongxinle.entity.NxGoodsEntity;

import java.util.List;
import java.util.Map;

public interface NxGoodsService {

	List<NxGoodsEntity> queryNxGoodsByParams(Map<String, Object> map);



//	///////




	NxGoodsEntity queryObject(Integer nxGoodsId);
	
	List<NxGoodsEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(NxGoodsEntity nxGoods);
	
	void update(NxGoodsEntity nxGoods);
	
	void delete(Integer nxGoodsId);
	
	void deleteBatch(Integer[] nxGoodsIds);

	List<NxGoodsEntity> getiBookCoverData();

	List<NxGoodsEntity> getAllFatherGoods(Integer fatherId);

	List<NxGoodsEntity> queryListWithFatherId(Map<String, Object> map);


	int queryTotalByFatherId(Integer fatherId);

	List<NxGoodsEntity> querySubNameByFatherId(Integer nxGoodsId);

    List<NxGoodsEntity> queryGoodsCataByType(Integer type);

	List<NxGoodsEntity> downloadGoods(String fatherId);

    List<NxGoodsEntity> queryGoodsTree();

    List<NxGoodsEntity> queryGoodsByFatherId(Integer fatherId);

    List<NxGoodsEntity> queryQuickSearch(String str);

}
