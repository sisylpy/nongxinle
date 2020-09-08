package com.nongxinle.dao;

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


public interface NxDistributerDepartmentDao extends BaseDao<NxDistributerDepartmentEntity> {

//    List<NxDistributerDepartmentEntity> queryAllCustomer(Integer disId);

    List<NxDepartmentEntity> queryAllDisDepartments(Integer disId);
}
