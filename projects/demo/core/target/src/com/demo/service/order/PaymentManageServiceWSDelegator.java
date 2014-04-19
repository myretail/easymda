// license-header java merge-point
package com.demo.service.order;

/**
 * Web service delegator for {@link com.demo.service.order.PaymentManageService}.
 *
 * @see com.demo.service.order.PaymentManageService
 */
public class PaymentManageServiceWSDelegator
{

    /**
     * Gets an instance of {@link com.demo.service.order.PaymentManageService}
     */
    private final com.demo.service.order.PaymentManageService getPaymentManageService()
    {
        return com.demo.ServiceLocator.instance().getPaymentManageService();
    }

    /**
     * @see com.demo.service.order.PaymentManageService#createPayment(com.demo.entity.order.PaymentVO)
     */
    public long createPayment(com.demo.entity.order.PaymentVO Payment)
    {
        try
        {
            return getPaymentManageService().createPayment(Payment);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.order.PaymentManageService#updatePayment(com.demo.entity.order.PaymentVO)
     */
    public void updatePayment(com.demo.entity.order.PaymentVO Payment)
    {
        try
        {
            getPaymentManageService().updatePayment(Payment);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.order.PaymentManageService#deletePayment(long)
     */
    public void deletePayment(long id)
    {
        try
        {
            getPaymentManageService().deletePayment(id);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.order.PaymentManageService#getPayment(com.demo.entity.order.PaymentVO, int, int, java.lang.String)
     */
    public com.demo.entity.order.PaymentVO[] getPayment(com.demo.entity.order.PaymentVO Payment, int pageNumber, int pageSize, java.lang.String orderBy)
    {
        try
        {
            return getPaymentManageService().getPayment(Payment, pageNumber, pageSize, orderBy);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * Finds the root cause of the parent exception
     * by traveling up the exception tree.
     */
    private static Throwable getRootCause(Throwable throwable)
    {
        if (throwable != null)
        {
            // Reflectively get any exception causes.
            try
            {
                Throwable targetException = null;

                // java.lang.reflect.InvocationTargetException
                String exceptionProperty = "targetException";
                if (org.apache.commons.beanutils.PropertyUtils.isReadable(throwable, exceptionProperty))
                {
                    targetException = (Throwable)org.apache.commons.beanutils.PropertyUtils.getProperty(throwable, exceptionProperty);
                }
                else
                {
                    exceptionProperty = "causedByException";
                    //javax.ejb.EJBException
                    if (org.apache.commons.beanutils.PropertyUtils.isReadable(throwable, exceptionProperty))
                    {
                        targetException = (Throwable)org.apache.commons.beanutils.PropertyUtils.getProperty(throwable, exceptionProperty);
                    }
                }
                if (targetException != null)
                {
                    throwable = targetException;
                }
            }
            catch (Exception exception)
            {
                // just print the exception and continue
                exception.printStackTrace();
            }
            if (throwable.getCause() != null)
            {
                throwable = throwable.getCause();
                throwable = getRootCause(throwable);
            }
        }
        return throwable;
    }
}