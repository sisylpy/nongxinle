package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 06-16 11:26
 */

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nongxinle.entity.NxCommunityEntity;
import com.nongxinle.entity.NxDepartmentUserEntity;
import com.nongxinle.service.NxDepartmentOrdersService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxDepartmentEntity;
import com.nongxinle.service.NxDepartmentService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;


@RestController
@RequestMapping("api/nxdepartment")
public class NxDepartmentController {
	@Autowired
	private NxDepartmentService nxDepartmentService;


	@RequestMapping(value = "/updateGroupName", method = RequestMethod.POST)
	@ResponseBody
	public R updateGroupName (@RequestBody  NxDepartmentEntity departmentEntity ) {
		nxDepartmentService.update(departmentEntity);
	    return R.ok();
	}
	/**
	 * 微信小程序扫描二维码校验文件
	 * @return 校验内容
	 */
	@RequestMapping(value = "/evR5kgsE0d.txt")
	@ResponseBody

	public String depRegist( ) {
		return "b59516a6fda0db869e06518f51400610";
	}

	/**
	 * PCS
	 * 采购员注册
	 * @param dep 订货客户
	 * @return 客户信息
	 */
	@RequestMapping(value = "/restrauntRegist", method = RequestMethod.POST)
	@ResponseBody
	public R restrauntRegist (@RequestBody NxDepartmentEntity dep) {
		Integer integer = nxDepartmentService.saveNewRestraunt(dep);
		Map<String, Object> map = nxDepartmentService.queryDepAndUserInfo(integer);
		return R.ok().put("data", map);
	}

	/**
	 * ORDER
	 * 获取群的子部门
	 * @param depId 群id
	 * @return 子部门列表
	 */
	@RequestMapping(value = "/getSubDepartments/{depId}")
	@ResponseBody
	public R getSubDepartments(@PathVariable Integer depId) {
		System.out.println(depId);
		List<NxDepartmentEntity> departmentEntities =   nxDepartmentService.querySubDepartments(depId);
		return R.ok().put("data", departmentEntities);
	}







//	//////////////////

	/**
	 * 微信二维码扫描校验文件内容
	 * @return 文件内容
	 */
//	@RequestMapping(value = "/depRegist/i7948FzJJ6.txt")
//	@ResponseBody
//
//	public String depRegist( ) {
////
//		return "bb7a0c73e61112c45ebd6ad3743bb05e";
//	}

	/**
	 * 二维码扫描打开固定页面
	 * @param disId 社区id
	 * @return 社区列表
	 */
	@RequestMapping(value = "/depRegist/{disId}")
	@ResponseBody
	public R customerRegist(@PathVariable Integer disId) {

//		NxCommunityEntity nxCommunity = nxCommunityService.queryObject(disId);

		return R.ok().put("data", "a");
	}


	@RequestMapping(value = "/getFatherDep/{depId}")
	@ResponseBody
	public R getFatherDep(@PathVariable Integer depId) {
		List<NxDepartmentEntity> departmentEntities = nxDepartmentService.queryFatherDep(depId);
	    return R.ok().put("data", departmentEntities.get(0));
	}



	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/saveSubDepartment")
	public R saveSubDepartment(@RequestBody NxDepartmentEntity nxDepartment){
		List<NxDepartmentEntity> nxDepartmentEntities = nxDepartment.getNxDepartmentEntities();
		for (NxDepartmentEntity dep : nxDepartmentEntities) {
		nxDepartmentService.saveSubDepartment(dep);
		}
		Integer nxDepartmentId = nxDepartment.getNxDepartmentId();
		NxDepartmentEntity nxDepartmentEntity = nxDepartmentService.queryObject(nxDepartmentId);
		Integer nxDepartmentSubAmount = nxDepartmentEntity.getNxDepartmentSubAmount();
		nxDepartmentEntity.setNxDepartmentSubAmount(nxDepartmentSubAmount + nxDepartment.getNxDepartmentEntities().size());
		nxDepartmentService.update(nxDepartmentEntity);
		return R.ok();
	}



	 @RequestMapping(value = "/getDisDepartments", method = RequestMethod.POST)
	  @ResponseBody
	  public R getDisDepartments (Integer disId, String type) {

		 Map<String, Object> map = new HashMap<>();
		 map.put("disId", disId);
		 map.put("type", type);
		 List<NxDepartmentEntity> list =  nxDepartmentService.queryDisDepartments(map);
		 return R.ok().put("data", list);
	  }


	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	public R save(@RequestBody NxDepartmentEntity nxDepartment){
		nxDepartmentService.save(nxDepartment);
		return R.ok();
	}

	@RequestMapping(value = "/getDepInfo/{depId}")
	@ResponseBody
	public R getDepInfo(@PathVariable Integer depId) {
		NxDepartmentEntity nxDepartmentEntity = nxDepartmentService.queryObject(depId);
		return R.ok().put("data", nxDepartmentEntity);
	}

	

}
