// license-header java merge-point
package com.demo.entity.basic.crud;

public class ContactValueObject
    implements java.io.Serializable
{
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

}