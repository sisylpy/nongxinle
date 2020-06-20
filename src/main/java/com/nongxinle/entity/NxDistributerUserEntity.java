package com.nongxinle.entity;

/**
 * 
 * @author lpy
 * @date 06-20 10:21
 */

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter@Getter@ToString

public class NxDistributerUserEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 *  批发商用户id
	 */
	private Integer nxDistributerUserId;
	/**
	 *  用户名
	 */
	private String nxDiuWxAvartraUrl;
	/**
	 *  批发商用户社区id
	 */
	private Integer nxDiuDepartmentId;
	/**
	 *  登陆密码
	 */
	private String nxDiuWxNickName;
	/**
	 *  
	 */
	private String nxDiuWxOpenId;
	/**
	 *  
	 */
	private String nxDiuWxPhone;
	/**
	 *  
	 */
	private Integer nxDiuDistributerId;


	private Integer orderAmount;

	List<NxDistributerUserRoleEntity> roleEntities;

}
