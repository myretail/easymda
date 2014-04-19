// license-header java merge-point
package com.demo.entity.order.crud;

public final class carManageableServiceBase
    implements carManageableService
{
    private com.demo.entity.order.crud.carManageableDao dao;

    public void setDao(com.demo.entity.order.crud.carManageableDao dao)
    {
        this.dao = dao;
    }

    protected com.demo.entity.order.crud.carManageableDao getDao()
    {
        return this.dao;
    }

    public com.demo.entity.order.crud.carValueObject create(double load, java.lang.Long id)
        throws Exception
    {
        return toValueObject(dao.create(load, id));
    }

    public com.demo.entity.order.crud.carValueObject readById(java.lang.Long id)
        throws Exception
    {
        return toValueObject(dao.readById(id));
    }

    public java.util.List read(double load, java.lang.Long id)
        throws Exception
    {
        return toValueObjects(dao.read(load, id));
    }

    public java.util.List readAll()
        throws Exception
    {
        return toValueObjects(dao.readAll());
    }

    public com.demo.entity.order.crud.carValueObject update(double load, java.lang.Long id)
        throws Exception
    {
        if (id == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.carManageableService.update(double load, java.lang.Long id) - 'id' can not be null");
        }

        return toValueObject(dao.update(load, id));
    }

    public void delete(java.lang.Long[] ids)
        throws Exception
    {
        if (ids == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.carManageableService.delete(java.lang.Long[] ids) - 'ids' can not be null");
        }

        dao.delete(ids);
    }


    private static java.util.List toValueObjects(java.util.Collection entities)
    {
        final java.util.List list = new java.util.ArrayList();

        for (java.util.Iterator iterator = entities.iterator(); iterator.hasNext();)
        {
            list.add(toValueObject((com.demo.entity.order.car)iterator.next()));
        }

        return list;
    }

    private static com.demo.entity.order.crud.carValueObject toValueObject(com.demo.entity.order.car entity)
    {
        final com.demo.entity.order.crud.carValueObject valueObject = new com.demo.entity.order.crud.carValueObject();

        valueObject.setLoad(entity.getLoad());
        valueObject.setId(entity.getId());

        return valueObject;
    }
}
