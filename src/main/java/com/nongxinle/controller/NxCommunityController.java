package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 2020-03-04 17:57:31
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxCommunityEntity;
import com.nongxinle.service.NxCommunityService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;


@RestController
@RequestMapping("api/nxcommunity")
public class NxCommunityController {
	@Autowired
	private NxCommunityService nxCommunityService;


	/**
	 * 微信二维码扫描校验文件内容
	 * @return 文件内容
	 */
	@RequestMapping(value = "/customerRegist/i7948FzJJ6.txt")
	@ResponseBody

	public String customerRegist( ) {
//
		return "bb7a0c73e61112c45ebd6ad3743bb05e"; }

	/**
	 * 二维码扫描打开固定页面
	 * @param communityId 社区id
	 * @return 社区列表
	 */
	@RequestMapping(value = "/customerRegist/{communityId}")
	@ResponseBody
	public R customerRegist(@PathVariable Integer communityId) {
		NxCommunityEntity nxCommunity = nxCommunityService.queryObject(communityId);

		return R.ok().put("data", nxCommunity);
	}

	/**
	 * 微信二维码扫描校验文件内容
	 * @return 文件内容
	 */
	@RequestMapping(value = "/i7948FzJJ6.txt")
	@ResponseBody
	public String newCustomerRegist( ) { return "bb7a0c73e61112c45ebd6ad3743bb05e"; }

	/**
	 *
	 * @param communityId 社区id
	 * @return 社区列表
	 */
	@RequestMapping(value = "/newCustomerRegist/{communityId}")
	@ResponseBody
	public R newCustomerRegist(@PathVariable Integer communityId) {
		return R.ok().put("data", nxCommunityService.queryObject(communityId));
	}

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("nxcommunity:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<NxCommunityEntity> nxCommunityList = nxCommunityService.queryList(map);
		int total = nxCommunityService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(nxCommunityList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{nxCommunityId}")
//	@RequiresPermissions("nxcommunity:info")
	public R info(@PathVariable("nxCommunityId") Integer nxCommunityId){
		NxCommunityEntity nxCommunity = nxCommunityService.queryObject(nxCommunityId);
		
		return R.ok().put("data", nxCommunity);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
//	@RequiresPermissions("nxcommunity:save")
	public R save(@RequestBody NxCommunityEntity nxCommunity){
		nxCommunityService.save(nxCommunity);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
//	@RequiresPermissions("nxcommunity:update")
	public R update(@RequestBody NxCommunityEntity nxCommunity){
		nxCommunityService.update(nxCommunity);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("nxcommunity:delete")
	public R delete(@RequestBody Integer[] nxCommunityIds){
		nxCommunityService.deleteBatch(nxCommunityIds);
		
		return R.ok();
	}
	
}
