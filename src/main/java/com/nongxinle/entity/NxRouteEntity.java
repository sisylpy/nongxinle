package com.nongxinle.entity;

/**
 * 
 * @author lpy
 * @date 03-27 00:53
 */

import java.io.Serializable;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter@Getter@ToString

public class NxRouteEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 *  线路id
	 */
	private Integer nxRouteId;
	/**
	 *  线路名称
	 */
	private String nxRouteName;

}
