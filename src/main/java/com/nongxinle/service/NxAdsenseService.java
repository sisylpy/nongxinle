package com.nongxinle.service;

/**
 * 
 *
 * @author lpy
 * @date 05-26 16:23
 */

import com.nongxinle.entity.NxAdsenseEntity;

import java.util.List;
import java.util.Map;

public interface NxAdsenseService {
	
	NxAdsenseEntity queryObject(Integer nxAdsenseId);
	
	List<NxAdsenseEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(NxAdsenseEntity nxAdsense);
	
	void update(NxAdsenseEntity nxAdsense);
	
	void delete(Integer nxAdsenseId);
	
	void deleteBatch(Integer[] nxAdsenseIds);

    List<NxAdsenseEntity> getListByCommunityId(Integer communityId);

	List<NxAdsenseEntity> queryAdsenseByNxCommunityId(Integer communityId);
}
