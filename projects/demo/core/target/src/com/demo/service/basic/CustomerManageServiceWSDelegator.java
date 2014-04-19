// license-header java merge-point
package com.demo.service.basic;

/**
 * Web service delegator for {@link com.demo.service.basic.CustomerManageService}.
 *
 * @see com.demo.service.basic.CustomerManageService
 */
public class CustomerManageServiceWSDelegator
{

    /**
     * Gets an instance of {@link com.demo.service.basic.CustomerManageService}
     */
    private final com.demo.service.basic.CustomerManageService getCustomerManageService()
    {
        return com.demo.ServiceLocator.instance().getCustomerManageService();
    }

    /**
     * @see com.demo.service.basic.CustomerManageService#createCustomer(com.demo.entity.basic.CustomerVO)
     */
    public long createCustomer(com.demo.entity.basic.CustomerVO Customer)
    {
        try
        {
            return getCustomerManageService().createCustomer(Customer);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.basic.CustomerManageService#updateCustomer(com.demo.entity.basic.CustomerVO)
     */
    public void updateCustomer(com.demo.entity.basic.CustomerVO Customer)
    {
        try
        {
            getCustomerManageService().updateCustomer(Customer);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.basic.CustomerManageService#deleteCustomer(long)
     */
    public void deleteCustomer(long id)
    {
        try
        {
            getCustomerManageService().deleteCustomer(id);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.basic.CustomerManageService#getCustomer(com.demo.entity.basic.CustomerVO, int, int, java.lang.String)
     */
    public com.demo.entity.basic.CustomerVO[] getCustomer(com.demo.entity.basic.CustomerVO Customer, int pageNumber, int pageSize, java.lang.String orderBy)
    {
        try
        {
            return getCustomerManageService().getCustomer(Customer, pageNumber, pageSize, orderBy);
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