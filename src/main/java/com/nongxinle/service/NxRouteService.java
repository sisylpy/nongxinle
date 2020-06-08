package com.nongxinle.service;

/**
 * 
 *
 * @author lpy
 * @date 03-27 00:53
 */

import com.nongxinle.entity.NxRouteEntity;

import java.util.List;
import java.util.Map;

public interface NxRouteService {
	
	NxRouteEntity queryObject(Integer nxRouteId);
	
	List<NxRouteEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(NxRouteEntity nxRoute);
	
	void update(NxRouteEntity nxRoute);
	
	void delete(Integer nxRouteId);
	
	void deleteBatch(Integer[] nxRouteIds);

    List<NxRouteEntity> queryRoute();


}
