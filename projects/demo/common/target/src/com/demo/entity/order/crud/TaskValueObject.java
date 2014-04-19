// license-header java merge-point
package com.demo.entity.order.crud;

public class TaskValueObject
    implements java.io.Serializable
{
    private double num;

    public double getNum()
    {
        return this.num;
    }

    public void setNum(double num)
    {
        this.num = num;
    }

    private double volumne;

    public double getVolumne()
    {
        return this.volumne;
    }

    public void setVolumne(double volumne)
    {
        this.volumne = volumne;
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

    private java.lang.Long taskForm;

    public java.lang.Long getTaskForm()
    {
        return this.taskForm;
    }

    public void setTaskForm(java.lang.Long taskForm)
    {
        this.taskForm = taskForm;
    }

}