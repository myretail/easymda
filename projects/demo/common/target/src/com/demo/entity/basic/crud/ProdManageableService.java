// license-header java merge-point
package com.demo.entity.basic.crud;

public interface ProdManageableService
{
    public com.demo.entity.basic.crud.ProdValueObject create(java.lang.String prodName, java.lang.String code, double price, java.util.Date datef, java.lang.String prodType, java.lang.Long id, java.lang.Long prodCust, java.lang.Long principal)
        throws Exception;

    public com.demo.entity.basic.crud.ProdValueObject readById(java.lang.Long id)
        throws Exception;

    public java.util.List read(java.lang.String prodName, java.lang.String code, double price, java.util.Date datef, java.lang.String prodType, java.lang.Long id, java.lang.Long prodCust, java.lang.Long principal)
        throws Exception;

    public java.util.List readAll()
        throws Exception;

    public java.util.Map readBackingLists()
        throws Exception;

    public com.demo.entity.basic.crud.ProdValueObject update(java.lang.String prodName, java.lang.String code, double price, java.util.Date datef, java.lang.String prodType, java.lang.Long id, java.lang.Long prodCust, java.lang.Long principal)
        throws Exception;

    public void delete(java.lang.Long[] ids)
        throws Exception;

}
