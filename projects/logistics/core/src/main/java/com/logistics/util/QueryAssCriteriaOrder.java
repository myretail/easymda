package com.logistics.util;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Locale;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.MatchMode;

import com.logistics.entity.basic.WlPathVO;
import com.logistics.entity.basic.WlPlaceVO;
import com.logistics.entity.orga.HandleInfoVO;
import com.logistics.entity.orga.OrgaInfoVO;
import com.logistics.entity.orga.PeopleVO;
import com.logistics.entity.orga.RoleInfoVO;

public class QueryAssCriteriaOrder  extends org.springframework.orm.hibernate3.support.HibernateDaoSupport{
	
	
	
	public static void getWlLoanCriteria(com.logistics.entity.cost.WlLoanVO wlLoanvo, Criteria criteria){
		if (wlLoanvo.getApplyTime() != null)QueryAssCriteria.getDateCriteria(wlLoanvo.getApplyTime(),"applyTime",criteria);
        if (wlLoanvo.getPlanPayTime() != null)QueryAssCriteria.getDateCriteria(wlLoanvo.getPlanPayTime(),"planPayTime",criteria);
        if (wlLoanvo.getPlanLoanFee() != null)QueryAssCriteria.getNumberCriteria(wlLoanvo.getPlanLoanFee(),"planLoanFee",criteria);
        if (wlLoanvo.getFactLoanTime() != null)QueryAssCriteria.getDateCriteria(wlLoanvo.getFactLoanTime(),"factLoanTime",criteria);
        if (wlLoanvo.getFactLoanFee() != null)QueryAssCriteria.getNumberCriteria(wlLoanvo.getFactLoanFee(),"factLoanFee",criteria);
        if (wlLoanvo.getReturnTime() != null)QueryAssCriteria.getDateCriteria(wlLoanvo.getReturnTime(),"returnTime",criteria);
        if (wlLoanvo.getRemark() != null)
            criteria.add(Expression.ilike("remark", wlLoanvo.getRemark(), MatchMode.ANYWHERE));
        if (wlLoanvo.getId() != 0)
        criteria.add(Expression.eq("id", wlLoanvo.getId()));
        if (wlLoanvo.getTask() != null) {
        	final Criteria criteriaTaskRow =criteria.createCriteria("task");
            QueryAssCriteriaOrder.getTaskCriteria(wlLoanvo.getTask(),criteriaTaskRow);
        }
        if (wlLoanvo.getBorrower() != null) {
        	final Criteria criteriaPeo =criteria.createCriteria("borrower");
       	  QueryAssCriteria.getPeopleCriteria(wlLoanvo.getBorrower()  ,criteriaPeo);
        }
        if (wlLoanvo.getReturnBooker() != null) {
        	final Criteria criteriaPeo =criteria.createCriteria("returnBooker");
         	  QueryAssCriteria.getPeopleCriteria(wlLoanvo.getReturnBooker()  ,criteriaPeo);
        }
        if (wlLoanvo.getReturner() != null) {
        	final Criteria criteriaPeo =criteria.createCriteria("returner");
         	  QueryAssCriteria.getPeopleCriteria(wlLoanvo.getReturner()  ,criteriaPeo);
        }
        if (wlLoanvo.getAgent() != null){
        	final Criteria criteriaPeo =criteria.createCriteria("agent");
         	  QueryAssCriteria.getPeopleCriteria(wlLoanvo.getAgent()  ,criteriaPeo);
        }
	}
		
	
	
