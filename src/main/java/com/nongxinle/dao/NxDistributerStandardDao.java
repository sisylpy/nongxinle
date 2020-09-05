package com.nongxinle.dao;

/**
 * 
 *
 * @author lpy
 * @date 07-27 21:41
 */

import com.nongxinle.entity.NxDistributerStandardEntity;

import java.util.List;


public interface NxDistributerStandardDao extends BaseDao<NxDistributerStandardEntity> {

    List<NxDistributerStandardEntity> queryDisStandardByDisGoodsId(Integer nxDdgDisGoodsId);
}
