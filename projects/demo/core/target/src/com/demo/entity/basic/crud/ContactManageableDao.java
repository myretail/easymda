// license-header java merge-point
package com.demo.entity.basic.crud;

public interface ContactManageableDao
{
    public com.demo.entity.basic.Contact create(java.lang.String codeContact, java.lang.Long id, java.lang.Long customer);

    public com.demo.entity.basic.Contact readById(java.lang.Long id);

    public java.util.List read(java.lang.String codeContact, java.lang.Long id, java.lang.Long customer);

    public java.util.List readAll();

    public java.util.Map readBackingLists();

    public com.demo.entity.basic.Contact update(java.lang.String codeContact, java.lang.Long id, java.lang.Long customer);

    public void delete(java.lang.Long[] ids);

}