// license-header java merge-point
package com.demo.entity.order.crud;

public interface OrderdManageableService
{
    public com.demo.entity.order.crud.OrderdValueObject create(java.lang.String customerOrderNo, java.lang.String contractNo, java.lang.String conveyanceEnum, java.lang.String carryTypeEnum, java.lang.String shipperRemark, java.lang.String carrierRemark, java.lang.String levelEnum, java.lang.String customerTypeEnum, java.util.Date referTime, java.lang.String linkMan, java.lang.String tel, java.util.Date bookTime, java.util.Date completeTime, java.lang.String remark, java.lang.Long id, java.lang.Long[] orderRow, java.lang.Long customer)
        throws Exception;

    public com.demo.entity.order.crud.OrderdValueObject readById(java.lang.Long id)
        throws Exception;

    public java.util.List read(java.lang.String customerOrderNo, java.lang.String contractNo, java.lang.String conveyanceEnum, java.lang.String carryTypeEnum, java.lang.String shipperRemark, java.lang.String carrierRemark, java.lang.String levelEnum, java.lang.String customerTypeEnum, java.util.Date referTime, java.lang.String linkMan, java.lang.String tel, java.util.Date bookTime, java.util.Date completeTime, java.lang.String remark, java.lang.Long id, java.lang.Long[] orderRow, java.lang.Long customer)
        throws Exception;

    public java.util.List readAll()
        throws Exception;

    public java.util.Map readBackingLists()
        throws Exception;

    public com.demo.entity.order.crud.OrderdValueObject update(java.lang.String customerOrderNo, java.lang.String contractNo, java.lang.String conveyanceEnum, java.lang.String carryTypeEnum, java.lang.String shipperRemark, java.lang.String carrierRemark, java.lang.String levelEnum, java.lang.String customerTypeEnum, java.util.Date referTime, java.lang.String linkMan, java.lang.String tel, java.util.Date bookTime, java.util.Date completeTime, java.lang.String remark, java.lang.Long id, java.lang.Long[] orderRow, java.lang.Long customer)
        throws Exception;

    public void delete(java.lang.Long[] ids)
        throws Exception;

}
