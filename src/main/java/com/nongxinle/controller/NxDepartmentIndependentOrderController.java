package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 08-01 13:09
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxDepartmentIndependentOrderEntity;
import com.nongxinle.service.NxDepartmentIndependentOrderService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;

import static com.nongxinle.utils.DateUtils.*;


@RestController
@RequestMapping("api/nxdepartmentindependentorder")
public class NxDepartmentIndependentOrderController {
	@Autowired
	private NxDepartmentIndependentOrderService nxDepartmentIndependentOrderService;





	@RequestMapping(value = "/finishIndependentOrders", method = RequestMethod.POST)
	@ResponseBody
	public R finishIndependentOrders (@RequestBody List<NxDepartmentIndependentOrderEntity> list  ) {
		System.out.println(list);
		for (NxDepartmentIndependentOrderEntity orders : list) {
			orders.setNxDioApplyStatus(3);
			orders.setNxDioOperationTime(formatWhatTime(0));
			nxDepartmentIndependentOrderService.update(orders);
		}
		return R.ok();
	}

	@RequestMapping(value = "/shareIndependentOrders", method = RequestMethod.POST)
	@ResponseBody
	public R shareIndependentOrders (@RequestBody List<NxDepartmentIndependentOrderEntity> list  ) {
		System.out.println(list);
		for (NxDepartmentIndependentOrderEntity orders : list) {

			orders.setNxDioApplyStatus(2);
			orders.setNxDioOperationTime(formatWhatTime(0));
			nxDepartmentIndependentOrderService.update(orders);
		}
		return R.ok();
	}

	@RequestMapping(value = "/copyIndependentOrders", method = RequestMethod.POST)
	@ResponseBody
	public R copyIndependentOrders (@RequestBody List<NxDepartmentIndependentOrderEntity> list  ) {
		System.out.println(list);
		for (NxDepartmentIndependentOrderEntity orders : list) {
			orders.setNxDioApplyStatus(1);
			orders.setNxDioOperationTime(formatWhatTime(0));
			nxDepartmentIndependentOrderService.update(orders);
		}
	    return R.ok();
	}


	

	
	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("nxdepartmentindependentorder:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<NxDepartmentIndependentOrderEntity> nxDepartmentIndependentOrderList = nxDepartmentIndependentOrderService.queryList(map);
		int total = nxDepartmentIndependentOrderService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(nxDepartmentIndependentOrderList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{nxDepIndependentOrderId}")
	@RequiresPermissions("nxdepartmentindependentorder:info")
	public R info(@PathVariable("nxDepIndependentOrderId") Integer nxDepIndependentOrderId){
		NxDepartmentIndependentOrderEntity nxDepartmentIndependentOrder = nxDepartmentIndependentOrderService.queryObject(nxDepIndependentOrderId);
		
		return R.ok().put("nxDepartmentIndependentOrder", nxDepartmentIndependentOrder);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
//	@RequiresPermissions("nxdepartmentindependentorder:save")
	public R save(@RequestBody NxDepartmentIndependentOrderEntity nxDepartmentIndependentOrder){
		nxDepartmentIndependentOrder.setNxDioApplyDate(formatWhatDate(0));
		nxDepartmentIndependentOrder.setNxDioApplyTime(formatWhatTime(0));
		nxDepartmentIndependentOrderService.save(nxDepartmentIndependentOrder);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("nxdepartmentindependentorder:update")
	public R update(@RequestBody NxDepartmentIndependentOrderEntity nxDepartmentIndependentOrder){
		nxDepartmentIndependentOrderService.update(nxDepartmentIndependentOrder);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("nxdepartmentindependentorder:delete")
	public R delete(@RequestBody Integer[] nxDepIndependentOrderIds){
		nxDepartmentIndependentOrderService.deleteBatch(nxDepIndependentOrderIds);
		
		return R.ok();
	}
	
}
