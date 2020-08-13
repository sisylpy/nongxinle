package com.nongxinle.service;

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

public interface NxDistributerGoodsService {
	
	NxDistributerGoodsEntity queryObject(Integer nxDistributerGoodsId);
	
	List<NxDistributerGoodsEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(NxDistributerGoodsEntity nxDistributerGoods);
	
	void update(NxDistributerGoodsEntity nxDistributerGoods);
	
	void delete(Integer nxDistributerGoodsId);
	
	void deleteBatch(Integer[] nxDistributerGoodsIds);

    List<NxDistributerGoodsEntity> queryHasDisGoodsFather(Map<String, Object> map);

    List<NxDistributerGoodsEntity> queryAddDistributerNxGoods(Map<String, Object> map);

	List<NxGoodsEntity> queryAllDistributerGoods(Integer disId);

    Integer queryGrandSubAmount(Integer nxGrandGoodsId);

	List<NxGoodsEntity> queryDisGoodsGrandList(Map<String, Object> map);

    NxDistributerGoodsEntity queryDisGoodsDetail(Integer disGoodsId);

    List<NxGoodsEntity> queryDisGoodsCata(Integer disId);

	Integer querySubAmount(Integer nxGoodsId);

	List<NxDistributerGoodsEntity> queryDisGoodsFatherList(Map<String, Object> map);

    List<NxGoodsEntity> queryListWithFatherId(Map<String, Object> map);

    List<NxDistributerGoodsEntity> queryQuickSearch(String str);
}
