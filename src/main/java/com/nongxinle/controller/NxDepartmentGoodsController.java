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
import java.util.TreeSet;

import com.nongxinle.entity.NxGoodsEntity;
import com.nongxinle.service.NxGoodsService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxDepartmentGoodsEntity;
import com.nongxinle.service.NxDepartmentGoodsService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;


@RestController
@RequestMapping("api/nxdepartmentgoods")
public class NxDepartmentGoodsController {
	@Autowired
	private NxDepartmentGoodsService nxDepartmentGoodsService;

	@Autowired
	private NxGoodsService nxGoodsService;
	



	@RequestMapping(value = "/depGetFatherGoods/{depId}")
	@ResponseBody
	public R depGetFatherGoods(@PathVariable Integer depId) {
		System.out.println(depId);
	    List<NxDepartmentGoodsEntity> departmentGoodsEntities =  nxDepartmentGoodsService.queryDepartGoods(depId);
		TreeSet<NxGoodsEntity> goodsEntityTreeSet = new TreeSet<>();


		for (NxDepartmentGoodsEntity goods : departmentGoodsEntities) {
			Integer nxDgNxGoodsFatherId = goods.getNxDgNxGoodsFatherId();
			NxGoodsEntity goodsEntity = nxGoodsService.queryObject(nxDgNxGoodsFatherId);
			goodsEntityTreeSet.add(goodsEntity);
		}

	    return R.ok().put("data", goodsEntityTreeSet);
	}


	
	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("nxdepartmentgoods:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<NxDepartmentGoodsEntity> nxDepartmentGoodsList = nxDepartmentGoodsService.queryList(map);
		int total = nxDepartmentGoodsService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(nxDepartmentGoodsList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{nxCommunityGoodsId}")
	@RequiresPermissions("nxdepartmentgoods:info")
	public R info(@PathVariable("nxCommunityGoodsId") Integer nxCommunityGoodsId){
		NxDepartmentGoodsEntity nxDepartmentGoods = nxDepartmentGoodsService.queryObject(nxCommunityGoodsId);
		
		return R.ok().put("nxDepartmentGoods", nxDepartmentGoods);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("nxdepartmentgoods:save")
	public R save(@RequestBody NxDepartmentGoodsEntity nxDepartmentGoods){
		nxDepartmentGoodsService.save(nxDepartmentGoods);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("nxdepartmentgoods:update")
	public R update(@RequestBody NxDepartmentGoodsEntity nxDepartmentGoods){
		nxDepartmentGoodsService.update(nxDepartmentGoods);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("nxdepartmentgoods:delete")
	public R delete(@RequestBody Integer[] nxCommunityGoodsIds){
		nxDepartmentGoodsService.deleteBatch(nxCommunityGoodsIds);
		
		return R.ok();
	}
	
}
