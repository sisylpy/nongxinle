package com.nongxinle.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxDepartmentGoodsDao;
import com.nongxinle.entity.NxDepartmentGoodsEntity;
import com.nongxinle.service.NxDepartmentGoodsService;



@Service("nxDepartmentGoodsService")
public class NxDepartmentGoodsServiceImpl implements NxDepartmentGoodsService {
	@Autowired
	private NxDepartmentGoodsDao nxDepartmentGoodsDao;
	
	@Override
	public NxDepartmentGoodsEntity queryObject(Integer nxCommunityGoodsId){
		return nxDepartmentGoodsDao.queryObject(nxCommunityGoodsId);
	}
	
	@Override
	public List<NxDepartmentGoodsEntity> queryList(Map<String, Object> map){
		return nxDepartmentGoodsDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return nxDepartmentGoodsDao.queryTotal(map);
	}
	
	@Override
	public void save(NxDepartmentGoodsEntity nxDepartmentGoods){
		nxDepartmentGoodsDao.save(nxDepartmentGoods);
	}
	
	@Override
	public void update(NxDepartmentGoodsEntity nxDepartmentGoods){
		nxDepartmentGoodsDao.update(nxDepartmentGoods);
	}
	
	@Override
	public void delete(Integer nxCommunityGoodsId){
		nxDepartmentGoodsDao.delete(nxCommunityGoodsId);
	}
	
	@Override
	public void deleteBatch(Integer[] nxCommunityGoodsIds){
		nxDepartmentGoodsDao.deleteBatch(nxCommunityGoodsIds);
	}

    @Override
    public List<NxDepartmentGoodsEntity> queryDepartGoods(Integer depId) {

		return  nxDepartmentGoodsDao.queryAllDepartmentGoods(depId);
    }

    @Override
    public List<NxDepartmentGoodsEntity> queryDepGoodsByFatherId(Map<String, Object> map) {

		return nxDepartmentGoodsDao.queryDepGoodsByFatherId(map);
    }

    @Override
    public List<NxDepartmentGoodsEntity> queryIfHasDepartmentGoods(Map<String, Object> map) {

		return nxDepartmentGoodsDao.queryIfHasDepartmentGoods(map);
	}

}
