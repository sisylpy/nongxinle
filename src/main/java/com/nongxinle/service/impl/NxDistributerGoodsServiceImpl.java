package com.nongxinle.service.impl;

import com.nongxinle.entity.NxDistributerStandardEntity;
import com.nongxinle.entity.NxGoodsEntity;
import com.nongxinle.service.NxDepartmentStandardService;
import com.nongxinle.service.NxDistributerStandardService;
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
	public List<NxDistributerGoodsEntity> queryDisGoodsByParams(Map<String, Object> map) {
		return nxDistributerGoodsDao.queryDisGoodsByParams(map);
	}

	@Override
	public int queryDisGoodsTotal(Map<String, Object> map3) {
		return nxDistributerGoodsDao.queryDisGoodsTotal(map3);
	}

	@Override
	public List<NxDistributerGoodsEntity> queryDisGoodsListByDisFatherId(Integer nxDgDfgGoodsFatherId) {
		return nxDistributerGoodsDao.queryDisGoodsListByDisFatherId(nxDgDfgGoodsFatherId);
	}




//	//////////////////////




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

//		Integer distributerGoodsId = nxDistributerGoods.getNxDistributerGoodsId();

//		List<NxDistributerStandardEntity> disStandardEntities = nxDistributerGoods.getDistributerStandardEntities();
//		if(disStandardEntities.size() > 0){
//			for (NxDistributerStandardEntity standard : disStandardEntities) {
//				standard.setNxDsDisGoodsId(distributerGoodsId);
//				nxDistributerStandardService.save(standard);
//			}
//		}



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
    public List<NxDistributerGoodsEntity> queryDisGoodsHasNxGoodsFather(Map<String, Object> map) {

		return nxDistributerGoodsDao.queryDisGoodsHasNxGoodsFather(map);
    }

    @Override
    public List<NxDistributerGoodsEntity> queryAddDistributerNxGoods(Map<String, Object> map) {

		return nxDistributerGoodsDao.queryAddDistributerNxGoods(map);
    }

    @Override
    public List<NxGoodsEntity> queryAllDistributerGoodsCata(Integer disId) {

		return nxDistributerGoodsDao.queryAllDistributerGoodsCata(disId);
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
    public List<NxGoodsEntity> queryDisGoodsListWithFatherId(Map<String, Object> map) {

		return nxDistributerGoodsDao.queryDisGoodsListWithFatherId(map);
    }

    @Override
    public List<NxDistributerGoodsEntity> queryQuickSearch(Map<String, Object> map) {

		return nxDistributerGoodsDao.queryQuickSearch(map);
    }

    @Override
    public NxDistributerGoodsEntity queryObjectWithStandards(Integer nxDdgDisGoodsId) {

		return nxDistributerGoodsDao.queryDisGoodsWithStandards(nxDdgDisGoodsId);
    }



//    @Override
//    public List<NxDistributerGoodsEntity> queryHasDisGrandGoodsFather(Map<String, Object> map) {
//
//		return nxDistributerGoodsDao.queryHasDisGrandGoodsFather(map);
//    }

//	@Override
//	public List<NxDistributerGoodsEntity> queryHasDisGreatGrandGoodsFather(Map<String, Object> map) {
//		return nxDistributerGoodsDao.queryHasDisGreatGrandGoodsFather(map);
//	}

//	@Override
//	public List<NxDistributerGoodsEntity> queryDisGoodsListByFatherId(Map<String, Object> map) {
//		return nxDistributerGoodsDao.queryDisGoodsByFatherId(map);
//	}


}
