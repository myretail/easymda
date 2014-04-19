// license-header java merge-point
package com.demo.entity.basic.crud;

public interface CustomerManageableDao
{
    public com.demo.entity.basic.Customer create(java.lang.String customerName, java.lang.String custEnum, java.lang.Long id);

    public com.demo.entity.basic.Customer readById(java.lang.Long id);

    public java.util.List read(java.lang.String customerName, java.lang.String custEnum, java.lang.Long id);

    public java.util.List readAll();

    public com.demo.entity.basic.Customer update(java.lang.String customerName, java.lang.String custEnum, java.lang.Long id);

    public void delete(java.lang.Long[] ids);

}