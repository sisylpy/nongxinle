package com.nongxinle.service;

/**
 * 
 *
 * @author lpy
 * @date 2020-02-10 19:43:11
 */

import com.nongxinle.entity.NxDistributerUserEntity;

import java.util.List;
import java.util.Map;

public interface NxDistributerUserService {
	
	NxDistributerUserEntity queryObject(Integer distUserId);
	
	List<NxDistributerUserEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(NxDistributerUserEntity nxDistributerUser);
	
	void update(NxDistributerUserEntity nxDistributerUser);
	
	void delete(Integer distUserId);
	
	void deleteBatch(Integer[] distUserIds);

    List<NxDistributerUserEntity> queryUser(Integer disId);
}
