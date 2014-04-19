// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.entity.car;
/**
 * @see com.logistics.entity.car.WlRepairRow
 */
public class WlRepairRowDaoImpl
    extends com.logistics.entity.car.WlRepairRowDaoBase
{
    /**
     * @see com.logistics.entity.car.WlRepairRowDao#toWlRepairRowVO(com.logistics.entity.car.WlRepairRow, com.logistics.entity.car.WlRepairRowVO)
     */
    public void toWlRepairRowVO(
        com.logistics.entity.car.WlRepairRow source,
        com.logistics.entity.car.WlRepairRowVO target)
    {
        // @todo verify behavior of toWlRepairRowVO
        super.toWlRepairRowVO(source, target);
        // WARNING! No conversion for target.fillPeople (can't convert source.getFillPeople():com.logistics.entity.orga.People to long
        // WARNING! No conversion for target.fillDate (can't convert source.getFillDate():java.util.Date to java.util.Date
        // WARNING! No conversion for target.repairMan (can't convert source.getRepairMan():com.logistics.entity.orga.People to long
        // WARNING! No conversion for target.repairCustomer (can't convert source.getRepairCustomer():com.logistics.entity.customer.WlCustomer to long
        // WARNING! No conversion for target.startDate (can't convert source.getStartDate():double to java.util.Date
        // WARNING! No conversion for target.endDate (can't convert source.getEndDate():java.util.Date to java.util.Date
        // WARNING! No conversion for target.checker (can't convert source.getChecker():com.logistics.entity.orga.People to long
        // WARNING! No conversion for target.place (can't convert source.getPlace():com.logistics.entity.basic.WlPlace to long
    }


    /**
     * @see com.logistics.entity.car.WlRepairRowDao#toWlRepairRowVO(com.logistics.entity.car.WlRepairRow)
     */
    public com.logistics.entity.car.WlRepairRowVO toWlRepairRowVO(final com.logistics.entity.car.WlRepairRow entity)
    {
        // @todo verify behavior of toWlRepairRowVO
        return super.toWlRepairRowVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.car.WlRepairRow loadWlRepairRowFromWlRepairRowVO(com.logistics.entity.car.WlRepairRowVO wlRepairRowVO)
    {
        // @todo implement loadWlRepairRowFromWlRepairRowVO
        throw new java.lang.UnsupportedOperationException("com.logistics.entity.car.loadWlRepairRowFromWlRepairRowVO(com.logistics.entity.car.WlRepairRowVO) not yet implemented.");

        /* A typical implementation looks like this:
        com.logistics.entity.car.WlRepairRow wlRepairRow = this.load(wlRepairRowVO.getId());
        if (wlRepairRow == null)
        {
            wlRepairRow = com.logistics.entity.car.WlRepairRow.Factory.newInstance();
        }
        return wlRepairRow;
        */
    }

    
    /**
     * @see com.logistics.entity.car.WlRepairRowDao#wlRepairRowVOToEntity(com.logistics.entity.car.WlRepairRowVO)
     */
    public com.logistics.entity.car.WlRepairRow wlRepairRowVOToEntity(com.logistics.entity.car.WlRepairRowVO wlRepairRowVO)
    {
        // @todo verify behavior of wlRepairRowVOToEntity
        com.logistics.entity.car.WlRepairRow entity = this.loadWlRepairRowFromWlRepairRowVO(wlRepairRowVO);
        this.wlRepairRowVOToEntity(wlRepairRowVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.car.WlRepairRowDao#wlRepairRowVOToEntity(com.logistics.entity.car.WlRepairRowVO, com.logistics.entity.car.WlRepairRow)
     */
    public void wlRepairRowVOToEntity(
        com.logistics.entity.car.WlRepairRowVO source,
        com.logistics.entity.car.WlRepairRow target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wlRepairRowVOToEntity
        super.wlRepairRowVOToEntity(source, target, copyIfNull);
        // No conversion for target.fillDate (can't convert source.getFillDate():java.util.Date to java.util.Date
        // No conversion for target.startDate (can't convert source.getStartDate():java.util.Date to double
        // No conversion for target.endDate (can't convert source.getEndDate():java.util.Date to java.util.Date
    }

}