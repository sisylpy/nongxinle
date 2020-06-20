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

public class NxDepartmentFatherGoodsEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 *  
	 */
	private Integer nxDepartmentFatherGoodsId;
	/**
	 *  
	 */
	private String nxDepFatherGoodsName;
	/**
	 *  
	 */
	private String nxDepFatherGoodsImg;
	/**
	 *  
	 */
	private Integer nxDepFatherGoodsSort;
	/**
	 *  
	 */
	private String nxDepFatherGoodsColor;
	/**
	 *  
	 */
	private Integer nxDepFathersFatherId;
	/**
	 *  
	 */
	private Integer nxDepFatherGoodsLevel;
	/**
	 *  
	 */
	private Integer nxDfgDepartmentId;
	/**
	 *  
	 */
	private Integer nxDfgGoodsAmount;

}
