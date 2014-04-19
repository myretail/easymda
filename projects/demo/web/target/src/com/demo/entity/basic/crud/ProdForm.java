// license-header java merge-point
package com.demo.entity.basic.crud;

public final class ProdForm
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

    private java.lang.String prodName;

    public java.lang.String getProdName()
    {
        return this.prodName;
    }

    public void setProdName(java.lang.String prodName)
    {
        this.prodName = prodName;
    }

    private java.lang.String code;

    public java.lang.String getCode()
    {
        return this.code;
    }

    public void setCode(java.lang.String code)
    {
        this.code = code;
    }

    private double price;

    public double getPrice()
    {
        return this.price;
    }

    public void setPrice(double price)
    {
        this.price = price;
    }

    private java.util.Date datef;

    public java.util.Date getDatef()
    {
        return this.datef;
    }

    public void setDatef(java.util.Date datef)
    {
        this.datef = datef;
    }

    private static final java.text.DateFormat datefFormatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
    static { datefFormatter.setLenient(true); }

    public java.lang.String getDatefAsString()
    {
        return (datef == null) ? null : datefFormatter.format(datef);
    }

    public void setDatefAsString(java.lang.String datef)
    {
        try
        {
            this.datef = (org.apache.commons.lang.StringUtils.isBlank(datef)) ? null : datefFormatter.parse(datef);
        }
        catch (java.text.ParseException pe)
        {
            throw new java.lang.RuntimeException(pe);
        }
    }

    private java.lang.String prodType;

    public java.lang.String getProdType()
    {
        return this.prodType;
    }

    public void setProdType(java.lang.String prodType)
    {
        this.prodType = prodType;
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

    private java.lang.Long prodCust;

    public java.lang.Long getProdCust()
    {
        return this.prodCust;
    }

    public void setProdCust(java.lang.Long prodCust)
    {
        this.prodCust = prodCust;
    }

    private java.util.List prodCustBackingList;

    public java.util.List getProdCustBackingList()
    {
        return this.prodCustBackingList;
    }

    public void setProdCustBackingList(java.util.List prodCustBackingList)
    {
        this.prodCustBackingList = prodCustBackingList;
    }

    private java.lang.Long principal;

    public java.lang.Long getPrincipal()
    {
        return this.principal;
    }

    public void setPrincipal(java.lang.Long principal)
    {
        this.principal = principal;
    }

    private java.util.List principalBackingList;

    public java.util.List getPrincipalBackingList()
    {
        return this.principalBackingList;
    }

    public void setPrincipalBackingList(java.util.List principalBackingList)
    {
        this.principalBackingList = principalBackingList;
    }

    /**
     * @see org.apache.struts.validator.ValidatorForm#reset(org.apache.struts.action.ActionMapping,javax.servlet.http.HttpServletRequest)
     */
    public void reset(org.apache.struts.action.ActionMapping mapping, javax.servlet.http.HttpServletRequest request)
    {
        prodName = null;
        code = null;
        price = 0;
        datef = null;
        prodType = null;
        id = null;
        prodCust = null;
        prodCustBackingList = null;
        principal = null;
        principalBackingList = null;
    }
}