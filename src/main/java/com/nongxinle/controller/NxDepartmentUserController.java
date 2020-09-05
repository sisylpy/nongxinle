package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 06-16 11:26
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.nongxinle.entity.NxDepartmentEntity;
import com.nongxinle.entity.NxDistributerUserEntity;
import com.nongxinle.service.NxDepartmentService;
import com.nongxinle.utils.*;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxDepartmentUserEntity;
import com.nongxinle.service.NxDepartmentUserService;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;

import static com.nongxinle.utils.DateUtils.formatWhatDay;


@RestController
@RequestMapping("api/nxdepartmentuser")
public class NxDepartmentUserController {
	@Autowired
	private NxDepartmentUserService nxDepartmentUserService;

	@Autowired
	private NxDepartmentService nxDepartmentService;


	/**
	 * 修改订货用户信息
	 * @param userName 订货用户名称
	 * @param weeks 显示几周
	 * @param userId 用户id
	 * @param depId 部门id
	 * @return ok
	 */
	@RequestMapping(value = "/updateDepUser", method = RequestMethod.POST)
	@ResponseBody
	public R updateDepUser (String userName, Integer weeks, Integer userId,  Integer depId) {
		NxDepartmentUserEntity nxDepartmentUserEntity = nxDepartmentUserService.queryObject(userId);
		nxDepartmentUserEntity.setNxDuWxNickName(userName);
		nxDepartmentUserService.update(nxDepartmentUserEntity);

		NxDepartmentEntity nxDepartmentEntity = nxDepartmentService.queryObject(depId);
		nxDepartmentEntity.setNxDepartmentShowWeeks(weeks);
		nxDepartmentService.update(nxDepartmentEntity);
		Map<String, Object> map = new HashMap<>();
		map.put("userInfo", nxDepartmentUserEntity );
		map.put("depInfo", nxDepartmentEntity);
		return R.ok().put("data", map);
	}

