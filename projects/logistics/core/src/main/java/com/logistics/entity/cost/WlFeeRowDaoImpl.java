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
 * @see com.logistics.entity.cost.WlFeeRow
 */
public class WlFeeRowDaoImpl
    extends com.logistics.entity.cost.WlFeeRowDaoBase
{
    /**
     * @see com.logistics.entity.cost.WlFeeRowDao#getWlFeeRow(com.logistics.entity.cost.WlFeeRowVO, int, int, java.lang.String)
     */
    protected java.util.List handleGetWlFeeRow(com.logistics.entity.cost.WlFeeRowVO WlFeeRow, int pageNumber, int pageSize, java.lang.String orderBy)
    {
    	final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.cost.WlFeeRowImpl.class);
            if (WlFeeRow != null) QueryAssCriteriaOrder.getWlFeeRowCriteria(WlFeeRow,criteria);
            //条数
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
                    .uniqueResult())  
                    .intValue();//取得符合条件的总数  
      
		      criteria.setProjection(null);  
		      WlFeeRow or=new com.logistics.entity.cost.WlFeeRowImpl();
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
     * @see com.logistics.entity.cost.WlFeeRowDao#toWlFeeRowVO(com.logistics.entity.cost.WlFeeRow, com.logistics.entity.cost.WlFeeRowVO)
     */
    public void toWlFeeRowVO(
        com.logistics.entity.cost.WlFeeRow source,
        com.logistics.entity.cost.WlFeeRowVO target)
    {
        // @todo verify behavior of toWlFeeRowVO
        super.toWlFeeRowVO(source, target);
        
        // WARNING! No conversion for target.feeList (can't convert source.getFeeList():com.logistics.entity.cost.WlFeeList to com.logistics.entity.cost.WlFeeListVO
        target.setOrderRow(this.getWlOrderRowDao().toWlOrderRowVO(source.getOrderRow()));
        // WARNING! No conversion for target.orderRow (can't convert source.getOrderRow():com.logistics.entity.order.WlOrderRow to com.logistics.entity.order.WlOrderRowVO
        target.setPrinter(this.getPeopleDao().toPeopleVO(source.getPrinter()));
        // WARNING! No conversion for target.printer (can't convert source.getPrinter():com.logistics.entity.orga.People to com.logistics.entity.orga.PeopleVO
        target.setReceiver(this.getPeopleDao().toPeopleVO(source.getReceiver()));
        // WARNING! No conversion for target.receiver (can't convert source.getReceiver():com.logistics.entity.orga.People to com.logistics.entity.orga.PeopleVO
        NumberQuery tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getCarriage());
        target.setCarriage(tempNum);
        // WARNING! No conversion for target.carriage (can't convert source.getCarriage():double to com.logistics.entity.basic.NumberQuery
        tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getAffirmCarriage());
        target.setAffirmCarriage(tempNum);
        // WARNING! No conversion for target.affirmCarriage (can't convert source.getAffirmCarriage():double to com.logistics.entity.basic.NumberQuery
        tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getOtherFee());
        target.setOtherFee(tempNum);
        // WARNING! No conversion for target.otherFee (can't convert source.getOtherFee():double to com.logistics.entity.basic.NumberQuery
        tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getAffirmOtherFee());
        target.setAffirmOtherFee(tempNum);
        // WARNING! No conversion for target.affirmOtherFee (can't convert source.getAffirmOtherFee():double to com.logistics.entity.basic.NumberQuery
        DateTimeQuery tempday=new DateTimeQuery();
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getPrintTime()));
    	target.setPrintTime(tempday);
        // WARNING! No conversion for target.printTime (can't convert source.getPrintTime():java.util.Date to com.logistics.entity.basic.DateTimeQuery
    	tempday=new DateTimeQuery();
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getReceiveTime()));
    	target.setReceiveTime(tempday);
    	// WARNING! No conversion for target.receiveTime (can't convert source.getReceiveTime():java.util.Date to com.logistics.entity.basic.DateTimeQuery
    }


    /**
     * @see com.logistics.entity.cost.WlFeeRowDao#toWlFeeRowVO(com.logistics.entity.cost.WlFeeRow)
     */
    public com.logistics.entity.cost.WlFeeRowVO toWlFeeRowVO(final com.logistics.entity.cost.WlFeeRow entity)
    {
        // @todo verify behavior of toWlFeeRowVO
        return super.toWlFeeRowVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.cost.WlFeeRow loadWlFeeRowFromWlFeeRowVO(com.logistics.entity.cost.WlFeeRowVO wlFeeRowVO)
    {
        // @todo implement loadWlFeeRowFromWlFeeRowVO
        //throw new java.lang.UnsupportedOperationException("com.logistics.entity.cost.loadWlFeeRowFromWlFeeRowVO(com.logistics.entity.cost.WlFeeRowVO) not yet implemented.");

        /* A typical implementation looks like this: */
        com.logistics.entity.cost.WlFeeRow wlFeeRow = this.load(wlFeeRowVO.getId());
        if (wlFeeRow == null)
        {
            wlFeeRow = com.logistics.entity.cost.WlFeeRow.Factory.newInstance();
        }
        return wlFeeRow;
       
    }

    
    /**
     * @see com.logistics.entity.cost.WlFeeRowDao#wlFeeRowVOToEntity(com.logistics.entity.cost.WlFeeRowVO)
     */
    public com.logistics.entity.cost.WlFeeRow wlFeeRowVOToEntity(com.logistics.entity.cost.WlFeeRowVO wlFeeRowVO)
    {
        // @todo verify behavior of wlFeeRowVOToEntity
        com.logistics.entity.cost.WlFeeRow entity = this.loadWlFeeRowFromWlFeeRowVO(wlFeeRowVO);
        this.wlFeeRowVOToEntity(wlFeeRowVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.cost.WlFeeRowDao#wlFeeRowVOToEntity(com.logistics.entity.cost.WlFeeRowVO, com.logistics.entity.cost.WlFeeRow)
     */
    public void wlFeeRowVOToEntity(
        com.logistics.entity.cost.WlFeeRowVO source,
        com.logistics.entity.cost.WlFeeRow target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wlFeeRowVOToEntity
        super.wlFeeRowVOToEntity(source, target, copyIfNull);
        if(source.getOrderRow()!=null)target.setOrderRow(this.getWlOrderRowDao().load(source.getOrderRow().getId()));
        if(source.getPrinter()!=null)target.setPrinter(this.getPeopleDao().load(source.getPrinter().getId()));
        if(source.getReceiver()!=null)target.setReceiver(this.getPeopleDao().load(source.getReceiver().getId()));
        if(source.getCarriage()!=null)target.setCarriage(source.getCarriage().getUpNumber());
        // No conversion for target.carriage (can't convert source.getCarriage():com.logistics.entity.basic.NumberQuery to double
        if(source.getAffirmCarriage()!=null)target.setAffirmCarriage(source.getAffirmCarriage().getUpNumber());
        // No conversion for target.affirmCarriage (can't convert source.getAffirmCarriage():com.logistics.entity.basic.NumberQuery to double
        if(source.getOtherFee()!=null)target.setOtherFee(source.getOtherFee().getUpNumber());
        // No conversion for target.otherFee (can't convert source.getOtherFee():com.logistics.entity.basic.NumberQuery to double
        if(source.getAffirmOtherFee()!=null)target.setAffirmOtherFee(source.getAffirmOtherFee().getUpNumber());
        // No conversion for target.affirmOtherFee (can't convert source.getAffirmOtherFee():com.logistics.entity.basic.NumberQuery to double
        if(source.getPrintTime()!=null)target.setPrintTime(ProjectUtil.getDate(source.getPrintTime().getUpDate()));
        // No conversion for target.printTime (can't convert source.getPrintTime():com.logistics.entity.basic.DateTimeQuery to java.util.Date
        if(source.getReceiveTime()!=null)target.setReceiveTime(ProjectUtil.getDate(source.getReceiveTime().getUpDate()));
        // No conversion for target.receiveTime (can't convert source.getReceiveTime():com.logistics.entity.basic.DateTimeQuery to java.util.Date
    }

}