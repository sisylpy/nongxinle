package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 03-27 00:53
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxRouteEntity;
import com.nongxinle.service.NxRouteService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;


@RestController
@RequestMapping("nxroute")
public class NxRouteController {
	@Autowired
	private NxRouteService nxRouteService;
	

	
	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("nxroute:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<NxRouteEntity> nxRouteList = nxRouteService.queryList(map);
		int total = nxRouteService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(nxRouteList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{nxRouteId}")
	@RequiresPermissions("nxroute:info")
	public R info(@PathVariable("nxRouteId") Integer nxRouteId){
		NxRouteEntity nxRoute = nxRouteService.queryObject(nxRouteId);
		
		return R.ok().put("nxRoute", nxRoute);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("nxroute:save")
	public R save(@RequestBody NxRouteEntity nxRoute){
		nxRouteService.save(nxRoute);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("nxroute:update")
	public R update(@RequestBody NxRouteEntity nxRoute){
		nxRouteService.update(nxRoute);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("nxroute:delete")
	public R delete(@RequestBody Integer[] nxRouteIds){
		nxRouteService.deleteBatch(nxRouteIds);
		
		return R.ok();
	}
	
}
