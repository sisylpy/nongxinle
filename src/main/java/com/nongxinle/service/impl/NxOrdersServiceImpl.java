package com.nongxinle.service.impl;

import com.alibaba.fastjson.JSON;
import com.nongxinle.dao.*;
import com.nongxinle.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

import com.nongxinle.service.NxOrdersService;

import static com.nongxinle.utils.DateUtils.formatWhatDay;
import static com.nongxinle.utils.DateUtils.formatWhatDayTime;


@Service("nxOrdersService")
public class NxOrdersServiceImpl implements NxOrdersService {
	@Autowired
	private NxOrdersDao nxOrdersDao;

	@Autowired
	private NxOrdersSubDao nxOrdersSubDao;

	@Autowired
	private NxDistributerUserDao nxDistributerUserDao;

	@Autowired
	private NxCustomerUserGoodsDao nxCustomerUserGoodsDao;

	@Autowired
	private NxCommunityGoodsDao nxCommunityGoodsDao;

	@Override
	public NxOrdersEntity queryObject(Integer nxOrdersId){
		return nxOrdersDao.queryObject(nxOrdersId);
	}
	
	@Override
	public List<NxOrdersEntity> queryList(Map<String, Object> map){
		return nxOrdersDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return nxOrdersDao.queryTotal(map);
	}

	@Override
	public void save(NxOrdersEntity nxOrders){
		nxOrders.setNxOrdersSubFinished(0);

		nxOrdersDao.save(nxOrders);
		Integer ordersUserId = nxOrders.getNxOrdersUserId();

		Integer nxOrdersId = nxOrders.getNxOrdersId();
		List<NxOrdersSubEntity> nxOrdersSubEntities = nxOrders.getNxOrdersSubEntities();

		for (NxOrdersSubEntity sub : nxOrdersSubEntities) {
			//子订单
			sub.setNxOsOrdersId(nxOrdersId);
			sub.setNxOsStatus(0);
			sub.setNxOsBuyStatus(0);
			sub.setNxOsOrderUserId(ordersUserId);
			sub.setNxOsDistributerId(nxOrders.getNxOrdersDistributerId());
			sub.setNxOsCommunityId(nxOrders.getNxOrdersCommunityId());
			nxOrdersSubDao.save(sub);


			//客户用户记录更新
			Integer nxOsCommunityGoodsId = sub.getNxOsCommunityGoodsId();
			Map<String, Object> map = new HashMap<>();
			map.put("nxOsCommunityGoodsId", nxOsCommunityGoodsId);
			map.put("nxCugUserId", ordersUserId);
			NxCustomerUserGoodsEntity userGoodsEntity = nxCustomerUserGoodsDao.queryByCommunityGoodsId(map);



			if(userGoodsEntity != null){
				userGoodsEntity.setNxCugLastOrderTime(formatWhatDayTime(0));
				userGoodsEntity.setNxCugLastOrderQuantity(sub.getNxOsQuantity());
				userGoodsEntity.setNxCugLastOrderStandard(sub.getNxOsStandard());
				userGoodsEntity.setNxCugLastOrderTime(formatWhatDay(0));
				userGoodsEntity.setNxCugJoinMyTemplate(0);
				Integer nxCugOrderTimes = userGoodsEntity.getNxCugOrderTimes();
				userGoodsEntity.setNxCugOrderTimes(nxCugOrderTimes + 1);
				Float nxCugOrderAmount = userGoodsEntity.getNxCugOrderAmount();
				Float nxOsQuantity = sub.getNxOsQuantity();
				userGoodsEntity.setNxCugOrderAmount(nxCugOrderAmount + nxOsQuantity);
				nxCustomerUserGoodsDao.update(userGoodsEntity);
			}else {
				NxCustomerUserGoodsEntity newUserGoodsEntity = new NxCustomerUserGoodsEntity();
				newUserGoodsEntity.setNxCugFirstOrderTime(formatWhatDay(0));
				newUserGoodsEntity.setNxCugOrderAmount(sub.getNxOsQuantity());
				newUserGoodsEntity.setNxCugCommunityGoodsId(sub.getNxOsCommunityGoodsId());
				newUserGoodsEntity.setNxCugOrderTimes(1);
				newUserGoodsEntity.setNxCugUserId(ordersUserId);
				newUserGoodsEntity.setNxCugLastOrderTime(formatWhatDay(0));
				newUserGoodsEntity.setNxCugJoinMyTemplate(0);
				newUserGoodsEntity.setNxCugLastOrderQuantity(sub.getNxOsQuantity());
				newUserGoodsEntity.setNxCugLastOrderStandard(sub.getNxOsStandard());
				nxCustomerUserGoodsDao.save(newUserGoodsEntity);


			}

			//商品点击数加1
			NxCommunityGoodsEntity disGoods = nxCommunityGoodsDao.queryObject(nxOsCommunityGoodsId);
			disGoods.setNxCgGoodsTotalHits(disGoods.getNxCgGoodsTotalHits() + 1);

		}

	}


	
	@Override
	public void update(NxOrdersEntity nxOrders){

		nxOrdersDao.update(nxOrders);
	}
	
