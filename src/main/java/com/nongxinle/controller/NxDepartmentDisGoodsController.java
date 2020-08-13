package com.nongxinle.controller;

/**
 * @author lpy
 * @date 07-30 23:58
 */

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nongxinle.entity.NxDistributerGoodsEntity;
import com.nongxinle.entity.NxDistributerStandardEntity;
import com.nongxinle.entity.NxGoodsEntity;
import com.nongxinle.service.NxDistributerGoodsService;
import com.nongxinle.service.NxDistributerStandardService;
import com.nongxinle.service.NxGoodsService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxDepartmentDisGoodsEntity;
import com.nongxinle.service.NxDepartmentDisGoodsService;
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
    private NxDistributerStandardService nxDisStandardService;


    @RequestMapping(value = "/depGetResGoodsDetail/{depDisGoodsId}")
    @ResponseBody
    public R depGetResGoodsDetail(@PathVariable Integer depDisGoodsId) {
		System.out.println(depDisGoodsId);
		List<NxGoodsEntity> goodsEntitie = nxDepartmentDisGoodsService.queryResGoodsDetail(depDisGoodsId);
        return R.ok().put("data", goodsEntitie);
    }


    @RequestMapping(value = "/depGetResGoods", method = RequestMethod.POST)
    @ResponseBody
    public R depGetResGoods(Integer depId, Integer fatherId) {
        Map<String, Object> map = new HashMap<>();
        map.put("depId", depId);
        map.put("fatherId", fatherId);
        List<NxGoodsEntity> goodsEntities = nxDepartmentDisGoodsService.queryDepGoodsByFatherId(map);

        return R.ok().put("data", goodsEntities);
    }


    @RequestMapping(value = "/depGetDepDisGoodsCata/{depId}")
    @ResponseBody
    public R depGetDepDisGoodsCata(@PathVariable Integer depId) {

        List<NxGoodsEntity> disGoodsEntities = nxDepartmentDisGoodsService.depGetDepDisGoodsCata(depId);

        return R.ok().put("data", disGoodsEntities);
    }


    @RequestMapping(value = "/depGetDisGoods", method = RequestMethod.POST)
    @ResponseBody
    public R depGetDisGoods(Integer limit, Integer page, Integer fatherId, Integer depFatherId) {
        System.out.println("dkfaklfad");
        List<NxGoodsEntity> nxGoodsEntities1 = queryDisGoodsByFatherIdwithLimit(limit, page, fatherId);


        List<NxGoodsEntity> goodsEntities = new ArrayList<>();

        for (NxGoodsEntity goods : nxGoodsEntities1) {
            Map<String, Object> map = new HashMap<>();
//			map.put("depId", depId);
            map.put("depFatherId", depFatherId);
            map.put("disGoodsId", goods.getNxDistributerGoodsEntity().getNxDistributerGoodsId());
            System.out.println(map);
            System.out.println("kankanmap");
            List<NxDepartmentDisGoodsEntity> ddgGoods = nxDepartmentDisGoodsService.queryAddDisDepGoods(map);
            Integer disGoodsId = goods.getNxDistributerGoodsEntity().getNxDistributerGoodsId();
//			List<NxDistributerStandardEntity> standardEntities =  nxDisStandardService.queryDisStandardListByDisGoodId(disGoodsId);
//			goods.setDistributerStandardEntities(standardEntities);

            if (ddgGoods.size() > 0) {
                goods.setIsDownload(1);
                goodsEntities.add(goods);
            } else {
                goods.setIsDownload(0);
                goodsEntities.add(goods);
            }
        }

//		int total = nxDisGoodsService.queryTotalByFatherId(fatherId);
        int total = 100;
        PageUtils pageUtil = new PageUtils(goodsEntities, total, limit, page);
        return R.ok().put("page", pageUtil);
//		return R.ok();
    }

    private List<NxGoodsEntity> queryDisGoodsByFatherIdwithLimit(Integer limit, Integer page, Integer fatherId) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        map.put("fatherId", fatherId);

        System.out.println("haiahfidfi");

        //查询列表数据
        List<NxGoodsEntity> nxGoodsEntities = nxDistributerGoodsService.queryListWithFatherId(map);

        return nxGoodsEntities;
    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("nxdepartmentdisgoods:list")
    public R list(Integer page, Integer limit) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        //查询列表数据
        List<NxDepartmentDisGoodsEntity> nxDepartmentDisGoodsList = nxDepartmentDisGoodsService.queryList(map);
        int total = nxDepartmentDisGoodsService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(nxDepartmentDisGoodsList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{nxDepartmentDisGoodsId}")
    @RequiresPermissions("nxdepartmentdisgoods:info")
    public R info(@PathVariable("nxDepartmentDisGoodsId") Integer nxDepartmentDisGoodsId) {
        NxDepartmentDisGoodsEntity nxDepartmentDisGoods = nxDepartmentDisGoodsService.queryObject(nxDepartmentDisGoodsId);

        return R.ok().put("nxDepartmentDisGoods", nxDepartmentDisGoods);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/saveDepDisGoods")
//	@RequiresPermissions("nxdepartmentdisgoods:save")
    public R save(@RequestBody NxDepartmentDisGoodsEntity nxDepartmentDisGoods) {
        nxDepartmentDisGoodsService.save(nxDepartmentDisGoods);

        return R.ok().put("data", nxDepartmentDisGoods.getNxDepartmentDisGoodsId());
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("nxdepartmentdisgoods:update")
    public R update(@RequestBody NxDepartmentDisGoodsEntity nxDepartmentDisGoods) {
        nxDepartmentDisGoodsService.update(nxDepartmentDisGoods);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("nxdepartmentdisgoods:delete")
    public R delete(@RequestBody Integer[] nxDepartmentDisGoodsIds) {
        nxDepartmentDisGoodsService.deleteBatch(nxDepartmentDisGoodsIds);

        return R.ok();
    }

}
