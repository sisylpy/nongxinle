package com.nongxinle.entity;

/**
 * 
 * @author lpy
 * @date 2020-03-22 18:07:28
 */

import java.io.Serializable;
import java.util.Objects;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter@Getter@ToString

public class NxOrdersSubEntity implements Serializable, Comparable {
	private static final long serialVersionUID = 1L;
	
	/**
	 *  子订单id
	 */
	private Integer nxOrdersSubId;
	/**
	 *  子订单商品id
	 */
	private Integer nxOsNxGoodsId;
	/**
	 *  子订单father商品id
	 */
	private Integer nxOsGoodsFatherId;
	/**
	 *  子订单申请数量
	 */
	private Float nxOsQuantity;
	/**
	 * 子订单申请规格
	 */
	private String nxOsStandard;
	/**
	 *  子订单申请商品单价
	 */
	private Float nxOsPrice;

	/**
	 *  子订单申请备注
	 */
	private String nxOsRemark;
	/**
	 *  子订单申请商品称重
	 */
	private Float nxOsWeight;
	/**
	 *  子订单申请商品小计
	 */
	private Float nxOsSubtotal;
	/**
	 *  子订单申请商品状态
	 */
	private Integer nxOsStatus;
	/**
	 *  子订单商品称重用户id
	 */
	private Integer nxOsWeighUserId;
	/**
	 *  子订单商品输入单价用户id
	 */
	private Integer nxOsAccountUserId;
	/**
	 * 订单id
	 */
	private Integer nxOsOrdersId;

	private Integer nxOsGoodsType;

	/**
	 * shangpin
	 */


	private Integer nxOsDistributerId;

	private Integer nxOsCommunityGoodsId;

	private Integer nxOsBuyStatus;

	private Integer nxOsPurchaseUserId;

	private Integer nxOsOrderUserId;

	private Boolean hasItem;


  	private Float nxOsSubWeight;

  	private Integer nxOsSubSupplierId;

  	private Integer nxOsCommunityId;

  	private Integer nxOsGoodsSellType;

  	private String nxOsGoodsSellStandardScale;

  	private  Integer nxOsCommunityGoodsFatherId;

	private NxCommunityGoodsEntity nxCommunityGoodsEntity;

	private NxCommunityEntity nxCommunityEntity;



	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		NxOrdersSubEntity subEntity = (NxOrdersSubEntity) o;
		return Objects.equals(nxOrdersSubId, subEntity.nxOrdersSubId) &&
				Objects.equals(nxOsNxGoodsId, subEntity.nxOsNxGoodsId) &&
				Objects.equals(nxOsGoodsFatherId, subEntity.nxOsGoodsFatherId) &&
				Objects.equals(nxOsQuantity, subEntity.nxOsQuantity) &&
				Objects.equals(nxOsStandard, subEntity.nxOsStandard) &&
				Objects.equals(nxOsPrice, subEntity.nxOsPrice) &&
				Objects.equals(nxOsRemark, subEntity.nxOsRemark) &&
				Objects.equals(nxOsWeight, subEntity.nxOsWeight) &&
				Objects.equals(nxOsSubtotal, subEntity.nxOsSubtotal) &&
				Objects.equals(nxOsStatus, subEntity.nxOsStatus) &&
				Objects.equals(nxOsWeighUserId, subEntity.nxOsWeighUserId) &&
				Objects.equals(nxOsAccountUserId, subEntity.nxOsAccountUserId) &&
				Objects.equals(nxOsOrdersId, subEntity.nxOsOrdersId) &&
//				Objects.equals(nxGoodsEntity, subEntity.nxGoodsEntity) &&
				Objects.equals(nxCommunityGoodsEntity, subEntity.nxCommunityGoodsEntity) &&
				Objects.equals(nxOsDistributerId, subEntity.nxOsDistributerId) &&
				Objects.equals(nxOsCommunityGoodsId, subEntity.nxOsCommunityGoodsId) &&
				Objects.equals(nxOsBuyStatus, subEntity.nxOsBuyStatus) &&
				Objects.equals(nxOsPurchaseUserId, subEntity.nxOsPurchaseUserId) &&
				Objects.equals(nxOsOrderUserId, subEntity.nxOsOrderUserId) &&
				Objects.equals(hasItem, subEntity.hasItem) &&
				Objects.equals(nxOsSubWeight, subEntity.nxOsSubWeight) &&
				Objects.equals(nxOsSubSupplierId, subEntity.nxOsSubSupplierId) &&
				Objects.equals(nxOsCommunityId, subEntity.nxOsCommunityId);
	}

	@Override
	public int hashCode() {
		return Objects.hash(nxOrdersSubId, nxOsNxGoodsId, nxOsGoodsFatherId, nxOsQuantity, nxOsStandard, nxOsPrice, nxOsRemark, nxOsWeight, nxOsSubtotal, nxOsStatus, nxOsWeighUserId, nxOsAccountUserId, nxOsOrdersId, nxCommunityGoodsEntity, nxOsDistributerId, nxOsCommunityGoodsId, nxOsBuyStatus, nxOsPurchaseUserId, nxOsOrderUserId, hasItem, nxOsSubWeight, nxOsSubSupplierId, nxOsCommunityId);
	}

	@Override
	public int compareTo(Object o) {
		if (o instanceof NxOrdersSubEntity) {
			NxOrdersSubEntity e = (NxOrdersSubEntity) o;

			return this.nxOsCommunityGoodsId.compareTo(e.nxOsCommunityGoodsId);
		}
		return 0;
	}
}
