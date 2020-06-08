package com.nongxinle.service;

/**
 * 
 *
 * @author lpy
 * @date 05-25 08:54
 */

import com.nongxinle.entity.NxPromoteEntity;

import java.util.List;
import java.util.Map;

public interface NxPromoteService {
	
	NxPromoteEntity queryObject(Integer nxPromoteId);
	
	List<NxPromoteEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(NxPromoteEntity nxPromote);
	
	void update(NxPromoteEntity nxPromote);
	
	void delete(Integer nxPromoteId);
	
	void deleteBatch(Integer[] nxPromoteIds);

    List<NxPromoteEntity> getListByCommunityId(Integer communityId);

    List<NxPromoteEntity> queryPromoteByFatherId(Integer nxCommunityFatherGoodsId);
}
