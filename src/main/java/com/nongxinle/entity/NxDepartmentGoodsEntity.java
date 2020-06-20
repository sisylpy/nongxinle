package com.nongxinle.entity;

/**
 * 
 * @author lpy
 * @date 06-17 23:53
 */

import java.io.Serializable;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter@Getter@ToString

public class NxDepartmentGoodsEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 *  社区商品id
	 */
	private Integer nxDepartmentGoodsId;
	/**
	 *  批发商id
	 */
	private Integer nxDgDistributeId;
	/**
	 *  社区id
	 */
	private Integer nxDgCommunityId;
	/**
	 *  商品状态
	 */
	private Integer nxDgGoodsStatus;
	/**
	 *  是否称重
	 */
	private Integer nxDgGoodsIsWeight;
	/**
	 *  价格
	 */
	private Float nxDgGoodsPrice;
	/**
	 *  价格小数点部分
	 */
	private Integer nxDgGoodsPriceDecimal;
	/**
	 *  商品图片
	 */
	private String nxDgNxGoodsFilePath;
	/**
	 *  批发商商品销售规格模式0按standardname销售，1 按自己的规格销售
	 */
	private Integer nxDgGoodsSellType;
	/**
	 *  自采购商品的状态
	 */
	private Integer nxDgGoodsBuyType;
	/**
	 *  社区商品父类id
	 */
	private Integer nxDgCfGoodsFatherId;
	/**
	 *  购买热度
	 */
	private Integer nxDgNxGoodsId;
	/**
	 *  采购数量
	 */
	private String nxDgNxGoodsFatherId;
	/**
	 *  进货方式
	 */
	private String nxDgNxGoodsFatherImg;
	/**
	 *  自采购员工id
	 */
	private Integer nxDgGoodsTotalHits;
	/**
	 *  App订货供货商appid
	 */
	private Integer nxDgPurchaseQuantity;
	/**
	 *  供货商id
	 */
	private Integer nxDgBuyPurchaseUserId;
	/**
	 *  进价
	 */
	private String nxDgBuyAppId;
	/**
	 *  商品id
	 */
	private Integer nxDgBuyStatus;
	/**
	 *  商品库父类id
	 */
	private Integer nxDgSupplierId;
	/**
	 *  商品库image
	 */
	private String nxDgBuyingPrice;
	/**
	 *  0 供货商，1 社区库存，2 自采购 4 加工
	 */
	private Integer nxDgGoodsType;
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
	 *  社区库存商品库存量
	 */
	private String nxDgGoodsStock;
	/**
	 *  社区商品拼音
	 */
	private String nxDgGoodsPinyin;
	/**
	 *  社区商品拼音简拼
	 */
	private String nxDgGoodsPy;

}
