package com.nongxinle.service;

/**
 * 
 *
 * @author lpy
 * @date 07-27 17:38
 */

import com.nongxinle.entity.NxDistributerFatherGoodsEntity;
import com.nongxinle.entity.NxDistributerGoodsEntity;
import com.nongxinle.entity.NxGoodsEntity;

import java.util.List;
import java.util.Map;

public interface NxDistributerGoodsService {


	List<NxDistributerGoodsEntity> queryDisGoodsByParams(Map<String, Object> map);

	int queryDisGoodsTotal(Map<String, Object> map3);

//	///////////


	NxDistributerGoodsEntity queryObject(Integer nxDistributerGoodsId);
	
	List<NxDistributerGoodsEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(NxDistributerGoodsEntity nxDistributerGoods);
	
	void update(NxDistributerGoodsEntity nxDistributerGoods);
	
	void delete(Integer nxDistributerGoodsId);
	
	void deleteBatch(Integer[] nxDistributerGoodsIds);

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

    NxDistributerGoodsEntity queryObjectWithStandards(Integer nxDdgDisGoodsId);

	List<NxDistributerGoodsEntity> queryDisGoodsListByDisFatherId(Integer nxDgDfgGoodsFatherId);



//    List<NxDistributerGoodsEntity> queryHasDisGrandGoodsFather(Map<String, Object> map);
//
//	List<NxDistributerFatherGoodsEntity> queryHasDisGreatGrandGoodsFather(Map<String, Object> map);

//	List<NxDistributerGoodsEntity> queryDisGoodsListByFatherId(Map<String, Object> map);
}
