// license-header java merge-point
package com.demo.entity.order.crud;

public interface carManageableService
{
    public com.demo.entity.order.crud.carValueObject create(double load, java.lang.Long id)
        throws Exception;

    public com.demo.entity.order.crud.carValueObject readById(java.lang.Long id)
        throws Exception;

    public java.util.List read(double load, java.lang.Long id)
        throws Exception;

    public java.util.List readAll()
        throws Exception;

    public com.demo.entity.order.crud.carValueObject update(double load, java.lang.Long id)
        throws Exception;

    public void delete(java.lang.Long[] ids)
        throws Exception;

}
