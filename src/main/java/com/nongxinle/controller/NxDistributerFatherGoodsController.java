package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 07-27 17:38
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxDistributerFatherGoodsEntity;
import com.nongxinle.service.NxDistributerFatherGoodsService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;


@RestController
@RequestMapping("api/nxdistributerfathergoods")
public class NxDistributerFatherGoodsController {
	@Autowired
	private NxDistributerFatherGoodsService nxDistributerFatherGoodsService;

	
	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("nxdistributerfathergoods:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<NxDistributerFatherGoodsEntity> nxDistributerFatherGoodsList = nxDistributerFatherGoodsService.queryList(map);
		int total = nxDistributerFatherGoodsService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(nxDistributerFatherGoodsList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{nxDistributerFatherGoodsId}")
	@RequiresPermissions("nxdistributerfathergoods:info")
	public R info(@PathVariable("nxDistributerFatherGoodsId") Integer nxDistributerFatherGoodsId){
		NxDistributerFatherGoodsEntity nxDistributerFatherGoods = nxDistributerFatherGoodsService.queryObject(nxDistributerFatherGoodsId);
		
		return R.ok().put("nxDistributerFatherGoods", nxDistributerFatherGoods);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("nxdistributerfathergoods:save")
	public R save(@RequestBody NxDistributerFatherGoodsEntity nxDistributerFatherGoods){
		nxDistributerFatherGoodsService.save(nxDistributerFatherGoods);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("nxdistributerfathergoods:update")
	public R update(@RequestBody NxDistributerFatherGoodsEntity nxDistributerFatherGoods){
		nxDistributerFatherGoodsService.update(nxDistributerFatherGoods);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("nxdistributerfathergoods:delete")
	public R delete(@RequestBody Integer[] nxDistributerFatherGoodsIds){
		nxDistributerFatherGoodsService.deleteBatch(nxDistributerFatherGoodsIds);
		
		return R.ok();
	}
	
}