	public static void getWlTaskRowCostCriteria(com.logistics.entity.cost.WlTaskRowCostVO wlTaskRowCostvo, Criteria criteria){
		if (wlTaskRowCostvo.getStartDate() != null)QueryAssCriteria.getDateCriteria(wlTaskRowCostvo.getStartDate(),"startDte",criteria);
        if (wlTaskRowCostvo.getFillDate() != null)QueryAssCriteria.getDateCriteria(wlTaskRowCostvo.getFillDate(),"fillDate",criteria);
        if (wlTaskRowCostvo.getAffirmDate() != null)QueryAssCriteria.getDateCriteria(wlTaskRowCostvo.getAffirmDate(),"affirmDate",criteria);
        if (wlTaskRowCostvo.getCost() != null)QueryAssCriteria.getNumberCriteria(wlTaskRowCostvo.getCost(),"cost",criteria);
        if (wlTaskRowCostvo.getCostSort() != null)
            criteria.add(Expression.ilike("costSort", wlTaskRowCostvo.getCostSort(), MatchMode.ANYWHERE));
        if (wlTaskRowCostvo.getRemark() != null)
            criteria.add(Expression.ilike("remark", wlTaskRowCostvo.getRemark(), MatchMode.ANYWHERE));
        if (wlTaskRowCostvo.getId() != 0)
        criteria.add(Expression.eq("id", wlTaskRowCostvo.getId()));
        if (wlTaskRowCostvo.getTaskRow() != null){
        	final Criteria criteriaTaskRow =criteria.createCriteria("taskRow");
            QueryAssCriteriaOrder.getTaskRowCriteria(wlTaskRowCostvo.getTaskRow(),criteriaTaskRow);
        	//criteria.createCriteria("taskRow").add(Expression.eq("id", taskRow));
        }
        if (wlTaskRowCostvo.getFiller() != null){
       	 final Criteria criteriaPeo =criteria.createCriteria("filler");
         	  QueryAssCriteria.getPeopleCriteria(wlTaskRowCostvo.getFiller() ,criteriaPeo);
        }
        if (wlTaskRowCostvo.getAffirmer() != null){
       	 final Criteria criteriaPeo =criteria.createCriteria("affirmer");
        	  QueryAssCriteria.getPeopleCriteria(wlTaskRowCostvo.getAffirmer() ,criteriaPeo);
        	 }
	}
		
	
	public static void getWlFeeRowCriteria(com.logistics.entity.cost.WlFeeRowVO wlFeeRowvo, Criteria criteria){
		        
		        if (wlFeeRowvo.getCarriage() != null)QueryAssCriteria.getNumberCriteria(wlFeeRowvo.getCarriage(),"carriage",criteria);
		        if (wlFeeRowvo.getAffirmCarriage() != null)QueryAssCriteria.getNumberCriteria(wlFeeRowvo.getAffirmCarriage(),"affirmCarriage",criteria);
	            if (wlFeeRowvo.getOtherFee() != null)QueryAssCriteria.getNumberCriteria(wlFeeRowvo.getOtherFee(),"otherFee",criteria);
	            if (wlFeeRowvo.getAffirmOtherFee() != null)QueryAssCriteria.getNumberCriteria(wlFeeRowvo.getAffirmOtherFee(),"affirmOtherFee",criteria);
	            if (wlFeeRowvo.getState() != null)
	                criteria.add(Expression.ilike("state", wlFeeRowvo.getState(), MatchMode.ANYWHERE));
	            if (wlFeeRowvo.getInvoiceCode() != null)
	                criteria.add(Expression.ilike("invoiceCode", wlFeeRowvo.getInvoiceCode(), MatchMode.ANYWHERE));
	            if (wlFeeRowvo.getInvoiceSort() != null)
	                criteria.add(Expression.ilike("invoiceSort", wlFeeRowvo.getInvoiceSort(), MatchMode.ANYWHERE));
	            if (wlFeeRowvo.getPrintTime() != null)QueryAssCriteria.getDateCriteria(wlFeeRowvo.getPrintTime(),"printTime",criteria);
	            if (wlFeeRowvo.getReceiveTime() != null)QueryAssCriteria.getDateCriteria(wlFeeRowvo.getReceiveTime(),"receiveTime",criteria);
	            if (wlFeeRowvo.getRemark() != null)
	            	criteria.add(Expression.ilike("remark", wlFeeRowvo.getRemark(), MatchMode.ANYWHERE));
	            if (wlFeeRowvo.getId() != 0)
	            criteria.add(Expression.eq("id", wlFeeRowvo.getId()));
	            if (wlFeeRowvo.getFeeList() != null){
	            	final Criteria criteriaFeeList =criteria.createCriteria("feeList");
	             	QueryAssCriteriaOrder.getWlFeeListCriteria(wlFeeRowvo.getFeeList(),criteriaFeeList);
	            }
	            if (wlFeeRowvo.getOrderRow() != null){
	            	final Criteria criteriaorderRow =criteria.createCriteria("orderRow");
	             	QueryAssCriteriaOrder.getOrderRowCriteria(wlFeeRowvo.getOrderRow(),criteriaorderRow);
	            }
	            if (wlFeeRowvo.getPrinter() != null) {
	            	final Criteria criteriaPeo =criteria.createCriteria("printer");
	            	  QueryAssCriteria.getPeopleCriteria(wlFeeRowvo.getPrinter() ,criteriaPeo);
	            }
	            if (wlFeeRowvo.getReceiver() != null){
	            	final Criteria criteriaPeo =criteria.createCriteria("receiver");
	            	  QueryAssCriteria.getPeopleCriteria(wlFeeRowvo.getReceiver() ,criteriaPeo);
	            }
	}
	public static void getWlFeeListCriteria(com.logistics.entity.cost.WlFeeListVO wlFeeListvo, Criteria criteria){
		if (wlFeeListvo.getMakeDate() != null)QueryAssCriteria.getDateCriteria(wlFeeListvo.getMakeDate(),"makeDate",criteria);
            if (wlFeeListvo.getAffirmDate() != null) QueryAssCriteria.getDateCriteria(wlFeeListvo.getAffirmDate(),"affirmDate",criteria);
            if (wlFeeListvo.getStartDate() != null)QueryAssCriteria.getDateCriteria(wlFeeListvo.getStartDate(),"startDate",criteria);
            if (wlFeeListvo.getEndDate() != null)QueryAssCriteria.getDateCriteria(wlFeeListvo.getEndDate(),"endDate",criteria);
            if (wlFeeListvo.getChargeDate() != null)QueryAssCriteria.getDateCriteria(wlFeeListvo.getChargeDate(),"chargeDate",criteria);
            if (wlFeeListvo.getManagerDate() != null)QueryAssCriteria.getDateCriteria(wlFeeListvo.getManagerDate(),"managerDate",criteria);
            if (wlFeeListvo.getAppManagerDate() != null)QueryAssCriteria.getDateCriteria(wlFeeListvo.getAppManagerDate(),"appManagerDate",criteria);
            if (wlFeeListvo.getState() != null)
                criteria.add(Expression.ilike("state", wlFeeListvo.getState(), MatchMode.ANYWHERE));
            if (wlFeeListvo.getRemark() != null)
                criteria.add(Expression.ilike("remark", wlFeeListvo.getRemark(), MatchMode.ANYWHERE));
            if (wlFeeListvo.getId() != 0)
            criteria.add(Expression.eq("id", wlFeeListvo.getId()));
            if (wlFeeListvo.getFeeRow() != null && wlFeeListvo.getFeeRow().length > 0){
            	//criteria.createCriteria("feeRow").add(Expression.in("id", feeRow));
            	final Criteria criteriaFeeRow =criteria.createCriteria("feeRow");
             	QueryAssCriteriaOrder.getWlFeeRowCriteria(wlFeeListvo.getFeeRow()[0],criteriaFeeRow);
            }
            if (wlFeeListvo.getMakePeople() != null){
            	final Criteria criteriaPeo =criteria.createCriteria("makePeople");
            	  QueryAssCriteria.getPeopleCriteria(wlFeeListvo.getMakePeople() ,criteriaPeo);
            }
            if (wlFeeListvo.getCustomer() != null) {
            	Criteria criteriaCust =criteria.createCriteria("customer");
    	    	QueryAssCriteria.getCustomerCriteria(wlFeeListvo.getCustomer(),criteriaCust);
            }
            if (wlFeeListvo.getChargePeople() != null){
            	final Criteria criteriaPeo =criteria.createCriteria("chargePeople");
          	  QueryAssCriteria.getPeopleCriteria(wlFeeListvo.getChargePeople() ,criteriaPeo);
            	
            }
            if (wlFeeListvo.getAppManager() != null){
            	final Criteria criteriaPeo =criteria.createCriteria("appManager");
            	QueryAssCriteria.getPeopleCriteria(wlFeeListvo.getAppManager() ,criteriaPeo);
            }
            if (wlFeeListvo.getManager() != null){
            	final Criteria criteriaPeo =criteria.createCriteria("manager");
            	QueryAssCriteria.getPeopleCriteria(wlFeeListvo.getManager() ,criteriaPeo);
            }
            
	}
		
