package com.nongxinle.service.impl;

import com.alibaba.fastjson.JSON;
import com.nongxinle.dao.*;
import com.nongxinle.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

import com.nongxinle.service.NxCommunityOrdersService;

import static com.nongxinle.utils.DateUtils.formatWhatDay;
import static com.nongxinle.utils.DateUtils.formatWhatDayTime;


@Service("nxOrdersService")
public class NxCommunityCommunityOrdersServiceImpl implements NxCommunityOrdersService {
	@Autowired
	private NxCommunityOrdersDao nxCommunityOrdersDao;

	@Autowired
	private NxCommunityOrdersSubDao nxCommunityOrdersSubDao;

	@Autowired
	private NxDistributerUserDao nxDistributerUserDao;

	@Autowired
	private NxCustomerUserGoodsDao nxCustomerUserGoodsDao;

	@Autowired
	private NxCommunityGoodsDao nxCommunityGoodsDao;

	@Override
	public NxCommunityOrdersEntity queryObject(Integer nxOrdersId){
		return nxCommunityOrdersDao.queryObject(nxOrdersId);
	}
	
	@Override
	public List<NxCommunityOrdersEntity> queryList(Map<String, Object> map){
		return nxCommunityOrdersDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return nxCommunityOrdersDao.queryTotal(map);
	}

	@Override
	public void save(NxCommunityOrdersEntity nxOrders){
		nxOrders.setNxCoSubFinished(0);

		nxCommunityOrdersDao.save(nxOrders);
		Integer ordersUserId = nxOrders.getNxCoUserId();

		Integer nxOrdersId = nxOrders.getNxCommunityOrdersId();
		List<NxCommunityOrdersSubEntity> nxOrdersSubEntities = nxOrders.getNxOrdersSubEntities();

		for (NxCommunityOrdersSubEntity sub : nxOrdersSubEntities) {
			//子订单
			sub.setNxCosOrdersId(nxOrdersId);
			sub.setNxCosStatus(0);
			sub.setNxCosBuyStatus(0);
			sub.setNxCosOrderUserId(ordersUserId);
			sub.setNxCosDistributerId(nxOrders.getNxCoDistributerId());
			sub.setNxCosCommunityId(nxOrders.getNxCoCommunityId());
			nxCommunityOrdersSubDao.save(sub);


			//客户用户记录更新
			Integer nxOsCommunityGoodsId = sub.getNxCosCommunityGoodsId();
			Map<String, Object> map = new HashMap<>();
			map.put("nxOsCommunityGoodsId", nxOsCommunityGoodsId);
			map.put("nxCugUserId", ordersUserId);
			NxCustomerUserGoodsEntity userGoodsEntity = nxCustomerUserGoodsDao.queryByCommunityGoodsId(map);



			if(userGoodsEntity != null){
				userGoodsEntity.setNxCugLastOrderTime(formatWhatDayTime(0));
				userGoodsEntity.setNxCugLastOrderQuantity(sub.getNxCosQuantity());
				userGoodsEntity.setNxCugLastOrderStandard(sub.getNxCosStandard());
				userGoodsEntity.setNxCugLastOrderTime(formatWhatDay(0));
				userGoodsEntity.setNxCugJoinMyTemplate(0);
				Integer nxCugOrderTimes = userGoodsEntity.getNxCugOrderTimes();
				userGoodsEntity.setNxCugOrderTimes(nxCugOrderTimes + 1);
				Float nxCugOrderAmount = userGoodsEntity.getNxCugOrderAmount();
				Float nxOsQuantity = sub.getNxCosQuantity();
				userGoodsEntity.setNxCugOrderAmount(nxCugOrderAmount + nxOsQuantity);
				nxCustomerUserGoodsDao.update(userGoodsEntity);
			}else {
				NxCustomerUserGoodsEntity newUserGoodsEntity = new NxCustomerUserGoodsEntity();
				newUserGoodsEntity.setNxCugFirstOrderTime(formatWhatDay(0));
				newUserGoodsEntity.setNxCugOrderAmount(sub.getNxCosQuantity());
				newUserGoodsEntity.setNxCugCommunityGoodsId(sub.getNxCosCommunityGoodsId());
				newUserGoodsEntity.setNxCugOrderTimes(1);
				newUserGoodsEntity.setNxCugUserId(ordersUserId);
				newUserGoodsEntity.setNxCugLastOrderTime(formatWhatDay(0));
				newUserGoodsEntity.setNxCugJoinMyTemplate(0);
				newUserGoodsEntity.setNxCugLastOrderQuantity(sub.getNxCosQuantity());
				newUserGoodsEntity.setNxCugLastOrderStandard(sub.getNxCosStandard());
				nxCustomerUserGoodsDao.save(newUserGoodsEntity);


			}

			//商品点击数加1
			NxCommunityGoodsEntity disGoods = nxCommunityGoodsDao.queryObject(nxOsCommunityGoodsId);
			disGoods.setNxCgGoodsTotalHits(disGoods.getNxCgGoodsTotalHits() + 1);

		}

	}


	
	@Override
	public void update(NxCommunityOrdersEntity nxOrders){

		nxCommunityOrdersDao.update(nxOrders);
	}
	
	@Override
	public void delete(Integer nxOrdersId){
		nxCommunityOrdersDao.delete(nxOrdersId);

		Map<String, Object> map = new HashMap<>();
		map.put("nxOrdersId", nxOrdersId);
		List<NxCommunityOrdersSubEntity> subEntities =  nxCommunityOrdersSubDao.queryListByOrderId(map);
		for (NxCommunityOrdersSubEntity sub :
				subEntities) {
			nxCommunityOrdersSubDao.delete(sub.getNxCommunityOrdersSubId());

		}



	}
	
