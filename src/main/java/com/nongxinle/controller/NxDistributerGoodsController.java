package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 07-27 17:38
 */

import java.util.*;

import com.nongxinle.entity.*;
import com.nongxinle.service.*;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;


@RestController
@RequestMapping("api/nxdistributergoods")
public class NxDistributerGoodsController {
	@Autowired
	private NxDistributerGoodsService dgService;

	@Autowired
	private NxStandardService standardService;

	@Autowired
	private NxGoodsService nxGoodsService;

	@Autowired
	private NxDistributerFatherGoodsService dgfService;

	@Autowired
	private NxDistributerStandardService dsService;


	@RequestMapping(value = "/queryDisGoodsByQuickSearch/{str}")
	@ResponseBody
	public R queryDisGoodsByQuickSearch(@PathVariable  String str) {
		System.out.println(str);
		List<NxDistributerGoodsEntity> goodsEntities = dgService.queryQuickSearch(str);
//        System.out.println(goodsEntities);


		return R.ok().put("data", goodsEntities);
	}
	
	@RequestMapping(value = "/getDisGoodsList", method = RequestMethod.POST)
	@ResponseBody
	public R getDisGoodsList (@RequestBody NxDistributerGoodsEntity disGoods  ) {
		System.out.println(disGoods);
		Map<String, Object> map = new HashMap<>();
		map.put("disId", disGoods.getNxDgDistributeId());
		map.put("fatherId", disGoods.getNxDgNxGoodsFatherId());
		System.out.println(map);
		System.out.println("mapddd====");
		List<NxDistributerGoodsEntity> disGoodsFatherList =  dgService.queryDisGoodsFatherList(map);
	    return R.ok().put("data", disGoodsFatherList);
	}
	
	
	
	@RequestMapping(value = "/getDisGoodsCata/{disId}")
	@ResponseBody
	public R getDisGoodsCata(@PathVariable Integer disId) {
		System.out.println("hahah");
		List<NxGoodsEntity> disGoods =  dgService.queryAllDistributerGoods(disId);
		if(disGoods.size() > 0){
//			for (NxGoodsEntity fatherGoods : disGoods) {
//				List<NxGoodsEntity> nxGoodsEntityList = fatherGoods.getNxGoodsEntityList();
//				for (NxGoodsEntity  goodsEntity: nxGoodsEntityList) {
//					Integer nxGoodsId = goodsEntity.getNxGoodsId();
//					Integer integer = dgService.querySubAmount(nxGoodsId);
//					goodsEntity.setSubAmount(integer);
//				}
//			}
			return R.ok().put("data", disGoods);

		}
		return R.ok();

	}




	@RequestMapping(value = "/disGetGoodsDetail/{disGoodsId}")
	@ResponseBody
	public R disGetGoodsDetail(@PathVariable Integer disGoodsId) {
	    NxDistributerGoodsEntity disGoods =  dgService.queryDisGoodsDetail(disGoodsId);
	    return R.ok().put("data", disGoods);
	}


	@RequestMapping(value = "/disGetGoodsList", method = RequestMethod.POST)
	@ResponseBody
	public R  disGetGoodsList (@RequestBody   NxDistributerGoodsEntity disGoods) {
		Integer nxDgNxGoodsGrandId = disGoods.getNxDgNxGoodsGrandId();
		Integer fatherId = disGoods.getNxDgNxGoodsFatherId();
		Integer nxDgDistributeId = disGoods.getNxDgDistributeId();
		Map<String, Object> map = new HashMap<>();
		map.put("grandId", nxDgNxGoodsGrandId);
//		map.put("fatherId", fatherId);
		map.put("disId", nxDgDistributeId);

//		GrandList 有2级，暂时不用
		List<NxGoodsEntity> goodsEntities =  dgService.queryDisGoodsGrandList(map);

//		List<NxGoodsEntity> goodsEntities = dgService.queryDisGoodsByFatherId(map);

		return R.ok().put("data", goodsEntities);
	}


