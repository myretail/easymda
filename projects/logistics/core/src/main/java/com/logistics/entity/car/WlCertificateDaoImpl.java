// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.entity.car;
/**
 * @see com.logistics.entity.car.WlCertificate
 */
public class WlCertificateDaoImpl
    extends com.logistics.entity.car.WlCertificateDaoBase
{
    /**
     * @see com.logistics.entity.car.WlCertificateDao#toWlCertificateVO(com.logistics.entity.car.WlCertificate, com.logistics.entity.car.WlCertificateVO)
     */
    public void toWlCertificateVO(
        com.logistics.entity.car.WlCertificate source,
        com.logistics.entity.car.WlCertificateVO target)
    {
        // @todo verify behavior of toWlCertificateVO
        super.toWlCertificateVO(source, target);
        // WARNING! No conversion for target.availDate (can't convert source.getAvailDate():java.util.Date to java.util.Date
    }


    /**
     * @see com.logistics.entity.car.WlCertificateDao#toWlCertificateVO(com.logistics.entity.car.WlCertificate)
     */
    public com.logistics.entity.car.WlCertificateVO toWlCertificateVO(final com.logistics.entity.car.WlCertificate entity)
    {
        // @todo verify behavior of toWlCertificateVO
        return super.toWlCertificateVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.car.WlCertificate loadWlCertificateFromWlCertificateVO(com.logistics.entity.car.WlCertificateVO wlCertificateVO)
    {
        // @todo implement loadWlCertificateFromWlCertificateVO
        throw new java.lang.UnsupportedOperationException("com.logistics.entity.car.loadWlCertificateFromWlCertificateVO(com.logistics.entity.car.WlCertificateVO) not yet implemented.");

        /* A typical implementation looks like this:
        com.logistics.entity.car.WlCertificate wlCertificate = this.load(wlCertificateVO.getId());
        if (wlCertificate == null)
        {
            wlCertificate = com.logistics.entity.car.WlCertificate.Factory.newInstance();
        }
        return wlCertificate;
        */
    }

    
    /**
     * @see com.logistics.entity.car.WlCertificateDao#wlCertificateVOToEntity(com.logistics.entity.car.WlCertificateVO)
     */
    public com.logistics.entity.car.WlCertificate wlCertificateVOToEntity(com.logistics.entity.car.WlCertificateVO wlCertificateVO)
    {
        // @todo verify behavior of wlCertificateVOToEntity
        com.logistics.entity.car.WlCertificate entity = this.loadWlCertificateFromWlCertificateVO(wlCertificateVO);
        this.wlCertificateVOToEntity(wlCertificateVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.car.WlCertificateDao#wlCertificateVOToEntity(com.logistics.entity.car.WlCertificateVO, com.logistics.entity.car.WlCertificate)
     */
    public void wlCertificateVOToEntity(
        com.logistics.entity.car.WlCertificateVO source,
        com.logistics.entity.car.WlCertificate target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wlCertificateVOToEntity
        super.wlCertificateVOToEntity(source, target, copyIfNull);
        // No conversion for target.availDate (can't convert source.getAvailDate():java.util.Date to java.util.Date
    }

}