// license-header java merge-point
package com.demo.entity.basic.crud;

public class EnumerationValueObject
    implements java.io.Serializable
{
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

}