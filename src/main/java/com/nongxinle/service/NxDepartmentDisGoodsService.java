package com.nongxinle.service;

/**
 * 
 *
 * @author lpy
 * @date 07-30 23:58
 */

import com.nongxinle.entity.NxDepartmentDisGoodsEntity;
import com.nongxinle.entity.NxDistributerGoodsEntity;
import com.nongxinle.entity.NxGoodsEntity;

import java.util.List;
import java.util.Map;

public interface NxDepartmentDisGoodsService {
	
	NxDepartmentDisGoodsEntity queryObject(Integer nxDepartmentDisGoodsId);
	
	List<NxDepartmentDisGoodsEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(NxDepartmentDisGoodsEntity nxDepartmentDisGoods);
	
	void update(NxDepartmentDisGoodsEntity nxDepartmentDisGoods);
	
	void delete(Integer nxDepartmentDisGoodsId);
	
	void deleteBatch(Integer[] nxDepartmentDisGoodsIds);

    List<NxDepartmentDisGoodsEntity> queryAddDisDepGoods(Map<String, Object> map);

    List<NxGoodsEntity> depGetDepDisGoodsCata(Integer depId);

    List<NxGoodsEntity> querySearchStr(Map<String, Object> map);

	List<NxGoodsEntity> queryDepGoodsByFatherId(Map<String, Object> map);

    List<NxGoodsEntity> queryResGoodsDetail(Integer depDisGoodsId);
}
