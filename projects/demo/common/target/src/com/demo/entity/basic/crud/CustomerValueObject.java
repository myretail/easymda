// license-header java merge-point
package com.demo.entity.basic.crud;

public class CustomerValueObject
    implements java.io.Serializable
{
    private java.lang.String customerName;

    public java.lang.String getCustomerName()
    {
        return this.customerName;
    }

    public void setCustomerName(java.lang.String customerName)
    {
        this.customerName = customerName;
    }

    private java.lang.String custEnum;

    public java.lang.String getCustEnum()
    {
        return this.custEnum;
    }

    public void setCustEnum(java.lang.String custEnum)
    {
        this.custEnum = custEnum;
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

}