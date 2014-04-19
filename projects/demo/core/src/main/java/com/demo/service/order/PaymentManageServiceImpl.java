// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.demo.service.order;
			import com.demo.entity.order.Payment;
		import com.demo.entity.order.PaymentDao;
		import com.demo.entity.order.PaymentVO;
				
import java.util.Collection;
import java.util.Random;
import java.util.List;

/**
 * @see com.demo.service.order.PaymentManageService
 */
public class PaymentManageServiceImpl
    extends com.demo.service.order.PaymentManageServiceBase
{

    /**
     * @see com.demo.service.order.PaymentManageService#createPayment(com.demo.entity.order.PaymentVO)
     */
    protected long handleCreatePayment(com.demo.entity.order.PaymentVO Payment)
		throws java.lang.Exception
    {
        // @todo implement public long createPayment(com.demo.entity.order.PaymentVO Payment) createPayment
			return this.getPaymentDao().create(this.getPaymentDao().paymentVOToEntity(Payment)).getId();
	    }
	
    /**
     * @see com.demo.service.order.PaymentManageService#updatePayment(com.demo.entity.order.PaymentVO)
     */
    protected void handleUpdatePayment(com.demo.entity.order.PaymentVO Payment)
		throws java.lang.Exception
    {
        // @todo implement public void updatePayment(com.demo.entity.order.PaymentVO Payment) updatePayment
			Payment entity =this.getPaymentDao().load(Payment.getId());
    	this.getPaymentDao().paymentVOToEntity(Payment, entity, false);
    	this.getPaymentDao().update(entity);
		
	    }
	
    /**
     * @see com.demo.service.order.PaymentManageService#deletePayment(long)
     */
    protected void handleDeletePayment(long id)
		throws java.lang.Exception
    {
        // @todo implement public void deletePayment(long id) deletePayment
			this.getPaymentDao().remove(id);
	    }
	
    /**
     * @see com.demo.service.order.PaymentManageService#getPayment(com.demo.entity.order.PaymentVO, int, int, java.lang.String)
     */
    protected com.demo.entity.order.PaymentVO[] handleGetPayment(com.demo.entity.order.PaymentVO Payment, int pageNumber, int pageSize, java.lang.String orderBy)
		throws java.lang.Exception
    {
        // @todo implement public com.demo.entity.order.PaymentVO[] getPayment(com.demo.entity.order.PaymentVO Payment, int pageNumber, int pageSize, java.lang.String orderBy) getPayment
			PaymentDao infoDao=this.getPaymentDao();
	 	Collection infos = infoDao.getPayment(Payment, pageNumber, pageSize, orderBy);
	 	return infoDao.toPaymentVOArray(infos);
	    }
	
}
