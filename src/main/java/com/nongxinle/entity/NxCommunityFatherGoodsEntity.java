package com.nongxinle.entity;

/**
 * 
 * @author lpy
 * @date 2020-02-24 17:06:57
 */

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter@Getter@ToString

public class NxCommunityFatherGoodsEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 *  
	 */
	private Integer nxCommunityFatherGoodsId;

	private String nxFatherGoodsName;

	private String nxFatherGoodsImg;

	private Integer nxFatherGoodsSort;

	private String nxFatherGoodsColor;

	private Integer nxFathersFatherId;

	private Integer nxFatherGoodsLevel;

	private Integer nxCfgCommunityId;

	private Integer nxCfgGoodsAmount;


	private List<NxPromoteEntity> nxPromoteEntities;

}
