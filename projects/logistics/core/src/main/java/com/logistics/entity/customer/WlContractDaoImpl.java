// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.entity.customer;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;

import com.logistics.entity.basic.DateTimeQuery;
import com.logistics.entity.basic.NumberQuery;
import com.logistics.entity.basic.WlPlaceVO;
import com.logistics.entity.car.WlVoiture;
import com.logistics.entity.order.WlOrderDaoImpl;
import com.logistics.entity.orga.PeopleVO;
import com.logistics.util.ProjectUtil;
import com.logistics.util.QueryAssCriteria;

/**
 * @see com.logistics.entity.customer.WlContract
 */
public class WlContractDaoImpl
    extends com.logistics.entity.customer.WlContractDaoBase
{
    /**
     * @see com.logistics.entity.customer.WlContractDao#getContractVO()
     */
    protected void handleGetContractVO()
    {
        // @todo implement public void handleGetContractVO()
        throw new java.lang.UnsupportedOperationException("com.logistics.entity.customer.WlContract.handleGetContractVO() Not implemented!");
}

    /**
     * @see com.logistics.entity.customer.WlContractDao#toWlContractVO(com.logistics.entity.customer.WlContract, com.logistics.entity.customer.WlContractVO)
     */
    public void toWlContractVO(
        com.logistics.entity.customer.WlContract source,
        com.logistics.entity.customer.WlContractVO target)
    {
        // @todo verify behavior of toWlContractVO
        super.toWlContractVO(source, target);
        // WARNING! No conversion for target.fillDate (can't convert source.getFillDate():java.util.Date to java.util.Date
        // WARNING! No conversion for target.orderCode (can't convert source.getOrderCode():com.logistics.entity.order.WlOrder to long
        DateTimeQuery tempday=new DateTimeQuery();
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getFillDate()));
        target.setFillDate(tempday);
        tempday=new DateTimeQuery();
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getCheckDate()));
        target.setCheckDate(tempday);
        tempday=new DateTimeQuery();
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getEndDate()));
        target.setEndDate(tempday);
        tempday=new DateTimeQuery();
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getStartDate()));
        target.setStartDate(tempday);
        NumberQuery tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getContractSum());
        target.setContractSum(tempNum);
        tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getEditionNo());
        target.setEditionNo(tempNum);
        target.setCustomer(this.getWlCustomerDao().toWlCustomerVO(source.getCustomer()));
        target.setOrderCode(this.getWlOrderDao().toWlOrderVO(source.getOrderCode()));
        target.setDep(this.getOrgaInfoDao().toOrgaInfoVO(source.getDep()));
        target.setPeople(this.getPeopleDao().toPeopleVO(source.getPeople()));
        target.setQuotations(source.getQuotations() == null ? null :this.getWlQuotationDao().toWlQuotationVOArray(source.getQuotations()));
        
    }


    /**
     * @see com.logistics.entity.customer.WlContractDao#toWlContractVO(com.logistics.entity.customer.WlContract)
     */
    public com.logistics.entity.customer.WlContractVO toWlContractVO(final com.logistics.entity.customer.WlContract entity)
    {
        // @todo verify behavior of toWlContractVO
        return super.toWlContractVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.customer.WlContract loadWlContractFromWlContractVO(com.logistics.entity.customer.WlContractVO wlContractVO)
    {
        // @todo implement loadWlContractFromWlContractVO
        //throw new java.lang.UnsupportedOperationException("com.logistics.entity.customer.loadWlContractFromWlContractVO(com.logistics.entity.customer.WlContractVO) not yet implemented.");

        /* A typical implementation looks like this:*/
        com.logistics.entity.customer.WlContract wlContract = this.load(wlContractVO.getId());
        if (wlContract == null)
        {
            wlContract = com.logistics.entity.customer.WlContract.Factory.newInstance();
        }
        return wlContract;
        
    }

    
    /**
     * @see com.logistics.entity.customer.WlContractDao#wlContractVOToEntity(com.logistics.entity.customer.WlContractVO)
     */
    public com.logistics.entity.customer.WlContract wlContractVOToEntity(com.logistics.entity.customer.WlContractVO wlContractVO)
    {
        // @todo verify behavior of wlContractVOToEntity
        com.logistics.entity.customer.WlContract entity = this.loadWlContractFromWlContractVO(wlContractVO);
        this.wlContractVOToEntity(wlContractVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.customer.WlContractDao#wlContractVOToEntity(com.logistics.entity.customer.WlContractVO, com.logistics.entity.customer.WlContract)
     */
    public void wlContractVOToEntity(
        com.logistics.entity.customer.WlContractVO source,
        com.logistics.entity.customer.WlContract target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wlContractVOToEntity
        super.wlContractVOToEntity(source, target, copyIfNull);
        // No conversion for target.fillDate (can't convert source.getFillDate():java.util.Date to java.util.Date
        if(source.getFillDate()!=null)target.setFillDate(ProjectUtil.getDate(source.getFillDate().getUpDate()));
        if(source.getCheckDate()!=null)target.setCheckDate(ProjectUtil.getDate(source.getCheckDate().getUpDate()));
        if(source.getContractSum()!=null)target.setContractSum(source.getContractSum().getUpNumber());
        if(source.getCustomer()!=null)target.setCustomer(this.getWlCustomerDao().load(source.getCustomer().getId()));
        if(source.getEditionNo()!=null)target.setEditionNo(source.getEditionNo().getUpNumber());
        if(source.getEndDate()!=null)target.setEndDate(ProjectUtil.getDate(source.getEndDate().getUpDate()));
        if(source.getOrderCode()!=null)target.setOrderCode(this.getWlOrderDao().load(source.getOrderCode().getId()));
        if(source.getPeople()!=null)target.setPeople(this.getPeopleDao().load(source.getPeople().getId()));
        if(source.getStartDate()!=null)target.setStartDate(ProjectUtil.getDate(source.getStartDate().getUpDate()));
        if(source.getDep()!=null)target.setDep(this.getOrgaInfoDao().load(source.getDep().getId()));
        
    }

	
	/*protected List handleGetWlContract(WlContractVO WlContract, int pageNumber,
			int pageSize, String orderBy) throws Exception {
		final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.customer.WlContractImpl.class);

            if (WlContract.getNo() != null)
                criteria.add(Expression.ilike("no", WlContract.getNo(), MatchMode.START));
            if (WlContract.getStatus() != null)
                criteria.add(Expression.ilike("status", WlContract.getStatus(), MatchMode.START));
            if (WlContract.getTel() != null)
                criteria.add(Expression.ilike("tel", WlContract.getTel(), MatchMode.START));
            if (WlContract.getDep() != null){
            	Criteria criteriaDep=criteria.createCriteria("dep");
            	QueryAssCriteria.getOrgaCriteria(WlContract.getDep(),criteriaDep);
            }
            //criteria.add(Expression.eq("dep", new java.lang.Long(WlContract.gdep)));
            if (WlContract.getFillDate() != null){
            	if("=".equals(WlContract.getFillDate().getUpSign())){
                	criteria.add(Expression.eq("fillDate", ProjectUtil.getDate(WlContract.getFillDate().getUpDate())));
                }else if(">".equals(WlContract.getFillDate().getUpSign())){
                	criteria.add(Expression.lt("fillDate", ProjectUtil.getDate(WlContract.getFillDate().getUpDate())));
                }else if("≥".equals(WlContract.getFillDate().getUpSign())){
                	criteria.add(Expression.le("fillDate", ProjectUtil.getDate(WlContract.getFillDate().getUpDate())));
                }
                if(!"=".equals(WlContract.getFillDate().getUpSign())){
	                if(">".equals(WlContract.getFillDate().getDownSign())){
	                	criteria.add(Expression.gt("fillDate", ProjectUtil.getDate(WlContract.getFillDate().getDownDate())));
	                }else if("≥".equals(WlContract.getFillDate().getDownSign())){
	                	criteria.add(Expression.ge("fillDate", ProjectUtil.getDate(WlContract.getFillDate().getDownDate())));
	                }
                }
            }
            if (WlContract.getStartTime() != null){
            //criteria.add(Expression.eq("startDate", startDate));
            	if("=".equals(WlContract.getStartTime().getUpSign())){
                	criteria.add(Expression.eq("startDate", ProjectUtil.getDate(WlContract.getStartTime().getUpDate())));
                }else if(">".equals(WlContract.getStartTime().getUpSign())){
                	criteria.add(Expression.lt("startDate", ProjectUtil.getDate(WlContract.getStartTime().getUpDate())));
                }else if("≥".equals(WlContract.getStartTime().getUpSign())){
                	criteria.add(Expression.le("startDate", ProjectUtil.getDate(WlContract.getStartTime().getUpDate())));
                }
                if(!"=".equals(WlContract.getStartTime().getUpSign())){
	                if(">".equals(WlContract.getStartTime().getDownSign())){
	                	criteria.add(Expression.gt("startDate", ProjectUtil.getDate(WlContract.getStartTime().getDownDate())));
	                }else if("≥".equals(WlContract.getStartTime().getDownSign())){
	                	criteria.add(Expression.ge("startDate", ProjectUtil.getDate(WlContract.getStartTime().getDownDate())));
	                }
                }
            }
            if (WlContract.getEndTime() != null){
            //criteria.add(Expression.eq("endDate", endDate));
            	if("=".equals(WlContract.getEndTime().getUpSign())){
                	criteria.add(Expression.eq("startDate", ProjectUtil.getDate(WlContract.getEndTime().getUpDate())));
                }else if(">".equals(WlContract.getEndTime().getUpSign())){
                	criteria.add(Expression.lt("startDate", ProjectUtil.getDate(WlContract.getEndTime().getUpDate())));
                }else if("≥".equals(WlContract.getEndTime().getUpSign())){
                	criteria.add(Expression.le("startDate", ProjectUtil.getDate(WlContract.getEndTime().getUpDate())));
                }
                if(!"=".equals(WlContract.getEndTime().getUpSign())){
	                if(">".equals(WlContract.getEndTime().getDownSign())){
	                	criteria.add(Expression.gt("startDate", ProjectUtil.getDate(WlContract.getEndTime().getDownDate())));
	                }else if("≥".equals(WlContract.getEndTime().getDownSign())){
	                	criteria.add(Expression.ge("startDate", ProjectUtil.getDate(WlContract.getEndTime().getDownDate())));
	                }
                }
            }
            if (WlContract.getContractType() != null)
                criteria.add(Expression.ilike("contractType", WlContract.getContractType(), MatchMode.START));
            if (WlContract.getContRelation() != null)
                criteria.add(Expression.ilike("contRelation", WlContract.getContRelation(), MatchMode.START));
            if (WlContract.getPayWay() != null)
                criteria.add(Expression.ilike("payWay", WlContract.getPayWay(), MatchMode.START));
            if (WlContract.getCheckDate() != null){
            //criteria.add(Expression.eq("checkDate", checkDate));
            	if("=".equals(WlContract.getCheckDate().getUpSign())){
                	criteria.add(Expression.eq("checkDate", ProjectUtil.getDate(WlContract.getCheckDate().getUpDate())));
                }else if(">".equals(WlContract.getCheckDate().getUpSign())){
                	criteria.add(Expression.lt("checkDate", ProjectUtil.getDate(WlContract.getCheckDate().getUpDate())));
                }else if("≥".equals(WlContract.getCheckDate().getUpSign())){
                	criteria.add(Expression.le("checkDate", ProjectUtil.getDate(WlContract.getCheckDate().getUpDate())));
                }
                if(!"=".equals(WlContract.getCheckDate().getUpSign())){
	                if(">".equals(WlContract.getCheckDate().getDownSign())){
	                	criteria.add(Expression.gt("checkDate", ProjectUtil.getDate(WlContract.getCheckDate().getDownDate())));
	                }else if("≥".equals(WlContract.getCheckDate().getDownSign())){
	                	criteria.add(Expression.ge("checkDate", ProjectUtil.getDate(WlContract.getCheckDate().getDownDate())));
	                }
                }
            }
            if (WlContract.getInsurance() != null)
                criteria.add(Expression.ilike("insurance", WlContract.getInsurance(), MatchMode.START));
            if(WlContract.getContractSum()!=null){
            	if("=".equals(WlContract.getContractSum().getUpSign())){
                	criteria.add(Expression.eq("contractSum", WlContract.getContractSum().getUpNumber()));
                }else if(">".equals(WlContract.getContractSum().getUpSign())){
                	criteria.add(Expression.lt("contractSum", WlContract.getContractSum().getUpNumber()));
                }else if("≥".equals(WlContract.getContractSum().getUpSign())){
                	criteria.add(Expression.le("contractSum", WlContract.getContractSum().getUpNumber()));
                }
                if(!"=".equals(WlContract.getContractSum().getUpSign())){
	                if(">".equals(WlContract.getContractSum().getDownSign())){
	                	criteria.add(Expression.gt("contractSum", WlContract.getContractSum().getDownNumber()));
	                }else if("≥".equals(WlContract.getContractSum().getDownSign())){
	                	criteria.add(Expression.ge("contractSum", WlContract.getContractSum().getDownNumber()));
	                }
                }
            }
            //criteria.add(Expression.eq("editionNo", new java.lang.Double(WlContracteditionNo)));
            if(WlContract.getEditionNo()!=null){
            	if("=".equals(WlContract.getEditionNo().getUpSign())){
                	criteria.add(Expression.eq("editionNo", WlContract.getEditionNo().getUpNumber()));
                }else if(">".equals(WlContract.getEditionNo().getUpSign())){
                	criteria.add(Expression.lt("editionNo", WlContract.getEditionNo().getUpNumber()));
                }else if("≥".equals(WlContract.getEditionNo().getUpSign())){
                	criteria.add(Expression.le("editionNo", WlContract.getEditionNo().getUpNumber()));
                }
                if(!"=".equals(WlContract.getEditionNo().getUpSign())){
	                if(">".equals(WlContract.getEditionNo().getDownSign())){
	                	criteria.add(Expression.gt("editionNo", WlContract.getEditionNo().getDownNumber()));
	                }else if("≥".equals(WlContract.getEditionNo().getDownSign())){
	                	criteria.add(Expression.ge("editionNo", WlContract.getEditionNo().getDownNumber()));
	                }
                }
            }
            
            if (WlContract.getRemark() != null)
                criteria.add(Expression.ilike("remark", WlContract.getRemark(), MatchMode.START));
            if (WlContract.getId() != 0)
            criteria.add(Expression.eq("id", WlContract.getId()));
            if (WlContract.getCustomer() != null){ 
            	//criteria.createCriteria("customer").add(Expression.eq("id", customer));
            	//begincustomer
            	final Criteria criteriaCust =criteria.createCriteria("customer");
            	WlCustomerVO WlCustomer=WlContract.getCustomer();
            	 if (WlCustomer.getCustomerName() != null)
                     criteriaCust.add(Expression.ilike("customerName", WlCustomer.getCustomerName(), MatchMode.START));
                 if (WlCustomer.getJuridicalPerson() != null)
                     criteriaCust.add(Expression.ilike("juridicalPerson", WlCustomer.getJuridicalPerson(), MatchMode.START));
                 if (WlCustomer.getEnrolDate() != null)
                 {
                 	 if("=".equals(WlCustomer.getEnrolDate().getUpSign())){
     	                	criteriaCust.add(Expression.eq("enrolDate", ProjectUtil.getDate(WlCustomer.getEnrolDate().getUpDate())));
     	                }else if(">".equals(WlCustomer.getEnrolDate().getUpSign())){
     	                	criteriaCust.add(Expression.lt("enrolDate", ProjectUtil.getDate(WlCustomer.getEnrolDate().getUpDate())));
     	                }else if("≥".equals(WlCustomer.getEnrolDate().getUpSign())){
     	                	criteriaCust.add(Expression.le("enrolDate", ProjectUtil.getDate(WlCustomer.getEnrolDate().getUpDate())));
     	                }
     	                if(!"=".equals(WlCustomer.getEnrolDate().getUpSign())){
     		                if(">".equals(WlCustomer.getEnrolDate().getDownSign())){
     		                	criteriaCust.add(Expression.gt("enrolDate", ProjectUtil.getDate(WlCustomer.getEnrolDate().getDownDate())));
     		                }else if("≥".equals(WlCustomer.getEnrolDate().getDownSign())){
     		                	criteriaCust.add(Expression.ge("enrolDate", ProjectUtil.getDate(WlCustomer.getEnrolDate().getDownDate())));
     		                }
     	                }
                 }
                 if(WlCustomer.getEnrolFund()!=null){
                 	if("=".equals(WlCustomer.getEnrolFund().getUpSign())){
                     	criteria.add(Expression.eq("enrolFund", WlCustomer.getEnrolFund().getUpNumber()));
                     }else if(">".equals(WlCustomer.getEnrolFund().getUpSign())){
                     	criteria.add(Expression.lt("enrolFund", WlCustomer.getEnrolFund().getUpNumber()));
                     }else if("≥".equals(WlCustomer.getEnrolFund().getUpSign())){
                     	criteria.add(Expression.le("enrolFund", WlCustomer.getEnrolFund().getUpNumber()));
                     }
                     if(!"=".equals(WlCustomer.getEnrolFund().getUpSign())){
     	                if(">".equals(WlCustomer.getEnrolFund().getDownSign())){
     	                	criteria.add(Expression.gt("enrolFund", WlCustomer.getEnrolFund().getDownNumber()));
     	                }else if("≥".equals(WlCustomer.getEnrolFund().getDownSign())){
     	                	criteria.add(Expression.ge("enrolFund", WlCustomer.getEnrolFund().getDownNumber()));
     	                }
                     }
                 }
                 if (WlCustomer.getTaxResisterNo() != null)
                     criteriaCust.add(Expression.ilike("taxResisterNo", WlCustomer.getTaxResisterNo(), MatchMode.START));
                 if (WlCustomer.getBank() != null)
                     criteriaCust.add(Expression.ilike("bank", WlCustomer.getBank(), MatchMode.START));
                 if (WlCustomer.getAcnountNO() != null)
                     criteriaCust.add(Expression.ilike("acountNo", WlCustomer.getAcnountNO(), MatchMode.START));
                 if (WlCustomer.getLinkman() != null)
                     criteriaCust.add(Expression.ilike("linkman", WlCustomer.getLinkman(), MatchMode.START));
                 if (WlCustomer.getHeadTel() != null)
                     criteriaCust.add(Expression.ilike("headTel", WlCustomer.getHeadTel(), MatchMode.START));
                 if (WlCustomer.getTel() != null)
                     criteriaCust.add(Expression.ilike("tel", WlCustomer.getTel(), MatchMode.START));
                 if (WlCustomer.getMobil() != null)
                     criteriaCust.add(Expression.ilike("mobil", WlCustomer.getMobil(), MatchMode.START));
                 if (WlCustomer.getEmail() != null)
                     criteriaCust.add(Expression.ilike("email", WlCustomer.getEmail(), MatchMode.START));
                 if (WlCustomer.getFax() != null)
                     criteriaCust.add(Expression.ilike("fax", WlCustomer.getFax(), MatchMode.START));
                 if (WlCustomer.getRelation() != null)
                     criteriaCust.add(Expression.ilike("relation", WlCustomer.getRelation(), MatchMode.START));
                 if (WlCustomer.getPeopleCode() != null)
                     criteriaCust.add(Expression.ilike("peopleCode", WlCustomer.getPeopleCode(), MatchMode.START));
                 if (WlCustomer.getPeopleName() != null)
                     criteriaCust.add(Expression.ilike("peopleName", WlCustomer.getPeopleName(), MatchMode.START));
                 if (WlCustomer.getValue() != null)
                     criteriaCust.add(Expression.ilike("value", WlCustomer.getValue(), MatchMode.START));
                 criteriaCust.add(Expression.eq("address", new java.lang.Long(WlCustomer.getAddress())));
                 if (WlCustomer.getParentCustomerID() != null)
                 criteriaCust.add(Expression.eq("parentCustomerID", WlCustomer.getParentCustomerID().getId()));
                 if (WlCustomer.getCustomerStatus() != null)
                     criteriaCust.add(Expression.ilike("customerStatus", WlCustomer.getCustomerStatus(), MatchMode.START));
                 if (WlCustomer.getCustomerSort() != null)
                     criteriaCust.add(Expression.ilike("customerSort", WlCustomer.getCustomerSort(), MatchMode.START));
                 if (WlCustomer.getId() != 0)
                 criteriaCust.add(Expression.eq("id", WlCustomer.getId()));
                 if (WlCustomer.getPeople() != null) {
                 	//criteriaCust.createcriteriaCust("people").add(Expression.eq("id", people));
                 	
                 	PeopleVO peoVO=WlCustomer.getPeople();
                 	final Criteria criteriaCustPeo =   criteriaCust.createCriteria("people");
                 	if (peoVO.getPeopleName() != null)
                 		criteriaCustPeo.add(Expression.ilike("peopleName", peoVO.getPeopleName(), MatchMode.START));
                     if (peoVO.getPeoplePassword() != null)
                     	criteriaCustPeo.add(Expression.ilike("peoplePassword", peoVO.getPeoplePassword(), MatchMode.START));
                     if (peoVO.getRemark() != null)
                     	criteriaCustPeo.add(Expression.ilike("remark", peoVO.getRemark(), MatchMode.START));
                     if (peoVO.getPeopleStatus() != null)
                     	criteriaCustPeo.add(Expression.ilike("peopleStatus", peoVO.getPeopleStatus(), MatchMode.START));
                     if (peoVO.getBirthDay() != null)
                     {
                     	if("=".equals(peoVO.getBirthDay().getUpSign())){
                     		criteriaCustPeo.add(Expression.eq("birthDay", ProjectUtil.getDate(peoVO.getBirthDay().getUpDate())));
     	                }else if(">".equals(peoVO.getBirthDay().getUpSign())){
     	                	criteriaCustPeo.add(Expression.lt("birthDay", ProjectUtil.getDate(peoVO.getBirthDay().getUpDate())));
     	                }else if("≥".equals(peoVO.getBirthDay().getUpSign())){
     	                	criteriaCustPeo.add(Expression.le("birthDay", ProjectUtil.getDate(peoVO.getBirthDay().getUpDate())));
     	                }
     	                if(!"=".equals(peoVO.getBirthDay().getUpSign())){
     		                if(">".equals(peoVO.getBirthDay().getDownSign())){
     		                	criteriaCustPeo.add(Expression.gt("birthDay", ProjectUtil.getDate(peoVO.getBirthDay().getDownDate())));
     		                }else if("≥".equals(peoVO.getBirthDay().getDownSign())){
     		                	criteriaCustPeo.add(Expression.ge("birthDay", ProjectUtil.getDate(peoVO.getBirthDay().getDownDate())));
     		                }
     	                }
                 	
                 }}
                 if (WlCustomer.getPlace() != null) {
                 	//criteriaCust.createcriteriaCust("place").add(Expression.eq("id", place));
                 	WlPlaceVO placeVO=WlCustomer.getPlace();
                 	final Criteria criteriaCustPlace =   criteriaCust.createCriteria("place");
                 	 if (placeVO.getPlaceName() != null)
                 		 criteriaCustPlace.add(Expression.like("placeName", placeVO.getPlaceName(), MatchMode.START));
                      if (placeVO.getPostCode() != null)
                     	 criteriaCustPlace.add(Expression.like("postCode", placeVO.getPostCode(), MatchMode.START));
                      if (placeVO.getPlaceType() != null)
                     	 criteriaCustPlace.add(Expression.like("placeType", placeVO.getPlaceType(), MatchMode.START));
                      if (placeVO.getRemark() != null)
                     	 criteriaCustPlace.add(Expression.like("remark", placeVO.getRemark(), MatchMode.START));
                 }
            //customerend	
            }
            if (WlContract.getPeople() != null) {
            	//criteria.createCriteria("people").add(Expression.eq("id", people));
            	//begin
            	PeopleVO peoVO=WlContract.getPeople();
            	final Criteria criteriaPeo =   criteria.createCriteria("people");
            	if (peoVO.getPeopleName() != null)
            		criteriaPeo.add(Expression.ilike("peopleName", peoVO.getPeopleName(), MatchMode.START));
                if (peoVO.getPeoplePassword() != null)
                	criteriaPeo.add(Expression.ilike("peoplePassword", peoVO.getPeoplePassword(), MatchMode.START));
                if (peoVO.getRemark() != null)
                	criteriaPeo.add(Expression.ilike("remark", peoVO.getRemark(), MatchMode.START));
                if (peoVO.getPeopleStatus() != null)
                	criteriaPeo.add(Expression.ilike("peopleStatus", peoVO.getPeopleStatus(), MatchMode.START));
                if (peoVO.getBirthDay() != null)
                {
                	if("=".equals(peoVO.getBirthDay().getUpSign())){
                		criteriaPeo.add(Expression.eq("birthDay", ProjectUtil.getDate(peoVO.getBirthDay().getUpDate())));
	                }else if(">".equals(peoVO.getBirthDay().getUpSign())){
	                	criteriaPeo.add(Expression.lt("birthDay", ProjectUtil.getDate(peoVO.getBirthDay().getUpDate())));
	                }else if("≥".equals(peoVO.getBirthDay().getUpSign())){
	                	criteriaPeo.add(Expression.le("birthDay", ProjectUtil.getDate(peoVO.getBirthDay().getUpDate())));
	                }
	                if(!"=".equals(peoVO.getBirthDay().getUpSign())){
		                if(">".equals(peoVO.getBirthDay().getDownSign())){
		                	criteriaPeo.add(Expression.gt("birthDay", ProjectUtil.getDate(peoVO.getBirthDay().getDownDate())));
		                }else if("≥".equals(peoVO.getBirthDay().getDownSign())){
		                	criteriaPeo.add(Expression.ge("birthDay", ProjectUtil.getDate(peoVO.getBirthDay().getDownDate())));
		                }
	                }
                }
                if (peoVO.getSex() != null)
                	criteriaPeo.add(Expression.ilike("sex", peoVO.getSex(), MatchMode.START));
                if (peoVO.getBirthPlace() != null)
                	criteriaPeo.add(Expression.ilike("birthPlace", peoVO.getBirthPlace(), MatchMode.START));
                if (peoVO.getAddress() != null)
                	criteriaPeo.add(Expression.ilike("address", peoVO.getAddress(), MatchMode.START));
                if (peoVO.getTel() != null)
                	criteriaPeo.add(Expression.ilike("tel", peoVO.getTel(), MatchMode.START));
                if (peoVO.getEngageMode() != null)
                	criteriaPeo.add(Expression.ilike("engageMode", peoVO.getEngageMode(), MatchMode.START));
                if (peoVO.getEngageDate() != null)
                {
                	if("=".equals(peoVO.getEngageDate().getUpSign())){
                		criteriaPeo.add(Expression.eq("engageDate", ProjectUtil.getDate(peoVO.getEngageDate().getUpDate())));
	                }else if(">".equals(peoVO.getEngageDate().getUpSign())){
	                	criteriaPeo.add(Expression.lt("engageDate", ProjectUtil.getDate(peoVO.getEngageDate().getUpDate())));
	                }else if("≥".equals(peoVO.getEngageDate().getUpSign())){
	                	criteriaPeo.add(Expression.le("engageDate", ProjectUtil.getDate(peoVO.getEngageDate().getUpDate())));
	                }
	                if(!"=".equals(peoVO.getEngageDate().getUpSign())){
		                if(">".equals(peoVO.getEngageDate().getDownSign())){
		                	criteriaPeo.add(Expression.gt("engageDate", ProjectUtil.getDate(peoVO.getEngageDate().getDownDate())));
		                }else if("≥".equals(peoVO.getEngageDate().getDownSign())){
		                	criteriaPeo.add(Expression.ge("engageDate", ProjectUtil.getDate(peoVO.getEngageDate().getDownDate())));
		                }
	                }
                }
                if (peoVO.getGrade() != null)
                	criteriaPeo.add(Expression.ilike("grade", peoVO.getGrade(), MatchMode.START));
                if (peoVO.getId() != 0)
                	criteriaPeo.add(Expression.eq("id", peoVO.getId()));
            	//end
            }
            if (WlContract.getOrderCode() != null){
            	Criteria criteriaOrder=criteria.createCriteria("orderCode");
            	QueryAssCriteria.getWlOrderCriteria(WlContract.getOrderCode(),criteriaOrder);
            	
            }
          //条数
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
                    .uniqueResult())  
                    .intValue();//取得符合条件的总数  
      
		      criteria.setProjection(null);  
		      WlContract or=new com.logistics.entity.customer.WlContractImpl();
		     or.setId(new Long(totalCount));
		     //or.setRemark(new Integer(totalCount).toString());
		     if (pageNumber > 0 && pageSize > 0)
		     {
		     	criteria.setFirstResult(this.calculateFirstResult(pageNumber, pageSize));
		     	criteria.setMaxResults(pageSize);
		     }else{
		     	criteria.setMaxResults(100);
		     }
		     List re=criteria.list();
		     re.add(or);
		     return re;
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
	}
  */
    protected List handleGetWlContract(WlContractVO WlContract, int pageNumber,int pageSize, String orderBy) throws Exception {
		
    	final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.customer.WlContractImpl.class);
            if (WlContract != null) QueryAssCriteria.getWlContractCriteria(WlContract,criteria);
            
          //条数
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
                    .uniqueResult())  
                    .intValue();//取得符合条件的总数  
      
		      criteria.setProjection(null);  
		      WlContract or=new com.logistics.entity.customer.WlContractImpl();
		     or.setId(new Long(totalCount));
		     //or.setRemark(new Integer(totalCount).toString());
		     if (pageNumber > 0 && pageSize > 0)
		     {
		     	criteria.setFirstResult(this.calculateFirstResult(pageNumber, pageSize));
		     	criteria.setMaxResults(pageSize);
		     }else{
		     	criteria.setMaxResults(100);
		     }
		     List re=criteria.list();
		     re.add(or);
		     return re;
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
	}
 
    
}