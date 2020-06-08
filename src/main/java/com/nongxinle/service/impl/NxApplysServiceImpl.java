package com.nongxinle.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxApplysDao;
import com.nongxinle.entity.NxApplysEntity;
import com.nongxinle.service.NxApplysService;



@Service("nxApplysService")
public class NxApplysServiceImpl implements NxApplysService {
	@Autowired
	private NxApplysDao nxApplysDao;
	
	@Override
	public NxApplysEntity queryObject(Integer nxApplysId){
		return nxApplysDao.queryObject(nxApplysId);
	}
	
	@Override
	public List<NxApplysEntity> queryList(Map<String, Object> map){
		return nxApplysDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return nxApplysDao.queryTotal(map);
	}
	
	@Override
	public void save(NxApplysEntity nxApplys){
		nxApplysDao.save(nxApplys);
	}
	
	@Override
	public void update(NxApplysEntity nxApplys){
		nxApplysDao.update(nxApplys);
	}
	
	@Override
	public void delete(Integer nxApplysId){
		nxApplysDao.delete(nxApplysId);
	}
	
	@Override
	public void deleteBatch(Integer[] nxApplysIds){
		nxApplysDao.deleteBatch(nxApplysIds);
	}
	
}
