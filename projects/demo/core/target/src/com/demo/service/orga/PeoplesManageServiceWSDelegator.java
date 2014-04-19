// license-header java merge-point
package com.demo.service.orga;

/**
 * Web service delegator for {@link com.demo.service.orga.PeoplesManageService}.
 *
 * @see com.demo.service.orga.PeoplesManageService
 */
public class PeoplesManageServiceWSDelegator
{

    /**
     * Gets an instance of {@link com.demo.service.orga.PeoplesManageService}
     */
    private final com.demo.service.orga.PeoplesManageService getPeoplesManageService()
    {
        return com.demo.ServiceLocator.instance().getPeoplesManageService();
    }

    /**
     * @see com.demo.service.orga.PeoplesManageService#createPeoples(com.demo.entity.orga.PeoplesVO)
     */
    public long createPeoples(com.demo.entity.orga.PeoplesVO Peoples)
    {
        try
        {
            return getPeoplesManageService().createPeoples(Peoples);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.orga.PeoplesManageService#updatePeoples(com.demo.entity.orga.PeoplesVO)
     */
    public void updatePeoples(com.demo.entity.orga.PeoplesVO Peoples)
    {
        try
        {
            getPeoplesManageService().updatePeoples(Peoples);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.orga.PeoplesManageService#deletePeoples(long)
     */
    public void deletePeoples(long id)
    {
        try
        {
            getPeoplesManageService().deletePeoples(id);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.orga.PeoplesManageService#getPeoples(com.demo.entity.orga.PeoplesVO, int, int, java.lang.String)
     */
    public com.demo.entity.orga.PeoplesVO[] getPeoples(com.demo.entity.orga.PeoplesVO Peoples, int pageNumber, int pageSize, java.lang.String orderBy)
    {
        try
        {
            return getPeoplesManageService().getPeoples(Peoples, pageNumber, pageSize, orderBy);
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