// license-header java merge-point
package com.demo.entity.basic.crud;

public final class ContactManageableServiceBase
    implements ContactManageableService
{
    private com.demo.entity.basic.crud.ContactManageableDao dao;

    public void setDao(com.demo.entity.basic.crud.ContactManageableDao dao)
    {
        this.dao = dao;
    }

    protected com.demo.entity.basic.crud.ContactManageableDao getDao()
    {
        return this.dao;
    }

    public com.demo.entity.basic.crud.ContactValueObject create(java.lang.String codeContact, java.lang.Long id, java.lang.Long customer)
        throws Exception
    {
        if (codeContact == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.basic.crud.ContactManageableService.create(java.lang.String codeContact, java.lang.Long id, java.lang.Long customer) - 'codeContact' can not be null");
        }

        if (customer == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.basic.crud.ContactManageableService.create(java.lang.String codeContact, java.lang.Long id, java.lang.Long customer) - 'customer' can not be null");
        }

        return toValueObject(dao.create(codeContact, id, customer));
    }

    public com.demo.entity.basic.crud.ContactValueObject readById(java.lang.Long id)
        throws Exception
    {
        return toValueObject(dao.readById(id));
    }

    public java.util.List read(java.lang.String codeContact, java.lang.Long id, java.lang.Long customer)
        throws Exception
    {
        return toValueObjects(dao.read(codeContact, id, customer));
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

    public com.demo.entity.basic.crud.ContactValueObject update(java.lang.String codeContact, java.lang.Long id, java.lang.Long customer)
        throws Exception
    {
        if (codeContact == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.basic.crud.ContactManageableService.update(java.lang.String codeContact, java.lang.Long id, java.lang.Long customer) - 'codeContact' can not be null");
        }

        if (id == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.basic.crud.ContactManageableService.update(java.lang.String codeContact, java.lang.Long id, java.lang.Long customer) - 'id' can not be null");
        }

        if (customer == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.basic.crud.ContactManageableService.update(java.lang.String codeContact, java.lang.Long id, java.lang.Long customer) - 'customer' can not be null");
        }

        return toValueObject(dao.update(codeContact, id, customer));
    }

    public void delete(java.lang.Long[] ids)
        throws Exception
    {
        if (ids == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.basic.crud.ContactManageableService.delete(java.lang.Long[] ids) - 'ids' can not be null");
        }

        dao.delete(ids);
    }


    private static java.util.List toValueObjects(java.util.Collection entities)
    {
        final java.util.List list = new java.util.ArrayList();

        for (java.util.Iterator iterator = entities.iterator(); iterator.hasNext();)
        {
            list.add(toValueObject((com.demo.entity.basic.Contact)iterator.next()));
        }

        return list;
    }

    private static com.demo.entity.basic.crud.ContactValueObject toValueObject(com.demo.entity.basic.Contact entity)
    {
        final com.demo.entity.basic.crud.ContactValueObject valueObject = new com.demo.entity.basic.crud.ContactValueObject();

        valueObject.setCodeContact(entity.getCodeContact());
        valueObject.setId(entity.getId());

        final com.demo.entity.basic.Customer customer = entity.getCustomer();
        if (customer != null)
        {
            valueObject.setCustomer(customer.getId());
        }

        return valueObject;
    }
}
