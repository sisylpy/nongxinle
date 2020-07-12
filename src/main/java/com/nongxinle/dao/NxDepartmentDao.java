package com.nongxinle.dao;

/**
 * 
 *
 * @author lpy
 * @date 06-16 11:26
 */

import com.nongxinle.entity.NxDepartmentEntity;

import java.util.List;
import java.util.Map;


public interface NxDepartmentDao extends BaseDao<NxDepartmentEntity> {

    List<NxDepartmentEntity> queryDisDepartments(Map<String, Object> map);

    NxDepartmentEntity queryDepInfo(Integer nxDuDepartmentId);

    List<NxDepartmentEntity> querySubDepartments(Integer depId);

    List<NxDepartmentEntity> queryFatherDep(Integer depId);
}
