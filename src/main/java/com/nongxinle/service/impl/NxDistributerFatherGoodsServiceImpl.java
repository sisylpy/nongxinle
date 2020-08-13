package com.nongxinle.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxDistributerFatherGoodsDao;
import com.nongxinle.entity.NxDistributerFatherGoodsEntity;
import com.nongxinle.service.NxDistributerFatherGoodsService;



@Service("nxDistributerFatherGoodsService")
public class NxDistributerFatherGoodsServiceImpl implements NxDistributerFatherGoodsService {
	@Autowired
	private NxDistributerFatherGoodsDao nxDistributerFatherGoodsDao;
	
	@Override
	public NxDistributerFatherGoodsEntity queryObject(Integer nxDistributerFatherGoodsId){
		return nxDistributerFatherGoodsDao.queryObject(nxDistributerFatherGoodsId);
	}
	
	@Override
	public List<NxDistributerFatherGoodsEntity> queryList(Map<String, Object> map){
		return nxDistributerFatherGoodsDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return nxDistributerFatherGoodsDao.queryTotal(map);
	}
	
	@Override
	public void save(NxDistributerFatherGoodsEntity nxDistributerFatherGoods){
		nxDistributerFatherGoodsDao.save(nxDistributerFatherGoods);
	}
	
	@Override
	public void update(NxDistributerFatherGoodsEntity nxDistributerFatherGoods){
		nxDistributerFatherGoodsDao.update(nxDistributerFatherGoods);
	}
	
	@Override
	public void delete(Integer nxDistributerFatherGoodsId){
		nxDistributerFatherGoodsDao.delete(nxDistributerFatherGoodsId);
	}
	
	@Override
	public void deleteBatch(Integer[] nxDistributerFatherGoodsIds){
		nxDistributerFatherGoodsDao.deleteBatch(nxDistributerFatherGoodsIds);
	}

    @Override
    public List<NxDistributerFatherGoodsEntity> queryDisFatherGoods(Map<String, Object> map) {

		return nxDistributerFatherGoodsDao.queryDistFatherGoods(map);
    }

}