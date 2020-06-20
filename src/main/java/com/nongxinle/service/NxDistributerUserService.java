package com.nongxinle.service;

/**
 * 
 *
 * @author lpy
 * @date 06-20 10:21
 */

import com.nongxinle.entity.NxDistributerUserEntity;

import java.util.List;
import java.util.Map;

public interface NxDistributerUserService {
	
	NxDistributerUserEntity queryObject(Integer nxDistributerUserId);
	
	List<NxDistributerUserEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(NxDistributerUserEntity nxDistributerUser);
	
	void update(NxDistributerUserEntity nxDistributerUser);
	
	void delete(Integer nxDistributerUserId);
	
	void deleteBatch(Integer[] nxDistributerUserIds);

    List<NxDistributerUserEntity> queryUser(Integer disId);
}
