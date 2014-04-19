// license-header java merge-point
package com.demo.service.orga;

/**
 * Web service delegator for {@link com.demo.service.orga.OrgaPeoplesManageService}.
 *
 * @see com.demo.service.orga.OrgaPeoplesManageService
 */
public class OrgaPeoplesManageServiceWSDelegator
{

    /**
     * Gets an instance of {@link com.demo.service.orga.OrgaPeoplesManageService}
     */
    private final com.demo.service.orga.OrgaPeoplesManageService getOrgaPeoplesManageService()
    {
        return com.demo.ServiceLocator.instance().getOrgaPeoplesManageService();
    }

    /**
     * @see com.demo.service.orga.OrgaPeoplesManageService#createOrgaPeoples(com.demo.entity.orga.OrgaPeoplesVO)
     */
    public long createOrgaPeoples(com.demo.entity.orga.OrgaPeoplesVO OrgaPeoples)
    {
        try
        {
            return getOrgaPeoplesManageService().createOrgaPeoples(OrgaPeoples);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.orga.OrgaPeoplesManageService#updateOrgaPeoples(com.demo.entity.orga.OrgaPeoplesVO)
     */
    public void updateOrgaPeoples(com.demo.entity.orga.OrgaPeoplesVO OrgaPeoples)
    {
        try
        {
            getOrgaPeoplesManageService().updateOrgaPeoples(OrgaPeoples);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.orga.OrgaPeoplesManageService#deleteOrgaPeoples(long)
     */
    public void deleteOrgaPeoples(long id)
    {
        try
        {
            getOrgaPeoplesManageService().deleteOrgaPeoples(id);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.orga.OrgaPeoplesManageService#getOrgaPeoples(com.demo.entity.orga.OrgaPeoplesVO, int, int, java.lang.String)
     */
    public com.demo.entity.orga.OrgaPeoplesVO[] getOrgaPeoples(com.demo.entity.orga.OrgaPeoplesVO OrgaPeoples, int pageNumber, int pageSize, java.lang.String orderBy)
    {
        try
        {
            return getOrgaPeoplesManageService().getOrgaPeoples(OrgaPeoples, pageNumber, pageSize, orderBy);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.orga.OrgaPeoplesManageService#getOrgaByPeoplesIdAndParentId(long, long)
     */
    public com.demo.entity.orga.OrgaVO[] getOrgaByPeoplesIdAndParentId(long PeoplesId, long parentId)
    {
        try
        {
            return getOrgaPeoplesManageService().getOrgaByPeoplesIdAndParentId(PeoplesId, parentId);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.orga.OrgaPeoplesManageService#getPeoplesByOrgaId(long)
     */
    public com.demo.entity.orga.PeoplesVO[] getPeoplesByOrgaId(long OrgaId)
    {
        try
        {
            return getOrgaPeoplesManageService().getPeoplesByOrgaId(OrgaId);
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