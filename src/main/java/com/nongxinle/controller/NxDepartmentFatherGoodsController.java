package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 06-17 23:53
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxDepartmentFatherGoodsEntity;
import com.nongxinle.service.NxDepartmentFatherGoodsService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;


@RestController
@RequestMapping("nxdepartmentfathergoods")
public class NxDepartmentFatherGoodsController {
	@Autowired
	private NxDepartmentFatherGoodsService nxDepartmentFatherGoodsService;
	
	@RequestMapping("/nxdepartmentfathergoods.html")
	public String list(){
		return "nxdepartmentfathergoods/nxdepartmentfathergoods.html";
	}
	
	@RequestMapping("/nxdepartmentfathergoods_add.html")
	public String add(){
		return "nxdepartmentfathergoods/nxdepartmentfathergoods_add.html";
	}
	
	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("nxdepartmentfathergoods:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<NxDepartmentFatherGoodsEntity> nxDepartmentFatherGoodsList = nxDepartmentFatherGoodsService.queryList(map);
		int total = nxDepartmentFatherGoodsService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(nxDepartmentFatherGoodsList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{nxCommunityFatherGoodsId}")
	@RequiresPermissions("nxdepartmentfathergoods:info")
	public R info(@PathVariable("nxCommunityFatherGoodsId") Integer nxCommunityFatherGoodsId){
		NxDepartmentFatherGoodsEntity nxDepartmentFatherGoods = nxDepartmentFatherGoodsService.queryObject(nxCommunityFatherGoodsId);
		
		return R.ok().put("nxDepartmentFatherGoods", nxDepartmentFatherGoods);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("nxdepartmentfathergoods:save")
	public R save(@RequestBody NxDepartmentFatherGoodsEntity nxDepartmentFatherGoods){
		nxDepartmentFatherGoodsService.save(nxDepartmentFatherGoods);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("nxdepartmentfathergoods:update")
	public R update(@RequestBody NxDepartmentFatherGoodsEntity nxDepartmentFatherGoods){
		nxDepartmentFatherGoodsService.update(nxDepartmentFatherGoods);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("nxdepartmentfathergoods:delete")
	public R delete(@RequestBody Integer[] nxCommunityFatherGoodsIds){
		nxDepartmentFatherGoodsService.deleteBatch(nxCommunityFatherGoodsIds);
		
		return R.ok();
	}
	
}
