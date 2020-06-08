package com.nongxinle.controller;

/**
 * @author lpy
 * @date 2020-03-22 18:07:28
 */

import java.util.*;

import com.github.wxpay.sdk.WXPay;
import com.github.wxpay.sdk.WXPayConfig;
import com.github.wxpay.sdk.WXPayUtil;
import com.nongxinle.entity.*;
import com.nongxinle.service.NxDistributerUserService;
import com.nongxinle.service.NxRouteService;
import com.nongxinle.service.NxWxOrdersService;
import com.nongxinle.utils.*;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import netscape.javascript.JSObject;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.service.NxOrdersService;

import javax.servlet.http.HttpServletRequest;

import static com.nongxinle.utils.DateUtils.formatWhatDay;
import static com.nongxinle.utils.DateUtils.formatWhatDayTime;


@RestController
@RequestMapping("api/nxorders")
public class NxOrdersController {
    @Autowired
    private NxOrdersService nxOrdersService;

    @Autowired
    private NxRouteService nxRouteService;

    @Autowired
    private NxDistributerUserService nxDistributerUserService;

    @Autowired
    private NxWxOrdersService nxWxOrdersService;









    /**
     * 删除订单
     * @param nxOrdersId 订单id
     * @return o
     */
    @RequestMapping(value = "/deleteOrder/{nxOrdersId}")
    @ResponseBody
    public R deleteOrder(@PathVariable Integer nxOrdersId) {
        nxOrdersService.delete(nxOrdersId);


        return R.ok();
    }


    @RequestMapping(value = "cust/customerGetOrders", method = RequestMethod.POST)
    @ResponseBody
    public R customerGetOrders(Integer nxOrdersUserId, Integer page, Integer limit) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        map.put("nxOrdersUserId", nxOrdersUserId);
        List<NxOrdersEntity> ordersEntityList = nxOrdersService.queryCustomerOrder(map);
        int total = nxOrdersService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(ordersEntityList, total, limit, page);

