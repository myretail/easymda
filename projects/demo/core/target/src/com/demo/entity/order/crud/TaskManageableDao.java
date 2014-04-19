// license-header java merge-point
package com.demo.entity.order.crud;

public interface TaskManageableDao
{
    public com.demo.entity.order.Task create(double num, double volumne, java.lang.String remark, java.lang.Long id, java.lang.Long taskForm);

    public com.demo.entity.order.Task readById(java.lang.Long id);

    public java.util.List read(double num, double volumne, java.lang.String remark, java.lang.Long id, java.lang.Long taskForm);

    public java.util.List readAll();

    public java.util.Map readBackingLists();

    public com.demo.entity.order.Task update(double num, double volumne, java.lang.String remark, java.lang.Long id, java.lang.Long taskForm);

    public void delete(java.lang.Long[] ids);

}