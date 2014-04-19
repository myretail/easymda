// license-header java merge-point
package com.demo.entity.order.crud;

public interface OrderRowTaskManageableService
{
    public com.demo.entity.order.crud.OrderRowTaskValueObject create(java.lang.Long id, java.lang.Long orderRow, java.lang.Long task)
        throws Exception;

    public com.demo.entity.order.crud.OrderRowTaskValueObject readById(java.lang.Long id)
        throws Exception;

    public java.util.List read(java.lang.Long id, java.lang.Long orderRow, java.lang.Long task)
        throws Exception;

    public java.util.List readAll()
        throws Exception;

    public java.util.Map readBackingLists()
        throws Exception;

    public com.demo.entity.order.crud.OrderRowTaskValueObject update(java.lang.Long id, java.lang.Long orderRow, java.lang.Long task)
        throws Exception;

    public void delete(java.lang.Long[] ids)
        throws Exception;

}
