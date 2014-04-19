// license-header java merge-point
package com.demo.entity.order.crud;

public final class TaskForm
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

    private java.util.List taskFormBackingList;

    public java.util.List getTaskFormBackingList()
    {
        return this.taskFormBackingList;
    }

    public void setTaskFormBackingList(java.util.List taskFormBackingList)
    {
        this.taskFormBackingList = taskFormBackingList;
    }

    /**
     * @see org.apache.struts.validator.ValidatorForm#reset(org.apache.struts.action.ActionMapping,javax.servlet.http.HttpServletRequest)
     */
    public void reset(org.apache.struts.action.ActionMapping mapping, javax.servlet.http.HttpServletRequest request)
    {
        num = 0;
        volumne = 0;
        remark = null;
        id = null;
        taskForm = null;
        taskFormBackingList = null;
    }
}