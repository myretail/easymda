// license-header java merge-point
package com.demo.entity.order.crud;

public interface TaskFormManageableDao
{
    public com.demo.entity.order.TaskForm create(java.util.Date setDate, java.lang.String formState, java.lang.String remark, java.lang.Long id, java.lang.Long[] tasks, java.lang.Long car);

    public com.demo.entity.order.TaskForm readById(java.lang.Long id);

    public java.util.List read(java.util.Date setDate, java.lang.String formState, java.lang.String remark, java.lang.Long id, java.lang.Long[] tasks, java.lang.Long car);

    public java.util.List readAll();

    public java.util.Map readBackingLists();

    public com.demo.entity.order.TaskForm update(java.util.Date setDate, java.lang.String formState, java.lang.String remark, java.lang.Long id, java.lang.Long[] tasks, java.lang.Long car);

    public void delete(java.lang.Long[] ids);

}