package com.nongxinle.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxDepartmentFatherGoodsDao;
import com.nongxinle.entity.NxDepartmentFatherGoodsEntity;
import com.nongxinle.service.NxDepartmentFatherGoodsService;



@Service("nxDepartmentFatherGoodsService")
public class NxDepartmentFatherGoodsServiceImpl implements NxDepartmentFatherGoodsService {
	@Autowired
	private NxDepartmentFatherGoodsDao nxDepartmentFatherGoodsDao;
	
	@Override
	public NxDepartmentFatherGoodsEntity queryObject(Integer nxCommunityFatherGoodsId){
		return nxDepartmentFatherGoodsDao.queryObject(nxCommunityFatherGoodsId);
	}
	
	@Override
	public List<NxDepartmentFatherGoodsEntity> queryList(Map<String, Object> map){
		return nxDepartmentFatherGoodsDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return nxDepartmentFatherGoodsDao.queryTotal(map);
	}
	
	@Override
	public void save(NxDepartmentFatherGoodsEntity nxDepartmentFatherGoods){
		nxDepartmentFatherGoodsDao.save(nxDepartmentFatherGoods);
	}
	
	@Override
	public void update(NxDepartmentFatherGoodsEntity nxDepartmentFatherGoods){
		nxDepartmentFatherGoodsDao.update(nxDepartmentFatherGoods);
	}
	
	@Override
	public void delete(Integer nxCommunityFatherGoodsId){
		nxDepartmentFatherGoodsDao.delete(nxCommunityFatherGoodsId);
	}
	
	@Override
	public void deleteBatch(Integer[] nxCommunityFatherGoodsIds){
		nxDepartmentFatherGoodsDao.deleteBatch(nxCommunityFatherGoodsIds);
	}
	
}
