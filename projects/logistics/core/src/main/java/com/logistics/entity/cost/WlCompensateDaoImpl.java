// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.entity.cost;
/**
 * @see com.logistics.entity.cost.WlCompensate
 */
public class WlCompensateDaoImpl
    extends com.logistics.entity.cost.WlCompensateDaoBase
{
    /**
     * @see com.logistics.entity.cost.WlCompensateDao#toWlCompensateVO(com.logistics.entity.cost.WlCompensate, com.logistics.entity.cost.WlCompensateVO)
     */
    public void toWlCompensateVO(
        com.logistics.entity.cost.WlCompensate source,
        com.logistics.entity.cost.WlCompensateVO target)
    {
        // @todo verify behavior of toWlCompensateVO
        super.toWlCompensateVO(source, target);
        // WARNING! No conversion for target.acceptDate (can't convert source.getAcceptDate():java.util.Date to java.util.Date
    }


    /**
     * @see com.logistics.entity.cost.WlCompensateDao#toWlCompensateVO(com.logistics.entity.cost.WlCompensate)
     */
    public com.logistics.entity.cost.WlCompensateVO toWlCompensateVO(final com.logistics.entity.cost.WlCompensate entity)
    {
        // @todo verify behavior of toWlCompensateVO
        return super.toWlCompensateVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.cost.WlCompensate loadWlCompensateFromWlCompensateVO(com.logistics.entity.cost.WlCompensateVO wlCompensateVO)
    {
        // @todo implement loadWlCompensateFromWlCompensateVO
        throw new java.lang.UnsupportedOperationException("com.logistics.entity.cost.loadWlCompensateFromWlCompensateVO(com.logistics.entity.cost.WlCompensateVO) not yet implemented.");

        /* A typical implementation looks like this:
        com.logistics.entity.cost.WlCompensate wlCompensate = this.load(wlCompensateVO.getId());
        if (wlCompensate == null)
        {
            wlCompensate = com.logistics.entity.cost.WlCompensate.Factory.newInstance();
        }
        return wlCompensate;
        */
    }

    
    /**
     * @see com.logistics.entity.cost.WlCompensateDao#wlCompensateVOToEntity(com.logistics.entity.cost.WlCompensateVO)
     */
    public com.logistics.entity.cost.WlCompensate wlCompensateVOToEntity(com.logistics.entity.cost.WlCompensateVO wlCompensateVO)
    {
        // @todo verify behavior of wlCompensateVOToEntity
        com.logistics.entity.cost.WlCompensate entity = this.loadWlCompensateFromWlCompensateVO(wlCompensateVO);
        this.wlCompensateVOToEntity(wlCompensateVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.cost.WlCompensateDao#wlCompensateVOToEntity(com.logistics.entity.cost.WlCompensateVO, com.logistics.entity.cost.WlCompensate)
     */
    public void wlCompensateVOToEntity(
        com.logistics.entity.cost.WlCompensateVO source,
        com.logistics.entity.cost.WlCompensate target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wlCompensateVOToEntity
        super.wlCompensateVOToEntity(source, target, copyIfNull);
        // No conversion for target.acceptDate (can't convert source.getAcceptDate():java.util.Date to java.util.Date
    }

}