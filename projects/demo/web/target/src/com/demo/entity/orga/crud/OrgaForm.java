// license-header java merge-point
package com.demo.entity.orga.crud;

public final class OrgaForm
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

    private java.lang.String orgaName;

    public java.lang.String getOrgaName()
    {
        return this.orgaName;
    }

    public void setOrgaName(java.lang.String orgaName)
    {
        this.orgaName = orgaName;
    }

    private java.lang.String orgaCode;

    public java.lang.String getOrgaCode()
    {
        return this.orgaCode;
    }

    public void setOrgaCode(java.lang.String orgaCode)
    {
        this.orgaCode = orgaCode;
    }

    private java.lang.String sno;

    public java.lang.String getSno()
    {
        return this.sno;
    }

    public void setSno(java.lang.String sno)
    {
        this.sno = sno;
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

    private long parentId;

    public long getParentId()
    {
        return this.parentId;
    }

    public void setParentId(long parentId)
    {
        this.parentId = parentId;
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
        orgaName = null;
        orgaCode = null;
        sno = null;
        remark = null;
        parentId = 0;
        id = null;
    }
}