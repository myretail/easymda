// license-header java merge-point
package com.demo.entity.order.crud;

public final class PaymentManageableServiceBase
    implements PaymentManageableService
{
    private com.demo.entity.order.crud.PaymentManageableDao dao;

    public void setDao(com.demo.entity.order.crud.PaymentManageableDao dao)
    {
        this.dao = dao;
    }

    protected com.demo.entity.order.crud.PaymentManageableDao getDao()
    {
        return this.dao;
    }

    public com.demo.entity.order.crud.PaymentValueObject create(java.lang.String newAttr1, java.lang.String newAttr2, java.lang.Long id, java.lang.Long payment)
        throws Exception
    {
        if (newAttr1 == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.PaymentManageableService.create(java.lang.String newAttr1, java.lang.String newAttr2, java.lang.Long id, java.lang.Long payment) - 'newAttr1' can not be null");
        }

        if (newAttr2 == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.PaymentManageableService.create(java.lang.String newAttr1, java.lang.String newAttr2, java.lang.Long id, java.lang.Long payment) - 'newAttr2' can not be null");
        }

        if (payment == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.PaymentManageableService.create(java.lang.String newAttr1, java.lang.String newAttr2, java.lang.Long id, java.lang.Long payment) - 'payment' can not be null");
        }

        return toValueObject(dao.create(newAttr1, newAttr2, id, payment));
    }

    public com.demo.entity.order.crud.PaymentValueObject readById(java.lang.Long id)
        throws Exception
    {
        return toValueObject(dao.readById(id));
    }

    public java.util.List read(java.lang.String newAttr1, java.lang.String newAttr2, java.lang.Long id, java.lang.Long payment)
        throws Exception
    {
        return toValueObjects(dao.read(newAttr1, newAttr2, id, payment));
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

    public com.demo.entity.order.crud.PaymentValueObject update(java.lang.String newAttr1, java.lang.String newAttr2, java.lang.Long id, java.lang.Long payment)
        throws Exception
    {
        if (newAttr1 == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.PaymentManageableService.update(java.lang.String newAttr1, java.lang.String newAttr2, java.lang.Long id, java.lang.Long payment) - 'newAttr1' can not be null");
        }

        if (newAttr2 == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.PaymentManageableService.update(java.lang.String newAttr1, java.lang.String newAttr2, java.lang.Long id, java.lang.Long payment) - 'newAttr2' can not be null");
        }

        if (id == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.PaymentManageableService.update(java.lang.String newAttr1, java.lang.String newAttr2, java.lang.Long id, java.lang.Long payment) - 'id' can not be null");
        }

        if (payment == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.PaymentManageableService.update(java.lang.String newAttr1, java.lang.String newAttr2, java.lang.Long id, java.lang.Long payment) - 'payment' can not be null");
        }

        return toValueObject(dao.update(newAttr1, newAttr2, id, payment));
    }

    public void delete(java.lang.Long[] ids)
        throws Exception
    {
        if (ids == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.PaymentManageableService.delete(java.lang.Long[] ids) - 'ids' can not be null");
        }

        dao.delete(ids);
    }


    private static java.util.List toValueObjects(java.util.Collection entities)
    {
        final java.util.List list = new java.util.ArrayList();

        for (java.util.Iterator iterator = entities.iterator(); iterator.hasNext();)
        {
            list.add(toValueObject((com.demo.entity.order.Payment)iterator.next()));
        }

        return list;
    }

    private static com.demo.entity.order.crud.PaymentValueObject toValueObject(com.demo.entity.order.Payment entity)
    {
        final com.demo.entity.order.crud.PaymentValueObject valueObject = new com.demo.entity.order.crud.PaymentValueObject();

        valueObject.setNewAttr1(entity.getNewAttr1());
        valueObject.setNewAttr2(entity.getNewAttr2());
        valueObject.setId(entity.getId());

        final com.demo.entity.order.OrderRowd payment = entity.getPayment();
        if (payment != null)
        {
            valueObject.setPayment(payment.getId());
        }

        return valueObject;
    }
}
