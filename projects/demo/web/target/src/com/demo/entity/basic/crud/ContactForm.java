// license-header java merge-point
package com.demo.entity.basic.crud;

public final class ContactForm
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

    private java.lang.String codeContact;

    public java.lang.String getCodeContact()
    {
        return this.codeContact;
    }

    public void setCodeContact(java.lang.String codeContact)
    {
        this.codeContact = codeContact;
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

    private java.lang.Long customer;

    public java.lang.Long getCustomer()
    {
        return this.customer;
    }

    public void setCustomer(java.lang.Long customer)
    {
        this.customer = customer;
    }

    private java.util.List customerBackingList;

    public java.util.List getCustomerBackingList()
    {
        return this.customerBackingList;
    }

    public void setCustomerBackingList(java.util.List customerBackingList)
    {
        this.customerBackingList = customerBackingList;
    }

    /**
     * @see org.apache.struts.validator.ValidatorForm#reset(org.apache.struts.action.ActionMapping,javax.servlet.http.HttpServletRequest)
     */
    public void reset(org.apache.struts.action.ActionMapping mapping, javax.servlet.http.HttpServletRequest request)
    {
        codeContact = null;
        id = null;
        customer = null;
        customerBackingList = null;
    }
}