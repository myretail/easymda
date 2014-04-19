// license-header java merge-point
package com.demo.entity.order.crud;

public final class OrderdManageableServiceBase
    implements OrderdManageableService
{
    private com.demo.entity.order.crud.OrderdManageableDao dao;

    public void setDao(com.demo.entity.order.crud.OrderdManageableDao dao)
    {
        this.dao = dao;
    }

    protected com.demo.entity.order.crud.OrderdManageableDao getDao()
    {
        return this.dao;
    }

    public com.demo.entity.order.crud.OrderdValueObject create(java.lang.String customerOrderNo, java.lang.String contractNo, java.lang.String conveyanceEnum, java.lang.String carryTypeEnum, java.lang.String shipperRemark, java.lang.String carrierRemark, java.lang.String levelEnum, java.lang.String customerTypeEnum, java.util.Date referTime, java.lang.String linkMan, java.lang.String tel, java.util.Date bookTime, java.util.Date completeTime, java.lang.String remark, java.lang.Long id, java.lang.Long[] orderRow, java.lang.Long customer)
        throws Exception
    {
        if (conveyanceEnum == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.OrderdManageableService.create(java.lang.String customerOrderNo, java.lang.String contractNo, java.lang.String conveyanceEnum, java.lang.String carryTypeEnum, java.lang.String shipperRemark, java.lang.String carrierRemark, java.lang.String levelEnum, java.lang.String customerTypeEnum, java.util.Date referTime, java.lang.String linkMan, java.lang.String tel, java.util.Date bookTime, java.util.Date completeTime, java.lang.String remark, java.lang.Long id, java.lang.Long[] orderRow, java.lang.Long customer) - 'conveyanceEnum' can not be null");
        }

        if (bookTime == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.OrderdManageableService.create(java.lang.String customerOrderNo, java.lang.String contractNo, java.lang.String conveyanceEnum, java.lang.String carryTypeEnum, java.lang.String shipperRemark, java.lang.String carrierRemark, java.lang.String levelEnum, java.lang.String customerTypeEnum, java.util.Date referTime, java.lang.String linkMan, java.lang.String tel, java.util.Date bookTime, java.util.Date completeTime, java.lang.String remark, java.lang.Long id, java.lang.Long[] orderRow, java.lang.Long customer) - 'bookTime' can not be null");
        }

        if (customer == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.OrderdManageableService.create(java.lang.String customerOrderNo, java.lang.String contractNo, java.lang.String conveyanceEnum, java.lang.String carryTypeEnum, java.lang.String shipperRemark, java.lang.String carrierRemark, java.lang.String levelEnum, java.lang.String customerTypeEnum, java.util.Date referTime, java.lang.String linkMan, java.lang.String tel, java.util.Date bookTime, java.util.Date completeTime, java.lang.String remark, java.lang.Long id, java.lang.Long[] orderRow, java.lang.Long customer) - 'customer' can not be null");
        }

        return toValueObject(dao.create(customerOrderNo, contractNo, conveyanceEnum, carryTypeEnum, shipperRemark, carrierRemark, levelEnum, customerTypeEnum, referTime, linkMan, tel, bookTime, completeTime, remark, id, orderRow, customer));
    }

    public com.demo.entity.order.crud.OrderdValueObject readById(java.lang.Long id)
        throws Exception
    {
        return toValueObject(dao.readById(id));
    }

    public java.util.List read(java.lang.String customerOrderNo, java.lang.String contractNo, java.lang.String conveyanceEnum, java.lang.String carryTypeEnum, java.lang.String shipperRemark, java.lang.String carrierRemark, java.lang.String levelEnum, java.lang.String customerTypeEnum, java.util.Date referTime, java.lang.String linkMan, java.lang.String tel, java.util.Date bookTime, java.util.Date completeTime, java.lang.String remark, java.lang.Long id, java.lang.Long[] orderRow, java.lang.Long customer)
        throws Exception
    {
        return toValueObjects(dao.read(customerOrderNo, contractNo, conveyanceEnum, carryTypeEnum, shipperRemark, carrierRemark, levelEnum, customerTypeEnum, referTime, linkMan, tel, bookTime, completeTime, remark, id, orderRow, customer));
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

    public com.demo.entity.order.crud.OrderdValueObject update(java.lang.String customerOrderNo, java.lang.String contractNo, java.lang.String conveyanceEnum, java.lang.String carryTypeEnum, java.lang.String shipperRemark, java.lang.String carrierRemark, java.lang.String levelEnum, java.lang.String customerTypeEnum, java.util.Date referTime, java.lang.String linkMan, java.lang.String tel, java.util.Date bookTime, java.util.Date completeTime, java.lang.String remark, java.lang.Long id, java.lang.Long[] orderRow, java.lang.Long customer)
        throws Exception
    {
        if (conveyanceEnum == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.OrderdManageableService.update(java.lang.String customerOrderNo, java.lang.String contractNo, java.lang.String conveyanceEnum, java.lang.String carryTypeEnum, java.lang.String shipperRemark, java.lang.String carrierRemark, java.lang.String levelEnum, java.lang.String customerTypeEnum, java.util.Date referTime, java.lang.String linkMan, java.lang.String tel, java.util.Date bookTime, java.util.Date completeTime, java.lang.String remark, java.lang.Long id, java.lang.Long[] orderRow, java.lang.Long customer) - 'conveyanceEnum' can not be null");
        }

        if (bookTime == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.OrderdManageableService.update(java.lang.String customerOrderNo, java.lang.String contractNo, java.lang.String conveyanceEnum, java.lang.String carryTypeEnum, java.lang.String shipperRemark, java.lang.String carrierRemark, java.lang.String levelEnum, java.lang.String customerTypeEnum, java.util.Date referTime, java.lang.String linkMan, java.lang.String tel, java.util.Date bookTime, java.util.Date completeTime, java.lang.String remark, java.lang.Long id, java.lang.Long[] orderRow, java.lang.Long customer) - 'bookTime' can not be null");
        }

        if (id == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.OrderdManageableService.update(java.lang.String customerOrderNo, java.lang.String contractNo, java.lang.String conveyanceEnum, java.lang.String carryTypeEnum, java.lang.String shipperRemark, java.lang.String carrierRemark, java.lang.String levelEnum, java.lang.String customerTypeEnum, java.util.Date referTime, java.lang.String linkMan, java.lang.String tel, java.util.Date bookTime, java.util.Date completeTime, java.lang.String remark, java.lang.Long id, java.lang.Long[] orderRow, java.lang.Long customer) - 'id' can not be null");
        }

        if (customer == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.OrderdManageableService.update(java.lang.String customerOrderNo, java.lang.String contractNo, java.lang.String conveyanceEnum, java.lang.String carryTypeEnum, java.lang.String shipperRemark, java.lang.String carrierRemark, java.lang.String levelEnum, java.lang.String customerTypeEnum, java.util.Date referTime, java.lang.String linkMan, java.lang.String tel, java.util.Date bookTime, java.util.Date completeTime, java.lang.String remark, java.lang.Long id, java.lang.Long[] orderRow, java.lang.Long customer) - 'customer' can not be null");
        }

        return toValueObject(dao.update(customerOrderNo, contractNo, conveyanceEnum, carryTypeEnum, shipperRemark, carrierRemark, levelEnum, customerTypeEnum, referTime, linkMan, tel, bookTime, completeTime, remark, id, orderRow, customer));
    }

    public void delete(java.lang.Long[] ids)
        throws Exception
    {
        if (ids == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.order.crud.OrderdManageableService.delete(java.lang.Long[] ids) - 'ids' can not be null");
        }

        dao.delete(ids);
    }


    private static java.util.List toValueObjects(java.util.Collection entities)
    {
        final java.util.List list = new java.util.ArrayList();

        for (java.util.Iterator iterator = entities.iterator(); iterator.hasNext();)
        {
            list.add(toValueObject((com.demo.entity.order.Orderd)iterator.next()));
        }

        return list;
    }

    private static com.demo.entity.order.crud.OrderdValueObject toValueObject(com.demo.entity.order.Orderd entity)
    {
        final com.demo.entity.order.crud.OrderdValueObject valueObject = new com.demo.entity.order.crud.OrderdValueObject();

        valueObject.setCustomerOrderNo(entity.getCustomerOrderNo());
        valueObject.setContractNo(entity.getContractNo());
        valueObject.setConveyanceEnum(entity.getConveyanceEnum());
        valueObject.setCarryTypeEnum(entity.getCarryTypeEnum());
        valueObject.setShipperRemark(entity.getShipperRemark());
        valueObject.setCarrierRemark(entity.getCarrierRemark());
        valueObject.setLevelEnum(entity.getLevelEnum());
        valueObject.setCustomerTypeEnum(entity.getCustomerTypeEnum());
        valueObject.setReferTime(entity.getReferTime());
        valueObject.setLinkMan(entity.getLinkMan());
        valueObject.setTel(entity.getTel());
        valueObject.setBookTime(entity.getBookTime());
        valueObject.setCompleteTime(entity.getCompleteTime());
        valueObject.setRemark(entity.getRemark());
        valueObject.setId(entity.getId());

        final java.util.Collection orderRow = entity.getOrderRow();
        if (orderRow == null || orderRow.isEmpty())
        {
            valueObject.setOrderRow(null);
        }
        else
        {
            final java.lang.Long[] values = new java.lang.Long[orderRow.size()];
            int counter = 0;
            for (final java.util.Iterator iterator = orderRow.iterator(); iterator.hasNext();counter++)
            {
                final com.demo.entity.order.OrderRowd element = (com.demo.entity.order.OrderRowd)iterator.next();
                values[counter] = element.getId();
            }
            valueObject.setOrderRow(values);
        }

        final com.demo.entity.basic.Customer customer = entity.getCustomer();
        if (customer != null)
        {
            valueObject.setCustomer(customer.getId());
        }

        return valueObject;
    }
}
