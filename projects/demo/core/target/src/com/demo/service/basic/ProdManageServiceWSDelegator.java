// license-header java merge-point
package com.demo.service.basic;

/**
 * Web service delegator for {@link com.demo.service.basic.ProdManageService}.
 *
 * @see com.demo.service.basic.ProdManageService
 */
public class ProdManageServiceWSDelegator
{

    /**
     * Gets an instance of {@link com.demo.service.basic.ProdManageService}
     */
    private final com.demo.service.basic.ProdManageService getProdManageService()
    {
        return com.demo.ServiceLocator.instance().getProdManageService();
    }

    /**
     * @see com.demo.service.basic.ProdManageService#createProd(com.demo.entity.basic.ProdVO)
     */
    public long createProd(com.demo.entity.basic.ProdVO Prod)
    {
        try
        {
            return getProdManageService().createProd(Prod);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.basic.ProdManageService#updateProd(com.demo.entity.basic.ProdVO)
     */
    public void updateProd(com.demo.entity.basic.ProdVO Prod)
    {
        try
        {
            getProdManageService().updateProd(Prod);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.basic.ProdManageService#deleteProd(long)
     */
    public void deleteProd(long id)
    {
        try
        {
            getProdManageService().deleteProd(id);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.basic.ProdManageService#getProd(com.demo.entity.basic.ProdVO, int, int, java.lang.String)
     */
    public com.demo.entity.basic.ProdVO[] getProd(com.demo.entity.basic.ProdVO Prod, int pageNumber, int pageSize, java.lang.String orderBy)
    {
        try
        {
            return getProdManageService().getProd(Prod, pageNumber, pageSize, orderBy);
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