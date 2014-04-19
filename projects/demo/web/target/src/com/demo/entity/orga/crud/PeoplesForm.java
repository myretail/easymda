// license-header java merge-point
package com.demo.entity.orga.crud;

public final class PeoplesForm
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

    private java.lang.String peopleName;

    public java.lang.String getPeopleName()
    {
        return this.peopleName;
    }

    public void setPeopleName(java.lang.String peopleName)
    {
        this.peopleName = peopleName;
    }

    private java.lang.String peoplePassword;

    public java.lang.String getPeoplePassword()
    {
        return this.peoplePassword;
    }

    public void setPeoplePassword(java.lang.String peoplePassword)
    {
        this.peoplePassword = peoplePassword;
    }

    private java.lang.String peopleStatus;

    public java.lang.String getPeopleStatus()
    {
        return this.peopleStatus;
    }

    public void setPeopleStatus(java.lang.String peopleStatus)
    {
        this.peopleStatus = peopleStatus;
    }

    private java.util.Date birthDay;

    public java.util.Date getBirthDay()
    {
        return this.birthDay;
    }

    public void setBirthDay(java.util.Date birthDay)
    {
        this.birthDay = birthDay;
    }

    private static final java.text.DateFormat birthDayFormatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
    static { birthDayFormatter.setLenient(true); }

    public java.lang.String getBirthDayAsString()
    {
        return (birthDay == null) ? null : birthDayFormatter.format(birthDay);
    }

    public void setBirthDayAsString(java.lang.String birthDay)
    {
        try
        {
            this.birthDay = (org.apache.commons.lang.StringUtils.isBlank(birthDay)) ? null : birthDayFormatter.parse(birthDay);
        }
        catch (java.text.ParseException pe)
        {
            throw new java.lang.RuntimeException(pe);
        }
    }

    private java.lang.String sex;

    public java.lang.String getSex()
    {
        return this.sex;
    }

    public void setSex(java.lang.String sex)
    {
        this.sex = sex;
    }

    private java.lang.String birthPlace;

    public java.lang.String getBirthPlace()
    {
        return this.birthPlace;
    }

    public void setBirthPlace(java.lang.String birthPlace)
    {
        this.birthPlace = birthPlace;
    }

    private java.lang.String address;

    public java.lang.String getAddress()
    {
        return this.address;
    }

    public void setAddress(java.lang.String address)
    {
        this.address = address;
    }

    private java.lang.String tel;

    public java.lang.String getTel()
    {
        return this.tel;
    }

    public void setTel(java.lang.String tel)
    {
        this.tel = tel;
    }

    private java.lang.String engageMode;

    public java.lang.String getEngageMode()
    {
        return this.engageMode;
    }

    public void setEngageMode(java.lang.String engageMode)
    {
        this.engageMode = engageMode;
    }

    private java.util.Date engageDate;

    public java.util.Date getEngageDate()
    {
        return this.engageDate;
    }

    public void setEngageDate(java.util.Date engageDate)
    {
        this.engageDate = engageDate;
    }

    private static final java.text.DateFormat engageDateFormatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
    static { engageDateFormatter.setLenient(true); }

    public java.lang.String getEngageDateAsString()
    {
        return (engageDate == null) ? null : engageDateFormatter.format(engageDate);
    }

    public void setEngageDateAsString(java.lang.String engageDate)
    {
        try
        {
            this.engageDate = (org.apache.commons.lang.StringUtils.isBlank(engageDate)) ? null : engageDateFormatter.parse(engageDate);
        }
        catch (java.text.ParseException pe)
        {
            throw new java.lang.RuntimeException(pe);
        }
    }

    private java.lang.String gradeEnum;

    public java.lang.String getGradeEnum()
    {
        return this.gradeEnum;
    }

    public void setGradeEnum(java.lang.String gradeEnum)
    {
        this.gradeEnum = gradeEnum;
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

    /**
     * @see org.apache.struts.validator.ValidatorForm#reset(org.apache.struts.action.ActionMapping,javax.servlet.http.HttpServletRequest)
     */
    public void reset(org.apache.struts.action.ActionMapping mapping, javax.servlet.http.HttpServletRequest request)
    {
        peopleName = null;
        peoplePassword = null;
        peopleStatus = null;
        birthDay = null;
        sex = null;
        birthPlace = null;
        address = null;
        tel = null;
        engageMode = null;
        engageDate = null;
        gradeEnum = null;
        remark = null;
        id = null;
    }
}