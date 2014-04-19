// license-header java merge-point
package com.demo.entity.orga.crud;

public final class OrgaPeoplesForm
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

    private java.lang.Long orga;

    public java.lang.Long getOrga()
    {
        return this.orga;
    }

    public void setOrga(java.lang.Long orga)
    {
        this.orga = orga;
    }

    private java.util.List orgaBackingList;

    public java.util.List getOrgaBackingList()
    {
        return this.orgaBackingList;
    }

    public void setOrgaBackingList(java.util.List orgaBackingList)
    {
        this.orgaBackingList = orgaBackingList;
    }

    private java.lang.Long people;

    public java.lang.Long getPeople()
    {
        return this.people;
    }

    public void setPeople(java.lang.Long people)
    {
        this.people = people;
    }

    private java.util.List peopleBackingList;

    public java.util.List getPeopleBackingList()
    {
        return this.peopleBackingList;
    }

    public void setPeopleBackingList(java.util.List peopleBackingList)
    {
        this.peopleBackingList = peopleBackingList;
    }

    /**
     * @see org.apache.struts.validator.ValidatorForm#reset(org.apache.struts.action.ActionMapping,javax.servlet.http.HttpServletRequest)
     */
    public void reset(org.apache.struts.action.ActionMapping mapping, javax.servlet.http.HttpServletRequest request)
    {
        id = null;
        orga = null;
        orgaBackingList = null;
        people = null;
        peopleBackingList = null;
    }
}