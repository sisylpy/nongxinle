package com.nongxinle.entity;

/**
 * 
 * @author lpy
 * @date 2020-02-10 19:43:11
 */

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter@Getter@ToString

public class NxDistributerUserEntity implements Serializable, Comparable {
	private static final long serialVersionUID = 1L;
	
	/**
	 *  批发商用户id
	 */
	private Integer nxDistributerUserId;
	/**
	 *  批发商用户微信昵称
	 */
	private String nxDuWxNickName;
	/**
	 *
	 */
	private String nxDuWxAvatarUrl;
	/**
	 *
	 */
	private Integer nxDuWxGender;
	/**
	 *
	 */

	private String nxDuWxOpenId;

	/**
	 *
	 */
	private Integer nxDuDistributerId;


	/**
	 * 批发商用户角色
	 */
	List<NxDisUserRoleEntity> roleEntities;

	/**
	 * order number
	 */
	private Integer orderAmount;

	private String duUserShortName;

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		NxDistributerUserEntity that = (NxDistributerUserEntity) o;
		return Objects.equals(nxDistributerUserId, that.nxDistributerUserId) &&
				Objects.equals(nxDuWxNickName, that.nxDuWxNickName) &&
				Objects.equals(nxDuWxAvatarUrl, that.nxDuWxAvatarUrl) &&
				Objects.equals(nxDuWxGender, that.nxDuWxGender) &&
				Objects.equals(nxDuWxOpenId, that.nxDuWxOpenId) &&
				Objects.equals(nxDuDistributerId, that.nxDuDistributerId) &&
				Objects.equals(roleEntities, that.roleEntities) &&
				Objects.equals(orderAmount, that.orderAmount) &&
				Objects.equals(duUserShortName, that.duUserShortName);
	}

	@Override
	public int hashCode() {
		return Objects.hash(nxDistributerUserId, nxDuWxNickName, nxDuWxAvatarUrl, nxDuWxGender, nxDuWxOpenId, nxDuDistributerId, roleEntities, orderAmount, duUserShortName);
	}

	@Override
	public int compareTo(Object o) {
		if (o instanceof NxDistributerUserEntity) {
			NxDistributerUserEntity e = (NxDistributerUserEntity) o;
			return this.nxDistributerUserId.compareTo(e.nxDistributerUserId);
		}
		return 0;
	}



}
