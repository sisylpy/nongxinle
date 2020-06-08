package com.nongxinle.entity;

/**
 * 
 * @author lpy
 * @date 2020-03-22 18:07:28
 */

import java.io.Serializable;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter@Getter@ToString

public class NxOrdersEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 *  订单id
	 */
	private Integer nxOrdersId;
	/**
	 *  订单客户id
	 */
	private Integer nxOrdersCustomerId;
	/**
	 *  订单用户id
	 */
	private Integer nxOrdersUserId;
	/**
	 *  批发商id
	 */
	private Integer nxOrdersDistributerId;
	/**
	 *  订单日期
	 */
	private String nxOrdersDate;
	/**
	 *  订单状态
	 */
	private Integer nxOrdersStatus;
	/**
	 *  订单送达
	 */
	private String nxOrdersService;
	/**
	 *  订单送达riqi
	 */
	private String nxOrdersServiceDate;
	/**
	 *  订单送达时间
	 */
	private String nxOrdersServiceTime;

	/**
	 *  订单总金额
	 */
	private Float nxOrdersAmount;

	private int nxWxOrdersTotalFee;

	/**
	 * zidingdan
	 */
	private List<NxOrdersSubEntity> nxOrdersSubEntities;

	/**
	 * kehu
	 */
	private NxCustomerEntity nxCustomerEntity;

	private Boolean isSelected;

	private Integer nxOrdersWeighUserId;

	private Integer nxOrdersSubAmount;

	private Integer nxOrdersSubFinished;

	private Integer nxOrdersPaymentStatus;

	private String nxOrdersPaymentSendTime;

	private String nxOrdersPaymentTime;

	private Integer nxOrdersDeliveryUserId;

	private Integer nxOrdersDepartmentId;

	private Integer nxOrdersType;

	private  Integer nxOrdersCommunityId;
}
