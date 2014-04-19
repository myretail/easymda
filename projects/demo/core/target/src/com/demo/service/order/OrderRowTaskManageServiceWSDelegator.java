// license-header java merge-point
package com.demo.service.order;

/**
 * Web service delegator for {@link com.demo.service.order.OrderRowTaskManageService}.
 *
 * @see com.demo.service.order.OrderRowTaskManageService
 */
public class OrderRowTaskManageServiceWSDelegator
{

    /**
     * Gets an instance of {@link com.demo.service.order.OrderRowTaskManageService}
     */
    private final com.demo.service.order.OrderRowTaskManageService getOrderRowTaskManageService()
    {
        return com.demo.ServiceLocator.instance().getOrderRowTaskManageService();
    }

    /**
     * @see com.demo.service.order.OrderRowTaskManageService#createOrderRowTask(com.demo.entity.order.OrderRowTaskVO)
     */
    public long createOrderRowTask(com.demo.entity.order.OrderRowTaskVO OrderRowTask)
    {
        try
        {
            return getOrderRowTaskManageService().createOrderRowTask(OrderRowTask);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.order.OrderRowTaskManageService#updateOrderRowTask(com.demo.entity.order.OrderRowTaskVO)
     */
    public void updateOrderRowTask(com.demo.entity.order.OrderRowTaskVO OrderRowTask)
    {
        try
        {
            getOrderRowTaskManageService().updateOrderRowTask(OrderRowTask);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.order.OrderRowTaskManageService#deleteOrderRowTask(long)
     */
    public void deleteOrderRowTask(long id)
    {
        try
        {
            getOrderRowTaskManageService().deleteOrderRowTask(id);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.order.OrderRowTaskManageService#getOrderRowTask(com.demo.entity.order.OrderRowTaskVO, int, int, java.lang.String)
     */
    public com.demo.entity.order.OrderRowTaskVO[] getOrderRowTask(com.demo.entity.order.OrderRowTaskVO OrderRowTask, int pageNumber, int pageSize, java.lang.String orderBy)
    {
        try
        {
            return getOrderRowTaskManageService().getOrderRowTask(OrderRowTask, pageNumber, pageSize, orderBy);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.order.OrderRowTaskManageService#getOrderRowdByTaskId(long)
     */
    public com.demo.entity.order.OrderRowdVO[] getOrderRowdByTaskId(long TaskId)
    {
        try
        {
            return getOrderRowTaskManageService().getOrderRowdByTaskId(TaskId);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.order.OrderRowTaskManageService#getTaskByOrderRowdId(long)
     */
    public com.demo.entity.order.TaskVO[] getTaskByOrderRowdId(long OrderRowdId)
    {
        try
        {
            return getOrderRowTaskManageService().getTaskByOrderRowdId(OrderRowdId);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.order.OrderRowTaskManageService#getTaskFormByOrderRowdId(long)
     */
    public com.demo.entity.order.TaskFormVO[] getTaskFormByOrderRowdId(long OrderRowdId)
    {
        try
        {
            return getOrderRowTaskManageService().getTaskFormByOrderRowdId(OrderRowdId);
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