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

public class NxDistributerSupplierEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 *  批发商供货商id
	 */
	private Integer nxDistributerSupplierId;
	/**
	 *  批发商id
	 */
	private Integer nxDsDistributerId;
	/**
	 *  供货商id
	 */
	private Integer nxDsSupplierId;

	private NxSupplierEntity nxSupplierEntity;

}
