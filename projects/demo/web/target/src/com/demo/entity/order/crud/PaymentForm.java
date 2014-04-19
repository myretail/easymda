// license-header java merge-point
package com.demo.entity.order.crud;

public final class PaymentForm
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

    private java.lang.String newAttr1;

    public java.lang.String getNewAttr1()
    {
        return this.newAttr1;
    }

    public void setNewAttr1(java.lang.String newAttr1)
    {
        this.newAttr1 = newAttr1;
    }

    private java.lang.String newAttr2;

    public java.lang.String getNewAttr2()
    {
        return this.newAttr2;
    }

    public void setNewAttr2(java.lang.String newAttr2)
    {
        this.newAttr2 = newAttr2;
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

    private java.lang.Long payment;

    public java.lang.Long getPayment()
    {
        return this.payment;
    }

    public void setPayment(java.lang.Long payment)
    {
        this.payment = payment;
    }

    private java.util.List paymentBackingList;

    public java.util.List getPaymentBackingList()
    {
        return this.paymentBackingList;
    }

    public void setPaymentBackingList(java.util.List paymentBackingList)
    {
        this.paymentBackingList = paymentBackingList;
    }

    /**
     * @see org.apache.struts.validator.ValidatorForm#reset(org.apache.struts.action.ActionMapping,javax.servlet.http.HttpServletRequest)
     */
    public void reset(org.apache.struts.action.ActionMapping mapping, javax.servlet.http.HttpServletRequest request)
    {
        newAttr1 = null;
        newAttr2 = null;
        id = null;
        payment = null;
        paymentBackingList = null;
    }
}