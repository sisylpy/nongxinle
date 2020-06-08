package com.nongxinle.controller;

/**
 * 用户与角色对应关系
 *
 * @author lpy
 * @date 2020-03-23 13:42:33
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nongxinle.entity.NxDistributerUserEntity;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxDisUserRoleEntity;
import com.nongxinle.service.NxDisUserRoleService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;


@RestController
@RequestMapping("api/nxdisuserrole")
public class NxDisUserRoleController {
	@Autowired
	private NxDisUserRoleService nxDisUserRoleService;




	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("nxdisuserrole:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<NxDisUserRoleEntity> nxDisUserRoleList = nxDisUserRoleService.queryList(map);
		int total = nxDisUserRoleService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(nxDisUserRoleList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("nxdisuserrole:info")
	public R info(@PathVariable("id") Long id){
		NxDisUserRoleEntity nxDisUserRole = nxDisUserRoleService.queryObject(id);
		
		return R.ok().put("nxDisUserRole", nxDisUserRole);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("nxdisuserrole:save")
	public R save(@RequestBody NxDisUserRoleEntity nxDisUserRole){
		nxDisUserRoleService.save(nxDisUserRole);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("nxdisuserrole:update")
	public R update(@RequestBody NxDisUserRoleEntity nxDisUserRole){
		nxDisUserRoleService.update(nxDisUserRole);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("nxdisuserrole:delete")
	public R delete(@RequestBody Long[] ids){
		nxDisUserRoleService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
