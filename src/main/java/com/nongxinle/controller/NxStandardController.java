package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 2020-02-24 15:30:57
 */

import   java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nongxinle.entity.NxGoodsEntity;
import com.nongxinle.entity.NxOrderTemplateEntity;
import com.nongxinle.service.NxGoodsService;
import com.nongxinle.utils.UploadFile;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxStandardEntity;
import com.nongxinle.service.NxStandardService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;


@RestController
@RequestMapping("api/nxstandard")
public class NxStandardController {
	@Autowired
	private NxStandardService nxStandardService;

	@Autowired
	private NxGoodsService nxGoodsService;



	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list/{nxGoodsId}")
//	@RequiresPermissions("nxstandard:list")
	public R list(@PathVariable Integer nxGoodsId){
		
		//查询列表数据
		List<NxStandardEntity> nxStandardList = nxStandardService.queryList(nxGoodsId);
		return R.ok().put("data", nxStandardList);
	}
	
	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{nxStandardId}")
	@RequiresPermissions("nxstandard:info")
	public R info(@PathVariable("nxStandardId") Integer nxStandardId){
		NxStandardEntity nxStandard = nxStandardService.queryObject(nxStandardId);
		
		return R.ok().put("nxStandard", nxStandard);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping(value = "/save",produces = "text/html;charset=UTF-8")
//	@RequiresPermissions("nxstandard:save")
	public R save(@RequestParam("file") MultipartFile file, @RequestParam("nxStandardName") String name,
				  @RequestParam("nxStandardScale") String scale,@RequestParam("nxStandardError") String error,
				  @RequestParam("nxSGoodsId") Integer goodsId,
				  HttpSession session){
		System.out.println(file);


		//1,上传图片
		String newUploadName = "uploadImage";
		String realPath = UploadFile.upload(session, newUploadName, file);

		String filename = file.getOriginalFilename();
		String filePath = newUploadName + "/" + filename;

		NxStandardEntity standardEntity = new NxStandardEntity();
		standardEntity.setNxStandardFilePath(filePath);
		standardEntity.setNxStandardName(name);
		standardEntity.setNxStandardScale(scale);
		standardEntity.setNxStandardError(error);
		standardEntity.setNxSGoodsId(goodsId);
		nxStandardService.save(standardEntity);


		NxGoodsEntity goodsEntity = nxGoodsService.queryObject(goodsId);
		Integer nxGoodsStandardAmount = goodsEntity.getNxGoodsStandardAmount();
		System.out.println(nxGoodsStandardAmount);
		Integer newIII  = nxGoodsStandardAmount + 1;
		System.out.println(newIII + "ennenneen");
		goodsEntity.setNxGoodsStandardAmount(goodsEntity.getNxGoodsStandardAmount() + 1);
		nxGoodsService.update(goodsEntity);


		return R.ok().put("data",  standardEntity);
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("nxstandard:update")
	public R update(@RequestBody NxStandardEntity nxStandard){
		System.out.println("===" + nxStandard);
		nxStandardService.update(nxStandard);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("nxstandard:delete")
	public R delete(@RequestBody Integer[] nxStandardIds){
		nxStandardService.deleteBatch(nxStandardIds);
		
		return R.ok();
	}
	
}
