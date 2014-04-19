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
 * @see com.logistics.entity.cost.WlLoan
 */
public class WlLoanDaoImpl
    extends com.logistics.entity.cost.WlLoanDaoBase
{
    /**
     * @see com.logistics.entity.cost.WlLoanDao#getWlLoan(com.logistics.entity.cost.WlLoanVO, int, int, java.lang.String)
     */
    protected java.util.List handleGetWlLoan(com.logistics.entity.cost.WlLoanVO WlLoan, int pageNumber, int pageSize, java.lang.String orderBy)
    {
    	final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.cost.WlLoanImpl.class);
            if (WlLoan != null) QueryAssCriteriaOrder.getWlLoanCriteria(WlLoan,criteria);
            //条数
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
                    .uniqueResult())  
                    .intValue();//取得符合条件的总数  
      
		      criteria.setProjection(null);  
		      WlLoan or=new com.logistics.entity.cost.WlLoanImpl();
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
     * @see com.logistics.entity.cost.WlLoanDao#toWlLoanVO(com.logistics.entity.cost.WlLoan, com.logistics.entity.cost.WlLoanVO)
     */
    public void toWlLoanVO(
        com.logistics.entity.cost.WlLoan source,
        com.logistics.entity.cost.WlLoanVO target)
    {
        // @todo verify behavior of toWlLoanVO
        super.toWlLoanVO(source, target);
        
        target.setTask(this.getWlTaskDao().toWlTaskVO(source.getTask()));
        // WARNING! No conversion for target.taskRow (can't convert source.getTaskRow():com.logistics.entity.order.WlTaskRow to com.logistics.entity.order.WlTaskRowVO
        target.setReturnBooker(this.getPeopleDao().toPeopleVO(source.getReturnBooker()));
        // WARNING! No conversion for target.returnBooker (can't convert source.getReturnBooker():com.logistics.entity.orga.People to com.logistics.entity.orga.PeopleVO
        target.setBorrower(this.getPeopleDao().toPeopleVO(source.getBorrower()));
        // WARNING! No conversion for target.borrower (can't convert source.getBorrower():com.logistics.entity.orga.People to com.logistics.entity.orga.PeopleVO
        target.setReturner(this.getPeopleDao().toPeopleVO(source.getReturner()));
        // WARNING! No conversion for target.returner (can't convert source.getReturner():com.logistics.entity.orga.People to com.logistics.entity.orga.PeopleVO
        target.setAgent(this.getPeopleDao().toPeopleVO(source.getAgent()));
        // WARNING! No conversion for target.agent (can't convert source.getAgent():com.logistics.entity.orga.People to com.logistics.entity.orga.PeopleVO
        DateTimeQuery tempday=new DateTimeQuery();
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getApplyTime()));
    	target.setApplyTime(tempday);
        // WARNING! No conversion for target.applyTime (can't convert source.getApplyTime():java.util.Date to com.logistics.entity.basic.DateTimeQuery
    	tempday=new DateTimeQuery();
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getPlanPayTime()));
    	target.setPlanPayTime(tempday);
        // WARNING! No conversion for target.planPayTime (can't convert source.getPlanPayTime():java.util.Date to com.logistics.entity.basic.DateTimeQuery
    	NumberQuery tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getPlanLoanFee());
        target.setPlanLoanFee(tempNum);
        // WARNING! No conversion for target.planLoanFee (can't convert source.getPlanLoanFee():double to com.logistics.entity.basic.NumberQuery
        tempNum=new NumberQuery();
        tempday.setUpDate(ProjectUtil.getFullDateStr(source.getFactLoanTime()));
    	target.setFactLoanTime(tempday);
        // WARNING! No conversion for target.factLoanTime (can't convert source.getFactLoanTime():java.util.Date to com.logistics.entity.basic.DateTimeQuery
    	tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getFactLoanFee());
        target.setFactLoanFee(tempNum);
        // WARNING! No conversion for target.factLoanFee (can't convert source.getFactLoanFee():double to com.logistics.entity.basic.NumberQuery
        tempNum=new NumberQuery();
        tempday.setUpDate(ProjectUtil.getFullDateStr(source.getReturnTime()));
    	target.setReturnTime(tempday);
        // WARNING! No conversion for target.returnTime (can't convert source.getReturnTime():java.util.Date to com.logistics.entity.basic.DateTimeQuery
    }


    /**
     * @see com.logistics.entity.cost.WlLoanDao#toWlLoanVO(com.logistics.entity.cost.WlLoan)
     */
    public com.logistics.entity.cost.WlLoanVO toWlLoanVO(final com.logistics.entity.cost.WlLoan entity)
    {
        // @todo verify behavior of toWlLoanVO
        return super.toWlLoanVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.cost.WlLoan loadWlLoanFromWlLoanVO(com.logistics.entity.cost.WlLoanVO wlLoanVO)
    {
        // @todo implement loadWlLoanFromWlLoanVO
        //throw new java.lang.UnsupportedOperationException("com.logistics.entity.cost.loadWlLoanFromWlLoanVO(com.logistics.entity.cost.WlLoanVO) not yet implemented.");

        /* A typical implementation looks like this:*/
        com.logistics.entity.cost.WlLoan wlLoan = this.load(wlLoanVO.getId());
        if (wlLoan == null)
        {
            wlLoan = com.logistics.entity.cost.WlLoan.Factory.newInstance();
        }
        return wlLoan;
        
    }

    
    /**
     * @see com.logistics.entity.cost.WlLoanDao#wlLoanVOToEntity(com.logistics.entity.cost.WlLoanVO)
     */
    public com.logistics.entity.cost.WlLoan wlLoanVOToEntity(com.logistics.entity.cost.WlLoanVO wlLoanVO)
    {
        // @todo verify behavior of wlLoanVOToEntity
        com.logistics.entity.cost.WlLoan entity = this.loadWlLoanFromWlLoanVO(wlLoanVO);
        this.wlLoanVOToEntity(wlLoanVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.cost.WlLoanDao#wlLoanVOToEntity(com.logistics.entity.cost.WlLoanVO, com.logistics.entity.cost.WlLoan)
     */
    public void wlLoanVOToEntity(
        com.logistics.entity.cost.WlLoanVO source,
        com.logistics.entity.cost.WlLoan target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wlLoanVOToEntity
        super.wlLoanVOToEntity(source, target, copyIfNull);
        if(source.getApplyTime()!=null)target.setApplyTime(ProjectUtil.getDate(source.getApplyTime().getUpDate()));
        // No conversion for target.applyTime (can't convert source.getApplyTime():com.logistics.entity.basic.DateTimeQuery to java.util.Date
        if(source.getPlanPayTime()!=null)target.setPlanPayTime(ProjectUtil.getDate(source.getPlanPayTime().getUpDate()));
        // No conversion for target.planPayTime (can't convert source.getPlanPayTime():com.logistics.entity.basic.DateTimeQuery to java.util.Date
        if(source.getPlanLoanFee()!=null)target.setPlanLoanFee(source.getPlanLoanFee().getUpNumber());
        // No conversion for target.planLoanFee (can't convert source.getPlanLoanFee():com.logistics.entity.basic.NumberQuery to double
        if(source.getFactLoanTime()!=null)target.setFactLoanTime(ProjectUtil.getDate(source.getFactLoanTime().getUpDate()));
        // No conversion for target.factLoanTime (can't convert source.getFactLoanTime():com.logistics.entity.basic.DateTimeQuery to java.util.Date
        if(source.getFactLoanFee()!=null)target.setFactLoanFee(source.getFactLoanFee().getUpNumber());
        // No conversion for target.factLoanFee (can't convert source.getFactLoanFee():com.logistics.entity.basic.NumberQuery to double
        if(source.getReturnTime()!=null)target.setReturnTime(ProjectUtil.getDate(source.getReturnTime().getUpDate()));
        // No conversion for target.returnTime (can't convert source.getReturnTime():com.logistics.entity.basic.DateTimeQuery to java.util.Date
        if(source.getAgent()!=null)target.setAgent(this.getPeopleDao().load(source.getAgent().getId()));
        if(source.getBorrower()!=null)target.setBorrower(this.getPeopleDao().load(source.getBorrower().getId()));
        if(source.getReturnBooker()!=null)target.setReturnBooker(this.getPeopleDao().load(source.getReturnBooker().getId()));
        if(source.getReturner()!=null)target.setReturner(this.getPeopleDao().load(source.getReturner().getId()));
        if(source.getTask()!=null)target.setTask(this.getWlTaskDao().load(source.getTask().getId()));
    }

}