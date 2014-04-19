// license-header java merge-point
package com.demo.entity.basic.crud;

public interface EnumerationManageableDao
{
    public com.demo.entity.basic.Enumeration create(java.lang.String fieldName, java.lang.String enumerationType, java.lang.Long id);

    public com.demo.entity.basic.Enumeration readById(java.lang.Long id);

    public java.util.List read(java.lang.String fieldName, java.lang.String enumerationType, java.lang.Long id);

    public java.util.List readAll();

    public com.demo.entity.basic.Enumeration update(java.lang.String fieldName, java.lang.String enumerationType, java.lang.Long id);

    public void delete(java.lang.Long[] ids);

}