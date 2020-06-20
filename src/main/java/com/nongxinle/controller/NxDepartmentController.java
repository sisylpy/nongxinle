package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 06-16 11:26
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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


	 @RequestMapping(value = "/getDisDepartments", method = RequestMethod.POST)
	  @ResponseBody
	  public R getDisDepartments (Integer disId, String type) {

		 System.out.println(disId);
		 System.out.println(type);
		 System.out.println("enennen");


		 Map<String, Object> map = new HashMap<>();
		 map.put("disId", disId);
		 map.put("type", type);
		 		List<NxDepartmentEntity> list =  nxDepartmentService.queryDisDepartments(map);

		 return R.ok().put("data", list);
	  }


//
//
//	@RequestMapping(value = "//{disId}")
//	@ResponseBody
//	public R getDisDepartments(@PathVariable Integer disId) {
//
//		List<NxDepartmentEntity> list =  nxDepartmentService.queryDisDepartments(disId);
//
//	    return R.ok().put("data", list);
//	}
	


	
	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{nxDepartmentId}")
	@RequiresPermissions("nxdepartment:info")
	public R info(@PathVariable("nxDepartmentId") Integer nxDepartmentId){
		NxDepartmentEntity nxDepartment = nxDepartmentService.queryObject(nxDepartmentId);
		
		return R.ok().put("nxDepartment", nxDepartment);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
//	@RequiresPermissions("nxdepartment:save")
	public R save(@RequestBody NxDepartmentEntity nxDepartment){
		System.out.println(nxDepartment);
		nxDepartmentService.save(nxDepartment);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("nxdepartment:update")
	public R update(@RequestBody NxDepartmentEntity nxDepartment){
		nxDepartmentService.update(nxDepartment);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("nxdepartment:delete")
	public R delete(@RequestBody Integer[] nxDepartmentIds){
		nxDepartmentService.deleteBatch(nxDepartmentIds);
		
		return R.ok();
	}
	
}