	@RequestMapping(value = "/disGetFatherGoods/{disId}")
	@ResponseBody
	public R disGetFatherGoods(@PathVariable Integer disId) {
//
		System.out.println("befoofofofofofo=------------");
	    List<NxGoodsEntity> disGoods = dgService.queryAllDistributerGoods(disId);
		System.out.println("ok????????????==========");
	    if(disGoods.size() > 0){
			for (NxGoodsEntity goods : disGoods) {
				List<NxGoodsEntity> nxGoodsEntityList = goods.getNxGoodsEntityList();
//				for (NxGoodsEntity grand : nxGoodsEntityList) {
//					Integer nxGrandGoodsId = grand.getNxGoodsId();
//
//					Integer amount = dgService.queryGrandSubAmount(nxGrandGoodsId);
//					grand.setSubAmount(amount);
//				}

			}
			return R.ok().put("data", disGoods);
		}
	else {
			return R.ok();

		}


	}

	@RequestMapping(value = "/disGetIbookGoods", method = RequestMethod.POST)
	@ResponseBody
	public R disGetIbookGoods (Integer limit, Integer page, Integer fatherId, Integer disId ) {
		System.out.println("hen");
		List<NxGoodsEntity> nxGoodsEntities1 = queryByFatherIdwithLimit(limit, page, fatherId);

		List<NxGoodsEntity> goodsEntities = new ArrayList<>();

		for (NxGoodsEntity goods : nxGoodsEntities1) {
			Map<String, Object> map = new HashMap<>();
			map.put("disId", disId);
			map.put("goodsId", goods.getNxGoodsId());
			List<NxDistributerGoodsEntity> dgGoods = dgService.queryAddDistributerNxGoods(map);
			Integer nxGoodsId = goods.getNxGoodsId();
			List<NxStandardEntity> standardEntities =  standardService.queryGoodsStandardListByGoodId(nxGoodsId);
			goods.setNxGoodsStandardEntities(standardEntities);

			if(dgGoods.size() > 0) {
				goods.setIsDownload(1);
				goodsEntities.add(goods);
			}else {
				goods.setIsDownload(0);
				goodsEntities.add(goods);
			}
		}

		int total = nxGoodsService.queryTotalByFatherId(fatherId);
		PageUtils pageUtil = new PageUtils(goodsEntities, total, limit, page);
		return R.ok().put("page", pageUtil);
	}

	private List<NxGoodsEntity>  queryByFatherIdwithLimit(Integer limit, Integer page, Integer fatherId){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		map.put("fatherId", fatherId);

		System.out.println("haiahfidfi");

		//查询列表数据
		List<NxGoodsEntity> nxGoodsEntities = nxGoodsService.queryListWithFatherId(map);

		return nxGoodsEntities;
	}

