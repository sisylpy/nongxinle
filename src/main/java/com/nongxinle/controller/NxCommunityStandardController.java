package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 04-30 06:45
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxCommunityStandardEntity;
import com.nongxinle.service.NxCommunityStandardService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;


@RestController
@RequestMapping("nxcommunitystandard")
public class NxCommunityStandardController {
	@Autowired
	private NxCommunityStandardService nxCommunityStandardService;
	




	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("nxcommunitystandard:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<NxCommunityStandardEntity> nxCommunityStandardList = nxCommunityStandardService.queryList(map);
		int total = nxCommunityStandardService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(nxCommunityStandardList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{nxCommunityStandardId}")
	@RequiresPermissions("nxcommunitystandard:info")
	public R info(@PathVariable("nxCommunityStandardId") Integer nxCommunityStandardId){
		NxCommunityStandardEntity nxCommunityStandard = nxCommunityStandardService.queryObject(nxCommunityStandardId);
		
		return R.ok().put("nxCommunityStandard", nxCommunityStandard);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("nxcommunitystandard:save")
	public R save(@RequestBody NxCommunityStandardEntity nxCommunityStandard){
		nxCommunityStandardService.save(nxCommunityStandard);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("nxcommunitystandard:update")
	public R update(@RequestBody NxCommunityStandardEntity nxCommunityStandard){
		nxCommunityStandardService.update(nxCommunityStandard);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("nxcommunitystandard:delete")
	public R delete(@RequestBody Integer[] nxCommunityStandardIds){
		nxCommunityStandardService.deleteBatch(nxCommunityStandardIds);
		
		return R.ok();
	}
	
}
