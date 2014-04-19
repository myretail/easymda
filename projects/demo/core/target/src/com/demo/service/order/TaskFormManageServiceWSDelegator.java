// license-header java merge-point
package com.demo.service.order;

/**
 * Web service delegator for {@link com.demo.service.order.TaskFormManageService}.
 *
 * @see com.demo.service.order.TaskFormManageService
 */
public class TaskFormManageServiceWSDelegator
{

    /**
     * Gets an instance of {@link com.demo.service.order.TaskFormManageService}
     */
    private final com.demo.service.order.TaskFormManageService getTaskFormManageService()
    {
        return com.demo.ServiceLocator.instance().getTaskFormManageService();
    }

    /**
     * @see com.demo.service.order.TaskFormManageService#createTaskForm(com.demo.entity.order.TaskFormVO)
     */
    public long createTaskForm(com.demo.entity.order.TaskFormVO TaskForm)
    {
        try
        {
            return getTaskFormManageService().createTaskForm(TaskForm);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.order.TaskFormManageService#updateTaskForm(com.demo.entity.order.TaskFormVO)
     */
    public void updateTaskForm(com.demo.entity.order.TaskFormVO TaskForm)
    {
        try
        {
            getTaskFormManageService().updateTaskForm(TaskForm);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.order.TaskFormManageService#deleteTaskForm(long)
     */
    public void deleteTaskForm(long id)
    {
        try
        {
            getTaskFormManageService().deleteTaskForm(id);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.order.TaskFormManageService#getTaskForm(com.demo.entity.order.TaskFormVO, int, int, java.lang.String)
     */
    public com.demo.entity.order.TaskFormVO[] getTaskForm(com.demo.entity.order.TaskFormVO TaskForm, int pageNumber, int pageSize, java.lang.String orderBy)
    {
        try
        {
            return getTaskFormManageService().getTaskForm(TaskForm, pageNumber, pageSize, orderBy);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.order.TaskFormManageService#createTask(com.demo.entity.order.TaskVO)
     */
    public long createTask(com.demo.entity.order.TaskVO Task)
    {
        try
        {
            return getTaskFormManageService().createTask(Task);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.order.TaskFormManageService#updateTask(com.demo.entity.order.TaskVO)
     */
    public void updateTask(com.demo.entity.order.TaskVO Task)
    {
        try
        {
            getTaskFormManageService().updateTask(Task);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.order.TaskFormManageService#deleteTask(long)
     */
    public void deleteTask(long id)
    {
        try
        {
            getTaskFormManageService().deleteTask(id);
        }
        catch (Exception exception)
        {
            final Throwable cause = getRootCause(exception);
            throw new java.lang.RuntimeException(cause);
        }
    }

    /**
     * @see com.demo.service.order.TaskFormManageService#getTask(com.demo.entity.order.TaskVO, int, int, java.lang.String)
     */
    public com.demo.entity.order.TaskVO[] getTask(com.demo.entity.order.TaskVO Task, int pageNumber, int pageSize, java.lang.String orderBy)
    {
        try
        {
            return getTaskFormManageService().getTask(Task, pageNumber, pageSize, orderBy);
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