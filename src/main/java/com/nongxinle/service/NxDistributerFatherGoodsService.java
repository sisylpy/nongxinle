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

public interface NxDistributerFatherGoodsService {
	
	NxDistributerFatherGoodsEntity queryObject(Integer nxDistributerFatherGoodsId);
	
	List<NxDistributerFatherGoodsEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(NxDistributerFatherGoodsEntity nxDistributerFatherGoods);
	
	void update(NxDistributerFatherGoodsEntity nxDistributerFatherGoods);
	
	void delete(Integer nxDistributerFatherGoodsId);
	
	void deleteBatch(Integer[] nxDistributerFatherGoodsIds);


    List<NxDistributerFatherGoodsEntity> queryDistributerGoodsCata(Integer disId);

    List<NxDistributerFatherGoodsEntity> queryHasDisGrandGoodsFather(Map<String, Object> map2);

    List<NxDistributerFatherGoodsEntity> queryHasDisGreatGrandGoodsFather(Map<String, Object> map3);
}
