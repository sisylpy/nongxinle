package com.nongxinle.service;

/**
 * 
 *
 * @author lpy
 * @date 05-21 22:15
 */

import com.nongxinle.entity.NxOrdersEntity;
import com.nongxinle.entity.NxWxOrdersEntity;
import org.springframework.http.HttpRequest;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

public interface NxWxOrdersService {
	
	NxWxOrdersEntity queryObject(Integer nxWxOrdersId);
	
	List<NxWxOrdersEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(NxWxOrdersEntity nxWxOrders);
	
	void update(NxWxOrdersEntity nxWxOrders);
	
	void delete(Integer nxWxOrdersId);
	
	void deleteBatch(Integer[] nxWxOrdersIds);

    Boolean saveWxOrders(NxOrdersEntity nxOrders, HttpServletRequest request);

}
