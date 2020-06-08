package com.nongxinle.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxPromoteDao;
import com.nongxinle.entity.NxPromoteEntity;
import com.nongxinle.service.NxPromoteService;



@Service("nxPromoteService")
public class NxPromoteServiceImpl implements NxPromoteService {
	@Autowired
	private NxPromoteDao nxPromoteDao;
	
	@Override
	public NxPromoteEntity queryObject(Integer nxPromoteId){
		return nxPromoteDao.queryObject(nxPromoteId);
	}
	
	@Override
	public List<NxPromoteEntity> queryList(Map<String, Object> map){
		return nxPromoteDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return nxPromoteDao.queryTotal(map);
	}
	
	@Override
	public void save(NxPromoteEntity nxPromote){
		nxPromoteDao.save(nxPromote);
	}
	
	@Override
	public void update(NxPromoteEntity nxPromote){
		nxPromoteDao.update(nxPromote);
	}
	
	@Override
	public void delete(Integer nxPromoteId){
		nxPromoteDao.delete(nxPromoteId);
	}
	
	@Override
	public void deleteBatch(Integer[] nxPromoteIds){
		nxPromoteDao.deleteBatch(nxPromoteIds);
	}

    @Override
    public List<NxPromoteEntity> getListByCommunityId(Integer communityId) {
        return nxPromoteDao.getListByCommunityId(communityId);
    }

    @Override
    public List<NxPromoteEntity> queryPromoteByFatherId(Integer nxCommunityFatherGoodsId) {

		return nxPromoteDao.queryPromoteByFatherId(nxCommunityFatherGoodsId);
    }

}
