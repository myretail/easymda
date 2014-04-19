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
import com.logistics.util.ProjectUtil;
import com.logistics.util.QueryAssCriteria;
import com.logistics.util.QueryAssCriteriaOrder;

/**
 * @see com.logistics.entity.order.WlAccident
 */
public class WlAccidentDaoImpl
    extends com.logistics.entity.order.WlAccidentDaoBase
{
    /**
     * @see com.logistics.entity.order.WlAccidentDao#toWlAccidentVO(com.logistics.entity.order.WlAccident, com.logistics.entity.order.WlAccidentVO)
     */
    public void toWlAccidentVO(
        com.logistics.entity.order.WlAccident source,
        com.logistics.entity.order.WlAccidentVO target)
    {
        // @todo verify behavior of toWlAccidentVO
        super.toWlAccidentVO(source, target);
        // WARNING! No conversion for target.accidentTime (can't convert source.getAccidentTime():java.util.Date to java.util.Date
        // WARNING! No conversion for target.bookTime (can't convert source.getBookTime():java.util.Date to java.util.Date
        // WARNING! No conversion for target.reportTime (can't convert source.getReportTime():java.util.Date to java.util.Date
        // WARNING! No conversion for target.compensateTime (can't convert source.getCompensateTime():java.util.Date to java.util.Date
        // WARNING! No conversion for target.insurerTime (can't convert source.getInsurerTime():java.util.Date to java.util.Date
        target.setBreaker(this.getPeopleDao().toPeopleVO(source.getBreaker()));
        target.setBooker(this.getPeopleDao().toPeopleVO(source.getBooker()));
        target.setReporter(this.getPeopleDao().toPeopleVO(source.getReporter()));
        target.setVoiture(this.getWlVoitureDao().toWlVoitureVO(source.getVoiture()));
        DateTimeQuery tempday=new DateTimeQuery();
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getAccidentTime()));
    	target.setAccidentTime(tempday);
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getBookTime()));
    	target.setBookTime(tempday);
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getReportTime()));
    	target.setReportTime(tempday);
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getCompensateTime()));
    	target.setCompensateTime(tempday);
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getInsurerTime()));
    	target.setInsurerTime(tempday);
    }


    /**
     * @see com.logistics.entity.order.WlAccidentDao#toWlAccidentVO(com.logistics.entity.order.WlAccident)
     */
    public com.logistics.entity.order.WlAccidentVO toWlAccidentVO(final com.logistics.entity.order.WlAccident entity)
    {
        // @todo verify behavior of toWlAccidentVO
        return super.toWlAccidentVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.order.WlAccident loadWlAccidentFromWlAccidentVO(com.logistics.entity.order.WlAccidentVO wlAccidentVO)
    {
        // @todo implement loadWlAccidentFromWlAccidentVO
        //throw new java.lang.UnsupportedOperationException("com.logistics.entity.order.loadWlAccidentFromWlAccidentVO(com.logistics.entity.order.WlAccidentVO) not yet implemented.");

        /* A typical implementation looks like this:*/
        com.logistics.entity.order.WlAccident wlAccident = this.load(wlAccidentVO.getId());
        if (wlAccident == null)
        {
            wlAccident = com.logistics.entity.order.WlAccident.Factory.newInstance();
        }
        return wlAccident;
        
    }

    
    /**
     * @see com.logistics.entity.order.WlAccidentDao#wlAccidentVOToEntity(com.logistics.entity.order.WlAccidentVO)
     */
    public com.logistics.entity.order.WlAccident wlAccidentVOToEntity(com.logistics.entity.order.WlAccidentVO wlAccidentVO)
    {
        // @todo verify behavior of wlAccidentVOToEntity
        com.logistics.entity.order.WlAccident entity = this.loadWlAccidentFromWlAccidentVO(wlAccidentVO);
        this.wlAccidentVOToEntity(wlAccidentVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.order.WlAccidentDao#wlAccidentVOToEntity(com.logistics.entity.order.WlAccidentVO, com.logistics.entity.order.WlAccident)
     */
    public void wlAccidentVOToEntity(
        com.logistics.entity.order.WlAccidentVO source,
        com.logistics.entity.order.WlAccident target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wlAccidentVOToEntity
        super.wlAccidentVOToEntity(source, target, copyIfNull);
        target.setBooker(this.getPeopleDao().load(source.getBooker().getId()));
        target.setBreaker(this.getPeopleDao().load(source.getBreaker().getId()));
        target.setReporter(this.getPeopleDao().load(source.getReporter().getId()));
        target.setVoiture(this.getWlVoitureDao().load(source.getVoiture().getId()));
        target.setAccidentTime(ProjectUtil.getDate(source.getAccidentTime().getUpDate()));
        target.setBookTime(ProjectUtil.getDate(source.getBookTime().getUpDate()));
        target.setReportTime(ProjectUtil.getDate(source.getReportTime().getUpDate()));
        target.setCompensateTime(ProjectUtil.getDate(source.getCompensateTime().getUpDate()));
        target.setInsurerTime(ProjectUtil.getDate(source.getInsurerTime().getUpDate()));
        // No conversion for target.accidentTime (can't convert source.getAccidentTime():java.util.Date to java.util.Date
        // No conversion for target.bookTime (can't convert source.getBookTime():java.util.Date to java.util.Date
        // No conversion for target.reportTime (can't convert source.getReportTime():java.util.Date to java.util.Date
        // No conversion for target.compensateTime (can't convert source.getCompensateTime():java.util.Date to java.util.Date
        // No conversion for target.insurerTime (can't convert source.getInsurerTime():java.util.Date to java.util.Date
    }


	protected List handleGetWlAccident(WlAccidentVO WlAccident, int pageNumber,	int pageSize, String orderBy) throws Exception {
		final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.order.WlAccidentImpl.class);
            if (WlAccident != null) QueryAssCriteriaOrder.getWlAccidentCriteria(WlAccident,criteria);
             //条数
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
                    .uniqueResult())  
                    .intValue();//取得符合条件的总数  
      
		      criteria.setProjection(null);  
		      com.logistics.entity.order.WlAccident or=new com.logistics.entity.order.WlAccidentImpl();
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