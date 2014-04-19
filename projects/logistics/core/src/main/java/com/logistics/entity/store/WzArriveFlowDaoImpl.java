// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.entity.store;
/**
 * @see com.logistics.entity.store.WzArriveFlow
 */
public class WzArriveFlowDaoImpl
    extends com.logistics.entity.store.WzArriveFlowDaoBase
{
    /**
     * @see com.logistics.entity.store.WzArriveFlowDao#toWzArriveFlowVO(com.logistics.entity.store.WzArriveFlow, com.logistics.entity.store.WzArriveFlowVO)
     */
    public void toWzArriveFlowVO(
        com.logistics.entity.store.WzArriveFlow source,
        com.logistics.entity.store.WzArriveFlowVO target)
    {
        // @todo verify behavior of toWzArriveFlowVO
        super.toWzArriveFlowVO(source, target);
        // WARNING! No conversion for target.arriveTime (can't convert source.getArriveTime():java.util.Date to java.util.Date
        // WARNING! No conversion for target.entryTime (can't convert source.getEntryTime():java.util.Date to java.util.Date
    }


    /**
     * @see com.logistics.entity.store.WzArriveFlowDao#toWzArriveFlowVO(com.logistics.entity.store.WzArriveFlow)
     */
    public com.logistics.entity.store.WzArriveFlowVO toWzArriveFlowVO(final com.logistics.entity.store.WzArriveFlow entity)
    {
        // @todo verify behavior of toWzArriveFlowVO
        return super.toWzArriveFlowVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.store.WzArriveFlow loadWzArriveFlowFromWzArriveFlowVO(com.logistics.entity.store.WzArriveFlowVO wzArriveFlowVO)
    {
        // @todo implement loadWzArriveFlowFromWzArriveFlowVO
        throw new java.lang.UnsupportedOperationException("com.logistics.entity.store.loadWzArriveFlowFromWzArriveFlowVO(com.logistics.entity.store.WzArriveFlowVO) not yet implemented.");

        /* A typical implementation looks like this:
        com.logistics.entity.store.WzArriveFlow wzArriveFlow = this.load(wzArriveFlowVO.getId());
        if (wzArriveFlow == null)
        {
            wzArriveFlow = com.logistics.entity.store.WzArriveFlow.Factory.newInstance();
        }
        return wzArriveFlow;
        */
    }

    
    /**
     * @see com.logistics.entity.store.WzArriveFlowDao#wzArriveFlowVOToEntity(com.logistics.entity.store.WzArriveFlowVO)
     */
    public com.logistics.entity.store.WzArriveFlow wzArriveFlowVOToEntity(com.logistics.entity.store.WzArriveFlowVO wzArriveFlowVO)
    {
        // @todo verify behavior of wzArriveFlowVOToEntity
        com.logistics.entity.store.WzArriveFlow entity = this.loadWzArriveFlowFromWzArriveFlowVO(wzArriveFlowVO);
        this.wzArriveFlowVOToEntity(wzArriveFlowVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.store.WzArriveFlowDao#wzArriveFlowVOToEntity(com.logistics.entity.store.WzArriveFlowVO, com.logistics.entity.store.WzArriveFlow)
     */
    public void wzArriveFlowVOToEntity(
        com.logistics.entity.store.WzArriveFlowVO source,
        com.logistics.entity.store.WzArriveFlow target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wzArriveFlowVOToEntity
        super.wzArriveFlowVOToEntity(source, target, copyIfNull);
        // No conversion for target.arriveTime (can't convert source.getArriveTime():java.util.Date to java.util.Date
        // No conversion for target.entryTime (can't convert source.getEntryTime():java.util.Date to java.util.Date
    }

}