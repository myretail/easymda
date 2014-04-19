// license-header java merge-point
package com.demo.entity.order.crud;

public interface PaymentManageableDao
{
    public com.demo.entity.order.Payment create(java.lang.String newAttr1, java.lang.String newAttr2, java.lang.Long id, java.lang.Long payment);

    public com.demo.entity.order.Payment readById(java.lang.Long id);

    public java.util.List read(java.lang.String newAttr1, java.lang.String newAttr2, java.lang.Long id, java.lang.Long payment);

    public java.util.List readAll();

    public java.util.Map readBackingLists();

    public com.demo.entity.order.Payment update(java.lang.String newAttr1, java.lang.String newAttr2, java.lang.Long id, java.lang.Long payment);

    public void delete(java.lang.Long[] ids);

}