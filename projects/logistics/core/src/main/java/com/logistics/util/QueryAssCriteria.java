package com.logistics.util;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Locale;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.MatchMode;

import com.logistics.entity.basic.WlPlaceVO;
import com.logistics.entity.orga.HandleInfoVO;
import com.logistics.entity.orga.OrgaInfoVO;
import com.logistics.entity.orga.PeopleVO;
import com.logistics.entity.orga.RoleInfoVO;

public class QueryAssCriteria  extends org.springframework.orm.hibernate3.support.HibernateDaoSupport{
	
	public static void getWLOrderQuotationCriteria(com.logistics.entity.customer.WlOrderQuotationVO wlOrderQuoptationVO, Criteria criteria){
		if (wlOrderQuoptationVO.getFeeType() != null)
            criteria.add(Expression.ilike("feeType", wlOrderQuoptationVO.getFeeType(), MatchMode.ANYWHERE));
		if (wlOrderQuoptationVO.getSum() != null)getNumberCriteria(wlOrderQuoptationVO.getSum(),"sum",criteria);
        //criteria.add(Expression.eq("sum", new java.lang.Double(sum)));
        if (wlOrderQuoptationVO.getRemark() != null)
            criteria.add(Expression.ilike("remark", wlOrderQuoptationVO.getRemark(), MatchMode.ANYWHERE));
        if (wlOrderQuoptationVO.getId() != 0)
        criteria.add(Expression.eq("id", wlOrderQuoptationVO.getId()));
        if (wlOrderQuoptationVO.getContract() != null){
        	 final Criteria criteriaCon =criteria.createCriteria("contract");
           	QueryAssCriteria.getWlContractCriteria(wlOrderQuoptationVO.getContract(),criteriaCon);
        	//criteria.createCriteria("contract").add(Expression.eq("id", contract));
        }
       // if (wlOrderQuoptationVO.getOrderRow() != null){
        	//criteria.createCriteria("orderRow").add(Expression.eq("id", orderRow));
        //}
	}
	
	public static void getWlQuotationCriteria(com.logistics.entity.customer.WlQuotationVO wlQuoptationVO, Criteria criteria){
		if (wlQuoptationVO.getTrafficWay() != null)
            criteria.add(Expression.ilike("trafficWay", wlQuoptationVO.getTrafficWay(), MatchMode.ANYWHERE));
        if (wlQuoptationVO.getReceiveType() != null)
            criteria.add(Expression.ilike("receiveType", wlQuoptationVO.getReceiveType(), MatchMode.ANYWHERE));
        if (wlQuoptationVO.getTransportType() != null)
            criteria.add(Expression.ilike("transportType", wlQuoptationVO.getTransportType(), MatchMode.ANYWHERE));
        if (wlQuoptationVO.getFeeType() != null)
            criteria.add(Expression.ilike("feeType", wlQuoptationVO.getFeeType(), MatchMode.ANYWHERE));
        if (wlQuoptationVO.getGoodsGrade() != null)
            criteria.add(Expression.ilike("goodsGrade", wlQuoptationVO.getGoodsGrade(), MatchMode.ANYWHERE));
        if (wlQuoptationVO.getBeginPrice() != null)
        	if (wlQuoptationVO.getBeginPrice() != null)getNumberCriteria(wlQuoptationVO.getBeginPrice(),"beginPrice",criteria);
	    //criteria.add(Expression.eq("beginPrice", new java.lang.Double(beginPrice)));
        if (wlQuoptationVO.getCountStander() != null)
            criteria.add(Expression.ilike("countStander", wlQuoptationVO.getCountStander(), MatchMode.ANYWHERE));
        //criteria.add(Expression.eq("lowerLimit", new java.lang.Double(lowerLimit)));
        if (wlQuoptationVO.getLowerLimit() != null)getNumberCriteria(wlQuoptationVO.getLowerLimit(),"lowerLimit",criteria);
	    //criteria.add(Expression.eq("upperLimit", new java.lang.Double(upperLimit)));
        if (wlQuoptationVO.getUpperLimit() != null)getNumberCriteria(wlQuoptationVO.getUpperLimit(),"upperLimit",criteria);
        //criteria.add(Expression.eq("unitPrice", new java.lang.Double(unitPrice)));
        if (wlQuoptationVO.getUnitPrice() != null)getNumberCriteria(wlQuoptationVO.getUnitPrice(),"unitPrice",criteria);
        if (wlQuoptationVO.getFilesState() != null)
            criteria.add(Expression.ilike("filesState", wlQuoptationVO.getFilesState(), MatchMode.ANYWHERE));
        if (wlQuoptationVO.getRemark() != null)
            criteria.add(Expression.ilike("remark", wlQuoptationVO.getRemark(), MatchMode.ANYWHERE));
        if (wlQuoptationVO.getId() != 0) criteria.add(Expression.eq("id", wlQuoptationVO.getId()));
        if (wlQuoptationVO.getContract() != null){
        	//criteria.createCriteria("contract").add(Expression.eq("id", contract));
        	 final Criteria criteriaCon =criteria.createCriteria("contract");
          	QueryAssCriteria.getWlContractCriteria(wlQuoptationVO.getContract(),criteriaCon);
        }
        /*if (wlQuoptationVO.getPath() != null){
        	//criteria.createCriteria("path").add(Expression.eq("id", path));
        	final Criteria criteriaPath =criteria.createCriteria("contract");
          	QueryAssCriteria.getWlContractCriteria(wlQuoptationVO.getContract(),criteriaCon);
        }*/
	}
	
