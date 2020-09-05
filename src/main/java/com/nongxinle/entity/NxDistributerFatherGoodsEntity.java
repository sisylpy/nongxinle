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
import java.util.TreeSet;

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
	private String nxDfgFatherGoodsName;
	/**
	 *  
	 */
	private String nxDfgFatherGoodsImg;
	/**
	 *  
	 */
	private Integer nxDfgFatherGoodsSort;
	/**
	 *  
	 */
	private String nxDfgFatherGoodsColor;
	/**
	 *  
	 */
	private Integer nxDfgFathersFatherId;
	/**
	 *  
	 */
	private Integer nxDfgFatherGoodsLevel;
	/**
	 *  
	 */
	private Integer nxDfgDistributerId;

	List<NxDistributerFatherGoodsEntity> fatherGoodsEntities;
	TreeSet<NxDistributerFatherGoodsEntity> treeSet;
	List<NxDistributerGoodsEntity> nxDistributerGoodsEntities;

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		NxDistributerFatherGoodsEntity that = (NxDistributerFatherGoodsEntity) o;
		return Objects.equals(nxDistributerFatherGoodsId, that.nxDistributerFatherGoodsId);
	}

	@Override
	public int hashCode() {
		return Objects.hash(nxDistributerFatherGoodsId, nxDfgFatherGoodsName, nxDfgFatherGoodsImg, nxDfgFatherGoodsSort, nxDfgFatherGoodsColor, nxDfgFathersFatherId, nxDfgFatherGoodsLevel, nxDfgDistributerId, nxDfgGoodsAmount);
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
