// license-header java merge-point
package com.demo.entity.basic.crud;

public final class CustomerManageableServiceBase
    implements CustomerManageableService
{
    private com.demo.entity.basic.crud.CustomerManageableDao dao;

    public void setDao(com.demo.entity.basic.crud.CustomerManageableDao dao)
    {
        this.dao = dao;
    }

    protected com.demo.entity.basic.crud.CustomerManageableDao getDao()
    {
        return this.dao;
    }

    public com.demo.entity.basic.crud.CustomerValueObject create(java.lang.String customerName, java.lang.String custEnum, java.lang.Long id)
        throws Exception
    {
        if (customerName == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.basic.crud.CustomerManageableService.create(java.lang.String customerName, java.lang.String custEnum, java.lang.Long id) - 'customerName' can not be null");
        }

        if (custEnum == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.basic.crud.CustomerManageableService.create(java.lang.String customerName, java.lang.String custEnum, java.lang.Long id) - 'custEnum' can not be null");
        }

        return toValueObject(dao.create(customerName, custEnum, id));
    }

    public com.demo.entity.basic.crud.CustomerValueObject readById(java.lang.Long id)
        throws Exception
    {
        return toValueObject(dao.readById(id));
    }

    public java.util.List read(java.lang.String customerName, java.lang.String custEnum, java.lang.Long id)
        throws Exception
    {
        return toValueObjects(dao.read(customerName, custEnum, id));
    }

    public java.util.List readAll()
        throws Exception
    {
        return toValueObjects(dao.readAll());
    }

    public com.demo.entity.basic.crud.CustomerValueObject update(java.lang.String customerName, java.lang.String custEnum, java.lang.Long id)
        throws Exception
    {
        if (customerName == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.basic.crud.CustomerManageableService.update(java.lang.String customerName, java.lang.String custEnum, java.lang.Long id) - 'customerName' can not be null");
        }

        if (custEnum == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.basic.crud.CustomerManageableService.update(java.lang.String customerName, java.lang.String custEnum, java.lang.Long id) - 'custEnum' can not be null");
        }

        if (id == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.basic.crud.CustomerManageableService.update(java.lang.String customerName, java.lang.String custEnum, java.lang.Long id) - 'id' can not be null");
        }

        return toValueObject(dao.update(customerName, custEnum, id));
    }

    public void delete(java.lang.Long[] ids)
        throws Exception
    {
        if (ids == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.basic.crud.CustomerManageableService.delete(java.lang.Long[] ids) - 'ids' can not be null");
        }

        dao.delete(ids);
    }


    private static java.util.List toValueObjects(java.util.Collection entities)
    {
        final java.util.List list = new java.util.ArrayList();

        for (java.util.Iterator iterator = entities.iterator(); iterator.hasNext();)
        {
            list.add(toValueObject((com.demo.entity.basic.Customer)iterator.next()));
        }

        return list;
    }

    private static com.demo.entity.basic.crud.CustomerValueObject toValueObject(com.demo.entity.basic.Customer entity)
    {
        final com.demo.entity.basic.crud.CustomerValueObject valueObject = new com.demo.entity.basic.crud.CustomerValueObject();

        valueObject.setCustomerName(entity.getCustomerName());
        valueObject.setCustEnum(entity.getCustEnum());
        valueObject.setId(entity.getId());

        return valueObject;
    }
}
