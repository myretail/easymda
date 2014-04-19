// license-header java merge-point
package com.demo.entity.order.crud;

public class OrderRowTaskValueObject
    implements java.io.Serializable
{
    private java.lang.Long id;

    public java.lang.Long getId()
    {
        return this.id;
    }

    public void setId(java.lang.Long id)
    {
        this.id = id;
    }

    private java.lang.Long orderRow;

    public java.lang.Long getOrderRow()
    {
        return this.orderRow;
    }

    public void setOrderRow(java.lang.Long orderRow)
    {
        this.orderRow = orderRow;
    }

    private java.lang.Long task;

    public java.lang.Long getTask()
    {
        return this.task;
    }

    public void setTask(java.lang.Long task)
    {
        this.task = task;
    }

}