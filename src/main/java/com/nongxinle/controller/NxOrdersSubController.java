package com.nongxinle.controller;

/**
 * @author lpy
 * @date 2020-03-22 18:07:28
 */

import java.util.*;

import com.nongxinle.entity.*;
import com.nongxinle.service.NxGoodsService;
import com.nongxinle.service.NxOrderTemplateItemService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.service.NxOrdersSubService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;


@RestController
@RequestMapping("api/nxorderssub")
public class NxOrdersSubController {
    @Autowired
    private NxOrdersSubService nxOrdersSubService;

    @Autowired
    private NxGoodsService nxGoodsService;

    @Autowired
    private NxOrderTemplateItemService nxOrderTemplateItemService;


    @RequestMapping(value = "/getOutGoodsOfGoodsType", method = RequestMethod.POST)
    @ResponseBody
    public R getOutGoodsOfGoodsType (@RequestParam Integer page, @RequestParam Integer limit,
                                     @RequestParam Integer goodsType, @RequestParam Integer nxSupplierId) {

        System.out.println(goodsType);
        Map<String, Object> map = new HashMap<>();

        map.put("nxOsGoodsType", goodsType);
        map.put("nxOsSubSupplierId", nxSupplierId);
        map.put("nxOsStatus", 0);
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        List<NxOrdersEntity> ordersEntityList = nxOrdersSubService.queryOutGoodsByType(map);
        int total = nxOrdersSubService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(ordersEntityList, total, limit, page);


        return R.ok().put("page", pageUtil);
    }




    @RequestMapping(value = "cust/customerGetSubOrders", method = RequestMethod.POST)
    @ResponseBody
    public R customerGetSubOrders(Integer nxOrdersUserId, Integer nxOtOrderTemplateId) {
        Map<String, Object> map = new HashMap<>();
//        map.put("offset", (page - 1) * limit);
//        map.put("limit", limit);
        map.put("nxOrdersUserId", nxOrdersUserId);
        List<NxOrdersSubEntity> subEntities = nxOrdersSubService.querySubOrdersByCustomerUserId(map);

        //查询订单中的批发商商品
        TreeSet<NxOrdersSubEntity> treeSet = new TreeSet<>();
        for (NxOrdersSubEntity subEntity : subEntities) {
            treeSet.add(subEntity);
        }

        //查询订单模版中的商品
        Map<String, Object> map1 = new HashMap<>();
        map1.put("nxOtOrderTemplateId", nxOtOrderTemplateId);
        List<NxOrderTemplateItemEntity> itemEntities = nxOrderTemplateItemService.queryUserItem(map1);

        //给已经添加的模版商品加标记
        TreeSet<NxOrdersSubEntity> nxOrdersSubEntities = new TreeSet<>();
        for (NxOrdersSubEntity sub : treeSet) {
            sub.setHasItem(false);
            for (NxOrderTemplateItemEntity item : itemEntities) {
                if (sub.getNxOsCommunityGoodsId().equals(item.getNxOtDisGoodsId())) {
                    sub.setHasItem(true);
                    nxOrdersSubEntities.add(sub);
                } else {
                    nxOrdersSubEntities.add(sub);
                }
            }
        }
        //筛选不是模版商品的订单数据
        List<NxOrdersSubEntity> data = new ArrayList<>();
        for (NxOrdersSubEntity subEntity : nxOrdersSubEntities) {
            if (!subEntity.getHasItem()) {
                data.add(subEntity);
            }
        }
        return R.ok().put("data", data);
    }


