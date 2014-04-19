// license-header java merge-point
package com.demo.entity.basic.crud;

public interface ContactManageableService
{
    public com.demo.entity.basic.crud.ContactValueObject create(java.lang.String codeContact, java.lang.Long id, java.lang.Long customer)
        throws Exception;

    public com.demo.entity.basic.crud.ContactValueObject readById(java.lang.Long id)
        throws Exception;

    public java.util.List read(java.lang.String codeContact, java.lang.Long id, java.lang.Long customer)
        throws Exception;

    public java.util.List readAll()
        throws Exception;

    public java.util.Map readBackingLists()
        throws Exception;

    public com.demo.entity.basic.crud.ContactValueObject update(java.lang.String codeContact, java.lang.Long id, java.lang.Long customer)
        throws Exception;

    public void delete(java.lang.Long[] ids)
        throws Exception;

}