	public static void getRoleOperateCriteria(com.logistics.entity.orga.RoleOperateVO RoleOperateVO, Criteria criteria){
		
	    if (RoleOperateVO.getId() != 0)
         criteria.add(Expression.eq("id", RoleOperateVO.getId()));
         if (RoleOperateVO.getRole() != null){ 
        	 final Criteria criteriaRole =criteria.createCriteria("role");
         	QueryAssCriteria.getRoleCriteria(RoleOperateVO.getRole(),criteriaRole);
        }
        if(RoleOperateVO.getHandle() != null){ 
        	final Criteria criteriaHandle =criteria.createCriteria("handle");
         	QueryAssCriteria.getHandleCriteria(RoleOperateVO.getHandle(),criteriaHandle);
        }
    }
	public static void getRoleCriteria(com.logistics.entity.orga.RoleInfoVO roleVO, Criteria criteria){
		if (roleVO.getRoleName() != null)
   		 criteria.add(Expression.ilike("roleName", roleVO.getRoleName(), MatchMode.ANYWHERE));
        if (roleVO.getRemark() != null)
       	 criteria.add(Expression.ilike("remark", roleVO.getRemark(), MatchMode.ANYWHERE));
        if (roleVO.getId() != 0)
       	 criteria.add(Expression.eq("id",roleVO.getId()));
	}
	
	public static void getPeopleRoleCriteria(com.logistics.entity.orga.PeopleRoleVO PeopleRoleVO, Criteria criteria){
		
	     if (PeopleRoleVO.getId() != 0)
             criteria.add(Expression.eq("id", PeopleRoleVO.getId()));
        if (PeopleRoleVO.getRole() != null){
        	final Criteria criteriaRole =criteria.createCriteria("role");
        	QueryAssCriteria.getRoleCriteria(PeopleRoleVO.getRole(),criteriaRole);
        }
        if (PeopleRoleVO.getPeople() != null) {
        	final Criteria criteriaPeo =criteria.createCriteria("people");
        	QueryAssCriteria.getPeopleCriteria(PeopleRoleVO.getPeople(),criteriaPeo);
        }
	}
	
