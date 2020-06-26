package com.nongxinle.entity;

/**
 * 
 * @author lpy
 * @date 2020-02-24 17:06:57
 */

import java.io.Serializable;
import java.util.List;
import java.util.Objects;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter@Getter@ToString

public class NxCommunityFatherGoodsEntity implements Serializable, Comparable  {
	private static final long serialVersionUID = 1L;
	
	/**
	 *  
	 */
	private Integer nxCommunityFatherGoodsId;

	private String nxFatherGoodsName;

	private String nxFatherGoodsImg;

	private Integer nxFatherGoodsSort;

	private String nxFatherGoodsColor;

	private Integer nxFathersFatherId;

	private Integer nxFatherGoodsLevel;

	private Integer nxCfgCommunityId;

	private Integer nxCfgGoodsAmount;


	private List<NxCommunityPromoteEntity> nxPromoteEntities;

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		NxCommunityFatherGoodsEntity that = (NxCommunityFatherGoodsEntity) o;
		return Objects.equals(nxCommunityFatherGoodsId, that.nxCommunityFatherGoodsId) &&
				Objects.equals(nxFatherGoodsName, that.nxFatherGoodsName) &&
				Objects.equals(nxFatherGoodsImg, that.nxFatherGoodsImg) &&
				Objects.equals(nxFatherGoodsSort, that.nxFatherGoodsSort) &&
				Objects.equals(nxFatherGoodsColor, that.nxFatherGoodsColor) &&
				Objects.equals(nxFathersFatherId, that.nxFathersFatherId) &&
				Objects.equals(nxFatherGoodsLevel, that.nxFatherGoodsLevel) &&
				Objects.equals(nxCfgCommunityId, that.nxCfgCommunityId) &&
				Objects.equals(nxCfgGoodsAmount, that.nxCfgGoodsAmount) &&
				Objects.equals(nxPromoteEntities, that.nxPromoteEntities);
	}

	@Override
	public int hashCode() {
		return Objects.hash(nxCommunityFatherGoodsId, nxFatherGoodsName, nxFatherGoodsImg, nxFatherGoodsSort, nxFatherGoodsColor, nxFathersFatherId, nxFatherGoodsLevel, nxCfgCommunityId, nxCfgGoodsAmount, nxPromoteEntities);
	}

	@Override
	public int compareTo(Object o) {
		if (o instanceof NxCommunityOrdersSubEntity) {
			NxCommunityFatherGoodsEntity e = (NxCommunityFatherGoodsEntity) o;

			return this.nxCommunityFatherGoodsId.compareTo(e.nxCommunityFatherGoodsId);
		}
		return 0;	}
}
