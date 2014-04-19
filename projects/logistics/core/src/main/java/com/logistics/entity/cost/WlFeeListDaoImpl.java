// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.entity.cost;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;

import com.logistics.entity.basic.DateTimeQuery;
import com.logistics.entity.order.WlOpinion;
import com.logistics.util.ProjectUtil;
import com.logistics.util.QueryAssCriteriaOrder;

/**
 * @see com.logistics.entity.cost.WlFeeList
 */
public class WlFeeListDaoImpl
    extends com.logistics.entity.cost.WlFeeListDaoBase
{
    /**
     * @see com.logistics.entity.cost.WlFeeListDao#getWlFeeList(com.logistics.entity.cost.WlFeeListVO, int, int, java.lang.String)
     */
    protected java.util.List handleGetWlFeeList(com.logistics.entity.cost.WlFeeListVO WlFeeList, int pageNumber, int pageSize, java.lang.String orderBy)
    {
    	final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.cost.WlFeeListImpl.class);
            if (WlFeeList != null) QueryAssCriteriaOrder.getWlFeeListCriteria(WlFeeList,criteria);
            //条数
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
                    .uniqueResult())  
                    .intValue();//取得符合条件的总数  
      
		      criteria.setProjection(null);  
		      WlFeeList or=new com.logistics.entity.cost.WlFeeListImpl();
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

    /**
     * @see com.logistics.entity.cost.WlFeeListDao#toWlFeeListVO(com.logistics.entity.cost.WlFeeList, com.logistics.entity.cost.WlFeeListVO)
     */
    public void toWlFeeListVO(
        com.logistics.entity.cost.WlFeeList source,
        com.logistics.entity.cost.WlFeeListVO target)
    {
        // @todo verify behavior of toWlFeeListVO
        super.toWlFeeListVO(source, target);
        DateTimeQuery tempday=new DateTimeQuery();
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getMakeDate()));
    	target.setMakeDate(tempday);
        // WARNING! No conversion for target.makeDate (can't convert source.getMakeDate():java.util.Date to com.logistics.entity.basic.DateTimeQuery
    	tempday=new DateTimeQuery();
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getStartDate()));
    	target.setStartDate(tempday);
    	// WARNING! No conversion for target.startDate (can't convert source.getStartDate():java.util.Date to com.logistics.entity.basic.DateTimeQuery
    	tempday=new DateTimeQuery();
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getAffirmDate()));
    	target.setAffirmDate(tempday);
    	// WARNING! No conversion for target.affirmDate (can't convert source.getAffirmDate():java.util.Date to com.logistics.entity.basic.DateTimeQuery
    	tempday=new DateTimeQuery();
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getEndDate()));
    	target.setEndDate(tempday);
    	// WARNING! No conversion for target.endDate (can't convert source.getEndDate():java.util.Date to com.logistics.entity.basic.DateTimeQuery
    	tempday=new DateTimeQuery();
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getChargeDate()));
    	target.setChargeDate(tempday);
    	// WARNING! No conversion for target.chargeDate (can't convert source.getChargeDate():java.util.Date to com.logistics.entity.basic.DateTimeQuery
    	tempday=new DateTimeQuery();
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getManagerDate()));
    	target.setManagerDate(tempday);
    	// WARNING! No conversion for target.managerDate (can't convert source.getManagerDate():java.util.Date to com.logistics.entity.basic.DateTimeQuery
    	tempday=new DateTimeQuery();
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getAppManagerDate()));
    	target.setAppManagerDate(tempday);
    	// WARNING! No conversion for target.appManagerDate (can't convert source.getAppManagerDate():java.util.Date to com.logistics.entity.basic.DateTimeQuery
    	target.setChargePeople(this.getPeopleDao().toPeopleVO(source.getChargePeople()));
    	// WARNING! No conversion for target.chargePeople (can't convert source.getChargePeople():com.logistics.entity.orga.People to com.logistics.entity.orga.PeopleVO
    	target.setManager(this.getPeopleDao().toPeopleVO(source.getManager()));
    	// WARNING! No conversion for target.manager (can't convert source.getManager():com.logistics.entity.orga.People to com.logistics.entity.orga.PeopleVO
    	target.setMakePeople(this.getPeopleDao().toPeopleVO(source.getMakePeople()));
    	// WARNING! No conversion for target.makePeople (can't convert source.getMakePeople():com.logistics.entity.orga.People to com.logistics.entity.orga.PeopleVO
    	target.setAppManager(this.getPeopleDao().toPeopleVO(source.getAppManager()));
    	// WARNING! No conversion for target.appManager (can't convert source.getAppManager():com.logistics.entity.orga.People to com.logistics.entity.orga.PeopleVO
    	target.setCustomer(this.getWlCustomerDao().toWlCustomerVO(source.getCustomer()));
    	// WARNING! No conversion for target.customer (can't convert source.getCustomer():com.logistics.entity.customer.WlCustomer to com.logistics.entity.customer.WlCustomerVO
    	target.setFeeRow(source.getFeeRow() == null ? null :this.getWlFeeRowDao().toWlFeeRowVOArray(source.getFeeRow()));
    	// WARNING! No conversion for target.feeRow (can't convert source.getFeeRow():com.logistics.entity.cost.WlFeeRow to com.logistics.entity.cost.WlFeeRowVO[]
    }


    /**
     * @see com.logistics.entity.cost.WlFeeListDao#toWlFeeListVO(com.logistics.entity.cost.WlFeeList)
     */
    public com.logistics.entity.cost.WlFeeListVO toWlFeeListVO(final com.logistics.entity.cost.WlFeeList entity)
    {
        // @todo verify behavior of toWlFeeListVO
        return super.toWlFeeListVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.cost.WlFeeList loadWlFeeListFromWlFeeListVO(com.logistics.entity.cost.WlFeeListVO wlFeeListVO)
    {
        // @todo implement loadWlFeeListFromWlFeeListVO
        //throw new java.lang.UnsupportedOperationException("com.logistics.entity.cost.loadWlFeeListFromWlFeeListVO(com.logistics.entity.cost.WlFeeListVO) not yet implemented.");

        /* A typical implementation looks like this: */
        com.logistics.entity.cost.WlFeeList wlFeeList = this.load(wlFeeListVO.getId());
        if (wlFeeList == null)
        {
            wlFeeList = com.logistics.entity.cost.WlFeeList.Factory.newInstance();
        }
        return wlFeeList;
       
    }

    
    /**
     * @see com.logistics.entity.cost.WlFeeListDao#wlFeeListVOToEntity(com.logistics.entity.cost.WlFeeListVO)
     */
    public com.logistics.entity.cost.WlFeeList wlFeeListVOToEntity(com.logistics.entity.cost.WlFeeListVO wlFeeListVO)
    {
        // @todo verify behavior of wlFeeListVOToEntity
        com.logistics.entity.cost.WlFeeList entity = this.loadWlFeeListFromWlFeeListVO(wlFeeListVO);
        this.wlFeeListVOToEntity(wlFeeListVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.cost.WlFeeListDao#wlFeeListVOToEntity(com.logistics.entity.cost.WlFeeListVO, com.logistics.entity.cost.WlFeeList)
     */
    public void wlFeeListVOToEntity(
        com.logistics.entity.cost.WlFeeListVO source,
        com.logistics.entity.cost.WlFeeList target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wlFeeListVOToEntity
        super.wlFeeListVOToEntity(source, target, copyIfNull);
        if(source.getMakeDate()!=null)target.setMakeDate(ProjectUtil.getDate(source.getMakeDate().getUpDate()));
        // No conversion for target.makeDate (can't convert source.getMakeDate():com.logistics.entity.basic.DateTimeQuery to java.util.Date
        if(source.getAffirmDate()!=null)target.setAffirmDate(ProjectUtil.getDate(source.getAffirmDate().getUpDate()));
        // No conversion for target.affirmDate (can't convert source.getAffirmDate():com.logistics.entity.basic.DateTimeQuery to java.util.Date
        if(source.getStartDate()!=null)target.setStartDate(ProjectUtil.getDate(source.getStartDate().getUpDate()));
        // No conversion for target.startDate (can't convert source.getStartDate():com.logistics.entity.basic.DateTimeQuery to java.util.Date
        if(source.getEndDate()!=null)target.setEndDate(ProjectUtil.getDate(source.getEndDate().getUpDate()));
        // No conversion for target.endDate (can't convert source.getEndDate():com.logistics.entity.basic.DateTimeQuery to java.util.Date
        if(source.getChargeDate()!=null)target.setChargeDate(ProjectUtil.getDate(source.getChargeDate().getUpDate()));
        // No conversion for target.chargeDate (can't convert source.getChargeDate():com.logistics.entity.basic.DateTimeQuery to java.util.Date
        if(source.getManagerDate()!=null)target.setManagerDate(ProjectUtil.getDate(source.getManagerDate().getUpDate()));
        // No conversion for target.managerDate (can't convert source.getManagerDate():com.logistics.entity.basic.DateTimeQuery to java.util.Date
        if(source.getAppManagerDate()!=null)target.setAppManagerDate(ProjectUtil.getDate(source.getAppManagerDate().getUpDate()));
        // No conversion for target.appManagerDate (can't convert source.getAppManagerDate():com.logistics.entity.basic.DateTimeQuery to java.util.Date
        if(source.getAppManager()!=null)target.setAppManager(this.getPeopleDao().load(source.getAppManager().getId())); 
        if(source.getChargePeople()!=null)target.setChargePeople(this.getPeopleDao().load(source.getChargePeople().getId())); 
        if(source.getCustomer()!=null)target.setCustomer(this.getWlCustomerDao().load(source.getCustomer().getId())); 
        if(source.getMakePeople()!=null)target.setMakePeople(this.getPeopleDao().load(source.getMakePeople().getId())); 
        if(source.getManager()!=null)target.setManager(this.getPeopleDao().load(source.getManager().getId())); 
        
    }

}