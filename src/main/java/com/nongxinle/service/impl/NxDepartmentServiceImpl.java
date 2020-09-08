package com.nongxinle.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.nongxinle.entity.*;
import com.nongxinle.service.*;
import com.nongxinle.utils.MyAPPIDConfig;
import com.nongxinle.utils.WeChatUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxDepartmentDao;

import static com.nongxinle.utils.DateUtils.formatWhatDate;
import static com.nongxinle.utils.DateUtils.formatWhatDay;


@Service("nxDepartmentService")
public class NxDepartmentServiceImpl implements NxDepartmentService {
	@Autowired
	private NxDepartmentDao nxDepartmentDao;

	@Autowired
	private NxDepartmentUserService nxDepartmentUserService;


	@Autowired
	private NxDistributerDepartmentService nxDistributerDepartmentService;


	@Override
	public Map<String, Object> queryGroupAndUserInfo(Integer nxGroupUserId) {
		//订货群信息
		NxDepartmentUserEntity nxDepartmentUserEntity = nxDepartmentUserService.queryObject(nxGroupUserId);
		//用户信息
		Integer nxDuDepartmentId = nxDepartmentUserEntity.getNxDuDepartmentId();
		NxDepartmentEntity nxDepartmentEntity = nxDepartmentDao.queryGroupInfo(nxDuDepartmentId);
		//返回
		Map<String, Object> map = new HashMap<>();
		map.put("userInfo", nxDepartmentUserEntity);
		map.put("depInfo", nxDepartmentEntity);
		return  map;
	}

	@Override
	public Map<String, Object> queryDepAndUserInfo(Integer nxDepartmentUserId) {
		//订货群信息
		NxDepartmentUserEntity nxDepartmentUserEntity = nxDepartmentUserService.queryObject(nxDepartmentUserId);
		//用户信息
		Integer nxDuDepartmentId = nxDepartmentUserEntity.getNxDuDepartmentId();
		NxDepartmentEntity nxDepartmentEntity = nxDepartmentDao.queryDepInfo(nxDuDepartmentId);
		//返回
		Map<String, Object> map = new HashMap<>();
		map.put("userInfo", nxDepartmentUserEntity);
		map.put("depInfo", nxDepartmentEntity);
		return  map;
	}


	@Override
	public Integer saveNewRestraunt(NxDepartmentEntity dep) {

		//1.保存餐馆
		nxDepartmentDao.save(dep);

		MyAPPIDConfig myAPPIDConfig = new MyAPPIDConfig();
		String purchaseAppID = myAPPIDConfig.getPurchaseAppID();
		String purchaseScreat = myAPPIDConfig.getPurchaseScreat();

		//2，保存用户
		Integer nxDepartmentId = dep.getNxDepartmentId();
		NxDepartmentUserEntity nxDepartmentUserEntity = dep.getNxDepartmentUserEntity();
		String url = "https://api.weixin.qq.com/sns/jscode2session?appid=" + purchaseAppID + "&secret=" + purchaseScreat + "&js_code=" + nxDepartmentUserEntity.getNxDuCode()+ "&grant_type=authorization_code";
		// 发送请求，返回Json字符串
		String str = WeChatUtil.httpRequest(url, "GET", null);
		// 转成Json对象 获取openid
		JSONObject jsonObject = JSONObject.parseObject(str);

		// 我们需要的openid，在一个小程序中，openid是唯一的
		String openid = jsonObject.get("openid").toString();
		nxDepartmentUserEntity.setNxDuWxOpenId(openid);
		nxDepartmentUserEntity.setNxDuDepartmentId(nxDepartmentId);
		nxDepartmentUserEntity.setNxDuDepartmentFatherId(nxDepartmentId);
		nxDepartmentUserEntity.setNxDuJoinDate(formatWhatDay(0));
		nxDepartmentUserService.save(nxDepartmentUserEntity);
		List<NxDepartmentEntity> nxDepartmentEntities1 = dep.getNxDepartmentEntities();
		System.out.println(nxDepartmentEntities1);

		if(dep.getNxDepartmentEntities().size() > 0){
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
	public void saveJustDepartment(NxDepartmentEntity nxDepartmentEntity) {
		nxDepartmentDao.save(nxDepartmentEntity);
	}

	@Override
	public List<NxDepartmentEntity> querySubDepartments(Integer depId) {
		return nxDepartmentDao.querySubDepartments(depId);
	}



}
