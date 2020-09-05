package com.nongxinle.service;

/**
 * 
 *
 * @author lpy
 * @date 06-16 11:26
 */

import com.nongxinle.entity.NxDepartmentEntity;

import java.util.List;
import java.util.Map;

public interface NxDepartmentService {

	Integer saveNewRestraunt(NxDepartmentEntity dep);

	Map<String, Object> queryGroupAndUserInfo(Integer nxGroupUserId);

	Map<String, Object> queryDepAndUserInfo(Integer nxDepartmentUserId);


	NxDepartmentEntity queryObject(Integer nxDepartmentId);
	
	List<NxDepartmentEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(NxDepartmentEntity nxDepartment);
	
	void update(NxDepartmentEntity nxDepartment);
	
	void delete(Integer nxDepartmentId);
	
	void deleteBatch(Integer[] nxDepartmentIds);

	List<NxDepartmentEntity> queryDisDepartments(Map<String, Object> map);

	void saveSubDepartment(NxDepartmentEntity dep);



	void saveJustDepartment(NxDepartmentEntity nxDepartmentEntity);

	List<NxDepartmentEntity> querySubDepartments(Integer depId);

	List<NxDepartmentEntity> queryFatherDep(Integer depId);



}
