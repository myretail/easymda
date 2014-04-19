// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.entity.order;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;

import com.logistics.entity.basic.DateTimeQuery;
import com.logistics.entity.basic.NumberQuery;
import com.logistics.entity.customer.WlCustomer;
import com.logistics.util.ProjectUtil;
import com.logistics.util.QueryAssCriteria;
import com.logistics.util.QueryAssCriteriaOrder;

/**
 * @see com.logistics.entity.order.WlOpinion
 */
public class WlOpinionDaoImpl
    extends com.logistics.entity.order.WlOpinionDaoBase
{
    /**
     * @see com.logistics.entity.order.WlOpinionDao#toWlOpinionVO(com.logistics.entity.order.WlOpinion, com.logistics.entity.order.WlOpinionVO)
     */
    public void toWlOpinionVO(
        com.logistics.entity.order.WlOpinion source,
        com.logistics.entity.order.WlOpinionVO target)
    {
        // @todo verify behavior of toWlOpinionVO
        super.toWlOpinionVO(source, target);
        DateTimeQuery tempday=new DateTimeQuery();
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getTime()));
    	target.setTime(tempday);
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getBookTime()));
    	target.setBookTime(tempday);
    	NumberQuery tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getLossFee());
        target.setLossFee(tempNum);
        // WARNING! No conversion for target.time (can't convert source.getTime():java.util.Date to java.util.Date
        // WARNING! No conversion for target.bookTime (can't convert source.getBookTime():java.util.Date to java.util.Date
        // WARNING! No conversion for target.people (can't convert source.getPeople():com.logistics.entity.orga.People to java.lang.String
        // WARNING! No conversion for target.booker (can't convert source.getBooker():com.logistics.entity.orga.People to java.lang.String
        target.setPeople(this.getPeopleDao().toPeopleVO(source.getPeople()));
        target.setBooker(this.getPeopleDao().toPeopleVO(source.getBooker()));
        target.setReport(this.getPeopleDao().toPeopleVO(source.getReporter()));
        target.setTaskRow(this.getWlTaskRowDao().toWlTaskRowVO(source.getTaskRow()));
    }


    /**
     * @see com.logistics.entity.order.WlOpinionDao#toWlOpinionVO(com.logistics.entity.order.WlOpinion)
     */
    public com.logistics.entity.order.WlOpinionVO toWlOpinionVO(final com.logistics.entity.order.WlOpinion entity)
    {
        // @todo verify behavior of toWlOpinionVO
        return super.toWlOpinionVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.order.WlOpinion loadWlOpinionFromWlOpinionVO(com.logistics.entity.order.WlOpinionVO wlOpinionVO)
    {
        // @todo implement loadWlOpinionFromWlOpinionVO
        //throw new java.lang.UnsupportedOperationException("com.logistics.entity.order.loadWlOpinionFromWlOpinionVO(com.logistics.entity.order.WlOpinionVO) not yet implemented.");

        /* A typical implementation looks like this:*/
        com.logistics.entity.order.WlOpinion wlOpinion = this.load(wlOpinionVO.getId());
        if (wlOpinion == null)
        {
            wlOpinion = com.logistics.entity.order.WlOpinion.Factory.newInstance();
        }
        return wlOpinion;
        
    }

    
    /**
     * @see com.logistics.entity.order.WlOpinionDao#wlOpinionVOToEntity(com.logistics.entity.order.WlOpinionVO)
     */
    public com.logistics.entity.order.WlOpinion wlOpinionVOToEntity(com.logistics.entity.order.WlOpinionVO wlOpinionVO)
    {
        // @todo verify behavior of wlOpinionVOToEntity
        com.logistics.entity.order.WlOpinion entity = this.loadWlOpinionFromWlOpinionVO(wlOpinionVO);
        this.wlOpinionVOToEntity(wlOpinionVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.order.WlOpinionDao#wlOpinionVOToEntity(com.logistics.entity.order.WlOpinionVO, com.logistics.entity.order.WlOpinion)
     */
    public void wlOpinionVOToEntity(
        com.logistics.entity.order.WlOpinionVO source,
        com.logistics.entity.order.WlOpinion target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wlOpinionVOToEntity
        super.wlOpinionVOToEntity(source, target, copyIfNull);
        target.setPeople(this.getPeopleDao().load(source.getPeople().getId()));
        target.setBooker(this.getPeopleDao().load(source.getBooker().getId()));
        target.setReporter(this.getPeopleDao().load(source.getReport().getId()));
        target.setTaskRow(this.getWlTaskRowDao().load(source.getTaskRow().getId()));
        target.setLossFee(source.getLossFee().getUpNumber());
        target.setTime(ProjectUtil.getDate(source.getTime().getUpDate()));
        target.setBookTime(ProjectUtil.getDate(source.getBookTime().getUpDate()));
        // No conversion for target.time (can't convert source.getTime():java.util.Date to java.util.Date
        // No conversion for target.bookTime (can't convert source.getBookTime():java.util.Date to java.util.Date
    }


	protected List handleGetWlOpinion(WlOpinionVO WlOpinion, int pageNumber,int pageSize, String orderBy) throws Exception {
		final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.order.WlOpinionImpl.class);
            if (WlOpinion != null) QueryAssCriteriaOrder.getWlOpinionCriteria(WlOpinion,criteria);
            //条数
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
                    .uniqueResult())  
                    .intValue();//取得符合条件的总数  
      
		      criteria.setProjection(null);  
		      WlOpinion or=new com.logistics.entity.order.WlOpinionImpl();
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