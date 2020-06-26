package com.nongxinle.service;

/**
 * 
 *
 * @author lpy
 * @date 2020-02-10 19:43:11
 */

import com.nongxinle.entity.NxDistributerEntity;

import java.util.List;
import java.util.Map;

public interface NxDistributerService {
	
	NxDistributerEntity queryObject(Integer distributerId);
	
	List<NxDistributerEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(NxDistributerEntity nxDistributer);
	
	void update(NxDistributerEntity nxDistributer);
	
	void delete(Integer distributerId);
	
	void deleteBatch(Integer[] distributerIds);

}
