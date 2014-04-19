// license-header java merge-point
package com.demo.entity.basic.crud;

public final class ProdManageableServiceBase
    implements ProdManageableService
{
    private com.demo.entity.basic.crud.ProdManageableDao dao;

    public void setDao(com.demo.entity.basic.crud.ProdManageableDao dao)
    {
        this.dao = dao;
    }

    protected com.demo.entity.basic.crud.ProdManageableDao getDao()
    {
        return this.dao;
    }

    public com.demo.entity.basic.crud.ProdValueObject create(java.lang.String prodName, java.lang.String code, double price, java.util.Date datef, java.lang.String prodType, java.lang.Long id, java.lang.Long prodCust, java.lang.Long principal)
        throws Exception
    {
        if (prodName == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.basic.crud.ProdManageableService.create(java.lang.String prodName, java.lang.String code, double price, java.util.Date datef, java.lang.String prodType, java.lang.Long id, java.lang.Long prodCust, java.lang.Long principal) - 'prodName' can not be null");
        }

        if (prodCust == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.basic.crud.ProdManageableService.create(java.lang.String prodName, java.lang.String code, double price, java.util.Date datef, java.lang.String prodType, java.lang.Long id, java.lang.Long prodCust, java.lang.Long principal) - 'prodCust' can not be null");
        }

        if (principal == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.basic.crud.ProdManageableService.create(java.lang.String prodName, java.lang.String code, double price, java.util.Date datef, java.lang.String prodType, java.lang.Long id, java.lang.Long prodCust, java.lang.Long principal) - 'principal' can not be null");
        }

        return toValueObject(dao.create(prodName, code, price, datef, prodType, id, prodCust, principal));
    }

    public com.demo.entity.basic.crud.ProdValueObject readById(java.lang.Long id)
        throws Exception
    {
        return toValueObject(dao.readById(id));
    }

    public java.util.List read(java.lang.String prodName, java.lang.String code, double price, java.util.Date datef, java.lang.String prodType, java.lang.Long id, java.lang.Long prodCust, java.lang.Long principal)
        throws Exception
    {
        return toValueObjects(dao.read(prodName, code, price, datef, prodType, id, prodCust, principal));
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

    public com.demo.entity.basic.crud.ProdValueObject update(java.lang.String prodName, java.lang.String code, double price, java.util.Date datef, java.lang.String prodType, java.lang.Long id, java.lang.Long prodCust, java.lang.Long principal)
        throws Exception
    {
        if (prodName == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.basic.crud.ProdManageableService.update(java.lang.String prodName, java.lang.String code, double price, java.util.Date datef, java.lang.String prodType, java.lang.Long id, java.lang.Long prodCust, java.lang.Long principal) - 'prodName' can not be null");
        }

        if (id == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.basic.crud.ProdManageableService.update(java.lang.String prodName, java.lang.String code, double price, java.util.Date datef, java.lang.String prodType, java.lang.Long id, java.lang.Long prodCust, java.lang.Long principal) - 'id' can not be null");
        }

        if (prodCust == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.basic.crud.ProdManageableService.update(java.lang.String prodName, java.lang.String code, double price, java.util.Date datef, java.lang.String prodType, java.lang.Long id, java.lang.Long prodCust, java.lang.Long principal) - 'prodCust' can not be null");
        }

        if (principal == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.basic.crud.ProdManageableService.update(java.lang.String prodName, java.lang.String code, double price, java.util.Date datef, java.lang.String prodType, java.lang.Long id, java.lang.Long prodCust, java.lang.Long principal) - 'principal' can not be null");
        }

        return toValueObject(dao.update(prodName, code, price, datef, prodType, id, prodCust, principal));
    }

    public void delete(java.lang.Long[] ids)
        throws Exception
    {
        if (ids == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.basic.crud.ProdManageableService.delete(java.lang.Long[] ids) - 'ids' can not be null");
        }

        dao.delete(ids);
    }


    private static java.util.List toValueObjects(java.util.Collection entities)
    {
        final java.util.List list = new java.util.ArrayList();

        for (java.util.Iterator iterator = entities.iterator(); iterator.hasNext();)
        {
            list.add(toValueObject((com.demo.entity.basic.Prod)iterator.next()));
        }

        return list;
    }

    private static com.demo.entity.basic.crud.ProdValueObject toValueObject(com.demo.entity.basic.Prod entity)
    {
        final com.demo.entity.basic.crud.ProdValueObject valueObject = new com.demo.entity.basic.crud.ProdValueObject();

        valueObject.setProdName(entity.getProdName());
        valueObject.setCode(entity.getCode());
        valueObject.setPrice(entity.getPrice());
        valueObject.setDatef(entity.getDatef());
        valueObject.setProdType(entity.getProdType());
        valueObject.setId(entity.getId());

        final com.demo.entity.basic.Customer prodCust = entity.getProdCust();
        if (prodCust != null)
        {
            valueObject.setProdCust(prodCust.getId());
        }

        final com.demo.entity.orga.Peoples principal = entity.getPrincipal();
        if (principal != null)
        {
            valueObject.setPrincipal(principal.getId());
        }

        return valueObject;
    }
}