    @RequestMapping(value = "/getToPurchaseGoods", method = RequestMethod.POST)
    @ResponseBody
    public R getToPurchaseGoods(Integer disId, Integer status) {

        Map<String, Object> map = new HashMap<>();
        map.put("disId", disId);
        map.put("status", status);
        List<NxOrdersSubEntity> subEntities = nxOrdersSubService.queryToPurchaseGoods(map);

        List<Map<String, Object>> resultData = new ArrayList<>();

        if (subEntities.size() > 0) {
            TreeSet<NxGoodsEntity> fatherGoodsList = new TreeSet<>();
            //获取父级商品
            for (NxOrdersSubEntity subEntity : subEntities) {
                Integer nxOsGoodsFatherId = subEntity.getNxOsGoodsFatherId();
                NxGoodsEntity fatherGoods = nxGoodsService.queryObject(nxOsGoodsFatherId);
                fatherGoodsList.add(fatherGoods);
            }


            // 一，父级商品子商品组装
            for (NxGoodsEntity fatherGoods : fatherGoodsList) {
                // 父级商品和子商品和子订单
                Map<String, Object> mapFather = new HashMap<>();
                mapFather.put("fatherName", fatherGoods.getNxGoodsName());
                mapFather.put("show", false);
                List<Map<String, Object>> goodsList = new ArrayList<>();
                TreeSet<NxCommunityGoodsEntity> disGoodsEntityTreeSet = new TreeSet<>();

                System.out.println(subEntities.size() + "sisisizeezeee");

                // 二，获取配送商商品列表
                for (NxOrdersSubEntity subEntity : subEntities) {

                    System.out.println("kankan:" + subEntity.getNxCommunityGoodsEntity());
                    System.out.println("father" + fatherGoods.getNxGoodsId());
                    System.out.println("subFather" + subEntity.getNxOsGoodsFatherId());
                    // 组装子商品和子订单
                    if (fatherGoods.getNxGoodsId().equals(subEntity.getNxOsGoodsFatherId())) {
                        disGoodsEntityTreeSet.add(subEntity.getNxCommunityGoodsEntity());
                    }
                }

                System.out.println("trees:" + disGoodsEntityTreeSet);

                // 组装商品的子订单
                for (NxCommunityGoodsEntity disGoods : disGoodsEntityTreeSet) {
                    System.out.println("disGoodsdisGoods" + disGoods);
                    Map<String, Object> mapSub = new HashMap<>();

                    mapSub.put("goodsName", disGoods.getNxGoodsEntity().getNxGoodsName());
                    mapSub.put("standardName", disGoods.getNxGoodsEntity().getNxGoodsStandardname());
                    mapSub.put("purchase", disGoods.getNxCgPurchaseQuantity());
                    mapSub.put("disGoodsId", disGoods.getNxCommunityGoodsId());
                    mapSub.put("show", true);
                    Map<String, Object> subMap = new HashMap<>();
                    subMap.put("disGoodsId", disGoods.getNxCommunityGoodsId());
                    subMap.put("status", status);
                    List<NxOrdersSubEntity> subEntities1 = nxOrdersSubService.querySubsByGoodsId(subMap);
                    mapSub.put("subList", subEntities1);
                    goodsList.add(mapSub);

                }

                mapFather.put("goodsList", goodsList);

                resultData.add(mapFather);

            }

        }

        return R.ok().put("data", resultData);

    }


    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("nxorderssub:list")
    public R list(Integer page, Integer limit) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        //查询列表数据
        List<NxOrdersSubEntity> nxOrdersSubList = nxOrdersSubService.queryList(map);
        int total = nxOrdersSubService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(nxOrdersSubList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{nxOrdersSubId}")
    @RequiresPermissions("nxorderssub:info")
    public R info(@PathVariable("nxOrdersSubId") Integer nxOrdersSubId) {
        NxOrdersSubEntity nxOrdersSub = nxOrdersSubService.queryObject(nxOrdersSubId);

        return R.ok().put("nxOrdersSub", nxOrdersSub);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
//	@RequiresPermissions("nxorderssub:save")
    public R save(@RequestBody NxOrdersSubEntity nxOrdersSub) {
        nxOrdersSubService.save(nxOrdersSub);

        return R.ok();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("nxorderssub:update")
    public R update(@RequestBody NxOrdersSubEntity nxOrdersSub) {
        nxOrdersSubService.update(nxOrdersSub);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("nxorderssub:delete")
    public R delete(@RequestBody Integer[] nxOrdersSubIds) {
        nxOrdersSubService.deleteBatch(nxOrdersSubIds);

        return R.ok();
    }

}