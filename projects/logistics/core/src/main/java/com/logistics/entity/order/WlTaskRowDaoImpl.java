// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.entity.order;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;

import com.logistics.entity.basic.DateTimeQuery;
import com.logistics.util.ProjectUtil;
import com.logistics.util.QueryAssCriteriaOrder;

/**
 * @see com.logistics.entity.order.WlTaskRow
 */
public class WlTaskRowDaoImpl
    extends com.logistics.entity.order.WlTaskRowDaoBase
{
    /**
     * @see com.logistics.entity.order.WlTaskRowDao#getWlTaskRow(com.logistics.entity.order.WlTaskRowVO, int, int, java.lang.String)
     */
    protected java.util.List handleGetWlTaskRow(com.logistics.entity.order.WlTaskRowVO WlTaskRowVO, int pageNumber, int pageSize, java.lang.String orderBy)
    {
    	 final Session session = getSession(false);

         try
         {
             final Criteria criteria = session.createCriteria(com.logistics.entity.order.WlTaskRowImpl.class);
             if (WlTaskRowVO != null) QueryAssCriteriaOrder.getTaskRowCriteria(WlTaskRowVO,criteria);
             //条数
             int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
                     .uniqueResult())  
                     .intValue();//取得符合条件的总数  
       
		      criteria.setProjection(null);  
		     WlTaskRow or=new com.logistics.entity.order.WlTaskRowImpl();
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
     * @see com.logistics.entity.order.WlTaskRowDao#toWlTaskRowVO(com.logistics.entity.order.WlTaskRow, com.logistics.entity.order.WlTaskRowVO)
     */
    public void toWlTaskRowVO(
        com.logistics.entity.order.WlTaskRow source,
        com.logistics.entity.order.WlTaskRowVO target)
    {
        // @todo verify behavior of toWlTaskRowVO
        super.toWlTaskRowVO(source, target);
        DateTimeQuery tempday=new DateTimeQuery();
        System.out.println("source.getPlanFetchTime()::::--------------"+source.getPlanFetchTime());
        System.out.println("ProjectUtil.getFullDateStr(source.getPlanFetchTime())::::--------------"+ProjectUtil.getFullDateStr(source.getPlanFetchTime()));
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getPlanFetchTime()));
    	target.setPlanFetchTime(tempday);
        //target.setPlanFetchTime(ProjectUtil.getFullDateStr(source.getPlanFetchTime()));
        // WARNING! No conversion for target.planFetchTime (can't convert source.getPlanFetchTime():java.util.Date to java.lang.String
    	tempday=new DateTimeQuery();
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getPlanUnloadTime()));
    	target.setPlanUnloadTime(tempday);
        //target.setPlanUnloadTime(ProjectUtil.getFullDateStr(source.getPlanUnloadTime()));
        // WARNING! No conversion for target.planUnloadTime (can't convert source.getPlanUnloadTime():java.util.Date to java.lang.String
    	tempday=new DateTimeQuery();
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getPlanBackTime()));
    	target.setPlanBackTime(tempday);
        //target.setPlanBackTime(ProjectUtil.getFullDateStr(source.getPlanBackTime()));
        // WARNING! No conversion for target.planBackTime (can't convert source.getPlanBackTime():java.util.Date to java.lang.String
    	tempday=new DateTimeQuery();
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getArriveFetchTime()));
    	target.setArriveFetchTime(tempday);
        //target.setArriveFetchTime(ProjectUtil.getFullDateStr(source.getArriveFetchTime()));
        // WARNING! No conversion for target.arriveFetchTime (can't convert source.getArriveFetchTime():java.util.Date to java.lang.String
    	tempday=new DateTimeQuery();
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getStartFetchTime()));
    	target.setStartFetchTime(tempday);
        //target.setStartFetchTime(ProjectUtil.getFullDateStr(source.getStartFetchTime()));
        // WARNING! No conversion for target.startFetchTime (can't convert source.getStartFetchTime():java.util.Date to java.lang.String
    	tempday=new DateTimeQuery();
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getEndFetchTime()));
    	target.setEndFetchTime(tempday);
        //target.setEndFetchTime(ProjectUtil.getFullDateStr(source.getEndFetchTime()));
        // WARNING! No conversion for target.endFetchTime (can't convert source.getEndFetchTime():java.util.Date to java.lang.String
    	tempday=new DateTimeQuery();
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getArriveUnloadTime()));
    	target.setArriveUnloadTime(tempday);
        //target.setArriveUnloadTime(ProjectUtil.getFullDateStr(source.getArriveUnloadTime()));
        // WARNING! No conversion for target.arriveUnloadTime (can't convert source.getArriveUnloadTime():java.util.Date to java.lang.String
    	tempday=new DateTimeQuery();
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getStartUnloadTime()));
    	target.setStartUnloadTime(tempday);
        //target.setStartUnloadTime(ProjectUtil.getFullDateStr(source.getStartUnloadTime()));
        // WARNING! No conversion for target.startUnloadTime (can't convert source.getStartUnloadTime():java.util.Date to java.lang.String
    	tempday=new DateTimeQuery();
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getEndUnloadTime()));
    	target.setEndUnloadTime(tempday);
        //target.setEndUnloadTime(ProjectUtil.getFullDateStr(source.getEndUnloadTime()));
        // WARNING! No conversion for target.endUnloadTime (can't convert source.getEndUnloadTime():java.util.Date to java.lang.String
    	tempday=new DateTimeQuery();
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getReturnDate()));
    	target.setReturnDate(tempday);
        //target.setReturnDate(ProjectUtil.getFullDateStr(source.getReturnDate()));
        // WARNING! No conversion for target.returnDate (can't convert source.getReturnDate():java.util.Date to java.lang.String
        //target.setTask(source.getTask() == null ? null :this.getWlTaskDao().toWlTaskVO(source.getTask()));
        // WARNING! No conversion for target.task (can't convert source.getTask():com.logistics.entity.order.WlTask to com.logistics.entity.order.WlTaskVO
        target.setAssistDriver(source.getAssistDriver() == null ? null :this.getPeopleDao().toPeopleVO(source.getAssistDriver()));
        // WARNING! No conversion for target.assistDriver (can't convert source.getAssistDriver():com.logistics.entity.orga.People to com.logistics.entity.orga.PeopleVO
        target.setFetchUnit(source.getFetchUnit() == null ? null :this.getWlCustomerDao().toWlCustomerVO(source.getFetchUnit()));
        // WARNING! No conversion for target.fetchUnit (can't convert source.getFetchUnit():com.logistics.entity.customer.WlCustomer to com.logistics.entity.customer.WlCustomerVO
        target.setUnloadUnit(source.getUnloadUnit() == null ? null :this.getWlCustomerDao().toWlCustomerVO(source.getUnloadUnit()));
        // WARNING! No conversion for target.unloadUnit (can't convert source.getUnloadUnit():com.logistics.entity.customer.WlCustomer to com.logistics.entity.customer.WlCustomerVO
        target.setMasterDriver(source.getMasterDriver() == null ? null :this.getPeopleDao().toPeopleVO(source.getMasterDriver()));
        // WARNING! No conversion for target.masterDriver (can't convert source.getMasterDriver():com.logistics.entity.orga.People to com.logistics.entity.orga.PeopleVO
        //target.setTrwithor(source.getTrwithor() == null ? null :this.getWltrwithorDao().toWltrwithorVOArray(source.getTrwithor()));
        /*if(source.getTrwithor() == null ){
        	target.setTrwithor(null);
        }else{
        	WltrwithorVO[] tvo=new WltrwithorVO[source.getTrwithor().size()];
        	int t=0;
        	java.util.Iterator iterator = source.getTrwithor().iterator();
        	while ( iterator.hasNext())
            {   
                tvo[t]=this.getWltrwithorDao().toWltrwithorVO((com.logistics.entity.order.Wltrwithor)iterator.next());
                t++;
            }
        	target.setTrwithor(tvo);
        }*/
        
        if(target.getTrwithorId()!=0){
        	
        }else{
        	target.setTrwithor(source.getTrwithor() == null ? null :this.getWltrwithorDao().toWltrwithorVOArray(source.getTrwithor()));
        }
        target.setVoiture(source.getVoiture() == null ? null :this.getWlVoitureDao().toWlVoitureVO(source.getVoiture()));
        // WARNING! No conversion for target.trwithor (can't convert source.getTrwithor():com.logistics.entity.order.Wltrwithor to com.logistics.entity.order.WltrwithorVO
    }


    /**
     * @see com.logistics.entity.order.WlTaskRowDao#toWlTaskRowVO(com.logistics.entity.order.WlTaskRow)
     */
    public com.logistics.entity.order.WlTaskRowVO toWlTaskRowVO(final com.logistics.entity.order.WlTaskRow entity)
    {
        // @todo verify behavior of toWlTaskRowVO
        return super.toWlTaskRowVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.order.WlTaskRow loadWlTaskRowFromWlTaskRowVO(com.logistics.entity.order.WlTaskRowVO wlTaskRowVO)
    {
        // @todo implement loadWlTaskRowFromWlTaskRowVO
        //throw new java.lang.UnsupportedOperationException("com.logistics.entity.order.loadWlTaskRowFromWlTaskRowVO(com.logistics.entity.order.WlTaskRowVO) not yet implemented.");

        /* A typical implementation looks like this:*/
        com.logistics.entity.order.WlTaskRow wlTaskRow = this.load(wlTaskRowVO.getId());
        if (wlTaskRow == null)
        {
            wlTaskRow = com.logistics.entity.order.WlTaskRow.Factory.newInstance();
        }
        return wlTaskRow;
        
    }

    
    /**
     * @see com.logistics.entity.order.WlTaskRowDao#wlTaskRowVOToEntity(com.logistics.entity.order.WlTaskRowVO)
     */
    public com.logistics.entity.order.WlTaskRow wlTaskRowVOToEntity(com.logistics.entity.order.WlTaskRowVO wlTaskRowVO)
    {
        // @todo verify behavior of wlTaskRowVOToEntity
        com.logistics.entity.order.WlTaskRow entity = this.loadWlTaskRowFromWlTaskRowVO(wlTaskRowVO);
        this.wlTaskRowVOToEntity(wlTaskRowVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.order.WlTaskRowDao#wlTaskRowVOToEntity(com.logistics.entity.order.WlTaskRowVO, com.logistics.entity.order.WlTaskRow)
     */
    public void wlTaskRowVOToEntity(
        com.logistics.entity.order.WlTaskRowVO source,
        com.logistics.entity.order.WlTaskRow target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wlTaskRowVOToEntity
        super.wlTaskRowVOToEntity(source, target, copyIfNull);
        if(source.getPlanFetchTime()!=null)target.setPlanFetchTime(ProjectUtil.getDate(source.getPlanFetchTime().getUpDate()));
        // No conversion for target.planFetchTime (can't convert source.getPlanFetchTime():java.lang.String to java.util.Date
        if(source.getPlanUnloadTime()!=null)target.setPlanUnloadTime(ProjectUtil.getDate(source.getPlanUnloadTime().getUpDate()));
        // No conversion for target.planUnloadTime (can't convert source.getPlanUnloadTime():java.lang.String to java.util.Date
        if(source.getPlanBackTime()!=null)target.setPlanBackTime(ProjectUtil.getDate(source.getPlanBackTime().getUpDate()));
        // No conversion for target.planBackTime (can't convert source.getPlanBackTime():java.lang.String to java.util.Date
        if(source.getArriveFetchTime()!=null)target.setArriveFetchTime(ProjectUtil.getDate(source.getArriveFetchTime().getUpDate()));
        // No conversion for target.arriveFetchTime (can't convert source.getArriveFetchTime():java.lang.String to java.util.Date
        if(source.getStartFetchTime()!=null)target.setStartFetchTime(ProjectUtil.getDate(source.getStartFetchTime().getUpDate()));
        // No conversion for target.startFetchTime (can't convert source.getStartFetchTime():java.lang.String to java.util.Date
        if(source.getEndFetchTime()!=null)target.setEndFetchTime(ProjectUtil.getDate(source.getEndFetchTime().getUpDate()));
        // No conversion for target.endFetchTime (can't convert source.getEndFetchTime():java.lang.String to java.util.Date
        if(source.getArriveUnloadTime()!=null)target.setArriveUnloadTime(ProjectUtil.getDate(source.getArriveUnloadTime().getUpDate()));
        // No conversion for target.arriveUnloadTime (can't convert source.getArriveUnloadTime():java.lang.String to java.util.Date
        if(source.getStartUnloadTime()!=null)target.setStartUnloadTime(ProjectUtil.getDate(source.getStartUnloadTime().getUpDate()));
        // No conversion for target.startUnloadTime (can't convert source.getStartUnloadTime():java.lang.String to java.util.Date
        if(source.getEndUnloadTime()!=null)target.setEndUnloadTime(ProjectUtil.getDate(source.getEndUnloadTime().getUpDate()));
        // No conversion for target.endUnloadTime (can't convert source.endUnloadTime():java.lang.String to java.util.Date
        if(source.getReturnDate()!=null)target.setReturnDate(ProjectUtil.getDate(source.getReturnDate().getUpDate()));
        // No conversion for target.returnDate (can't convert source.getReturnDate():java.lang.String to java.util.Date
        if(source.getTask()!=null)target.setTask(this.getWlTaskDao().load(source.getTask().getId()));
        if(source.getPath()!=null)target.setPath(this.getWlPathDao().load(source.getPath().getId()));
        if(source.getVoiture()!=null)target.setVoiture(this.getWlVoitureDao().load(source.getVoiture().getId()));
        if(source.getAssistDriver()!=null)target.setAssistDriver(this.getPeopleDao().load(source.getAssistDriver().getId()));
        if(source.getFetchUnit()!=null)target.setFetchUnit(this.getWlCustomerDao().load(source.getFetchUnit().getId()));
        if(source.getUnloadUnit()!=null)target.setUnloadUnit(this.getWlCustomerDao().load(source.getUnloadUnit().getId()));
        if(source.getMasterDriver()!=null)target.setMasterDriver(this.getPeopleDao().load(source.getMasterDriver().getId()));
        
        
    }

	protected List handleAddTaskRowByOrder(List orderRowID, String taskID)throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	

}