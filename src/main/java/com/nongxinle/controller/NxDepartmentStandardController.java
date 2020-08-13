package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 08-11 22:02
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxDepartmentStandardEntity;
import com.nongxinle.service.NxDepartmentStandardService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;


@RestController
@RequestMapping("api/nxdepartmentstandard")
public class NxDepartmentStandardController {
	@Autowired
	private NxDepartmentStandardService nxDepartmentStandardService;


	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
//	@RequiresPermissions("nxdepartmentstandard:save")
	public R save(@RequestBody NxDepartmentStandardEntity nxDepartmentStandard){
		nxDepartmentStandardService.save(nxDepartmentStandard);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
//	@RequiresPermissions("nxdepartmentstandard:update")
	public R update(@RequestBody NxDepartmentStandardEntity nxDepartmentStandard){
		nxDepartmentStandardService.update(nxDepartmentStandard);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("nxdepartmentstandard:delete")
	public R delete(@RequestBody Integer[] nxDepartmentStandardIds){
		nxDepartmentStandardService.deleteBatch(nxDepartmentStandardIds);
		
		return R.ok();
	}
	
}
