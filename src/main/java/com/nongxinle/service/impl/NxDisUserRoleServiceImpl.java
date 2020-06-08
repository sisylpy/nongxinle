package com.nongxinle.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxDisUserRoleDao;
import com.nongxinle.entity.NxDisUserRoleEntity;
import com.nongxinle.service.NxDisUserRoleService;



@Service("nxDisUserRoleService")
public class NxDisUserRoleServiceImpl implements NxDisUserRoleService {
	@Autowired
	private NxDisUserRoleDao nxDisUserRoleDao;
	
	@Override
	public NxDisUserRoleEntity queryObject(Long id){
		return nxDisUserRoleDao.queryObject(id);
	}
	
	@Override
	public List<NxDisUserRoleEntity> queryList(Map<String, Object> map){
		return nxDisUserRoleDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return nxDisUserRoleDao.queryTotal(map);
	}
	
	@Override
	public void save(NxDisUserRoleEntity nxDisUserRole){
		nxDisUserRoleDao.save(nxDisUserRole);
	}
	
	@Override
	public void update(NxDisUserRoleEntity nxDisUserRole){
		nxDisUserRoleDao.update(nxDisUserRole);
	}
	
	@Override
	public void delete(Long id){
		nxDisUserRoleDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		nxDisUserRoleDao.deleteBatch(ids);
	}
	
}
