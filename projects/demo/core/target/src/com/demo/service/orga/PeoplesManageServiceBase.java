// license-header java merge-point
//
// Attention: Generated code! Do not modify by hand!
// Generated by: SpringServiceBase.vsl in andromda-spring-cartridge.
//
package com.demo.service.orga;

/**
 * <p>
 * Spring Service base class for <code>com.demo.service.orga.PeoplesManageService</code>,
 * provides access to all services and entities referenced by this service.
 * </p>
 *
 * @see com.demo.service.orga.PeoplesManageService
 */
public abstract class PeoplesManageServiceBase
    implements com.demo.service.orga.PeoplesManageService
{

    private com.demo.entity.orga.PeoplesDao peoplesDao;

    /**
     * Sets the reference to <code>peoples</code>'s DAO.
     */
    public void setPeoplesDao(com.demo.entity.orga.PeoplesDao peoplesDao)
    {
        this.peoplesDao = peoplesDao;
    }

    /**
     * Gets the reference to <code>peoples</code>'s DAO.
     */
    protected com.demo.entity.orga.PeoplesDao getPeoplesDao()
    {
        return this.peoplesDao;
    }

    /**
     * @see com.demo.service.orga.PeoplesManageService#createPeoples(com.demo.entity.orga.PeoplesVO)
     */
    public long createPeoples(final com.demo.entity.orga.PeoplesVO Peoples)
    {
        if (Peoples == null)
        {
            throw new IllegalArgumentException(
                "com.demo.service.orga.PeoplesManageService.createPeoples(com.demo.entity.orga.PeoplesVO Peoples) - 'Peoples' can not be null");
        }
        try
        {
            return this.handleCreatePeoples(Peoples);
        }
        catch (Throwable th)
        {
            throw new com.demo.service.orga.PeoplesManageServiceException(
                "Error performing 'com.demo.service.orga.PeoplesManageService.createPeoples(com.demo.entity.orga.PeoplesVO Peoples)' --> " + th,
                th);
        }
    }

     /**
      * Performs the core logic for {@link #createPeoples(com.demo.entity.orga.PeoplesVO)}
      */
    protected abstract long handleCreatePeoples(com.demo.entity.orga.PeoplesVO Peoples)
        throws java.lang.Exception;

    /**
     * @see com.demo.service.orga.PeoplesManageService#updatePeoples(com.demo.entity.orga.PeoplesVO)
     */
    public void updatePeoples(final com.demo.entity.orga.PeoplesVO Peoples)
    {
        if (Peoples == null)
        {
            throw new IllegalArgumentException(
                "com.demo.service.orga.PeoplesManageService.updatePeoples(com.demo.entity.orga.PeoplesVO Peoples) - 'Peoples' can not be null");
        }
        try
        {
            this.handleUpdatePeoples(Peoples);
        }
        catch (Throwable th)
        {
            throw new com.demo.service.orga.PeoplesManageServiceException(
                "Error performing 'com.demo.service.orga.PeoplesManageService.updatePeoples(com.demo.entity.orga.PeoplesVO Peoples)' --> " + th,
                th);
        }
    }

     /**
      * Performs the core logic for {@link #updatePeoples(com.demo.entity.orga.PeoplesVO)}
      */
    protected abstract void handleUpdatePeoples(com.demo.entity.orga.PeoplesVO Peoples)
        throws java.lang.Exception;

    /**
     * @see com.demo.service.orga.PeoplesManageService#deletePeoples(long)
     */
    public void deletePeoples(final long id)
    {
        try
        {
            this.handleDeletePeoples(id);
        }
        catch (Throwable th)
        {
            throw new com.demo.service.orga.PeoplesManageServiceException(
                "Error performing 'com.demo.service.orga.PeoplesManageService.deletePeoples(long id)' --> " + th,
                th);
        }
    }

     /**
      * Performs the core logic for {@link #deletePeoples(long)}
      */
    protected abstract void handleDeletePeoples(long id)
        throws java.lang.Exception;

    /**
     * @see com.demo.service.orga.PeoplesManageService#getPeoples(com.demo.entity.orga.PeoplesVO, int, int, java.lang.String)
     */
    public com.demo.entity.orga.PeoplesVO[] getPeoples(final com.demo.entity.orga.PeoplesVO Peoples, final int pageNumber, final int pageSize, final java.lang.String orderBy)
    {
        if (Peoples == null)
        {
            throw new IllegalArgumentException(
                "com.demo.service.orga.PeoplesManageService.getPeoples(com.demo.entity.orga.PeoplesVO Peoples, int pageNumber, int pageSize, java.lang.String orderBy) - 'Peoples' can not be null");
        }
        if (orderBy == null)
        {
            throw new IllegalArgumentException(
                "com.demo.service.orga.PeoplesManageService.getPeoples(com.demo.entity.orga.PeoplesVO Peoples, int pageNumber, int pageSize, java.lang.String orderBy) - 'orderBy' can not be null");
        }
        try
        {
            return this.handleGetPeoples(Peoples, pageNumber, pageSize, orderBy);
        }
        catch (Throwable th)
        {
            throw new com.demo.service.orga.PeoplesManageServiceException(
                "Error performing 'com.demo.service.orga.PeoplesManageService.getPeoples(com.demo.entity.orga.PeoplesVO Peoples, int pageNumber, int pageSize, java.lang.String orderBy)' --> " + th,
                th);
        }
    }

     /**
      * Performs the core logic for {@link #getPeoples(com.demo.entity.orga.PeoplesVO, int, int, java.lang.String)}
      */
    protected abstract com.demo.entity.orga.PeoplesVO[] handleGetPeoples(com.demo.entity.orga.PeoplesVO Peoples, int pageNumber, int pageSize, java.lang.String orderBy)
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