package com.nongxinle.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxGoodsDao;
import com.nongxinle.entity.NxGoodsEntity;
import com.nongxinle.service.NxGoodsService;



@Service("nxGoodsService")
public class NxGoodsServiceImpl implements NxGoodsService {
	@Autowired
	private NxGoodsDao nxGoodsDao;
	
	@Override
	public NxGoodsEntity queryObject(Integer nxGoodsId){
		return nxGoodsDao.queryObject(nxGoodsId);
	}
	
	@Override
	public List<NxGoodsEntity> queryList(Map<String, Object> map){
		return nxGoodsDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return nxGoodsDao.queryTotal(map);
	}
	
	@Override
	public void save(NxGoodsEntity nxGoods){
		nxGoodsDao.save(nxGoods);
	}
	
	@Override
	public void update(NxGoodsEntity nxGoods){
		nxGoodsDao.update(nxGoods);
	}
	
	@Override
	public void delete(Integer nxGoodsId){
		nxGoodsDao.delete(nxGoodsId);
	}
	
	@Override
	public void deleteBatch(Integer[] nxGoodsIds){
		nxGoodsDao.deleteBatch(nxGoodsIds);
	}

	@Override
	public List<NxGoodsEntity> getiBookCoverData() {
		return nxGoodsDao.getNxGoodsCateList();
	}

    @Override
    public List<NxGoodsEntity> getAllFatherGoods(Integer fatherId) {
        return nxGoodsDao.getNxFatherGoodsByFatherId(fatherId);
    }

	@Override
	public List<NxGoodsEntity> queryListWithFatherId(Map<String, Object> map) {
		return nxGoodsDao.queryListWithFatherId(map);
	}

	@Override
	public int queryTotalByFatherId(Integer fatherId) {
		return nxGoodsDao.queryTotalByFatherId(fatherId);
	}

	@Override
	public List<NxGoodsEntity> querySubNameByFatherId(Integer nxGoodsId) {
		return nxGoodsDao.querySubNamesByFatherId(nxGoodsId);

	}

    @Override
    public List<NxGoodsEntity> queryGoodsCataByType(Integer type) {
        return nxGoodsDao.queryGoodsCataByType(type);
    }

	@Override
	public List<NxGoodsEntity> downloadGoods(String fatherId) {
		return nxGoodsDao.queryDownloadGoods(fatherId);
	}

	@Override
	public List<NxGoodsEntity> queryGoodsTree() {
		return nxGoodsDao.queryGoodsTree();
	}

    @Override
    public List<NxGoodsEntity> queryGoodsByFatherId(Integer fatherId) {
        return nxGoodsDao.queryGoodsByFatherId(fatherId);
    }


}
