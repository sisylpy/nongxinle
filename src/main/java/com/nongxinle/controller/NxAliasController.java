package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 07-30 18:51
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxAliasEntity;
import com.nongxinle.service.NxAliasService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;


@RestController
@RequestMapping("nxalias")
public class NxAliasController {
	@Autowired
	private NxAliasService nxAliasService;
	

	
	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("nxalias:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<NxAliasEntity> nxAliasList = nxAliasService.queryList(map);
		int total = nxAliasService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(nxAliasList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{nxAliasId}")
	@RequiresPermissions("nxalias:info")
	public R info(@PathVariable("nxAliasId") Integer nxAliasId){
		NxAliasEntity nxAlias = nxAliasService.queryObject(nxAliasId);
		
		return R.ok().put("nxAlias", nxAlias);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("nxalias:save")
	public R save(@RequestBody NxAliasEntity nxAlias){
		nxAliasService.save(nxAlias);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("nxalias:update")
	public R update(@RequestBody NxAliasEntity nxAlias){
		nxAliasService.update(nxAlias);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("nxalias:delete")
	public R delete(@RequestBody Integer[] nxAliasIds){
		nxAliasService.deleteBatch(nxAliasIds);
		
		return R.ok();
	}
	
}
