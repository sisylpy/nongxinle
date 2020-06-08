package com.nongxinle.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxRouteDao;
import com.nongxinle.entity.NxRouteEntity;
import com.nongxinle.service.NxRouteService;



@Service("nxRouteService")
public class NxRouteServiceImpl implements NxRouteService {
	@Autowired
	private NxRouteDao nxRouteDao;
	
	@Override
	public NxRouteEntity queryObject(Integer nxRouteId){
		return nxRouteDao.queryObject(nxRouteId);
	}
	
	@Override
	public List<NxRouteEntity> queryList(Map<String, Object> map){
		return nxRouteDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return nxRouteDao.queryTotal(map);
	}
	
	@Override
	public void save(NxRouteEntity nxRoute){
		nxRouteDao.save(nxRoute);
	}
	
	@Override
	public void update(NxRouteEntity nxRoute){
		nxRouteDao.update(nxRoute);
	}
	
	@Override
	public void delete(Integer nxRouteId){
		nxRouteDao.delete(nxRouteId);
	}
	
	@Override
	public void deleteBatch(Integer[] nxRouteIds){
		nxRouteDao.deleteBatch(nxRouteIds);
	}

    @Override
    public List<NxRouteEntity> queryRoute() {
        return nxRouteDao.queryAll();
    }

}
