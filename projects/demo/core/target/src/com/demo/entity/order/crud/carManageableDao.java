// license-header java merge-point
package com.demo.entity.order.crud;

public interface carManageableDao
{
    public com.demo.entity.order.car create(double load, java.lang.Long id);

    public com.demo.entity.order.car readById(java.lang.Long id);

    public java.util.List read(double load, java.lang.Long id);

    public java.util.List readAll();

    public com.demo.entity.order.car update(double load, java.lang.Long id);

    public void delete(java.lang.Long[] ids);

}