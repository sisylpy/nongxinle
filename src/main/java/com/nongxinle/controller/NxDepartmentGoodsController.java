package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 06-17 23:53
 */

import java.util.*;

import com.nongxinle.entity.NxDepartmentEntity;
import com.nongxinle.entity.NxGoodsEntity;
import com.nongxinle.service.NxGoodsService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxDepartmentGoodsEntity;
import com.nongxinle.service.NxDepartmentGoodsService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;

import static com.nongxinle.utils.DateUtils.formatWhatDate;


@RestController
@RequestMapping("api/nxdepartmentgoods")
public class NxDepartmentGoodsController {
	@Autowired
	private NxDepartmentGoodsService nxDepartmentGoodsService;

	@Autowired
	private NxGoodsService nxGoodsService;


	@RequestMapping(value = "/getDepGoodsByOrderTime/{depId}")
	@ResponseBody
	public R getDepGoodsByOrderTime(@PathVariable Integer depId) {
		System.out.println(depId);
		List<NxDepartmentGoodsEntity> departmentGoodsEntities =  nxDepartmentGoodsService.queryDepartGoods(depId);

		List<Map<String, Object>> resultData = new ArrayList<>();
		String today = formatWhatDate(0);
		String tomorrow = formatWhatDate(-1);
		String theDayAfterTomrrow = formatWhatDate(-2);
		System.out.println("lokkkkkk");
		System.out.println(today + tomorrow + theDayAfterTomrrow );
		List<NxDepartmentGoodsEntity> todayDepGoods = new ArrayList<>();
		List<NxDepartmentGoodsEntity> tomrrowDepGoods = new ArrayList<>();
		List<NxDepartmentGoodsEntity> theDayAfterTomrrowDepGoods = new ArrayList<>();
		List<NxDepartmentGoodsEntity> otherDepGoods = new ArrayList<>();

		for (NxDepartmentGoodsEntity depGoods : departmentGoodsEntities) {
			String nxDgOrderOnlyDate1 = depGoods.getNxDgOrderOnlyDate();
			System.out.println(nxDgOrderOnlyDate1 + "11111");
			String nxDgOrderOnlyDate = depGoods.getNxDgOrderOnlyDate();
			if(today.equals(nxDgOrderOnlyDate)){
				todayDepGoods.add(depGoods);


			}
			else if(tomorrow.equals(nxDgOrderOnlyDate)){
				tomrrowDepGoods.add(depGoods);



			}
			else if(theDayAfterTomrrow.equals(nxDgOrderOnlyDate)){
				theDayAfterTomrrowDepGoods.add(depGoods);


			}
			else {
				otherDepGoods.add(depGoods);

			}

		}
		Map<String, Object> todayMap = new HashMap<>();
		todayMap.put("date", "今天");
		todayMap.put("depGoods", todayDepGoods);
		if(todayDepGoods.size() > 0){
			resultData.add(todayMap);
		}

		Map<String, Object> tomrrowMap = new HashMap<>();
		tomrrowMap.put("date", "昨天");
		tomrrowMap.put("depGoods", tomrrowDepGoods);
		if(tomrrowDepGoods.size() > 0){
			resultData.add(tomrrowMap);
		}

		Map<String, Object> theDayAfterTomrrowMap = new HashMap<>();
		theDayAfterTomrrowMap.put("date", "前天");
		theDayAfterTomrrowMap.put("depGoods", theDayAfterTomrrowDepGoods);
		if(theDayAfterTomrrowDepGoods.size() > 0){
			resultData.add(theDayAfterTomrrowMap);
		}

		Map<String, Object> otherMap = new HashMap<>();
		otherMap.put("date", "更早");
		otherMap.put("depGoods", otherDepGoods);
		if(otherDepGoods.size() > 0){
			resultData.add(otherMap);
		}


		return R.ok().put("data", resultData);
	}


	@RequestMapping(value = "/getDepGoodsInfo")
	@ResponseBody
	public R getDepGoodsInfo(Integer nxGoodsId, Integer nxDepId) {
		System.out.println(nxGoodsId + "hahhaha");

		NxGoodsEntity goodsEntity = nxGoodsService.queryObject(nxGoodsId);

		Map<String, Object> map = new HashMap<>();
		map.put("nxGoodsId", nxGoodsId);
		map.put("nxDepId", nxDepId);

		List<NxDepartmentGoodsEntity> depGoods = nxDepartmentGoodsService.queryIfHasDepartmentGoods(map);
		if (depGoods.size() > 0){
			goodsEntity.setNxDepartmentGoodsId(depGoods.get(0).getNxDepartmentGoodsId());
			goodsEntity.setNxDepartmentGoodsPrice(depGoods.get(0).getNxDgGoodsPrice());

		}else {
			goodsEntity.setNxDepartmentGoodsId(-1);
		}


	    return R.ok().put("data", goodsEntity);
	}


	 @RequestMapping(value = "/depGetDepGoods", method = RequestMethod.POST)
	  @ResponseBody
	  public R depGetDepGoods  (@RequestBody NxDepartmentGoodsEntity depGoodsEntity ) {
		 Integer nxDgDepartmentId = depGoodsEntity.getNxDgDepartmentId();
		 Integer nxDgNxGoodsFatherId = depGoodsEntity.getNxDgNxGoodsFatherId();
		 Map<String, Object> map = new HashMap<>();
		 map.put("depId", nxDgDepartmentId);
		 map.put("fatherGoodsId", nxDgNxGoodsFatherId);
		 List<NxDepartmentGoodsEntity> depGoods  = nxDepartmentGoodsService.queryDepGoodsByFatherId(map);


		 return R.ok().put("data", depGoods);
	  }





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
