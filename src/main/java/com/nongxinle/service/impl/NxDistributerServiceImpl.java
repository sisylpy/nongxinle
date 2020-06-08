package com.nongxinle.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxDistributerDao;
import com.nongxinle.entity.NxDistributerEntity;
import com.nongxinle.service.NxDistributerService;



@Service("nxDistributerService")
public class NxDistributerServiceImpl implements NxDistributerService {
	@Autowired
	private NxDistributerDao nxDistributerDao;
	
	@Override
	public NxDistributerEntity queryObject(Integer distributerId){
		return nxDistributerDao.queryObject(distributerId);
	}
	
	@Override
	public List<NxDistributerEntity> queryList(Map<String, Object> map){
		return nxDistributerDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return nxDistributerDao.queryTotal(map);
	}
	
	@Override
	public void save(NxDistributerEntity nxDistributer){
		nxDistributerDao.save(nxDistributer);
	}
	
	@Override
	public void update(NxDistributerEntity nxDistributer){
		nxDistributerDao.update(nxDistributer);
	}
	
	@Override
	public void delete(Integer distributerId){
		nxDistributerDao.delete(distributerId);
	}
	
	@Override
	public void deleteBatch(Integer[] distributerIds){
		nxDistributerDao.deleteBatch(distributerIds);
	}
	
}
