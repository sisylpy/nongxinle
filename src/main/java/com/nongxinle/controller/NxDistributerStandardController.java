package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 07-27 21:41
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxDistributerStandardEntity;
import com.nongxinle.service.NxDistributerStandardService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;


@RestController
@RequestMapping("api/nxdistributerstandard")
public class NxDistributerStandardController {
	@Autowired
	private NxDistributerStandardService nxDistributerStandardService;


	@RequestMapping(value = "/disUpdateStandard", method = RequestMethod.POST)
	@ResponseBody
	public R disUpdateStandard (@RequestBody NxDistributerStandardEntity standard  ) {
		System.out.println("update");
		nxDistributerStandardService.update(standard);
		return R.ok().put("data",standard);
	}

	@RequestMapping(value = "/disSaveStandard", method = RequestMethod.POST)
	@ResponseBody
	public R disSaveStandard (@RequestBody NxDistributerStandardEntity standard  ) {
		System.out.println("abc");
	    nxDistributerStandardService.save(standard);
	    return R.ok().put("data",standard);
	}
	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("nxdistributerstandard:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<NxDistributerStandardEntity> nxDistributerStandardList = nxDistributerStandardService.queryList(map);
		int total = nxDistributerStandardService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(nxDistributerStandardList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{nxDistributerStandardId}")
	@RequiresPermissions("nxdistributerstandard:info")
	public R info(@PathVariable("nxDistributerStandardId") Integer nxDistributerStandardId){
		NxDistributerStandardEntity nxDistributerStandard = nxDistributerStandardService.queryObject(nxDistributerStandardId);
		
		return R.ok().put("nxDistributerStandard", nxDistributerStandard);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("nxdistributerstandard:save")
	public R save(@RequestBody NxDistributerStandardEntity nxDistributerStandard){
		nxDistributerStandardService.save(nxDistributerStandard);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("nxdistributerstandard:update")
	public R update(@RequestBody NxDistributerStandardEntity nxDistributerStandard){
		nxDistributerStandardService.update(nxDistributerStandard);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("nxdistributerstandard:delete")
	public R delete(@RequestBody Integer[] nxDistributerStandardIds){
		nxDistributerStandardService.deleteBatch(nxDistributerStandardIds);
		
		return R.ok();
	}
	
}
