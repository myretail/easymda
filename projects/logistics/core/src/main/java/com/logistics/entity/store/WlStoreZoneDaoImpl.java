// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.entity.store;
/**
 * @see com.logistics.entity.store.WlStoreZone
 */
public class WlStoreZoneDaoImpl
    extends com.logistics.entity.store.WlStoreZoneDaoBase
{
    /**
     * @see com.logistics.entity.store.WlStoreZoneDao#toWlStoreZoneVO(com.logistics.entity.store.WlStoreZone, com.logistics.entity.store.WlStoreZoneVO)
     */
    public void toWlStoreZoneVO(
        com.logistics.entity.store.WlStoreZone source,
        com.logistics.entity.store.WlStoreZoneVO target)
    {
        // @todo verify behavior of toWlStoreZoneVO
        super.toWlStoreZoneVO(source, target);
    }


    /**
     * @see com.logistics.entity.store.WlStoreZoneDao#toWlStoreZoneVO(com.logistics.entity.store.WlStoreZone)
     */
    public com.logistics.entity.store.WlStoreZoneVO toWlStoreZoneVO(final com.logistics.entity.store.WlStoreZone entity)
    {
        // @todo verify behavior of toWlStoreZoneVO
        return super.toWlStoreZoneVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.store.WlStoreZone loadWlStoreZoneFromWlStoreZoneVO(com.logistics.entity.store.WlStoreZoneVO wlStoreZoneVO)
    {
        // @todo implement loadWlStoreZoneFromWlStoreZoneVO
        throw new java.lang.UnsupportedOperationException("com.logistics.entity.store.loadWlStoreZoneFromWlStoreZoneVO(com.logistics.entity.store.WlStoreZoneVO) not yet implemented.");

        /* A typical implementation looks like this:
        com.logistics.entity.store.WlStoreZone wlStoreZone = this.load(wlStoreZoneVO.getId());
        if (wlStoreZone == null)
        {
            wlStoreZone = com.logistics.entity.store.WlStoreZone.Factory.newInstance();
        }
        return wlStoreZone;
        */
    }

    
    /**
     * @see com.logistics.entity.store.WlStoreZoneDao#wlStoreZoneVOToEntity(com.logistics.entity.store.WlStoreZoneVO)
     */
    public com.logistics.entity.store.WlStoreZone wlStoreZoneVOToEntity(com.logistics.entity.store.WlStoreZoneVO wlStoreZoneVO)
    {
        // @todo verify behavior of wlStoreZoneVOToEntity
        com.logistics.entity.store.WlStoreZone entity = this.loadWlStoreZoneFromWlStoreZoneVO(wlStoreZoneVO);
        this.wlStoreZoneVOToEntity(wlStoreZoneVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.store.WlStoreZoneDao#wlStoreZoneVOToEntity(com.logistics.entity.store.WlStoreZoneVO, com.logistics.entity.store.WlStoreZone)
     */
    public void wlStoreZoneVOToEntity(
        com.logistics.entity.store.WlStoreZoneVO source,
        com.logistics.entity.store.WlStoreZone target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wlStoreZoneVOToEntity
        super.wlStoreZoneVOToEntity(source, target, copyIfNull);
    }

}