	/**
	 * 部门用户修改用户信息
	 * @param file 用户头像
	 * @param userName 用户名
	 * @param weeks 显示几周信息
	 * @param userId 用户id
	 * @param session 图片
	 * @return ok
	 */
	@RequestMapping(value = "/updateDepUserWithFile", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public R updateDepUserWithFile(@RequestParam("file") MultipartFile file,
								   @RequestParam("userName") String userName,
								   @RequestParam("weeks") Integer weeks,
								   @RequestParam("userId") Integer userId,
								   @RequestParam("depId") Integer depId,
								   HttpSession session) {
		//1,上传图片
		String newUploadName = "uploadImage";
		String realPath = UploadFile.upload(session, newUploadName, file);

		String filename = file.getOriginalFilename();
		String filePath = newUploadName + "/" + filename;
		NxDepartmentUserEntity nxDepartmentUserEntity = nxDepartmentUserService.queryObject(userId);
		nxDepartmentUserEntity.setNxDuWxNickName(userName);
		nxDepartmentUserEntity.setNxDuWxAvartraUrl(filePath);
		nxDepartmentUserEntity.setNxDuUrlChange(1);
		nxDepartmentUserService.update(nxDepartmentUserEntity);


		NxDepartmentEntity nxDepartmentEntity = nxDepartmentService.queryObject(depId);
		nxDepartmentEntity.setNxDepartmentShowWeeks(weeks);
		nxDepartmentService.update(nxDepartmentEntity);

		return R.ok();

	}

	/**
	 * PURCHASE,
	 * 采购员登陆
	 * @param code 微信用户code
	 * @return 用户信息和订货群信息
	 */
	@RequestMapping(value = "/purchaserUserLogin/{code}")
	@ResponseBody
	public R purchaserUserLogin(@PathVariable String code) {

		MyAPPIDConfig myAPPIDConfig = new MyAPPIDConfig();
		String purchaseAppID = myAPPIDConfig.getPurchaseAppID();
		String purchaseScreat = myAPPIDConfig.getPurchaseScreat();


		String url = "https://api.weixin.qq.com/sns/jscode2session?appid=" + purchaseAppID + "&secret=" +
				purchaseScreat + "&js_code=" + code +
				"&grant_type=authorization_code";
		// 发送请求，返回Json字符串
		String str = WeChatUtil.httpRequest(url, "GET", null);
		// 转成Json对象 获取openid
		JSONObject jsonObject = JSONObject.parseObject(str);

		// 我们需要的openid，在一个小程序中，openid是唯一的
		String openId = jsonObject.get("openid").toString();
		List<NxDepartmentUserEntity> depUserEntities = nxDepartmentUserService.queryDepUserByOpenId(openId);
		if(depUserEntities.size() > 0){
			NxDepartmentUserEntity nxDistributerUserEntity = depUserEntities.get(0);
			Integer nxGroupUserId = nxDistributerUserEntity.getNxDepartmentUserId();
			Map<String, Object> stringObjectMap = nxDepartmentService.queryGroupAndUserInfo(nxGroupUserId);
			return R.ok().put("data", stringObjectMap);
		}else {
			return R.error(-1,"请进行注册");
		}
	}


	/**
	 * 订货群采购员注册
	 * @param nxDepartmentUser 订货群采购员用户
	 * @return 用户信息和订货群信息
	 */
	@RequestMapping(value = "/depPurchaseUserSave", method = RequestMethod.POST)
	@ResponseBody
	public R depPurchaseUserSave (@RequestBody NxDepartmentUserEntity nxDepartmentUser  ) {
		MyAPPIDConfig myAPPIDConfig = new MyAPPIDConfig();
		String purchaseAppID = myAPPIDConfig.getPurchaseAppID();
		String purchaseScreat = myAPPIDConfig.getPurchaseScreat();


		String code = nxDepartmentUser.getNxDuCode();
		String url = "https://api.weixin.qq.com/sns/jscode2session?appid=" + purchaseAppID + "&secret=" +
				purchaseScreat + "&js_code=" + code +
				"&grant_type=authorization_code";
		// 发送请求，返回Json字符串
		String str = WeChatUtil.httpRequest(url, "GET", null);
		// 转成Json对象 获取openid
		JSONObject jsonObject = JSONObject.parseObject(str);

		// 我们需要的openid，在一个小程序中，openid是唯一的
		String openId = jsonObject.get("openid").toString();
		List<NxDepartmentUserEntity> depUserEntities = nxDepartmentUserService.queryDepUserByOpenId(openId);
       if(depUserEntities.size() > 0){
		   return R.error(-1,"请直接登陆");

	   }else{
		   //添加新用户
		   nxDepartmentUser.setNxDuWxOpenId(openId);
		   nxDepartmentUser.setNxDuJoinDate(formatWhatDay(0));
		   nxDepartmentUserService.save(nxDepartmentUser);
		   Integer nxDepartmentUserId = nxDepartmentUser.getNxDepartmentUserId();
		   Map<String, Object> stringObjectMap = nxDepartmentService.queryGroupAndUserInfo(nxDepartmentUserId);

		   return R.ok().put("data",stringObjectMap);
	   }
	}

	/**
	 * ORDER
	 * 订货用户注册
	 * @param nxDepartmentUser 订货用户
	 * @return 用户id
	 */
	@ResponseBody
	@RequestMapping("/depOrderUserSave")
	public R depOrderUserSave(@RequestBody NxDepartmentUserEntity nxDepartmentUser){


		MyAPPIDConfig myAPPIDConfig = new MyAPPIDConfig();
		String orderAppID = myAPPIDConfig.getOrderAppID();
		String orderScreat = myAPPIDConfig.getOrderScreat();

		String url = "https://api.weixin.qq.com/sns/jscode2session?appid=" + orderAppID + "&secret=" + orderScreat + "&js_code=" + nxDepartmentUser.getNxDuCode()+ "&grant_type=authorization_code";
		// 发送请求，返回Json字符串
		String str = WeChatUtil.httpRequest(url, "GET", null);
		// 转成Json对象 获取openid
		JSONObject jsonObject = JSONObject.parseObject(str);

		// 我们需要的openid，在一个小程序中，openid是唯一的
		String openid = jsonObject.get("openid").toString();

		List<NxDepartmentUserEntity> depUserEntities = nxDepartmentUserService.queryDepUserByOpenId(openid);
		if(depUserEntities.size() > 0){
			return R.error(-1,"请直接登陆");

		}else{
			//添加新用户
			nxDepartmentUser.setNxDuWxOpenId(openid);
			nxDepartmentUser.setNxDuJoinDate(formatWhatDay(0));
			nxDepartmentUserService.save(nxDepartmentUser);
			Integer nxDepartmentUserId = nxDepartmentUser.getNxDepartmentUserId();
			Map<String, Object> stringObjectMap = nxDepartmentService.queryGroupAndUserInfo(nxDepartmentUserId);

			return R.ok().put("data",stringObjectMap);
		}
	}

	/**
	 * ORDER
	 * 部门用户登陆
	 * @param code 微信code
	 * @return 用户和部门信息
	 */
	@RequestMapping(value = "/depUserLogin/{code}")
	@ResponseBody
	public R depUserLogin(@PathVariable String code) {
		MyAPPIDConfig myAPPIDConfig = new MyAPPIDConfig();
		String orderAppID = myAPPIDConfig.getOrderAppID();
		String orderScreat = myAPPIDConfig.getOrderScreat();

		String url = "https://api.weixin.qq.com/sns/jscode2session?appid=" + orderAppID + "&secret=" +
				orderScreat + "&js_code=" + code +
				"&grant_type=authorization_code";
		// 发送请求，返回Json字符串
		String str = WeChatUtil.httpRequest(url, "GET", null);
		// 转成Json对象 获取openid
		JSONObject jsonObject = JSONObject.parseObject(str);

		// 我们需要的openid，在一个小程序中，openid是唯一的
		String openId = jsonObject.get("openid").toString();
		System.out.println(openId + "openididiiddi");
		List<NxDepartmentUserEntity> depUserEntities = nxDepartmentUserService.queryDepUserByOpenId(openId);
		if(depUserEntities.size() > 0){
			NxDepartmentUserEntity nxDistributerUserEntity = depUserEntities.get(0);
			Integer nxDepartmentUserId = nxDistributerUserEntity.getNxDepartmentUserId();
			Map<String, Object> stringObjectMap = nxDepartmentService.queryDepAndUserInfo(nxDepartmentUserId);
			return R.ok().put("data", stringObjectMap);
		}else {
			return R.error(-1,"用户不存在");

		}
	}

	/**
	 * ORDER
	 * 订货首页获取用户和部门信息
	 * @param userid 用户id
	 * @return 用户和部门信息
	 */
	@RequestMapping(value = "/getDepAndUserInfo/{userid}")
	@ResponseBody
	public R getDepAndUserInfo(@PathVariable Integer userid) {
		Map<String, Object> stringObjectMap = nxDepartmentService.queryDepAndUserInfo(userid);
		return R.ok().put("data", stringObjectMap);
	}


	/**
	 * PURCHASE
	 *
	 * 修改群和用户
	 * @param file 用户头像
	 * @param userName 用户名
	 * @param groupName 群名称
	 * @param userId 用户id
	 * @param depId 群id
	 * @param session 图片路径
	 * @return ok
	 */
	//todo
	@RequestMapping(value = "/updateGroupPurchaseWithFile", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public R updateGroupPurchaseWithFile(@RequestParam("file") MultipartFile file,
										 @RequestParam("userName") String userName,
										 @RequestParam("groupName") String groupName,
										 @RequestParam("userId") Integer userId,
										 @RequestParam("depId") Integer depId,
										 HttpSession session) {
		//1,上传图片
		String newUploadName = "uploadImage";
		String realPath = UploadFile.upload(session, newUploadName, file);

		String filename = file.getOriginalFilename();
		String filePath = newUploadName + "/" + filename;
		NxDepartmentUserEntity nxDepartmentUserEntity = nxDepartmentUserService.queryObject(userId);
		nxDepartmentUserEntity.setNxDuWxNickName(userName);
		nxDepartmentUserEntity.setNxDuWxAvartraUrl(filePath);
		nxDepartmentUserEntity.setNxDuUrlChange(1);
		nxDepartmentUserService.update(nxDepartmentUserEntity);

		NxDepartmentEntity nxDepartmentEntity = nxDepartmentService.queryObject(depId);
		nxDepartmentEntity.setNxDepartmentName(groupName);
		nxDepartmentService.update(nxDepartmentEntity);


		return R.ok();

	}

	/**
	 * PURCHASE,
	 * 修改群信息
	 * @param userName 用户名（没用）
	 * @param groupName 群名称
	 * @param userId 用户id
	 * @param depId 群id
	 * @return ok
	 */
	@RequestMapping(value = "/updateGroupPurchase", method = RequestMethod.POST)
	@ResponseBody
	public R updateGroupPurchase (String userName, String groupName, Integer userId,  Integer depId) {
		NxDepartmentUserEntity nxDepartmentUserEntity = nxDepartmentUserService.queryObject(userId);
		nxDepartmentUserEntity.setNxDuWxNickName(userName);
		nxDepartmentUserService.update(nxDepartmentUserEntity);

		NxDepartmentEntity nxDepartmentEntity = nxDepartmentService.queryObject(depId);
		nxDepartmentEntity.setNxDepartmentName(groupName);
		nxDepartmentService.update(nxDepartmentEntity);
		return R.ok();
	}



	/**
	 * PURCHASE
	 * 获取群用户
	 * @param depId 群id
	 * @return 用户列表
	 */
	@RequestMapping(value = "/getDepUsers/{depId}")
	@ResponseBody
	public R getDepUsers(@PathVariable Integer depId) {
      List<NxDepartmentUserEntity> userEntities =  nxDepartmentUserService.queryAllUsersByDepId(depId);
	    return R.ok().put("data", userEntities);
	}

	@RequestMapping(value = "/getDepUserInfo/{userId}")
	@ResponseBody
	public R getDepUserInfo(@PathVariable Integer userId) {
		NxDepartmentUserEntity nxDepartmentUserEntity = nxDepartmentUserService.queryObject(userId);
		return R.ok().put("data", nxDepartmentUserEntity);
	}


	@RequestMapping(value = "/deleteDepUser/{userId}")
	@ResponseBody
	public R deleteDepUser(@PathVariable Integer userId) {
		NxDepartmentUserEntity nxDepartmentUserEntity = nxDepartmentUserService.queryObject(userId);
		Integer nxDuAdmin = nxDepartmentUserEntity.getNxDuAdmin();
		if(nxDuAdmin.equals(1)){
			Integer nxDuDepartmentId = nxDepartmentUserEntity.getNxDuDepartmentId();
			List<NxDepartmentUserEntity> userEntities = nxDepartmentUserService.queryGroupAdminUserAmount(nxDuDepartmentId);
			if(userEntities.size() == 1){
				return R.error(-1,"这是唯一用户，不能删除。");
			}else{
				nxDepartmentUserService.delete(userId);
				return R.ok();
			}
		}else{
			nxDepartmentUserService.delete(userId);
			return R.ok();
		}
	}






	


	
}
