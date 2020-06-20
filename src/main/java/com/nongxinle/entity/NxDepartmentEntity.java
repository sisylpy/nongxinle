package com.nongxinle.entity;

/**
 * 
 * @author lpy
 * @date 06-16 11:26
 */

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter@Getter@ToString

public class NxDepartmentEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 *  订货部门id
	 */
	private Integer nxDepartmentId;
	/**
	 *  订货部门名称
	 */
	private String nxDepartmentName;
	/**
	 *  订货部门上级id
	 */
	private Integer nxDepartmentFatherId;
	/**
	 *  订货部门类型
	 */
	private Integer nxDepartmentType;
	/**
	 *  订货部门子部门数量
	 */
	private Integer nxDepartmentSubAmount;


	private Integer nxDepUserId;

	private Integer nxDepartmentDisId;
	
	private List<NxDepartmentUserEntity>  nxDepartmentUserEntities;

	private List<NxDepartmentEntity> nxDepartmentEntities;
	

}
