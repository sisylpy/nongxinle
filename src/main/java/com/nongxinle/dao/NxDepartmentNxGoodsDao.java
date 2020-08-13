package com.nongxinle.dao;

/**
 * 
 *
 * @author lpy
 * @date 07-24 13:00
 */

import com.nongxinle.entity.NxDepartmentGoodsEntity;
import com.nongxinle.entity.NxDepartmentNxGoodsEntity;

import java.util.List;
import java.util.Map;


public interface NxDepartmentNxGoodsDao extends BaseDao<NxDepartmentNxGoodsEntity> {

    List<NxDepartmentNxGoodsEntity> queryAddDepartmentNxGoods(Map<String, Object> map);

    List<NxDepartmentNxGoodsEntity> queryDepartmentNxGoods(Integer depId);

    List<NxDepartmentNxGoodsEntity> querySearchStr(Map<String, Object> map);
}
