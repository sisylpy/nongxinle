package com.nongxinle.service.impl;

import com.nongxinle.entity.NxGoodsEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxDistributerGoodsDao;
import com.nongxinle.entity.NxDistributerGoodsEntity;
import com.nongxinle.service.NxDistributerGoodsService;



@Service("nxDistributerGoodsService")
public class NxDistributerGoodsServiceImpl implements NxDistributerGoodsService {
	@Autowired
	private NxDistributerGoodsDao nxDistributerGoodsDao;
	
	@Override
	public NxDistributerGoodsEntity queryObject(Integer nxDistributerGoodsId){
		return nxDistributerGoodsDao.queryObject(nxDistributerGoodsId);
	}
	
	@Override
	public List<NxDistributerGoodsEntity> queryList(Map<String, Object> map){
		return nxDistributerGoodsDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return nxDistributerGoodsDao.queryTotal(map);
	}
	
	@Override
	public void save(NxDistributerGoodsEntity nxDistributerGoods){
		nxDistributerGoodsDao.save(nxDistributerGoods);
	}
	
	@Override
	public void update(NxDistributerGoodsEntity nxDistributerGoods){
		nxDistributerGoodsDao.update(nxDistributerGoods);
	}
	
	@Override
	public void delete(Integer nxDistributerGoodsId){
		nxDistributerGoodsDao.delete(nxDistributerGoodsId);
	}
	
	@Override
	public void deleteBatch(Integer[] nxDistributerGoodsIds){
		nxDistributerGoodsDao.deleteBatch(nxDistributerGoodsIds);
	}

    @Override
    public List<NxDistributerGoodsEntity> queryHasDisGoodsFather(Map<String, Object> map) {

		return nxDistributerGoodsDao.queryHasDisGoodsFather(map);
    }

    @Override
    public List<NxDistributerGoodsEntity> queryAddDistributerNxGoods(Map<String, Object> map) {

		return nxDistributerGoodsDao.queryAddDistributerNxGoods(map);
    }

    @Override
    public List<NxGoodsEntity> queryAllDistributerGoods(Integer disId) {

		return nxDistributerGoodsDao.queryAllDistributerGoods(disId);
    }

    @Override
    public Integer queryGrandSubAmount(Integer nxGrandGoodsId) {

		return nxDistributerGoodsDao.queryGrandSubAmount(nxGrandGoodsId);
    }

    @Override
    public List<NxGoodsEntity> queryDisGoodsGrandList(Map<String, Object> map) {

		return nxDistributerGoodsDao.queryDisGoodsGrandList(map);
    }

	@Override
	public NxDistributerGoodsEntity queryDisGoodsDetail(Integer disGoodsId) {
		return nxDistributerGoodsDao.queryDisGoodsDetail(disGoodsId);
	}

    @Override
    public List<NxGoodsEntity> queryDisGoodsCata(Integer disId) {

		return nxDistributerGoodsDao.queryDisGoodsCata(disId);
    }

    @Override
    public Integer querySubAmount(Integer nxGoodsId) {

		return nxDistributerGoodsDao.querySubAmount(nxGoodsId);
    }

	@Override
	public List<NxDistributerGoodsEntity> queryDisGoodsFatherList(Map<String, Object> map) {
		return nxDistributerGoodsDao.queryDisGoodsFatherList(map);
	}

    @Override
    public List<NxGoodsEntity> queryListWithFatherId(Map<String, Object> map) {

		return nxDistributerGoodsDao.queryListWithFatherId(map);
    }

    @Override
    public List<NxDistributerGoodsEntity> queryQuickSearch(String str) {

		return nxDistributerGoodsDao.queryQuickSearch(str);
    }


}
