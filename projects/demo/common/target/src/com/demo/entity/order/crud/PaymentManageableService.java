// license-header java merge-point
package com.demo.entity.order.crud;

public interface PaymentManageableService
{
    public com.demo.entity.order.crud.PaymentValueObject create(java.lang.String newAttr1, java.lang.String newAttr2, java.lang.Long id, java.lang.Long payment)
        throws Exception;

    public com.demo.entity.order.crud.PaymentValueObject readById(java.lang.Long id)
        throws Exception;

    public java.util.List read(java.lang.String newAttr1, java.lang.String newAttr2, java.lang.Long id, java.lang.Long payment)
        throws Exception;

    public java.util.List readAll()
        throws Exception;

    public java.util.Map readBackingLists()
        throws Exception;

    public com.demo.entity.order.crud.PaymentValueObject update(java.lang.String newAttr1, java.lang.String newAttr2, java.lang.Long id, java.lang.Long payment)
        throws Exception;

    public void delete(java.lang.Long[] ids)
        throws Exception;

}
