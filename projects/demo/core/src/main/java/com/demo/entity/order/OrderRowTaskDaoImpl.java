// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */

package com.demo.entity.order;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;

import com.demo.util.QueryAssCriteria;
/**
 * @see com.demo.entity.order.OrderRowTask
 */
public class OrderRowTaskDaoImpl
    extends com.demo.entity.order.OrderRowTaskDaoBase
{
    /**
     * @see com.demo.entity.order.OrderRowTaskDao#getOrderRowTask(com.demo.entity.order.OrderRowTaskVO, int, int, java.lang.String)
     */
    protected java.util.List handleGetOrderRowTask(com.demo.entity.order.OrderRowTaskVO OrderRowTask, int pageNumber, int pageSize, java.lang.String orderBy)
    {
        // @todo implement public java.util.List handleGetOrderRowTask(com.demo.entity.order.OrderRowTaskVO OrderRowTask, int pageNumber, int pageSize, java.lang.String orderBy)
        final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.order.OrderRowTaskImpl.class);
            if (OrderRowTask != null) QueryAssCriteria.getOrderRowTaskCriteria(OrderRowTask,criteria);
            
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount()).uniqueResult()).intValue();
      
		      criteria.setProjection(null);  
		      OrderRowTask or=new com.demo.entity.order.OrderRowTaskImpl();
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

//end foreach
    /**
     * @see com.demo.entity.order.OrderRowTaskDao#toOrderRowTaskVO(com.demo.entity.order.OrderRowTask, com.demo.entity.order.OrderRowTaskVO)
     */
    public void toOrderRowTaskVO(
        com.demo.entity.order.OrderRowTask source,
        com.demo.entity.order.OrderRowTaskVO target)
    {
        // @todo verify behavior of toOrderRowTaskVO
        super.toOrderRowTaskVO(source, target);
        // WARNING! No conversion for target.orderRow (can't convert source.getOrderRow():com.demo.entity.order.OrderRowd to com.demo.entity.order.OrderRowdVO
						if(source.getOrderRow()!=null)target.setOrderRow(this.getOrderRowdDao().toOrderRowdVO(source.getOrderRow()));
			        // WARNING! No conversion for target.task (can't convert source.getTask():com.demo.entity.order.Task to com.demo.entity.order.TaskVO
						if(source.getTask()!=null)target.setTask(this.getTaskDao().toTaskVO(source.getTask()));
			    }


    /**
     * @see com.demo.entity.order.OrderRowTaskDao#toOrderRowTaskVO(com.demo.entity.order.OrderRowTask)
     */
    public com.demo.entity.order.OrderRowTaskVO toOrderRowTaskVO(final com.demo.entity.order.OrderRowTask entity)
    {
        // @todo verify behavior of toOrderRowTaskVO
        return super.toOrderRowTaskVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.demo.entity.order.OrderRowTask loadOrderRowTaskFromOrderRowTaskVO(com.demo.entity.order.OrderRowTaskVO orderRowTaskVO)
    {
        // @todo implement loadOrderRowTaskFromOrderRowTaskVO
        //throw new java.lang.UnsupportedOperationException("com.demo.entity.order.loadOrderRowTaskFromOrderRowTaskVO(com.demo.entity.order.OrderRowTaskVO) not yet implemented.");

        /* A typical implementation looks like this:*/
        com.demo.entity.order.OrderRowTask orderRowTask = this.load(orderRowTaskVO.getId());
        if (orderRowTask == null)
        {
            orderRowTask = com.demo.entity.order.OrderRowTask.Factory.newInstance();
        }
        return orderRowTask;
        
    }

    
    /**
     * @see com.demo.entity.order.OrderRowTaskDao#orderRowTaskVOToEntity(com.demo.entity.order.OrderRowTaskVO)
     */
    public com.demo.entity.order.OrderRowTask orderRowTaskVOToEntity(com.demo.entity.order.OrderRowTaskVO orderRowTaskVO)
    {
        // @todo verify behavior of orderRowTaskVOToEntity
        com.demo.entity.order.OrderRowTask entity = this.loadOrderRowTaskFromOrderRowTaskVO(orderRowTaskVO);
        this.orderRowTaskVOToEntity(orderRowTaskVO, entity, true);
        return entity;
    }


    /**
     * @see com.demo.entity.order.OrderRowTaskDao#orderRowTaskVOToEntity(com.demo.entity.order.OrderRowTaskVO, com.demo.entity.order.OrderRowTask)
     */
    public void orderRowTaskVOToEntity(
        com.demo.entity.order.OrderRowTaskVO source,
        com.demo.entity.order.OrderRowTask target,
        boolean copyIfNull)
    {
        // @todo verify behavior of orderRowTaskVOToEntity
        super.orderRowTaskVOToEntity(source, target, copyIfNull);
        // No conversion for target.orderRow (can't convert source.getOrderRow():com.demo.entity.order.OrderRowdVO to com.demo.entity.order.OrderRowd
						if(source.getOrderRow()!=null)target.setOrderRow(this.getOrderRowdDao().load(source.getOrderRow().getId()));
			        // No conversion for target.task (can't convert source.getTask():com.demo.entity.order.TaskVO to com.demo.entity.order.Task
						if(source.getTask()!=null)target.setTask(this.getTaskDao().load(source.getTask().getId()));
			    }

}