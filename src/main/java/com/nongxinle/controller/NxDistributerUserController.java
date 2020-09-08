package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 2020-02-10 19:43:11
 */

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nongxinle.entity.NxDistributerUserRoleEntity;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxDistributerUserEntity;
import com.nongxinle.service.NxDistributerUserService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;


@RestController
@RequestMapping("api/nxdistributeruser")
public class NxDistributerUserController {
	@Autowired
	private NxDistributerUserService nxDistributerUserService;



//
//	@RequestMapping(value = "/disGetUserByRole", method = RequestMethod.POST)
//	@ResponseBody
//	public R disGetUser (Integer disId, Integer roleNumber) {
//
//		List<NxDistributerUserEntity> userEntities =  nxDistributerUserService.queryUser(disId);
//		System.out.println(userEntities);
//		List<NxDistributerUserEntity> result = new ArrayList<>();
//		for (NxDistributerUserEntity user : userEntities) {
//			List<NxDistributerUserRoleEntity> roleEntities = user.getRoleEntities();
//			for (NxDistributerUserRoleEntity roleEntity: roleEntities) {
//				if (roleEntity.getNxDurRoleId().equals(roleNumber)){
//					result.add(user);
//				}
//			}
//		}
//		return R.ok().put("data", result);
//	}


	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("nxdistributeruser:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<NxDistributerUserEntity> nxDistributerUserList = nxDistributerUserService.queryList(map);
		int total = nxDistributerUserService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(nxDistributerUserList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{distUserId}")
	@RequiresPermissions("nxdistributeruser:info")
	public R info(@PathVariable("distUserId") Integer distUserId){
		NxDistributerUserEntity nxDistributerUser = nxDistributerUserService.queryObject(distUserId);
		
		return R.ok().put("nxDistributerUser", nxDistributerUser);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
//	@RequiresPermissions("nxdistributeruser:save")
	public R save(@RequestBody NxDistributerUserEntity nxDistributerUser){
		nxDistributerUserService.save(nxDistributerUser);
		Integer nxDistributerUserId = nxDistributerUser.getNxDistributerUserId();
		NxDistributerUserEntity nxDistributerUserEntity = nxDistributerUserService.queryObject(nxDistributerUserId);

		return R.ok().put("data", nxDistributerUserEntity);
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("nxdistributeruser:update")
	public R update(@RequestBody NxDistributerUserEntity nxDistributerUser){
		nxDistributerUserService.update(nxDistributerUser);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("nxdistributeruser:delete")
	public R delete(@RequestBody Integer[] distUserIds){
		nxDistributerUserService.deleteBatch(distUserIds);
		
		return R.ok();
	}
	
}
