package com.nongxinle.service.impl;

import com.nongxinle.dao.NxDistributerUserRoleDao;
import com.nongxinle.entity.NxDepartmentUserEntity;
import com.nongxinle.entity.NxDistributerEntity;
import com.nongxinle.entity.NxDistributerUserRoleEntity;
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

	@Autowired
	private NxDistributerUserRoleDao nxDistributerUserRoleDao;
	
	@Override
	public NxDistributerUserEntity queryObject(Integer nxDistributerUserId){
		return nxDistributerUserDao.queryObject(nxDistributerUserId);
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
		Integer nxDistributerUserId = nxDistributerUser.getNxDistributerUserId();
		System.out.println(nxDistributerUserId + "iddididi");

		List<NxDistributerUserRoleEntity> roleEntities = nxDistributerUser.getRoleEntities();
		for (NxDistributerUserRoleEntity role : roleEntities) {
			Integer nxDurRoleId = role.getNxDurRoleId();
			NxDistributerUserRoleEntity roleEntity = new NxDistributerUserRoleEntity();
			roleEntity.setNxDurUserId(nxDistributerUserId);
			roleEntity.setNxDurRoleId(nxDurRoleId);
			nxDistributerUserRoleDao.save(roleEntity);
		}



	}
	
	@Override
	public void update(NxDistributerUserEntity nxDistributerUser){
		nxDistributerUserDao.update(nxDistributerUser);
	}
	
	@Override
	public void delete(Integer nxDistributerUserId){
		nxDistributerUserDao.delete(nxDistributerUserId);
	}
	
	@Override
	public void deleteBatch(Integer[] nxDistributerUserIds){
		nxDistributerUserDao.deleteBatch(nxDistributerUserIds);
	}

    @Override
    public List<NxDistributerUserEntity> queryUser(Integer disId) {
        return nxDistributerUserDao.queryUser(disId);
    }

	@Override
	public NxDistributerUserEntity queryUserInfo(Integer nxDistributerUserId) {
		return nxDistributerUserDao.queryUserInfo(nxDistributerUserId);
	}

    @Override
    public List<NxDistributerUserEntity> queryUserByOpenId(String openid) {

		return nxDistributerUserDao.queryUserByOpenId(openid);
    }

}
