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
import com.logistics.util.ProjectUtil;
import com.logistics.util.QueryAssCriteriaOrder;

/**
 * @see com.logistics.entity.order.WlSteerRow
 */
public class WlSteerRowDaoImpl
    extends com.logistics.entity.order.WlSteerRowDaoBase
{
    /**
     * @see com.logistics.entity.order.WlSteerRowDao#toWlSteerRowVO(com.logistics.entity.order.WlSteerRow, com.logistics.entity.order.WlSteerRowVO)
     */
    public void toWlSteerRowVO(
        com.logistics.entity.order.WlSteerRow source,
        com.logistics.entity.order.WlSteerRowVO target)
    {
        // @todo verify behavior of toWlSteerRowVO
        super.toWlSteerRowVO(source, target);
        // WARNING! No conversion for target.time (can't convert source.getTime():java.util.Date to java.util.Date
        // WARNING! No conversion for target.bookTime (can't convert source.getBookTime():java.util.Date to java.util.Date
        DateTimeQuery tempday=new DateTimeQuery();
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getTime()));
    	target.setTime(tempday);
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getBookTime()));
    	target.setBookTime(tempday);
    	NumberQuery tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getMiles());
        target.setMiles(tempNum);
        target.setBooker(this.getPeopleDao().toPeopleVO(source.getBooker()));
        target.setReporter(this.getPeopleDao().toPeopleVO(source.getReporter()));
        target.setTask(this.getWlTaskDao().toWlTaskVO(source.getTask()));
        target.setVoiture(this.getWlVoitureDao().toWlVoitureVO(source.getVoiture()));
    }


    /**
     * @see com.logistics.entity.order.WlSteerRowDao#toWlSteerRowVO(com.logistics.entity.order.WlSteerRow)
     */
    public com.logistics.entity.order.WlSteerRowVO toWlSteerRowVO(final com.logistics.entity.order.WlSteerRow entity)
    {
        // @todo verify behavior of toWlSteerRowVO
        return super.toWlSteerRowVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.order.WlSteerRow loadWlSteerRowFromWlSteerRowVO(com.logistics.entity.order.WlSteerRowVO wlSteerRowVO)
    {
        // @todo implement loadWlSteerRowFromWlSteerRowVO
        //throw new java.lang.UnsupportedOperationException("com.logistics.entity.order.loadWlSteerRowFromWlSteerRowVO(com.logistics.entity.order.WlSteerRowVO) not yet implemented.");

        /* A typical implementation looks like this:*/
        com.logistics.entity.order.WlSteerRow wlSteerRow = this.load(wlSteerRowVO.getId());
        if (wlSteerRow == null)
        {
            wlSteerRow = com.logistics.entity.order.WlSteerRow.Factory.newInstance();
        }
        return wlSteerRow;
        
    }

    
    /**
     * @see com.logistics.entity.order.WlSteerRowDao#wlSteerRowVOToEntity(com.logistics.entity.order.WlSteerRowVO)
     */
    public com.logistics.entity.order.WlSteerRow wlSteerRowVOToEntity(com.logistics.entity.order.WlSteerRowVO wlSteerRowVO)
    {
        // @todo verify behavior of wlSteerRowVOToEntity
        com.logistics.entity.order.WlSteerRow entity = this.loadWlSteerRowFromWlSteerRowVO(wlSteerRowVO);
        this.wlSteerRowVOToEntity(wlSteerRowVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.order.WlSteerRowDao#wlSteerRowVOToEntity(com.logistics.entity.order.WlSteerRowVO, com.logistics.entity.order.WlSteerRow)
     */
    public void wlSteerRowVOToEntity(
        com.logistics.entity.order.WlSteerRowVO source,
        com.logistics.entity.order.WlSteerRow target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wlSteerRowVOToEntity
        super.wlSteerRowVOToEntity(source, target, copyIfNull);
        // No conversion for target.time (can't convert source.getTime():java.util.Date to java.util.Date
        // No conversion for target.bookTime (can't convert source.getBookTime():java.util.Date to java.util.Date
        target.setTime(ProjectUtil.getDate(source.getTime().getUpDate()));
        target.setBookTime(ProjectUtil.getDate(source.getBookTime().getUpDate()));
        target.setBooker(this.getPeopleDao().load(source.getBooker().getId()));
        target.setReporter(this.getPeopleDao().load(source.getReporter().getId()));
        target.setTask(this.getWlTaskDao().load(source.getTask().getId()));
        target.setVoiture(this.getWlVoitureDao().load(source.getVoiture().getId()));
        target.setPlace(this.getWlPlaceDao().load(source.getPlace().getId()));
        target.setMiles(source.getMiles().getUpNumber());
    }


	protected List handleGetWlSteerRow(WlSteerRowVO WlSteerRow, int pageNumber,	int pageSize, String orderBy) throws Exception {
		final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.order.WlSteerRowImpl.class);
            if (WlSteerRow != null) QueryAssCriteriaOrder.getWlSteerRowCriteria(WlSteerRow,criteria);
            //条数
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
                    .uniqueResult())  
                    .intValue();//取得符合条件的总数  
      
		      criteria.setProjection(null);  
		      WlSteerRow or=new com.logistics.entity.order.WlSteerRowImpl();
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