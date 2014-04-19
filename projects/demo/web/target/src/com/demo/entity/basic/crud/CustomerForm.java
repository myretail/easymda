// license-header java merge-point
package com.demo.entity.basic.crud;

public final class CustomerForm
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

    /**
     * @see org.apache.struts.validator.ValidatorForm#reset(org.apache.struts.action.ActionMapping,javax.servlet.http.HttpServletRequest)
     */
    public void reset(org.apache.struts.action.ActionMapping mapping, javax.servlet.http.HttpServletRequest request)
    {
        customerName = null;
        custEnum = null;
        id = null;
    }
}