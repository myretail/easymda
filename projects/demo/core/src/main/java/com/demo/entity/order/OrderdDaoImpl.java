// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */

package com.demo.entity.order;

import com.demo.ServiceLocator;
import com.demo.entity.basic.NumberQuery;
import com.demo.entity.basic.DateTimeQuery;
import com.demo.entity.order.crud.OrderRowdManageableService;
//import com.demo.entity.util.ProjectUtil;
//import com.demo.entity.util.QueryAssCriteria;
import com.demo.util.ProjectUtil;
import com.demo.util.QueryAssCriteria;
import com.demo.entity.order.OrderRowd;
import com.demo.entity.order.OrderRowdVO;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;
/**
 * @see com.demo.entity.order.Orderd
 */
public class OrderdDaoImpl
    extends com.demo.entity.order.OrderdDaoBase
{
    /**
     * @see com.demo.entity.order.OrderdDao#getOrderd(com.demo.entity.order.OrderdVO, int, int, java.lang.String)
     */
    protected java.util.List handleGetOrderd(com.demo.entity.order.OrderdVO Orderdvo, int pageNumber, int pageSize, java.lang.String orderBy)
    {
        // @todo implement public java.util.List handleGetOrderd(com.demo.entity.order.OrderdVO Orderd, int pageNumber, int pageSize, java.lang.String orderBy)
        final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.order.OrderdImpl.class);
           // if (Orderdvo != null)System.out.println("handleGetOrder.getOrderRow::::::::::::"+Orderdvo.getOrderRow()[0]);
            if (Orderdvo != null && Orderdvo.getOrderRow() != null){
			OrderRowdVO ds = (OrderRowdVO)Orderdvo.getOrderRow()[0];
			System.out.println("handleGetOrderd.getOrderRow.getProduct::::::::::::"+ds.toString());
			}
            if (Orderdvo != null) QueryAssCriteria.getOrderdCriteria(Orderdvo,criteria);
            
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount()).uniqueResult()).intValue();
      
		      criteria.setProjection(null);  
		      Orderd or=new com.demo.entity.order.OrderdImpl();
		     or.setId(new Long(totalCount));
		     //or.setRemark(new Integer(totalCount).toString());
		     if (pageNumber > 0 && pageSize > 0)
		     {
		     	criteria.setFirstResult(this.calculateFirstResult(pageNumber, pageSize));
		     	criteria.setMaxResults(pageSize);
		     }else{
		     	criteria.setMaxResults(100);
		     }
		     java.util.List re = criteria.list();
		     re.add(or);
		     return re;
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }

        

}

    /**
     * @see com.demo.entity.order.OrderdDao#deleteOrderd(long)
     */
    protected void handleDeleteOrderd(long id)
    {
    	final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.order.OrderRowdImpl.class);
            if(id!=0)
            criteria.createCriteria("order").add(Expression.eq("id", new java.lang.Long(id)));
            criteria.setMaxResults(250);
            List orderRows=criteria.list();
            OrderRowdManageableService srv = ServiceLocator.instance().getOrderRowdManageableService(); 
            Long[] ids=new Long[250];
            for(int i=0;i<orderRows.size();i++){
            	OrderRowd rowDao=(OrderRowd)orderRows.get(i);
            	ids[i]=rowDao.getId();
            }
            srv.delete(ids);
            //this.getWlOrderRowDao().remove(orderRows);
            this.remove(id);
            
        }
        catch (org.hibernate.HibernateException ex)
        {
        	//session.c
            throw super.convertHibernateAccessException(ex);
        } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

}

