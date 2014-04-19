// license-header java merge-point
package com.demo.service.order;

/**
 * Web service delegator for {@link com.demo.service.order.carManageService}.
 *
 * @see com.demo.service.order.carManageService
 */
public class carManageServiceWSDelegator
{

    /**
     * Gets an instance of {@link com.demo.service.order.carManageService}
     */
    private final com.demo.service.order.carManageService getcarManageService()
    {
        return com.demo.ServiceLocator.instance().getcarManageService();
    }

    /**
     * @see com.demo.service.order.carManageService#createcar(com.demo.entity.order.carVO)
     */
    public long createcar(com.demo.entity.order.carVO car)
    {
        try
        {
            return getcarManageService().createcar(car);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.order.carManageService#updatecar(com.demo.entity.order.carVO)
     */
    public void updatecar(com.demo.entity.order.carVO car)
    {
        try
        {
            getcarManageService().updatecar(car);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.order.carManageService#deletecar(long)
     */
    public void deletecar(long id)
    {
        try
        {
            getcarManageService().deletecar(id);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.order.carManageService#getcar(com.demo.entity.order.carVO, int, int, java.lang.String)
     */
    public com.demo.entity.order.carVO[] getcar(com.demo.entity.order.carVO car, int pageNumber, int pageSize, java.lang.String orderBy)
    {
        try
        {
            return getcarManageService().getcar(car, pageNumber, pageSize, orderBy);
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