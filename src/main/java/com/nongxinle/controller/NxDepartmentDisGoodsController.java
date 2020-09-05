package com.nongxinle.controller;

/**
 * @author lpy
 * @date 07-30 23:58
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
@RequestMapping("api/nxdepartmentdisgoods")
public class NxDepartmentDisGoodsController {
    @Autowired
    private NxDepartmentDisGoodsService nxDepartmentDisGoodsService;

    @Autowired
    private NxDistributerGoodsService nxDistributerGoodsService;
    @Autowired
    private NxDepartmentStandardService nxDepartmentStandardService;
    @Autowired
    private NxDistributerStandardService nxDistributerStandardService;

    @Autowired
    private NxDistributerDepartmentService nxDisDepartmentService;




    /**
     * PURCHASE,ORDER
     * 订货群获取自己群商品类别
     * @param depId 订货群id
     * @return 订货群商品类别列表
     */
    @RequestMapping(value = "/depGetDepDisGoodsCata/{depId}")
    @ResponseBody
    public R depGetDepDisGoodsCata(@PathVariable Integer depId) {
        List<NxDistributerFatherGoodsEntity> disGoodsEntities = nxDepartmentDisGoodsService.depGetDepDisGoodsCata(depId);
        return R.ok().put("data", disGoodsEntities);
    }

    /**
     *
     * @param limit 每页商品数量
     * @param page 第几页
     * @param fatherId 商品父级id
     * @param depFatherId 订货群id
     * @param disId 批发商id
     * @return 批发商商品包含是否订货群下载
     */
    @RequestMapping(value = "/depGetDisGoods", method = RequestMethod.POST)
    @ResponseBody
    public R depGetDisGoods(Integer limit, Integer page, Integer fatherId, Integer depFatherId, Integer disId) {
        System.out.println("dkfaklfad");
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        map.put("fatherId", fatherId);
        map.put("disId", disId);

        List<NxDistributerGoodsEntity> disGoods = nxDistributerGoodsService.queryDisGoodsByParams(map);

        List<NxDistributerGoodsEntity> goodsEntities = new ArrayList<>();
        for (NxDistributerGoodsEntity goods : disGoods) {
            //查询部门商品是否添加了配送商商品
            Map<String, Object> map1 = new HashMap<>();
            map1.put("depFatherId", depFatherId);
            map1.put("disGoodsId", goods.getNxDistributerGoodsId());
            List<NxDepartmentDisGoodsEntity> ddgGoods = nxDepartmentDisGoodsService.queryAddDisDepGoods(map1);
            System.out.println(ddgGoods.size() + "siziziziiziziziz" );
            if (ddgGoods.size() > 0) {
                goods.setIsDownload(1);
                goodsEntities.add(goods);
            } else {
                goods.setIsDownload(0);
                goodsEntities.add(goods);
            }
        }
        Map<String, Object> map3 = new HashMap<>();
        map3.put("disId", disId );
        map3.put("fatherId", fatherId );

		int total = nxDistributerGoodsService.queryDisGoodsTotal(map3);
        PageUtils pageUtil = new PageUtils(goodsEntities, total, limit, page);
        return R.ok().put("page", pageUtil);
    }


    /**
     * PURCHASE
     * 保存群商品
     * @param nxDepartmentDisGoods 群商品
     * @return ok
     */
    @ResponseBody
    @RequestMapping("/saveDepDisGoods")
    public R saveDepDisGoods(@RequestBody NxDepartmentDisGoodsEntity nxDepartmentDisGoods) {

        nxDepartmentDisGoodsService.save(nxDepartmentDisGoods);

        Integer nxDepDisGoodsId = nxDepartmentDisGoods.getNxDepartmentDisGoodsId();
		List<NxDepartmentStandardEntity> nxDepStandardEntities = nxDepartmentDisGoods.getNxDepStandardEntities();
		if(nxDepStandardEntities.size() > 0){
			for (NxDepartmentStandardEntity standard : nxDepStandardEntities) {
				standard.setNxDdsDdsGoodsId(nxDepDisGoodsId);
				nxDepartmentStandardService.save(standard);
			}
		}
        return R.ok().put("data", nxDepartmentDisGoods.getNxDepartmentDisGoodsId());
    }

    /**
     * PURCHASE,
     * 订货群保存群商品
     * @param depDisGoods 批发商商品id
     * @return ok
     */
    @RequestMapping(value = "/disSaveDepartDisGoods", method = RequestMethod.POST)
    @ResponseBody
    public R disSaveDepartDisGoods (@RequestBody NxDepartmentDisGoodsEntity depDisGoods  ) {
        Integer nxDdgDisGoodsId = depDisGoods.getNxDdgDisGoodsId();
        NxDistributerGoodsEntity nxDisGoodsEntity = nxDistributerGoodsService.queryObject(nxDdgDisGoodsId);
        depDisGoods.setNxDdgDepGoodsName(nxDisGoodsEntity.getNxDgGoodsName());
        depDisGoods.setNxDdgDepGoodsDetail(nxDisGoodsEntity.getNxDgGoodsDetail());
        depDisGoods.setNxDdgDepGoodsBrand(nxDisGoodsEntity.getNxDgGoodsBrand());
        depDisGoods.setNxDdgDepGoodsPinyin(nxDisGoodsEntity.getNxDgGoodsPinyin());
        depDisGoods.setNxDdgDepGoodsPy(nxDisGoodsEntity.getNxDgGoodsPy());
        depDisGoods.setNxDdgDisGoodsFatherId(nxDisGoodsEntity.getNxDgDfgGoodsFatherId());

        nxDepartmentDisGoodsService.save(depDisGoods);

        Integer nxDepartmentDisGoodsId = depDisGoods.getNxDepartmentDisGoodsId();
        //批发商订货规格
        List<NxDistributerStandardEntity>  standardEntities = nxDistributerStandardService.queryDisStandardByDisGoodsId(depDisGoods.getNxDdgDisGoodsId());
        if(standardEntities.size() > 0){
            for (NxDistributerStandardEntity disEntities : standardEntities) {
                NxDepartmentStandardEntity depstandard = new NxDepartmentStandardEntity();
                depstandard.setNxDdsStandardName(disEntities.getNxDsStandardName());
                depstandard.setNxDdsDdsGoodsId(nxDepartmentDisGoodsId);
                nxDepartmentStandardService.save(depstandard);
            }
        }
        return R.ok();
    }

    /**
     * PURCHASE,
     * @param limit 每页显示商品数
     * @param page 第几页
     * @param depId 群id
     * @param fatherId 批发商商品父级id
     * @return 群商品列表
     */
    @RequestMapping(value = "/depGetDepGoods", method = RequestMethod.POST)
    @ResponseBody
    public R depGetDepGoods(Integer limit, Integer page,Integer depId, Integer fatherId) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        map.put("depId", depId);
        map.put("fatherId", fatherId);
        List<NxDepartmentDisGoodsEntity> goodsEntities = nxDepartmentDisGoodsService.queryDepGoodsByFatherId(map);

        for (NxDepartmentDisGoodsEntity disGoods : goodsEntities) {
            Integer nxDepartmentDisGoodsId = disGoods.getNxDepartmentDisGoodsId();
            List<NxDepartmentStandardEntity> standardEntities = nxDepartmentStandardService.queryDepGoodsStandards(nxDepartmentDisGoodsId);
            disGoods.setNxDepStandardEntities(standardEntities);
        }

        Map<String, Object> map3 = new HashMap<>();
        map3.put("depFatherId", depId);
        map3.put("fatherId", fatherId );
        int total = nxDepartmentDisGoodsService.queryDepGoodsTotal(map3);
        PageUtils pageUtil = new PageUtils(goodsEntities, total, limit, page);
        return R.ok().put("page", pageUtil);
    }






    ///////88888888

    //todo
    @RequestMapping(value = "/depGetResGoodsDetail/{depDisGoodsId}")
    @ResponseBody
    public R depGetResGoodsDetail(@PathVariable Integer depDisGoodsId) {
        System.out.println(depDisGoodsId);
        List<NxGoodsEntity> goodsEntitie = nxDepartmentDisGoodsService.queryResGoodsDetail(depDisGoodsId);
        return R.ok().put("data", goodsEntitie);
    }

    @RequestMapping(value = "/getUnDisGoodsDepartments", method = RequestMethod.POST)
    @ResponseBody
    public R getUnDisGoodsDepartments(Integer disGoodsId, Integer disId) {
        List<NxDepartmentEntity> addGoodsCustomer = nxDepartmentDisGoodsService.queryDepartmentsByDisGoodsId(disGoodsId);
        List<NxDepartmentEntity> allCustomer = nxDisDepartmentService.queryAllDisDepartments(disId);

        allCustomer.removeAll(addGoodsCustomer);
        return R.ok().put("data", allCustomer);
    }








}
