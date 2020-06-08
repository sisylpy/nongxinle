package com.nongxinle.entity;

/**
 * 
 * @author lpy
 * @date 2020-02-10 19:43:11
 */

import java.io.Serializable;
import java.util.List;
import java.util.Objects;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter@Getter@ToString

public class NxCommunityGoodsEntity implements Serializable, Comparable {
	private static final long serialVersionUID = 1L;


	/**
	 *  批发商商品id
	 */
	private Integer nxCommunityGoodsId;
	/**
	 *  批发商id
	 */
	private Integer nxCgDistributeId;

	/**
	 * 社区id
	 */
	private Integer nxCgCommunityId;



	/**
	 *  商品状态
	 */
	private Integer nxCgGoodsStatus;

	/**
	 *  是否称重
	 */
	private Integer nxCgGoodsIsWeight;
	/**
	 * 价格
	 */
	private Float nxCgGoodsPrice;
	/**
	 * 价格小数点
	 */
	private Integer nxCgGoodsPriceDecimal;

	private String nxCgNxGoodsFilePath;
	private Integer nxCgGoodsSellType;

	private Integer nxCgCfGoodsFatherId;


	/**
	 *  商品id
	 */
	private Integer nxCgNxGoodsId;
	/**
	 * 父类id
	 */
	private Integer nxCgNxGoodsFatherId;
	private String nxCgNxGoodsFatherName;
	/**
	 * image
	 */
	private String nxCgNxGoodsFatherImg;
	private Integer nxCgGoodsTotalHits;
	/**
	 *  采购数量
	 */
	private String nxCgPurchaseQuantity;

	private Integer nxCgGoodsBuyType;
	private Integer nxCgBuyPurchaseUserId;

	private Integer nxCgBuyAppId;

	private Integer nxCgBuyStatus;

	private Integer nxCgSupplierId;
	private String nxCgBuyingPrice;
	private Integer nxCgGoodsType;

	private String nxCgGoodsName;

	private String nxCgGoodsDetail;

	private String nxCgGoodsStandardname;

	private String nxCgGoodsStock;

	private String nxCgGoodsPinyin;

	private String nxCgGoodsPy;


	////////






	/**
	 * 订货规格组
	 */
	List<NxStandardEntity> dgStandardList;




	private NxGoodsEntity nxGoodsEntity;


	private Boolean isSelected;



	private Integer nxCgGrandFatherId;

	private String nxCgGrandFatherName;

	private Integer nxCgGreatGrandFatherId;

	private String nxCgGreatGrandFatherName;







	private NxCommunityEntity nxCommunityEntity;

	private NxSupplierEntity nxSupplierEntity;

	private List<NxCommunityStandardEntity> nxCommunityStandardEntities;


