package com.nongxinle.dao;

/**
 * 
 *
 * @author lpy
 * @date 06-16 11:26
 */

import com.nongxinle.entity.NxDepartmentUserEntity;

import java.util.List;


public interface NxDepartmentUserDao extends BaseDao<NxDepartmentUserEntity> {

    List<NxDepartmentUserEntity> queryAllUsersByDepId(Integer depId);

    List<NxDepartmentUserEntity> queryDepUserByOpenId(String openId);

    List<NxDepartmentUserEntity> queryGroupAdminUserAmount(Integer nxDuDepartmentId);
}
