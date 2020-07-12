package com.nongxinle.service;

/**
 * 
 *
 * @author lpy
 * @date 06-17 23:53
 */

import com.nongxinle.entity.NxDepartmentGoodsEntity;

import java.util.List;
import java.util.Map;

public interface NxDepartmentGoodsService {
	
	NxDepartmentGoodsEntity queryObject(Integer nxCommunityGoodsId);
	
	List<NxDepartmentGoodsEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(NxDepartmentGoodsEntity nxDepartmentGoods);
	
	void update(NxDepartmentGoodsEntity nxDepartmentGoods);
	
	void delete(Integer nxCommunityGoodsId);
	
	void deleteBatch(Integer[] nxCommunityGoodsIds);

    List<NxDepartmentGoodsEntity> queryDepartGoods(Integer depId);

    List<NxDepartmentGoodsEntity> queryDepGoodsByFatherId(Map<String, Object> map);

	List<NxDepartmentGoodsEntity> queryIfHasDepartmentGoods(Map<String, Object> map);
}
