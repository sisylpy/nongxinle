package com.nongxinle.dao;

/**
 * 
 *
 * @author lpy
 * @date 03-27 00:53
 */

import com.nongxinle.entity.NxRouteEntity;

import java.util.List;


public interface NxRouteDao extends BaseDao<NxRouteEntity> {

    List<NxRouteEntity> queryAll();

}