        return R.ok().put("page", pageUtil);

    }


    /**
     * 以下是订单接口
     */


    @RequestMapping(value = "/getIsDeliveryOrders/{deliveryUserId}")
    @ResponseBody
    public R getIsDeliveryOrders(@PathVariable Integer deliveryUserId) {
        Map<String, Object> map = new HashMap<>();
        map.put("deliveryUserId", deliveryUserId);
        map.put("status", 4);
        List<NxOrdersEntity> ordersEntityList = nxOrdersService.queryDeliveryOrder(map);

        return R.ok().put("data", ordersEntityList);
    }


    /**
     * 支付与配送接口
     *
     * @param disId       批发商id
     * @param orderStatus 支付状态 0 未支付，1 请求支付
     * @return 支付订单列表
     */
    @RequestMapping(value = "/getPaymentAndDeliveryOrder", method = RequestMethod.POST)
    @ResponseBody
    public R getPaymentAndDeliveryOrder(Integer disId, Integer orderStatus, Integer paymentStatus) {
        System.out.println("pppppp:::::" + paymentStatus);

        int noCare = -1;
        int Zero = 0;
        int One = 1;
        int Two = 2;
        int Three = 3;
        int Four = 4;


        Map<String, Object> map = new HashMap<>();
        map.put("disId", disId);
        map.put("orderStatus", orderStatus);

        map.put("paymentStatus", paymentStatus);
        List<NxOrdersEntity> entities = nxOrdersService.queryOrdersPaymentInformation(map);

        //未付款订单
        if (orderStatus.equals(Two) && paymentStatus.equals(Zero)) {

            return R.ok().put("data", entities);
        }
        //付款中订单
        if (orderStatus.equals(Three) && paymentStatus.equals(One)) {

            return R.ok().put("data", entities);
        }
        // 未配送订单
        if (orderStatus.equals(Three) && paymentStatus.equals(noCare)) {
            Map<String, Object> map2 = new HashMap<>();
            map2.put("disId", disId);
            map2.put("orderStatus", orderStatus);
            map2.put("paymentStatus", null);
            List<NxOrdersEntity> entities2 = nxOrdersService.queryOrdersPaymentInformation(map2);

            //带路线的订单列表
            List<Map<String, Object>> list = new ArrayList<>();


            //路线列表
            List<NxRouteEntity> routeEntities = nxRouteService.queryRoute();

            for (NxRouteEntity route : routeEntities) {
                //一个路线的订单map
                Map<String, Object> map1 = new HashMap<>();
                //新路线订单列表
                List<NxOrdersEntity> entityList = new ArrayList<>();

                String nxRouteName = route.getNxRouteName();
                map1.put("route", nxRouteName);
                for (NxOrdersEntity order : entities2) {
                    System.out.println("orderkkkkccc" + order.getNxCustomerEntity().getNxCommunityEntity());

                    if (order.getNxCustomerEntity().getNxCommunityEntity().getNxCommunityRouteId().equals(route.getNxRouteId())) {
                        entityList.add(order);
                    }
                }
                map1.put("arr", entityList);
                if (entityList.size() > 0) {
                    list.add(map1);
                }
            }

            return R.ok().put("data", list);
        }
        // 配送中订单
        if (orderStatus.equals(Four) && paymentStatus.equals(noCare)) {

            map.put("paymentStatus", null);
            List<NxOrdersEntity> entities3 = nxOrdersService.queryOrdersPaymentInformation(map);

            Set<NxDistributerUserEntity> userEntitySet = new TreeSet<>();

            for (NxOrdersEntity order : entities3) {
                Integer nxOrdersDeliveryUserId = order.getNxOrdersDeliveryUserId();
                System.out.println(order);
                System.out.println("ididiid::::" + nxOrdersDeliveryUserId);
                NxDistributerUserEntity nxDistributerUserEntity = nxDistributerUserService.queryObject(nxOrdersDeliveryUserId);
                System.out.println("sss:" + nxDistributerUserEntity);

                userEntitySet.add(nxDistributerUserEntity);
            }


            return R.ok().put("data", userEntitySet);
        }

        return R.ok().put("data", "no");


    }


    /**
     * 称重中
     *
     * @param disId 批发商id
     * @return 称重中订单
     */
    @RequestMapping(value = "/getWeighingOrder/{disId}")
    @ResponseBody
    public R getWeighingOrder(@PathVariable Integer disId) {
        Map<String, Object> map = new HashMap<>();
        map.put("disId", disId);
        map.put("status", 1);
        List<NxOrdersEntity> entities = nxOrdersService.queryOrdersDetail(map);

        return R.ok().put("data", entities);
    }

    /**
     * 未称重
     *
     * @param disId 批发商id
     * @return 未称重订单
     */
    @RequestMapping(value = "/getUnWeightOrder", method = RequestMethod.POST)
    @ResponseBody
    public R getOrderList(Integer disId, String serviceDate) {
        Map<String, Object> map = new HashMap<>();
        map.put("disId", disId);
        map.put("serviceDate", serviceDate);
        map.put("status", 0);
        List<NxOrdersEntity> entities = nxOrdersService.queryOrdersDetail(map);
        return R.ok().put("data", entities);
    }


    /**
     * 以下称重接口
     * <p>
     * /**
     * 提交称重
     *
     * @param arr 订单
     * @return 成功
     */
    @RequestMapping(value = "/saveSubOrderWeight", method = RequestMethod.POST)
    @ResponseBody
    public R saveSubOrderWeight(@RequestBody NxOrdersEntity arr) {
        System.out.println("arrr" + arr);
        nxOrdersService.updateSub(arr);

//		JSONArray jsonArray = JSONArray.fromObject(arr);
//		System.out.println("00000");
//		for (Object obj: jsonArray){
//			System.out.println("11111");
//			JSONObject jsonObject2 = JSONObject.fromObject(obj);
//			NxOrdersSubEntity subEntity = (NxOrdersSubEntity) JSONObject.toBean(jsonObject2, NxOrdersSubEntity.class);
//			subEntity.setNxOsStatus(1);
////			nxOrdersSubService.update(subEntity);
//
//		}


        return R.ok();
    }


    /**
     * 获取订单详细
     *
     * @param orderId 订单id
     * @return 订单
     */
    @RequestMapping(value = "/getOrderDetail/{orderId}")
    @ResponseBody
    public R getOrderDetail(@PathVariable Integer orderId) {
        NxOrdersEntity ordersEntity = nxOrdersService.queryObject(orderId);


        return R.ok().put("data", ordersEntity);
    }


    /**
     * 获取拣货员的订单
     *
     * @param pickUserId 拣货id
     * @param status     订单状态
     * @return
     */
    @RequestMapping(value = "/getOrdersToWeigh", method = RequestMethod.POST)
    @ResponseBody
    public R getOrdersToWeigh(Integer pickUserId, Integer status) {
        System.out.println(pickUserId);
        Map<String, Object> map = new HashMap<>();
        map.put("pickerUserId", pickUserId);
        map.put("status", status);

        List<NxOrdersEntity> entities = nxOrdersService.queryOrdersToWeigh(map);

        return R.ok().put("data", entities);
    }


    /**
     * 批发商首页接口
     *
     * @param disId 批发商id
     * @return 分配拣货员列表
     */
    @RequestMapping(value = "/communityGetIndexData/{disId}")
    @ResponseBody
    public R disGetIndexData(@PathVariable Integer disId) {
        Map<String, Object> list = nxOrdersService.queryDistributerIndexData(disId);
        return R.ok().put("data", list);
    }


    @RequestMapping(value = "/distributionWeighing", method = RequestMethod.POST)
    @ResponseBody
    public R distributionWeighing(Integer pickUserId, String ordersEntities) {


        JSONArray jsonArray = JSONArray.fromObject(ordersEntities);
        for (Object obj : jsonArray) {
            JSONObject jsonObject2 = JSONObject.fromObject(obj);
            NxOrdersEntity ordersEntity = (NxOrdersEntity) JSONObject.toBean(jsonObject2, NxOrdersEntity.class);

            ordersEntity.setNxOrdersStatus(1);
            ordersEntity.setNxOrdersWeighUserId(pickUserId);
            nxOrdersService.update(ordersEntity);

        }

        return R.ok();
    }


    /**
     * 配送商分配称重客户给拣货员
     *
     * @param deliveryUserId 拣货员id
     * @param ordersEntities 客户订单id
     * @return 0
     */
    @RequestMapping(value = "/distributionDelivery", method = RequestMethod.POST)
    @ResponseBody
    public R distributionDelivery(Integer deliveryUserId, String ordersEntities) {


        JSONArray jsonArray = JSONArray.fromObject(ordersEntities);
        System.out.println("00000");
        for (Object obj : jsonArray) {
            JSONObject jsonObject2 = JSONObject.fromObject(obj);
            NxOrdersEntity ordersEntity = (NxOrdersEntity) JSONObject.toBean(jsonObject2, NxOrdersEntity.class);

            ordersEntity.setNxOrdersStatus(4);
            ordersEntity.setNxOrdersDeliveryUserId(deliveryUserId);
            nxOrdersService.update(ordersEntity);

        }


//		 String replace = ordersEntities.replace("[", "");
//		 String replace1 = replace.replace("]", "");
//
//		 String[] split = replace1.split(",");
//		 for (String str : split) {
//			 System.out.println(str);
//			 String replace2 = str.replace("\"", "");
//			 NxOrdersEntity ordersEntity = new NxOrdersEntity();
//			 Integer i = null;
//			 if(str != null){
//				i = Integer.valueOf(replace2);
//				 ordersEntity.setNxOrdersId(i);
//				 ordersEntity.setNxOrdersStatus(1);
//				 ordersEntity.setNxOrdersWeighUserId(pickUserId);
//				 nxOrdersService.update(ordersEntity);
//			 }
//		 }
        return R.ok();
    }


    /**
     * 批发商获取未分配客户订单
     *
     * @param disId 批发商id
     * @return 客户列表
     */
    @RequestMapping(value = "/getWeighOrders/{disId}")
    @ResponseBody
    public R disGetWeighOrders(@PathVariable Integer disId) {
        Map<String, Object> map = new HashMap<>();
        map.put("disId", disId);
        map.put("status", 0);
        List<NxOrdersEntity> entities = nxOrdersService.queryOrders(map);
        for (NxOrdersEntity orders : entities) {
            orders.setIsSelected(false);
        }
        return R.ok().put("data", entities);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
//	@RequiresPermissions("nxorders:save")
    public R save(@RequestBody NxOrdersEntity nxOrders, HttpServletRequest request) {
        System.out.println(nxOrders);

        nxOrders.setNxOrdersDate(formatWhatDayTime(0));
        nxOrders.setNxOrdersStatus(0);
        nxOrders.setNxOrdersPaymentStatus(1);
        nxOrdersService.save(nxOrders);


        MyWxPayConfig config = new MyWxPayConfig();
//        WXPay wxpay = new WXPay(config);

        SortedMap<String, String> params = new TreeMap<>();
        params.put("appid", config.getAppID());
        params.put("mch_id", config.getMchID());
        params.put("nonce_str", CommonUtils.generateUUID());
        params.put("body", "腾讯充值中心-QQ会员充值21");
        params.put("out_trade_no", CommonUtils.generateOutTradeNo());
        params.put("fee_type", "CNY");
        params.put("total_fee", "1");
        params.put("spbill_create_ip", "123.12.12.123");
        params.put("notify_url", "http://www.example.com/wxpay/notify");
        params.put("trade_type", "JSAPI");
        params.put("product_id", "12");
        params.put("openid", "oX2485BL9V-FjEa7bKOkFJcqxD0E");


        //map转xml
        try {
            WXPay wxpay = new WXPay(config);
            long time = System.currentTimeMillis();
            String tString = String.valueOf(time/1000);
            Map<String, String> resp = wxpay.unifiedOrder(params);
            System.out.println(resp);
            System.out.println("enennenen3333");
            SortedMap<String, String> reMap = new TreeMap<>();
            reMap.put("appId", config.getAppID());
            reMap.put("nonceStr", resp.get("nonce_str"));
            reMap.put("package", "prepay_id=" + resp.get("prepay_id"));
            reMap.put("signType", "MD5");
            reMap.put("timeStamp", tString);
            String s = WxPayUtils.creatSign(reMap, config.getKey());
            reMap.put("paySign", s);
            return R.ok().put("map", reMap);


        } catch (Exception e) {
            e.printStackTrace();
        }


        return R.ok();


    }


    /**
     * wait
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("nxorders:list")
    public R list(Integer page, Integer limit) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        //查询列表数据
        List<NxOrdersEntity> nxOrdersList = nxOrdersService.queryList(map);
        int total = nxOrdersService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(nxOrdersList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * wait
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{nxOrdersId}")
    @RequiresPermissions("nxorders:info")
    public R info(@PathVariable("nxOrdersId") Integer nxOrdersId) {
        NxOrdersEntity nxOrders = nxOrdersService.queryObject(nxOrdersId);

        return R.ok().put("nxOrders", nxOrders);
    }


    /**
     * wait
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("nxorders:update")
    public R update(@RequestBody NxOrdersEntity nxOrders) {
        nxOrdersService.update(nxOrders);

        return R.ok();
    }

    /**
     * wait
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("nxorders:delete")
    public R delete(@RequestBody Integer[] nxOrdersIds) {
        nxOrdersService.deleteBatch(nxOrdersIds);

        return R.ok();
    }

}
