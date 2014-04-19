// license-header java merge-point
package com.demo.entity.order.crud;

public final class OrderdForm
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

    private java.lang.String customerOrderNo;

    public java.lang.String getCustomerOrderNo()
    {
        return this.customerOrderNo;
    }

    public void setCustomerOrderNo(java.lang.String customerOrderNo)
    {
        this.customerOrderNo = customerOrderNo;
    }

    private java.lang.String contractNo;

    public java.lang.String getContractNo()
    {
        return this.contractNo;
    }

    public void setContractNo(java.lang.String contractNo)
    {
        this.contractNo = contractNo;
    }

    private java.lang.String conveyanceEnum;

    public java.lang.String getConveyanceEnum()
    {
        return this.conveyanceEnum;
    }

    public void setConveyanceEnum(java.lang.String conveyanceEnum)
    {
        this.conveyanceEnum = conveyanceEnum;
    }

    private java.lang.String carryTypeEnum;

    public java.lang.String getCarryTypeEnum()
    {
        return this.carryTypeEnum;
    }

    public void setCarryTypeEnum(java.lang.String carryTypeEnum)
    {
        this.carryTypeEnum = carryTypeEnum;
    }

    private java.lang.String shipperRemark;

    public java.lang.String getShipperRemark()
    {
        return this.shipperRemark;
    }

    public void setShipperRemark(java.lang.String shipperRemark)
    {
        this.shipperRemark = shipperRemark;
    }

    private java.lang.String carrierRemark;

    public java.lang.String getCarrierRemark()
    {
        return this.carrierRemark;
    }

    public void setCarrierRemark(java.lang.String carrierRemark)
    {
        this.carrierRemark = carrierRemark;
    }

    private java.lang.String levelEnum;

    public java.lang.String getLevelEnum()
    {
        return this.levelEnum;
    }

    public void setLevelEnum(java.lang.String levelEnum)
    {
        this.levelEnum = levelEnum;
    }

    private java.lang.String customerTypeEnum;

    public java.lang.String getCustomerTypeEnum()
    {
        return this.customerTypeEnum;
    }

    public void setCustomerTypeEnum(java.lang.String customerTypeEnum)
    {
        this.customerTypeEnum = customerTypeEnum;
    }

    private java.util.Date referTime;

    public java.util.Date getReferTime()
    {
        return this.referTime;
    }

    public void setReferTime(java.util.Date referTime)
    {
        this.referTime = referTime;
    }

    private static final java.text.DateFormat referTimeFormatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
    static { referTimeFormatter.setLenient(true); }

    public java.lang.String getReferTimeAsString()
    {
        return (referTime == null) ? null : referTimeFormatter.format(referTime);
    }

    public void setReferTimeAsString(java.lang.String referTime)
    {
        try
        {
            this.referTime = (org.apache.commons.lang.StringUtils.isBlank(referTime)) ? null : referTimeFormatter.parse(referTime);
        }
        catch (java.text.ParseException pe)
        {
            throw new java.lang.RuntimeException(pe);
        }
    }

    private java.lang.String linkMan;

    public java.lang.String getLinkMan()
    {
        return this.linkMan;
    }

    public void setLinkMan(java.lang.String linkMan)
    {
        this.linkMan = linkMan;
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

    private java.util.Date bookTime;

    public java.util.Date getBookTime()
    {
        return this.bookTime;
    }

    public void setBookTime(java.util.Date bookTime)
    {
        this.bookTime = bookTime;
    }

    private static final java.text.DateFormat bookTimeFormatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
    static { bookTimeFormatter.setLenient(true); }

    public java.lang.String getBookTimeAsString()
    {
        return (bookTime == null) ? null : bookTimeFormatter.format(bookTime);
    }

    public void setBookTimeAsString(java.lang.String bookTime)
    {
        try
        {
            this.bookTime = (org.apache.commons.lang.StringUtils.isBlank(bookTime)) ? null : bookTimeFormatter.parse(bookTime);
        }
        catch (java.text.ParseException pe)
        {
            throw new java.lang.RuntimeException(pe);
        }
    }

    private java.util.Date completeTime;

    public java.util.Date getCompleteTime()
    {
        return this.completeTime;
    }

    public void setCompleteTime(java.util.Date completeTime)
    {
        this.completeTime = completeTime;
    }

    private static final java.text.DateFormat completeTimeFormatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
    static { completeTimeFormatter.setLenient(true); }

    public java.lang.String getCompleteTimeAsString()
    {
        return (completeTime == null) ? null : completeTimeFormatter.format(completeTime);
    }

    public void setCompleteTimeAsString(java.lang.String completeTime)
    {
        try
        {
            this.completeTime = (org.apache.commons.lang.StringUtils.isBlank(completeTime)) ? null : completeTimeFormatter.parse(completeTime);
        }
        catch (java.text.ParseException pe)
        {
            throw new java.lang.RuntimeException(pe);
        }
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

    private java.lang.Long[] orderRow;

    public java.lang.Long[] getOrderRow()
    {
        return this.orderRow;
    }

    public void setOrderRow(java.lang.Long[] orderRow)
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
        customerOrderNo = null;
        contractNo = null;
        conveyanceEnum = null;
        carryTypeEnum = null;
        shipperRemark = null;
        carrierRemark = null;
        levelEnum = null;
        customerTypeEnum = null;
        referTime = null;
        linkMan = null;
        tel = null;
        bookTime = null;
        completeTime = null;
        remark = null;
        id = null;
        orderRow = null;
        orderRowBackingList = null;
        customer = null;
        customerBackingList = null;
    }
}