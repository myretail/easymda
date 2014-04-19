// license-header java merge-point
package com.demo.service.basic;

/**
 * Web service delegator for {@link com.demo.service.basic.BasicManageService}.
 *
 * @see com.demo.service.basic.BasicManageService
 */
public class BasicManageServiceWSDelegator
{

    /**
     * Gets an instance of {@link com.demo.service.basic.BasicManageService}
     */
    private final com.demo.service.basic.BasicManageService getBasicManageService()
    {
        return com.demo.ServiceLocator.instance().getBasicManageService();
    }

    /**
     * @see com.demo.service.basic.BasicManageService#createEnumeration(com.demo.entity.basic.EnumerationVO)
     */
    public long createEnumeration(com.demo.entity.basic.EnumerationVO Enumeration)
    {
        try
        {
            return getBasicManageService().createEnumeration(Enumeration);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.basic.BasicManageService#updateEnumeration(com.demo.entity.basic.EnumerationVO)
     */
    public void updateEnumeration(com.demo.entity.basic.EnumerationVO Enumeration)
    {
        try
        {
            getBasicManageService().updateEnumeration(Enumeration);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.basic.BasicManageService#deleteEnumeration(long)
     */
    public void deleteEnumeration(long id)
    {
        try
        {
            getBasicManageService().deleteEnumeration(id);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.basic.BasicManageService#getEnumeration(com.demo.entity.basic.EnumerationVO, int, int, java.lang.String)
     */
    public com.demo.entity.basic.EnumerationVO[] getEnumeration(com.demo.entity.basic.EnumerationVO Enumeration, int pageNumber, int pageSize, java.lang.String orderBy)
    {
        try
        {
            return getBasicManageService().getEnumeration(Enumeration, pageNumber, pageSize, orderBy);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.basic.BasicManageService#getEnumerationByType(java.lang.String)
     */
    public com.demo.entity.basic.EnumerationVO[] getEnumerationByType(java.lang.String eType)
    {
        try
        {
            return getBasicManageService().getEnumerationByType(eType);
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