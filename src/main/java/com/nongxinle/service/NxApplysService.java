package com.nongxinle.service;

/**
 * 
 *
 * @author lpy
 * @date 2020-02-10 19:43:11
 */

import com.nongxinle.entity.NxApplysEntity;

import java.util.List;
import java.util.Map;

public interface NxApplysService {
	
	NxApplysEntity queryObject(Integer nxApplysId);
	
	List<NxApplysEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(NxApplysEntity nxApplys);
	
	void update(NxApplysEntity nxApplys);
	
	void delete(Integer nxApplysId);
	
	void deleteBatch(Integer[] nxApplysIds);
}
