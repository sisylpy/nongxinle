package com.nongxinle.service.impl;

import com.nongxinle.entity.NxDepartmentGoodsEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxDepartmentNxGoodsDao;
import com.nongxinle.entity.NxDepartmentNxGoodsEntity;
import com.nongxinle.service.NxDepartmentNxGoodsService;



@Service("nxDepartmentNxGoodsService")
public class NxDepartmentNxGoodsServiceImpl implements NxDepartmentNxGoodsService {
	@Autowired
	private NxDepartmentNxGoodsDao nxDepartmentNxGoodsDao;
	
	@Override
	public NxDepartmentNxGoodsEntity queryObject(Integer nxDepartmentNxGoodsId){
		return nxDepartmentNxGoodsDao.queryObject(nxDepartmentNxGoodsId);
	}
	
	@Override
	public List<NxDepartmentNxGoodsEntity> queryList(Map<String, Object> map){
		return nxDepartmentNxGoodsDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return nxDepartmentNxGoodsDao.queryTotal(map);
	}
	
	@Override
	public void save(NxDepartmentNxGoodsEntity nxDepartmentNxGoods){
		nxDepartmentNxGoodsDao.save(nxDepartmentNxGoods);
	}
	
	@Override
	public void update(NxDepartmentNxGoodsEntity nxDepartmentNxGoods){
		nxDepartmentNxGoodsDao.update(nxDepartmentNxGoods);
	}
	
	@Override
	public void delete(Integer nxDepartmentNxGoodsId){
		nxDepartmentNxGoodsDao.delete(nxDepartmentNxGoodsId);
	}
	
	@Override
	public void deleteBatch(Integer[] nxDepartmentNxGoodsIds){
		nxDepartmentNxGoodsDao.deleteBatch(nxDepartmentNxGoodsIds);
	}

    @Override
    public List<NxDepartmentNxGoodsEntity> queryAddDepartmentNxGoods(Map<String, Object> map) {

		return nxDepartmentNxGoodsDao.queryAddDepartmentNxGoods(map);
    }

    @Override
    public List<NxDepartmentNxGoodsEntity> queryDepartmentNxGoods(Integer depId) {

		return nxDepartmentNxGoodsDao.queryDepartmentNxGoods(depId);
    }

    @Override
    public List<NxDepartmentNxGoodsEntity> querySearchStr(Map<String, Object> map) {

		return nxDepartmentNxGoodsDao.querySearchStr(map);
    }

}
