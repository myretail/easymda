// license-header java merge-point
package com.demo.entity.basic.crud;

public interface CustomerManageableService
{
    public com.demo.entity.basic.crud.CustomerValueObject create(java.lang.String customerName, java.lang.String custEnum, java.lang.Long id)
        throws Exception;

    public com.demo.entity.basic.crud.CustomerValueObject readById(java.lang.Long id)
        throws Exception;

    public java.util.List read(java.lang.String customerName, java.lang.String custEnum, java.lang.Long id)
        throws Exception;

    public java.util.List readAll()
        throws Exception;

    public com.demo.entity.basic.crud.CustomerValueObject update(java.lang.String customerName, java.lang.String custEnum, java.lang.Long id)
        throws Exception;

    public void delete(java.lang.Long[] ids)
        throws Exception;

}
