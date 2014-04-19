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
import com.logistics.entity.orga.PeopleVO;
import com.logistics.util.ProjectUtil;
import com.logistics.util.QueryAssCriteria;

/**
 * @see com.logistics.entity.customer.WlCustomer
 */
public class WlCustomerDaoImpl
    extends com.logistics.entity.customer.WlCustomerDaoBase
{
    /**
     * @see com.logistics.entity.customer.WlCustomerDao#getCustomerVO()
     */
    protected void handleGetCustomerVO()
    {
        // @todo implement public void handleGetCustomerVO()
        throw new java.lang.UnsupportedOperationException("com.logistics.entity.customer.WlCustomer.handleGetCustomerVO() Not implemented!");
}

    /**
     * @see com.logistics.entity.customer.WlCustomerDao#toWlCustomerVO(com.logistics.entity.customer.WlCustomer, com.logistics.entity.customer.WlCustomerVO)
     */
    public void toWlCustomerVO(
        com.logistics.entity.customer.WlCustomer source,
        com.logistics.entity.customer.WlCustomerVO target)
    {
        // @todo verify behavior of toWlCustomerVO
        super.toWlCustomerVO(source, target);
        target.setPlace(this.getWlPlaceDao().toWlPlaceVO(source.getPlace()));
        DateTimeQuery tempday=new DateTimeQuery();
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getEnrolDate()));
    	target.setEnrolDate(tempday);
    	NumberQuery tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getEnrolFund());
        target.setEnrolFund(tempNum);
        // target.setParentCustomerID(this.toWlCustomerVO(this.load(source.getParentCustomerID())));
        target.setPeople(this.getPeopleDao().toPeopleVO(source.getPeople()));
        // WARNING! No conversion for target.enrolDate (can't convert source.getEnrolDate():java.util.Date to java.util.Date
        // WARNING! No conversion for target.place (can't convert source.getPlace():com.logistics.entity.basic.WlPlace to long
    }


    /**
     * @see com.logistics.entity.customer.WlCustomerDao#toWlCustomerVO(com.logistics.entity.customer.WlCustomer)
     */
    public com.logistics.entity.customer.WlCustomerVO toWlCustomerVO(final com.logistics.entity.customer.WlCustomer entity)
    {
        // @todo verify behavior of toWlCustomerVO
        return super.toWlCustomerVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.customer.WlCustomer loadWlCustomerFromWlCustomerVO(com.logistics.entity.customer.WlCustomerVO wlCustomerVO)
    {
        // @todo implement loadWlCustomerFromWlCustomerVO
        //throw new java.lang.UnsupportedOperationException("com.logistics.entity.customer.loadWlCustomerFromWlCustomerVO(com.logistics.entity.customer.WlCustomerVO) not yet implemented.");

        /* A typical implementation looks like this:  */
        com.logistics.entity.customer.WlCustomer wlCustomer = this.load(wlCustomerVO.getId());
        if (wlCustomer == null)
        {
            wlCustomer = com.logistics.entity.customer.WlCustomer.Factory.newInstance();
        }
        return wlCustomer;
      
    }

    
    /**
     * @see com.logistics.entity.customer.WlCustomerDao#wlCustomerVOToEntity(com.logistics.entity.customer.WlCustomerVO)
     */
    public com.logistics.entity.customer.WlCustomer wlCustomerVOToEntity(com.logistics.entity.customer.WlCustomerVO wlCustomerVO)
    {
        // @todo verify behavior of wlCustomerVOToEntity
        com.logistics.entity.customer.WlCustomer entity = this.loadWlCustomerFromWlCustomerVO(wlCustomerVO);
        this.wlCustomerVOToEntity(wlCustomerVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.customer.WlCustomerDao#wlCustomerVOToEntity(com.logistics.entity.customer.WlCustomerVO, com.logistics.entity.customer.WlCustomer)
     */
    public void wlCustomerVOToEntity(
        com.logistics.entity.customer.WlCustomerVO source,
        com.logistics.entity.customer.WlCustomer target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wlCustomerVOToEntity
        super.wlCustomerVOToEntity(source, target, copyIfNull);
        if(source.getPlace()!=null)target.setPlace(this.getWlPlaceDao().load(source.getPlace().getId()));
        if(source.getParentCustomerID()!=null)target.setParentCustomerID(source.getParentCustomerID().getId());
        if(source.getPeople()!=null)target.setPeople(this.getPeopleDao().load(source.getPeople().getId()));
        if(source.getEnrolFund()!=null)target.setEnrolFund(source.getEnrolFund().getUpNumber());
        if(source.getEnrolDate()!=null)target.setEnrolDate(ProjectUtil.getDate(source.getEnrolDate().getUpDate()));
    }

	protected List handleGetWlCustomerByStatusAndSort(java.lang.String status, java.lang.String sort, int pageNumber, int pageSize, java.lang.String orderBys) throws Exception {
		final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.customer.WlCustomerImpl.class);

            
            if (status != null)
                criteria.add(Expression.eq("customerStatus", status));
            if (sort != null)
                criteria.add(Expression.like("customerSort", sort));
            
            if (pageNumber > 0 && pageSize > 0)
            {
                criteria.setFirstResult(this.calculateFirstResult(pageNumber, pageSize));
                criteria.setMaxResults(pageSize);
            }else{
           	 criteria.setMaxResults(100);
            }
            

            return criteria.list();
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
	}
	protected List handleGetWlCustomer(WlCustomerVO WlCustomer, int pageNumber,int pageSize, String orderBy) throws Exception {
		
		final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.customer.WlCustomerImpl.class);
            if (WlCustomer != null) QueryAssCriteria.getCustomerCriteria(WlCustomer,criteria);
            //条数
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
                    .uniqueResult())  
                    .intValue();//取得符合条件的总数  
      
		      criteria.setProjection(null);  
		      WlCustomer or=new com.logistics.entity.customer.WlCustomerImpl();
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
	/*protected List handleGetWlCustomer(WlCustomerVO WlCustomer, int pageNumber,
			int pageSize, String orderBy) throws Exception {
		final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.customer.WlCustomerImpl.class);

            if (WlCustomer.getCustomerName() != null)
                criteria.add(Expression.ilike("customerName", WlCustomer.getCustomerName(), MatchMode.START));
            if (WlCustomer.getJuridicalPerson() != null)
                criteria.add(Expression.ilike("juridicalPerson", WlCustomer.getJuridicalPerson(), MatchMode.START));
            if (WlCustomer.getEnrolDate() != null)
            {
            	 if("=".equals(WlCustomer.getEnrolDate().getUpSign())){
	                	criteria.add(Expression.eq("enrolDate", ProjectUtil.getDate(WlCustomer.getEnrolDate().getUpDate())));
	                }else if(">".equals(WlCustomer.getEnrolDate().getUpSign())){
	                	criteria.add(Expression.lt("enrolDate", ProjectUtil.getDate(WlCustomer.getEnrolDate().getUpDate())));
	                }else if("≥".equals(WlCustomer.getEnrolDate().getUpSign())){
	                	criteria.add(Expression.le("enrolDate", ProjectUtil.getDate(WlCustomer.getEnrolDate().getUpDate())));
	                }
	                if(!"=".equals(WlCustomer.getEnrolDate().getUpSign())){
		                if(">".equals(WlCustomer.getEnrolDate().getDownSign())){
		                	criteria.add(Expression.gt("enrolDate", ProjectUtil.getDate(WlCustomer.getEnrolDate().getDownDate())));
		                }else if("≥".equals(WlCustomer.getEnrolDate().getDownSign())){
		                	criteria.add(Expression.ge("enrolDate", ProjectUtil.getDate(WlCustomer.getEnrolDate().getDownDate())));
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
                criteria.add(Expression.ilike("taxResisterNo", WlCustomer.getTaxResisterNo(), MatchMode.START));
            if (WlCustomer.getBank() != null)
                criteria.add(Expression.ilike("bank", WlCustomer.getBank(), MatchMode.START));
            if (WlCustomer.getAcnountNO() != null)
                criteria.add(Expression.ilike("acountNo", WlCustomer.getAcnountNO(), MatchMode.START));
            if (WlCustomer.getLinkman() != null)
                criteria.add(Expression.ilike("linkman", WlCustomer.getLinkman(), MatchMode.START));
            if (WlCustomer.getHeadTel() != null)
                criteria.add(Expression.ilike("headTel", WlCustomer.getHeadTel(), MatchMode.START));
            if (WlCustomer.getTel() != null)
                criteria.add(Expression.ilike("tel", WlCustomer.getTel(), MatchMode.START));
            if (WlCustomer.getMobil() != null)
                criteria.add(Expression.ilike("mobil", WlCustomer.getMobil(), MatchMode.START));
            if (WlCustomer.getEmail() != null)
                criteria.add(Expression.ilike("email", WlCustomer.getEmail(), MatchMode.START));
            if (WlCustomer.getFax() != null)
                criteria.add(Expression.ilike("fax", WlCustomer.getFax(), MatchMode.START));
            if (WlCustomer.getRelation() != null)
                criteria.add(Expression.ilike("relation", WlCustomer.getRelation(), MatchMode.START));
            if (WlCustomer.getPeopleCode() != null)
                criteria.add(Expression.ilike("peopleCode", WlCustomer.getPeopleCode(), MatchMode.START));
            if (WlCustomer.getPeopleName() != null)
                criteria.add(Expression.ilike("peopleName", WlCustomer.getPeopleName(), MatchMode.START));
            if (WlCustomer.getValue() != null)
                criteria.add(Expression.ilike("value", WlCustomer.getValue(), MatchMode.START));
            criteria.add(Expression.eq("address", new java.lang.Long(WlCustomer.getAddress())));
            if (WlCustomer.getParentCustomerID() != null)
            criteria.add(Expression.eq("parentCustomerID", WlCustomer.getParentCustomerID().getId()));
            if (WlCustomer.getCustomerStatus() != null)
                criteria.add(Expression.ilike("customerStatus", WlCustomer.getCustomerStatus(), MatchMode.START));
            if (WlCustomer.getCustomerSort() != null)
                criteria.add(Expression.ilike("customerSort", WlCustomer.getCustomerSort(), MatchMode.START));
            if (WlCustomer.getId() != 0)
            criteria.add(Expression.eq("id", WlCustomer.getId()));
            if (WlCustomer.getPeople() != null) {
            	//criteria.createCriteria("people").add(Expression.eq("id", people));
            	
            	PeopleVO peoVO=WlCustomer.getPeople();
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
            	
            }}
            if (WlCustomer.getPlace() != null) {
            	//criteria.createCriteria("place").add(Expression.eq("id", place));
            	WlPlaceVO placeVO=WlCustomer.getPlace();
            	final Criteria criteriaPlace =   criteria.createCriteria("place");
            	 if (placeVO.getPlaceName() != null)
            		 criteriaPlace.add(Expression.like("placeName", placeVO.getPlaceName(), MatchMode.START));
                 if (placeVO.getPostCode() != null)
                	 criteriaPlace.add(Expression.like("postCode", placeVO.getPostCode(), MatchMode.START));
                 if (placeVO.getPlaceType() != null)
                	 criteriaPlace.add(Expression.like("placeType", placeVO.getPlaceType(), MatchMode.START));
                 if (placeVO.getRemark() != null)
                	 criteriaPlace.add(Expression.like("remark", placeVO.getRemark(), MatchMode.START));
            }
          //条数
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
                    .uniqueResult())  
                    .intValue();//取得符合条件的总数  
      
		      criteria.setProjection(null);  
		      WlCustomer or=new com.logistics.entity.customer.WlCustomerImpl();
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
	}*/

}