// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.entity.cost;
/**
 * @see com.logistics.entity.cost.WlLaborage
 */
public class WlLaborageDaoImpl
    extends com.logistics.entity.cost.WlLaborageDaoBase
{
    /**
     * @see com.logistics.entity.cost.WlLaborageDao#toWlLaborageVO(com.logistics.entity.cost.WlLaborage, com.logistics.entity.cost.WlLaborageVO)
     */
    public void toWlLaborageVO(
        com.logistics.entity.cost.WlLaborage source,
        com.logistics.entity.cost.WlLaborageVO target)
    {
        // @todo verify behavior of toWlLaborageVO
        super.toWlLaborageVO(source, target);
        // WARNING! No conversion for target.month (can't convert source.getMonth():java.util.Date to java.util.Date
        // WARNING! No conversion for target.sendDate (can't convert source.getSendDate():java.util.Date to java.util.Date
        // WARNING! No conversion for target.orderDate (can't convert source.getOrderDate():java.util.Date to java.util.Date
        // WARNING! No conversion for target.orderEndDate (can't convert source.getOrderEndDate():java.util.Date to java.util.Date
    }


    /**
     * @see com.logistics.entity.cost.WlLaborageDao#toWlLaborageVO(com.logistics.entity.cost.WlLaborage)
     */
    public com.logistics.entity.cost.WlLaborageVO toWlLaborageVO(final com.logistics.entity.cost.WlLaborage entity)
    {
        // @todo verify behavior of toWlLaborageVO
        return super.toWlLaborageVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.cost.WlLaborage loadWlLaborageFromWlLaborageVO(com.logistics.entity.cost.WlLaborageVO wlLaborageVO)
    {
        // @todo implement loadWlLaborageFromWlLaborageVO
        throw new java.lang.UnsupportedOperationException("com.logistics.entity.cost.loadWlLaborageFromWlLaborageVO(com.logistics.entity.cost.WlLaborageVO) not yet implemented.");

        /* A typical implementation looks like this:
        com.logistics.entity.cost.WlLaborage wlLaborage = this.load(wlLaborageVO.getId());
        if (wlLaborage == null)
        {
            wlLaborage = com.logistics.entity.cost.WlLaborage.Factory.newInstance();
        }
        return wlLaborage;
        */
    }

    
    /**
     * @see com.logistics.entity.cost.WlLaborageDao#wlLaborageVOToEntity(com.logistics.entity.cost.WlLaborageVO)
     */
    public com.logistics.entity.cost.WlLaborage wlLaborageVOToEntity(com.logistics.entity.cost.WlLaborageVO wlLaborageVO)
    {
        // @todo verify behavior of wlLaborageVOToEntity
        com.logistics.entity.cost.WlLaborage entity = this.loadWlLaborageFromWlLaborageVO(wlLaborageVO);
        this.wlLaborageVOToEntity(wlLaborageVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.cost.WlLaborageDao#wlLaborageVOToEntity(com.logistics.entity.cost.WlLaborageVO, com.logistics.entity.cost.WlLaborage)
     */
    public void wlLaborageVOToEntity(
        com.logistics.entity.cost.WlLaborageVO source,
        com.logistics.entity.cost.WlLaborage target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wlLaborageVOToEntity
        super.wlLaborageVOToEntity(source, target, copyIfNull);
        // No conversion for target.month (can't convert source.getMonth():java.util.Date to java.util.Date
        // No conversion for target.sendDate (can't convert source.getSendDate():java.util.Date to java.util.Date
        // No conversion for target.orderDate (can't convert source.getOrderDate():java.util.Date to java.util.Date
        // No conversion for target.orderEndDate (can't convert source.getOrderEndDate():java.util.Date to java.util.Date
    }

}