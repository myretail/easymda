// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.entity.store;
/**
 * @see com.logistics.entity.store.WlLocation
 */
public class WlLocationDaoImpl
    extends com.logistics.entity.store.WlLocationDaoBase
{
    /**
     * @see com.logistics.entity.store.WlLocationDao#toWlLocationVO(com.logistics.entity.store.WlLocation, com.logistics.entity.store.WlLocationVO)
     */
    public void toWlLocationVO(
        com.logistics.entity.store.WlLocation source,
        com.logistics.entity.store.WlLocationVO target)
    {
        // @todo verify behavior of toWlLocationVO
        super.toWlLocationVO(source, target);
        // WARNING! No conversion for target.locationUse (can't convert source.getLocationUse():java.lang.String to java.lang.String[]
    }


    /**
     * @see com.logistics.entity.store.WlLocationDao#toWlLocationVO(com.logistics.entity.store.WlLocation)
     */
    public com.logistics.entity.store.WlLocationVO toWlLocationVO(final com.logistics.entity.store.WlLocation entity)
    {
        // @todo verify behavior of toWlLocationVO
        return super.toWlLocationVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.store.WlLocation loadWlLocationFromWlLocationVO(com.logistics.entity.store.WlLocationVO wlLocationVO)
    {
        // @todo implement loadWlLocationFromWlLocationVO
        throw new java.lang.UnsupportedOperationException("com.logistics.entity.store.loadWlLocationFromWlLocationVO(com.logistics.entity.store.WlLocationVO) not yet implemented.");

        /* A typical implementation looks like this:
        com.logistics.entity.store.WlLocation wlLocation = this.load(wlLocationVO.getId());
        if (wlLocation == null)
        {
            wlLocation = com.logistics.entity.store.WlLocation.Factory.newInstance();
        }
        return wlLocation;
        */
    }

    
    /**
     * @see com.logistics.entity.store.WlLocationDao#wlLocationVOToEntity(com.logistics.entity.store.WlLocationVO)
     */
    public com.logistics.entity.store.WlLocation wlLocationVOToEntity(com.logistics.entity.store.WlLocationVO wlLocationVO)
    {
        // @todo verify behavior of wlLocationVOToEntity
        com.logistics.entity.store.WlLocation entity = this.loadWlLocationFromWlLocationVO(wlLocationVO);
        this.wlLocationVOToEntity(wlLocationVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.store.WlLocationDao#wlLocationVOToEntity(com.logistics.entity.store.WlLocationVO, com.logistics.entity.store.WlLocation)
     */
    public void wlLocationVOToEntity(
        com.logistics.entity.store.WlLocationVO source,
        com.logistics.entity.store.WlLocation target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wlLocationVOToEntity
        super.wlLocationVOToEntity(source, target, copyIfNull);
        // No conversion for target.locationUse (can't convert source.getLocationUse():java.lang.String[] to java.lang.String
    }

}