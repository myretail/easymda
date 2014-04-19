// license-header java merge-point
//
// Attention: Generated code! Do not modify by hand!
// Generated by: DefaultServiceException.vsl in andromda-spring-cartridge.
//
package com.demo.service.basic;

import org.apache.commons.beanutils.PropertyUtils;

/**
 * The default exception thrown for unexpected errors occurring
 * within {@link com.demo.service.basic.BasicManageService}.
 */
public class BasicManageServiceException
    extends java.lang.RuntimeException
{
    /** 
     * The serial version UID of this class. Needed for serialization. 
     */
    private static final long serialVersionUID = 4132618223360932495L;

    /**
     * The default constructor for <code>BasicManageServiceException</code>.
     */
    public BasicManageServiceException()
    {}

    /**
     * Constructs a new instance of <code>BasicManageServiceException</code>.
     *
     * @param throwable the parent Throwable
     */
    public BasicManageServiceException(Throwable throwable)
    {
        super(findRootCause(throwable));
    }

    /**
     * Constructs a new instance of <code>BasicManageServiceException</code>.
     *
     * @param message the throwable message.
     */
    public BasicManageServiceException(String message)
    {
        super(message);
    }

    /**
     * Constructs a new instance of <code>BasicManageServiceException</code>.
     *
     * @param message the throwable message.
     * @param throwable the parent of this Throwable.
     */
    public BasicManageServiceException(String message, Throwable throwable)
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