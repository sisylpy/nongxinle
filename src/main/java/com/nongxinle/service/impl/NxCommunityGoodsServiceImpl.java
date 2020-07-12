package com.nongxinle.service.impl;

import com.nongxinle.entity.NxCommunityGoodsEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxCommunityGoodsDao;
import com.nongxinle.service.NxCommunityGoodsService;



@Service("nxDistributerGoodsService")
public class NxCommunityGoodsServiceImpl implements NxCommunityGoodsService {
	@Autowired
	private NxCommunityGoodsDao nxCommunityGoodsDao;
	
	@Override
	public NxCommunityGoodsEntity queryObject(Integer communityGoodsId){
		return nxCommunityGoodsDao.queryObject(communityGoodsId);
	}
	
	@Override
	public List<NxCommunityGoodsEntity> queryList(Map<String, Object> map){
		return nxCommunityGoodsDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return nxCommunityGoodsDao.queryTotal(map);
	}
	
	@Override
	public void save(NxCommunityGoodsEntity nxDistributerGoods){
		nxCommunityGoodsDao.save(nxDistributerGoods);
	}
	
	@Override
	public void update(NxCommunityGoodsEntity nxDistributerGoods){
		nxCommunityGoodsDao.update(nxDistributerGoods);
	}
	
	@Override
	public void delete(Integer disGoodsId){
		nxCommunityGoodsDao.delete(disGoodsId);
	}
	
	@Override
	public void deleteBatch(Integer[] disGoodsIds){
		nxCommunityGoodsDao.deleteBatch(disGoodsIds);
	}

    @Override
    public List<NxCommunityGoodsEntity> queryCommunityGoods(Map<String, Object> map) {

		return nxCommunityGoodsDao.queryCommunityGoods(map);
    }

    @Override
    public int queryTotalByFatherId(Map<String, Object> map) {

		return nxCommunityGoodsDao.queryTotalByFatherId(map);
    }

    @Override
    public List<NxCommunityGoodsEntity> queryDisDownloadGoods(Map<String, Object> map) {

		return nxCommunityGoodsDao.queryDisDownloadGoods(map);
    }

//    @Override
//    public NxCommunityGoodsEntity queryGoods(Map<String, Object> map) {
//
//		return nxCommunityGoodsDao.queryGoods(map);
//    }
//
//    @Override
//    public List<NxCommunityGoodsEntity> queryPlanGoods(Map<String, Object> planMap) {
//
//		return  nxCommunityGoodsDao.queryPlanGoods(planMap);
//    }

//    @Override
//    public List<NxCommunityGoodsEntity> queryPurchaseGoods(Map<String, Object> map) {
//        return nxCommunityGoodsDao.queryPurchaseGoods(map);
//    }

    @Override
    public List<NxCommunityGoodsEntity> queryCommunityDownloadGoods(Map<String, Object> map) {

		return nxCommunityGoodsDao.queryCommunityDownloadGoods(map);
    }

	@Override
	public List<NxCommunityGoodsEntity> querySupplierGoods(Map<String, Object> map) {
		return nxCommunityGoodsDao.querySupplierGoods(map);

	}

    @Override
    public List<NxCommunityGoodsEntity>  queryHasNxGoodsFather(Map<String, Object> map) {
        return nxCommunityGoodsDao.queryHasNxGoodsFather(map);
    }

    @Override
    public List<NxCommunityGoodsEntity> queryStockGoods(Map<String, Object> map) {
        return nxCommunityGoodsDao.queryStockGoods(map);
    }

	@Override
	public List<NxCommunityGoodsEntity> queryCommunityGoodsWithPinyin(Map<String, Object> map) {
		return nxCommunityGoodsDao.queryCommunityGoodsWithPinyin(map);
	}

}
