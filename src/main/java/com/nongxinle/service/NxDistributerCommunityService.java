package com.nongxinle.service;

/**
 * 
 *
 * @author lpy
 * @date 05-09 21:11
 */

import com.nongxinle.entity.NxCommunityEntity;
import com.nongxinle.entity.NxDistributerCommunityEntity;

import java.util.List;
import java.util.Map;

public interface NxDistributerCommunityService {
	
	NxDistributerCommunityEntity queryObject(Integer nxDcId);
	
	List<NxDistributerCommunityEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(NxDistributerCommunityEntity nxDistributerCommunity);
	
	void update(NxDistributerCommunityEntity nxDistributerCommunity);
	
	void delete(Integer nxDcId);
	
	void deleteBatch(Integer[] nxDcIds);

    List<NxCommunityEntity> queryCommunityByDistributerId(Integer distributerId);
}
