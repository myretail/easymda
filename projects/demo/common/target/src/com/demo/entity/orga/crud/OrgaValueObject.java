// license-header java merge-point
package com.demo.entity.orga.crud;

public class OrgaValueObject
    implements java.io.Serializable
{
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

}