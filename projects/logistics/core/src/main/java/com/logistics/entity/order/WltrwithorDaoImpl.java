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

import com.logistics.entity.basic.NumberQuery;
import com.logistics.util.QueryAssCriteriaOrder;

/**
 * @see com.logistics.entity.order.Wltrwithor
 */
public class WltrwithorDaoImpl
    extends com.logistics.entity.order.WltrwithorDaoBase
{
    /**
     * @see com.logistics.entity.order.WltrwithorDao#getWltrwithor(com.logistics.entity.order.WltrwithorVO, int, int, java.lang.String)
     */
    protected java.util.List handleGetWltrwithor(com.logistics.entity.order.WltrwithorVO WltrwithorVO, int pageNumber, int pageSize, java.lang.String orderBy)
    {
    	final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.order.WltrwithorImpl.class);
            if (WltrwithorVO != null) QueryAssCriteriaOrder.getTrwithorCriteria(WltrwithorVO,criteria);
            /*criteria.add(Expression.eq("loadNum", new java.lang.Double(WltrwithorVO.getLoadNum())));
            criteria.add(Expression.eq("factNum", new java.lang.Double(WltrwithorVO.getFactNum())));
            criteria.add(Expression.eq("carryBoxNum", new java.lang.Double(WltrwithorVO.getCarryBoxNum())));
            criteria.add(Expression.eq("factBoxNum", new java.lang.Double(WltrwithorVO.getFactBoxNum())));
            criteria.add(Expression.eq("loadWeight", new java.lang.Double(WltrwithorVO.getLoadWeight())));
            criteria.add(Expression.eq("factWeight", new java.lang.Double(WltrwithorVO.getFactWeight())));
            criteria.add(Expression.eq("loadCubage", new java.lang.Double(WltrwithorVO.getLoadCubage())));
            criteria.add(Expression.eq("factCubage", new java.lang.Double(WltrwithorVO.getFactCubage())));
            criteria.add(Expression.eq("planFee", new java.lang.Double(WltrwithorVO.getPlanFee())));
            if (WltrwithorVO.getStartGoodsState() != null)
                criteria.add(Expression.ilike("startGoodsState", WltrwithorVO.getStartGoodsState(), MatchMode.START));
            if (WltrwithorVO.getEndGoodsState() != null)
                criteria.add(Expression.ilike("endGoodsState", WltrwithorVO.getEndGoodsState(), MatchMode.START));
            if (WltrwithorVO.getRemark() != null)
                criteria.add(Expression.ilike("remark", WltrwithorVO.getRemark(), MatchMode.START));
            if (WltrwithorVO.getId() != 0)
            criteria.add(Expression.eq("id", WltrwithorVO.getId()));
            //if (WltrwithorVO.getTaskRow() != null) criteria.createCriteria("taskRow").add(Expression.eq("id", WltrwithorVO.getTaskRow()));
            if (WltrwithorVO.getOrderRow() != null) criteria.createCriteria("orderRow").add(Expression.eq("id", WltrwithorVO.getOrderRow()));*/
          //条数
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
                    .uniqueResult())  
                    .intValue();//取得符合条件的总数  
              criteria.setProjection(null);  
		      Wltrwithor or=new com.logistics.entity.order.WltrwithorImpl();
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
     * @see com.logistics.entity.order.WltrwithorDao#toWltrwithorVO(com.logistics.entity.order.Wltrwithor, com.logistics.entity.order.WltrwithorVO)
     */
    public void toWltrwithorVO(
        com.logistics.entity.order.Wltrwithor source,
        com.logistics.entity.order.WltrwithorVO target)
    {
        // @todo verify behavior of toWltrwithorVO
        super.toWltrwithorVO(source, target);
        NumberQuery tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getFactBoxNum());
        target.setFactBoxNum(tempNum);
        
        tempNum.setUpNumber(source.getFactCubage());
        target.setFactCubage(tempNum);
        
        tempNum.setUpNumber(source.getFactNum());
        target.setFactNum(tempNum);
        
        tempNum.setUpNumber(source.getFactWeight());
        target.setFactWeight(tempNum);
        
        tempNum.setUpNumber(source.getLoadCubage());
        target.setLoadCubage(tempNum);
        
        tempNum.setUpNumber(source.getLoadNum());
        target.setLoadNum(tempNum);
        
        tempNum.setUpNumber(source.getLoadWeight());
        target.setLoadWeight(tempNum);
        
        tempNum.setUpNumber(source.getPlanFee());
        target.setPlanFee(tempNum);
        
        tempNum.setUpNumber(source.getCarryBoxNum());
        target.setCarryBoxNum(tempNum);
        
        if(target.getOrderRowId()!=0){
        	//target.setTaskRowId(source.getTaskRow() == null ? 0 :this.getWlTaskRowDao().toWlTaskRowVOArray(source.getTaskRow()));
        }else{
        	target.setOrderRow(source.getOrderRow() == null ? null :this.getWlOrderRowDao().toWlOrderRowVO(source.getOrderRow()));
        }
        	//target.setTaskRow(source.getTaskRow() == null ? null :this.getWlTaskRowDao().toWlTaskRowVO(source.getTaskRow()));
        
        // WARNING! No conversion for target.orderRow (can't convert source.getOrderRow():com.logistics.entity.order.WlOrderRow to com.logistics.entity.order.WlOrderRowVO
        // WARNING! No conversion for target.taskRow (can't convert source.getTaskRow():com.logistics.entity.order.WlTaskRow to com.logistics.entity.order.WlTaskRowVO
    }


    /**
     * @see com.logistics.entity.order.WltrwithorDao#toWltrwithorVO(com.logistics.entity.order.Wltrwithor)
     */
    public com.logistics.entity.order.WltrwithorVO toWltrwithorVO(final com.logistics.entity.order.Wltrwithor entity)
    {
        // @todo verify behavior of toWltrwithorVO
        return super.toWltrwithorVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.order.Wltrwithor loadWltrwithorFromWltrwithorVO(com.logistics.entity.order.WltrwithorVO wltrwithorVO)
    {
        // @todo implement loadWltrwithorFromWltrwithorVO
        //throw new java.lang.UnsupportedOperationException("com.logistics.entity.order.loadWltrwithorFromWltrwithorVO(com.logistics.entity.order.WltrwithorVO) not yet implemented.");

        /* A typical implementation looks like this: */
        com.logistics.entity.order.Wltrwithor wltrwithor = this.load(wltrwithorVO.getId());
        if (wltrwithor == null)
        {
            wltrwithor = com.logistics.entity.order.Wltrwithor.Factory.newInstance();
        }
        return wltrwithor;
       
    }

    
    /**
     * @see com.logistics.entity.order.WltrwithorDao#wltrwithorVOToEntity(com.logistics.entity.order.WltrwithorVO)
     */
    public com.logistics.entity.order.Wltrwithor wltrwithorVOToEntity(com.logistics.entity.order.WltrwithorVO wltrwithorVO)
    {
        // @todo verify behavior of wltrwithorVOToEntity
        com.logistics.entity.order.Wltrwithor entity = this.loadWltrwithorFromWltrwithorVO(wltrwithorVO);
        this.wltrwithorVOToEntity(wltrwithorVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.order.WltrwithorDao#wltrwithorVOToEntity(com.logistics.entity.order.WltrwithorVO, com.logistics.entity.order.Wltrwithor)
     */
    public void wltrwithorVOToEntity(
        com.logistics.entity.order.WltrwithorVO source,
        com.logistics.entity.order.Wltrwithor target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wltrwithorVOToEntity
        super.wltrwithorVOToEntity(source, target, copyIfNull);
        if(source.getOrderRow()!=null)target.setOrderRow(this.getWlOrderRowDao().load(source.getOrderRow().getId()));
        if(source.getTaskRow()!=null)target.setTaskRow(this.getWlTaskRowDao().load(source.getTaskRow().getId()));
        target.setCarryBoxNum(source.getCarryBoxNum().getUpNumber());
        target.setFactBoxNum(source.getFactBoxNum().getUpNumber());
        target.setFactCubage(source.getFactCubage().getUpNumber());
        target.setFactNum(source.getFactNum().getUpNumber());
        target.setFactWeight(source.getFactWeight().getUpNumber());
        target.setLoadCubage(source.getLoadCubage().getUpNumber());
        target.setLoadNum(source.getLoadNum().getUpNumber());
        target.setLoadWeight(source.getLoadWeight().getUpNumber());
        target.setPlanFee(source.getPlanFee().getUpNumber());
        
    }

}