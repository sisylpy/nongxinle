package com.nongxinle.service;

/**
 * 
 *
 * @author lpy
 * @date 06-17 23:53
 */

import com.nongxinle.entity.NxDepartmentFatherGoodsEntity;

import java.util.List;
import java.util.Map;

public interface NxDepartmentFatherGoodsService {
	
	NxDepartmentFatherGoodsEntity queryObject(Integer nxCommunityFatherGoodsId);
	
	List<NxDepartmentFatherGoodsEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(NxDepartmentFatherGoodsEntity nxDepartmentFatherGoods);
	
	void update(NxDepartmentFatherGoodsEntity nxDepartmentFatherGoods);
	
	void delete(Integer nxCommunityFatherGoodsId);
	
	void deleteBatch(Integer[] nxCommunityFatherGoodsIds);
}
