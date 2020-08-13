package com.nongxinle.service;

/**
 * 
 *
 * @author lpy
 * @date 07-24 13:00
 */

import com.nongxinle.entity.NxDepartmentGoodsEntity;
import com.nongxinle.entity.NxDepartmentNxGoodsEntity;

import java.util.List;
import java.util.Map;

public interface NxDepartmentNxGoodsService {
	
	NxDepartmentNxGoodsEntity queryObject(Integer nxDepartmentNxGoodsId);
	
	List<NxDepartmentNxGoodsEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(NxDepartmentNxGoodsEntity nxDepartmentNxGoods);
	
	void update(NxDepartmentNxGoodsEntity nxDepartmentNxGoods);
	
	void delete(Integer nxDepartmentNxGoodsId);
	
	void deleteBatch(Integer[] nxDepartmentNxGoodsIds);

    List<NxDepartmentNxGoodsEntity> queryAddDepartmentNxGoods(Map<String, Object> map);

	List<NxDepartmentNxGoodsEntity> queryDepartmentNxGoods(Integer depId);

    List<NxDepartmentNxGoodsEntity> querySearchStr(Map<String, Object> map);
}
