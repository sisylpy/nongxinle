package com.nongxinle.service.impl;

import com.nongxinle.entity.NxDepartmentEntity;
import com.nongxinle.entity.NxDistributerCommunityEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxDistributerDepartmentDao;
import com.nongxinle.entity.NxDistributerDepartmentEntity;
import com.nongxinle.service.NxDistributerDepartmentService;



@Service("nxDistributerDepartmentService")
public class NxDistributerDepartmentServiceImpl implements NxDistributerDepartmentService {
	@Autowired
	private NxDistributerDepartmentDao nxDistributerDepartmentDao;
	
	@Override
	public NxDistributerDepartmentEntity queryObject(Integer nxDistributerDepId){
		return nxDistributerDepartmentDao.queryObject(nxDistributerDepId);
	}
	
	@Override
	public List<NxDistributerDepartmentEntity> queryList(Map<String, Object> map){
		return nxDistributerDepartmentDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return nxDistributerDepartmentDao.queryTotal(map);
	}
	
	@Override
	public void save(NxDistributerDepartmentEntity nxDistributerDepartment){
		nxDistributerDepartmentDao.save(nxDistributerDepartment);
	}
	
	@Override
	public void update(NxDistributerDepartmentEntity nxDistributerDepartment){
		nxDistributerDepartmentDao.update(nxDistributerDepartment);
	}
	
	@Override
	public void delete(Integer nxDistributerDepId){
		nxDistributerDepartmentDao.delete(nxDistributerDepId);
	}
	
	@Override
	public void deleteBatch(Integer[] nxDistributerDepIds){
		nxDistributerDepartmentDao.deleteBatch(nxDistributerDepIds);
	}



	@Override
	public List<NxDepartmentEntity> queryAllDisDepartments(Integer disId) {
		return nxDistributerDepartmentDao.queryAllDisDepartments(disId);
	}

}
