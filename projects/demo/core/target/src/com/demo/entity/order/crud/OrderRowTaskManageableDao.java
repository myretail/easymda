// license-header java merge-point
package com.demo.entity.order.crud;

public interface OrderRowTaskManageableDao
{
    public com.demo.entity.order.OrderRowTask create(java.lang.Long id, java.lang.Long orderRow, java.lang.Long task);

    public com.demo.entity.order.OrderRowTask readById(java.lang.Long id);

    public java.util.List read(java.lang.Long id, java.lang.Long orderRow, java.lang.Long task);

    public java.util.List readAll();

    public java.util.Map readBackingLists();

    public com.demo.entity.order.OrderRowTask update(java.lang.Long id, java.lang.Long orderRow, java.lang.Long task);

    public void delete(java.lang.Long[] ids);

}