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
import com.logistics.util.ProjectUtil;
import com.logistics.util.QueryAssCriteriaOrder;

/**
 * @see com.logistics.entity.cost.WlTaskRowCost
 */
public class WlTaskRowCostDaoImpl
    extends com.logistics.entity.cost.WlTaskRowCostDaoBase
{
    /**
     * @see com.logistics.entity.cost.WlTaskRowCostDao#getWlTaskRowCost(com.logistics.entity.cost.WlTaskRowCostVO, int, int, java.lang.String)
     */
    protected java.util.List handleGetWlTaskRowCost(com.logistics.entity.cost.WlTaskRowCostVO WlTaskRowCost, int pageNumber, int pageSize, java.lang.String orderBy)
    {
    	final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.cost.WlTaskRowCostImpl.class);
            if (WlTaskRowCost != null) QueryAssCriteriaOrder.getWlTaskRowCostCriteria(WlTaskRowCost,criteria);
            //条数
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
                    .uniqueResult())  
                    .intValue();//取得符合条件的总数  
      
		      criteria.setProjection(null);  
		      WlTaskRowCost or=new com.logistics.entity.cost.WlTaskRowCostImpl();
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
     * @see com.logistics.entity.cost.WlTaskRowCostDao#toWlTaskRowCostVO(com.logistics.entity.cost.WlTaskRowCost, com.logistics.entity.cost.WlTaskRowCostVO)
     */
    public void toWlTaskRowCostVO(
        com.logistics.entity.cost.WlTaskRowCost source,
        com.logistics.entity.cost.WlTaskRowCostVO target)
    {
        // @todo verify behavior of toWlTaskRowCostVO
        super.toWlTaskRowCostVO(source, target);
        // WARNING! No conversion for target.taskRow (can't convert source.getTaskRow():com.logistics.entity.order.WlTaskRow to com.logistics.entity.order.WlTaskRowVO
        // WARNING! No conversion for target.filler (can't convert source.getFiller():com.logistics.entity.orga.People to com.logistics.entity.orga.PeopleVO
        // WARNING! No conversion for target.startDate (can't convert source.getStartDate():java.util.Date to com.logistics.entity.basic.DateTimeQuery
        // WARNING! No conversion for target.fillDate (can't convert source.getFillDate():java.util.Date to com.logistics.entity.basic.DateTimeQuery
        // WARNING! No conversion for target.affirmer (can't convert source.getAffirmer():com.logistics.entity.orga.People to com.logistics.entity.orga.PeopleVO
        // WARNING! No conversion for target.affirmDate (can't convert source.getAffirmDate():java.util.Date to com.logistics.entity.basic.DateTimeQuery
        // WARNING! No conversion for target.cost (can't convert source.getCost():double to com.logistics.entity.basic.NumberQuery
        DateTimeQuery tempday=new DateTimeQuery();
        tempday.setUpDate(ProjectUtil.getFullDateStr(source.getStartDate()));
    	target.setStartDate(tempday);
    	tempday=new DateTimeQuery();
        tempday.setUpDate(ProjectUtil.getFullDateStr(source.getFillDate()));
    	target.setFillDate(tempday);
        target.setFiller(this.getPeopleDao().toPeopleVO(source.getFiller()));
    	target.setAffirmer(this.getPeopleDao().toPeopleVO(source.getAffirmer()));
    	tempday=new DateTimeQuery();
        tempday.setUpDate(ProjectUtil.getFullDateStr(source.getAffirmDate()));
    	target.setAffirmDate(tempday);
    	NumberQuery tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getCost());
        target.setCost(tempNum);
        target.setTaskRow(this.getWlTaskRowDao().toWlTaskRowVO(source.getTaskRow()));
    
    }


    /**
     * @see com.logistics.entity.cost.WlTaskRowCostDao#toWlTaskRowCostVO(com.logistics.entity.cost.WlTaskRowCost)
     */
    public com.logistics.entity.cost.WlTaskRowCostVO toWlTaskRowCostVO(final com.logistics.entity.cost.WlTaskRowCost entity)
    {
        // @todo verify behavior of toWlTaskRowCostVO
        return super.toWlTaskRowCostVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.cost.WlTaskRowCost loadWlTaskRowCostFromWlTaskRowCostVO(com.logistics.entity.cost.WlTaskRowCostVO wlTaskRowCostVO)
    {
        // @todo implement loadWlTaskRowCostFromWlTaskRowCostVO
        //throw new java.lang.UnsupportedOperationException("com.logistics.entity.cost.loadWlTaskRowCostFromWlTaskRowCostVO(com.logistics.entity.cost.WlTaskRowCostVO) not yet implemented.");

        /* A typical implementation looks like this:*/
        com.logistics.entity.cost.WlTaskRowCost wlTaskRowCost = this.load(wlTaskRowCostVO.getId());
        if (wlTaskRowCost == null)
        {
            wlTaskRowCost = com.logistics.entity.cost.WlTaskRowCost.Factory.newInstance();
        }
        return wlTaskRowCost;
        
    }

    
    /**
     * @see com.logistics.entity.cost.WlTaskRowCostDao#wlTaskRowCostVOToEntity(com.logistics.entity.cost.WlTaskRowCostVO)
     */
    public com.logistics.entity.cost.WlTaskRowCost wlTaskRowCostVOToEntity(com.logistics.entity.cost.WlTaskRowCostVO wlTaskRowCostVO)
    {
        // @todo verify behavior of wlTaskRowCostVOToEntity
        com.logistics.entity.cost.WlTaskRowCost entity = this.loadWlTaskRowCostFromWlTaskRowCostVO(wlTaskRowCostVO);
        this.wlTaskRowCostVOToEntity(wlTaskRowCostVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.cost.WlTaskRowCostDao#wlTaskRowCostVOToEntity(com.logistics.entity.cost.WlTaskRowCostVO, com.logistics.entity.cost.WlTaskRowCost)
     */
    public void wlTaskRowCostVOToEntity(
        com.logistics.entity.cost.WlTaskRowCostVO source,
        com.logistics.entity.cost.WlTaskRowCost target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wlTaskRowCostVOToEntity
        super.wlTaskRowCostVOToEntity(source, target, copyIfNull);
        if(source.getAffirmer()!=null)target.setAffirmer(this.getPeopleDao().load(source.getAffirmer().getId()));
        if(source.getFiller()!=null)target.setFiller(this.getPeopleDao().load(source.getFiller().getId()));
        if(source.getTaskRow()!=null)target.setTaskRow(this.getWlTaskRowDao().load(source.getTaskRow().getId()));
        if(source.getCost()!=null)target.setCost(source.getCost().getUpNumber());
        if(source.getFillDate()!=null)target.setFillDate(ProjectUtil.getDate(source.getFillDate().getUpDate()));
        if(source.getAffirmDate()!=null)target.setAffirmDate(ProjectUtil.getDate(source.getAffirmDate().getUpDate()));
        if(source.getStartDate()!=null)target.setStartDate(ProjectUtil.getDate(source.getStartDate().getUpDate()));
        // No conversion for target.startDate (can't convert source.getStartDate():com.logistics.entity.basic.DateTimeQuery to java.util.Date
        // No conversion for target.fillDate (can't convert source.getFillDate():com.logistics.entity.basic.DateTimeQuery to java.util.Date
        // No conversion for target.affirmDate (can't convert source.getAffirmDate():com.logistics.entity.basic.DateTimeQuery to java.util.Date
        // No conversion for target.cost (can't convert source.getCost():com.logistics.entity.basic.NumberQuery to double
    }

}