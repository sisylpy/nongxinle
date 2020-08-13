package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 07-24 13:00
 */

import java.util.*;

import com.nongxinle.entity.NxGoodsEntity;
import com.nongxinle.entity.NxLettersEntity;
import com.nongxinle.service.NxDepartmentDisGoodsService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxDepartmentIndependentGoodsEntity;
import com.nongxinle.service.NxDepartmentIndependentGoodsService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;

import static com.nongxinle.utils.PinYin4jUtils.getHeadStringByString;
import static com.nongxinle.utils.PinYin4jUtils.hanziToPinyin;


@RestController
@RequestMapping("api/nxdepartmentindependentgoods")
public class NxDepartmentIndependentGoodsController {
	@Autowired
	private NxDepartmentIndependentGoodsService nxDepIndepenGoodsService;

	@Autowired
	private NxDepartmentDisGoodsService nxDepartmentDisGoodsService;






	@RequestMapping(value = "/searchDepDisGoodsAndIndependentGoods", method = RequestMethod.POST)
	@ResponseBody
	public R searchDepDisGoodsAndIndependentGoods (Integer depId, String searchStr) {
		System.out.println(searchStr);
		//1 DepDisGoods-search
		Map<String, Object> map = new HashMap<>();
		map.put("depId", depId);
		map.put("searchStr", searchStr);
		List<NxGoodsEntity> depDisGoods = nxDepartmentDisGoodsService.querySearchStr(map);
		System.out.println("depDisGoodsssss====" + depDisGoods);

		//2, depIndependent -search
		List<NxDepartmentIndependentGoodsEntity> independentGoods = nxDepIndepenGoodsService.querySearchStr(map);

		List<Map<String, Object>> mapList = letterGoods(independentGoods);
		Map<String, Object>  result = new HashMap<>();
		result.put("depGoodsArr", depDisGoods);
		result.put("independentArr", mapList);
	    return R.ok().put("data", result);
	}


	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping(value = "/list",method = RequestMethod.POST)
//	@RequiresPermissions("nxdepartmentindependentgoods:list")
	public R list(Integer page, Integer limit, Integer depId){
		System.out.println(limit);
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		map.put("depId",depId);

		//查询列表数据
		List<NxDepartmentIndependentGoodsEntity> nxDepIndGoodsList = nxDepIndepenGoodsService.queryList(map);
		List<Map<String, Object>> mapList = letterGoods(nxDepIndGoodsList);


		return R.ok().put("data", mapList);
	}

	private List<Map<String, Object>> letterGoods (List<NxDepartmentIndependentGoodsEntity> nxDepIndGoodsList){
		Set<NxLettersEntity> lettersEntities = new TreeSet<>();
		for (NxDepartmentIndependentGoodsEntity goods:nxDepIndGoodsList) {
			String nxDigGoodsPy = goods.getNxDigGoodsPy();
			String substring = nxDigGoodsPy.substring(0, 1);
			NxLettersEntity lettersEntity = new NxLettersEntity();
			lettersEntity.setLetter(substring);
			lettersEntities.add(lettersEntity);
		}
		System.out.println(lettersEntities + "leelelelle");
		List<Map<String, Object>> result = new ArrayList<>();

		for (NxLettersEntity letters : lettersEntities) {
			String letter = letters.getLetter().toUpperCase();
			Map<String, Object> map1 = new HashMap<>();
			map1.put("letter", letter);
			List<NxDepartmentIndependentGoodsEntity> depIndpenList = new ArrayList<>();
			for (NxDepartmentIndependentGoodsEntity depIndGoods : nxDepIndGoodsList) {

				String nxDigGoodsPy = depIndGoods.getNxDigGoodsPy().substring(0,1).toUpperCase();
				if(nxDigGoodsPy.equals(letter)){
					depIndpenList.add(depIndGoods);

				}
			}
			map1.put("list", depIndpenList);
			result.add(map1);

		}
		return  result;
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{nxDepartmentIndependentGoodsId}")
	@RequiresPermissions("nxdepartmentindependentgoods:info")
	public R info(@PathVariable("nxDepartmentIndependentGoodsId") Integer nxDepartmentIndependentGoodsId){
		NxDepartmentIndependentGoodsEntity nxDepartmentIndependentGoods = nxDepIndepenGoodsService.queryObject(nxDepartmentIndependentGoodsId);

		return R.ok().put("nxDepartmentIndependentGoods", nxDepartmentIndependentGoods);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
//	@RequiresPermissions("nxdepartmentindependentgoods:save")
	public R save(@RequestBody NxDepartmentIndependentGoodsEntity nxDepIndependentGoods){

		String goodsName = nxDepIndependentGoods.getNxDigGoodsName();
		String pinyin = hanziToPinyin(goodsName);

		String headPinyin = getHeadStringByString(goodsName, false, null);
		nxDepIndependentGoods.setNxDigGoodsPinyin(pinyin);
		nxDepIndependentGoods.setNxDigGoodsPy(headPinyin);
		nxDepIndepenGoodsService.save(nxDepIndependentGoods);
		return R.ok();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("nxdepartmentindependentgoods:update")
	public R update(@RequestBody NxDepartmentIndependentGoodsEntity nxDepartmentIndependentGoods){
		nxDepIndepenGoodsService.update(nxDepartmentIndependentGoods);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("nxdepartmentindependentgoods:delete")
	public R delete(@RequestBody Integer[] nxDepartmentIndependentGoodsIds){
		nxDepIndepenGoodsService.deleteBatch(nxDepartmentIndependentGoodsIds);
		
		return R.ok();
	}
	
}
