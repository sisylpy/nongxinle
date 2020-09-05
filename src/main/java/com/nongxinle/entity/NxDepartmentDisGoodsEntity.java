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
	private Integer nxDdgDisGoodsFatherId;

	/**
	 *  
	 */
	private String nxDdgDepGoodsName;
	/**
	 *  
	 */
	private String nxDdgDepGoodsPinyin;
	/**
	 *  
	 */
	private String nxDdgDepGoodsPy;
	/**
	 *  
	 */
	private Integer nxDdgDepGoodsSort;
	/**
	 *  
	 */
	private String nxDdgDepGoodsStandardname;
	/**
	 *  
	 */
	private String nxDdgDepGoodsDetail;
	private String nxDdgDepGoodsBrand;
	private String nxDdgDepGoodsPlace;
	/**
	 *  
	 */

	private Integer isDownload;


	private List<NxDepartmentStandardEntity> nxDepStandardEntities;

	private NxDistributerGoodsEntity nxDistributerGoodsEntity;

}
