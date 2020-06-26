package com.nongxinle.dao;

/**
 * 
 *
 * @author lpy
 * @date 04-14 17:42
 */

import com.nongxinle.entity.NxCustomerUserEntity;


public interface NxCustomerUserDao extends BaseDao<NxCustomerUserEntity> {


    String queryOpenId(Integer nxOrdersUserId);

}
