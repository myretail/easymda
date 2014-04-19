// license-header java merge-point
package com.demo.entity.order.crud;

public class TaskFormValueObject
    implements java.io.Serializable
{
    private java.util.Date setDate;

    public java.util.Date getSetDate()
    {
        return this.setDate;
    }

    public void setSetDate(java.util.Date setDate)
    {
        this.setDate = setDate;
    }

    private java.lang.String formState;

    public java.lang.String getFormState()
    {
        return this.formState;
    }

    public void setFormState(java.lang.String formState)
    {
        this.formState = formState;
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

    private java.lang.Long[] tasks;

    public java.lang.Long[] getTasks()
    {
        return this.tasks;
    }

    public void setTasks(java.lang.Long[] tasks)
    {
        this.tasks = tasks;
    }

    private java.lang.Long car;

    public java.lang.Long getCar()
    {
        return this.car;
    }

    public void setCar(java.lang.Long car)
    {
        this.car = car;
    }

}