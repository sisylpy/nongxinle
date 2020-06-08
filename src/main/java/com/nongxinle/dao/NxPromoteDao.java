package com.nongxinle.dao;

/**
 * 
 *
 * @author lpy
 * @date 05-25 08:54
 */

import com.nongxinle.entity.NxPromoteEntity;

import java.util.List;


public interface NxPromoteDao extends BaseDao<NxPromoteEntity> {

    List<NxPromoteEntity> getListByCommunityId(Integer communityId);

    List<NxPromoteEntity> queryPromoteByFatherId(Integer nxCommunityFatherGoodsId);
}