	private List<NxOrdersSubEntity> nxOrdersSubEntities;

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		NxCommunityGoodsEntity that = (NxCommunityGoodsEntity) o;
		return Objects.equals(nxCommunityGoodsId, that.nxCommunityGoodsId) &&
				Objects.equals(nxCgDistributeId, that.nxCgDistributeId) &&
				Objects.equals(nxCgCommunityId, that.nxCgCommunityId) &&
				Objects.equals(nxCgGoodsStatus, that.nxCgGoodsStatus) &&
				Objects.equals(nxCgGoodsIsWeight, that.nxCgGoodsIsWeight) &&
				Objects.equals(nxCgGoodsPrice, that.nxCgGoodsPrice) &&
				Objects.equals(nxCgGoodsPriceDecimal, that.nxCgGoodsPriceDecimal) &&
				Objects.equals(nxCgNxGoodsFilePath, that.nxCgNxGoodsFilePath) &&
				Objects.equals(nxCgGoodsSellType, that.nxCgGoodsSellType) &&
				Objects.equals(nxCgCfGoodsFatherId, that.nxCgCfGoodsFatherId) &&
				Objects.equals(nxCgNxGoodsId, that.nxCgNxGoodsId) &&
				Objects.equals(nxCgNxGoodsFatherId, that.nxCgNxGoodsFatherId) &&
				Objects.equals(nxCgNxGoodsFatherName, that.nxCgNxGoodsFatherName) &&
				Objects.equals(nxCgNxGoodsFatherImg, that.nxCgNxGoodsFatherImg) &&
				Objects.equals(nxCgGoodsTotalHits, that.nxCgGoodsTotalHits) &&
				Objects.equals(nxCgPurchaseQuantity, that.nxCgPurchaseQuantity) &&
				Objects.equals(nxCgGoodsBuyType, that.nxCgGoodsBuyType) &&
				Objects.equals(nxCgBuyPurchaseUserId, that.nxCgBuyPurchaseUserId) &&
				Objects.equals(nxCgBuyAppId, that.nxCgBuyAppId) &&
				Objects.equals(nxCgBuyStatus, that.nxCgBuyStatus) &&
				Objects.equals(nxCgSupplierId, that.nxCgSupplierId) &&
				Objects.equals(nxCgBuyingPrice, that.nxCgBuyingPrice) &&
				Objects.equals(nxCgGoodsType, that.nxCgGoodsType) &&
				Objects.equals(nxCgGoodsName, that.nxCgGoodsName) &&
				Objects.equals(nxCgGoodsDetail, that.nxCgGoodsDetail) &&
				Objects.equals(nxCgGoodsStandardname, that.nxCgGoodsStandardname) &&
				Objects.equals(nxCgGoodsStock, that.nxCgGoodsStock) &&
				Objects.equals(nxCgGoodsPinyin, that.nxCgGoodsPinyin) &&
				Objects.equals(nxCgGoodsPy, that.nxCgGoodsPy) &&
				Objects.equals(dgStandardList, that.dgStandardList) &&
				Objects.equals(nxGoodsEntity, that.nxGoodsEntity) &&
				Objects.equals(isSelected, that.isSelected) &&
				Objects.equals(nxCgGrandFatherId, that.nxCgGrandFatherId) &&
				Objects.equals(nxCgGrandFatherName, that.nxCgGrandFatherName) &&
				Objects.equals(nxCgGreatGrandFatherId, that.nxCgGreatGrandFatherId) &&
				Objects.equals(nxCgGreatGrandFatherName, that.nxCgGreatGrandFatherName) &&
				Objects.equals(nxCommunityEntity, that.nxCommunityEntity) &&
				Objects.equals(nxSupplierEntity, that.nxSupplierEntity) &&
				Objects.equals(nxCommunityStandardEntities, that.nxCommunityStandardEntities) &&
				Objects.equals(nxOrdersSubEntities, that.nxOrdersSubEntities);
	}

	@Override
	public int hashCode() {
		return Objects.hash(nxCommunityGoodsId, nxCgDistributeId, nxCgCommunityId, nxCgGoodsStatus, nxCgGoodsIsWeight, nxCgGoodsPrice, nxCgGoodsPriceDecimal, nxCgNxGoodsFilePath, nxCgGoodsSellType, nxCgCfGoodsFatherId, nxCgNxGoodsId, nxCgNxGoodsFatherId, nxCgNxGoodsFatherName, nxCgNxGoodsFatherImg, nxCgGoodsTotalHits, nxCgPurchaseQuantity, nxCgGoodsBuyType, nxCgBuyPurchaseUserId, nxCgBuyAppId, nxCgBuyStatus, nxCgSupplierId, nxCgBuyingPrice, nxCgGoodsType, nxCgGoodsName, nxCgGoodsDetail, nxCgGoodsStandardname, nxCgGoodsStock, nxCgGoodsPinyin, nxCgGoodsPy, dgStandardList, nxGoodsEntity, isSelected, nxCgGrandFatherId, nxCgGrandFatherName, nxCgGreatGrandFatherId, nxCgGreatGrandFatherName, nxCommunityEntity, nxSupplierEntity, nxCommunityStandardEntities, nxOrdersSubEntities);
	}

	@Override
	public int compareTo(Object o) {
		if (o instanceof NxCommunityGoodsEntity) {
			NxCommunityGoodsEntity e = (NxCommunityGoodsEntity) o;
			return this.nxCommunityGoodsId.compareTo(e.nxCommunityGoodsId);
		}
		return 0;
	}
}
