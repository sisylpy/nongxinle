package com.nongxinle.entity;

/**
 * 
 * @author lpy
 * @date 05-11 11:26
 */

import java.io.Serializable;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter@Getter@ToString

public class NxSupplierEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 *  供货商id
	 */
	private Integer nxSupplierId;
	/**
	 *  供货商名称
	 */
	private String nxSupplierName;
	/**
	 *  供货商商品类别id
	 */
	private Integer nxSupplierFatherGoodsId;
	/**
	 *  供货商结算类别1现金，2记账
	 */
	private Integer nxSupplierPaymentType;
	/**
	 *  供货商加入时间
	 */
	private String nxSupplierDate;

}
