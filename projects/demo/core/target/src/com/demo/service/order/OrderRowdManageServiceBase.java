// license-header java merge-point
//
// Attention: Generated code! Do not modify by hand!
// Generated by: SpringServiceBase.vsl in andromda-spring-cartridge.
//
package com.demo.service.order;

/**
 * <p>
 * Spring Service base class for <code>com.demo.service.order.OrderRowdManageService</code>,
 * provides access to all services and entities referenced by this service.
 * </p>
 *
 * @see com.demo.service.order.OrderRowdManageService
 */
public abstract class OrderRowdManageServiceBase
    implements com.demo.service.order.OrderRowdManageService
{

    private com.demo.entity.order.OrderRowdDao orderRowdDao;

    /**
     * Sets the reference to <code>orderRowd</code>'s DAO.
     */
    public void setOrderRowdDao(com.demo.entity.order.OrderRowdDao orderRowdDao)
    {
        this.orderRowdDao = orderRowdDao;
    }

    /**
     * Gets the reference to <code>orderRowd</code>'s DAO.
     */
    protected com.demo.entity.order.OrderRowdDao getOrderRowdDao()
    {
        return this.orderRowdDao;
    }

    /**
     * @see com.demo.service.order.OrderRowdManageService#createOrderRowd(com.demo.entity.order.OrderRowdVO)
     */
    public long createOrderRowd(final com.demo.entity.order.OrderRowdVO OrderRowd)
    {
        if (OrderRowd == null)
        {
            throw new IllegalArgumentException(
                "com.demo.service.order.OrderRowdManageService.createOrderRowd(com.demo.entity.order.OrderRowdVO OrderRowd) - 'OrderRowd' can not be null");
        }
        try
        {
            return this.handleCreateOrderRowd(OrderRowd);
        }
        catch (Throwable th)
        {
            throw new com.demo.service.order.OrderRowdManageServiceException(
                "Error performing 'com.demo.service.order.OrderRowdManageService.createOrderRowd(com.demo.entity.order.OrderRowdVO OrderRowd)' --> " + th,
                th);
        }
    }

     /**
      * Performs the core logic for {@link #createOrderRowd(com.demo.entity.order.OrderRowdVO)}
      */
    protected abstract long handleCreateOrderRowd(com.demo.entity.order.OrderRowdVO OrderRowd)
        throws java.lang.Exception;

    /**
     * @see com.demo.service.order.OrderRowdManageService#updateOrderRowd(com.demo.entity.order.OrderRowdVO)
     */
    public void updateOrderRowd(final com.demo.entity.order.OrderRowdVO OrderRowd)
    {
        if (OrderRowd == null)
        {
            throw new IllegalArgumentException(
                "com.demo.service.order.OrderRowdManageService.updateOrderRowd(com.demo.entity.order.OrderRowdVO OrderRowd) - 'OrderRowd' can not be null");
        }
        try
        {
            this.handleUpdateOrderRowd(OrderRowd);
        }
        catch (Throwable th)
        {
            throw new com.demo.service.order.OrderRowdManageServiceException(
                "Error performing 'com.demo.service.order.OrderRowdManageService.updateOrderRowd(com.demo.entity.order.OrderRowdVO OrderRowd)' --> " + th,
                th);
        }
    }

     /**
      * Performs the core logic for {@link #updateOrderRowd(com.demo.entity.order.OrderRowdVO)}
      */
    protected abstract void handleUpdateOrderRowd(com.demo.entity.order.OrderRowdVO OrderRowd)
        throws java.lang.Exception;

    /**
     * @see com.demo.service.order.OrderRowdManageService#deleteOrderRowd(long)
     */
    public void deleteOrderRowd(final long id)
    {
        try
        {
            this.handleDeleteOrderRowd(id);
        }
        catch (Throwable th)
        {
            throw new com.demo.service.order.OrderRowdManageServiceException(
                "Error performing 'com.demo.service.order.OrderRowdManageService.deleteOrderRowd(long id)' --> " + th,
                th);
        }
    }

     /**
      * Performs the core logic for {@link #deleteOrderRowd(long)}
      */
    protected abstract void handleDeleteOrderRowd(long id)
        throws java.lang.Exception;

    /**
     * @see com.demo.service.order.OrderRowdManageService#getOrderRowd(com.demo.entity.order.OrderRowdVO, int, int, java.lang.String)
     */
    public com.demo.entity.order.OrderRowdVO[] getOrderRowd(final com.demo.entity.order.OrderRowdVO OrderRowd, final int pageNumber, final int pageSize, final java.lang.String orderBy)
    {
        if (OrderRowd == null)
        {
            throw new IllegalArgumentException(
                "com.demo.service.order.OrderRowdManageService.getOrderRowd(com.demo.entity.order.OrderRowdVO OrderRowd, int pageNumber, int pageSize, java.lang.String orderBy) - 'OrderRowd' can not be null");
        }
        if (orderBy == null)
        {
            throw new IllegalArgumentException(
                "com.demo.service.order.OrderRowdManageService.getOrderRowd(com.demo.entity.order.OrderRowdVO OrderRowd, int pageNumber, int pageSize, java.lang.String orderBy) - 'orderBy' can not be null");
        }
        try
        {
            return this.handleGetOrderRowd(OrderRowd, pageNumber, pageSize, orderBy);
        }
        catch (Throwable th)
        {
            throw new com.demo.service.order.OrderRowdManageServiceException(
                "Error performing 'com.demo.service.order.OrderRowdManageService.getOrderRowd(com.demo.entity.order.OrderRowdVO OrderRowd, int pageNumber, int pageSize, java.lang.String orderBy)' --> " + th,
                th);
        }
    }

     /**
      * Performs the core logic for {@link #getOrderRowd(com.demo.entity.order.OrderRowdVO, int, int, java.lang.String)}
      */
    protected abstract com.demo.entity.order.OrderRowdVO[] handleGetOrderRowd(com.demo.entity.order.OrderRowdVO OrderRowd, int pageNumber, int pageSize, java.lang.String orderBy)
        throws java.lang.Exception;

    /**
     * Gets the current <code>principal</code> if one has been set,
     * otherwise returns <code>null</code>.
     *
     * @return the current principal
     */
    protected java.security.Principal getPrincipal()
    {
        return com.demo.PrincipalStore.get();
    }

    /**
     * Adds an attachment in the webservice's outgoing response message (this only makes sense
     * when the operation this is called within is a web service exposed operation).
     *
     * @param content the actual content to add as the attachment.
     * @param contentType the type of the contents
     * @param dime whether or not DIME should be used (instead of MIME).
     */
    protected void addOutgoingWebServiceAttachment(final Object content, final String contentType, boolean dime)
        throws java.lang.Exception
    {
        com.demo.AttachmentHandler.saveAttachment(content, contentType, dime);
    }

    /**
     * Retrieves any incoming attachments in the webservice's request message (this only makes sense
     * when the operation this is called within is a web service exposed operation).
     */
    protected javax.activation.DataHandler[] getIncomingWebServiceAttachments()
        throws java.lang.Exception
    {
        return com.demo.AttachmentHandler.getAttachments();
    }

    /**
     * Gets the message source available to this service.
     */
    protected org.springframework.context.MessageSource getMessages()
    {
        return (org.springframework.context.MessageSource)
            com.demo.BeanLocator.instance().getBean("messageSource");
    }

    /**
     * Gets the message having the given <code>key</code> in the underlying message bundle.
     *
     * @param key the key of the message in the messages.properties message bundle.
     */
    protected String getMessage(final String key)
    {
        return this.getMessages().getMessage(key, null, null);
    }

    /**
     * Gets the message having the given <code>key</code> and <code>arguments</code> in the
     * underlying message bundle.
     *
     * @param key the key of the message in the messages.properties message bundle.
     * @param arguments any arguments to substitute when resolving the message.
     */
    protected String getMessage(final String key, final Object[] arguments)
    {
        return this.getMessages().getMessage(key, arguments, null);
    }

    /**
     * Gets the message having the given <code>key</code> using the given <code>arguments</code>
     * for the given <code>locale</code>.
     *
     * @param key the key of the message in the messages.properties message bundle.
     * @param arguments any arguments to substitute when resolving the message.
     * @param locale the locale of the messages to retrieve.
     */
    protected String getMessage(
        final java.lang.String key, final java.lang.Object[] arguments,
        final java.util.Locale locale)
    {
        return this.getMessages().getMessage(key, arguments, locale);
    }

}