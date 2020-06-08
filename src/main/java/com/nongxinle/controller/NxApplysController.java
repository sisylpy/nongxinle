package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 2020-02-10 19:43:11
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxApplysEntity;
import com.nongxinle.service.NxApplysService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;


@RestController
@RequestMapping("nxapplys")
public class NxApplysController {
	@Autowired
	private NxApplysService nxApplysService;
	

	
	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("nxapplys:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<NxApplysEntity> nxApplysList = nxApplysService.queryList(map);
		int total = nxApplysService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(nxApplysList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{nxApplysId}")
	@RequiresPermissions("nxapplys:info")
	public R info(@PathVariable("nxApplysId") Integer nxApplysId){
		NxApplysEntity nxApplys = nxApplysService.queryObject(nxApplysId);
		
		return R.ok().put("nxApplys", nxApplys);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("nxapplys:save")
	public R save(@RequestBody NxApplysEntity nxApplys){
		nxApplysService.save(nxApplys);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("nxapplys:update")
	public R update(@RequestBody NxApplysEntity nxApplys){
		nxApplysService.update(nxApplys);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("nxapplys:delete")
	public R delete(@RequestBody Integer[] nxApplysIds){
		nxApplysService.deleteBatch(nxApplysIds);
		
		return R.ok();
	}
	
}
