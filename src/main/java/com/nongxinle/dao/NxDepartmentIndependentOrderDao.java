package com.nongxinle.dao;

/**
 * 
 *
 * @author lpy
 * @date 08-01 13:09
 */

import com.nongxinle.entity.NxDepartmentIndependentOrderEntity;

import java.util.List;


public interface NxDepartmentIndependentOrderDao extends BaseDao<NxDepartmentIndependentOrderEntity> {

    List<NxDepartmentIndependentOrderEntity> queryGroupTodayIndependentOrder(Integer nxDuDepartmentId);
}
