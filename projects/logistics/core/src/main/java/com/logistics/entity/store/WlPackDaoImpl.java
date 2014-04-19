// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.entity.store;
/**
 * @see com.logistics.entity.store.WlPack
 */
public class WlPackDaoImpl
    extends com.logistics.entity.store.WlPackDaoBase
{
    /**
     * @see com.logistics.entity.store.WlPackDao#toWlPackVO(com.logistics.entity.store.WlPack, com.logistics.entity.store.WlPackVO)
     */
    public void toWlPackVO(
        com.logistics.entity.store.WlPack source,
        com.logistics.entity.store.WlPackVO target)
    {
        // @todo verify behavior of toWlPackVO
        super.toWlPackVO(source, target);
    }


    /**
     * @see com.logistics.entity.store.WlPackDao#toWlPackVO(com.logistics.entity.store.WlPack)
     */
    public com.logistics.entity.store.WlPackVO toWlPackVO(final com.logistics.entity.store.WlPack entity)
    {
        // @todo verify behavior of toWlPackVO
        return super.toWlPackVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.store.WlPack loadWlPackFromWlPackVO(com.logistics.entity.store.WlPackVO wlPackVO)
    {
        // @todo implement loadWlPackFromWlPackVO
        throw new java.lang.UnsupportedOperationException("com.logistics.entity.store.loadWlPackFromWlPackVO(com.logistics.entity.store.WlPackVO) not yet implemented.");

        /* A typical implementation looks like this:
        com.logistics.entity.store.WlPack wlPack = this.load(wlPackVO.getId());
        if (wlPack == null)
        {
            wlPack = com.logistics.entity.store.WlPack.Factory.newInstance();
        }
        return wlPack;
        */
    }

    
    /**
     * @see com.logistics.entity.store.WlPackDao#wlPackVOToEntity(com.logistics.entity.store.WlPackVO)
     */
    public com.logistics.entity.store.WlPack wlPackVOToEntity(com.logistics.entity.store.WlPackVO wlPackVO)
    {
        // @todo verify behavior of wlPackVOToEntity
        com.logistics.entity.store.WlPack entity = this.loadWlPackFromWlPackVO(wlPackVO);
        this.wlPackVOToEntity(wlPackVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.store.WlPackDao#wlPackVOToEntity(com.logistics.entity.store.WlPackVO, com.logistics.entity.store.WlPack)
     */
    public void wlPackVOToEntity(
        com.logistics.entity.store.WlPackVO source,
        com.logistics.entity.store.WlPack target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wlPackVOToEntity
        super.wlPackVOToEntity(source, target, copyIfNull);
    }

}