// license-header java merge-point
package com.demo.entity.order.crud;

public interface TaskFormManageableService
{
    public com.demo.entity.order.crud.TaskFormValueObject create(java.util.Date setDate, java.lang.String formState, java.lang.String remark, java.lang.Long id, java.lang.Long[] tasks, java.lang.Long car)
        throws Exception;

    public com.demo.entity.order.crud.TaskFormValueObject readById(java.lang.Long id)
        throws Exception;

    public java.util.List read(java.util.Date setDate, java.lang.String formState, java.lang.String remark, java.lang.Long id, java.lang.Long[] tasks, java.lang.Long car)
        throws Exception;

    public java.util.List readAll()
        throws Exception;

    public java.util.Map readBackingLists()
        throws Exception;

    public com.demo.entity.order.crud.TaskFormValueObject update(java.util.Date setDate, java.lang.String formState, java.lang.String remark, java.lang.Long id, java.lang.Long[] tasks, java.lang.Long car)
        throws Exception;

    public void delete(java.lang.Long[] ids)
        throws Exception;

}
