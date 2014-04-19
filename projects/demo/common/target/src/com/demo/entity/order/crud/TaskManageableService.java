// license-header java merge-point
package com.demo.entity.order.crud;

public interface TaskManageableService
{
    public com.demo.entity.order.crud.TaskValueObject create(double num, double volumne, java.lang.String remark, java.lang.Long id, java.lang.Long taskForm)
        throws Exception;

    public com.demo.entity.order.crud.TaskValueObject readById(java.lang.Long id)
        throws Exception;

    public java.util.List read(double num, double volumne, java.lang.String remark, java.lang.Long id, java.lang.Long taskForm)
        throws Exception;

    public java.util.List readAll()
        throws Exception;

    public java.util.Map readBackingLists()
        throws Exception;

    public com.demo.entity.order.crud.TaskValueObject update(double num, double volumne, java.lang.String remark, java.lang.Long id, java.lang.Long taskForm)
        throws Exception;

    public void delete(java.lang.Long[] ids)
        throws Exception;

}
