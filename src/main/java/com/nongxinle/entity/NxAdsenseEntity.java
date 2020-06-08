package com.nongxinle.entity;

/**
 * 
 * @author lpy
 * @date 05-26 16:23
 */

import java.io.Serializable;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter@Getter@ToString

public class NxAdsenseEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 *  广告位id
	 */
	private Integer nxAdsenseId;
	/**
	 *  广告位图片
	 */
	private String nxAdsenseFilePath;
	/**
	 *  广告位链接
	 */
	private String nxAdsenseClick;
	/**
	 *  社区id
	 */
	private Integer nxAdsenseCommunityId;
	/**
	 *  广告位排序
	 */
	private Integer nxAdsenseSort;

}
