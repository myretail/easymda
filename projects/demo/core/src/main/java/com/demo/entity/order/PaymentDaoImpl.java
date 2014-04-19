// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */

package com.demo.entity.order;

import com.demo.entity.basic.NumberQuery;
import com.demo.entity.basic.DateTimeQuery;
//import com.demo.entity.util.ProjectUtil;
//import com.demo.entity.util.QueryAssCriteria;
import com.demo.util.ProjectUtil;
import com.demo.util.QueryAssCriteria;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;
/**
 * @see com.demo.entity.order.Payment
 */
public class PaymentDaoImpl
    extends com.demo.entity.order.PaymentDaoBase
{
    /**
     * @see com.demo.entity.order.PaymentDao#getPayment(com.demo.entity.order.PaymentVO, int, int, java.lang.String)
     */
    protected java.util.List handleGetPayment(com.demo.entity.order.PaymentVO Payment, int pageNumber, int pageSize, java.lang.String orderBy)
    {
        // @todo implement public java.util.List handleGetPayment(com.demo.entity.order.PaymentVO Payment, int pageNumber, int pageSize, java.lang.String orderBy)
        final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.order.PaymentImpl.class);
            if (Payment != null) QueryAssCriteria.getPaymentCriteria(Payment,criteria);
            
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount()).uniqueResult()).intValue();
      
		      criteria.setProjection(null);  
		      Payment or=new com.demo.entity.order.PaymentImpl();
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
     * @see com.demo.entity.order.PaymentDao#toPaymentVO(com.demo.entity.order.Payment, com.demo.entity.order.PaymentVO)
     */
    public void toPaymentVO(
        com.demo.entity.order.Payment source,
        com.demo.entity.order.PaymentVO target)
    {
        // @todo verify behavior of toPaymentVO
        super.toPaymentVO(source, target);
        // WARNING! No conversion for target.payment (can't convert source.getPayment():com.demo.entity.order.OrderRowd to com.demo.entity.order.OrderRowdVO
						if(source.getPayment()!=null)target.setPayment(this.getOrderRowdDao().toOrderRowdVO(source.getPayment()));
			    }


    /**
     * @see com.demo.entity.order.PaymentDao#toPaymentVO(com.demo.entity.order.Payment)
     */
    public com.demo.entity.order.PaymentVO toPaymentVO(final com.demo.entity.order.Payment entity)
    {
        // @todo verify behavior of toPaymentVO
        return super.toPaymentVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.demo.entity.order.Payment loadPaymentFromPaymentVO(com.demo.entity.order.PaymentVO paymentVO)
    {
        // @todo implement loadPaymentFromPaymentVO
        //throw new java.lang.UnsupportedOperationException("com.demo.entity.order.loadPaymentFromPaymentVO(com.demo.entity.order.PaymentVO) not yet implemented.");

        /* A typical implementation looks like this:*/
        com.demo.entity.order.Payment payment = this.load(paymentVO.getId());
        if (payment == null)
        {
            payment = com.demo.entity.order.Payment.Factory.newInstance();
        }
        return payment;
        
    }

    
    /**
     * @see com.demo.entity.order.PaymentDao#paymentVOToEntity(com.demo.entity.order.PaymentVO)
     */
    public com.demo.entity.order.Payment paymentVOToEntity(com.demo.entity.order.PaymentVO paymentVO)
    {
        // @todo verify behavior of paymentVOToEntity
        com.demo.entity.order.Payment entity = this.loadPaymentFromPaymentVO(paymentVO);
        this.paymentVOToEntity(paymentVO, entity, true);
        return entity;
    }


    /**
     * @see com.demo.entity.order.PaymentDao#paymentVOToEntity(com.demo.entity.order.PaymentVO, com.demo.entity.order.Payment)
     */
    public void paymentVOToEntity(
        com.demo.entity.order.PaymentVO source,
        com.demo.entity.order.Payment target,
        boolean copyIfNull)
    {
        // @todo verify behavior of paymentVOToEntity
        super.paymentVOToEntity(source, target, copyIfNull);
        // No conversion for target.payment (can't convert source.getPayment():com.demo.entity.order.OrderRowdVO to com.demo.entity.order.OrderRowd
						if(source.getPayment()!=null)target.setPayment(this.getOrderRowdDao().load(source.getPayment().getId()));
			    }

}