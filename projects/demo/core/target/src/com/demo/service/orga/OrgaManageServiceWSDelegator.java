// license-header java merge-point
package com.demo.service.orga;

/**
 * Web service delegator for {@link com.demo.service.orga.OrgaManageService}.
 *
 * @see com.demo.service.orga.OrgaManageService
 */
public class OrgaManageServiceWSDelegator
{

    /**
     * Gets an instance of {@link com.demo.service.orga.OrgaManageService}
     */
    private final com.demo.service.orga.OrgaManageService getOrgaManageService()
    {
        return com.demo.ServiceLocator.instance().getOrgaManageService();
    }

    /**
     * @see com.demo.service.orga.OrgaManageService#createOrga(com.demo.entity.orga.OrgaVO)
     */
    public long createOrga(com.demo.entity.orga.OrgaVO Orga)
    {
        try
        {
            return getOrgaManageService().createOrga(Orga);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.orga.OrgaManageService#updateOrga(com.demo.entity.orga.OrgaVO)
     */
    public void updateOrga(com.demo.entity.orga.OrgaVO Orga)
    {
        try
        {
            getOrgaManageService().updateOrga(Orga);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.orga.OrgaManageService#deleteOrga(long)
     */
    public void deleteOrga(long id)
    {
        try
        {
            getOrgaManageService().deleteOrga(id);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.orga.OrgaManageService#getOrga(com.demo.entity.orga.OrgaVO, int, int, java.lang.String)
     */
    public com.demo.entity.orga.OrgaVO[] getOrga(com.demo.entity.orga.OrgaVO Orga, int pageNumber, int pageSize, java.lang.String orderBy)
    {
        try
        {
            return getOrgaManageService().getOrga(Orga, pageNumber, pageSize, orderBy);
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