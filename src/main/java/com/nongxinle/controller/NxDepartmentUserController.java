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
import com.nongxinle.utils.WeChatUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxDepartmentUserEntity;
import com.nongxinle.service.NxDepartmentUserService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;


@RestController
@RequestMapping("api/nxdepartmentuser")
public class NxDepartmentUserController {
	@Autowired
	private NxDepartmentUserService nxDepartmentUserService;

	private static String APP_ID = "wx87baf9dcf935518a";

	private  static  String SECRET = "a7e380c56222dfbd5377aeea6bb1eba2";
	


	@RequestMapping(value = "/info/{id}")
	@ResponseBody
	public R info(@PathVariable Integer id) {
		NxDepartmentUserEntity nxDepartmentUserEntity = nxDepartmentUserService.queryObject(id);

		return R.ok().put("data", nxDepartmentUserEntity);
	}

	  @RequestMapping(value = "/addRestraunt/{socketId}")
	  @ResponseBody
	  public R addRestraunt(@PathVariable Integer socketId) {

		  System.out.println(socketId);
	      return R.ok();
	  }




	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
//	@RequiresPermissions("nxdepartmentuser:save")
	public R save(@RequestBody NxDepartmentUserEntity nxDepartmentUser){



		String url = "https://api.weixin.qq.com/sns/jscode2session?appid=" + APP_ID + "&secret=" + SECRET + "&js_code=" + nxDepartmentUser.getNxDuCode()+ "&grant_type=authorization_code";
		// 发送请求，返回Json字符串
		String str = WeChatUtil.httpRequest(url, "GET", null);
		// 转成Json对象 获取openid
		JSONObject jsonObject = JSONObject.parseObject(str);

		// 我们需要的openid，在一个小程序中，openid是唯一的
		String openid = jsonObject.get("openid").toString();
		nxDepartmentUser.setNxDuWxOpenId(openid);
		nxDepartmentUser.setNxDuAdmin(1);

		nxDepartmentUserService.save(nxDepartmentUser);

		
		return R.ok().put("data",nxDepartmentUser);
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("nxdepartmentuser:update")
	public R update(@RequestBody NxDepartmentUserEntity nxDepartmentUser){
		nxDepartmentUserService.update(nxDepartmentUser);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("nxdepartmentuser:delete")
	public R delete(@RequestBody Integer[] nxDepartmentUserIds){
		nxDepartmentUserService.deleteBatch(nxDepartmentUserIds);
		
		return R.ok();
	}

	
}
