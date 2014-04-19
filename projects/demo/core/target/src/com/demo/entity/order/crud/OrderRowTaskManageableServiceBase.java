// license-header java merge-point
package com.demo.entity.order.crud;

public final class OrderRowTaskManageableServiceBase
    implements OrderRowTaskManageableService
{
    private com.demo.entity.order.crud.OrderRowTaskManageableDao dao;

    public void setDao(com.demo.entity.order.crud.OrderRowTaskManageableDao dao)
    {
        this.dao = dao;
    }

    protected com.demo.entity.order.crud.OrderRowTaskManageableDao getDao()
    {
        return this.dao;
    }

    public com.demo.entity.order.crud.OrderRowTaskValueObject create(java.lang.Long id, java.lang.Long orderRow, java.lang.Long task)
        throws Exception
    {
        if (orderRow == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.OrderRowTaskManageableService.create(java.lang.Long id, java.lang.Long orderRow, java.lang.Long task) - 'orderRow' can not be null");
        }

        if (task == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.OrderRowTaskManageableService.create(java.lang.Long id, java.lang.Long orderRow, java.lang.Long task) - 'task' can not be null");
        }

        return toValueObject(dao.create(id, orderRow, task));
    }

    public com.demo.entity.order.crud.OrderRowTaskValueObject readById(java.lang.Long id)
        throws Exception
    {
        return toValueObject(dao.readById(id));
    }

    public java.util.List read(java.lang.Long id, java.lang.Long orderRow, java.lang.Long task)
        throws Exception
    {
        return toValueObjects(dao.read(id, orderRow, task));
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

    public com.demo.entity.order.crud.OrderRowTaskValueObject update(java.lang.Long id, java.lang.Long orderRow, java.lang.Long task)
        throws Exception
    {
        if (id == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.OrderRowTaskManageableService.update(java.lang.Long id, java.lang.Long orderRow, java.lang.Long task) - 'id' can not be null");
        }

        if (orderRow == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.OrderRowTaskManageableService.update(java.lang.Long id, java.lang.Long orderRow, java.lang.Long task) - 'orderRow' can not be null");
        }

        if (task == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.OrderRowTaskManageableService.update(java.lang.Long id, java.lang.Long orderRow, java.lang.Long task) - 'task' can not be null");
        }

        return toValueObject(dao.update(id, orderRow, task));
    }

    public void delete(java.lang.Long[] ids)
        throws Exception
    {
        if (ids == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.OrderRowTaskManageableService.delete(java.lang.Long[] ids) - 'ids' can not be null");
        }

        dao.delete(ids);
    }


    private static java.util.List toValueObjects(java.util.Collection entities)
    {
        final java.util.List list = new java.util.ArrayList();

        for (java.util.Iterator iterator = entities.iterator(); iterator.hasNext();)
        {
            list.add(toValueObject((com.demo.entity.order.OrderRowTask)iterator.next()));
        }

        return list;
    }

    private static com.demo.entity.order.crud.OrderRowTaskValueObject toValueObject(com.demo.entity.order.OrderRowTask entity)
    {
        final com.demo.entity.order.crud.OrderRowTaskValueObject valueObject = new com.demo.entity.order.crud.OrderRowTaskValueObject();

        valueObject.setId(entity.getId());

        final com.demo.entity.order.OrderRowd orderRow = entity.getOrderRow();
        if (orderRow != null)
        {
            valueObject.setOrderRow(orderRow.getId());
        }

        final com.demo.entity.order.Task task = entity.getTask();
        if (task != null)
        {
            valueObject.setTask(task.getId());
        }

        return valueObject;
    }
}
