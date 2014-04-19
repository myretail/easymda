// license-header java merge-point
package com.demo.service.order;

/**
 * Web service delegator for {@link com.demo.service.order.OrderRowdManageService}.
 *
 * @see com.demo.service.order.OrderRowdManageService
 */
public class OrderRowdManageServiceWSDelegator
{

    /**
     * Gets an instance of {@link com.demo.service.order.OrderRowdManageService}
     */
    private final com.demo.service.order.OrderRowdManageService getOrderRowdManageService()
    {
        return com.demo.ServiceLocator.instance().getOrderRowdManageService();
    }

    /**
     * @see com.demo.service.order.OrderRowdManageService#createOrderRowd(com.demo.entity.order.OrderRowdVO)
     */
    public long createOrderRowd(com.demo.entity.order.OrderRowdVO OrderRowd)
    {
        try
        {
            return getOrderRowdManageService().createOrderRowd(OrderRowd);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.order.OrderRowdManageService#updateOrderRowd(com.demo.entity.order.OrderRowdVO)
     */
    public void updateOrderRowd(com.demo.entity.order.OrderRowdVO OrderRowd)
    {
        try
        {
            getOrderRowdManageService().updateOrderRowd(OrderRowd);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.order.OrderRowdManageService#deleteOrderRowd(long)
     */
    public void deleteOrderRowd(long id)
    {
        try
        {
            getOrderRowdManageService().deleteOrderRowd(id);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.order.OrderRowdManageService#getOrderRowd(com.demo.entity.order.OrderRowdVO, int, int, java.lang.String)
     */
    public com.demo.entity.order.OrderRowdVO[] getOrderRowd(com.demo.entity.order.OrderRowdVO OrderRowd, int pageNumber, int pageSize, java.lang.String orderBy)
    {
        try
        {
            return getOrderRowdManageService().getOrderRowd(OrderRowd, pageNumber, pageSize, orderBy);
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