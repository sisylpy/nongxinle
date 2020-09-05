package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 05-09 21:11
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nongxinle.entity.NxDepartmentEntity;
import com.nongxinle.service.NxDepartmentService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxDistributerDepartmentEntity;
import com.nongxinle.service.NxDistributerDepartmentService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;


@RestController
@RequestMapping("api/nxdistributerdepartment")
public class NxDistributerDepartmentController {
	@Autowired
	private NxDistributerDepartmentService nxDistributerDepartmentService;

	@Autowired
	private NxDepartmentService nxDepartmentService;


	/**
	 * 批发商添加客户
	 * @param distributerDepartmentEntity 客户
	 * @return 0
	 */
	@RequestMapping(value = "/saveOneCustomer", method = RequestMethod.POST)
	@ResponseBody
	public R saveOneCustomer (@RequestBody NxDistributerDepartmentEntity distributerDepartmentEntity)  {

		NxDepartmentEntity nxDepartmentEntity = distributerDepartmentEntity.getNxDepartmentEntity();

		//1,保存部门
		nxDepartmentService.saveJustDepartment(nxDepartmentEntity);


		//2，保存批发商部门
		Integer nxDepartmentId = nxDepartmentEntity.getNxDepartmentId();
		distributerDepartmentEntity.setNxDdDepartmentId(nxDepartmentId);
		nxDistributerDepartmentService.save(distributerDepartmentEntity);

		//3，如果有子部门，则保存子部门
		List<NxDepartmentEntity> nxDepartmentEntities = nxDepartmentEntity.getNxDepartmentEntities();
		if(nxDepartmentEntities.size() > 0){
			for (NxDepartmentEntity sub : nxDepartmentEntities) {
				sub.setNxDepartmentFatherId(nxDepartmentId);
				nxDepartmentService.saveJustDepartment(sub);
			}
		}
		return R.ok();
	}


	@RequestMapping(value = "/disGetAllCustomer/{disId}")
	@ResponseBody
	public R disGetAllDisDepartments(@PathVariable Integer disId) {
		System.out.println("conterrlekl");
		List<NxDepartmentEntity> entities =  nxDistributerDepartmentService.queryAllDisDepartments(disId);
		return R.ok().put("data", entities);
	}
	
	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("nxdistributerdepartment:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<NxDistributerDepartmentEntity> nxDistributerDepartmentList = nxDistributerDepartmentService.queryList(map);
		int total = nxDistributerDepartmentService.queryTotal(map);
		PageUtils pageUtil = new PageUtils(nxDistributerDepartmentList, total, limit, page);
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{nxDistributerDepId}")
	@RequiresPermissions("nxdistributerdepartment:info")
	public R info(@PathVariable("nxDistributerDepId") Integer nxDistributerDepId){
		NxDistributerDepartmentEntity nxDistributerDepartment = nxDistributerDepartmentService.queryObject(nxDistributerDepId);
		return R.ok().put("nxDistributerDepartment", nxDistributerDepartment);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("nxdistributerdepartment:save")
	public R save(@RequestBody NxDistributerDepartmentEntity nxDistributerDepartment){
		nxDistributerDepartmentService.save(nxDistributerDepartment);
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("nxdistributerdepartment:update")
	public R update(@RequestBody NxDistributerDepartmentEntity nxDistributerDepartment){
		nxDistributerDepartmentService.update(nxDistributerDepartment);
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("nxdistributerdepartment:delete")
	public R delete(@RequestBody Integer[] nxDistributerDepIds){
		nxDistributerDepartmentService.deleteBatch(nxDistributerDepIds);
		return R.ok();
	}
	
}
