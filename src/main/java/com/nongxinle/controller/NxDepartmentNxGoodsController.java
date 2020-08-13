package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 07-24 13:00
 */

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nongxinle.entity.*;
import com.nongxinle.service.NxDistributerGoodsService;
import com.nongxinle.service.NxGoodsService;
import com.nongxinle.service.NxStandardService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.service.NxDepartmentNxGoodsService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;


@RestController
@RequestMapping("api/nxdepartmentnxgoods")
public class NxDepartmentNxGoodsController {
	@Autowired
	private NxDepartmentNxGoodsService nxDepartmentNxGoodsService;

	@Autowired
	private NxDistributerGoodsService nxDisGoodsService;

	@Autowired
	private NxStandardService standardService;


	@RequestMapping(value = "/searchDepNxGoodsAndIndependentGoods", method = RequestMethod.POST)
	@ResponseBody
	public R searchDepNxGoodsAndIndependentGoods (Integer depId, String searchStr  ) {

		Map<String, Object> map = new HashMap<>();
		map.put("depId", depId);
		map.put("searchStr", searchStr);
		List<NxDepartmentNxGoodsEntity> entities =  nxDepartmentNxGoodsService.querySearchStr(map);

		System.out.println(searchStr + "[[[[]]]]]");
	    return R.ok().put("data", entities);
	}



	@RequestMapping(value = "/depGetDepNxGoods/{depId}")
	@ResponseBody
	public R depGetDepNxGoods(@PathVariable Integer depId) {
	    List<NxDepartmentNxGoodsEntity> entities  = nxDepartmentNxGoodsService.queryDepartmentNxGoods(depId);
	    return R.ok().put("data", entities);
	}



	@RequestMapping(value = "/saveDepNxGoods", method = RequestMethod.POST)
	@ResponseBody
	public R saveDepNxGoods (@RequestBody NxDepartmentNxGoodsEntity depNxGoods  ) {
		nxDepartmentNxGoodsService.save(depNxGoods);
		Integer nxDepartmentNxGoodsId = depNxGoods.getNxDepartmentNxGoodsId();
		return R.ok().put("data", nxDepartmentNxGoodsId);
	}
	
	
	
	
	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("nxdepartmentnxgoods:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<NxDepartmentNxGoodsEntity> nxDepartmentNxGoodsList = nxDepartmentNxGoodsService.queryList(map);
		int total = nxDepartmentNxGoodsService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(nxDepartmentNxGoodsList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{nxDepartmentNxGoodsId}")
	@RequiresPermissions("nxdepartmentnxgoods:info")
	public R info(@PathVariable("nxDepartmentNxGoodsId") Integer nxDepartmentNxGoodsId){
		NxDepartmentNxGoodsEntity nxDepartmentNxGoods = nxDepartmentNxGoodsService.queryObject(nxDepartmentNxGoodsId);
		
		return R.ok().put("nxDepartmentNxGoods", nxDepartmentNxGoods);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("nxdepartmentnxgoods:save")
	public R save(@RequestBody NxDepartmentNxGoodsEntity nxDepartmentNxGoods){
		nxDepartmentNxGoodsService.save(nxDepartmentNxGoods);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("nxdepartmentnxgoods:update")
	public R update(@RequestBody NxDepartmentNxGoodsEntity nxDepartmentNxGoods){
		nxDepartmentNxGoodsService.update(nxDepartmentNxGoods);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("nxdepartmentnxgoods:delete")
	public R delete(@RequestBody Integer[] nxDepartmentNxGoodsIds){
		nxDepartmentNxGoodsService.deleteBatch(nxDepartmentNxGoodsIds);
		
		return R.ok();
	}
	
}
