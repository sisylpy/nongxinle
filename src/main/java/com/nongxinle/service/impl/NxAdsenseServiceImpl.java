package com.nongxinle.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxAdsenseDao;
import com.nongxinle.entity.NxAdsenseEntity;
import com.nongxinle.service.NxAdsenseService;



@Service("nxAdsenseService")
public class NxAdsenseServiceImpl implements NxAdsenseService {
	@Autowired
	private NxAdsenseDao nxAdsenseDao;
	
	@Override
	public NxAdsenseEntity queryObject(Integer nxAdsenseId){
		return nxAdsenseDao.queryObject(nxAdsenseId);
	}
	
	@Override
	public List<NxAdsenseEntity> queryList(Map<String, Object> map){
		return nxAdsenseDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return nxAdsenseDao.queryTotal(map);
	}
	
	@Override
	public void save(NxAdsenseEntity nxAdsense){
		nxAdsenseDao.save(nxAdsense);
	}
	
	@Override
	public void update(NxAdsenseEntity nxAdsense){
		nxAdsenseDao.update(nxAdsense);
	}
	
	@Override
	public void delete(Integer nxAdsenseId){
		nxAdsenseDao.delete(nxAdsenseId);
	}
	
	@Override
	public void deleteBatch(Integer[] nxAdsenseIds){
		nxAdsenseDao.deleteBatch(nxAdsenseIds);
	}

    @Override
    public List<NxAdsenseEntity> getListByCommunityId(Integer communityId) {
        return nxAdsenseDao.getListByCommunityId(communityId);
    }

    @Override
    public List<NxAdsenseEntity> queryAdsenseByNxCommunityId(Integer communityId) {
        return nxAdsenseDao.queryAdsenseByNxCommunityId(communityId);
    }

}