	@Override
	public void delete(Integer nxOrdersId){
		nxOrdersDao.delete(nxOrdersId);

		Map<String, Object> map = new HashMap<>();
		map.put("nxOrdersId", nxOrdersId);
		List<NxOrdersSubEntity> subEntities =  nxOrdersSubDao.queryListByOrderId(map);
		for (NxOrdersSubEntity sub :
				subEntities) {
			nxOrdersSubDao.delete(sub.getNxOrdersSubId());

		}



	}
	
	@Override
	public void deleteBatch(Integer[] nxOrdersIds){
		nxOrdersDao.deleteBatch(nxOrdersIds);
	}

    @Override
    public List<NxOrdersEntity> queryOrders(Map<String, Object> map) {
        return nxOrdersDao.queryOrders(map);
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
		List<NxOrdersEntity> ordersEntityList = nxOrdersDao.queryOrders(map1);
		//组装拣货员的订单
		for (NxDistributerUserEntity user : distributerUserEntities) {
			List<NxOrdersEntity> nxOrdersEntityList = new ArrayList<>();

			for (NxOrdersEntity orders :ordersEntityList) {
				if(user.getNxDistributerUserId().equals(orders.getNxOrdersWeighUserId())){
					nxOrdersEntityList.add(orders);
				}
			}
			user.setOrderAmount(nxOrdersEntityList.size());
			if (nxOrdersEntityList.size() > 0){
				listWeigh.add(user);
			}

		}
		System.out.println(listWeigh);
		mapData.put("weigh", JSON.toJSON(listWeigh));


//		//查询所有采购订单
		Map<String, Object> map2 = new HashMap<>();
		map2.put("disId", disId);
		map2.put("purchaseStatus", 2);
		List<NxOrdersSubEntity> ordersSubEntities = nxOrdersSubDao.querySubOrdersByDisIdandStatus(map2);
		System.out.println(ordersSubEntities.size() + "ordersunbdbbfdasfisid");
		//组装拣货员的订单
		for (NxDistributerUserEntity user : purchaserUserEntities) {
			TreeSet<NxCommunityGoodsEntity> goodsEntityTreeSet = new TreeSet<>();
			for (NxOrdersSubEntity subEntity :ordersSubEntities) {
				if(user.getNxDistributerUserId().equals(subEntity.getNxOsPurchaseUserId())){
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
	public List<NxOrdersEntity> queryOrdersToWeigh(Map<String, Object> map) {
		return nxOrdersDao.queryOrdersToWeigh(map);
	}


	@Override
	public void updateSub(NxOrdersEntity nxOrders) {
		List<NxOrdersSubEntity> nxOrdersSubEntities = nxOrders.getNxOrdersSubEntities();
		for (NxOrdersSubEntity sub : nxOrdersSubEntities) {
			nxOrdersSubDao.update(sub);
		}

		Map<String, Object> map = new HashMap<>();
		map.put("nxOrdersId", nxOrders.getNxOrdersId());
		map.put("nxOrdersSubFinished", nxOrders.getNxOrdersSubFinished() );
		map.put("nxOrdersStatus", nxOrders.getNxOrdersStatus());
		map.put("nxOrdersAmount", nxOrders.getNxOrdersAmount());
		nxOrdersDao.update(map);
	}


	@Override
	public List<NxOrdersEntity> queryOrdersDetail(Map<String, Object> map) {
		return nxOrdersDao.queryOrdersInformation(map);
	}

	@Override
	public List<NxOrdersEntity> queryOrdersPaymentInformation(Map<String, Object> map) {
		return nxOrdersDao.queryOrdersPaymentInformation(map);
	}

    @Override
    public Integer updatePaymentStatus(Map<String, Object> map) {
		return nxOrdersDao.update(map);
	}

    @Override
    public List<NxOrdersEntity> queryCustomerOrder(Map<String, Object> map) {

		return nxOrdersDao.queryCustomerOrder(map);
    }

    @Override
    public List<NxOrdersEntity> queryDeliveryOrder(Map<String, Object> map) {
        return nxOrdersDao.queryDeliveryOrders(map);
    }



}
