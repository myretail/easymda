// license-header java merge-point
package com.demo.entity.basic.crud;

public final class EnumerationForm
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

    private java.lang.String fieldName;

    public java.lang.String getFieldName()
    {
        return this.fieldName;
    }

    public void setFieldName(java.lang.String fieldName)
    {
        this.fieldName = fieldName;
    }

    private java.lang.String enumerationType;

    public java.lang.String getEnumerationType()
    {
        return this.enumerationType;
    }

    public void setEnumerationType(java.lang.String enumerationType)
    {
        this.enumerationType = enumerationType;
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
        fieldName = null;
        enumerationType = null;
        id = null;
    }
}