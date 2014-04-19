// license-header java merge-point
//
// Attention: Generated code! Do not modify by hand!
// Generated by: DefaultServiceException.vsl in andromda-spring-cartridge.
//
package com.demo.service.order;

import org.apache.commons.beanutils.PropertyUtils;

/**
 * The default exception thrown for unexpected errors occurring
 * within {@link com.demo.service.order.carManageService}.
 */
public class carManageServiceException
    extends java.lang.RuntimeException
{
    /** 
     * The serial version UID of this class. Needed for serialization. 
     */
    private static final long serialVersionUID = 5133279920221495324L;

    /**
     * The default constructor for <code>carManageServiceException</code>.
     */
    public carManageServiceException()
    {}

    /**
     * Constructs a new instance of <code>carManageServiceException</code>.
     *
     * @param throwable the parent Throwable
     */
    public carManageServiceException(Throwable throwable)
    {
        super(findRootCause(throwable));
    }

    /**
     * Constructs a new instance of <code>carManageServiceException</code>.
     *
     * @param message the throwable message.
     */
    public carManageServiceException(String message)
    {
        super(message);
    }

    /**
     * Constructs a new instance of <code>carManageServiceException</code>.
     *
     * @param message the throwable message.
     * @param throwable the parent of this Throwable.
     */
    public carManageServiceException(String message, Throwable throwable)
    {
        super(message, findRootCause(throwable));
    }

    /**
     * Finds the root cause of the parent exception
     * by traveling up the exception tree
     */
    private static Throwable findRootCause(Throwable th)
    {
        if (th != null)
        {
            // Reflectively get any exception causes.
            try
            {
                Throwable targetException = null;

                // java.lang.reflect.InvocationTargetException
                String exceptionProperty = "targetException";
                if (PropertyUtils.isReadable(th, exceptionProperty))
                {
                    targetException = (Throwable)PropertyUtils.getProperty(th, exceptionProperty);
                }
                else
                {
                    exceptionProperty = "causedByException";
                    //javax.ejb.EJBException
                    if (PropertyUtils.isReadable(th, exceptionProperty))
                    {
                        targetException = (Throwable)PropertyUtils.getProperty(th, exceptionProperty);
                    }
                }
                if (targetException != null)
                {
                    th = targetException;
                }
            }
            catch (Exception ex)
            {
                // just print the exception and continue
                ex.printStackTrace();
            }

            if (th.getCause() != null)
            {
                th = th.getCause();
                th = findRootCause(th);
            }
        }
        return th;
    }
}