	public static void getWlPeopleCostCriteria(com.logistics.entity.cost.WlPeopleCostVO wlPeopleCostvo, Criteria criteria){
		if (wlPeopleCostvo.getStartDate() != null)QueryAssCriteria.getDateCriteria(wlPeopleCostvo.getStartDate(),"startDte",criteria);
        if (wlPeopleCostvo.getFillDate() != null)QueryAssCriteria.getDateCriteria(wlPeopleCostvo.getFillDate(),"fillDate",criteria);
        if (wlPeopleCostvo.getAffirmDate() != null)QueryAssCriteria.getDateCriteria(wlPeopleCostvo.getAffirmDate(),"affirmDate",criteria);
        if (wlPeopleCostvo.getCostSum() != null)QueryAssCriteria.getNumberCriteria(wlPeopleCostvo.getCostSum(),"costSum",criteria);
        if (wlPeopleCostvo.getCostSort() != null)
            criteria.add(Expression.ilike("costSort", wlPeopleCostvo.getCostSort(), MatchMode.ANYWHERE));
        if (wlPeopleCostvo.getRemark() != null)
            criteria.add(Expression.ilike("remark", wlPeopleCostvo.getRemark(), MatchMode.ANYWHERE));
        if (wlPeopleCostvo.getId() != 0)
        criteria.add(Expression.eq("id", wlPeopleCostvo.getId()));
        if (wlPeopleCostvo.getFiller() != null){
       	 final Criteria criteriaPeo =criteria.createCriteria("filler");
         	  QueryAssCriteria.getPeopleCriteria(wlPeopleCostvo.getFiller() ,criteriaPeo);
        }
        if (wlPeopleCostvo.getAffirmer() != null){
       	 final Criteria criteriaPeo =criteria.createCriteria("affirmer");
        	  QueryAssCriteria.getPeopleCriteria(wlPeopleCostvo.getAffirmer() ,criteriaPeo);
        	 }
         if (wlPeopleCostvo.getPeople() != null) {
        	 final Criteria criteriaPeo =criteria.createCriteria("people");
       	  QueryAssCriteria.getPeopleCriteria(wlPeopleCostvo.getPeople() ,criteriaPeo);
         }
         if (wlPeopleCostvo.getTask() != null){
        	 final Criteria criteriaTask =criteria.createCriteria("task");
       	  QueryAssCriteriaOrder.getTaskCriteria(wlPeopleCostvo.getTask() ,criteriaTask);
         }
         if (wlPeopleCostvo.getTaskRow() != null){
        	 final Criteria criteriaTaskRow =criteria.createCriteria("taskRow");
       	  QueryAssCriteriaOrder.getTaskRowCriteria(wlPeopleCostvo.getTaskRow() ,criteriaTaskRow);
        	
         }
         
	}
	public static void getWlCarryCostCriteria(com.logistics.entity.cost.WlCarryCostVO wlCarryCostvo, Criteria criteria){
		 if (wlCarryCostvo.getStartDate() != null)QueryAssCriteria.getDateCriteria(wlCarryCostvo.getStartDate(),"startDte",criteria);
         if (wlCarryCostvo.getFillDate() != null)QueryAssCriteria.getDateCriteria(wlCarryCostvo.getFillDate(),"fillDate",criteria);
         if (wlCarryCostvo.getAffirmDate() != null)QueryAssCriteria.getDateCriteria(wlCarryCostvo.getAffirmDate(),"affirmDate",criteria);
         if (wlCarryCostvo.getCostSum() != null)QueryAssCriteria.getNumberCriteria(wlCarryCostvo.getCostSum(),"costSum",criteria);
         if (wlCarryCostvo.getCostSort() != null)
             criteria.add(Expression.ilike("costSort", wlCarryCostvo.getCostSort(), MatchMode.ANYWHERE));
         if (wlCarryCostvo.getRemark() != null)
             criteria.add(Expression.ilike("remark", wlCarryCostvo.getRemark(), MatchMode.ANYWHERE));
         if (wlCarryCostvo.getId() != 0)
         criteria.add(Expression.eq("id", wlCarryCostvo.getId()));
         if (wlCarryCostvo.getVoiture() != null){
        	 //criteria.createCriteria("voiture").add(Expression.eq("id", voiture));
        	 final Criteria criteriaVoi =criteria.createCriteria("voiture");
           	//QueryAssCriteriaOrder.getVoitureCriteria(WlSteerRow.getVoiture(),criteriaVoi);
         }
         if (wlCarryCostvo.getStartSteerRow() != null){
        	 final Criteria criteriaSt =criteria.createCriteria("startSteerRow");
            	QueryAssCriteriaOrder.getWlSteerRowCriteria(wlCarryCostvo.getStartSteerRow(),criteriaSt);
         }
         if (wlCarryCostvo.getFiller() != null){
        	 final Criteria criteriaPeo =criteria.createCriteria("filler");
          	  QueryAssCriteria.getPeopleCriteria(wlCarryCostvo.getFiller() ,criteriaPeo);
         }
         if (wlCarryCostvo.getAffirmer() != null){
        	 final Criteria criteriaPeo =criteria.createCriteria("affirmer");
         	  QueryAssCriteria.getPeopleCriteria(wlCarryCostvo.getAffirmer() ,criteriaPeo);
         	 }
	}
		
	
	public static void getOrderCriteria(com.logistics.entity.order.WlOrderVO wlorder, Criteria criteria){
	
	  if (wlorder.getCustomerOrderNo() != null) 	
        criteria.add(Expression.ilike("customerOrderNo", wlorder.getCustomerOrderNo(), MatchMode.ANYWHERE));
      if (wlorder.getContractNo() != null)
          criteria.add(Expression.ilike("contractNo", wlorder.getContractNo() , MatchMode.ANYWHERE));
      if (wlorder.getConveyance() != null)
          criteria.add(Expression.ilike("conveyance", wlorder.getConveyance(), MatchMode.ANYWHERE));
      if (wlorder.getCarryType() != null)
          criteria.add(Expression.ilike("carryType", wlorder.getCarryType(), MatchMode.ANYWHERE));
      if (wlorder.getShipperRemark() != null)
          criteria.add(Expression.ilike("shipperRemark", wlorder.getShipperRemark(), MatchMode.ANYWHERE));
      if (wlorder.getCarrierRemark() != null)
          criteria.add(Expression.ilike("carrierRemark", wlorder.getCarrierRemark(), MatchMode.ANYWHERE));
      if (wlorder.getWllevel() != null)
          criteria.add(Expression.ilike("wllevel", wlorder.getWllevel(), MatchMode.ANYWHERE));
      if (wlorder.getCustomerType() != null)
          criteria.add(Expression.ilike("customerType", wlorder.getCustomerType(), MatchMode.ANYWHERE));

      if (wlorder.getReferTime()!=null)QueryAssCriteria.getDateCriteria(wlorder.getReferTime(),"referTime",criteria);
      if (wlorder.getLinkMan() != null)
          criteria.add(Expression.ilike("linkMan", wlorder.getLinkMan(), MatchMode.ANYWHERE));
      if (wlorder.getTel() != null)
          criteria.add(Expression.ilike("tel", wlorder.getTel(), MatchMode.ANYWHERE));
      if (wlorder.getBookTime()!=null)QueryAssCriteria.getDateCriteria(wlorder.getBookTime(),"bookTime",criteria);
      if (wlorder.getCompleteTime()!=null)QueryAssCriteria.getDateCriteria(wlorder.getCompleteTime(),"completeTime",criteria);
      if (wlorder.getFormState() != null)
          criteria.add(Expression.ilike("formState", wlorder.getFormState(), MatchMode.ANYWHERE));
      if (wlorder.getPlanFetchTime()!=null)QueryAssCriteria.getDateCriteria(wlorder.getPlanFetchTime(),"planFetchTime",criteria);
      if (wlorder.getFetchCompanyName() != null)
          criteria.add(Expression.ilike("fetchCompanyName", wlorder.getFetchCompanyName(), MatchMode.ANYWHERE));
      if (wlorder.getFetchCompanyAddress() != null)
          criteria.add(Expression.ilike("fetchCompanyAddress", wlorder.getFetchCompanyAddress(), MatchMode.ANYWHERE));
      if (wlorder.getFetchMan() != null)
          criteria.add(Expression.ilike("fetchMan", wlorder.getFetchMan(), MatchMode.ANYWHERE));
      if (wlorder.getFetchTel() != null)
          criteria.add(Expression.ilike("fetchTel", wlorder.getFetchTel(), MatchMode.ANYWHERE));
      System.out.println("nmvmvtrtrtrtrt:"+wlorder.getPlanUnloadTime());
      
      if (wlorder.getPlanUnloadTime()!=null)QueryAssCriteria.getDateCriteria(wlorder.getPlanUnloadTime(),"planUnloadTime",criteria);
      if (wlorder.getUnloadCompanyName() != null)
          criteria.add(Expression.ilike("unloadCompanyName", wlorder.getUnloadCompanyName(), MatchMode.ANYWHERE));
      if (wlorder.getUnloadCompanyAddress() != null)
          criteria.add(Expression.ilike("unloadCompanyAddress", wlorder.getUnloadCompanyAddress(), MatchMode.ANYWHERE));
      if (wlorder.getUnloadMan() != null)
          criteria.add(Expression.ilike("unloadMan", wlorder.getUnloadMan(), MatchMode.ANYWHERE));
      if (wlorder.getUnloadTel() != null)
          criteria.add(Expression.ilike("unloadTel", wlorder.getUnloadTel(), MatchMode.ANYWHERE));
      if (wlorder.getId() != 0)criteria.add(Expression.eq("id", wlorder.getId()));
      //if (wlorder.rderRow != null && orderRow.length > 0) criteria.createCriteria("orderRow").add(Expression.in("id", orderRow));
      if (wlorder.getPayCompanyID() != 0) criteria.createCriteria("payCompany").add(Expression.eq("id", wlorder.getPayCompanyID()));
      if (wlorder.getFetchCompanyID() != 0) criteria.createCriteria("fetchCompany").add(Expression.eq("id", wlorder.getFetchCompanyID()));
      if (wlorder.getUnloadCompanyID() != 0) criteria.createCriteria("unloadCompany").add(Expression.eq("id", wlorder.getUnloadCompanyID()));
      if (wlorder.getCustomerID() != 0) criteria.createCriteria("customer").add(Expression.eq("id", wlorder.getCustomerID()));
      if (wlorder.getBookerId() != 0) criteria.createCriteria("booker").add(Expression.eq("id", wlorder.getBookerId()));
      if (wlorder.getOperatorId() != 0) criteria.createCriteria("wloperator").add(Expression.eq("id", wlorder.getOperatorId()));
      if (wlorder.getTaskPeopleId() != 0) criteria.createCriteria("taskPeople").add(Expression.eq("id", wlorder.getTaskPeopleId()));
      if (wlorder.getPathid() != 0) criteria.createCriteria("path").add(Expression.eq("id", wlorder.getPathid()));
      /*if (wlorder.getPathName() != null) {//暂时用该字段传endPlaceID
		  WlPathVO pathvo=new WlPathVO();
    	  WlPlaceVO placevo=new WlPlaceVO();
    	  placevo.setId(Long.valueOf(wlorder.getPathName()));
    	  pathvo.setEndPlaceID(placevo);
    	  final Criteria criteriapath =criteria.createCriteria("path");
	   	  QueryAssCriteria.getPathCriteria(pathvo, criteriapath);
	  }*/
      /*if (wlorder.getRemark() != null)
          criteria.add(Expression.ilike("remark", wlorder.getRemark(), MatchMode.ANYWHERE));*/
      
      if (wlorder.getRemark() != null||wlorder.getPathName() != null) {//暂时用该字段传StartPlaceID
    	  WlPathVO pathvo=new WlPathVO();
    	  if (wlorder.getRemark() != null){
	    	  WlPlaceVO placevo=new WlPlaceVO();
	    	  placevo.setId(Long.valueOf(wlorder.getRemark()));
	    	  System.out.println("getOrderCriteria.getRwmark:"+Long.valueOf(wlorder.getRemark()));
	    	  pathvo.setStartPlaceID(placevo);
    	  }
    	  if (wlorder.getPathName() != null){
	    	  WlPlaceVO placevo2=new WlPlaceVO();
	    	  placevo2.setId(Long.valueOf(wlorder.getPathName()));
	    	  pathvo.setEndPlaceID(placevo2);
    	  }
    	  
    	  final Criteria criteriapath2 =criteria.createCriteria("path");
	   	  QueryAssCriteria.getPathCriteria(pathvo, criteriapath2);
	  }
      if (wlorder.getOrderRows() != null){
    	  final Criteria criteriaOrder =criteria.createCriteria("orderRow");
       	  QueryAssCriteriaOrder.getOrderRowCriteria(wlorder.getOrderRows()[0],criteriaOrder);
      }
      
    }  
    
    
	public static void getOrderRowCriteria(com.logistics.entity.order.WlOrderRowVO wlorder, Criteria criteria){
		if (wlorder.getProductCode() != null)
            criteria.add(Expression.ilike("productCode", wlorder.getProductCode(), MatchMode.ANYWHERE));
        if (wlorder.getProductName() != null)
            criteria.add(Expression.ilike("productName", wlorder.getProductName(), MatchMode.ANYWHERE));
        if (wlorder.getProductEquType() != null)
            criteria.add(Expression.ilike("productEquType", wlorder.getProductEquType(), MatchMode.ANYWHERE));
        if (wlorder.getMeasureUnit() != null)
            criteria.add(Expression.ilike("measureUnit", wlorder.getMeasureUnit(), MatchMode.ANYWHERE));
        if (wlorder.getProductNum() != null)QueryAssCriteria.getNumberCriteria(wlorder.getProductNum(),"productNum",criteria);
        if (wlorder.getUnitNum()  != null)QueryAssCriteria.getNumberCriteria(wlorder.getUnitNum(),"unitNum",criteria);
        if (wlorder.getGoodsSuttle()  != null)QueryAssCriteria.getNumberCriteria(wlorder.getGoodsSuttle(),"goodsSuttle",criteria);
        if (wlorder.getGoodsWeight() != null)QueryAssCriteria.getNumberCriteria(wlorder.getGoodsWeight(),"goodsWeight",criteria);
        if (wlorder.getGoodsVolume()  != null)QueryAssCriteria.getNumberCriteria(wlorder.getGoodsVolume(),"goodsVolume",criteria);
        if (wlorder.getLabel() != null)
            criteria.add(Expression.ilike("label", wlorder.getLabel(), MatchMode.ANYWHERE));
        if (wlorder.getCarriage()  != null)QueryAssCriteria.getNumberCriteria(wlorder.getCarriage(),"carriage",criteria);
        if (wlorder.getEspecial() != null)
            criteria.add(Expression.ilike("especial", wlorder.getEspecial(), MatchMode.ANYWHERE));
        if (wlorder.getGoodsState() != null)
            criteria.add(Expression.ilike("goodsState", wlorder.getGoodsState(), MatchMode.ANYWHERE));
        if (wlorder.getStatus() != null)
            criteria.add(Expression.ilike("status", wlorder.getStatus(), MatchMode.ANYWHERE));
        criteria.add(Expression.eq("version", new java.lang.Double(wlorder.getVersion())));
        if (wlorder.getRemark() != null)
            criteria.add(Expression.ilike("remark", wlorder.getRemark(), MatchMode.ANYWHERE));
        if (wlorder.getId() != 0)
        criteria.add(Expression.eq("id", wlorder.getId()));
        if (wlorder.getWlOrderid()!= 0) criteria.createCriteria("order").add(Expression.eq("id", wlorder.getWlOrderid()));
        if (wlorder.getProductID() != 0) criteria.createCriteria("product").add(Expression.eq("id", wlorder.getProductID()));
	}
	public static void getTrwithorCriteria(com.logistics.entity.order.WltrwithorVO WltrwithorVO, Criteria criteria){
		
		if (WltrwithorVO.getLoadNum() != null)QueryAssCriteria.getNumberCriteria(WltrwithorVO.getLoadNum(),"loadNum",criteria);
		if (WltrwithorVO.getFactNum() != null)QueryAssCriteria.getNumberCriteria(WltrwithorVO.getFactNum(),"factNum",criteria);
		if (WltrwithorVO.getCarryBoxNum() != null)QueryAssCriteria.getNumberCriteria(WltrwithorVO.getCarryBoxNum(),"carryBoxNum",criteria);
		if (WltrwithorVO.getFactBoxNum() != null)QueryAssCriteria.getNumberCriteria(WltrwithorVO.getFactBoxNum(),"factBoxNum",criteria);
		if (WltrwithorVO.getLoadWeight() != null)QueryAssCriteria.getNumberCriteria(WltrwithorVO.getLoadWeight(),"loadWeight",criteria);
		if (WltrwithorVO.getFactWeight() != null)QueryAssCriteria.getNumberCriteria(WltrwithorVO.getFactWeight(),"factWeight",criteria);
		if (WltrwithorVO.getLoadCubage() != null)QueryAssCriteria.getNumberCriteria(WltrwithorVO.getLoadCubage(),"loadCubage",criteria);
		if (WltrwithorVO.getFactCubage() != null)QueryAssCriteria.getNumberCriteria(WltrwithorVO.getFactCubage(),"factCubage",criteria);
		if (WltrwithorVO.getPlanFee() != null)QueryAssCriteria.getNumberCriteria(WltrwithorVO.getPlanFee(),"planFee",criteria);
		if (WltrwithorVO.getStartGoodsState() != null)
            criteria.add(Expression.ilike("startGoodsState", WltrwithorVO.getStartGoodsState(), MatchMode.ANYWHERE));
        if (WltrwithorVO.getEndGoodsState() != null)
            criteria.add(Expression.ilike("endGoodsState", WltrwithorVO.getEndGoodsState(), MatchMode.ANYWHERE));
        if (WltrwithorVO.getRemark() != null)
            criteria.add(Expression.ilike("remark", WltrwithorVO.getRemark(), MatchMode.ANYWHERE));
        if (WltrwithorVO.getId() != 0)
        criteria.add(Expression.eq("id", WltrwithorVO.getId()));
        //if (WltrwithorVO.getTaskRow() != null) criteria.createCriteria("taskRow").add(Expression.eq("id", WltrwithorVO.getTaskRow()));
        if (WltrwithorVO.getOrderRow() != null){
        	final Criteria criteriaOrder =criteria.createCriteria("orderRow");
         	QueryAssCriteriaOrder.getOrderRowCriteria(WltrwithorVO.getOrderRow(),criteriaOrder);
        }/*else{
        	
        }*/
	}
	public static void getTaskCriteria(com.logistics.entity.order.WlTaskVO WlTaskVO, Criteria criteria){
		
		  if (WlTaskVO.getCreateTime()!=null)QueryAssCriteria.getDateCriteria(WlTaskVO.getCreateTime(),"createTime",criteria);
          if (WlTaskVO.getId() != 0)
          criteria.add(Expression.eq("id", WlTaskVO.getId()));
          if ( WlTaskVO.getTaskRow() != null ) {
        	  //for(int i=0;i<WlTaskVO.getTaskRow().length;i++){
        	  final Criteria criteriaTaskRow =criteria.createCriteria("taskRow");
              QueryAssCriteriaOrder.getTaskRowCriteria(WlTaskVO.getTaskRow()[0],criteriaTaskRow);
        	  //criteria.createCriteria("taskRow").add(Expression.in("id", WlTaskVO.getTaskRow()));
          }//}
          if (WlTaskVO.getManager() != null) {
        	  final Criteria criteriaPeo =criteria.createCriteria("manager");
           	  QueryAssCriteria.getPeopleCriteria(WlTaskVO.getManager(),criteriaPeo);
          }
	}
	
