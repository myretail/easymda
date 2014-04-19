// license-header java merge-point
package com.demo.entity.order.crud;

public final class OrderRowTaskForm
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

    private java.util.List orderRowBackingList;

    public java.util.List getOrderRowBackingList()
    {
        return this.orderRowBackingList;
    }

    public void setOrderRowBackingList(java.util.List orderRowBackingList)
    {
        this.orderRowBackingList = orderRowBackingList;
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

    private java.util.List taskBackingList;

    public java.util.List getTaskBackingList()
    {
        return this.taskBackingList;
    }

    public void setTaskBackingList(java.util.List taskBackingList)
    {
        this.taskBackingList = taskBackingList;
    }

    /**
     * @see org.apache.struts.validator.ValidatorForm#reset(org.apache.struts.action.ActionMapping,javax.servlet.http.HttpServletRequest)
     */
    public void reset(org.apache.struts.action.ActionMapping mapping, javax.servlet.http.HttpServletRequest request)
    {
        id = null;
        orderRow = null;
        orderRowBackingList = null;
        task = null;
        taskBackingList = null;
    }
}