	public static void getOrgaPeopleCriteria(com.logistics.entity.orga.OrgaPeopleVO OrgaPeopleVO, Criteria criteria){
	
	     if (OrgaPeopleVO.getId() != 0)
             criteria.add(Expression.eq("id", OrgaPeopleVO.getId()));
         if (OrgaPeopleVO.getPeople() != null) {
        	 	final Criteria criteriaPeo =   criteria.createCriteria("people");
     	    	QueryAssCriteria.getPeopleCriteria( OrgaPeopleVO.getPeople(), criteriaPeo);
     		}
        if (OrgaPeopleVO.getOrga() != null) {
        	final Criteria criteriaOrga =   criteria.createCriteria("orga");
 	    	QueryAssCriteria.getOrgaCriteria( OrgaPeopleVO.getOrga(), criteriaOrga);
 		}
	}
	public static void getWlContractCriteria(com.logistics.entity.customer.WlContractVO WlContract, Criteria criteria)
    {
		if (WlContract.getNo() != null)
	        criteria.add(Expression.ilike("no", WlContract.getNo(), MatchMode.ANYWHERE));
	    if (WlContract.getStatus() != null)
	        criteria.add(Expression.ilike("status", WlContract.getStatus(), MatchMode.ANYWHERE));
	    if (WlContract.getTel() != null)
	        criteria.add(Expression.ilike("tel", WlContract.getTel(), MatchMode.ANYWHERE));
	    if (WlContract.getDep() != null){
	    	Criteria criteriaDep=criteria.createCriteria("dep");
	    	QueryAssCriteria.getOrgaCriteria(WlContract.getDep(),criteriaDep);
	    }
	    if (WlContract.getFillDate() != null){
	    	if("=".equals(WlContract.getFillDate().getUpSign())){
	        	criteria.add(Expression.eq("fillDate", ProjectUtil.getDate(WlContract.getFillDate().getUpDate())));
	        }else if(">".equals(WlContract.getFillDate().getUpSign())){
	        	criteria.add(Expression.lt("fillDate", ProjectUtil.getDate(WlContract.getFillDate().getUpDate())));
	        }else if("¡Ý".equals(WlContract.getFillDate().getUpSign())){
	        	criteria.add(Expression.le("fillDate", ProjectUtil.getDate(WlContract.getFillDate().getUpDate())));
	        }
	        if(!"=".equals(WlContract.getFillDate().getUpSign())){
	            if(">".equals(WlContract.getFillDate().getDownSign())){
	            	criteria.add(Expression.gt("fillDate", ProjectUtil.getDate(WlContract.getFillDate().getDownDate())));
	            }else if("¡Ý".equals(WlContract.getFillDate().getDownSign())){
	            	criteria.add(Expression.ge("fillDate", ProjectUtil.getDate(WlContract.getFillDate().getDownDate())));
	            }
	        }
	    }
	    if (WlContract.getStartDate() != null){
	    	if("=".equals(WlContract.getStartDate().getUpSign())){
	        	criteria.add(Expression.eq("startDate", ProjectUtil.getDate(WlContract.getStartDate().getUpDate())));
	        }else if(">".equals(WlContract.getStartDate().getUpSign())){
	        	criteria.add(Expression.lt("startDate", ProjectUtil.getDate(WlContract.getStartDate().getUpDate())));
	        }else if("¡Ý".equals(WlContract.getStartDate().getUpSign())){
	        	criteria.add(Expression.le("startDate", ProjectUtil.getDate(WlContract.getStartDate().getUpDate())));
	        }
	        if(!"=".equals(WlContract.getStartDate().getUpSign())){
	            if(">".equals(WlContract.getStartDate().getDownSign())){
	            	criteria.add(Expression.gt("startDate", ProjectUtil.getDate(WlContract.getStartDate().getDownDate())));
	            }else if("¡Ý".equals(WlContract.getStartDate().getDownSign())){
	            	criteria.add(Expression.ge("startDate", ProjectUtil.getDate(WlContract.getStartDate().getDownDate())));
	            }
	        }
	    }
	    if (WlContract.getEndDate() != null){
	   	if("=".equals(WlContract.getEndDate().getUpSign())){
	        	criteria.add(Expression.eq("endDate", ProjectUtil.getDate(WlContract.getEndDate().getUpDate())));
	        }else if(">".equals(WlContract.getEndDate().getUpSign())){
	        	criteria.add(Expression.lt("endDate", ProjectUtil.getDate(WlContract.getEndDate().getUpDate())));
	        }else if("¡Ý".equals(WlContract.getEndDate().getUpSign())){
	        	criteria.add(Expression.le("endDate", ProjectUtil.getDate(WlContract.getEndDate().getUpDate())));
	        }
	        if(!"=".equals(WlContract.getEndDate().getUpSign())){
	            if(">".equals(WlContract.getEndDate().getDownSign())){
	            	criteria.add(Expression.gt("endDate", ProjectUtil.getDate(WlContract.getEndDate().getDownDate())));
	            }else if("¡Ý".equals(WlContract.getEndDate().getDownSign())){
	            	criteria.add(Expression.ge("endDate", ProjectUtil.getDate(WlContract.getEndDate().getDownDate())));
	            }
	        }
	    }
	    if (WlContract.getContractType() != null)
	        criteria.add(Expression.ilike("contractType", WlContract.getContractType(), MatchMode.ANYWHERE));
	    if (WlContract.getContRelation() != null)
	        criteria.add(Expression.ilike("contRelation", WlContract.getContRelation(), MatchMode.ANYWHERE));
	    if (WlContract.getPayWay() != null)
	        criteria.add(Expression.ilike("payWay", WlContract.getPayWay(), MatchMode.ANYWHERE));
	    if (WlContract.getCheckDate() != null){
	    	if("=".equals(WlContract.getCheckDate().getUpSign())){
	        	criteria.add(Expression.eq("checkDate", ProjectUtil.getDate(WlContract.getCheckDate().getUpDate())));
	        }else if(">".equals(WlContract.getCheckDate().getUpSign())){
	        	criteria.add(Expression.lt("checkDate", ProjectUtil.getDate(WlContract.getCheckDate().getUpDate())));
	        }else if("¡Ý".equals(WlContract.getCheckDate().getUpSign())){
	        	criteria.add(Expression.le("checkDate", ProjectUtil.getDate(WlContract.getCheckDate().getUpDate())));
	        }
	        if(!"=".equals(WlContract.getCheckDate().getUpSign())){
	            if(">".equals(WlContract.getCheckDate().getDownSign())){
	            	criteria.add(Expression.gt("checkDate", ProjectUtil.getDate(WlContract.getCheckDate().getDownDate())));
	            }else if("¡Ý".equals(WlContract.getCheckDate().getDownSign())){
	            	criteria.add(Expression.ge("checkDate", ProjectUtil.getDate(WlContract.getCheckDate().getDownDate())));
	            }
	        }
	    }
	    if (WlContract.getInsurance() != null)
	        criteria.add(Expression.ilike("insurance", WlContract.getInsurance(), MatchMode.ANYWHERE));
	    if(WlContract.getContractSum()!=null){
	    	if("=".equals(WlContract.getContractSum().getUpSign())){
	        	criteria.add(Expression.eq("contractSum", WlContract.getContractSum().getUpNumber()));
	        }else if(">".equals(WlContract.getContractSum().getUpSign())){
	        	criteria.add(Expression.lt("contractSum", WlContract.getContractSum().getUpNumber()));
	        }else if("¡Ý".equals(WlContract.getContractSum().getUpSign())){
	        	criteria.add(Expression.le("contractSum", WlContract.getContractSum().getUpNumber()));
	        }
	        if(!"=".equals(WlContract.getContractSum().getUpSign())){
	            if(">".equals(WlContract.getContractSum().getDownSign())){
	            	criteria.add(Expression.gt("contractSum", WlContract.getContractSum().getDownNumber()));
	            }else if("¡Ý".equals(WlContract.getContractSum().getDownSign())){
	            	criteria.add(Expression.ge("contractSum", WlContract.getContractSum().getDownNumber()));
	            }
	        }
	    }
	    if(WlContract.getEditionNo()!=null){
	    	if("=".equals(WlContract.getEditionNo().getUpSign())){
	        	criteria.add(Expression.eq("editionNo", WlContract.getEditionNo().getUpNumber()));
	        }else if(">".equals(WlContract.getEditionNo().getUpSign())){
	        	criteria.add(Expression.lt("editionNo", WlContract.getEditionNo().getUpNumber()));
	        }else if("¡Ý".equals(WlContract.getEditionNo().getUpSign())){
	        	criteria.add(Expression.le("editionNo", WlContract.getEditionNo().getUpNumber()));
	        }
	        if(!"=".equals(WlContract.getEditionNo().getUpSign())){
	            if(">".equals(WlContract.getEditionNo().getDownSign())){
	            	criteria.add(Expression.gt("editionNo", WlContract.getEditionNo().getDownNumber()));
	            }else if("¡Ý".equals(WlContract.getEditionNo().getDownSign())){
	            	criteria.add(Expression.ge("editionNo", WlContract.getEditionNo().getDownNumber()));
	            }
	        }
	    }
	    if (WlContract.getRemark() != null)
	        criteria.add(Expression.ilike("remark", WlContract.getRemark(), MatchMode.ANYWHERE));
	    if (WlContract.getId() != 0)
	    criteria.add(Expression.eq("id", WlContract.getId()));
	    if (WlContract.getCustomer() != null){
	    	Criteria criteriaCust =criteria.createCriteria("customer");
	    	QueryAssCriteria.getCustomerCriteria(WlContract.getCustomer(),criteriaCust);
	    }
	    if (WlContract.getPeople() != null) {
	    	final Criteria criteriaPeo =   criteria.createCriteria("people");
	    	QueryAssCriteria.getPeopleCriteria( WlContract.getPeople(), criteriaPeo);
		}
	    if (WlContract.getOrderCode() != null){
	    	Criteria criteriaOrder=criteria.createCriteria("orderCode");
	    	QueryAssCriteria.getWlOrderCriteria(WlContract.getOrderCode(),criteriaOrder);
	    	
	    }
    }
	public static void getHandleCriteria(com.logistics.entity.orga.HandleInfoVO HandleInfoVO, Criteria criteria)
    {
	     if (HandleInfoVO.getHandleSno() != null)
	        criteria.add(Expression.ilike("handleSno", HandleInfoVO.getHandleSno(), MatchMode.EXACT));
	    if (HandleInfoVO.getHandleName() != null)
	        criteria.add(Expression.ilike("handleName", HandleInfoVO.getHandleName(), MatchMode.ANYWHERE));
	    if (HandleInfoVO.getProgramName() != null)
	        criteria.add(Expression.ilike("programName", HandleInfoVO.getProgramName(), MatchMode.ANYWHERE));
	    if (HandleInfoVO.getRemark() != null)
	        criteria.add(Expression.ilike("remark", HandleInfoVO.getRemark(), MatchMode.ANYWHERE));
	    if (HandleInfoVO.getHandleType() != null)
	        criteria.add(Expression.ilike("handleType", HandleInfoVO.getHandleType(), MatchMode.ANYWHERE));
	    if (HandleInfoVO.getId() != 0)
	    criteria.add(Expression.eq("id", HandleInfoVO.getId()));
    }
	public static void getPeopleCriteria(com.logistics.entity.orga.PeopleVO peoVO, Criteria criteriaPeo)
    {
		if (peoVO.getId() != 0)
    		criteriaPeo.add(Expression.eq("id", peoVO.getId()));
		if (peoVO.getPeopleName() != null)
    		criteriaPeo.add(Expression.ilike("peopleName", peoVO.getPeopleName(), MatchMode.ANYWHERE));
        if (peoVO.getPeoplePassword() != null)
        	criteriaPeo.add(Expression.ilike("peoplePassword", peoVO.getPeoplePassword(), MatchMode.ANYWHERE));
        if (peoVO.getRemark() != null)
        	criteriaPeo.add(Expression.ilike("remark", peoVO.getRemark(), MatchMode.ANYWHERE));
        if (peoVO.getPeopleStatus() != null)
        	criteriaPeo.add(Expression.ilike("peopleStatus", peoVO.getPeopleStatus(), MatchMode.ANYWHERE));
        if (peoVO.getBirthDay() != null)
        {
        	if("=".equals(peoVO.getBirthDay().getUpSign())){
        		criteriaPeo.add(Expression.eq("birthDay", ProjectUtil.getDate(peoVO.getBirthDay().getUpDate())));
            }else if(">".equals(peoVO.getBirthDay().getUpSign())){
            	criteriaPeo.add(Expression.lt("birthDay", ProjectUtil.getDate(peoVO.getBirthDay().getUpDate())));
            }else if("¡Ý".equals(peoVO.getBirthDay().getUpSign())){
            	criteriaPeo.add(Expression.le("birthDay", ProjectUtil.getDate(peoVO.getBirthDay().getUpDate())));
            }
            if(!"=".equals(peoVO.getBirthDay().getUpSign())){
                if(">".equals(peoVO.getBirthDay().getDownSign())){
                	criteriaPeo.add(Expression.gt("birthDay", ProjectUtil.getDate(peoVO.getBirthDay().getDownDate())));
                }else if("¡Ý".equals(peoVO.getBirthDay().getDownSign())){
                	criteriaPeo.add(Expression.ge("birthDay", ProjectUtil.getDate(peoVO.getBirthDay().getDownDate())));
                }
            }
    	 }
    }
	
