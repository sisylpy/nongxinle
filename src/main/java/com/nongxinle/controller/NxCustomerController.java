package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 2020-02-10 19:43:11
 */

import java.text.SimpleDateFormat;
import java.util.*;

import com.alibaba.fastjson.JSONObject;
import com.nongxinle.entity.NxCommunityEntity;
import com.nongxinle.entity.NxCustomerUserEntity;
import com.nongxinle.service.NxCommunityService;
import com.nongxinle.service.NxCustomerUserService;
import com.nongxinle.utils.UploadFile;
import com.nongxinle.utils.WeChatUtil;
import net.sf.json.JSONArray;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxCustomerEntity;
import com.nongxinle.service.NxCustomerService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;


@RestController
@RequestMapping("api/nxcustomer")
public class NxCustomerController {
	@Autowired
	private NxCustomerService nxCustomerService;

	@Autowired
	private NxCommunityService nxCommunityService;

	@Autowired
	private NxCustomerUserService customerUserService;

	private static String APP_ID = "wx87baf9dcf935518a";

	private  static  String SECRET = "a7e380c56222dfbd5377aeea6bb1eba2";


	 @RequestMapping(value = "/getCommunityCustomers", method = RequestMethod.POST)
	  @ResponseBody
	  public R getCommunityCustomers (Integer page, Integer limit, Integer nxCommunityId ) {

		 Map<String, Object> map = new HashMap<>();
		 map.put("offset", (page - 1) * limit);
		 map.put("limit", limit);
		 map.put("nxCommunityId", nxCommunityId);

		 //查询列表数据
		 List<NxCustomerEntity> nxCustomerList = nxCustomerService.queryCommunityCustomers(map);
		 int total = nxCustomerService.queryCustomerOfCommunityTotal(map);

		 PageUtils pageUtil = new PageUtils(nxCustomerList, total, limit, page);

		 return R.ok().put("page", pageUtil);


	  }




	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("nxcustomer:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<NxCustomerEntity> nxCustomerList = nxCustomerService.queryList(map);
		int total = nxCustomerService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(nxCustomerList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{customerId}")
	@RequiresPermissions("nxcustomer:info")
	public R info(@PathVariable("customerId") Integer customerId){
		NxCustomerEntity nxCustomer = nxCustomerService.queryObject(customerId);
		
		return R.ok().put("nxCustomer", nxCustomer);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
//	@RequiresPermissions("nxcustomer:save")
	public R save(@RequestBody NxCustomerEntity nxCustomer){
		System.out.println(nxCustomer);


		String url = "https://api.weixin.qq.com/sns/jscode2session?appid=" + APP_ID + "&secret=" + SECRET + "&js_code=" + nxCustomer.getCode() + "&grant_type=authorization_code";
		// 发送请求，返回Json字符串
		String str = WeChatUtil.httpRequest(url, "GET", null);
		// 转成Json对象 获取openid
		JSONObject jsonObject = JSONObject.parseObject(str);

		// 我们需要的openid，在一个小程序中，openid是唯一的
		String openid = jsonObject.get("openid").toString();
		System.out.println(jsonObject);
		System.out.println("opeppepep" + openid);




		Integer cuWxGender = nxCustomer.getNxCustomerUserEntity().getNxCuWxGender();
		nxCustomer.setNxCustomerCall(cuWxGender);

		nxCustomerService.save(nxCustomer);

		Integer customerId = nxCustomer.getNxCustomerId();
		NxCustomerUserEntity userEntity = nxCustomer.getNxCustomerUserEntity();
		userEntity.setNxCuCustomerId(customerId);
		userEntity.setNxCuWxOpenId(openid);
		customerUserService.save(userEntity);
		Map<String, Object> map = new HashMap<>();
		map.put("status", 1);
		map.put("user", nxCustomer);


		return R.ok().put("data", map);

	}



	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
//	@RequiresPermissions("nxcustomer:update")
	public R update(@RequestBody NxCustomerEntity nxCustomer){
		System.out.println("iamupate");
		nxCustomerService.update(nxCustomer);
		
		return R.ok().put("data", nxCustomer);
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("nxcustomer:delete")
	public R delete(@RequestBody Integer[] customerIds){
		nxCustomerService.deleteBatch(customerIds);
		
		return R.ok();
	}
	
}