	public static void getTaskRowCriteria(com.logistics.entity.order.WlTaskRowVO WlTaskRowVO, Criteria criteria){
		if (WlTaskRowVO.getTaskType() != null)
            criteria.add(Expression.ilike("taskType", WlTaskRowVO.getTaskType(), MatchMode.ANYWHERE));
       if (WlTaskRowVO.getPlanFetchTime()!= null)QueryAssCriteria.getDateCriteria(WlTaskRowVO.getPlanFetchTime(),"planFetchTime",criteria);
        if (WlTaskRowVO.getFetchUnitAddress() != null)
            criteria.add(Expression.ilike("fetchUnitAddress", WlTaskRowVO.getFetchUnitAddress(), MatchMode.ANYWHERE));
        if (WlTaskRowVO.getFetchMan() != null)
            criteria.add(Expression.ilike("fetchMan", WlTaskRowVO.getFetchMan(), MatchMode.ANYWHERE));
        if (WlTaskRowVO.getFetchTel() != null)
            criteria.add(Expression.ilike("fetchTel", WlTaskRowVO.getFetchTel(), MatchMode.ANYWHERE));
        
        if (WlTaskRowVO.getPlanUnloadTime()!=null)QueryAssCriteria.getDateCriteria(WlTaskRowVO.getPlanUnloadTime(),"planUnloadTime",criteria);
        
        if (WlTaskRowVO.getUnloadUnitAddress() != null)
            criteria.add(Expression.ilike("unloadUnitAddress", WlTaskRowVO.getUnloadUnitAddress(), MatchMode.ANYWHERE));
        if (WlTaskRowVO.getUnloadMan() != null)
            criteria.add(Expression.ilike("unloadMan", WlTaskRowVO.getUnloadMan(), MatchMode.ANYWHERE));
        if (WlTaskRowVO.getUnloadTel() != null)
            criteria.add(Expression.ilike("unloadTel", WlTaskRowVO.getUnloadTel(), MatchMode.ANYWHERE));
        if (WlTaskRowVO.getDriverTel() != null)
            criteria.add(Expression.ilike("driverTel", WlTaskRowVO.getDriverTel(), MatchMode.ANYWHERE));
        if (WlTaskRowVO.getFollower() != null)
            criteria.add(Expression.ilike("follower", WlTaskRowVO.getFollower(), MatchMode.ANYWHERE));
        if (WlTaskRowVO.getPlanBackTime()!=null)QueryAssCriteria.getDateCriteria(WlTaskRowVO.getPlanBackTime(),"planBackTime",criteria);
        if (WlTaskRowVO.getArriveFetchTime()!=null)QueryAssCriteria.getDateCriteria(WlTaskRowVO.getArriveFetchTime(),"arriveFetchTime",criteria);
        if (WlTaskRowVO.getStartFetchTime()!=null)QueryAssCriteria.getDateCriteria(WlTaskRowVO.getStartFetchTime(),"startFetchTime",criteria);
        if (WlTaskRowVO.getEndFetchTime()!=null)QueryAssCriteria.getDateCriteria(WlTaskRowVO.getEndFetchTime(),"endFetchTime",criteria);
        if (WlTaskRowVO.getArriveUnloadTime()!=null)QueryAssCriteria.getDateCriteria(WlTaskRowVO.getArriveUnloadTime(),"arriveUnloadTime",criteria);
        if (WlTaskRowVO.getStartUnloadTime()!=null)QueryAssCriteria.getDateCriteria(WlTaskRowVO.getStartUnloadTime(),"startUnloadTime",criteria);
        if (WlTaskRowVO.getEndUnloadTime()!=null)QueryAssCriteria.getDateCriteria(WlTaskRowVO.getEndUnloadTime(),"endUnloadTime",criteria);
        if (WlTaskRowVO.getTrueOrFalse() != null)
            criteria.add(Expression.ilike("trueOrFalse", WlTaskRowVO.getTrueOrFalse(), MatchMode.ANYWHERE));
        if (WlTaskRowVO.getReturnDate()!=null)QueryAssCriteria.getDateCriteria(WlTaskRowVO.getReturnDate(),"returnDate",criteria);
        if (WlTaskRowVO.getStatus() != null)
            criteria.add(Expression.ilike("status", WlTaskRowVO.getStatus(), MatchMode.ANYWHERE));
        if (WlTaskRowVO.getRemark() != null)
            criteria.add(Expression.ilike("remark", WlTaskRowVO.getRemark(), MatchMode.ANYWHERE));
        if (WlTaskRowVO.getId() != 0)
        criteria.add(Expression.eq("id", WlTaskRowVO.getId()));
        if (WlTaskRowVO.getTrwithor() != null) {
        	Criteria criteriaTrw =criteria.createCriteria("trwithor");
	    	QueryAssCriteriaOrder.getTrwithorCriteria(WlTaskRowVO.getTrwithor()[0],criteriaTrw);
        	//criteria.createCriteria("trwithor").add(Expression.in("id", WlTaskRowVO.getTrwithor()));
        }
        //if (WlTaskRowVO.getTask()!= null) criteria.createCriteria("task").add(Expression.eq("id", WlTaskRowVO.getTask()));
        if (WlTaskRowVO.getFetchUnit() != null) {
        	Criteria criteriaCust =criteria.createCriteria("fetchUnit");
	    	QueryAssCriteria.getCustomerCriteria(WlTaskRowVO.getFetchUnit(),criteriaCust);
        }
        if (WlTaskRowVO.getUnloadUnit() != null){
        	Criteria criteriaCust =criteria.createCriteria("unloadUnit");
	    	QueryAssCriteria.getCustomerCriteria(WlTaskRowVO.getUnloadUnit(),criteriaCust);
        } 
        if (WlTaskRowVO.getMasterDriver() != null){
        	final Criteria criteriaPeo =criteria.createCriteria("masterDriver");
         	  QueryAssCriteria.getPeopleCriteria(WlTaskRowVO.getMasterDriver(),criteriaPeo);
        	//criteria.createCriteria("masterDriver").add(Expression.eq("id", WlTaskRowVO.getMasterDriver()));
        }
        if (WlTaskRowVO.getAssistDriver() != null){
        	final Criteria criteriaPeo =criteria.createCriteria("assistDriver");
       	  QueryAssCriteria.getPeopleCriteria(WlTaskRowVO.getAssistDriver(),criteriaPeo);
       	  //criteria.createCriteria("assistDriver").add(Expression.eq("id", WlTaskRowVO.getAssistDriver()));
        }
	}
	public static void getWlSteerRowCriteria(com.logistics.entity.order.WlSteerRowVO WlSteerRow, Criteria criteria){
		if (WlSteerRow.getTime()!= null)QueryAssCriteria.getDateCriteria(WlSteerRow.getTime(),"time",criteria);
        if (WlSteerRow.getPlace()!= null){
        	final Criteria criteriaPlace =criteria.createCriteria("place");
          	QueryAssCriteria.getPlaceCriteria(WlSteerRow.getPlace(),criteriaPlace);
        }
       // if (WlSteerRow.getPlaceName()!= null)
        //	criteria.add(Expression.ilike("placeName", WlSteerRow.getPlaceName(), MatchMode.ANYWHERE));
        if (WlSteerRow.getState() != null)
            criteria.add(Expression.ilike("state", WlSteerRow.getState(), MatchMode.ANYWHERE));
        if (WlSteerRow.getMiles() != null)QueryAssCriteria.getNumberCriteria(WlSteerRow.getMiles(),"miles",criteria);
        if (WlSteerRow.getBookTime() != null)QueryAssCriteria.getDateCriteria(WlSteerRow.getBookTime(),"bookTime",criteria);
        if (WlSteerRow.getRemark() != null)
            criteria.add(Expression.ilike("remark", WlSteerRow.getRemark(), MatchMode.ANYWHERE));
        if (WlSteerRow.getId() != 0)
        criteria.add(Expression.eq("id", WlSteerRow.getId()));
        if (WlSteerRow.getTask() != null){
        	final Criteria criteriaTask =criteria.createCriteria("task");
          	//QueryAssCriteriaOrder.getTaskCriteria(WlSteerRow.getTask(),criteriaTask);
        	//criteria.createCriteria("task").add(Expression.eq("id", task));
        }
        if (WlSteerRow.getVoiture() != null){
        	final Criteria criteriaVoi =criteria.createCriteria("voiture");
          	//QueryAssCriteriaOrder.getVoitureCriteria(WlSteerRow.getVoiture(),criteriaVoi);
        }
        if (WlSteerRow.getBooker() != null){
        	//criteria.createCriteria("booker").add(Expression.eq("id", booker));
        	final Criteria criteriaPeo =criteria.createCriteria("booker");
         	QueryAssCriteria.getPeopleCriteria(WlSteerRow.getBooker(),criteriaPeo);
        }
        if (WlSteerRow.getReporter() != null){
        	final Criteria criteriaPeo =criteria.createCriteria("reporter");
         	QueryAssCriteria.getPeopleCriteria(WlSteerRow.getReporter(),criteriaPeo);
        }
        
	}
	
