// license-header java merge-point
package com.demo.entity.order.crud;

public final class TaskFormForm
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

    private java.util.Date setDate;

    public java.util.Date getSetDate()
    {
        return this.setDate;
    }

    public void setSetDate(java.util.Date setDate)
    {
        this.setDate = setDate;
    }

    private static final java.text.DateFormat setDateFormatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
    static { setDateFormatter.setLenient(true); }

    public java.lang.String getSetDateAsString()
    {
        return (setDate == null) ? null : setDateFormatter.format(setDate);
    }

    public void setSetDateAsString(java.lang.String setDate)
    {
        try
        {
            this.setDate = (org.apache.commons.lang.StringUtils.isBlank(setDate)) ? null : setDateFormatter.parse(setDate);
        }
        catch (java.text.ParseException pe)
        {
            throw new java.lang.RuntimeException(pe);
        }
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

    private java.util.List tasksBackingList;

    public java.util.List getTasksBackingList()
    {
        return this.tasksBackingList;
    }

    public void setTasksBackingList(java.util.List tasksBackingList)
    {
        this.tasksBackingList = tasksBackingList;
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

    private java.util.List carBackingList;

    public java.util.List getCarBackingList()
    {
        return this.carBackingList;
    }

    public void setCarBackingList(java.util.List carBackingList)
    {
        this.carBackingList = carBackingList;
    }

    /**
     * @see org.apache.struts.validator.ValidatorForm#reset(org.apache.struts.action.ActionMapping,javax.servlet.http.HttpServletRequest)
     */
    public void reset(org.apache.struts.action.ActionMapping mapping, javax.servlet.http.HttpServletRequest request)
    {
        setDate = null;
        formState = null;
        remark = null;
        id = null;
        tasks = null;
        tasksBackingList = null;
        car = null;
        carBackingList = null;
    }
}