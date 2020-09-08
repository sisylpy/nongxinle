package com.nongxinle.service;

/**
 * 
 *
 * @author lpy
 * @date 05-09 21:11
 */

import com.nongxinle.entity.NxDepartmentEntity;
import com.nongxinle.entity.NxDistributerCommunityEntity;
import com.nongxinle.entity.NxDistributerDepartmentEntity;

import java.util.List;
import java.util.Map;

public interface NxDistributerDepartmentService {

	List<NxDepartmentEntity> queryAllDisDepartments(Integer disId);


//	/////////


	NxDistributerDepartmentEntity queryObject(Integer nxDistributerDepId);
	
	List<NxDistributerDepartmentEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(NxDistributerDepartmentEntity nxDistributerDepartment);
	
	void update(NxDistributerDepartmentEntity nxDistributerDepartment);
	
	void delete(Integer nxDistributerDepId);
	
	void deleteBatch(Integer[] nxDistributerDepIds);


}
