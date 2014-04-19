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
import com.logistics.entity.basic.NumberQuery;
import com.logistics.entity.order.WlOpinion;
import com.logistics.util.ProjectUtil;
import com.logistics.util.QueryAssCriteriaOrder;

/**
 * @see com.logistics.entity.cost.WlCarryCost
 */
public class WlCarryCostDaoImpl
    extends com.logistics.entity.cost.WlCarryCostDaoBase
{
    /**
     * @see com.logistics.entity.cost.WlCarryCostDao#getWlCarryCost(com.logistics.entity.cost.WlCarryCostVO, int, int, java.lang.String)
     */
    protected java.util.List handleGetWlCarryCost(com.logistics.entity.cost.WlCarryCostVO WlCarryCost, int pageNumber, int pageSize, java.lang.String orderBy)
    {
    	final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.cost.WlCarryCostImpl.class);
            if (WlCarryCost != null) QueryAssCriteriaOrder.getWlCarryCostCriteria(WlCarryCost,criteria);
            //条数
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
                    .uniqueResult())  
                    .intValue();//取得符合条件的总数  
      
		      criteria.setProjection(null);  
		      WlCarryCost or=new com.logistics.entity.cost.WlCarryCostImpl();
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
     * @see com.logistics.entity.cost.WlCarryCostDao#toWlCarryCostVO(com.logistics.entity.cost.WlCarryCost, com.logistics.entity.cost.WlCarryCostVO)
     */
    public void toWlCarryCostVO(
        com.logistics.entity.cost.WlCarryCost source,
        com.logistics.entity.cost.WlCarryCostVO target)
    {
        // @todo verify behavior of toWlCarryCostVO
        super.toWlCarryCostVO(source, target);
        DateTimeQuery tempday=new DateTimeQuery();
        tempday.setUpDate(ProjectUtil.getFullDateStr(source.getStartDte()));
    	target.setStartDate(tempday);
    	tempday=new DateTimeQuery();
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getFillDate()));
    	target.setFillDate(tempday);
        // WARNING! No conversion for target.fillDate (can't convert source.getFillDate():java.util.Date to com.logistics.entity.basic.DateTimeQuery
    	 target.setFiller(this.getPeopleDao().toPeopleVO(source.getFiller()));
    	// WARNING! No conversion for target.filler (can't convert source.getFiller():com.logistics.entity.orga.People to com.logistics.entity.orga.PeopleVO
    	 target.setAffirmer(this.getPeopleDao().toPeopleVO(source.getAffirmer()));
    	 // WARNING! No conversion for target.affirmer (can't convert source.getAffirmer():com.logistics.entity.orga.People to com.logistics.entity.orga.PeopleVO
    	 tempday=new DateTimeQuery();
     	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getAffirmDate()));
    	target.setAffirmDate(tempday);
    	// WARNING! No conversion for target.affirmDate (can't convert source.getAffirmDate():java.util.Date to com.logistics.entity.basic.DateTimeQuery
    	NumberQuery tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getCostSum());
        target.setCostSum(tempNum);
    	// WARNING! No conversion for target.costSum (can't convert source.getCostSum():double to com.logistics.entity.basic.NumberQuery
        target.setStartSteerRow(this.getWlSteerRowDao().toWlSteerRowVO(source.getStartSteerRow()));
        // WARNING! No conversion for target.startSteerRow (can't convert source.getStartSteerRow():com.logistics.entity.order.WlSteerRow to com.logistics.entity.order.WlSteerRowVO
        target.setVoiture(this.getWlVoitureDao().toWlVoitureVO(source.getVoiture()));
        // WARNING! No conversion for target.voiture (can't convert source.getVoiture():com.logistics.entity.car.WlVoiture to com.logistics.entity.car.WlVoitureVO
    }


    /**
     * @see com.logistics.entity.cost.WlCarryCostDao#toWlCarryCostVO(com.logistics.entity.cost.WlCarryCost)
     */
    public com.logistics.entity.cost.WlCarryCostVO toWlCarryCostVO(final com.logistics.entity.cost.WlCarryCost entity)
    {
        // @todo verify behavior of toWlCarryCostVO
        return super.toWlCarryCostVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.cost.WlCarryCost loadWlCarryCostFromWlCarryCostVO(com.logistics.entity.cost.WlCarryCostVO wlCarryCostVO)
    {
        // @todo implement loadWlCarryCostFromWlCarryCostVO
        //throw new java.lang.UnsupportedOperationException("com.logistics.entity.cost.loadWlCarryCostFromWlCarryCostVO(com.logistics.entity.cost.WlCarryCostVO) not yet implemented.");

        /* A typical implementation looks like this:*/
        com.logistics.entity.cost.WlCarryCost wlCarryCost = this.load(wlCarryCostVO.getId());
        if (wlCarryCost == null)
        {
            wlCarryCost = com.logistics.entity.cost.WlCarryCost.Factory.newInstance();
        }
        return wlCarryCost;
        
    }

    
    /**
     * @see com.logistics.entity.cost.WlCarryCostDao#wlCarryCostVOToEntity(com.logistics.entity.cost.WlCarryCostVO)
     */
    public com.logistics.entity.cost.WlCarryCost wlCarryCostVOToEntity(com.logistics.entity.cost.WlCarryCostVO wlCarryCostVO)
    {
        // @todo verify behavior of wlCarryCostVOToEntity
        com.logistics.entity.cost.WlCarryCost entity = this.loadWlCarryCostFromWlCarryCostVO(wlCarryCostVO);
        this.wlCarryCostVOToEntity(wlCarryCostVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.cost.WlCarryCostDao#wlCarryCostVOToEntity(com.logistics.entity.cost.WlCarryCostVO, com.logistics.entity.cost.WlCarryCost)
     */
    public void wlCarryCostVOToEntity(
        com.logistics.entity.cost.WlCarryCostVO source,
        com.logistics.entity.cost.WlCarryCost target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wlCarryCostVOToEntity
        super.wlCarryCostVOToEntity(source, target, copyIfNull);
        if(source.getAffirmer()!=null)target.setAffirmer(this.getPeopleDao().load(source.getAffirmer().getId()));
        if(source.getFiller()!=null)target.setFiller(this.getPeopleDao().load(source.getFiller().getId()));
        if(source.getStartSteerRow()!=null)target.setStartSteerRow(this.getWlSteerRowDao().load(source.getStartSteerRow().getId()));
        if(source.getVoiture()!=null)target.setVoiture(this.getWlVoitureDao().load(source.getVoiture().getId()));
        if(source.getCostSum()!=null)target.setCostSum(source.getCostSum().getUpNumber());
        if(source.getFillDate()!=null)target.setFillDate(ProjectUtil.getDate(source.getFillDate().getUpDate()));
        if(source.getAffirmDate()!=null)target.setAffirmDate(ProjectUtil.getDate(source.getAffirmDate().getUpDate()));
        if(source.getStartDate()!=null)target.setStartDte(ProjectUtil.getDate(source.getStartDate().getUpDate()));
        // No conversion for target.fillDate (can't convert source.getFillDate():com.logistics.entity.basic.DateTimeQuery to java.util.Date
        // No conversion for target.affirmDate (can't convert source.getAffirmDate():com.logistics.entity.basic.DateTimeQuery to java.util.Date
        // No conversion for target.costSum (can't convert source.getCostSum():com.logistics.entity.basic.NumberQuery to double
    }

}