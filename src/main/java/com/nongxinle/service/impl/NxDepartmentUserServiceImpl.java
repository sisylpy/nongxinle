package com.nongxinle.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxDepartmentUserDao;
import com.nongxinle.entity.NxDepartmentUserEntity;
import com.nongxinle.service.NxDepartmentUserService;



@Service("nxDepartmentUserService")
public class NxDepartmentUserServiceImpl implements NxDepartmentUserService {
	@Autowired
	private NxDepartmentUserDao nxDepartmentUserDao;
	
	@Override
	public NxDepartmentUserEntity queryObject(Integer nxDepartmentUserId){
		return nxDepartmentUserDao.queryObject(nxDepartmentUserId);
	}
	
	@Override
	public List<NxDepartmentUserEntity> queryList(Map<String, Object> map){
		return nxDepartmentUserDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return nxDepartmentUserDao.queryTotal(map);
	}
	
	@Override
	public void save(NxDepartmentUserEntity nxDepartmentUser){

		nxDepartmentUserDao.save(nxDepartmentUser);
	}
	
	@Override
	public void update(NxDepartmentUserEntity nxDepartmentUser){
		nxDepartmentUserDao.update(nxDepartmentUser);
	}
	
	@Override
	public void delete(Integer nxDepartmentUserId){
		nxDepartmentUserDao.delete(nxDepartmentUserId);
	}
	
	@Override
	public void deleteBatch(Integer[] nxDepartmentUserIds){
		nxDepartmentUserDao.deleteBatch(nxDepartmentUserIds);
	}
	
}
