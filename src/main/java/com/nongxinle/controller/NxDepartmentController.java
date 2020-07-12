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

	@Autowired
	private NxDepartmentOrdersService nxDepartmentOrdersService;

	@RequestMapping(value = "/getFatherDep/{depId}")
	@ResponseBody
	public R getFatherDep(@PathVariable Integer depId) {
		List<NxDepartmentEntity> departmentEntities = nxDepartmentService.queryFatherDep(depId);


	    return R.ok().put("data", departmentEntities.get(0));
	}


	@RequestMapping(value = "/getSubDepartments/{depId}")
	@ResponseBody
	public R getSubDepartments(@PathVariable Integer depId) {
	     List<NxDepartmentEntity> departmentEntities =   nxDepartmentService.querySubDepartments(depId);

	    return R.ok().put("data", departmentEntities);
	}


	 @RequestMapping(value = "/getPrintPickerData", method = RequestMethod.POST)
	  @ResponseBody
	  public R getPrintPickerData (@RequestBody List<NxDepartmentEntity>  depArr) {
		 System.out.println(depArr);
		 List<NxDepartmentEntity> departmentEntityList = new ArrayList<>();
		 for (NxDepartmentEntity dep : depArr) {
			NxDepartmentEntity departmentEntities =   nxDepartmentOrdersService.queryPrintPickerData(dep.getNxDepartmentId());
			 departmentEntityList.add(departmentEntities);
		 }

	    return R.ok().put("data", departmentEntityList);
	  }


	@RequestMapping(value = "/groupInfo/{userId}")
	@ResponseBody
	public R groupInfo(@PathVariable Integer userId) {
	     Map<String, Object> map = nxDepartmentService.queryGroupInfo(userId);

	    return R.ok().put("data", map);
	}

	 @RequestMapping(value = "/restrauntRegist", method = RequestMethod.POST)
	  @ResponseBody
	  public R restrauntRegist (@RequestBody NxDepartmentEntity dep) {
		 System.out.println(dep);

		 Integer integer = nxDepartmentService.saveNewRestraunt(dep);


		 return R.ok().put("data", integer);
	  }




	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/saveSubDepartment")
//	@RequiresPermissions("nxdepartment:save")
	public R saveSubDepartment(@RequestBody NxDepartmentEntity nxDepartment){
		System.out.println("ddddddcccc22222" + nxDepartment);
		List<NxDepartmentEntity> nxDepartmentEntities = nxDepartment.getNxDepartmentEntities();
		for (NxDepartmentEntity dep : nxDepartmentEntities) {
			System.out.println("--===---222222");
		nxDepartmentService.saveSubDepartment(dep);

		}
		Integer nxDepartmentId = nxDepartment.getNxDepartmentId();
		System.out.println();
		NxDepartmentEntity nxDepartmentEntity = nxDepartmentService.queryObject(nxDepartmentId);
		Integer nxDepartmentSubAmount = nxDepartmentEntity.getNxDepartmentSubAmount();
		System.out.println(nxDepartmentSubAmount + "ammmmount2222");
		nxDepartmentEntity.setNxDepartmentSubAmount(nxDepartmentSubAmount + nxDepartment.getNxDepartmentEntities().size());

		nxDepartmentService.update(nxDepartmentEntity);
		return R.ok();
	}



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
//	@RequiresPermissions("nxdepartment:info")
	public R info(@PathVariable("nxDepartmentId") Integer nxDepartmentId){
		NxDepartmentEntity nxDepartment = nxDepartmentService.queryObject(nxDepartmentId);
		
		return R.ok().put("data", nxDepartment);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
//	@RequiresPermissions("nxdepartment:save")
	public R save(@RequestBody NxDepartmentEntity nxDepartment){
		System.out.println("dddddd" + nxDepartment);
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
