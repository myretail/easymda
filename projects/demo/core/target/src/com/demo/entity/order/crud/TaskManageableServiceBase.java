// license-header java merge-point
package com.demo.entity.order.crud;

public final class TaskManageableServiceBase
    implements TaskManageableService
{
    private com.demo.entity.order.crud.TaskManageableDao dao;

    public void setDao(com.demo.entity.order.crud.TaskManageableDao dao)
    {
        this.dao = dao;
    }

    protected com.demo.entity.order.crud.TaskManageableDao getDao()
    {
        return this.dao;
    }

    public com.demo.entity.order.crud.TaskValueObject create(double num, double volumne, java.lang.String remark, java.lang.Long id, java.lang.Long taskForm)
        throws Exception
    {
        if (taskForm == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.TaskManageableService.create(double num, double volumne, java.lang.String remark, java.lang.Long id, java.lang.Long taskForm) - 'taskForm' can not be null");
        }

        return toValueObject(dao.create(num, volumne, remark, id, taskForm));
    }

    public com.demo.entity.order.crud.TaskValueObject readById(java.lang.Long id)
        throws Exception
    {
        return toValueObject(dao.readById(id));
    }

    public java.util.List read(double num, double volumne, java.lang.String remark, java.lang.Long id, java.lang.Long taskForm)
        throws Exception
    {
        return toValueObjects(dao.read(num, volumne, remark, id, taskForm));
    }

    public java.util.List readAll()
        throws Exception
    {
        return toValueObjects(dao.readAll());
    }

    public java.util.Map readBackingLists()
        throws Exception
    {
        return getDao().readBackingLists();
    }

    public com.demo.entity.order.crud.TaskValueObject update(double num, double volumne, java.lang.String remark, java.lang.Long id, java.lang.Long taskForm)
        throws Exception
    {
        if (id == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.TaskManageableService.update(double num, double volumne, java.lang.String remark, java.lang.Long id, java.lang.Long taskForm) - 'id' can not be null");
        }

        if (taskForm == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.TaskManageableService.update(double num, double volumne, java.lang.String remark, java.lang.Long id, java.lang.Long taskForm) - 'taskForm' can not be null");
        }

        return toValueObject(dao.update(num, volumne, remark, id, taskForm));
    }

    public void delete(java.lang.Long[] ids)
        throws Exception
    {
        if (ids == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.TaskManageableService.delete(java.lang.Long[] ids) - 'ids' can not be null");
        }

        dao.delete(ids);
    }


    private static java.util.List toValueObjects(java.util.Collection entities)
    {
        final java.util.List list = new java.util.ArrayList();

        for (java.util.Iterator iterator = entities.iterator(); iterator.hasNext();)
        {
            list.add(toValueObject((com.demo.entity.order.Task)iterator.next()));
        }

        return list;
    }

    private static com.demo.entity.order.crud.TaskValueObject toValueObject(com.demo.entity.order.Task entity)
    {
        final com.demo.entity.order.crud.TaskValueObject valueObject = new com.demo.entity.order.crud.TaskValueObject();

        valueObject.setNum(entity.getNum());
        valueObject.setVolumne(entity.getVolumne());
        valueObject.setRemark(entity.getRemark());
        valueObject.setId(entity.getId());

        final com.demo.entity.order.TaskForm taskForm = entity.getTaskForm();
        if (taskForm != null)
        {
            valueObject.setTaskForm(taskForm.getId());
        }

        return valueObject;
    }
}