//end foreach
    /**
     * @see com.demo.entity.order.OrderdDao#toOrderdVO(com.demo.entity.order.Orderd, com.demo.entity.order.OrderdVO)
     */
    public void toOrderdVO(
        com.demo.entity.order.Orderd source,
        com.demo.entity.order.OrderdVO target)
    {
        // @todo verify behavior of toOrderdVO
        super.toOrderdVO(source, target);
        // WARNING! No conversion for target.referTime (can't convert source.getReferTime():java.util.Date to com.demo.entity.basic.DateTimeQuery
			DateTimeQuery referTimeday=new DateTimeQuery();
        referTimeday.setUpDate(ProjectUtil.getFullDateStr(source.getReferTime()));
        target.setReferTime(referTimeday);
	        // WARNING! No conversion for target.bookTime (can't convert source.getBookTime():java.util.Date to com.demo.entity.basic.DateTimeQuery
			DateTimeQuery bookTimeday=new DateTimeQuery();
        bookTimeday.setUpDate(ProjectUtil.getFullDateStr(source.getBookTime()));
        target.setBookTime(bookTimeday);
	        // WARNING! No conversion for target.completeTime (can't convert source.getCompleteTime():java.util.Date to com.demo.entity.basic.DateTimeQuery
			DateTimeQuery completeTimeday=new DateTimeQuery();
        completeTimeday.setUpDate(ProjectUtil.getFullDateStr(source.getCompleteTime()));
        target.setCompleteTime(completeTimeday);
	        // WARNING! No conversion for target.orderRow (can't convert source.getOrderRow():com.demo.entity.order.OrderRowd to com.demo.entity.order.OrderRowdVO[]
						target.setOrderRow(source.getOrderRow() == null ? null :this.getOrderRowdDao().toOrderRowdVOArray(source.getOrderRow()));
			        // WARNING! No conversion for target.customer (can't convert source.getCustomer():com.demo.entity.basic.Customer to com.demo.entity.basic.CustomerVO
						if(source.getCustomer()!=null)target.setCustomer(this.getCustomerDao().toCustomerVO(source.getCustomer()));
			    }


    /**
     * @see com.demo.entity.order.OrderdDao#toOrderdVO(com.demo.entity.order.Orderd)
     */
    public com.demo.entity.order.OrderdVO toOrderdVO(final com.demo.entity.order.Orderd entity)
    {
        // @todo verify behavior of toOrderdVO
        return super.toOrderdVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.demo.entity.order.Orderd loadOrderdFromOrderdVO(com.demo.entity.order.OrderdVO orderdVO)
    {
        // @todo implement loadOrderdFromOrderdVO
        //throw new java.lang.UnsupportedOperationException("com.demo.entity.order.loadOrderdFromOrderdVO(com.demo.entity.order.OrderdVO) not yet implemented.");

        /* A typical implementation looks like this:*/
        com.demo.entity.order.Orderd orderd = this.load(orderdVO.getId());
        if (orderd == null)
        {
            orderd = com.demo.entity.order.Orderd.Factory.newInstance();
        }
        return orderd;
        
    }

    
    /**
     * @see com.demo.entity.order.OrderdDao#orderdVOToEntity(com.demo.entity.order.OrderdVO)
     */
    public com.demo.entity.order.Orderd orderdVOToEntity(com.demo.entity.order.OrderdVO orderdVO)
    {
        // @todo verify behavior of orderdVOToEntity
        com.demo.entity.order.Orderd entity = this.loadOrderdFromOrderdVO(orderdVO);
        this.orderdVOToEntity(orderdVO, entity, true);
        return entity;
    }


    /**
     * @see com.demo.entity.order.OrderdDao#orderdVOToEntity(com.demo.entity.order.OrderdVO, com.demo.entity.order.Orderd)
     */
    public void orderdVOToEntity(
        com.demo.entity.order.OrderdVO source,
        com.demo.entity.order.Orderd target,
        boolean copyIfNull)
    {
        // @todo verify behavior of orderdVOToEntity
        super.orderdVOToEntity(source, target, copyIfNull);
        // No conversion for target.referTime (can't convert source.getReferTime():com.demo.entity.basic.DateTimeQuery to java.util.Date
			if(source.getReferTime()!=null)target.setReferTime(ProjectUtil.getDate(source.getReferTime().getUpDate()));
	        // No conversion for target.bookTime (can't convert source.getBookTime():com.demo.entity.basic.DateTimeQuery to java.util.Date
			if(source.getBookTime()!=null)target.setBookTime(ProjectUtil.getDate(source.getBookTime().getUpDate()));
	        // No conversion for target.completeTime (can't convert source.getCompleteTime():com.demo.entity.basic.DateTimeQuery to java.util.Date
			if(source.getCompleteTime()!=null)target.setCompleteTime(ProjectUtil.getDate(source.getCompleteTime().getUpDate()));
	        // No conversion for target.orderRow (can't convert source.getOrderRow():com.demo.entity.order.OrderRowdVO[] to com.demo.entity.order.OrderRowd
						//if(source.getOrderRow()!=null)target.setOrderRow(this.getOrderRowdDao().load(source.getOrderRow().getId()));
			        // No conversion for target.customer (can't convert source.getCustomer():com.demo.entity.basic.CustomerVO to com.demo.entity.basic.Customer
						if(source.getCustomer()!=null)target.setCustomer(this.getCustomerDao().load(source.getCustomer().getId()));
			    }

}