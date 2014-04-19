// license-header java merge-point
//
// Attention: Generated code! Do not modify by hand!
// Generated by: SpringSessionBean.vsl in andromda-spring-cartridge.
//
package com.demo.service.basic.ejb;

/**
 * @see com.demo.service.basic.ProdManageService
 */
public class ProdManageServiceBean
    extends org.springframework.ejb.support.AbstractStatelessSessionBean
    implements com.demo.service.basic.ProdManageService
{
    private com.demo.service.basic.ProdManageService prodManageService;

    /**
     * @see com.demo.service.basic.ProdManageService#createProd(com.demo.entity.basic.ProdVO)
     */
    public long createProd(com.demo.entity.basic.ProdVO Prod)
    {

        try
        {
            return this.prodManageService.createProd(Prod);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            if (cause instanceof Exception)
            {
                throw new javax.ejb.EJBException((Exception)cause);
            }
            throw new javax.ejb.EJBException(exception);
        }
    }

    /**
     * @see com.demo.service.basic.ProdManageService#updateProd(com.demo.entity.basic.ProdVO)
     */
    public void updateProd(com.demo.entity.basic.ProdVO Prod)
    {

        try
        {
            this.prodManageService.updateProd(Prod);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            if (cause instanceof Exception)
            {
                throw new javax.ejb.EJBException((Exception)cause);
            }
            throw new javax.ejb.EJBException(exception);
        }
    }

    /**
     * @see com.demo.service.basic.ProdManageService#deleteProd(long)
     */
    public void deleteProd(long id)
    {

        try
        {
            this.prodManageService.deleteProd(id);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            if (cause instanceof Exception)
            {
                throw new javax.ejb.EJBException((Exception)cause);
            }
            throw new javax.ejb.EJBException(exception);
        }
    }

    /**
     * @see com.demo.service.basic.ProdManageService#getProd(com.demo.entity.basic.ProdVO, int, int, java.lang.String)
     */
    public com.demo.entity.basic.ProdVO[] getProd(com.demo.entity.basic.ProdVO Prod, int pageNumber, int pageSize, java.lang.String orderBy)
    {

        try
        {
            return this.prodManageService.getProd(Prod, pageNumber, pageSize, orderBy);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            if (cause instanceof Exception)
            {
                throw new javax.ejb.EJBException((Exception)cause);
            }
            throw new javax.ejb.EJBException(exception);
        }
    }

    /**
     * Every Spring Session EJB needs to
     * call this to instantiate the Spring
     * Business Object.
     *
     * @see org.springframework.ejb.support.AbstractStatelessSessionBean#onEjbCreate()
     */
    protected void onEjbCreate()
    {
        this.prodManageService = (com.demo.service.basic.ProdManageService)
            getBeanFactory().getBean("prodManageService");
    }

    /**
     * Override default BeanFactoryLocator implementation to
     * provide singleton loading of the application context Bean factory.
     *
     * @see javax.ejb.SessionBean#setSessionContext(javax.ejb.SessionContext)
     */
    public void setSessionContext(javax.ejb.SessionContext sessionContext)
    {
        super.setSessionContext(sessionContext);
        super.setBeanFactoryLocator(
            org.springframework.context.access.ContextSingletonBeanFactoryLocator.getInstance("beanRefFactory.xml"));
        super.setBeanFactoryLocatorKey("beanRefFactory");
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