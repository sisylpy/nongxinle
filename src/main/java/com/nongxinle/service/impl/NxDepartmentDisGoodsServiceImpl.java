package com.nongxinle.service.impl;

import com.nongxinle.entity.NxDepartmentStandardEntity;
import com.nongxinle.entity.NxGoodsEntity;
import com.nongxinle.service.NxDepartmentStandardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxDepartmentDisGoodsDao;
import com.nongxinle.entity.NxDepartmentDisGoodsEntity;
import com.nongxinle.service.NxDepartmentDisGoodsService;



@Service("nxDepartmentDisGoodsService")
public class NxDepartmentDisGoodsServiceImpl implements NxDepartmentDisGoodsService {
	@Autowired
	private NxDepartmentDisGoodsDao nxDepartmentDisGoodsDao;

	@Autowired
	private NxDepartmentStandardService nxDepartmentStandardService;
	
	@Override
	public NxDepartmentDisGoodsEntity queryObject(Integer nxDepartmentDisGoodsId){
		return nxDepartmentDisGoodsDao.queryObject(nxDepartmentDisGoodsId);
	}
	
	@Override
	public List<NxDepartmentDisGoodsEntity> queryList(Map<String, Object> map){
		return nxDepartmentDisGoodsDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return nxDepartmentDisGoodsDao.queryTotal(map);
	}
	
	@Override
	public void save(NxDepartmentDisGoodsEntity nxDepartmentDisGoods){
		System.out.println(nxDepartmentDisGoods.getNxDdgNxGoodsId()  + "kankangoodsidshiduoshao");
		nxDepartmentDisGoodsDao.save(nxDepartmentDisGoods);

		List<NxDepartmentStandardEntity> nxDepStandardEntities = nxDepartmentDisGoods.getNxDepStandardEntities();
		if(nxDepStandardEntities.size() > 0){
			for (NxDepartmentStandardEntity standard : nxDepStandardEntities) {
				Integer nxDepartmentDisGoodsId = nxDepartmentDisGoods.getNxDepartmentDisGoodsId();
				standard.setNxDdsDdsGoodsId(nxDepartmentDisGoodsId);
				nxDepartmentStandardService.save(standard);
			}
		}
	}
	
	@Override
	public void update(NxDepartmentDisGoodsEntity nxDepartmentDisGoods){
		nxDepartmentDisGoodsDao.update(nxDepartmentDisGoods);
	}
	
	@Override
	public void delete(Integer nxDepartmentDisGoodsId){
		nxDepartmentDisGoodsDao.delete(nxDepartmentDisGoodsId);
	}
	
	@Override
	public void deleteBatch(Integer[] nxDepartmentDisGoodsIds){
		nxDepartmentDisGoodsDao.deleteBatch(nxDepartmentDisGoodsIds);
	}

	@Override
	public List<NxDepartmentDisGoodsEntity> queryAddDisDepGoods(Map<String, Object> map) {
		return nxDepartmentDisGoodsDao.queryDisDepGoods(map);
	}

	@Override
	public List<NxGoodsEntity> depGetDepDisGoodsCata(Integer depId) {

		return nxDepartmentDisGoodsDao.depGetDepDisGoodsCata(depId);
	}

    @Override
    public List<NxGoodsEntity> querySearchStr(Map<String, Object> map) {

		return nxDepartmentDisGoodsDao.querySearchStr (map);
    }

	@Override
	public List<NxGoodsEntity> queryDepGoodsByFatherId(Map<String, Object> map) {
		return nxDepartmentDisGoodsDao.queryDepGoodsByFatherId(map);
	}

    @Override
    public List<NxGoodsEntity> queryResGoodsDetail(Integer depDisGoodsId) {

		return nxDepartmentDisGoodsDao.queryResGoodsDetail(depDisGoodsId);
    }

}
