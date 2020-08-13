package com.nongxinle.service.impl;

import com.nongxinle.entity.*;
import com.nongxinle.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxDepartmentDao;


@Service("nxDepartmentService")
public class NxDepartmentServiceImpl implements NxDepartmentService {
	@Autowired
	private NxDepartmentDao nxDepartmentDao;

	@Autowired
	private NxDepartmentUserService nxDepartmentUserService;

	@Autowired
	private NxDepartmentOrdersService nxDepartmentOrdersService;

	@Autowired
	private NxDepartmentIndependentOrderService nxDepIndependentOrderService;

	@Autowired
	private NxDistributerDepartmentService nxDistributerDepartmentService;

	
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

	@Override
	public void saveSubDepartment(NxDepartmentEntity dep) {
		 nxDepartmentDao.save(dep);
	}

    @Override
    public NxDepartmentEntity queryDepartmentInfo(Integer nxDuDepartmentId) {

		return nxDepartmentDao.queryDepInfo(nxDuDepartmentId);
    }

	@Override
	public Integer saveNewRestraunt(NxDepartmentEntity dep) {

		//1.保存餐馆
		nxDepartmentDao.save(dep);
		System.out.println("new depdpeppepepeep");
		System.out.println(dep);

		//2，保存用户
		Integer nxDepartmentId = dep.getNxDepartmentId();
		NxDepartmentUserEntity nxDepartmentUserEntity = dep.getNxDepartmentUserEntity();
		nxDepartmentUserEntity.setNxDuDepartmentId(nxDepartmentId);
		nxDepartmentUserService.save(nxDepartmentUserEntity);
		List<NxDepartmentEntity> nxDepartmentEntities1 = dep.getNxDepartmentEntities();
		System.out.println(nxDepartmentEntities1);

		if(dep.getNxDepartmentEntities().size() > 0){
			System.out.println(dep.getNxDepartmentEntities() + "sisisisiis");
			//3,保存部门

			List<NxDepartmentEntity> nxDepartmentEntities = dep.getNxDepartmentEntities();
			for (NxDepartmentEntity subDep : nxDepartmentEntities) {
				subDep.setNxDepartmentFatherId(nxDepartmentId);
				subDep.setNxDepartmentDisId(dep.getNxDepartmentDisId());
				nxDepartmentDao.save(subDep);
			}
		}

		//3, 保存批发商客户
		Integer nxDepartmentDisId = dep.getNxDepartmentDisId();
		NxDistributerDepartmentEntity entity = new NxDistributerDepartmentEntity();
		entity.setNxDdDistributerId(nxDepartmentDisId);
		entity.setNxDdDepartmentId(nxDepartmentId);
		nxDistributerDepartmentService.save(entity);


		Integer nxDepartmentUserId = nxDepartmentUserEntity.getNxDepartmentUserId();
		return nxDepartmentUserId;

	}

	@Override
	public Map<String, Object> queryGroupInfo(Integer userId) {
		NxDepartmentUserEntity userEntity = nxDepartmentUserService.queryObject(userId);

		Integer nxDuDepartmentId = userEntity.getNxDuDepartmentId();
		NxDepartmentEntity group =  nxDepartmentDao.queryObject(nxDuDepartmentId);

		List<NxDepartmentOrdersEntity> ordersEntities = nxDepartmentOrdersService.queryGroupTodayOrders(nxDuDepartmentId);

	   List<NxDepartmentIndependentOrderEntity>  indepenOrder =	nxDepIndependentOrderService.queryGroupTodayIndependentOrders(nxDuDepartmentId);

		Map<String, Object> map = new HashMap<>();
		map.put("userInfo", userEntity);
		map.put("groupInfo", group);
		map.put("orders", ordersEntities);
		map.put("independentOrders", indepenOrder);


		return map;

	}

	@Override
	public void saveJustDepartment(NxDepartmentEntity nxDepartmentEntity) {
		nxDepartmentDao.save(nxDepartmentEntity);
	}

	@Override
	public List<NxDepartmentEntity> querySubDepartments(Integer depId) {
		return nxDepartmentDao.querySubDepartments(depId);

	}

	@Override
	public List<NxDepartmentEntity> queryFatherDep(Integer depId) {
		return nxDepartmentDao.queryFatherDep(depId);
	}




}
