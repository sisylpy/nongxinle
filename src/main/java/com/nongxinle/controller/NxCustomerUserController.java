package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 2020-03-04 19:11:55
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nongxinle.entity.NxOrderTemplateEntity;
import com.nongxinle.service.NxOrderTemplateService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxCustomerUserEntity;
import com.nongxinle.service.NxCustomerUserService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;


@RestController
@RequestMapping("api/nxcustomeruser")
public class NxCustomerUserController {
	@Autowired
	private NxCustomerUserService nxCustomerUserService;

	@Autowired
	private NxOrderTemplateService nxOrderTemplateService;








    @RequestMapping(value = "/customerUserGetMy/{customerUserId}")
    @ResponseBody
    public R customerUserGetMy(@PathVariable Integer customerUserId) {

		System.out.println("hai");
		NxCustomerUserEntity nxCustomerUserEntity = nxCustomerUserService.queryObject(customerUserId);

		Map<String, Object> map = new HashMap<>();
		map.put("customerUserId", customerUserId);

		List<NxOrderTemplateEntity> templateEntities = nxOrderTemplateService.queryList(map);
		Map<String, Object> resultData = new HashMap<>();
		resultData.put("user", nxCustomerUserEntity);
		resultData.put("template", templateEntities);

		return R.ok().put("data", resultData);
    }

	
	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("nxcustomeruser:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<NxCustomerUserEntity> nxCustomerUserList = nxCustomerUserService.queryList(map);
		int total = nxCustomerUserService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(nxCustomerUserList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{custUserId}")
	@RequiresPermissions("nxcustomeruser:info")
	public R info(@PathVariable("custUserId") Integer custUserId){
		NxCustomerUserEntity nxCustomerUser = nxCustomerUserService.queryObject(custUserId);
		
		return R.ok().put("nxCustomerUser", nxCustomerUser);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("nxcustomeruser:save")
	public R save(@RequestBody NxCustomerUserEntity nxCustomerUser){

		nxCustomerUserService.save(nxCustomerUser);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("nxcustomeruser:update")
	public R update(@RequestBody NxCustomerUserEntity nxCustomerUser){
		nxCustomerUserService.update(nxCustomerUser);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("nxcustomeruser:delete")
	public R delete(@RequestBody Integer[] custUserIds){
		nxCustomerUserService.deleteBatch(custUserIds);
		
		return R.ok();
	}
	
}
