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
 * @see com.logistics.entity.cost.WlPeopleCost
 */
public class WlPeopleCostDaoImpl
    extends com.logistics.entity.cost.WlPeopleCostDaoBase
{
    /**
     * @see com.logistics.entity.cost.WlPeopleCostDao#getWlPeopleCost(com.logistics.entity.cost.WlPeopleCostVO, int, int, java.lang.String)
     */
    protected java.util.List handleGetWlPeopleCost(com.logistics.entity.cost.WlPeopleCostVO WlPeoppleCost, int pageNumber, int pageSize, java.lang.String orderBy)
    {
    	final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.cost.WlPeopleCostImpl.class);
            if (WlPeoppleCost != null) QueryAssCriteriaOrder.getWlPeopleCostCriteria(WlPeoppleCost,criteria);
            //条数
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
                    .uniqueResult())  
                    .intValue();//取得符合条件的总数  
      
		      criteria.setProjection(null);  
		      WlPeopleCost or=new com.logistics.entity.cost.WlPeopleCostImpl();
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
     * @see com.logistics.entity.cost.WlPeopleCostDao#toWlPeopleCostVO(com.logistics.entity.cost.WlPeopleCost, com.logistics.entity.cost.WlPeopleCostVO)
     */
    public void toWlPeopleCostVO(
        com.logistics.entity.cost.WlPeopleCost source,
        com.logistics.entity.cost.WlPeopleCostVO target)
    {
        // @todo verify behavior of toWlPeopleCostVO
        super.toWlPeopleCostVO(source, target);
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
        tempNum.setUpNumber(source.getCostSum());
        target.setCostSum(tempNum);
        target.setPeople(this.getPeopleDao().toPeopleVO(source.getPeople()));
        // WARNING! No conversion for target.people (can't convert source.getPeople():com.logistics.entity.orga.People to com.logistics.entity.orga.PeopleVO
        if(source.getTask()!=null)target.setTask(this.getWlTaskDao().toWlTaskVO(source.getTask()));
        // WARNING! No conversion for target.task (can't convert source.getTask():com.logistics.entity.order.WlTask to com.logistics.entity.order.WlTaskVO
        //if(source.getTaskRow()!=null)target.setTaskRow(this.getWlTaskRowDao().toWlTaskRowVO(source.getTaskRow()));
        // WARNING! No conversion for target.taskRow (can't convert source.getTaskRow():com.logistics.entity.order.WlTaskRow to com.logistics.entity.order.WlTaskRowVO
    }


    /**
     * @see com.logistics.entity.cost.WlPeopleCostDao#toWlPeopleCostVO(com.logistics.entity.cost.WlPeopleCost)
     */
    public com.logistics.entity.cost.WlPeopleCostVO toWlPeopleCostVO(final com.logistics.entity.cost.WlPeopleCost entity)
    {
        // @todo verify behavior of toWlPeopleCostVO
        return super.toWlPeopleCostVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.cost.WlPeopleCost loadWlPeopleCostFromWlPeopleCostVO(com.logistics.entity.cost.WlPeopleCostVO wlPeopleCostVO)
    {
        // @todo implement loadWlPeopleCostFromWlPeopleCostVO
        //throw new java.lang.UnsupportedOperationException("com.logistics.entity.cost.loadWlPeopleCostFromWlPeopleCostVO(com.logistics.entity.cost.WlPeopleCostVO) not yet implemented.");

        /* A typical implementation looks like this:*/
        com.logistics.entity.cost.WlPeopleCost wlPeopleCost = this.load(wlPeopleCostVO.getId());
        if (wlPeopleCost == null)
        {
            wlPeopleCost = com.logistics.entity.cost.WlPeopleCost.Factory.newInstance();
        }
        return wlPeopleCost;
        
    }

    
    /**
     * @see com.logistics.entity.cost.WlPeopleCostDao#wlPeopleCostVOToEntity(com.logistics.entity.cost.WlPeopleCostVO)
     */
    public com.logistics.entity.cost.WlPeopleCost wlPeopleCostVOToEntity(com.logistics.entity.cost.WlPeopleCostVO wlPeopleCostVO)
    {
        // @todo verify behavior of wlPeopleCostVOToEntity
        com.logistics.entity.cost.WlPeopleCost entity = this.loadWlPeopleCostFromWlPeopleCostVO(wlPeopleCostVO);
        this.wlPeopleCostVOToEntity(wlPeopleCostVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.cost.WlPeopleCostDao#wlPeopleCostVOToEntity(com.logistics.entity.cost.WlPeopleCostVO, com.logistics.entity.cost.WlPeopleCost)
     */
    public void wlPeopleCostVOToEntity(
        com.logistics.entity.cost.WlPeopleCostVO source,
        com.logistics.entity.cost.WlPeopleCost target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wlPeopleCostVOToEntity
        super.wlPeopleCostVOToEntity(source, target, copyIfNull);
        if(source.getAffirmer()!=null)target.setAffirmer(this.getPeopleDao().load(source.getAffirmer().getId()));
        if(source.getFiller()!=null)target.setFiller(this.getPeopleDao().load(source.getFiller().getId()));
        if(source.getPeople()!=null)target.setPeople(this.getPeopleDao().load(source.getPeople().getId()));
        //if(source.getTaskRow()!=null)target.setTaskRow(this.getWlTaskRowDao().load(source.getTaskRow().getId()));
        if(source.getTask()!=null)target.setTask(this.getWlTaskDao().load(source.getTask().getId()));
        if(source.getCostSum()!=null)target.setCostSum(source.getCostSum().getUpNumber());
        if(source.getFillDate()!=null)target.setFillDate(ProjectUtil.getDate(source.getFillDate().getUpDate()));
        if(source.getAffirmDate()!=null)target.setAffirmDate(ProjectUtil.getDate(source.getAffirmDate().getUpDate()));
        if(source.getStartDate()!=null)target.setStartDate(ProjectUtil.getDate(source.getStartDate().getUpDate()));
        
        // No conversion for target.startDate (can't convert source.getStartDate():com.logistics.entity.basic.DateTimeQuery to java.util.Date
        // No conversion for target.fillDate (can't convert source.getFillDate():com.logistics.entity.basic.DateTimeQuery to java.util.Date
        // No conversion for target.affirmDate (can't convert source.getAffirmDate():com.logistics.entity.basic.DateTimeQuery to java.util.Date
        // No conversion for target.costSum (can't convert source.getCostSum():com.logistics.entity.basic.NumberQuery to double
    }

}