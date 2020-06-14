package com.nongxinle.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxDistributerUserDao;
import com.nongxinle.entity.NxDistributerUserEntity;
import com.nongxinle.service.NxDistributerUserService;



@Service("nxDistributerUserService")
public class NxDistributerUserServiceImpl implements NxDistributerUserService {
	@Autowired
	private NxDistributerUserDao nxDistributerUserDao;
	
	@Override
	public NxDistributerUserEntity queryObject(Integer distUserId){
		return nxDistributerUserDao.queryObject(distUserId);
	}
	
	@Override
	public List<NxDistributerUserEntity> queryList(Map<String, Object> map){
		return nxDistributerUserDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return nxDistributerUserDao.queryTotal(map);
	}
	
	@Override
	public void save(NxDistributerUserEntity nxDistributerUser){
		nxDistributerUserDao.save(nxDistributerUser);
	}
	
	@Override
	public void update(NxDistributerUserEntity nxDistributerUser){
		nxDistributerUserDao.update(nxDistributerUser);
	}
	
	@Override
	public void delete(Integer distUserId){
		nxDistributerUserDao.delete(distUserId);
	}
	
	@Override
	public void deleteBatch(Integer[] distUserIds){
		nxDistributerUserDao.deleteBatch(distUserIds);
	}

	@Override
	public List<NxDistributerUserEntity> queryUser(Integer communityId) {
		return nxDistributerUserDao.queryUser(communityId);
	}

}
