package com.nongxinle.entity;

/**
 * 
 * @author lpy
 * @date 2020-02-10 19:43:11
 */

import java.io.Serializable;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter@Getter@ToString

public class NxApplysEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 *  申请id
	 */
	private Integer nxApplysId;
	/**
	 *  申请客户id
	 */
	private Integer nxApplyCustomerId;
	/**
	 *  申请用户id
	 */
	private Integer nxApplyUserId;
	/**
	 *  批发商id
	 */
	private Integer nxApplyDistributerId;
	/**
	 *  申请商品id
	 */
	private Integer nxApplyGoodsId;
	/**
	 *  申请数量
	 */
	private Float nxApplyQuantity;
	/**
	 *  申请日期
	 */
	private String nxApplyDate;
	/**
	 *  申请状态
	 */
	private Integer nxApplyStatus;
	/**
	 *  申请备注
	 */
	private Integer nxApplyRemark;
	/**
	 *  申请数量
	 */
	private Float nxApplyWeight;
	/**
	 *  商品单价
	 */
	private Float nxApplyPrice;
	/**
	 *  小计
	 */
	private Float nxApplySubtotal;
	/**
	 *  称重用户id
	 */
	private Integer nxWeighUserId;
	/**
	 *  输入单价用户id
	 */
	private Integer nxAccountUserId;
	/**
	 *  账单id
	 */
	private Integer nxBillId;

}