	public static void getWlOpinionCriteria(com.logistics.entity.order.WlOpinionVO WlOpinionVO, Criteria criteria){
		if (WlOpinionVO.getTime() != null)QueryAssCriteria.getDateCriteria(WlOpinionVO.getTime(),"time",criteria);
        
        if (WlOpinionVO.getPlace() != null)
        	            criteria.add(Expression.ilike("place", WlOpinionVO.getPlace(), MatchMode.ANYWHERE));
        if (WlOpinionVO.getAccidentDescribe() != null)
            criteria.add(Expression.ilike("accidentDescribe", WlOpinionVO.getAccidentDescribe(), MatchMode.ANYWHERE));
        if (WlOpinionVO.getBookTime() != null)QueryAssCriteria.getDateCriteria(WlOpinionVO.getBookTime(),"bookTime",criteria);
        if (WlOpinionVO.getSolve() != null)
            criteria.add(Expression.ilike("solve", WlOpinionVO.getSolve(), MatchMode.ANYWHERE));
        if (WlOpinionVO.getLossFee() != null)QueryAssCriteria.getNumberCriteria(WlOpinionVO.getLossFee(),"lossFee",criteria);
        //criteria.add(Expression.eq("lossFee", new java.lang.Double(lossFee)));
        if (WlOpinionVO.getRemark()!= null)
            criteria.add(Expression.ilike("remark", WlOpinionVO.getRemark(), MatchMode.ANYWHERE));
        if (WlOpinionVO.getId() != 0)
        criteria.add(Expression.eq("id", WlOpinionVO.getId()));
        if (WlOpinionVO.getTaskRow() != null){
        	//criteria.createCriteria("taskRow").add(Expression.eq("id", taskRow));
        	final Criteria criteriaTaskRow =criteria.createCriteria("taskRow");
            QueryAssCriteriaOrder.getTaskRowCriteria(WlOpinionVO.getTaskRow(),criteriaTaskRow);
        }
        if (WlOpinionVO.getPeople() != null){
        	//criteria.createCriteria("people").add(Expression.eq("id", people));
        	final Criteria criteriaPeo =criteria.createCriteria("people");
         	QueryAssCriteria.getPeopleCriteria(WlOpinionVO.getPeople(),criteriaPeo);
        }
        if (WlOpinionVO.getBooker() != null){
        	//criteria.createCriteria("booker").add(Expression.eq("id", booker));
        	final Criteria criteriaPeo =criteria.createCriteria("booker");
         	QueryAssCriteria.getPeopleCriteria(WlOpinionVO.getBooker(),criteriaPeo);
        }
        if (WlOpinionVO.getReport() != null){
        	//criteria.createCriteria("reporter").add(Expression.eq("id", reporter));
        	final Criteria criteriaPeo =criteria.createCriteria("reporter");
         	QueryAssCriteria.getPeopleCriteria(WlOpinionVO.getReport(),criteriaPeo);
        }
	}
	public static void getWlAccidentCriteria(com.logistics.entity.order.WlAccidentVO WlAccidentVO, Criteria criteria){
		 if (WlAccidentVO.getAccidentTime() != null)QueryAssCriteria.getDateCriteria(WlAccidentVO.getAccidentTime(),"accidentTime",criteria);
         if (WlAccidentVO.getAccidentPlace() != null)
             criteria.add(Expression.ilike("accidentPlace", WlAccidentVO.getAccidentPlace(), MatchMode.ANYWHERE));
         if (WlAccidentVO.getAccidentDescribe() != null)
             criteria.add(Expression.ilike("accidentDescribe", WlAccidentVO.getAccidentDescribe(), MatchMode.ANYWHERE));
         if (WlAccidentVO.getBookTime() != null)QueryAssCriteria.getDateCriteria(WlAccidentVO.getBookTime(),"bookTime",criteria);
         if (WlAccidentVO.getReportTime() != null)QueryAssCriteria.getDateCriteria(WlAccidentVO.getReportTime(),"reportTime",criteria);
         if (WlAccidentVO.getSolve() != null)
             criteria.add(Expression.ilike("solve", WlAccidentVO.getSolve(), MatchMode.ANYWHERE));
         if (WlAccidentVO.getLossFee() != null)QueryAssCriteria.getNumberCriteria(WlAccidentVO.getLossFee(),"lossFee",criteria);
         if (WlAccidentVO.getCompensation() != null)QueryAssCriteria.getNumberCriteria(WlAccidentVO.getCompensation(),"compensation",criteria);
         if (WlAccidentVO.getCompensateTime() != null)QueryAssCriteria.getDateCriteria(WlAccidentVO.getCompensateTime(),"compensateTime",criteria);
         if (WlAccidentVO.getInsurerFee() != null)QueryAssCriteria.getNumberCriteria(WlAccidentVO.getInsurerFee(),"insurerFee",criteria);
         if (WlAccidentVO.getInsurerTime() != null)QueryAssCriteria.getDateCriteria(WlAccidentVO.getInsurerTime(),"insurerTime",criteria);
         if (WlAccidentVO.getRemark() != null)
             criteria.add(Expression.ilike("remark", WlAccidentVO.getRemark(), MatchMode.ANYWHERE));
         if (WlAccidentVO.getTaskRows() != null)criteria.add(Expression.ilike("taskRows", WlAccidentVO.getTaskRows(), MatchMode.ANYWHERE));
        if (WlAccidentVO.getId() != 0) criteria.add(Expression.eq("id", WlAccidentVO.getId()));
         //if (WlAccidentVO.taskRow != null) criteria.createCriteria("taskRow").add(Expression.eq("id", taskRow));
         if (WlAccidentVO.getVoiture() != null){
        	 //criteria.createCriteria("voiture").add(Expression.eq("id", voiture));
        	 final Criteria criteriaVoi =criteria.createCriteria("voiture");
            	//QueryAssCriteriaOrder.getWlVoitureCriteria(WlAccidentVO.getVoiture(),criteriaVoi);
          }
         if (WlAccidentVO.getBreaker() != null){
        	 //criteria.createCriteria("breaker").add(Expression.eq("id", breaker));
        	 final Criteria criteriaPeo =criteria.createCriteria("breaker");
         	QueryAssCriteria.getPeopleCriteria(WlAccidentVO.getBreaker(),criteriaPeo);
         }
         if (WlAccidentVO.getBooker() != null){
        	 final Criteria criteriaPeo =criteria.createCriteria("booker");
          	QueryAssCriteria.getPeopleCriteria(WlAccidentVO.getBooker(),criteriaPeo);
         }
         if (WlAccidentVO.getReporter() != null){
        	 final Criteria criteriaPeo =criteria.createCriteria("reporter");
          	QueryAssCriteria.getPeopleCriteria(WlAccidentVO.getReporter(),criteriaPeo);
         }
	}
	

}
