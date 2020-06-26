package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 2020-02-24 17:06:57
 */

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nongxinle.entity.NxCommunityAdsenseEntity;
import com.nongxinle.entity.NxCommunityPromoteEntity;
import com.nongxinle.service.NxCommunityAdsenseService;
import com.nongxinle.service.NxCommunityPromoteService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxCommunityFatherGoodsEntity;
import com.nongxinle.service.NxCommunityFatherGoodsService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;


@RestController
@RequestMapping("api/nxcommunityfathergoods")
public class NxCommunityFatherGoodsController {
	@Autowired
	private NxCommunityFatherGoodsService nxCommunityFatherGoodsService;

	@Autowired
	private NxCommunityPromoteService nxCommunityPromoteService;

	@Autowired
	private NxCommunityAdsenseService nxCommunityAdsenseService;





	// #20afb8  #1ebaee  #3cc36e  #f5c832  #f09628  #f05a32 #20afb8 #969696

	@RequestMapping(value = "/customerIndexData/{communityId}")
	@ResponseBody
	public R customerIndexData(@PathVariable Integer communityId) {

		List<NxCommunityFatherGoodsEntity> entities = nxCommunityFatherGoodsService.queryCataListByCommunityId(communityId);
		List<NxCommunityFatherGoodsEntity> fatherGoodsEntities = new ArrayList<>();
		for (NxCommunityFatherGoodsEntity father : entities) {
			Integer nxCommunityFatherGoodsId = father.getNxCommunityFatherGoodsId();
			List<NxCommunityPromoteEntity> nxPromoteEntities = nxCommunityPromoteService.queryPromoteByFatherId(nxCommunityFatherGoodsId);
			father.setNxPromoteEntities(nxPromoteEntities);
			fatherGoodsEntities.add(father);
		}

		List<NxCommunityAdsenseEntity> adsenseEntities = nxCommunityAdsenseService.queryAdsenseByNxCommunityId(communityId);
		Map<String, Object> map = new HashMap<>();
		map.put("adsense", adsenseEntities);
		map.put("fathers", fatherGoodsEntities);


		System.out.println(entities);

		return R.ok().put("data", map);
	}
	@RequestMapping(value = "/getCgCateList/{communityId}")
	@ResponseBody
	public R getGoodsCateList(@PathVariable Integer communityId) {
		List<NxCommunityFatherGoodsEntity> entities = nxCommunityFatherGoodsService.queryCataListByCommunityId(communityId);
		return R.ok().put("data", entities);
	}
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
		List<NxCommunityFatherGoodsEntity> nxDistributerFatherGoodsList = nxCommunityFatherGoodsService.queryList(map);
		int total = nxCommunityFatherGoodsService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(nxDistributerFatherGoodsList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{nxDfgId}")
	@RequiresPermissions("nxdistributerfathergoods:info")
	public R info(@PathVariable("nxDfgId") Integer nxDfgId){
		NxCommunityFatherGoodsEntity nxDistributerFatherGoods = nxCommunityFatherGoodsService.queryObject(nxDfgId);
		
		return R.ok().put("nxDistributerFatherGoods", nxDistributerFatherGoods);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("nxdistributerfathergoods:save")
	public R save(@RequestBody NxCommunityFatherGoodsEntity nxDistributerFatherGoods){
		nxCommunityFatherGoodsService.save(nxDistributerFatherGoods);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("nxdistributerfathergoods:update")
	public R update(@RequestBody NxCommunityFatherGoodsEntity nxDistributerFatherGoods){
		nxCommunityFatherGoodsService.update(nxDistributerFatherGoods);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("nxdistributerfathergoods:delete")
	public R delete(@RequestBody Integer[] nxDfgIds){
		nxCommunityFatherGoodsService.deleteBatch(nxDfgIds);
		
		return R.ok();
	}
	
}
