// license-header java merge-point
package com.demo.entity.order.crud;

public interface OrderRowdManageableService
{
    public com.demo.entity.order.crud.OrderRowdValueObject create(double productNum, double unitNum, double goodsSuttle, double goodsWeight, double goodsVolume, java.lang.String label, double carriage, java.lang.String especial, java.lang.String goodsState, java.lang.String remark, java.lang.Long id, java.lang.Long order, java.lang.Long product)
        throws Exception;

    public com.demo.entity.order.crud.OrderRowdValueObject readById(java.lang.Long id)
        throws Exception;

    public java.util.List read(double productNum, double unitNum, double goodsSuttle, double goodsWeight, double goodsVolume, java.lang.String label, double carriage, java.lang.String especial, java.lang.String goodsState, java.lang.String remark, java.lang.Long id, java.lang.Long order, java.lang.Long product)
        throws Exception;

    public java.util.List readAll()
        throws Exception;

    public java.util.Map readBackingLists()
        throws Exception;

    public com.demo.entity.order.crud.OrderRowdValueObject update(double productNum, double unitNum, double goodsSuttle, double goodsWeight, double goodsVolume, java.lang.String label, double carriage, java.lang.String especial, java.lang.String goodsState, java.lang.String remark, java.lang.Long id, java.lang.Long order, java.lang.Long product)
        throws Exception;

    public void delete(java.lang.Long[] ids)
        throws Exception;

}
