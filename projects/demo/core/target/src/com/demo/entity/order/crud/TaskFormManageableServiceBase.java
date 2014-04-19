// license-header java merge-point
package com.demo.entity.order.crud;

public final class TaskFormManageableServiceBase
    implements TaskFormManageableService
{
    private com.demo.entity.order.crud.TaskFormManageableDao dao;

    public void setDao(com.demo.entity.order.crud.TaskFormManageableDao dao)
    {
        this.dao = dao;
    }

    protected com.demo.entity.order.crud.TaskFormManageableDao getDao()
    {
        return this.dao;
    }

    public com.demo.entity.order.crud.TaskFormValueObject create(java.util.Date setDate, java.lang.String formState, java.lang.String remark, java.lang.Long id, java.lang.Long[] tasks, java.lang.Long car)
        throws Exception
    {
        if (setDate == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.TaskFormManageableService.create(java.util.Date setDate, java.lang.String formState, java.lang.String remark, java.lang.Long id, java.lang.Long[] tasks, java.lang.Long car) - 'setDate' can not be null");
        }

        if (formState == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.TaskFormManageableService.create(java.util.Date setDate, java.lang.String formState, java.lang.String remark, java.lang.Long id, java.lang.Long[] tasks, java.lang.Long car) - 'formState' can not be null");
        }

        if (car == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.TaskFormManageableService.create(java.util.Date setDate, java.lang.String formState, java.lang.String remark, java.lang.Long id, java.lang.Long[] tasks, java.lang.Long car) - 'car' can not be null");
        }

        return toValueObject(dao.create(setDate, formState, remark, id, tasks, car));
    }

    public com.demo.entity.order.crud.TaskFormValueObject readById(java.lang.Long id)
        throws Exception
    {
        return toValueObject(dao.readById(id));
    }

    public java.util.List read(java.util.Date setDate, java.lang.String formState, java.lang.String remark, java.lang.Long id, java.lang.Long[] tasks, java.lang.Long car)
        throws Exception
    {
        return toValueObjects(dao.read(setDate, formState, remark, id, tasks, car));
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

    public com.demo.entity.order.crud.TaskFormValueObject update(java.util.Date setDate, java.lang.String formState, java.lang.String remark, java.lang.Long id, java.lang.Long[] tasks, java.lang.Long car)
        throws Exception
    {
        if (setDate == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.TaskFormManageableService.update(java.util.Date setDate, java.lang.String formState, java.lang.String remark, java.lang.Long id, java.lang.Long[] tasks, java.lang.Long car) - 'setDate' can not be null");
        }

        if (formState == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.TaskFormManageableService.update(java.util.Date setDate, java.lang.String formState, java.lang.String remark, java.lang.Long id, java.lang.Long[] tasks, java.lang.Long car) - 'formState' can not be null");
        }

        if (id == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.TaskFormManageableService.update(java.util.Date setDate, java.lang.String formState, java.lang.String remark, java.lang.Long id, java.lang.Long[] tasks, java.lang.Long car) - 'id' can not be null");
        }

        if (car == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.TaskFormManageableService.update(java.util.Date setDate, java.lang.String formState, java.lang.String remark, java.lang.Long id, java.lang.Long[] tasks, java.lang.Long car) - 'car' can not be null");
        }

        return toValueObject(dao.update(setDate, formState, remark, id, tasks, car));
    }

    public void delete(java.lang.Long[] ids)
        throws Exception
    {
        if (ids == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.TaskFormManageableService.delete(java.lang.Long[] ids) - 'ids' can not be null");
        }

        dao.delete(ids);
    }


    private static java.util.List toValueObjects(java.util.Collection entities)
    {
        final java.util.List list = new java.util.ArrayList();

        for (java.util.Iterator iterator = entities.iterator(); iterator.hasNext();)
        {
            list.add(toValueObject((com.demo.entity.order.TaskForm)iterator.next()));
        }

        return list;
    }

    private static com.demo.entity.order.crud.TaskFormValueObject toValueObject(com.demo.entity.order.TaskForm entity)
    {
        final com.demo.entity.order.crud.TaskFormValueObject valueObject = new com.demo.entity.order.crud.TaskFormValueObject();

        valueObject.setSetDate(entity.getSetDate());
        valueObject.setFormState(entity.getFormState());
        valueObject.setRemark(entity.getRemark());
        valueObject.setId(entity.getId());

        final java.util.Collection tasks = entity.getTasks();
        if (tasks == null || tasks.isEmpty())
        {
            valueObject.setTasks(null);
        }
        else
        {
            final java.lang.Long[] values = new java.lang.Long[tasks.size()];
            int counter = 0;
            for (final java.util.Iterator iterator = tasks.iterator(); iterator.hasNext();counter++)
            {
                final com.demo.entity.order.Task element = (com.demo.entity.order.Task)iterator.next();
                values[counter] = element.getId();
            }
            valueObject.setTasks(values);
        }

        final com.demo.entity.order.car car = entity.getCar();
        if (car != null)
        {
            valueObject.setCar(car.getId());
        }

        return valueObject;
    }
}
