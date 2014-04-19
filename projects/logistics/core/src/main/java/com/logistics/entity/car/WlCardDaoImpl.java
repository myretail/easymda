// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.entity.car;
/**
 * @see com.logistics.entity.car.WlCard
 */
public class WlCardDaoImpl
    extends com.logistics.entity.car.WlCardDaoBase
{
    /**
     * @see com.logistics.entity.car.WlCardDao#toWlCardVO(com.logistics.entity.car.WlCard, com.logistics.entity.car.WlCardVO)
     */
    public void toWlCardVO(
        com.logistics.entity.car.WlCard source,
        com.logistics.entity.car.WlCardVO target)
    {
        // @todo verify behavior of toWlCardVO
        super.toWlCardVO(source, target);
        // WARNING! No conversion for target.brithDay (can't convert source.getBrithDay():java.util.Date to java.util.Date
    }


    /**
     * @see com.logistics.entity.car.WlCardDao#toWlCardVO(com.logistics.entity.car.WlCard)
     */
    public com.logistics.entity.car.WlCardVO toWlCardVO(final com.logistics.entity.car.WlCard entity)
    {
        // @todo verify behavior of toWlCardVO
        return super.toWlCardVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.car.WlCard loadWlCardFromWlCardVO(com.logistics.entity.car.WlCardVO wlCardVO)
    {
        // @todo implement loadWlCardFromWlCardVO
        throw new java.lang.UnsupportedOperationException("com.logistics.entity.car.loadWlCardFromWlCardVO(com.logistics.entity.car.WlCardVO) not yet implemented.");

        /* A typical implementation looks like this:
        com.logistics.entity.car.WlCard wlCard = this.load(wlCardVO.getId());
        if (wlCard == null)
        {
            wlCard = com.logistics.entity.car.WlCard.Factory.newInstance();
        }
        return wlCard;
        */
    }

    
    /**
     * @see com.logistics.entity.car.WlCardDao#wlCardVOToEntity(com.logistics.entity.car.WlCardVO)
     */
    public com.logistics.entity.car.WlCard wlCardVOToEntity(com.logistics.entity.car.WlCardVO wlCardVO)
    {
        // @todo verify behavior of wlCardVOToEntity
        com.logistics.entity.car.WlCard entity = this.loadWlCardFromWlCardVO(wlCardVO);
        this.wlCardVOToEntity(wlCardVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.car.WlCardDao#wlCardVOToEntity(com.logistics.entity.car.WlCardVO, com.logistics.entity.car.WlCard)
     */
    public void wlCardVOToEntity(
        com.logistics.entity.car.WlCardVO source,
        com.logistics.entity.car.WlCard target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wlCardVOToEntity
        super.wlCardVOToEntity(source, target, copyIfNull);
        // No conversion for target.brithDay (can't convert source.getBrithDay():java.util.Date to java.util.Date
    }

}