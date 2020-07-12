package com.nongxinle.controller;

/**
 * @author lpy
 * @date 2020-02-10 19:43:11
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nongxinle.entity.*;
import com.nongxinle.service.NxCommunityFatherGoodsService;
import com.nongxinle.service.NxCommunityStandardService;
import com.nongxinle.service.NxCommunityOrdersSubService;
import com.nongxinle.utils.UploadFile;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.service.NxCommunityGoodsService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;


@RestController
@RequestMapping("api/nxcommunitygoods")
public class NxCommunityGoodsController {
    @Autowired
    private NxCommunityGoodsService cgService;

    @Autowired
    private NxCommunityStandardService dsService;

    @Autowired
    NxCommunityFatherGoodsService dfgService;

    @Autowired
    private NxCommunityGoodsService communityGoodsService;

    @Autowired
    NxCommunityOrdersSubService nxCommunityOrdersSubService;

     @RequestMapping(value = "/queryGoodsWithPinyin", method = RequestMethod.POST)
      @ResponseBody
      public R queryGoodsWithPinyin (@RequestBody NxCommunityGoodsEntity goodsEntity) {
         System.out.println("haiiahfiai");
         System.out.println(goodsEntity);
         System.out.println(goodsEntity.getNxCgGoodsPinyin());
         Integer nxCgCommunityId = goodsEntity.getNxCgCommunityId();
         Map<String, Object> map = new HashMap<>();
         map.put("nxCgCommunityId", nxCgCommunityId);
         map.put("pinyin", goodsEntity.getNxCgGoodsPinyin());
         List<NxCommunityGoodsEntity> entities = communityGoodsService.queryCommunityGoodsWithPinyin(map);
        return R.ok().put("data", entities);
      }








     @RequestMapping(value = "/getStockGoods", method = RequestMethod.POST)
      @ResponseBody
      public R getStockGoods (Integer limit, Integer page, Integer nxCommunityId) {
         Map<String, Object> map = new HashMap<>();
         map.put("offset", (page - 1) * limit);
         map.put("limit", limit);
         map.put("nxCommunityId", nxCommunityId);
         List<NxCommunityGoodsEntity> entities = communityGoodsService.queryStockGoods(map);

         int total = cgService.queryTotalByFatherId(map);

         PageUtils pageUtil = new PageUtils(entities, total, limit, page);
         return R.ok().put("page",pageUtil);
      }





     @RequestMapping(value = "/getSupplierGoods", method = RequestMethod.POST)
      @ResponseBody
      public R getSupplierGoods (Integer limit, Integer page, Integer nxSupplierId ) {
         System.out.println("daole zheli");
         Map<String, Object> map = new HashMap<>();
         map.put("offset", (page - 1) * limit);
         map.put("limit", limit);
         map.put("nxSupplierId", nxSupplierId);
         List<NxCommunityGoodsEntity> entities = communityGoodsService.querySupplierGoods(map);

         int total = cgService.queryTotalByFatherId(map);

         PageUtils pageUtil = new PageUtils(entities, total, limit, page);
        return R.ok().put("page", pageUtil);
      }






    @RequestMapping(value = "/getCommunityGoodsDetail/{communityGoodsId}")
    @ResponseBody
    public R cust(@PathVariable Integer communityGoodsId ) {
        System.out.println(communityGoodsId);
        NxCommunityGoodsEntity communityGoodsEntity = communityGoodsService.queryObject(communityGoodsId);
        return R.ok().put("data", communityGoodsEntity);

    }




//    @RequestMapping(value = "/getPurchaserGoods", method = RequestMethod.POST)
//    @ResponseBody
//    public R getPurchaserGoods (Integer purchaserUserId, Integer status) {
//        Map<String, Object> map = new HashMap<>();
//        map.put("purchaserUserId", purchaserUserId);
//        map.put("status", status);
//        List<NxCommunityGoodsEntity> distributerGoodsEntities  = cgService.queryPurchaseGoods(map);
//
//        return R.ok().put("data", distributerGoodsEntities);
//    }


     @RequestMapping(value = "/purchaseDisGoods", method = RequestMethod.POST)
      @ResponseBody
      public R purchaseDisGoods (Integer purchaseUserId, String disGoodsEntities ) {

         System.out.println("enenne" + disGoodsEntities);

         JSONArray jsonArray = JSONArray.fromObject(disGoodsEntities);
         for (Object obj : jsonArray) {
             JSONObject jsonObject2 = JSONObject.fromObject(obj);
             NxCommunityGoodsEntity distributerGoodsEntity = (NxCommunityGoodsEntity) JSONObject.toBean(jsonObject2, NxCommunityGoodsEntity.class);

             distributerGoodsEntity.setNxCgBuyStatus(2);
             distributerGoodsEntity.setNxCgBuyPurchaseUserId(purchaseUserId);
             communityGoodsService.update(distributerGoodsEntity);

             JSONArray jsonArray1 = JSONArray.fromObject(distributerGoodsEntity.getNxOrdersSubEntities());
             for (Object obj1 :
                     jsonArray1) {
                 JSONObject jsonObject = JSONObject.fromObject(obj1);
                 NxCommunityOrdersSubEntity subEntity = (NxCommunityOrdersSubEntity) JSONObject.toBean(jsonObject, NxCommunityOrdersSubEntity.class);
                 System.out.println("kkkkk" + subEntity);
                 subEntity.setNxCosBuyStatus(2);
                 subEntity.setNxCosPurchaseUserId(purchaseUserId);
                 nxCommunityOrdersSubService.update(subEntity);
             }
         }
         return R.ok();
      }










//
//    @RequestMapping(value = "/getGoodInfoByDistribuerId", method = RequestMethod.POST)
//    @ResponseBody
//    public R getStandardByDistribuerId (Integer goodsId, Integer disId) {
//        System.out.println("getGoodsInfoaaa");
//        Map<String, Object> map = new HashMap<>();
//        map.put("disId", disId);
//        map.put("goodsId", goodsId);
//        NxCommunityGoodsEntity disGoodsEntity = dgService.queryGoods(map);
//        return R.ok().put("data", disGoodsEntity);
//    }


    //todo
     @RequestMapping(value = "/updateDgGoods", method = RequestMethod.POST)
      @ResponseBody
      public R updateDgGoods (@RequestBody NxCommunityGoodsEntity dgGoods) {
         Integer dgDistributeId = dgGoods.getNxCgDistributeId();
//         dsService.deleteByDisId(dgDistributeId);


         List<NxStandardEntity> dgStandardList = dgGoods.getDgStandardList();

         for (NxStandardEntity standard : dgStandardList) {
             NxCommunityStandardEntity entity = new NxCommunityStandardEntity();
             entity.setNxCsCommGoodsId(dgGoods.getNxCommunityGoodsId());
             dsService.save(entity);
         }

         cgService.update(dgGoods);

         return R.ok();
      }

       @RequestMapping(value = "/updateSupplierGoods", method = RequestMethod.POST)
        @ResponseBody
        public R updateSupplierGoods (@RequestParam("file") MultipartFile file,
                                   @RequestParam("nxCommunityGoodsId") Integer nxCommunityGoodsId,
                                   @RequestParam("nxCgBuyingPrice") String nxCgBuyingPrice,
                                   HttpSession session) {
           //1,上传图片
           String newUploadName = "uploadImage";
           String realPath = UploadFile.upload(session, newUploadName, file);

           String filename = file.getOriginalFilename();
           String filePath = newUploadName + "/" + filename;



           NxCommunityGoodsEntity communityGoodsEntity = communityGoodsService.queryObject(nxCommunityGoodsId);

           communityGoodsEntity.setNxCgBuyingPrice(nxCgBuyingPrice);
           communityGoodsEntity.setNxCgNxGoodsFilePath(filePath);

           communityGoodsService.update(communityGoodsEntity);


          return R.ok();
        }






    @RequestMapping(value = "/getCommunityGoods", method = RequestMethod.POST)
    @ResponseBody
    public R getCommunityGoods(Integer limit, Integer page, Integer nxCommunityFatherGoodsId) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        map.put("nxCommunityFatherGoodsId", nxCommunityFatherGoodsId);

        //查询列表数据
        List<NxCommunityGoodsEntity> dgGoodsLit = cgService.queryCommunityGoods(map);

        int total = cgService.queryTotalByFatherId(map);

        PageUtils pageUtil = new PageUtils(dgGoodsLit, total, limit, page);
        return R.ok().put("page", pageUtil);
    }


    //todo
    /**
     * 商户添加自己的商品
     * @param cgGoods shangpin
     * @return
     */
    @RequestMapping(value = "/postDgGoods", method = RequestMethod.POST)
    @ResponseBody
    public R postDgGoods(@RequestBody NxCommunityGoodsEntity cgGoods) {

        //获取nxGoods的父类id，查询社区父类是否有此父类商品
        Integer dgGoodsFatherId = cgGoods.getNxCgNxGoodsFatherId();
        Integer nxCgCommunityId = cgGoods.getNxCgCommunityId();
        Map<String, Object> map = new HashMap<>();
        map.put("communityId", nxCgCommunityId);
        map.put("nxFatherId", dgGoodsFatherId);
        List<NxCommunityGoodsEntity> communityGoodsEntities =  cgService.queryHasNxGoodsFather(map);

        //如果已经有父类商品
        if (communityGoodsEntities.size() > 0) {
            //1，给父类商品的字段商品数量加1
            NxCommunityGoodsEntity communityGoodsEntity = communityGoodsEntities.get(0);

            //2，保存社区商品
            cgGoods.setNxCgCfGoodsFatherId(communityGoodsEntity.getNxCgCfGoodsFatherId());
            cgGoods.setNxCgGoodsStatus(0);
            cgGoods.setNxCgGoodsTotalHits(0);
            cgService.save(cgGoods);

            //3，保存社区商品的规格
            Integer nxCgGoodsId = cgGoods.getNxCommunityGoodsId();
            List<NxCommunityStandardEntity> ncsEntities = cgGoods.getNxCommunityStandardEntities();
            for (NxCommunityStandardEntity standard : ncsEntities) {
                standard.setNxCsCommGoodsId(nxCgGoodsId);
                dsService.save(standard);
            }

        } else {
            //如果没有社区父类商品，
            //1， 添加父类商品的greatGrandFather

            NxCommunityFatherGoodsEntity greatGrand = new NxCommunityFatherGoodsEntity();
            String nxCgGreatGrandFatherName = cgGoods.getNxCgGreatGrandFatherName();
            greatGrand.setNxCfgCommunityId(cgGoods.getNxCgCommunityId());
            greatGrand.setNxFathersFatherId(0);
            greatGrand.setNxFatherGoodsLevel(0);
            greatGrand.setNxFatherGoodsName(nxCgGreatGrandFatherName);
            dfgService.save(greatGrand);


            NxCommunityFatherGoodsEntity grand = new NxCommunityFatherGoodsEntity();
            String nxCgGrandFatherName = cgGoods.getNxCgGrandFatherName();
            grand.setNxCfgCommunityId(cgGoods.getNxCgCommunityId());
            grand.setNxFathersFatherId(greatGrand.getNxCommunityFatherGoodsId());
            grand.setNxFatherGoodsLevel(1);
            grand.setNxFatherGoodsName(nxCgGrandFatherName);

            dfgService.save(grand);

            //2，添加父类商品的grandFather


            //3，添加父类商品
            NxCommunityFatherGoodsEntity dgf = new NxCommunityFatherGoodsEntity();
            dgf.setNxCfgCommunityId(cgGoods.getNxCgCommunityId());
            dgf.setNxFathersFatherId(grand.getNxCommunityFatherGoodsId());
            dgf.setNxFatherGoodsName(cgGoods.getNxCgNxGoodsFatherName());
            dgf.setNxFatherGoodsLevel(2);
            dgf.setNxFatherGoodsImg(cgGoods.getNxCgNxGoodsFatherImg());


            dgf.setNxCfgGoodsAmount(1);
            // #20afb8  #1ebaee  #3cc36e  #f5c832  #f09628  #f05a32 #20afb8 #969696

            if(cgGoods.getNxCgGreatGrandFatherId().equals(1)){
                dgf.setNxFatherGoodsColor("#20afb8");
            }else if(cgGoods.getNxCgGreatGrandFatherId().equals(2)){
                dgf.setNxFatherGoodsColor("#1ebaee");
            }else if(cgGoods.getNxCgGreatGrandFatherId().equals(3)){
                dgf.setNxFatherGoodsColor("#3cc36e");
            }else if(cgGoods.getNxCgGreatGrandFatherId().equals(4)){
                dgf.setNxFatherGoodsColor("#f5c832");
            }else if(cgGoods.getNxCgGreatGrandFatherId().equals(5)){
                dgf.setNxFatherGoodsColor("#f09628");
            }else if(cgGoods.getNxCgGreatGrandFatherId().equals(6)){
                dgf.setNxFatherGoodsColor("#f05a32");
            }else if(cgGoods.getNxCgGreatGrandFatherId().equals(7)){
                dgf.setNxFatherGoodsColor("#20afb8");
            }else if(cgGoods.getNxCgGreatGrandFatherId().equals(8)){
                dgf.setNxFatherGoodsColor("#969696");
            }

            dfgService.save(dgf);

            Integer nxCommunityFatherGoodsId = dgf.getNxCommunityFatherGoodsId();
            cgGoods.setNxCgCfGoodsFatherId(nxCommunityFatherGoodsId);
            cgGoods.setNxCgGoodsStatus(0);
            cgGoods.setNxCgGoodsTotalHits(0);
            cgService.save(cgGoods);
            Integer nxCgGoodsId = cgGoods.getNxCommunityGoodsId();


            List<NxCommunityStandardEntity> ncsEntities = cgGoods.getNxCommunityStandardEntities();
            for (NxCommunityStandardEntity standard : ncsEntities) {
                standard.setNxCsCommGoodsId(nxCgGoodsId);
                dsService.save(standard);
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
    public R list(Integer page, Integer limit) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        //查询列表数据
        List<NxCommunityGoodsEntity> nxDistributerGoodsList = cgService.queryList(map);
        int total = cgService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(nxDistributerGoodsList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{cgGoodsId}")
//    @RequiresPermissions("nxdistributergoods:info")
    public R info(@PathVariable("cgGoodsId") Integer cgGoodsId) {
        NxCommunityGoodsEntity communityGoodsEntity = cgService.queryObject(cgGoodsId);

        return R.ok().put("data", communityGoodsEntity);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("nxdistributergoods:save")
    public R save(@RequestBody NxCommunityGoodsEntity nxDistributerGoods) {
        cgService.save(nxDistributerGoods);

        return R.ok();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("nxdistributergoods:update")
    public R update(@RequestBody NxCommunityGoodsEntity nxDistributerGoods) {
        cgService.update(nxDistributerGoods);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("nxdistributergoods:delete")
    public R delete(@RequestBody Integer[] disGoodsIds) {
        cgService.deleteBatch(disGoodsIds);

        return R.ok();
    }

}
