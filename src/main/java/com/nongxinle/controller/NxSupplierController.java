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

import com.nongxinle.entity.NxSupplierEntity;
import com.nongxinle.service.NxSupplierService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;


@RestController
@RequestMapping("api/nxsupplier")
public class NxSupplierController {
	@Autowired
	private NxSupplierService nxSupplierService;
	
	@RequestMapping("/nxsupplier.html")
	public String list(){
		return "nxsupplier/nxsupplier.html";
	}
	
	@RequestMapping("/nxsupplier_add.html")
	public String add(){
		return "nxsupplier/nxsupplier_add.html";
	}


	
	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping(value = "/list", method = RequestMethod.POST)
//	@RequiresPermissions("nxsupplier:list")
	public R list(@RequestParam  Integer page,@RequestParam Integer limit, @RequestParam Integer disId){
		System.out.println(page);
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		//查询列表数据
		List<NxSupplierEntity> nxSupplierList = nxSupplierService.queryList(map);
		int total = nxSupplierService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(nxSupplierList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{nxSupplierId}")
	@RequiresPermissions("nxsupplier:info")
	public R info(@PathVariable("nxSupplierId") Integer nxSupplierId){
		NxSupplierEntity nxSupplier = nxSupplierService.queryObject(nxSupplierId);
		
		return R.ok().put("nxSupplier", nxSupplier);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("nxsupplier:save")
	public R save(@RequestBody NxSupplierEntity nxSupplier){
		nxSupplierService.save(nxSupplier);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("nxsupplier:update")
	public R update(@RequestBody NxSupplierEntity nxSupplier){
		nxSupplierService.update(nxSupplier);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("nxsupplier:delete")
	public R delete(@RequestBody Integer[] nxSupplierIds){
		nxSupplierService.deleteBatch(nxSupplierIds);
		
		return R.ok();
	}
	
}
