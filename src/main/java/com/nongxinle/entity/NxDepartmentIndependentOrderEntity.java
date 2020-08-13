package com.nongxinle.entity;

/**
 * 
 * @author lpy
 * @date 08-01 13:09
 */

import java.io.Serializable;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter@Getter@ToString

public class NxDepartmentIndependentOrderEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 *  部门订自采购订单id
	 */
	private Integer nxDepIndependentOrderId;
	/**
	 *  订货部门id
	 */
	private Integer nxDioDepartmentId;
	/**
	 *  订货父级部门id
	 */
	private Integer nxDioDepartmentFatherId;
	/**
	 *  订货用户id
	 */
	private Integer nxDioApplyUserId;
	/**
	 *  订货时间
	 */
	private String nxDioApplyTime;
	/**
	 *  订货日期
	 */
	private String nxDioApplyDate;
	/**
	 *  订单状态
	 */
	private Integer nxDioApplyStatus;
	/**
	 *  订货数量
	 */
	private String nxDioApplyQuantity;
	/**
	 *  订货规格
	 */
	private String nxDioApplyStandard;
	/**
	 *  订货备注
	 */
	private String nxDioApplyRemark;

	private Integer nxDioIndependentGoodsId;

	private NxDepartmentIndependentGoodsEntity nxDepIndependentGoodsEntity;

	private NxDepartmentUserEntity nxDepartmentUserEntity;

	private Boolean isSelected = false ;

	private String nxDioOperationTime;


}
