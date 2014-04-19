// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.entity.car;
/**
 * @see com.logistics.entity.car.WlCardFull
 */
public class WlCardFullDaoImpl
    extends com.logistics.entity.car.WlCardFullDaoBase
{
    /**
     * @see com.logistics.entity.car.WlCardFullDao#toWlCardFullVO(com.logistics.entity.car.WlCardFull, com.logistics.entity.car.WlCardFullVO)
     */
    public void toWlCardFullVO(
        com.logistics.entity.car.WlCardFull source,
        com.logistics.entity.car.WlCardFullVO target)
    {
        // @todo verify behavior of toWlCardFullVO
        super.toWlCardFullVO(source, target);
        // WARNING! No conversion for target.brithDay (can't convert source.getBrithDay():java.util.Date to java.util.Date
    }


    /**
     * @see com.logistics.entity.car.WlCardFullDao#toWlCardFullVO(com.logistics.entity.car.WlCardFull)
     */
    public com.logistics.entity.car.WlCardFullVO toWlCardFullVO(final com.logistics.entity.car.WlCardFull entity)
    {
        // @todo verify behavior of toWlCardFullVO
        return super.toWlCardFullVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.car.WlCardFull loadWlCardFullFromWlCardFullVO(com.logistics.entity.car.WlCardFullVO wlCardFullVO)
    {
        // @todo implement loadWlCardFullFromWlCardFullVO
        throw new java.lang.UnsupportedOperationException("com.logistics.entity.car.loadWlCardFullFromWlCardFullVO(com.logistics.entity.car.WlCardFullVO) not yet implemented.");

        /* A typical implementation looks like this:
        com.logistics.entity.car.WlCardFull wlCardFull = this.load(wlCardFullVO.getId());
        if (wlCardFull == null)
        {
            wlCardFull = com.logistics.entity.car.WlCardFull.Factory.newInstance();
        }
        return wlCardFull;
        */
    }

    
    /**
     * @see com.logistics.entity.car.WlCardFullDao#wlCardFullVOToEntity(com.logistics.entity.car.WlCardFullVO)
     */
    public com.logistics.entity.car.WlCardFull wlCardFullVOToEntity(com.logistics.entity.car.WlCardFullVO wlCardFullVO)
    {
        // @todo verify behavior of wlCardFullVOToEntity
        com.logistics.entity.car.WlCardFull entity = this.loadWlCardFullFromWlCardFullVO(wlCardFullVO);
        this.wlCardFullVOToEntity(wlCardFullVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.car.WlCardFullDao#wlCardFullVOToEntity(com.logistics.entity.car.WlCardFullVO, com.logistics.entity.car.WlCardFull)
     */
    public void wlCardFullVOToEntity(
        com.logistics.entity.car.WlCardFullVO source,
        com.logistics.entity.car.WlCardFull target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wlCardFullVOToEntity
        super.wlCardFullVOToEntity(source, target, copyIfNull);
        // No conversion for target.brithDay (can't convert source.getBrithDay():java.util.Date to java.util.Date
    }

}