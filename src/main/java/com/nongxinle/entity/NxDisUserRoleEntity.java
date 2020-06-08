package com.nongxinle.entity;

/**
 * 用户与角色对应关系
 * @author lpy
 * @date 2020-03-23 13:42:33
 */

import java.io.Serializable;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter@Getter@ToString

public class NxDisUserRoleEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 *  
	 */
	private Integer id;
	/**
	 *  用户ID
	 */
	private Integer userId;
	/**
	 *  角色ID
	 */
	private Integer roleId;


}