	//todo
	/**
	 * 商户添加自己的商品
	 * @param cgnGoods shangpin
	 * @return
	 */
	@RequestMapping(value = "/postDgnGoods", method = RequestMethod.POST)
	@ResponseBody
	public R postDgnGoods(@RequestBody NxDistributerGoodsEntity cgnGoods) {
		System.out.println("disPostGoods");
		System.out.println(cgnGoods);
		System.out.println(cgnGoods.getNxDgNxGoodsFatherId());
		System.out.println(cgnGoods.getNxDgDistributeId());

		//获取nxGoods的父类id，查询社区父类是否有此父类商品
		Integer dgGoodsFatherId = cgnGoods.getNxDgNxGoodsFatherId();
		Integer nxCgCommunityId = cgnGoods.getNxDgDistributeId();
		Map<String, Object> map = new HashMap<>();
		map.put("disId", nxCgCommunityId);
		map.put("nxFatherId", dgGoodsFatherId);
		List<NxDistributerGoodsEntity> disGoodsEntities =  dgService.queryHasDisGoodsFather(map);

		//如果已经有父类商品
		if (disGoodsEntities.size() > 0) {
			//1，给父类商品的字段商品数量加1
			NxDistributerGoodsEntity disGoodsEntity = disGoodsEntities.get(0);

			//2，保存dis商品
			cgnGoods.setNxDgNxGoodsFatherId(disGoodsEntity.getNxDgNxGoodsFatherId());
			cgnGoods.setNxDgDfgGoodsFatherId(disGoodsEntity.getNxDgDfgGoodsFatherId());
			dgService.save(cgnGoods);

//			//3，保存社区商品的规格
			Integer nxCgGoodsId = cgnGoods.getNxDistributerGoodsId();
			List<NxStandardEntity> ncsEntities = cgnGoods.getNxStandardEntities();
			for (NxStandardEntity standard : ncsEntities) {
				NxDistributerStandardEntity disStandards = new NxDistributerStandardEntity();
				disStandards.setNxDsDisGoodsId(nxCgGoodsId);
				disStandards.setNxDsStandardName(standard.getNxStandardName());
				disStandards.setNxDsStandardError(standard.getNxStandardError());
				disStandards.setNxDsStandardScale(standard.getNxStandardScale());
				disStandards.setNxDsStandardFilePath(standard.getNxStandardFilePath());
				disStandards.setNxDsStandardSort(standard.getNxStandardSort());
				dsService.save(disStandards);
			}

			//4, 父类加1
			Integer nxDgDfgGoodsFatherId = disGoodsEntity.getNxDgDfgGoodsFatherId();
			NxDistributerFatherGoodsEntity dfGoodsEntity = dgfService.queryObject(nxDgDfgGoodsFatherId);
			System.out.println(dfGoodsEntity.getNxDfgGoodsAmount() + "amoutntn000:");
			dfGoodsEntity.setNxDfgGoodsAmount(dfGoodsEntity.getNxDfgGoodsAmount() + 1);
			System.out.println(dfGoodsEntity.getNxDfgGoodsAmount() + "amoutntn1111:");
			dgfService.update(dfGoodsEntity);



		} else {
			//如果没有社区父类商品，
			//1， 添加父类商品的greatGrandFather

			NxDistributerFatherGoodsEntity greatGrand = new NxDistributerFatherGoodsEntity();
			String nxCgGreatGrandFatherName = cgnGoods.getNxDgGreatGrandFatherName();
			greatGrand.setNxDfgDistributerId(cgnGoods.getNxDgDistributeId());
			greatGrand.setNxDfFathersFatherId(0);
			greatGrand.setNxDfFatherGoodsLevel(0);
			greatGrand.setNxDfFatherGoodsName(nxCgGreatGrandFatherName);
			dgfService.save(greatGrand);


			NxDistributerFatherGoodsEntity grand = new NxDistributerFatherGoodsEntity();
			String nxCgGrandFatherName = cgnGoods.getNxDgGrandFatherName();
			grand.setNxDfgDistributerId(cgnGoods.getNxDgDistributeId());
			grand.setNxDfFathersFatherId(greatGrand.getNxDistributerFatherGoodsId());
			grand.setNxDfFatherGoodsLevel(1);
			grand.setNxDfFatherGoodsName(nxCgGrandFatherName);

			dgfService.save(grand);

			//2，添加父类商品的grandFather


			//3，添加父类商品
			NxDistributerFatherGoodsEntity dgf = new NxDistributerFatherGoodsEntity();
			dgf.setNxDfgDistributerId(cgnGoods.getNxDgDistributeId());
			dgf.setNxDfFathersFatherId(grand.getNxDistributerFatherGoodsId());
			dgf.setNxDfFatherGoodsName(cgnGoods.getNxDgNxGoodsFatherName());
			dgf.setNxDfFatherGoodsLevel(2);
			dgf.setNxDfFatherGoodsImg(cgnGoods.getNxDgGrandFatherImg());


			dgf.setNxDfgGoodsAmount(1);
			// #20afb8  #1ebaee  #3cc36e  #f5c832  #f09628  #f05a32 #20afb8 #969696

			if(cgnGoods.getNxDgGreatGrandFatherId().equals(1)){
				dgf.setNxDfFatherGoodsColor("#20afb8");
			}else if(cgnGoods.getNxDgGreatGrandFatherId().equals(2)){
				dgf.setNxDfFatherGoodsColor("#1ebaee");
			}else if(cgnGoods.getNxDgGreatGrandFatherId().equals(3)){
				dgf.setNxDfFatherGoodsColor("#3cc36e");
			}else if(cgnGoods.getNxDgGreatGrandFatherId().equals(4)){
				dgf.setNxDfFatherGoodsColor("#f5c832");
			}else if(cgnGoods.getNxDgGreatGrandFatherId().equals(5)){
				dgf.setNxDfFatherGoodsColor("#f09628");
			}else if(cgnGoods.getNxDgGreatGrandFatherId().equals(6)){
				dgf.setNxDfFatherGoodsColor("#f05a32");
			}else if(cgnGoods.getNxDgGreatGrandFatherId().equals(7)){
				dgf.setNxDfFatherGoodsColor("#20afb8");
			}else if(cgnGoods.getNxDgGreatGrandFatherId().equals(8)){
				dgf.setNxDfFatherGoodsColor("#969696");
			}

			dgfService.save(dgf);

			Integer nxCommunityFatherGoodsId = dgf.getNxDistributerFatherGoodsId();
			cgnGoods.setNxDgDfgGoodsFatherId(nxCommunityFatherGoodsId);
			dgService.save(cgnGoods);
			Integer nxCgGoodsId = cgnGoods.getNxDistributerGoodsId();


			System.out.println("000011111");

			Integer nxCgGoodsIds = cgnGoods.getNxDistributerGoodsId();
			List<NxStandardEntity> ncsEntities = cgnGoods.getNxStandardEntities();
			for (NxStandardEntity standard : ncsEntities) {
				NxDistributerStandardEntity disStandard = new NxDistributerStandardEntity();
				disStandard.setNxDsDisGoodsId(nxCgGoodsIds);
				disStandard.setNxDsStandardName(standard.getNxStandardName());
				disStandard.setNxDsStandardError(standard.getNxStandardError());
				disStandard.setNxDsStandardScale(standard.getNxStandardScale());
				disStandard.setNxDsStandardFilePath(standard.getNxStandardFilePath());
				disStandard.setNxDsStandardSort(standard.getNxStandardSort());

				dsService.save(disStandard);
			}


		}

		return R.ok();
	}








	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("nxdistributergoods:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<NxDistributerGoodsEntity> nxDistributerGoodsList = dgService.queryList(map);
		int total = dgService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(nxDistributerGoodsList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{nxDistributerGoodsId}")
	@RequiresPermissions("nxdistributergoods:info")
	public R info(@PathVariable("nxDistributerGoodsId") Integer nxDistributerGoodsId){
		NxDistributerGoodsEntity nxDistributerGoods = dgService.queryObject(nxDistributerGoodsId);
		
		return R.ok().put("nxDistributerGoods", nxDistributerGoods);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("nxdistributergoods:save")
	public R save(@RequestBody NxDistributerGoodsEntity nxDistributerGoods){
		dgService.save(nxDistributerGoods);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("nxdistributergoods:update")
	public R update(@RequestBody NxDistributerGoodsEntity nxDistributerGoods){
		dgService.update(nxDistributerGoods);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("nxdistributergoods:delete")
	public R delete(@RequestBody Integer[] nxDistributerGoodsIds){
		dgService.deleteBatch(nxDistributerGoodsIds);
		
		return R.ok();
	}
	
}