	public static void getPlaceCriteria(com.logistics.entity.basic.WlPlaceVO placeVO, Criteria criteriaPlace)
    {
		if (placeVO.getId() != 0)
			 criteriaPlace.add(Expression.eq("id", placeVO.getId())); 
		if (placeVO.getPlaceName() != null)
			 criteriaPlace.add(Expression.like("placeName", placeVO.getPlaceName(), MatchMode.ANYWHERE));
	    if (placeVO.getPostCode() != null)
	   	 criteriaPlace.add(Expression.like("postCode", placeVO.getPostCode(), MatchMode.ANYWHERE));
	    if (placeVO.getPlaceType() != null)
	   	 criteriaPlace.add(Expression.like("placeType", placeVO.getPlaceType(), MatchMode.ANYWHERE));
	    if (placeVO.getRemark() != null)
	   	 criteriaPlace.add(Expression.like("remark", placeVO.getRemark(), MatchMode.ANYWHERE));
    }
	
	public static void getPathCriteria(com.logistics.entity.basic.WlPathVO pathVO, Criteria criteriaPath)
    {
		if (pathVO.getPathName() != null)
            criteriaPath.add(Expression.ilike("pathName", pathVO.getPathName(), MatchMode.ANYWHERE));
		if (pathVO.getDistance() != null)criteriaPath.add(Expression.eq("distance", new java.lang.Double(pathVO.getDistance().getUpNumber())));
		if (pathVO.getLoanStandard() != null)criteriaPath.add(Expression.eq("loanStandard", new java.lang.Double(pathVO.getLoanStandard().getUpNumber())));
		if (pathVO.getTime() != null)criteriaPath.add(Expression.eq("time", new java.lang.Double(pathVO.getTime().getUpNumber())));
        if (pathVO.getId() != 0)
        criteriaPath.add(Expression.eq("id", pathVO.getId()));
        if (pathVO.getEndPlaceID() != null) {
        	Criteria  criteriaPlace=criteriaPath.createCriteria("endPlace");
        	QueryAssCriteria.getPlaceCriteria(pathVO.getEndPlaceID(), criteriaPlace);
        }
        if (pathVO.getStartPlaceID() != null) {
        	System.out.println("getOrderCriteria.getRwmark:pathVO.getStartPlaceID.getPlaceId:"+pathVO.getStartPlaceID().getId());
        	Criteria  criteriaPlace2=criteriaPath.createCriteria("startPlace");
        	QueryAssCriteria.getPlaceCriteria(pathVO.getStartPlaceID(), criteriaPlace2);
        }
        
    }
	
