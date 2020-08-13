package com.nongxinle.entity;

/**
 * 
 * @author lpy
 * @date 07-24 13:00
 */

import java.io.Serializable;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter@Getter@ToString

public class NxDepartmentNxGoodsEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 *  
	 */
	private Integer nxDepartmentNxGoodsId;
	/**
	 *  
	 */
	private Integer nxDngDepartmentFatherId;
	/**
	 *  
	 */
	private Integer nxDngDepartmentId;
	/**
	 *  
	 */
	private Integer nxDngNxGoodsId;
	/**
	 *  
	 */
	private String nxDngNxGoodsName;
	/**
	 *  
	 */
	private String nxDngNxGoodsPinyin;
	/**
	 *  
	 */
	private String nxDngNxGoodsPy;
	/**
	 *  
	 */
	private Integer nxDngNxGoodsSort;
	/**
	 *  
	 */
	private String nxDngNxGoodsStandardname;
	/**
	 *  
	 */
	private String nxDngNxGoodsDetail;
	/**
	 *  
	 */
	private Integer nxDngAlarmRate;

}
