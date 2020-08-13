package com.nongxinle.entity;

/**
 * 
 * @author lpy
 * @date 07-27 17:38
 */

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter@Getter@ToString

public class NxDistributerFatherGoodsEntity implements Serializable , Comparable{
	private static final long serialVersionUID = 1L;
	
	/**
	 *  
	 */
	private Integer nxDistributerFatherGoodsId;
	/**
	 *  
	 */
	private String nxDfFatherGoodsName;
	/**
	 *  
	 */
	private String nxDfFatherGoodsImg;
	/**
	 *  
	 */
	private Integer nxDfFatherGoodsSort;
	/**
	 *  
	 */
	private String nxDfFatherGoodsColor;
	/**
	 *  
	 */
	private Integer nxDfFathersFatherId;
	/**
	 *  
	 */
	private Integer nxDfFatherGoodsLevel;
	/**
	 *  
	 */
	private Integer nxDfgDistributerId;

	List<NxDistributerFatherGoodsEntity> fatherGoodsEntities;

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		NxDistributerFatherGoodsEntity that = (NxDistributerFatherGoodsEntity) o;
		return Objects.equals(nxDistributerFatherGoodsId, that.nxDistributerFatherGoodsId) &&
				Objects.equals(nxDfFatherGoodsName, that.nxDfFatherGoodsName) &&
				Objects.equals(nxDfFatherGoodsImg, that.nxDfFatherGoodsImg) &&
				Objects.equals(nxDfFatherGoodsSort, that.nxDfFatherGoodsSort) &&
				Objects.equals(nxDfFatherGoodsColor, that.nxDfFatherGoodsColor) &&
				Objects.equals(nxDfFathersFatherId, that.nxDfFathersFatherId) &&
				Objects.equals(nxDfFatherGoodsLevel, that.nxDfFatherGoodsLevel) &&
				Objects.equals(nxDfgDistributerId, that.nxDfgDistributerId) &&
				Objects.equals(nxDfgGoodsAmount, that.nxDfgGoodsAmount);
	}

	@Override
	public int hashCode() {
		return Objects.hash(nxDistributerFatherGoodsId, nxDfFatherGoodsName, nxDfFatherGoodsImg, nxDfFatherGoodsSort, nxDfFatherGoodsColor, nxDfFathersFatherId, nxDfFatherGoodsLevel, nxDfgDistributerId, nxDfgGoodsAmount);
	}

	/**
	 *  
	 */
	private Integer nxDfgGoodsAmount;

	@Override
	public int compareTo(Object o) {
		if (o instanceof NxDistributerFatherGoodsEntity) {
			NxDistributerFatherGoodsEntity e = (NxDistributerFatherGoodsEntity) o;
			return this.nxDistributerFatherGoodsId.compareTo(e.nxDistributerFatherGoodsId);
		}
		return 0;
	}
}
