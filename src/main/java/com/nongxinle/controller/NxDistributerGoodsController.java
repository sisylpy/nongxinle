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

	@Autowired
	private NxDepartmentDisGoodsService nxDepDisGoodsService;


	@RequestMapping(value = "/queryDisGoodsByQuickSearch", method = RequestMethod.POST)
	@ResponseBody
	public R queryDisGoodsByQuickSearch(String str, String disId) {
		System.out.println(str);
		Map<String, Object> map = new HashMap<>();
		map.put("str", str);
		map.put("disId", disId);
		List<NxDistributerGoodsEntity> goodsEntities = dgService.queryQuickSearch(map);
//        System.out.println(goodsEntities);


		return R.ok().put("data", goodsEntities);
	}
	
//	@RequestMapping(value = "/getDisGoodsList", method = RequestMethod.POST)
//	@ResponseBody
//	public R getDisGoodsList (@RequestBody NxDistributerGoodsEntity disGoods  ) {
//		System.out.println(disGoods);
//		Map<String, Object> map = new HashMap<>();
//		map.put("disId", disGoods.getNxDgDistributerId());
//		map.put("fatherId", disGoods.getNxDgNxFatherId());
//		System.out.println(map);
//		System.out.println("mapddd====");
//		List<NxDistributerGoodsEntity> disGoodsFatherList =  dgService.queryDisGoodsFatherList(map);
//	    return R.ok().put("data", disGoodsFatherList);
//	}
	
	
	




	@RequestMapping(value = "/disGetGoodsDetail/{disGoodsId}")
	@ResponseBody
	public R disGetGoodsDetail(@PathVariable Integer disGoodsId) {
	    NxDistributerGoodsEntity disGoods =  dgService.queryDisGoodsDetail(disGoodsId);

	    List<NxDepartmentEntity> entities = nxDepDisGoodsService.queryDepartmentsByDisGoodsId(disGoodsId);
	    Map<String, Object> map = new HashMap<>();
	    map.put("goodsInfo", disGoods);
	    map.put("departmentArr", entities);

	    return R.ok().put("data", map);
	}


	@RequestMapping(value = "/disGetDisGoodsListByFatherId", method = RequestMethod.POST)
	@ResponseBody
	public R  disGetDisGoodsListByFatherId (@RequestBody   NxDistributerGoodsEntity disGoods) {
		Integer nxDgDfgGoodsFatherId = disGoods.getNxDgDfgGoodsFatherId();
		Map<String, Object> map = new HashMap<>();
		map.put("fatherId", nxDgDfgGoodsFatherId);

//		GrandList 有2级，暂时不用
		List<NxDistributerGoodsEntity> goodsEntities1 = dgService.queryDisGoodsListByDisFatherId(nxDgDfgGoodsFatherId);
		return R.ok().put("data", goodsEntities1);
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


	@RequestMapping(value = "/postDgnGoods", method = RequestMethod.POST)
	@ResponseBody
	public R postDgnGoods(@RequestBody NxDistributerGoodsEntity cgnGoods) {


		// 3， 查询父类
		Integer nxDgNxFatherId = cgnGoods.getNxDgNxFatherId();
		Integer nxDgDistributerId = cgnGoods.getNxDgDistributerId();
		Map<String, Object> map = new HashMap<>();
		map.put("disId", nxDgDistributerId);
		map.put("nxFatherId", nxDgNxFatherId);
		List<NxDistributerGoodsEntity> disGoodsEntities =  dgService.queryDisGoodsHasNxGoodsFather(map);

		if(disGoodsEntities.size() > 0){
			//直接加disGoods和disStandard,不需要加disFatherGoods
			//1，给父类商品的字段商品数量加1
			NxDistributerGoodsEntity disGoodsEntity = disGoodsEntities.get(0);

			//2，保存disId商品
			Integer nxDgDfgGoodsFatherId = disGoodsEntity.getNxDgDfgGoodsFatherId();
			cgnGoods.setNxDgDfgGoodsFatherId(nxDgDfgGoodsFatherId);
			//1 ，先保存disGoods
			dgService.save(cgnGoods);
			//
		}else{
			//添加fatherGoods的第一个级别
			NxDistributerFatherGoodsEntity dgf = new NxDistributerFatherGoodsEntity();
			dgf.setNxDfgDistributerId(cgnGoods.getNxDgDistributerId());
			dgf.setNxDfgFatherGoodsName(cgnGoods.getNxDgNxFatherName());
			dgf.setNxDfgFatherGoodsLevel(2);
			dgfService.save(dgf);
			//更新disGoods的fatherGoodsId
			Integer distributerFatherGoodsId = dgf.getNxDistributerFatherGoodsId();
			cgnGoods.setNxDgDfgGoodsFatherId(distributerFatherGoodsId);
			dgService.save(cgnGoods);
			//继续查询是否有GrandFather
			String grandName = cgnGoods.getNxDgNxGrandName();
			Map<String, Object> map2 = new HashMap<>();
			map2.put("disId", nxDgDistributerId);
			map2.put("grandName", grandName);
			List<NxDistributerFatherGoodsEntity> grandGoodsFather = dgfService.queryHasDisGrandGoodsFather(map2);
			if(grandGoodsFather.size() > 0){
				NxDistributerFatherGoodsEntity nxDistributerFatherGoodsEntity = grandGoodsFather.get(0);
				dgf.setNxDfgFathersFatherId(nxDistributerFatherGoodsEntity.getNxDistributerFatherGoodsId());
				dgfService.update(dgf);
			}else{

				//tianjiaGrand
				NxDistributerFatherGoodsEntity grand = new NxDistributerFatherGoodsEntity();
				String nxCgGrandFatherName = cgnGoods.getNxDgNxGrandName();
				grand.setNxDfgFatherGoodsName(nxCgGrandFatherName);
				grand.setNxDfgDistributerId(cgnGoods.getNxDgDistributerId());
				grand.setNxDfgFatherGoodsLevel(1);
				dgfService.save(grand);

				dgf.setNxDfgFathersFatherId(grand.getNxDistributerFatherGoodsId());
				dgfService.update(dgf);


				//查询是否有greatGrand
				String greatGrandName = cgnGoods.getNxDgNxGreatGrandName();
				Map<String, Object> map3 = new HashMap<>();
				map3.put("disId", nxDgDistributerId);
				map3.put("greatGrandName", greatGrandName);
				List<NxDistributerFatherGoodsEntity> greatGrandGoodsFather = dgfService.queryHasDisGreatGrandGoodsFather(map3);
				if(greatGrandGoodsFather.size() > 0){
					NxDistributerFatherGoodsEntity nxDistributerFatherGoodsEntity = greatGrandGoodsFather.get(0);
					Integer disFatherId = nxDistributerFatherGoodsEntity.getNxDistributerFatherGoodsId();
					grand.setNxDfgFathersFatherId(disFatherId);
					dgfService.update(grand);
				}else{
					NxDistributerFatherGoodsEntity greatGrand = new NxDistributerFatherGoodsEntity();
					String greatGrandName1 = cgnGoods.getNxDgNxGreatGrandName();
					greatGrand.setNxDfgFatherGoodsName(greatGrandName1);
					greatGrand.setNxDfgDistributerId(cgnGoods.getNxDgDistributerId());
					greatGrand.setNxDfgFatherGoodsLevel(0);
					dgfService.save(greatGrand);
					grand.setNxDfgFathersFatherId(greatGrand.getNxDistributerFatherGoodsId());
					dgfService.update(grand);
				}
			}

		}


		//2，保存dis规格
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


		return R.ok();
	}


	//todo-standarddis
	/**
	 * 商户添加自己的商品
	 * @param cgnGoods shangpin
	 * @return
	 */
	@RequestMapping(value = "/postDgnGoods1", method = RequestMethod.POST)
	@ResponseBody
	public R postDgnGoods1(@RequestBody NxDistributerGoodsEntity cgnGoods) {
		System.out.println("disPostGoods");
		System.out.println(cgnGoods);
		System.out.println(cgnGoods.getNxDgNxFatherId());
		System.out.println(cgnGoods.getNxDgDistributerId());

		//获取nxGoods的父类id，查询社区父类是否有此父类商品
		Integer dgGoodsFatherId = cgnGoods.getNxDgNxFatherId();
		Integer nxCgCommunityId = cgnGoods.getNxDgDistributerId();
		Map<String, Object> map = new HashMap<>();
		map.put("disId", nxCgCommunityId);
		map.put("nxFatherId", dgGoodsFatherId);
		List<NxDistributerGoodsEntity> disGoodsEntities =  dgService.queryDisGoodsHasNxGoodsFather(map);

		//如果已经有父类商品,则不添加distributer_goods_father
		if (disGoodsEntities.size() > 0) {
			//1，给父类商品的字段商品数量加1
			NxDistributerGoodsEntity disGoodsEntity = disGoodsEntities.get(0);

			//2，保存disId商品
			Integer nxDgDfgGoodsFatherId = disGoodsEntity.getNxDgDfgGoodsFatherId();
			cgnGoods.setNxDgDfgGoodsFatherId(nxDgDfgGoodsFatherId);
			dgService.save(cgnGoods);

//			//3，保存批发商规格
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
			NxDistributerFatherGoodsEntity dfGoodsEntity = dgfService.queryObject(nxDgDfgGoodsFatherId);
			dfGoodsEntity.setNxDfgGoodsAmount(dfGoodsEntity.getNxDfgGoodsAmount() + 1);
			dgfService.update(dfGoodsEntity);

		} else {
			//如果没有父类Id，
			// 1，判断是否有grandFatherID；

//			Integer nxDgGreatGrandFatherId = cgnGoods.getNxDgNxGreatGrandId();
//			List<NxDistributerGoodsEntity> grandEntities = dgService.queryHasDisGreatGrandGoodsFather(nxDgGreatGrandFatherId);
//			if(grandEntities.size() > 0){
//
//
//
//			}else{
//				NxDistributerFatherGoodsEntity grandGoods = new NxDistributerFatherGoodsEntity();
//
//			}



			///////////
			//1， 添加父类商品的greatGrandFather

			NxDistributerFatherGoodsEntity greatGrand = new NxDistributerFatherGoodsEntity();
			String nxCgGreatGrandFatherName = cgnGoods.getNxDgNxGreatGrandName();
			greatGrand.setNxDfgDistributerId(cgnGoods.getNxDgDistributerId());
			greatGrand.setNxDfgFathersFatherId(0);
			greatGrand.setNxDfgFatherGoodsLevel(0);
			greatGrand.setNxDfgFatherGoodsName(nxCgGreatGrandFatherName);
			dgfService.save(greatGrand);


			NxDistributerFatherGoodsEntity grand = new NxDistributerFatherGoodsEntity();
			String nxCgGrandFatherName = cgnGoods.getNxDgNxGrandName();
			grand.setNxDfgDistributerId(cgnGoods.getNxDgDistributerId());
			grand.setNxDfgFathersFatherId(greatGrand.getNxDistributerFatherGoodsId());
			grand.setNxDfgFatherGoodsLevel(1);
			grand.setNxDfgFatherGoodsName(nxCgGrandFatherName);

			dgfService.save(grand);

			//2，添加父类商品的grandFather


			//3，添加父类商品
			NxDistributerFatherGoodsEntity dgf = new NxDistributerFatherGoodsEntity();
			dgf.setNxDfgDistributerId(cgnGoods.getNxDgDistributerId());
			dgf.setNxDfgFathersFatherId(grand.getNxDistributerFatherGoodsId());
			dgf.setNxDfgFatherGoodsName(cgnGoods.getNxDgNxFatherName());
			dgf.setNxDfgFatherGoodsLevel(2);
//			dgf.setNxDfgFatherGoodsImg(cgnGoods.getNxDgGrandFatherImg());


			dgf.setNxDfgGoodsAmount(1);
			// #20afb8  #1ebaee  #3cc36e  #f5c832  #f09628  #f05a32 #20afb8 #969696

			if(cgnGoods.getNxDgNxGreatGrandId().equals(1)){
				dgf.setNxDfgFatherGoodsColor("#20afb8");
			}else if(cgnGoods.getNxDgNxGreatGrandId().equals(2)){
				dgf.setNxDfgFatherGoodsColor("#1ebaee");
			}else if(cgnGoods.getNxDgNxGreatGrandId().equals(3)){
				dgf.setNxDfgFatherGoodsColor("#3cc36e");
			}else if(cgnGoods.getNxDgNxGreatGrandId().equals(4)){
				dgf.setNxDfgFatherGoodsColor("#f5c832");
			}else if(cgnGoods.getNxDgNxGreatGrandId().equals(5)){
				dgf.setNxDfgFatherGoodsColor("#f09628");
			}else if(cgnGoods.getNxDgNxGreatGrandId().equals(6)){
				dgf.setNxDfgFatherGoodsColor("#f05a32");
			}else if(cgnGoods.getNxDgNxGreatGrandId().equals(7)){
				dgf.setNxDfgFatherGoodsColor("#20afb8");
			}else if(cgnGoods.getNxDgNxGreatGrandId().equals(8)){
				dgf.setNxDfgFatherGoodsColor("#969696");
			}

			dgfService.save(dgf);

			Integer distributerFatherGoodsId = dgf.getNxDistributerFatherGoodsId();
			cgnGoods.setNxDgDfgGoodsFatherId(distributerFatherGoodsId);
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
	@RequestMapping("/disSaveDisGoods")
	public R disSaveDisGoods(@RequestBody NxDistributerGoodsEntity nxDistributerGoods){
		dgService.save(nxDistributerGoods);
		Integer distributerGoodsId = nxDistributerGoods.getNxDistributerGoodsId();
		List<NxDistributerStandardEntity> distributerStandardEntities = nxDistributerGoods.getDistributerStandardEntities();
		for (NxDistributerStandardEntity standard : distributerStandardEntities) {
			standard.setNxDsDisGoodsId(distributerGoodsId);
			dsService.save(standard);
		}


		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
//	@RequiresPermissions("nxdistributergoods:update")
	public R update(@RequestBody NxDistributerGoodsEntity nxDistributerGoods){
		System.out.println("updateelellel");
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
