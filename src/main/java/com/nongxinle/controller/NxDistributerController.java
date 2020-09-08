package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 2020-02-10 19:43:11
 */

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.nongxinle.entity.*;
import com.nongxinle.service.NxDistributerUserRoleService;
import com.nongxinle.service.NxDistributerUserService;
import com.nongxinle.utils.MyAPPIDConfig;
import com.nongxinle.utils.WeChatUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


import com.nongxinle.service.NxDistributerService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("api/nxdistributer")
public class NxDistributerController {

	@Autowired
	private NxDistributerService nxDistributerService;
	@Autowired
	private NxDistributerUserService nxDistributerUserService;


	/**
	 * 批发商登陆
	 * @param distributerUserEntity 批发商
	 * @return 批发商
	 */
	@RequestMapping(value = "/disLogin", method = RequestMethod.POST)
	@ResponseBody
	public R disLogin (@RequestBody NxDistributerUserEntity distributerUserEntity ) {

		MyAPPIDConfig myAPPIDConfig = new MyAPPIDConfig();
		String url = "https://api.weixin.qq.com/sns/jscode2session?appid=" + myAPPIDConfig.getCaidiAppID() + "&secret=" +
				myAPPIDConfig.getCaidiScreat() + "&js_code=" + distributerUserEntity.getNxDiuCode() +
				"&grant_type=authorization_code";
		// 发送请求，返回Json字符串
		String str = WeChatUtil.httpRequest(url, "GET", null);
		// 转成Json对象 获取openid
		JSONObject jsonObject = JSONObject.parseObject(str);

		// 我们需要的openid，在一个小程序中，openid是唯一的
		String openid = jsonObject.get("openid").toString();
		List<NxDistributerUserEntity> distributerUserEntities = nxDistributerUserService.queryUserByOpenId(openid);
		if(distributerUserEntities.size() > 0){
			NxDistributerUserEntity nxDistributerUserEntity = distributerUserEntities.get(0);
			Integer nxDistributerUserId = nxDistributerUserEntity.getNxDistributerUserId();
			NxDistributerUserEntity nxDistributerEntity = nxDistributerUserService.queryUserInfo(nxDistributerUserId);

			return R.ok().put("data", nxDistributerEntity);
		}else {
			return R.error(-1,"用户不存在");
		}
	}

	/**
	 * 批发商注册
	 * @param distributerEntity 批发商
	 * @return 批发商
	 */
	@RequestMapping(value = "/disAndUserSave", method = RequestMethod.POST)
	@ResponseBody
	public R disAndUserSave (@RequestBody NxDistributerEntity distributerEntity) {

		MyAPPIDConfig myAPPIDConfig = new MyAPPIDConfig();

		// 1, 先检查微信号是否以前注册过
		String url = "https://api.weixin.qq.com/sns/jscode2session?appid=" + myAPPIDConfig.getCaidiAppID() + "&secret=" +
				myAPPIDConfig.getCaidiScreat() + "&js_code=" + distributerEntity.getNxDistributerUserEntity().getNxDiuCode() +
				"&grant_type=authorization_code";
		// 发送请求，返回Json字符串
		String str = WeChatUtil.httpRequest(url, "GET", null);
		// 转成Json对象 获取openid
		JSONObject jsonObject = JSONObject.parseObject(str);

		// 我们需要的openid，在一个小程序中，openid是唯一的
		String openid = jsonObject.get("openid").toString();
		System.out.println(openid + "openididiiddi");

		List<NxDistributerUserEntity> distributerUserEntities = nxDistributerUserService.queryUserByOpenId(openid);
		//2，如果注册过，则返回提示。
		if(distributerUserEntities.size() > 0){
			return R.error(-1,"微信号已注册!");
		}else {

			// 3，如果没有注册过
			// 3.1保存批发商
			nxDistributerService.save(distributerEntity);

			// 3.2，保存批发商用户
			Integer nxDistributerId = distributerEntity.getNxDistributerId();
			NxDistributerUserEntity nxDistributerUserEntity = distributerEntity.getNxDistributerUserEntity();

			nxDistributerUserEntity.setNxDiuDistributerId(nxDistributerId);
			nxDistributerUserEntity.setNxDiuWxOpenId(openid);
			nxDistributerUserService.save(nxDistributerUserEntity);

			//3..3 返回用户id
			Integer nxDistributerUserId = nxDistributerUserEntity.getNxDistributerUserId();
			NxDistributerUserEntity nxDistributerEntity = nxDistributerUserService.queryUserInfo(nxDistributerUserId);

			return R.ok().put("data", nxDistributerEntity);
		}
	}




//	/////////////////////////////////////////



	@RequestMapping(value = "/downLoadFragment/{fragmentId}")
	public ResponseEntity downLoadFragment (@PathVariable Integer fragmentId, HttpSession session) throws Exception {

		//1,获取文件路径
		ServletContext servletContext = session.getServletContext();
		String realPath = servletContext.getRealPath("numberRecord/ling.mp3");

		System.out.println("kaknakreailpath");
		System.out.println(realPath);

		//2,把文件读取程序当中
		InputStream io = new FileInputStream(realPath);
		byte[] body2 = new byte[io.available()];
		io.read(body2);
		System.out.println("openitititii");
		System.out.println(io.read());
		System.out.println(body2.length);

		//3,创建相应头
		HttpHeaders httpHeaders = new HttpHeaders();
		System.out.println(httpHeaders);

		httpHeaders.add("Content-Disposition","attachment; filename=" + "abc1"+".mp3");
		httpHeaders.add("Content-Type","audio/mpeg");
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(body2, httpHeaders, HttpStatus.OK);
		System.out.println("---0000000=-========");
		System.out.println(responseEntity);
		return responseEntity;
	}
///////









	
	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("nxdistributer:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<NxDistributerEntity> nxDistributerList = nxDistributerService.queryList(map);
		int total = nxDistributerService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(nxDistributerList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}
	

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("nxdistributer:save")
	public R save(@RequestBody NxDistributerEntity nxDistributer){
		nxDistributerService.save(nxDistributer);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("nxdistributer:update")
	public R update(@RequestBody NxDistributerEntity nxDistributer){
		nxDistributerService.update(nxDistributer);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("nxdistributer:delete")
	public R delete(@RequestBody Integer[] distributerIds){
		nxDistributerService.deleteBatch(distributerIds);
		
		return R.ok();
	}
	
}
