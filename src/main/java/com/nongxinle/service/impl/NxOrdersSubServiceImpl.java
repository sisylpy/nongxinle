package com.nongxinle.service.impl;

import com.nongxinle.entity.NxOrdersEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxOrdersSubDao;
import com.nongxinle.entity.NxOrdersSubEntity;
import com.nongxinle.service.NxOrdersSubService;



@Service("nxOrdersSubService")
public class NxOrdersSubServiceImpl implements NxOrdersSubService {
	@Autowired
	private NxOrdersSubDao nxOrdersSubDao;
	
	@Override
	public NxOrdersSubEntity queryObject(Integer nxOrdersSubId){
		return nxOrdersSubDao.queryObject(nxOrdersSubId);
	}
	
	@Override
	public List<NxOrdersSubEntity> queryList(Map<String, Object> map){
		return nxOrdersSubDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return nxOrdersSubDao.queryTotal(map);
	}
	
	@Override
	public void save(NxOrdersSubEntity nxOrdersSub){
		nxOrdersSubDao.save(nxOrdersSub);
	}
	
	@Override
	public void update(NxOrdersSubEntity nxOrdersSub){
		nxOrdersSubDao.update(nxOrdersSub);
	}
	
	@Override
	public void delete(Integer nxOrdersSubId){
		nxOrdersSubDao.delete(nxOrdersSubId);
	}
	
	@Override
	public void deleteBatch(Integer[] nxOrdersSubIds){
		nxOrdersSubDao.deleteBatch(nxOrdersSubIds);
	}

    @Override
    public List<NxOrdersSubEntity> queryToPurchaseGoods(Map<String, Object> map) {

		return nxOrdersSubDao.queryPurchaseGoods(map);
    }

	@Override
	public List<NxOrdersSubEntity> querySubsByGoodsId(Map<String, Object> subMap) {
		return nxOrdersSubDao.querySubsByGoodsId(subMap);
	}

	@Override
	public List<NxOrdersSubEntity> querySubOrdersByCustomerUserId(Map<String, Object> map) {
		return nxOrdersSubDao.querySubOrdersByCustomerUserId(map);
	}

    @Override
    public List<NxOrdersEntity> queryOutGoodsByType(Map<String, Object> map) {
        return nxOrdersSubDao.queryOutGoodsByType(map);
    }

	@Override
	public List<NxOrdersSubEntity> querySubGoodsByOrderId(Integer integer) {
		return nxOrdersSubDao.querySubGoodsByOrderId(integer);
	}

	@Override
	public List<NxOrdersSubEntity> queryCommGoodsOfSubs(Integer fatherId) {
		return nxOrdersSubDao.queryCommGoodsOfSubs(fatherId);
	}


}