	public static void getCustomerCriteria(com.logistics.entity.customer.WlCustomerVO WlCustomer, Criteria criteria)
    {	
		if (WlCustomer.getCustomerName() != null)
	        criteria.add(Expression.ilike("customerName", WlCustomer.getCustomerName(), MatchMode.ANYWHERE));
	    if (WlCustomer.getJuridicalPerson() != null)
	        criteria.add(Expression.ilike("juridicalPerson", WlCustomer.getJuridicalPerson(), MatchMode.ANYWHERE));
	    if (WlCustomer.getEnrolDate() != null)
	    {
	    	 if("=".equals(WlCustomer.getEnrolDate().getUpSign())){
	            	criteria.add(Expression.eq("enrolDate", ProjectUtil.getDate(WlCustomer.getEnrolDate().getUpDate())));
	            }else if(">".equals(WlCustomer.getEnrolDate().getUpSign())){
	            	criteria.add(Expression.lt("enrolDate", ProjectUtil.getDate(WlCustomer.getEnrolDate().getUpDate())));
	            }else if("¡Ý".equals(WlCustomer.getEnrolDate().getUpSign())){
	            	criteria.add(Expression.le("enrolDate", ProjectUtil.getDate(WlCustomer.getEnrolDate().getUpDate())));
	            }
	            if(!"=".equals(WlCustomer.getEnrolDate().getUpSign())){
	                if(">".equals(WlCustomer.getEnrolDate().getDownSign())){
	                	criteria.add(Expression.gt("enrolDate", ProjectUtil.getDate(WlCustomer.getEnrolDate().getDownDate())));
	                }else if("¡Ý".equals(WlCustomer.getEnrolDate().getDownSign())){
	                	criteria.add(Expression.ge("enrolDate", ProjectUtil.getDate(WlCustomer.getEnrolDate().getDownDate())));
	                }
	            }
	    }
	    if(WlCustomer.getEnrolFund()!=null){
	    	if("=".equals(WlCustomer.getEnrolFund().getUpSign())){
	        	criteria.add(Expression.eq("enrolFund", WlCustomer.getEnrolFund().getUpNumber()));
	        }else if(">".equals(WlCustomer.getEnrolFund().getUpSign())){
	        	criteria.add(Expression.lt("enrolFund", WlCustomer.getEnrolFund().getUpNumber()));
	        }else if("¡Ý".equals(WlCustomer.getEnrolFund().getUpSign())){
	        	criteria.add(Expression.le("enrolFund", WlCustomer.getEnrolFund().getUpNumber()));
	        }
	        if(!"=".equals(WlCustomer.getEnrolFund().getUpSign())){
	            if(">".equals(WlCustomer.getEnrolFund().getDownSign())){
	            	criteria.add(Expression.gt("enrolFund", WlCustomer.getEnrolFund().getDownNumber()));
	            }else if("¡Ý".equals(WlCustomer.getEnrolFund().getDownSign())){
	            	criteria.add(Expression.ge("enrolFund", WlCustomer.getEnrolFund().getDownNumber()));
	            }
	        }
	    }
	    if (WlCustomer.getTaxResisterNo() != null)
	        criteria.add(Expression.ilike("taxResisterNo", WlCustomer.getTaxResisterNo(), MatchMode.ANYWHERE));
	    if (WlCustomer.getBank() != null)
	        criteria.add(Expression.ilike("bank", WlCustomer.getBank(), MatchMode.ANYWHERE));
	    if (WlCustomer.getAcountNO() != null)
	        criteria.add(Expression.ilike("acountNo", WlCustomer.getAcountNO(), MatchMode.ANYWHERE));
	    if (WlCustomer.getLinkman() != null)
	        criteria.add(Expression.ilike("linkman", WlCustomer.getLinkman(), MatchMode.ANYWHERE));
	    if (WlCustomer.getHeadTel() != null)
	        criteria.add(Expression.ilike("headTel", WlCustomer.getHeadTel(), MatchMode.ANYWHERE));
	    if (WlCustomer.getTel() != null)
	        criteria.add(Expression.ilike("tel", WlCustomer.getTel(), MatchMode.ANYWHERE));
	    if (WlCustomer.getMobil() != null)
	        criteria.add(Expression.ilike("mobil", WlCustomer.getMobil(), MatchMode.ANYWHERE));
	    if (WlCustomer.getEmail() != null)
	        criteria.add(Expression.ilike("email", WlCustomer.getEmail(), MatchMode.ANYWHERE));
	    if (WlCustomer.getFax() != null)
	        criteria.add(Expression.ilike("fax", WlCustomer.getFax(), MatchMode.ANYWHERE));
	    if (WlCustomer.getRelation() != null)
	        criteria.add(Expression.ilike("relation", WlCustomer.getRelation(), MatchMode.ANYWHERE));
	    if (WlCustomer.getPeopleCode() != null)
	        criteria.add(Expression.ilike("peopleCode", WlCustomer.getPeopleCode(), MatchMode.ANYWHERE));
	    if (WlCustomer.getPeopleName() != null)
	        criteria.add(Expression.ilike("peopleName", WlCustomer.getPeopleName(), MatchMode.ANYWHERE));
	    if (WlCustomer.getValue() != null)
	        criteria.add(Expression.ilike("value", WlCustomer.getValue(), MatchMode.ANYWHERE));
	    if (WlCustomer.getAddress() != null)criteria.add(Expression.ilike("address", WlCustomer.getAddress()));
	    if (WlCustomer.getParentCustomerID() != null)
	    criteria.add(Expression.eq("parentCustomerID", WlCustomer.getParentCustomerID().getId()));
	    if (WlCustomer.getCustomerStatus() != null)
	        criteria.add(Expression.ilike("customerStatus", WlCustomer.getCustomerStatus(), MatchMode.ANYWHERE));
	    if (WlCustomer.getCustomerSort() != null)
	        criteria.add(Expression.ilike("customerSort", WlCustomer.getCustomerSort(), MatchMode.ANYWHERE));
	    if (WlCustomer.getId() != 0)
	       criteria.add(Expression.eq("id", WlCustomer.getId()));
	    if (WlCustomer.getPeople() != null) {
	    	final Criteria criteriaPeo =   criteria.createCriteria("people");
	    	QueryAssCriteria.getPeopleCriteria( WlCustomer.getPeople(), criteriaPeo);
	    	}
	    if (WlCustomer.getPlace() != null) {
	    	final Criteria criteriaPlace =   criteria.createCriteria("place");
	    	QueryAssCriteria.getPlaceCriteria( WlCustomer.getPlace(), criteriaPlace);
	    }
	}
	public static void getCustCodeCriteria(com.logistics.entity.basic.WlCustCodeVO custCodeVO, Criteria criteria)
    {
		if (custCodeVO.getParCode() != 0)
		criteria.add(Expression.eq("parCode", new java.lang.Long(custCodeVO.getParCode())));
        if (custCodeVO.getCode() != null)
            criteria.add(Expression.ilike("code", custCodeVO.getCode(), MatchMode.START));
        if (custCodeVO.getSno() != null)
            criteria.add(Expression.ilike("sno", custCodeVO.getSno(), MatchMode.START));
        if (custCodeVO.getName() != null)
            criteria.add(Expression.ilike("name", custCodeVO.getName(), MatchMode.START));
        if (custCodeVO.getRemark() != null)
            criteria.add(Expression.ilike("remark", custCodeVO.getRemark(), MatchMode.START));
        if (custCodeVO.getId() != 0)
        	criteria.add(Expression.eq("id", custCodeVO.getId()));
        if (custCodeVO.getCustomer() != null) {
        	final Criteria criteriaCustomer =   criteria.createCriteria("customer");
        	QueryAssCriteria.getCustomerCriteria(custCodeVO.getCustomer(), criteriaCustomer);
        }
    }
	 public static void getCustProductCriteria(com.logistics.entity.basic.WlCustProductVO custProductVO, Criteria criteria)
    {
		 if (custProductVO.getProductCode() != null)
             criteria.add(Expression.ilike("productCode", custProductVO.getProductCode(), MatchMode.ANYWHERE));
         if (custProductVO.getEquName() != null)
             criteria.add(Expression.ilike("equName", custProductVO.getEquName(), MatchMode.ANYWHERE));
         if (custProductVO.getProductType() != null)
             criteria.add(Expression.ilike("productType", custProductVO.getProductType() , MatchMode.ANYWHERE));
         if (custProductVO.getModel() != null)
             criteria.add(Expression.ilike("model", custProductVO.getModel(), MatchMode.ANYWHERE));
         if (custProductVO.getUnit() != null)
             criteria.add(Expression.ilike("unit", custProductVO.getUnit(), MatchMode.ANYWHERE));
         if (custProductVO.getPrice() != null)criteria.add(Expression.eq("price", new java.lang.Double(custProductVO.getPrice().getUpNumber())));
         if (custProductVO.getWeight() != null)criteria.add(Expression.eq("weight", new java.lang.Double(custProductVO.getWeight().getUpNumber())));
         if (custProductVO.getVolume() != null)criteria.add(Expression.eq("volume", new java.lang.Double(custProductVO.getVolume().getUpNumber())));
         if (custProductVO.getLevel() != null)
             criteria.add(Expression.ilike("level", custProductVO.getLevel(), MatchMode.ANYWHERE));
         if (custProductVO.getRequest() != null)
             criteria.add(Expression.ilike("request", custProductVO.getRequest(), MatchMode.ANYWHERE));
         if (custProductVO.getRemark() != null)
             criteria.add(Expression.ilike("remark", custProductVO.getRemark(), MatchMode.ANYWHERE));
         if (custProductVO.getId() != 0)
         criteria.add(Expression.eq("id", custProductVO.getId()));
         if (custProductVO.getCodeID() != null){
	    	final Criteria criteriaCode=   criteria.createCriteria("codeId");
	    	QueryAssCriteria.getCustCodeCriteria(custProductVO.getCodeID(), criteriaCode);
	    	}
        if (custProductVO.getPack() != null){
        	final Criteria criteriaPack=   criteria.createCriteria("pack");
	    	QueryAssCriteria.getWlPackCriteria(custProductVO.getPack(), criteriaPack);
        }
    }
	 
