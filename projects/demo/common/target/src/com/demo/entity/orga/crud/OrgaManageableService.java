// license-header java merge-point
package com.demo.entity.orga.crud;

public interface OrgaManageableService
{
    public com.demo.entity.orga.crud.OrgaValueObject create(java.lang.String orgaName, java.lang.String orgaCode, java.lang.String sno, java.lang.String remark, long parentId, java.lang.Long id)
        throws Exception;

    public com.demo.entity.orga.crud.OrgaValueObject readById(java.lang.Long id)
        throws Exception;

    public java.util.List read(java.lang.String orgaName, java.lang.String orgaCode, java.lang.String sno, java.lang.String remark, long parentId, java.lang.Long id)
        throws Exception;

    public java.util.List readAll()
        throws Exception;

    public com.demo.entity.orga.crud.OrgaValueObject update(java.lang.String orgaName, java.lang.String orgaCode, java.lang.String sno, java.lang.String remark, long parentId, java.lang.Long id)
        throws Exception;

    public void delete(java.lang.Long[] ids)
        throws Exception;

}
