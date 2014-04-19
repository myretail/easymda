// license-header java merge-point
package com.demo.entity.orga.crud;

public interface OrgaPeoplesManageableService
{
    public com.demo.entity.orga.crud.OrgaPeoplesValueObject create(java.lang.Long id, java.lang.Long orga, java.lang.Long people)
        throws Exception;

    public com.demo.entity.orga.crud.OrgaPeoplesValueObject readById(java.lang.Long id)
        throws Exception;

    public java.util.List read(java.lang.Long id, java.lang.Long orga, java.lang.Long people)
        throws Exception;

    public java.util.List readAll()
        throws Exception;

    public java.util.Map readBackingLists()
        throws Exception;

    public com.demo.entity.orga.crud.OrgaPeoplesValueObject update(java.lang.Long id, java.lang.Long orga, java.lang.Long people)
        throws Exception;

    public void delete(java.lang.Long[] ids)
        throws Exception;

}
