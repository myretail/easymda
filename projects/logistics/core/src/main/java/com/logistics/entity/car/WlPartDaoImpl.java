// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.entity.car;
/**
 * @see com.logistics.entity.car.WlPart
 */
public class WlPartDaoImpl
    extends com.logistics.entity.car.WlPartDaoBase
{
    /**
     * @see com.logistics.entity.car.WlPartDao#toWlPartVO(com.logistics.entity.car.WlPart, com.logistics.entity.car.WlPartVO)
     */
    public void toWlPartVO(
        com.logistics.entity.car.WlPart source,
        com.logistics.entity.car.WlPartVO target)
    {
        // @todo verify behavior of toWlPartVO
        super.toWlPartVO(source, target);
    }


    /**
     * @see com.logistics.entity.car.WlPartDao#toWlPartVO(com.logistics.entity.car.WlPart)
     */
    public com.logistics.entity.car.WlPartVO toWlPartVO(final com.logistics.entity.car.WlPart entity)
    {
        // @todo verify behavior of toWlPartVO
        return super.toWlPartVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.car.WlPart loadWlPartFromWlPartVO(com.logistics.entity.car.WlPartVO wlPartVO)
    {
        // @todo implement loadWlPartFromWlPartVO
        throw new java.lang.UnsupportedOperationException("com.logistics.entity.car.loadWlPartFromWlPartVO(com.logistics.entity.car.WlPartVO) not yet implemented.");

        /* A typical implementation looks like this:
        com.logistics.entity.car.WlPart wlPart = this.load(wlPartVO.getId());
        if (wlPart == null)
        {
            wlPart = com.logistics.entity.car.WlPart.Factory.newInstance();
        }
        return wlPart;
        */
    }

    
    /**
     * @see com.logistics.entity.car.WlPartDao#wlPartVOToEntity(com.logistics.entity.car.WlPartVO)
     */
    public com.logistics.entity.car.WlPart wlPartVOToEntity(com.logistics.entity.car.WlPartVO wlPartVO)
    {
        // @todo verify behavior of wlPartVOToEntity
        com.logistics.entity.car.WlPart entity = this.loadWlPartFromWlPartVO(wlPartVO);
        this.wlPartVOToEntity(wlPartVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.car.WlPartDao#wlPartVOToEntity(com.logistics.entity.car.WlPartVO, com.logistics.entity.car.WlPart)
     */
    public void wlPartVOToEntity(
        com.logistics.entity.car.WlPartVO source,
        com.logistics.entity.car.WlPart target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wlPartVOToEntity
        super.wlPartVOToEntity(source, target, copyIfNull);
    }

}