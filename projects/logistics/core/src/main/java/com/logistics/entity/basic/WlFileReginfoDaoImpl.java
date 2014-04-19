// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.entity.basic;
/**
 * @see com.logistics.entity.basic.WlFileReginfo
 */
public class WlFileReginfoDaoImpl
    extends com.logistics.entity.basic.WlFileReginfoDaoBase
{
    /**
     * @see com.logistics.entity.basic.WlFileReginfoDao#toWlFileReginfoVO(com.logistics.entity.basic.WlFileReginfo, com.logistics.entity.basic.WlFileReginfoVO)
     */
    public void toWlFileReginfoVO(
        com.logistics.entity.basic.WlFileReginfo source,
        com.logistics.entity.basic.WlFileReginfoVO target)
    {
        // @todo verify behavior of toWlFileReginfoVO
        super.toWlFileReginfoVO(source, target);
    }


    /**
     * @see com.logistics.entity.basic.WlFileReginfoDao#toWlFileReginfoVO(com.logistics.entity.basic.WlFileReginfo)
     */
    public com.logistics.entity.basic.WlFileReginfoVO toWlFileReginfoVO(final com.logistics.entity.basic.WlFileReginfo entity)
    {
        // @todo verify behavior of toWlFileReginfoVO
        return super.toWlFileReginfoVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.basic.WlFileReginfo loadWlFileReginfoFromWlFileReginfoVO(com.logistics.entity.basic.WlFileReginfoVO wlFileReginfoVO)
    {
        // @todo implement loadWlFileReginfoFromWlFileReginfoVO
        throw new java.lang.UnsupportedOperationException("com.logistics.entity.basic.loadWlFileReginfoFromWlFileReginfoVO(com.logistics.entity.basic.WlFileReginfoVO) not yet implemented.");

        /* A typical implementation looks like this:
        com.logistics.entity.basic.WlFileReginfo wlFileReginfo = this.load(wlFileReginfoVO.getId());
        if (wlFileReginfo == null)
        {
            wlFileReginfo = com.logistics.entity.basic.WlFileReginfo.Factory.newInstance();
        }
        return wlFileReginfo;
        */
    }

    
    /**
     * @see com.logistics.entity.basic.WlFileReginfoDao#wlFileReginfoVOToEntity(com.logistics.entity.basic.WlFileReginfoVO)
     */
    public com.logistics.entity.basic.WlFileReginfo wlFileReginfoVOToEntity(com.logistics.entity.basic.WlFileReginfoVO wlFileReginfoVO)
    {
        // @todo verify behavior of wlFileReginfoVOToEntity
        com.logistics.entity.basic.WlFileReginfo entity = this.loadWlFileReginfoFromWlFileReginfoVO(wlFileReginfoVO);
        this.wlFileReginfoVOToEntity(wlFileReginfoVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.basic.WlFileReginfoDao#wlFileReginfoVOToEntity(com.logistics.entity.basic.WlFileReginfoVO, com.logistics.entity.basic.WlFileReginfo)
     */
    public void wlFileReginfoVOToEntity(
        com.logistics.entity.basic.WlFileReginfoVO source,
        com.logistics.entity.basic.WlFileReginfo target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wlFileReginfoVOToEntity
        super.wlFileReginfoVOToEntity(source, target, copyIfNull);
    }

}