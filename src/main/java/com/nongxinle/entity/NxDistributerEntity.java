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

public class NxDistributerEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 *  批发商id
	 */
	private Integer nxDistributerId;
	/**
	 *  批发商名称
	 */
	private String nxDistributerName;
	/**
	 *  批发商位置经度
	 */
	private String nxDistributerLan;
	/**
	 *  批发商位置纬度
	 */
	private String nxDistributerLun;
	/**
	 *  批发商商业类型
	 */
	private Integer nxDistributerBusinessType;

}
