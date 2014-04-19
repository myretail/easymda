// license-header java merge-point
package com.demo.service.order;

/**
 * Web service delegator for {@link com.demo.service.order.OrderdManageService}.
 *
 * @see com.demo.service.order.OrderdManageService
 */
public class OrderdManageServiceWSDelegator
{

    /**
     * Gets an instance of {@link com.demo.service.order.OrderdManageService}
     */
    private final com.demo.service.order.OrderdManageService getOrderdManageService()
    {
        return com.demo.ServiceLocator.instance().getOrderdManageService();
    }

    /**
     * @see com.demo.service.order.OrderdManageService#createOrderd(com.demo.entity.order.OrderdVO)
     */
    public long createOrderd(com.demo.entity.order.OrderdVO Orderd)
    {
        try
        {
            return getOrderdManageService().createOrderd(Orderd);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.order.OrderdManageService#updateOrderd(com.demo.entity.order.OrderdVO)
     */
    public void updateOrderd(com.demo.entity.order.OrderdVO Orderd)
    {
        try
        {
            getOrderdManageService().updateOrderd(Orderd);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.order.OrderdManageService#deleteOrderd(long)
     */
    public void deleteOrderd(long id)
    {
        try
        {
            getOrderdManageService().deleteOrderd(id);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.order.OrderdManageService#getOrderd(com.demo.entity.order.OrderdVO, int, int, java.lang.String)
     */
    public com.demo.entity.order.OrderdVO[] getOrderd(com.demo.entity.order.OrderdVO Orderd, int pageNumber, int pageSize, java.lang.String orderBy)
    {
        try
        {
            return getOrderdManageService().getOrderd(Orderd, pageNumber, pageSize, orderBy);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.order.OrderdManageService#createOrderRowd(com.demo.entity.order.OrderRowdVO)
     */
    public long createOrderRowd(com.demo.entity.order.OrderRowdVO OrderRowd)
    {
        try
        {
            return getOrderdManageService().createOrderRowd(OrderRowd);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.order.OrderdManageService#updateOrderRowd(com.demo.entity.order.OrderRowdVO)
     */
    public void updateOrderRowd(com.demo.entity.order.OrderRowdVO OrderRowd)
    {
        try
        {
            getOrderdManageService().updateOrderRowd(OrderRowd);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.order.OrderdManageService#deleteOrderRowd(long)
     */
    public void deleteOrderRowd(long id)
    {
        try
        {
            getOrderdManageService().deleteOrderRowd(id);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.order.OrderdManageService#getOrderRowd(com.demo.entity.order.OrderRowdVO, int, int, java.lang.String)
     */
    public com.demo.entity.order.OrderRowdVO[] getOrderRowd(com.demo.entity.order.OrderRowdVO OrderRowd, int pageNumber, int pageSize, java.lang.String orderBy)
    {
        try
        {
            return getOrderdManageService().getOrderRowd(OrderRowd, pageNumber, pageSize, orderBy);
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