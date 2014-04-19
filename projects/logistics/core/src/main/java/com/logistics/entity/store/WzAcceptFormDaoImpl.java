// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.entity.store;
/**
 * @see com.logistics.entity.store.WzAcceptForm
 */
public class WzAcceptFormDaoImpl
    extends com.logistics.entity.store.WzAcceptFormDaoBase
{
    /**
     * @see com.logistics.entity.store.WzAcceptFormDao#toWzAcceptFormVO(com.logistics.entity.store.WzAcceptForm, com.logistics.entity.store.WzAcceptFormVO)
     */
    public void toWzAcceptFormVO(
        com.logistics.entity.store.WzAcceptForm source,
        com.logistics.entity.store.WzAcceptFormVO target)
    {
        // @todo verify behavior of toWzAcceptFormVO
        super.toWzAcceptFormVO(source, target);
        // WARNING! No conversion for target.transfer (can't convert source.getTransfer():com.logistics.entity.orga.People to java.lang.String
        // WARNING! No conversion for target.time (can't convert source.getTime():java.util.Date to java.util.Date
    }


    /**
     * @see com.logistics.entity.store.WzAcceptFormDao#toWzAcceptFormVO(com.logistics.entity.store.WzAcceptForm)
     */
    public com.logistics.entity.store.WzAcceptFormVO toWzAcceptFormVO(final com.logistics.entity.store.WzAcceptForm entity)
    {
        // @todo verify behavior of toWzAcceptFormVO
        return super.toWzAcceptFormVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.store.WzAcceptForm loadWzAcceptFormFromWzAcceptFormVO(com.logistics.entity.store.WzAcceptFormVO wzAcceptFormVO)
    {
        // @todo implement loadWzAcceptFormFromWzAcceptFormVO
        throw new java.lang.UnsupportedOperationException("com.logistics.entity.store.loadWzAcceptFormFromWzAcceptFormVO(com.logistics.entity.store.WzAcceptFormVO) not yet implemented.");

        /* A typical implementation looks like this:
        com.logistics.entity.store.WzAcceptForm wzAcceptForm = this.load(wzAcceptFormVO.getId());
        if (wzAcceptForm == null)
        {
            wzAcceptForm = com.logistics.entity.store.WzAcceptForm.Factory.newInstance();
        }
        return wzAcceptForm;
        */
    }

    
    /**
     * @see com.logistics.entity.store.WzAcceptFormDao#wzAcceptFormVOToEntity(com.logistics.entity.store.WzAcceptFormVO)
     */
    public com.logistics.entity.store.WzAcceptForm wzAcceptFormVOToEntity(com.logistics.entity.store.WzAcceptFormVO wzAcceptFormVO)
    {
        // @todo verify behavior of wzAcceptFormVOToEntity
        com.logistics.entity.store.WzAcceptForm entity = this.loadWzAcceptFormFromWzAcceptFormVO(wzAcceptFormVO);
        this.wzAcceptFormVOToEntity(wzAcceptFormVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.store.WzAcceptFormDao#wzAcceptFormVOToEntity(com.logistics.entity.store.WzAcceptFormVO, com.logistics.entity.store.WzAcceptForm)
     */
    public void wzAcceptFormVOToEntity(
        com.logistics.entity.store.WzAcceptFormVO source,
        com.logistics.entity.store.WzAcceptForm target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wzAcceptFormVOToEntity
        super.wzAcceptFormVOToEntity(source, target, copyIfNull);
        // No conversion for target.time (can't convert source.getTime():java.util.Date to java.util.Date
    }

}