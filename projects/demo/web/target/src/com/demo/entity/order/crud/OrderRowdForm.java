// license-header java merge-point
package com.demo.entity.order.crud;

public final class OrderRowdForm
    extends org.apache.struts.validator.ValidatorForm
    implements java.io.Serializable
{
    private java.util.List manageableList = null;

    public java.util.List getManageableList()
    {
        return this.manageableList;
    }

    public void setManageableList(java.util.List manageableList)
    {
        this.manageableList = manageableList;
    }

    private java.lang.Long[] selectedRows = null;

    public java.lang.Long[] getSelectedRows()
    {
        return this.selectedRows;
    }

    public void setSelectedRows(java.lang.Long[] selectedRows)
    {
        this.selectedRows = selectedRows;
    }

    private double productNum;

    public double getProductNum()
    {
        return this.productNum;
    }

    public void setProductNum(double productNum)
    {
        this.productNum = productNum;
    }

    private double unitNum;

    public double getUnitNum()
    {
        return this.unitNum;
    }

    public void setUnitNum(double unitNum)
    {
        this.unitNum = unitNum;
    }

    private double goodsSuttle;

    public double getGoodsSuttle()
    {
        return this.goodsSuttle;
    }

    public void setGoodsSuttle(double goodsSuttle)
    {
        this.goodsSuttle = goodsSuttle;
    }

    private double goodsWeight;

    public double getGoodsWeight()
    {
        return this.goodsWeight;
    }

    public void setGoodsWeight(double goodsWeight)
    {
        this.goodsWeight = goodsWeight;
    }

    private double goodsVolume;

    public double getGoodsVolume()
    {
        return this.goodsVolume;
    }

    public void setGoodsVolume(double goodsVolume)
    {
        this.goodsVolume = goodsVolume;
    }

    private java.lang.String label;

    public java.lang.String getLabel()
    {
        return this.label;
    }

    public void setLabel(java.lang.String label)
    {
        this.label = label;
    }

    private double carriage;

    public double getCarriage()
    {
        return this.carriage;
    }

    public void setCarriage(double carriage)
    {
        this.carriage = carriage;
    }

    private java.lang.String especial;

    public java.lang.String getEspecial()
    {
        return this.especial;
    }

    public void setEspecial(java.lang.String especial)
    {
        this.especial = especial;
    }

    private java.lang.String goodsState;

    public java.lang.String getGoodsState()
    {
        return this.goodsState;
    }

    public void setGoodsState(java.lang.String goodsState)
    {
        this.goodsState = goodsState;
    }

    private java.lang.String remark;

    public java.lang.String getRemark()
    {
        return this.remark;
    }

    public void setRemark(java.lang.String remark)
    {
        this.remark = remark;
    }

    private java.lang.Long id;

    public java.lang.Long getId()
    {
        return this.id;
    }

    public void setId(java.lang.Long id)
    {
        this.id = id;
    }

    private java.lang.Long order;

    public java.lang.Long getOrder()
    {
        return this.order;
    }

    public void setOrder(java.lang.Long order)
    {
        this.order = order;
    }

    private java.util.List orderBackingList;

    public java.util.List getOrderBackingList()
    {
        return this.orderBackingList;
    }

    public void setOrderBackingList(java.util.List orderBackingList)
    {
        this.orderBackingList = orderBackingList;
    }

    private java.lang.Long product;

    public java.lang.Long getProduct()
    {
        return this.product;
    }

    public void setProduct(java.lang.Long product)
    {
        this.product = product;
    }

    private java.util.List productBackingList;

    public java.util.List getProductBackingList()
    {
        return this.productBackingList;
    }

    public void setProductBackingList(java.util.List productBackingList)
    {
        this.productBackingList = productBackingList;
    }

    /**
     * @see org.apache.struts.validator.ValidatorForm#reset(org.apache.struts.action.ActionMapping,javax.servlet.http.HttpServletRequest)
     */
    public void reset(org.apache.struts.action.ActionMapping mapping, javax.servlet.http.HttpServletRequest request)
    {
        productNum = 0;
        unitNum = 0;
        goodsSuttle = 0;
        goodsWeight = 0;
        goodsVolume = 0;
        label = null;
        carriage = 0;
        especial = null;
        goodsState = null;
        remark = null;
        id = null;
        order = null;
        orderBackingList = null;
        product = null;
        productBackingList = null;
    }
}