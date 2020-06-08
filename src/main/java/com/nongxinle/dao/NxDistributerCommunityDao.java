package com.nongxinle.dao;

/**
 * 
 *
 * @author lpy
 * @date 05-09 21:11
 */

import com.nongxinle.entity.NxCommunityEntity;
import com.nongxinle.entity.NxDistributerCommunityEntity;

import java.util.List;


public interface NxDistributerCommunityDao extends BaseDao<NxDistributerCommunityEntity> {

    List<NxCommunityEntity> queryCommunityByDistrbuterId(Integer distributerId);
}