	 public static void getWlPackCriteria(com.logistics.entity.store.WlPackVO packVO, Criteria criteria)
	    {
		 if (packVO.getPackName() != null)
             criteria.add(Expression.ilike("packName", packVO.getPackName(), MatchMode.ANYWHERE));
         /*if (packVO.getRemark() != null)
             criteria.add(Expression.ilike("remark", remark, MatchMode.ANYWHERE));
         if (packVO.getMasterUnit() != null)
             criteria.add(Expression.ilike("masterUnit", masterUnit, MatchMode.ANYWHERE));
         criteria.add(Expression.eq("masterUnitNum", new java.lang.Double(masterUnitNum)));
         if (packVO.getInnerPack() != null)
             criteria.add(Expression.ilike("innerPack", innerPack, MatchMode.ANYWHERE));
         criteria.add(Expression.eq("innerPackNum", new java.lang.Double(innerPackNum)));
         if (packVO.getBox() != null)
             criteria.add(Expression.ilike("box", box, MatchMode.ANYWHERE));
         criteria.add(Expression.eq("boxNum", new java.lang.Double(boxNum)));
         if (packVO.getWarehouse() != null)
             criteria.add(Expression.ilike("warehouse", warehouse, MatchMode.ANYWHERE));
         criteria.add(Expression.eq("warehouseNum", new java.lang.Double(warehouseNum)));
         if (packVO.getOther() != null)
             criteria.add(Expression.ilike("other", other, MatchMode.ANYWHERE));
         criteria.add(Expression.eq("otherNum", new java.lang.Double(otherNum)));
         if (packVO.getId() != null)
         criteria.add(Expression.eq("id", id));*/
	    }
	 
