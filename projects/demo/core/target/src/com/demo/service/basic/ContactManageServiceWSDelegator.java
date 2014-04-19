// license-header java merge-point
package com.demo.service.basic;

/**
 * Web service delegator for {@link com.demo.service.basic.ContactManageService}.
 *
 * @see com.demo.service.basic.ContactManageService
 */
public class ContactManageServiceWSDelegator
{

    /**
     * Gets an instance of {@link com.demo.service.basic.ContactManageService}
     */
    private final com.demo.service.basic.ContactManageService getContactManageService()
    {
        return com.demo.ServiceLocator.instance().getContactManageService();
    }

    /**
     * @see com.demo.service.basic.ContactManageService#createContact(com.demo.entity.basic.ContactVO)
     */
    public long createContact(com.demo.entity.basic.ContactVO Contact)
    {
        try
        {
            return getContactManageService().createContact(Contact);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.basic.ContactManageService#updateContact(com.demo.entity.basic.ContactVO)
     */
    public void updateContact(com.demo.entity.basic.ContactVO Contact)
    {
        try
        {
            getContactManageService().updateContact(Contact);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.basic.ContactManageService#deleteContact(long)
     */
    public void deleteContact(long id)
    {
        try
        {
            getContactManageService().deleteContact(id);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.basic.ContactManageService#getContact(com.demo.entity.basic.ContactVO, int, int, java.lang.String)
     */
    public com.demo.entity.basic.ContactVO[] getContact(com.demo.entity.basic.ContactVO Contact, int pageNumber, int pageSize, java.lang.String orderBy)
    {
        try
        {
            return getContactManageService().getContact(Contact, pageNumber, pageSize, orderBy);
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