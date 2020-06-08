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

import com.nongxinle.entity.NxCommunityEntity;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxDistributerCommunityEntity;
import com.nongxinle.service.NxDistributerCommunityService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;


@RestController
@RequestMapping("api/nxdistributercommunity")
public class NxDistributerCommunityController {
	@Autowired
	private NxDistributerCommunityService nxDistributerCommunityService;
	

	@RequestMapping(value = "/getCommunityByDistributerId/{distributerId}")
	@ResponseBody
	public R getCommunityByDistributerId(@PathVariable Integer distributerId) {
		List<NxCommunityEntity> entities = nxDistributerCommunityService.queryCommunityByDistributerId(distributerId);
	    return R.ok().put("data", entities);
	}
	
	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("nxdistributercommunity:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<NxDistributerCommunityEntity> nxDistributerCommunityList = nxDistributerCommunityService.queryList(map);
		int total = nxDistributerCommunityService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(nxDistributerCommunityList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{nxDcId}")
	@RequiresPermissions("nxdistributercommunity:info")
	public R info(@PathVariable("nxDcId") Integer nxDcId){
		NxDistributerCommunityEntity nxDistributerCommunity = nxDistributerCommunityService.queryObject(nxDcId);
		
		return R.ok().put("nxDistributerCommunity", nxDistributerCommunity);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("nxdistributercommunity:save")
	public R save(@RequestBody NxDistributerCommunityEntity nxDistributerCommunity){
		nxDistributerCommunityService.save(nxDistributerCommunity);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("nxdistributercommunity:update")
	public R update(@RequestBody NxDistributerCommunityEntity nxDistributerCommunity){
		nxDistributerCommunityService.update(nxDistributerCommunity);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("nxdistributercommunity:delete")
	public R delete(@RequestBody Integer[] nxDcIds){
		nxDistributerCommunityService.deleteBatch(nxDcIds);
		
		return R.ok();
	}
	
}