	@Override
	public void deleteBatch(Integer[] nxOrdersIds){
		nxCommunityOrdersDao.deleteBatch(nxOrdersIds);
	}

    @Override
    public List<NxCommunityOrdersEntity> queryOrders(Map<String, Object> map) {
        return nxCommunityOrdersDao.queryOrders(map);
    }

	@Override
	public Map<String, Object> queryDistributerIndexData(Integer disId) {

		List<NxDistributerUserEntity> listWeigh = new ArrayList<>();
		List<NxDistributerUserEntity> listPurchase = new ArrayList<>();

		Map<String,Object> mapData = new HashMap<>();

		//查询批发商的所有拣货员
		List<NxDistributerUserEntity> distributerUserEntities = new ArrayList<>();
		List<NxDistributerUserEntity> purchaserUserEntities = new ArrayList<>();
		List<NxDistributerUserEntity> userEntities = nxDistributerUserDao.queryUser(disId);
		for (NxDistributerUserEntity user : userEntities) {
			List<NxDistributerUserRoleEntity> roleEntities = user.getRoleEntities();
			System.out.println(roleEntities);
			System.out.println("roororororoorro");
			for(NxDistributerUserRoleEntity userRoleEntity :roleEntities){
				if(userRoleEntity.getNxDurRoleId().equals(3)){
					distributerUserEntities.add(user);
				}if(userRoleEntity.getNxDurRoleId().equals(5)){
					purchaserUserEntities.add(user);
				}
			}
		}

		//查询所有分配称重订单
		Map<String, Object> map1 = new HashMap<>();
		map1.put("disId", disId);
		map1.put("status", 1);
		List<NxCommunityOrdersEntity> ordersEntityList = nxCommunityOrdersDao.queryOrders(map1);
		//组装拣货员的订单
		for (NxDistributerUserEntity user : distributerUserEntities) {
			List<NxCommunityOrdersEntity> nxCommunityOrdersEntityList = new ArrayList<>();

			for (NxCommunityOrdersEntity orders :ordersEntityList) {
				if(user.getNxDistributerUserId().equals(orders.getNxCoWeighUserId())){
					nxCommunityOrdersEntityList.add(orders);
				}
			}
			user.setOrderAmount(nxCommunityOrdersEntityList.size());
			if (nxCommunityOrdersEntityList.size() > 0){
				listWeigh.add(user);
			}

		}
		System.out.println(listWeigh);
		mapData.put("weigh", JSON.toJSON(listWeigh));


//		//查询所有采购订单
		Map<String, Object> map2 = new HashMap<>();
		map2.put("disId", disId);
		map2.put("purchaseStatus", 2);
		List<NxCommunityOrdersSubEntity> ordersSubEntities = nxCommunityOrdersSubDao.querySubOrdersByDisIdandStatus(map2);
		System.out.println(ordersSubEntities.size() + "ordersunbdbbfdasfisid");
		//组装拣货员的订单
		for (NxDistributerUserEntity user : purchaserUserEntities) {
			TreeSet<NxCommunityGoodsEntity> goodsEntityTreeSet = new TreeSet<>();
			for (NxCommunityOrdersSubEntity subEntity :ordersSubEntities) {
				if(user.getNxDistributerUserId().equals(subEntity.getNxCosPurchaseUserId())){
					System.out.println("wwwwwww" + subEntity.getNxCommunityGoodsEntity() );
					goodsEntityTreeSet.add(subEntity.getNxCommunityGoodsEntity());
				}
			}
			user.setOrderAmount(goodsEntityTreeSet.size());
			if (goodsEntityTreeSet.size() > 0){
				listPurchase.add(user);
			}

		}
		mapData.put("purchase", JSON.toJSON(listPurchase));



		return mapData;

	}

	@Override
	public List<NxCommunityOrdersEntity> queryOrdersToWeigh(Map<String, Object> map) {
		return nxCommunityOrdersDao.queryOrdersToWeigh(map);
	}


	@Override
	public void updateSub(NxCommunityOrdersEntity nxOrders) {
		List<NxCommunityOrdersSubEntity> nxOrdersSubEntities = nxOrders.getNxOrdersSubEntities();
		for (NxCommunityOrdersSubEntity sub : nxOrdersSubEntities) {
			nxCommunityOrdersSubDao.update(sub);
		}

		Map<String, Object> map = new HashMap<>();
		map.put("nxOrdersId", nxOrders.getNxCommunityOrdersId());
		map.put("nxOrdersSubFinished", nxOrders.getNxCoSubFinished() );
		map.put("nxOrdersStatus", nxOrders.getNxCoStatus());
		map.put("nxOrdersAmount", nxOrders.getNxCoAmount());
		nxCommunityOrdersDao.update(map);
	}


	@Override
	public List<NxCommunityOrdersEntity> queryOrdersDetail(Map<String, Object> map) {
		return nxCommunityOrdersDao.queryOrdersInformation(map);
	}

	@Override
	public List<NxCommunityOrdersEntity> queryOrdersPaymentInformation(Map<String, Object> map) {
		return nxCommunityOrdersDao.queryOrdersPaymentInformation(map);
	}

    @Override
    public Integer updatePaymentStatus(Map<String, Object> map) {
		return nxCommunityOrdersDao.update(map);
	}

    @Override
    public List<NxCommunityOrdersEntity> queryCustomerOrder(Map<String, Object> map) {

		return nxCommunityOrdersDao.queryCustomerOrder(map);
    }

    @Override
    public List<NxCommunityOrdersEntity> queryDeliveryOrder(Map<String, Object> map) {
        return nxCommunityOrdersDao.queryDeliveryOrders(map);
    }



}
