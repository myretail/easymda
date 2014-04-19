// license-header java merge-point
package com.demo.entity.orga.crud;

public interface OrgaManageableDao
{
    public com.demo.entity.orga.Orga create(java.lang.String orgaName, java.lang.String orgaCode, java.lang.String sno, java.lang.String remark, long parentId, java.lang.Long id);

    public com.demo.entity.orga.Orga readById(java.lang.Long id);

    public java.util.List read(java.lang.String orgaName, java.lang.String orgaCode, java.lang.String sno, java.lang.String remark, long parentId, java.lang.Long id);

    public java.util.List readAll();

    public com.demo.entity.orga.Orga update(java.lang.String orgaName, java.lang.String orgaCode, java.lang.String sno, java.lang.String remark, long parentId, java.lang.Long id);

    public void delete(java.lang.Long[] ids);

}