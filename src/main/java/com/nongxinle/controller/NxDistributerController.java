package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 2020-02-10 19:43:11
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nongxinle.entity.*;
import com.nongxinle.service.NxDistributerUserRoleService;
import com.nongxinle.service.NxDistributerUserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.service.NxDistributerService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;


@RestController
@RequestMapping("api/nxdistributer")
public class NxDistributerController {
	@Autowired
	private NxDistributerService nxDistributerService;

	@Autowired
	private NxDistributerUserService nxDistributerUserService;

	@Autowired
	private NxDistributerUserRoleService nxDistributerUserRoleService;
	
	 @RequestMapping(value = "/disAndUserSave", method = RequestMethod.POST)
	  @ResponseBody
	  public R disAndUserSave (@RequestBody NxDistributerEntity distributerEntity) {

		 System.out.println(distributerEntity);

	 	//1,保存批发商
	 	nxDistributerService.save(distributerEntity);

	 	//2，保存批发商用户
		 Integer nxDistributerId = distributerEntity.getNxDistributerId();
		 NxDistributerUserEntity nxDistributerUserEntity = distributerEntity.getNxDistributerUserEntity();
		 nxDistributerUserEntity.setNxDiuDistributerId(nxDistributerId);
		 nxDistributerUserService.save(nxDistributerUserEntity);

		 //查询注册成功的用户信息
		 Integer nxDistributerUserId = nxDistributerUserEntity.getNxDistributerUserId();
		 System.out.println("seachdhhchchchc");
		 NxDistributerUserEntity nxDistributerEntity = nxDistributerUserService.queryUserInfo(nxDistributerUserId);
		 System.out.println("kfdaklfas;fj");
		 System.out.println(nxDistributerEntity);


		 return R.ok().put("data", nxDistributerEntity);
	  }

	
	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("nxdistributer:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<NxDistributerEntity> nxDistributerList = nxDistributerService.queryList(map);
		int total = nxDistributerService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(nxDistributerList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{distributerId}")
	@RequiresPermissions("nxdistributer:info")
	public R info(@PathVariable("distributerId") Integer distributerId){
		NxDistributerEntity nxDistributer = nxDistributerService.queryObject(distributerId);
		
		return R.ok().put("nxDistributer", nxDistributer);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("nxdistributer:save")
	public R save(@RequestBody NxDistributerEntity nxDistributer){
		nxDistributerService.save(nxDistributer);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("nxdistributer:update")
	public R update(@RequestBody NxDistributerEntity nxDistributer){
		nxDistributerService.update(nxDistributer);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("nxdistributer:delete")
	public R delete(@RequestBody Integer[] distributerIds){
		nxDistributerService.deleteBatch(distributerIds);
		
		return R.ok();
	}
	
}
