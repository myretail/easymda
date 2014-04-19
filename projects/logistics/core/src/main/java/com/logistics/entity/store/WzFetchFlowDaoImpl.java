// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.entity.store;
/**
 * @see com.logistics.entity.store.WzFetchFlow
 */
public class WzFetchFlowDaoImpl
    extends com.logistics.entity.store.WzFetchFlowDaoBase
{
    /**
     * @see com.logistics.entity.store.WzFetchFlowDao#toWzFetchFlowVO(com.logistics.entity.store.WzFetchFlow, com.logistics.entity.store.WzFetchFlowVO)
     */
    public void toWzFetchFlowVO(
        com.logistics.entity.store.WzFetchFlow source,
        com.logistics.entity.store.WzFetchFlowVO target)
    {
        // @todo verify behavior of toWzFetchFlowVO
        super.toWzFetchFlowVO(source, target);
        // WARNING! No conversion for target.time (can't convert source.getTime():java.util.Date to java.util.Date
    }


    /**
     * @see com.logistics.entity.store.WzFetchFlowDao#toWzFetchFlowVO(com.logistics.entity.store.WzFetchFlow)
     */
    public com.logistics.entity.store.WzFetchFlowVO toWzFetchFlowVO(final com.logistics.entity.store.WzFetchFlow entity)
    {
        // @todo verify behavior of toWzFetchFlowVO
        return super.toWzFetchFlowVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.store.WzFetchFlow loadWzFetchFlowFromWzFetchFlowVO(com.logistics.entity.store.WzFetchFlowVO wzFetchFlowVO)
    {
        // @todo implement loadWzFetchFlowFromWzFetchFlowVO
        throw new java.lang.UnsupportedOperationException("com.logistics.entity.store.loadWzFetchFlowFromWzFetchFlowVO(com.logistics.entity.store.WzFetchFlowVO) not yet implemented.");

        /* A typical implementation looks like this:
        com.logistics.entity.store.WzFetchFlow wzFetchFlow = this.load(wzFetchFlowVO.getId());
        if (wzFetchFlow == null)
        {
            wzFetchFlow = com.logistics.entity.store.WzFetchFlow.Factory.newInstance();
        }
        return wzFetchFlow;
        */
    }

    
    /**
     * @see com.logistics.entity.store.WzFetchFlowDao#wzFetchFlowVOToEntity(com.logistics.entity.store.WzFetchFlowVO)
     */
    public com.logistics.entity.store.WzFetchFlow wzFetchFlowVOToEntity(com.logistics.entity.store.WzFetchFlowVO wzFetchFlowVO)
    {
        // @todo verify behavior of wzFetchFlowVOToEntity
        com.logistics.entity.store.WzFetchFlow entity = this.loadWzFetchFlowFromWzFetchFlowVO(wzFetchFlowVO);
        this.wzFetchFlowVOToEntity(wzFetchFlowVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.store.WzFetchFlowDao#wzFetchFlowVOToEntity(com.logistics.entity.store.WzFetchFlowVO, com.logistics.entity.store.WzFetchFlow)
     */
    public void wzFetchFlowVOToEntity(
        com.logistics.entity.store.WzFetchFlowVO source,
        com.logistics.entity.store.WzFetchFlow target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wzFetchFlowVOToEntity
        super.wzFetchFlowVOToEntity(source, target, copyIfNull);
        // No conversion for target.time (can't convert source.getTime():java.util.Date to java.util.Date
    }

}