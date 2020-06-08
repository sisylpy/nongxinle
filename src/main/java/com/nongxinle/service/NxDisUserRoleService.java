package com.nongxinle.service;

/**
 * 用户与角色对应关系
 *
 * @author lpy
 * @date 2020-03-23 13:42:33
 */

import com.nongxinle.entity.NxDisUserRoleEntity;

import java.util.List;
import java.util.Map;

public interface NxDisUserRoleService {
	
	NxDisUserRoleEntity queryObject(Long id);
	
	List<NxDisUserRoleEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(NxDisUserRoleEntity nxDisUserRole);
	
	void update(NxDisUserRoleEntity nxDisUserRole);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
