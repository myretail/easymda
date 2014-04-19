// license-header java merge-point
package com.demo.entity.basic.crud;

public interface ProdManageableDao
{
    public com.demo.entity.basic.Prod create(java.lang.String prodName, java.lang.String code, double price, java.util.Date datef, java.lang.String prodType, java.lang.Long id, java.lang.Long prodCust, java.lang.Long principal);

    public com.demo.entity.basic.Prod readById(java.lang.Long id);

    public java.util.List read(java.lang.String prodName, java.lang.String code, double price, java.util.Date datef, java.lang.String prodType, java.lang.Long id, java.lang.Long prodCust, java.lang.Long principal);

    public java.util.List readAll();

    public java.util.Map readBackingLists();

    public com.demo.entity.basic.Prod update(java.lang.String prodName, java.lang.String code, double price, java.util.Date datef, java.lang.String prodType, java.lang.Long id, java.lang.Long prodCust, java.lang.Long principal);

    public void delete(java.lang.Long[] ids);

}