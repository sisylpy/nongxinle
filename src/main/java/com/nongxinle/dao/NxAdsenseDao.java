package com.nongxinle.dao;

/**
 * 
 *
 * @author lpy
 * @date 05-26 16:23
 */

import com.nongxinle.entity.NxAdsenseEntity;

import java.util.List;


public interface NxAdsenseDao extends BaseDao<NxAdsenseEntity> {

    List<NxAdsenseEntity> getListByCommunityId(Integer communityId);

    List<NxAdsenseEntity> queryAdsenseByNxCommunityId(Integer communityId);


    ;



}
