package com.nongxinle.dao;

/**
 * 
 *
 * @author lpy
 * @date 04-14 17:42
 */

import com.nongxinle.entity.NxCustomerUserEntity;
import com.nongxinle.entity.NxOrdersEntity;

import java.util.List;
import java.util.Map;


public interface NxCustomerUserDao extends BaseDao<NxCustomerUserEntity> {


    String queryOpenId(Integer nxOrdersUserId);

}
