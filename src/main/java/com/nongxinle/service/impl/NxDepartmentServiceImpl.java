package com.nongxinle.service.impl;

import com.nongxinle.entity.NxDepartmentUserEntity;
import com.nongxinle.service.NxDepartmentUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxDepartmentDao;
import com.nongxinle.entity.NxDepartmentEntity;
import com.nongxinle.service.NxDepartmentService;



@Service("nxDepartmentService")
public class NxDepartmentServiceImpl implements NxDepartmentService {
	@Autowired
	private NxDepartmentDao nxDepartmentDao;

	@Autowired
	private NxDepartmentUserService nxDepartmentUserService;
	
	@Override
	public NxDepartmentEntity queryObject(Integer nxDepartmentId){
		return nxDepartmentDao.queryObject(nxDepartmentId);
	}
	
	@Override
	public List<NxDepartmentEntity> queryList(Map<String, Object> map){
		return nxDepartmentDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return nxDepartmentDao.queryTotal(map);
	}
	
	@Override
	public void save(NxDepartmentEntity nxDepartment){
		nxDepartmentDao.save(nxDepartment);

		Integer nxDepartmentId = nxDepartment.getNxDepartmentId();
		Integer nxDepUserId = nxDepartment.getNxDepUserId();
		NxDepartmentUserEntity nxDepartmentUserEntity = nxDepartmentUserService.queryObject(nxDepUserId);
		nxDepartmentUserEntity.setNxDuDepartmentId(nxDepartmentId);
		nxDepartmentUserService.update(nxDepartmentUserEntity);

	}
	
	@Override
	public void update(NxDepartmentEntity nxDepartment){
		nxDepartmentDao.update(nxDepartment);
	}
	
	@Override
	public void delete(Integer nxDepartmentId){
		nxDepartmentDao.delete(nxDepartmentId);
	}
	
	@Override
	public void deleteBatch(Integer[] nxDepartmentIds){
		nxDepartmentDao.deleteBatch(nxDepartmentIds);
	}

    @Override
    public List<NxDepartmentEntity> queryDisDepartments(Map<String, Object> map) {
        return  nxDepartmentDao.queryDisDepartments(map);
    }

}
