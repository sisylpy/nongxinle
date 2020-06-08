package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 05-26 16:23
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nongxinle.entity.NxPromoteEntity;
import com.nongxinle.utils.UploadFile;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxAdsenseEntity;
import com.nongxinle.service.NxAdsenseService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;


@RestController
@RequestMapping("api/nxadsense")
public class NxAdsenseController {
	@Autowired
	private NxAdsenseService nxAdsenseService;




	@RequestMapping(value = "/getListByCommunityId/{communityId}")
	@ResponseBody
	public R getListByCommunityId(@PathVariable Integer communityId) {
		List<NxAdsenseEntity> adsenseEntities = nxAdsenseService.getListByCommunityId(communityId);


	    return R.ok().put("data", adsenseEntities);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping(value = "/save", produces = "text/html;charset=UTF-8")
	public R save(@RequestParam("file") MultipartFile file,
				  @RequestParam("nxAdsenseCommunityId") Integer nxAdsenseCommunityId,
				  HttpSession session) {
		System.out.println("hahhah");
		System.out.println(file);


		//1,上传图片
		String newUploadName = "uploadImage";
		String realPath = UploadFile.upload(session, newUploadName, file);

		String filename = file.getOriginalFilename();
		String filePath = newUploadName + "/" + filename;

		System.out.println(filePath);
		System.out.println("filebpathth");

		NxAdsenseEntity adsenseEntity = new NxAdsenseEntity();
		adsenseEntity.setNxAdsenseFilePath(filePath);
		adsenseEntity.setNxAdsenseCommunityId(nxAdsenseCommunityId);

		nxAdsenseService.save(adsenseEntity);


		return R.ok();
	}

	
}
