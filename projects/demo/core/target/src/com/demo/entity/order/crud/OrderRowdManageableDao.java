// license-header java merge-point
package com.demo.entity.order.crud;

public interface OrderRowdManageableDao
{
    public com.demo.entity.order.OrderRowd create(double productNum, double unitNum, double goodsSuttle, double goodsWeight, double goodsVolume, java.lang.String label, double carriage, java.lang.String especial, java.lang.String goodsState, java.lang.String remark, java.lang.Long id, java.lang.Long order, java.lang.Long product);

    public com.demo.entity.order.OrderRowd readById(java.lang.Long id);

    public java.util.List read(double productNum, double unitNum, double goodsSuttle, double goodsWeight, double goodsVolume, java.lang.String label, double carriage, java.lang.String especial, java.lang.String goodsState, java.lang.String remark, java.lang.Long id, java.lang.Long order, java.lang.Long product);

    public java.util.List readAll();

    public java.util.Map readBackingLists();

    public com.demo.entity.order.OrderRowd update(double productNum, double unitNum, double goodsSuttle, double goodsWeight, double goodsVolume, java.lang.String label, double carriage, java.lang.String especial, java.lang.String goodsState, java.lang.String remark, java.lang.Long id, java.lang.Long order, java.lang.Long product);

    public void delete(java.lang.Long[] ids);

}