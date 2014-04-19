// license-header java merge-point
package com.demo.entity.order.crud;

public final class OrderRowdManageableServiceBase
    implements OrderRowdManageableService
{
    private com.demo.entity.order.crud.OrderRowdManageableDao dao;

    public void setDao(com.demo.entity.order.crud.OrderRowdManageableDao dao)
    {
        this.dao = dao;
    }

    protected com.demo.entity.order.crud.OrderRowdManageableDao getDao()
    {
        return this.dao;
    }

    public com.demo.entity.order.crud.OrderRowdValueObject create(double productNum, double unitNum, double goodsSuttle, double goodsWeight, double goodsVolume, java.lang.String label, double carriage, java.lang.String especial, java.lang.String goodsState, java.lang.String remark, java.lang.Long id, java.lang.Long order, java.lang.Long product)
        throws Exception
    {
        if (order == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.OrderRowdManageableService.create(double productNum, double unitNum, double goodsSuttle, double goodsWeight, double goodsVolume, java.lang.String label, double carriage, java.lang.String especial, java.lang.String goodsState, java.lang.String remark, java.lang.Long id, java.lang.Long order, java.lang.Long product) - 'order' can not be null");
        }

        if (product == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.OrderRowdManageableService.create(double productNum, double unitNum, double goodsSuttle, double goodsWeight, double goodsVolume, java.lang.String label, double carriage, java.lang.String especial, java.lang.String goodsState, java.lang.String remark, java.lang.Long id, java.lang.Long order, java.lang.Long product) - 'product' can not be null");
        }

        return toValueObject(dao.create(productNum, unitNum, goodsSuttle, goodsWeight, goodsVolume, label, carriage, especial, goodsState, remark, id, order, product));
    }

    public com.demo.entity.order.crud.OrderRowdValueObject readById(java.lang.Long id)
        throws Exception
    {
        return toValueObject(dao.readById(id));
    }

    public java.util.List read(double productNum, double unitNum, double goodsSuttle, double goodsWeight, double goodsVolume, java.lang.String label, double carriage, java.lang.String especial, java.lang.String goodsState, java.lang.String remark, java.lang.Long id, java.lang.Long order, java.lang.Long product)
        throws Exception
    {
        return toValueObjects(dao.read(productNum, unitNum, goodsSuttle, goodsWeight, goodsVolume, label, carriage, especial, goodsState, remark, id, order, product));
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

    public com.demo.entity.order.crud.OrderRowdValueObject update(double productNum, double unitNum, double goodsSuttle, double goodsWeight, double goodsVolume, java.lang.String label, double carriage, java.lang.String especial, java.lang.String goodsState, java.lang.String remark, java.lang.Long id, java.lang.Long order, java.lang.Long product)
        throws Exception
    {
        if (id == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.OrderRowdManageableService.update(double productNum, double unitNum, double goodsSuttle, double goodsWeight, double goodsVolume, java.lang.String label, double carriage, java.lang.String especial, java.lang.String goodsState, java.lang.String remark, java.lang.Long id, java.lang.Long order, java.lang.Long product) - 'id' can not be null");
        }

        if (order == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.OrderRowdManageableService.update(double productNum, double unitNum, double goodsSuttle, double goodsWeight, double goodsVolume, java.lang.String label, double carriage, java.lang.String especial, java.lang.String goodsState, java.lang.String remark, java.lang.Long id, java.lang.Long order, java.lang.Long product) - 'order' can not be null");
        }

        if (product == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.OrderRowdManageableService.update(double productNum, double unitNum, double goodsSuttle, double goodsWeight, double goodsVolume, java.lang.String label, double carriage, java.lang.String especial, java.lang.String goodsState, java.lang.String remark, java.lang.Long id, java.lang.Long order, java.lang.Long product) - 'product' can not be null");
        }

        return toValueObject(dao.update(productNum, unitNum, goodsSuttle, goodsWeight, goodsVolume, label, carriage, especial, goodsState, remark, id, order, product));
    }

    public void delete(java.lang.Long[] ids)
        throws Exception
    {
        if (ids == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.OrderRowdManageableService.delete(java.lang.Long[] ids) - 'ids' can not be null");
        }

        dao.delete(ids);
    }


    private static java.util.List toValueObjects(java.util.Collection entities)
    {
        final java.util.List list = new java.util.ArrayList();

        for (java.util.Iterator iterator = entities.iterator(); iterator.hasNext();)
        {
            list.add(toValueObject((com.demo.entity.order.OrderRowd)iterator.next()));
        }

        return list;
    }

    private static com.demo.entity.order.crud.OrderRowdValueObject toValueObject(com.demo.entity.order.OrderRowd entity)
    {
        final com.demo.entity.order.crud.OrderRowdValueObject valueObject = new com.demo.entity.order.crud.OrderRowdValueObject();

        valueObject.setProductNum(entity.getProductNum());
        valueObject.setUnitNum(entity.getUnitNum());
        valueObject.setGoodsSuttle(entity.getGoodsSuttle());
        valueObject.setGoodsWeight(entity.getGoodsWeight());
        valueObject.setGoodsVolume(entity.getGoodsVolume());
        valueObject.setLabel(entity.getLabel());
        valueObject.setCarriage(entity.getCarriage());
        valueObject.setEspecial(entity.getEspecial());
        valueObject.setGoodsState(entity.getGoodsState());
        valueObject.setRemark(entity.getRemark());
        valueObject.setId(entity.getId());

        final com.demo.entity.order.Orderd order = entity.getOrder();
        if (order != null)
        {
            valueObject.setOrder(order.getId());
        }

        final com.demo.entity.basic.Prod product = entity.getProduct();
        if (product != null)
        {
            valueObject.setProduct(product.getId());
        }

        return valueObject;
    }
}
