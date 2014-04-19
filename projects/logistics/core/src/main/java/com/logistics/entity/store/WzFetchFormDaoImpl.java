// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.entity.store;
/**
 * @see com.logistics.entity.store.WzFetchForm
 */
public class WzFetchFormDaoImpl
    extends com.logistics.entity.store.WzFetchFormDaoBase
{
    /**
     * @see com.logistics.entity.store.WzFetchFormDao#toWzFetchFormVO(com.logistics.entity.store.WzFetchForm, com.logistics.entity.store.WzFetchFormVO)
     */
    public void toWzFetchFormVO(
        com.logistics.entity.store.WzFetchForm source,
        com.logistics.entity.store.WzFetchFormVO target)
    {
        // @todo verify behavior of toWzFetchFormVO
        super.toWzFetchFormVO(source, target);
        // WARNING! No conversion for target.time (can't convert source.getTime():java.lang.String to java.util.Date
    }


    /**
     * @see com.logistics.entity.store.WzFetchFormDao#toWzFetchFormVO(com.logistics.entity.store.WzFetchForm)
     */
    public com.logistics.entity.store.WzFetchFormVO toWzFetchFormVO(final com.logistics.entity.store.WzFetchForm entity)
    {
        // @todo verify behavior of toWzFetchFormVO
        return super.toWzFetchFormVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.store.WzFetchForm loadWzFetchFormFromWzFetchFormVO(com.logistics.entity.store.WzFetchFormVO wzFetchFormVO)
    {
        // @todo implement loadWzFetchFormFromWzFetchFormVO
        throw new java.lang.UnsupportedOperationException("com.logistics.entity.store.loadWzFetchFormFromWzFetchFormVO(com.logistics.entity.store.WzFetchFormVO) not yet implemented.");

        /* A typical implementation looks like this:
        com.logistics.entity.store.WzFetchForm wzFetchForm = this.load(wzFetchFormVO.getId());
        if (wzFetchForm == null)
        {
            wzFetchForm = com.logistics.entity.store.WzFetchForm.Factory.newInstance();
        }
        return wzFetchForm;
        */
    }

    
    /**
     * @see com.logistics.entity.store.WzFetchFormDao#wzFetchFormVOToEntity(com.logistics.entity.store.WzFetchFormVO)
     */
    public com.logistics.entity.store.WzFetchForm wzFetchFormVOToEntity(com.logistics.entity.store.WzFetchFormVO wzFetchFormVO)
    {
        // @todo verify behavior of wzFetchFormVOToEntity
        com.logistics.entity.store.WzFetchForm entity = this.loadWzFetchFormFromWzFetchFormVO(wzFetchFormVO);
        this.wzFetchFormVOToEntity(wzFetchFormVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.store.WzFetchFormDao#wzFetchFormVOToEntity(com.logistics.entity.store.WzFetchFormVO, com.logistics.entity.store.WzFetchForm)
     */
    public void wzFetchFormVOToEntity(
        com.logistics.entity.store.WzFetchFormVO source,
        com.logistics.entity.store.WzFetchForm target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wzFetchFormVOToEntity
        super.wzFetchFormVOToEntity(source, target, copyIfNull);
        // No conversion for target.time (can't convert source.getTime():java.util.Date to java.lang.String
    }

}