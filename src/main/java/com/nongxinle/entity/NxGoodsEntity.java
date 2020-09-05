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

public class NxGoodsEntity implements Serializable, Comparable {
	private static final long serialVersionUID = 1L;
	
	/**
	 *  商品id
	 */
	private Integer nxGoodsId;
	/**
	 *  商品名称
	 */
	private String nxGoodsName;
	/**
	 *  商品规格
	 */
	private String nxGoodsStandardname;
	/**
	 *  商品品牌
	 */
	private String nxGoodsBrand;
	/**
	 *  商品产地
	 */
	private String nxGoodsPlace;
	/**
	 *  拼音
	 */
	private String nxGoodsPinyin;
	/**
	 *  简拼
	 */
	private String nxGoodsPy;
	/**
	 *  父级id
	 */
	private Integer nxGoodsFatherId;
	/**
	 *  商品排序
	 */
	private Integer nxGoodsSort;

	/**
	 * lujing
	 */
	private String nxGoodsFile;

	/**
	 * yanse
	 */
	private String  color;

	/**
	 * zigoods
	 */
	private List<NxGoodsEntity> nxGoodsEntityList;

	private List<NxDistributerStandardEntity> nxDisStandardEntities;
	private List<NxDepartmentStandardEntity> nxDepStandardEntities;
	private NxDistributerFatherGoodsEntity nxDistributerFatherGoodsEntity;

	/**
	 * 子名称
	 */
	private String nxGoodsSubNames;

	/**
	 * isDown
	 */
	private  Integer isDownload;

	private Integer nxDepartmentGoodsId;
	private String  nxDepartmentGoodsPrice;


	private List<NxStandardEntity> nxGoodsStandardEntities;

	private String nxGoodsDetail;

	private NxGoodsEntity fatherGoods;

	private NxGoodsEntity grandGoods;

	private NxGoodsEntity greatGrandGoods;

	private Integer nxGoodsStandardAmount;

	private Integer subAmount;

	private NxDistributerGoodsEntity nxDistributerGoodsEntity;

	private NxDepartmentDisGoodsEntity nxDepartmentDisGoodsEntity;

	private Boolean isShow = false;


	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		NxGoodsEntity that = (NxGoodsEntity) o;
		return Objects.equals(nxGoodsId, that.nxGoodsId) &&
				Objects.equals(nxGoodsName, that.nxGoodsName) &&
				Objects.equals(nxGoodsStandardname, that.nxGoodsStandardname) &&
				Objects.equals(nxGoodsBrand, that.nxGoodsBrand) &&
				Objects.equals(nxGoodsPlace, that.nxGoodsPlace) &&
				Objects.equals(nxGoodsPinyin, that.nxGoodsPinyin) &&
				Objects.equals(nxGoodsPy, that.nxGoodsPy) &&
				Objects.equals(nxGoodsFatherId, that.nxGoodsFatherId) &&
				Objects.equals(nxGoodsSort, that.nxGoodsSort) &&
				Objects.equals(nxGoodsFile, that.nxGoodsFile) &&
				Objects.equals(color, that.color) &&
				Objects.equals(nxGoodsEntityList, that.nxGoodsEntityList) &&
				Objects.equals(nxDisStandardEntities, that.nxDisStandardEntities) &&
				Objects.equals(nxGoodsSubNames, that.nxGoodsSubNames) &&
				Objects.equals(isDownload, that.isDownload) &&
				Objects.equals(nxDepartmentGoodsId, that.nxDepartmentGoodsId) &&
				Objects.equals(nxDepartmentGoodsPrice, that.nxDepartmentGoodsPrice) &&
				Objects.equals(nxGoodsStandardEntities, that.nxGoodsStandardEntities) &&
				Objects.equals(nxGoodsDetail, that.nxGoodsDetail) &&
				Objects.equals(fatherGoods, that.fatherGoods) &&
				Objects.equals(grandGoods, that.grandGoods) &&
				Objects.equals(greatGrandGoods, that.greatGrandGoods) &&
				Objects.equals(nxGoodsStandardAmount, that.nxGoodsStandardAmount) &&
				Objects.equals(subAmount, that.subAmount);
	}

	@Override
	public int hashCode() {
		return Objects.hash(nxGoodsId, nxGoodsName, nxGoodsStandardname, nxGoodsBrand, nxGoodsPlace, nxGoodsPinyin, nxGoodsPy, nxGoodsFatherId, nxGoodsSort, nxGoodsFile, color, nxGoodsEntityList, nxDisStandardEntities, nxGoodsSubNames, isDownload, nxDepartmentGoodsId, nxDepartmentGoodsPrice, nxGoodsStandardEntities, nxGoodsDetail, fatherGoods, grandGoods, greatGrandGoods, nxGoodsStandardAmount, subAmount);
	}

	@Override
	public int compareTo(Object o) {
		if (o instanceof NxGoodsEntity) {
			NxGoodsEntity e = (NxGoodsEntity) o;
			return this.nxGoodsId.compareTo(e.nxGoodsId);
		}
		return 0;
	}
}
