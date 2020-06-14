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
	 *
	 */
	private Integer nxDuDistributerId;

	private Integer nxDuCommunityId;

	private String nxDuUserShortName;


	/**
	 * 批发商用户角色
	 */
	List<NxDisUserRoleEntity> roleEntities;

	/**
	 * order number
	 */
	private Integer orderAmount;


	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		NxDistributerUserEntity that = (NxDistributerUserEntity) o;
		return Objects.equals(nxDistributerUserId, that.nxDistributerUserId) &&
				Objects.equals(nxDuDistributerId, that.nxDuDistributerId) &&
				Objects.equals(roleEntities, that.roleEntities) &&
				Objects.equals(orderAmount, that.orderAmount) &&
				Objects.equals(nxDuUserShortName, that.nxDuUserShortName);
	}

	@Override
	public int hashCode() {
		return Objects.hash(nxDistributerUserId, nxDuDistributerId, roleEntities, orderAmount, nxDuUserShortName);
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
