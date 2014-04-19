// license-header java merge-point
package com.demo.service.order;

/**
 * Web service delegator for {@link com.demo.service.order.TaskManageService}.
 *
 * @see com.demo.service.order.TaskManageService
 */
public class TaskManageServiceWSDelegator
{

    /**
     * Gets an instance of {@link com.demo.service.order.TaskManageService}
     */
    private final com.demo.service.order.TaskManageService getTaskManageService()
    {
        return com.demo.ServiceLocator.instance().getTaskManageService();
    }

    /**
     * @see com.demo.service.order.TaskManageService#createTask(com.demo.entity.order.TaskVO)
     */
    public long createTask(com.demo.entity.order.TaskVO Task)
    {
        try
        {
            return getTaskManageService().createTask(Task);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.order.TaskManageService#updateTask(com.demo.entity.order.TaskVO)
     */
    public void updateTask(com.demo.entity.order.TaskVO Task)
    {
        try
        {
            getTaskManageService().updateTask(Task);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.order.TaskManageService#deleteTask(long)
     */
    public void deleteTask(long id)
    {
        try
        {
            getTaskManageService().deleteTask(id);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.order.TaskManageService#getTask(com.demo.entity.order.TaskVO, int, int, java.lang.String)
     */
    public com.demo.entity.order.TaskVO[] getTask(com.demo.entity.order.TaskVO Task, int pageNumber, int pageSize, java.lang.String orderBy)
    {
        try
        {
            return getTaskManageService().getTask(Task, pageNumber, pageSize, orderBy);
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