	public static void getOrgaCriteria(com.logistics.entity.orga.OrgaInfoVO orgaInfo, Criteria criteria)
    {
		if (orgaInfo.getOrgaSno() != null)
    		criteria.add(Expression.ilike("orgaSno", orgaInfo.getOrgaSno(), MatchMode.ANYWHERE));
        if (orgaInfo.getOrgaName() != null)
        	criteria.add(Expression.ilike("orgaName", orgaInfo.getOrgaName(), MatchMode.ANYWHERE));
        if (orgaInfo.getOrgaCode() != null)
        	criteria.add(Expression.ilike("orgaCode", orgaInfo.getOrgaCode(), MatchMode.ANYWHERE));
        if (orgaInfo.getRemark() != null)
        	criteria.add(Expression.ilike("remark", orgaInfo.getRemark(), MatchMode.ANYWHERE));
        if (orgaInfo.getOrgaState() != null)
        	criteria.add(Expression.ilike("orgaState", orgaInfo.getOrgaState(), MatchMode.ANYWHERE));
        if (orgaInfo.getId() != 0)
        	criteria.add(Expression.eq("id", orgaInfo.getId()));
    }
	  public static void getWlOrderCriteria(com.logistics.entity.order.WlOrderVO wlorder, Criteria criteria)
	    {
	    	
	    	//String sqls="select count(wlorder.id) from wlorder where 1=1 ";
	    	//final Session session = getSession(false);
	    	//try
	        //{
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
	            
	            /*if ( !"%".equals(wlorder.getReferTime())){
	                if (wlorder.getReferTime()=="null"){
	                 	criteria.add(Expression.eq("referTime", null));
	                }else if (wlorder.getReferTime().indexOf("to")==-1){
	                    criteria.add(Expression.eq("referTime", ProjectUtil.getDate(wlorder.getReferTime())));//,"yyyy-MM-dd HH:mm:ss.SSS"
	                }else if(wlorder.getReferTime().indexOf("to")!=wlorder.getReferTime().length()-2){
	                	String startDate  = wlorder.getReferTime().substring(0,wlorder.getReferTime().indexOf("to"));
	                	String endDate  = wlorder.getReferTime().substring(wlorder.getReferTime().indexOf("to")+2,wlorder.getReferTime().length());
	                	if(startDate!="")criteria.add(Expression.ge("referTime", ProjectUtil.getDate(startDate)));
	                	if(endDate!="")criteria.add(Expression.le("referTime", ProjectUtil.getDate(endDate)));
	                }
	            }*/
	            if (wlorder.getLinkMan() != null)
	                criteria.add(Expression.ilike("linkMan", wlorder.getLinkMan(), MatchMode.ANYWHERE));
	            if (wlorder.getTel() != null)
	                criteria.add(Expression.ilike("tel", wlorder.getTel(), MatchMode.ANYWHERE));
	            /*if (!"%".equals(wlorder.getBookTime())){   
	            	 if (wlorder.getBookTime()=="null"){
	                  	criteria.add(Expression.eq("bookTime", null));
	                      }else  if (wlorder.getBookTime().indexOf("to")==-1){
		                criteria.add(Expression.eq("bookTime", ProjectUtil.getDate(wlorder.getBookTime())));//,"yyyy-MM-dd HH:mm:ss.SSS"
		            }else if(wlorder.getBookTime().indexOf("to")!=wlorder.getBookTime().length()-2){
		            	String startDate  = wlorder.getBookTime().substring(0,wlorder.getBookTime().indexOf("to"));
		            	String endDate  = wlorder.getBookTime().substring(wlorder.getBookTime().indexOf("to")+2,wlorder.getBookTime().length());
		            	if(startDate!="")criteria.add(Expression.ge("bookTime", ProjectUtil.getDate(startDate)));
		            	if(endDate!="")criteria.add(Expression.le("bookTime", ProjectUtil.getDate(startDate)));
		            }
	            }
	            if (!"%".equals(wlorder.getCompleteTime())){
	            	if (wlorder.getCompleteTime()=="null"){
	                  	criteria.add(Expression.eq("completeTime", null));
	                }else  if (wlorder.getCompleteTime().indexOf("to")==-1){
	                    criteria.add(Expression.eq("completeTime", ProjectUtil.getDate(wlorder.getCompleteTime())));//,"yyyy-MM-dd HH:mm:ss.SSS"
	                }else if(wlorder.getCompleteTime().indexOf("to")!=wlorder.getCompleteTime().length()-2){
	                	String startDate  = wlorder.getCompleteTime().substring(0,wlorder.getCompleteTime().indexOf("to"));
	                	String endDate  = wlorder.getCompleteTime().substring(wlorder.getCompleteTime().indexOf("to")+2,wlorder.getCompleteTime().length());
	                	if(startDate!="")criteria.add(Expression.ge("completeTime", ProjectUtil.getDate(startDate)));
	                	if(endDate!="")criteria.add(Expression.le("completeTime", ProjectUtil.getDate(endDate)));
	                }
	            }*/
	            if (wlorder.getFormState() != null)
	                criteria.add(Expression.ilike("formState", wlorder.getFormState(), MatchMode.ANYWHERE));
	           /* if (!"%".equals(wlorder.getPlanFetchTime())){
	            	if (wlorder.getPlanFetchTime()=="null"){
	                  	criteria.add(Expression.eq("planFetchTime", null));
	                }else  if (wlorder.getPlanFetchTime().indexOf("to")==-1){
	                    criteria.add(Expression.eq("planFetchTime", ProjectUtil.getDate(wlorder.getPlanFetchTime())));//,"yyyy-MM-dd HH:mm:ss.SSS"
	                }else if(wlorder.getPlanFetchTime().indexOf("to")!=wlorder.getPlanFetchTime().length()-2){
	                	String startDate  = wlorder.getPlanFetchTime().substring(0,wlorder.getPlanFetchTime().indexOf("to"));
	                	String endDate  = wlorder.getPlanFetchTime().substring(wlorder.getPlanFetchTime().indexOf("to")+2,wlorder.getPlanFetchTime().length());
	                	if(startDate!="")criteria.add(Expression.ge("planFetchTime", ProjectUtil.getDate(startDate)));
	                	if(endDate!="")criteria.add(Expression.le("planFetchTime", ProjectUtil.getDate(endDate)));
	                }
	            }*/
	            if (wlorder.getFetchCompanyName() != null)
	                criteria.add(Expression.ilike("fetchCompanyName", wlorder.getFetchCompanyName(), MatchMode.ANYWHERE));
	            if (wlorder.getFetchCompanyAddress() != null)
	                criteria.add(Expression.ilike("fetchCompanyAddress", wlorder.getFetchCompanyAddress(), MatchMode.ANYWHERE));
	            if (wlorder.getFetchMan() != null)
	                criteria.add(Expression.ilike("fetchMan", wlorder.getFetchMan(), MatchMode.ANYWHERE));
	            if (wlorder.getFetchTel() != null)
	                criteria.add(Expression.ilike("fetchTel", wlorder.getFetchTel(), MatchMode.ANYWHERE));
	           // System.out.println("nmvmvtrtrtrtrt:"+wlorder.getPlanUnloadTime());
	            
	            /*if (!"%".equals(wlorder.getPlanUnloadTime())){   
	            	System.out.println("nmvmvtrtrtrioytrt:");
	            	if (wlorder.getPlanUnloadTime()=="null"){
	            	    criteria.add(Expression.eq("planUnloadTime", null));
	                }else if (wlorder.getPlanUnloadTime().indexOf("to")==-1){
	                    criteria.add(Expression.eq("planUnloadTime", ProjectUtil.getDate(wlorder.getPlanUnloadTime())));//,"yyyy-MM-dd HH:mm:ss.SSS"
	                }else if(wlorder.getPlanUnloadTime().indexOf("to")!=wlorder.getPlanUnloadTime().length()-2){
	                	String startDate  = wlorder.getPlanUnloadTime().substring(0,wlorder.getPlanUnloadTime().indexOf("to"));
	                	String endDate  = wlorder.getPlanUnloadTime().substring(wlorder.getPlanUnloadTime().indexOf("to")+2,wlorder.getPlanUnloadTime().length());
	                	if(startDate!="")criteria.add(Expression.ge("planUnloadTime", ProjectUtil.getDate(startDate)));
	                	if(endDate!="")criteria.add(Expression.le("planUnloadTime", ProjectUtil.getDate(endDate)));
	                }
	            }*/
	            if (wlorder.getUnloadCompanyName() != null)
	                criteria.add(Expression.ilike("unloadCompanyName", wlorder.getUnloadCompanyName(), MatchMode.ANYWHERE));
	            if (wlorder.getUnloadCompanyAddress() != null)
	                criteria.add(Expression.ilike("unloadCompanyAddress", wlorder.getUnloadCompanyAddress(), MatchMode.ANYWHERE));
	            if (wlorder.getUnloadMan() != null)
	                criteria.add(Expression.ilike("unloadMan", wlorder.getUnloadMan(), MatchMode.ANYWHERE));
	            if (wlorder.getUnloadTel() != null)
	                criteria.add(Expression.ilike("unloadTel", wlorder.getUnloadTel(), MatchMode.ANYWHERE));
	            if (wlorder.getRemark() != null)
	                criteria.add(Expression.ilike("remark", wlorder.getRemark(), MatchMode.ANYWHERE));
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
	           //return criteria;
	      /*  }
	        catch (org.hibernate.HibernateException ex)
	        {
	            throw super.convertHibernateAccessException(ex);
	        }*/
	}
	  public static void getNumberCriteria(com.logistics.entity.basic.NumberQuery number,String numberString, Criteria criteria){
		  if("=".equals(number.getUpSign())){
	      	criteria.add(Expression.eq(numberString, number.getUpNumber()));
	      }else if(">".equals(number.getUpSign())){
	      	criteria.add(Expression.lt(numberString, number.getUpNumber()));
	      }else if("¡Ý".equals(number.getUpSign())){
	      	criteria.add(Expression.le(numberString, number.getUpNumber()));
	      }
	      if(!"=".equals(number.getUpSign())){
	          if(">".equals(number.getDownSign())){
	          	criteria.add(Expression.gt(numberString, number.getDownNumber()));
	          }else if("¡Ý".equals(number.getDownSign())){
	          	criteria.add(Expression.ge(numberString, number.getDownNumber()));
	          }
	      }  
	  }
	  
	  public static void getDateCriteria(com.logistics.entity.basic.DateTimeQuery dateQuery,String dateString, Criteria criteria){
		  if("=".equals(dateQuery.getUpSign())){
	      	criteria.add(Expression.eq("dateString", ProjectUtil.getDate(dateQuery.getUpDate())));
	      }else if(">".equals(dateQuery.getUpSign())){
	      	criteria.add(Expression.lt("dateString", ProjectUtil.getDate(dateQuery.getUpDate())));
	      }else if("¡Ý".equals(dateQuery.getUpSign())){
	      	criteria.add(Expression.le("dateString", ProjectUtil.getDate(dateQuery.getUpDate())));
	      }
	      if(!"=".equals(dateQuery.getUpSign())){
	          if(">".equals(dateQuery.getDownSign())){
	          	criteria.add(Expression.gt("dateString", ProjectUtil.getDate(dateQuery.getDownDate())));
	          }else if("¡Ý".equals(dateQuery.getDownSign())){
	          	criteria.add(Expression.ge("dateString", ProjectUtil.getDate(dateQuery.getDownDate())));
	          }
	      }
	  }
	 
}
