// license-header java merge-point
package com.demo.entity.basic.crud;

public interface EnumerationManageableService
{
    public com.demo.entity.basic.crud.EnumerationValueObject create(java.lang.String fieldName, java.lang.String enumerationType, java.lang.Long id)
        throws Exception;

    public com.demo.entity.basic.crud.EnumerationValueObject readById(java.lang.Long id)
        throws Exception;

    public java.util.List read(java.lang.String fieldName, java.lang.String enumerationType, java.lang.Long id)
        throws Exception;

    public java.util.List readAll()
        throws Exception;

    public com.demo.entity.basic.crud.EnumerationValueObject update(java.lang.String fieldName, java.lang.String enumerationType, java.lang.Long id)
        throws Exception;

    public void delete(java.lang.Long[] ids)
        throws Exception;

}
