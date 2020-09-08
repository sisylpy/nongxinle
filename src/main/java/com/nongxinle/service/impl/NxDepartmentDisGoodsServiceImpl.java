package com.nongxinle.service.impl;

import com.nongxinle.entity.*;
import com.nongxinle.service.NxDepartmentStandardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxDepartmentDisGoodsDao;
import com.nongxinle.service.NxDepartmentDisGoodsService;



@Service("nxDepartmentDisGoodsService")
public class NxDepartmentDisGoodsServiceImpl implements NxDepartmentDisGoodsService {
	@Autowired
	private NxDepartmentDisGoodsDao nxDepartmentDisGoodsDao;


	@Override
	public List<NxDepartmentEntity> queryDepartmentsByDisGoodsId(Integer disGoodsId) {
		return nxDepartmentDisGoodsDao.queryDepartmentsByDisGoodsId(disGoodsId);
	}

	@Override
	public List<NxDistributerFatherGoodsEntity> depGetDepDisGoodsCata(Integer depId) {
		return nxDepartmentDisGoodsDao.depGetDepDisGoodsCata(depId);
	}

	@Override
	public List<NxDepartmentDisGoodsEntity> queryDepGoodsByFatherId(Map<String, Object> map) {
		return nxDepartmentDisGoodsDao.queryDepGoodsByFatherId(map);
	}
	@Override
	public List<NxDepartmentDisGoodsEntity> queryAddDisDepGoods(Map<String, Object> map) {
		return nxDepartmentDisGoodsDao.queryDisDepGoods(map);
	}

    @Override
    public int queryDepGoodsTotal(Map<String, Object> map3) {
		return nxDepartmentDisGoodsDao.queryDisGoodsTotal(map3);
    }


//	///////



	@Override
	public NxDepartmentDisGoodsEntity queryObject(Integer nxDepartmentDisGoodsId){
		return nxDepartmentDisGoodsDao.queryObject(nxDepartmentDisGoodsId);
	}
	
	@Override
	public List<NxDepartmentDisGoodsEntity> queryList(Map<String, Object> map){
		return nxDepartmentDisGoodsDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return nxDepartmentDisGoodsDao.queryTotal(map);
	}
	
	@Override
	public void save(NxDepartmentDisGoodsEntity nxDepartmentDisGoods){

		nxDepartmentDisGoodsDao.save(nxDepartmentDisGoods);

	}
	
	@Override
	public void update(NxDepartmentDisGoodsEntity nxDepartmentDisGoods){
		nxDepartmentDisGoodsDao.update(nxDepartmentDisGoods);
	}
	
	@Override
	public void delete(Integer nxDepartmentDisGoodsId){
		nxDepartmentDisGoodsDao.delete(nxDepartmentDisGoodsId);
	}
	
	@Override
	public void deleteBatch(Integer[] nxDepartmentDisGoodsIds){
		nxDepartmentDisGoodsDao.deleteBatch(nxDepartmentDisGoodsIds);
	}




    @Override
    public List<NxGoodsEntity> querySearchStr(Map<String, Object> map) {

		return nxDepartmentDisGoodsDao.querySearchStr (map);
    }



}
