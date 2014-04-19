// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.entity.cost;
/**
 * @see com.logistics.entity.cost.WlInsurance
 */
public class WlInsuranceDaoImpl
    extends com.logistics.entity.cost.WlInsuranceDaoBase
{
    /**
     * @see com.logistics.entity.cost.WlInsuranceDao#toWlInsuranceVO(com.logistics.entity.cost.WlInsurance, com.logistics.entity.cost.WlInsuranceVO)
     */
    public void toWlInsuranceVO(
        com.logistics.entity.cost.WlInsurance source,
        com.logistics.entity.cost.WlInsuranceVO target)
    {
        // @todo verify behavior of toWlInsuranceVO
        super.toWlInsuranceVO(source, target);
        // WARNING! No conversion for target.acceptDate (can't convert source.getAcceptDate():java.util.Date to java.util.Date
        // WARNING! No conversion for target.startDate (can't convert source.getStartDate():java.util.Date to java.util.Date
        // WARNING! No conversion for target.endDate (can't convert source.getEndDate():java.util.Date to java.util.Date
    }


    /**
     * @see com.logistics.entity.cost.WlInsuranceDao#toWlInsuranceVO(com.logistics.entity.cost.WlInsurance)
     */
    public com.logistics.entity.cost.WlInsuranceVO toWlInsuranceVO(final com.logistics.entity.cost.WlInsurance entity)
    {
        // @todo verify behavior of toWlInsuranceVO
        return super.toWlInsuranceVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.cost.WlInsurance loadWlInsuranceFromWlInsuranceVO(com.logistics.entity.cost.WlInsuranceVO wlInsuranceVO)
    {
        // @todo implement loadWlInsuranceFromWlInsuranceVO
        throw new java.lang.UnsupportedOperationException("com.logistics.entity.cost.loadWlInsuranceFromWlInsuranceVO(com.logistics.entity.cost.WlInsuranceVO) not yet implemented.");

        /* A typical implementation looks like this:
        com.logistics.entity.cost.WlInsurance wlInsurance = this.load(wlInsuranceVO.getId());
        if (wlInsurance == null)
        {
            wlInsurance = com.logistics.entity.cost.WlInsurance.Factory.newInstance();
        }
        return wlInsurance;
        */
    }

    
    /**
     * @see com.logistics.entity.cost.WlInsuranceDao#wlInsuranceVOToEntity(com.logistics.entity.cost.WlInsuranceVO)
     */
    public com.logistics.entity.cost.WlInsurance wlInsuranceVOToEntity(com.logistics.entity.cost.WlInsuranceVO wlInsuranceVO)
    {
        // @todo verify behavior of wlInsuranceVOToEntity
        com.logistics.entity.cost.WlInsurance entity = this.loadWlInsuranceFromWlInsuranceVO(wlInsuranceVO);
        this.wlInsuranceVOToEntity(wlInsuranceVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.cost.WlInsuranceDao#wlInsuranceVOToEntity(com.logistics.entity.cost.WlInsuranceVO, com.logistics.entity.cost.WlInsurance)
     */
    public void wlInsuranceVOToEntity(
        com.logistics.entity.cost.WlInsuranceVO source,
        com.logistics.entity.cost.WlInsurance target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wlInsuranceVOToEntity
        super.wlInsuranceVOToEntity(source, target, copyIfNull);
        // No conversion for target.acceptDate (can't convert source.getAcceptDate():java.util.Date to java.util.Date
        // No conversion for target.startDate (can't convert source.getStartDate():java.util.Date to java.util.Date
        // No conversion for target.endDate (can't convert source.getEndDate():java.util.Date to java.util.Date
    }

}