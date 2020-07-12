package com.nongxinle.dao;

/**
 * 
 *
 * @author lpy
 * @date 2020-02-10 19:43:11
 */

import com.nongxinle.entity.NxDepartmentUserEntity;
import com.nongxinle.entity.NxDistributerEntity;
import com.nongxinle.entity.NxDistributerUserEntity;

import java.util.List;
import java.util.Map;


public interface NxDistributerUserDao extends BaseDao<NxDistributerUserEntity> {

    List<NxDistributerUserEntity> queryUser(Integer disId);

    NxDistributerUserEntity queryUserInfo(Integer nxDistributerUserId);

    List<NxDistributerUserEntity> queryUserByOpenId(String openid);
}
