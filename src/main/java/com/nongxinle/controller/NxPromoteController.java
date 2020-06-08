package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 05-25 08:54
 */

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nongxinle.entity.NxCommunityGoodsEntity;
import com.nongxinle.entity.NxGoodsEntity;
import com.nongxinle.service.NxCommunityGoodsService;
import com.nongxinle.utils.UploadFile;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxPromoteEntity;
import com.nongxinle.service.NxPromoteService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;


@RestController
@RequestMapping("api/nxpromote")
public class NxPromoteController {
	@Autowired
	private NxPromoteService nxPromoteService;

	@Autowired
	private NxCommunityGoodsService nxCommunityGoodsService;


	@RequestMapping(value = "/getListByCommunityId/{communityId}")
	@ResponseBody
	public R getListByCommunityId(@PathVariable Integer communityId) {
		System.out.println("lailema?" );
		List<NxPromoteEntity> promoteEntities = nxPromoteService.getListByCommunityId(communityId);

	    return R.ok().put("data", promoteEntities);
	}



	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping(value = "/save", produces = "text/html;charset=UTF-8")
//    @RequiresPermissions("nxgoods:save")
	public R save(@RequestParam("file") MultipartFile file,
				  @RequestParam("nxPromoteCgId") Integer nxPromoteCgId,
				  @RequestParam("nxOrignalPrice") String nxOrignalPrice,
				  @RequestParam("nxPromotePrice") String nxPromotePrice,
				  @RequestParam("nxPromoteStandard") String nxPromoteStandard,
				  @RequestParam("nxPromoteWeight") String nxPromoteWeight,
				  @RequestParam("nxPromoteExpired") String nxPromoteExpired,
				  @RequestParam("nxPromoteStorage") String nxPromoteStorage,
				  @RequestParam("nxPromoteWords") String nxPromoteWords,
				  @RequestParam("nxPromoteCommunityId") Integer nxPromoteCommunityId,
				  @RequestParam("nxPromoteRecommandGoods") String nxPromoteRecommandGoods,
				  @RequestParam("nxPromoteCgFatherId") Integer nxPromoteCgFatherId,
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

		NxPromoteEntity nxPromoteEntity = new NxPromoteEntity();
		nxPromoteEntity.setNxPromoteCgId(nxPromoteCgId);
		nxPromoteEntity.setNxPromoteFilePath(filePath);
		nxPromoteEntity.setNxOrignalPrice(nxOrignalPrice);
		nxPromoteEntity.setNxPromotePrice(nxPromotePrice);
		nxPromoteEntity.setNxPromoteStandard(nxPromoteStandard);
		nxPromoteEntity.setNxPromoteWeight(nxPromoteWeight);
		nxPromoteEntity.setNxPromoteExpired(nxPromoteExpired);
		nxPromoteEntity.setNxPromoteStorage(nxPromoteStorage);
		nxPromoteEntity.setNxPromoteWords(nxPromoteWords);
		nxPromoteEntity.setNxPromoteCommunityId(nxPromoteCommunityId);
		nxPromoteEntity.setNxPromoteRecommandGoods(nxPromoteRecommandGoods);
		nxPromoteEntity.setNxPromoteCgFatherId(nxPromoteCgFatherId);

		nxPromoteService.save(nxPromoteEntity);





		return R.ok();
	}



	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{nxPromoteId}")
//	@RequiresPermissions("nxpromote:info")
	public R info(@PathVariable("nxPromoteId") Integer nxPromoteId){
		NxPromoteEntity nxPromote = nxPromoteService.queryObject(nxPromoteId);
		String nxPromoteRecommandGoods = nxPromote.getNxPromoteRecommandGoods();
		String[] split = nxPromoteRecommandGoods.split(",");
		List<NxCommunityGoodsEntity> goodslist = new ArrayList<>();
		for (String s : split) {
			if(s != null ){
				Integer integer = Integer.valueOf(s);
				System.out.println(integer + "integer!!!!");
				NxCommunityGoodsEntity communityGoodsEntity = nxCommunityGoodsService.queryObject(integer);
				goodslist.add(communityGoodsEntity);
			}
		}

		nxPromote.setNxCommunityGoodsEntities(goodslist);

		return R.ok().put("data", nxPromote);
	}
	

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("nxpromote:update")
	public R update(@RequestBody NxPromoteEntity nxPromote){
		nxPromoteService.update(nxPromote);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("nxpromote:delete")
	public R delete(@RequestBody Integer[] nxPromoteIds){
		nxPromoteService.deleteBatch(nxPromoteIds);
		
		return R.ok();
	}
	
}
