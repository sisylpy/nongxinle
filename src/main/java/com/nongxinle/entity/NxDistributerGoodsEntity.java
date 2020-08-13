package com.nongxinle.entity;

/**
 * 
 * @author lpy
 * @date 07-27 17:38
 */

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter@Getter@ToString

public class NxDistributerGoodsEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 *  社区商品id
	 */
	private Integer nxDistributerGoodsId;
	/**
	 *  批发商id
	 */
	private Integer nxDgDistributeId;
	/**
	 *  商品状态
	 */
	private Integer nxDgGoodsStatus;
	/**
	 *  是否称重
	 */
	private Integer nxDgGoodsIsWeight;
	/**
	 *  批发商商品父类id
	 */
	private Integer nxDgDfgGoodsFatherId;
	/**
	 *  购买热度
	 */
	private Integer nxDgNxGoodsId;
	/**
	 *  采购数量
	 */
	private Integer nxDgNxGoodsFatherId;
	private Integer nxDgNxGoodsGrandId;
	private String nxDgNxGoodsFatherName;
	/**
	 *
	 */
	private String nxDgNxGoodsFatherImg;
	/**
	 *  商品名称
	 */
	private String nxDgGoodsName;
	/**
	 *  商品详细
	 */
	private String nxDgGoodsDetail;
	/**
	 *  商品规格
	 */
	private String nxDgGoodsStandardname;
	/**
	 *  社区商品拼音
	 */
	private String nxDgGoodsPinyin;
	/**
	 *  社区商品拼音简拼
	 */
	private String nxDgGoodsPy;

	private String nxDgGreatGrandFatherId;
	private String nxDgGreatGrandFatherName;
	private String nxDgGrandFatherId;
	private String nxDgGrandFatherName;
	private String nxDgGrandFatherImg;

	private NxGoodsEntity nxGoodsEntity;

	private List<NxDistributerStandardEntity> distributerStandardEntities;

	private List<NxStandardEntity> nxStandardEntities;

	private Integer isDownload;

}
