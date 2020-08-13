package com.nongxinle.entity;

/**
 * 
 * @author lpy
 * @date 07-30 23:58
 */

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter@Getter@ToString

public class NxDepartmentDisGoodsEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 *  
	 */
	private Integer nxDepartmentDisGoodsId;
	/**
	 *  
	 */
	private Integer nxDdgDepartmentFatherId;
	/**
	 *  
	 */
	private Integer nxDdgDepartmentId;
	/**
	 *  
	 */
	private Integer nxDdgDisGoodsId;
	/**
	 *  
	 */
	private Integer nxDdgNxGoodsId;
	private String nxDdgNxGoodsName;
	/**
	 *  
	 */
	private String nxDdgNxGoodsPinyin;
	/**
	 *  
	 */
	private String nxDdgNxGoodsPy;
	/**
	 *  
	 */
	private Integer nxDdgNxGoodsSort;
	/**
	 *  
	 */
	private String nxDdgNxGoodsStandardname;
	/**
	 *  
	 */
	private String nxDdgNxGoodsDetail;
	/**
	 *  
	 */
	private Integer nxDdgAlarmRate;

	private Integer isDownload;

	private Integer nxDdgDisGoodsFatherId;

	private List<NxDepartmentStandardEntity> nxDepStandardEntities;

}
