// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.demo.service.order;
			import com.demo.entity.order.OrderRowd;
		import com.demo.entity.order.OrderRowdDao;
		import com.demo.entity.order.OrderRowdVO;
				
import java.util.Collection;
import java.util.Random;
import java.util.List;

/**
 * @see com.demo.service.order.OrderRowdManageService
 */
public class OrderRowdManageServiceImpl
    extends com.demo.service.order.OrderRowdManageServiceBase
{

    /**
     * @see com.demo.service.order.OrderRowdManageService#createOrderRowd(com.demo.entity.order.OrderRowdVO)
     */
    protected long handleCreateOrderRowd(com.demo.entity.order.OrderRowdVO OrderRowd)
		throws java.lang.Exception
    {
        // @todo implement public long createOrderRowd(com.demo.entity.order.OrderRowdVO OrderRowd) createOrderRowd
			return this.getOrderRowdDao().create(this.getOrderRowdDao().orderRowdVOToEntity(OrderRowd)).getId();
	    }
	
    /**
     * @see com.demo.service.order.OrderRowdManageService#updateOrderRowd(com.demo.entity.order.OrderRowdVO)
     */
    protected void handleUpdateOrderRowd(com.demo.entity.order.OrderRowdVO OrderRowd)
		throws java.lang.Exception
    {
        // @todo implement public void updateOrderRowd(com.demo.entity.order.OrderRowdVO OrderRowd) updateOrderRowd
			OrderRowd entity =this.getOrderRowdDao().load(OrderRowd.getId());
    	this.getOrderRowdDao().orderRowdVOToEntity(OrderRowd, entity, false);
    	this.getOrderRowdDao().update(entity);
		
	    }
	
    /**
     * @see com.demo.service.order.OrderRowdManageService#deleteOrderRowd(long)
     */
    protected void handleDeleteOrderRowd(long id)
		throws java.lang.Exception
    {
        // @todo implement public void deleteOrderRowd(long id) deleteOrderRowd
			this.getOrderRowdDao().remove(id);
	    }
	
    /**
     * @see com.demo.service.order.OrderRowdManageService#getOrderRowd(com.demo.entity.order.OrderRowdVO, int, int, java.lang.String)
     */
    protected com.demo.entity.order.OrderRowdVO[] handleGetOrderRowd(com.demo.entity.order.OrderRowdVO OrderRowd, int pageNumber, int pageSize, java.lang.String orderBy)
		throws java.lang.Exception
    {
        // @todo implement public com.demo.entity.order.OrderRowdVO[] getOrderRowd(com.demo.entity.order.OrderRowdVO OrderRowd, int pageNumber, int pageSize, java.lang.String orderBy) getOrderRowd
			OrderRowdDao infoDao=this.getOrderRowdDao();
	 	Collection infos = infoDao.getOrderRowd(OrderRowd, pageNumber, pageSize, orderBy);
	 	return infoDao.toOrderRowdVOArray(infos);
	    }
	
}
