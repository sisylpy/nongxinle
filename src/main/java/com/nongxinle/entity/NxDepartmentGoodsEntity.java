package com.nongxinle.entity;

/**
 * 
 * @author lpy
 * @date 06-22 04:50
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
	 *  部门商品id
	 */
	private Integer nxDepartmentGoodsId;
	/**
	 *  部门id
	 */
	private Integer nxDgDepartmentId;
	private Integer nxDgDepartmentFatherId;
	/**
	 *  nx商品id
	 */
	private Integer nxDgNxGoodsId;
	/**
	 *  nx商品父类id
	 */
	private Integer nxDgNxGoodsFatherId;
	/**
	 *  是否称重
	 */
	private Integer nxDgGoodsIsWeight;
	/**
	 *  商品状态
	 */
	private Integer nxDgGoodsStatus;
	/**
	 *  部门商品价格
	 */
	private String nxDgGoodsPrice;
	/**
	 *  部门商品价格更新日期
	 */
	private String nxDgPriceDate;
	/**
	 *  批发商id
	 */
	private Integer nxDgDistributeId;

	private String nxDgOrderQuantity;
	private String nxDgOrderStandard;
	private String nxDgOrderTime;
	private String nxDgOrderOnlyDate;
	private String nxDgOrderOnlyTime;


	private NxGoodsEntity nxGoodsEntity;

	private String nxDgOrderEditQuantity;
	private String nxDgOrderEditStandard;
	private String nxDgOrderEditRemark;
	private Boolean isSelected;

}
