package com.nongxinle.service.impl;

import com.nongxinle.entity.NxCommunityEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxDistributerCommunityDao;
import com.nongxinle.entity.NxDistributerCommunityEntity;
import com.nongxinle.service.NxDistributerCommunityService;



@Service("nxDistributerCommunityService")
public class NxDistributerCommunityServiceImpl implements NxDistributerCommunityService {
	@Autowired
	private NxDistributerCommunityDao nxDistributerCommunityDao;
	
	@Override
	public NxDistributerCommunityEntity queryObject(Integer nxDcId){
		return nxDistributerCommunityDao.queryObject(nxDcId);
	}
	
	@Override
	public List<NxDistributerCommunityEntity> queryList(Map<String, Object> map){
		return nxDistributerCommunityDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return nxDistributerCommunityDao.queryTotal(map);
	}
	
	@Override
	public void save(NxDistributerCommunityEntity nxDistributerCommunity){
		nxDistributerCommunityDao.save(nxDistributerCommunity);
	}
	
	@Override
	public void update(NxDistributerCommunityEntity nxDistributerCommunity){
		nxDistributerCommunityDao.update(nxDistributerCommunity);
	}
	
	@Override
	public void delete(Integer nxDcId){
		nxDistributerCommunityDao.delete(nxDcId);
	}
	
	@Override
	public void deleteBatch(Integer[] nxDcIds){
		nxDistributerCommunityDao.deleteBatch(nxDcIds);
	}

    @Override
    public List<NxCommunityEntity> queryCommunityByDistributerId(Integer distributerId) {

		return nxDistributerCommunityDao.queryCommunityByDistrbuterId(distributerId);
    }

}
