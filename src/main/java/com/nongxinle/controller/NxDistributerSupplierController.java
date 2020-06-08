package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 05-11 11:26
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxDistributerSupplierEntity;
import com.nongxinle.service.NxDistributerSupplierService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;


@RestController
@RequestMapping("api/nxdistributersupplier")
public class NxDistributerSupplierController {
	@Autowired
	private NxDistributerSupplierService nxDistributerSupplierService;
	

	
	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping(value = "/list", method = RequestMethod.POST)
//	@RequiresPermissions("nxdistributersupplier:list")
	public R list(@RequestParam  Integer page,@RequestParam Integer limit, @RequestParam Integer disId){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		map.put("disId", disId);


		//查询列表数据
		List<NxDistributerSupplierEntity> nxDistributerSupplierList = nxDistributerSupplierService.queryList(map);
		int total = nxDistributerSupplierService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(nxDistributerSupplierList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{nxDistributerSupplierId}")
	@RequiresPermissions("nxdistributersupplier:info")
	public R info(@PathVariable("nxDistributerSupplierId") Integer nxDistributerSupplierId){
		NxDistributerSupplierEntity nxDistributerSupplier = nxDistributerSupplierService.queryObject(nxDistributerSupplierId);
		
		return R.ok().put("nxDistributerSupplier", nxDistributerSupplier);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("nxdistributersupplier:save")
	public R save(@RequestBody NxDistributerSupplierEntity nxDistributerSupplier){
		nxDistributerSupplierService.save(nxDistributerSupplier);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("nxdistributersupplier:update")
	public R update(@RequestBody NxDistributerSupplierEntity nxDistributerSupplier){
		nxDistributerSupplierService.update(nxDistributerSupplier);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("nxdistributersupplier:delete")
	public R delete(@RequestBody Integer[] nxDistributerSupplierIds){
		nxDistributerSupplierService.deleteBatch(nxDistributerSupplierIds);
		
		return R.ok();
	}
	
}
