// license-header java merge-point
package com.demo.entity.orga.crud;

public final class OrgaManageableServiceBase
    implements OrgaManageableService
{
    private com.demo.entity.orga.crud.OrgaManageableDao dao;

    public void setDao(com.demo.entity.orga.crud.OrgaManageableDao dao)
    {
        this.dao = dao;
    }

    protected com.demo.entity.orga.crud.OrgaManageableDao getDao()
    {
        return this.dao;
    }

    public com.demo.entity.orga.crud.OrgaValueObject create(java.lang.String orgaName, java.lang.String orgaCode, java.lang.String sno, java.lang.String remark, long parentId, java.lang.Long id)
        throws Exception
    {
        if (orgaName == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.orga.crud.OrgaManageableService.create(java.lang.String orgaName, java.lang.String orgaCode, java.lang.String sno, java.lang.String remark, long parentId, java.lang.Long id) - 'orgaName' can not be null");
        }

        if (orgaCode == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.orga.crud.OrgaManageableService.create(java.lang.String orgaName, java.lang.String orgaCode, java.lang.String sno, java.lang.String remark, long parentId, java.lang.Long id) - 'orgaCode' can not be null");
        }

        return toValueObject(dao.create(orgaName, orgaCode, sno, remark, parentId, id));
    }

    public com.demo.entity.orga.crud.OrgaValueObject readById(java.lang.Long id)
        throws Exception
    {
        return toValueObject(dao.readById(id));
    }

    public java.util.List read(java.lang.String orgaName, java.lang.String orgaCode, java.lang.String sno, java.lang.String remark, long parentId, java.lang.Long id)
        throws Exception
    {
        return toValueObjects(dao.read(orgaName, orgaCode, sno, remark, parentId, id));
    }

    public java.util.List readAll()
        throws Exception
    {
        return toValueObjects(dao.readAll());
    }

    public com.demo.entity.orga.crud.OrgaValueObject update(java.lang.String orgaName, java.lang.String orgaCode, java.lang.String sno, java.lang.String remark, long parentId, java.lang.Long id)
        throws Exception
    {
        if (orgaName == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.orga.crud.OrgaManageableService.update(java.lang.String orgaName, java.lang.String orgaCode, java.lang.String sno, java.lang.String remark, long parentId, java.lang.Long id) - 'orgaName' can not be null");
        }

        if (orgaCode == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.orga.crud.OrgaManageableService.update(java.lang.String orgaName, java.lang.String orgaCode, java.lang.String sno, java.lang.String remark, long parentId, java.lang.Long id) - 'orgaCode' can not be null");
        }

        if (id == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.orga.crud.OrgaManageableService.update(java.lang.String orgaName, java.lang.String orgaCode, java.lang.String sno, java.lang.String remark, long parentId, java.lang.Long id) - 'id' can not be null");
        }

        return toValueObject(dao.update(orgaName, orgaCode, sno, remark, parentId, id));
    }

    public void delete(java.lang.Long[] ids)
        throws Exception
    {
        if (ids == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.orga.crud.OrgaManageableService.delete(java.lang.Long[] ids) - 'ids' can not be null");
        }

        dao.delete(ids);
    }


    private static java.util.List toValueObjects(java.util.Collection entities)
    {
        final java.util.List list = new java.util.ArrayList();

        for (java.util.Iterator iterator = entities.iterator(); iterator.hasNext();)
        {
            list.add(toValueObject((com.demo.entity.orga.Orga)iterator.next()));
        }

        return list;
    }

    private static com.demo.entity.orga.crud.OrgaValueObject toValueObject(com.demo.entity.orga.Orga entity)
    {
        final com.demo.entity.orga.crud.OrgaValueObject valueObject = new com.demo.entity.orga.crud.OrgaValueObject();

        valueObject.setOrgaName(entity.getOrgaName());
        valueObject.setOrgaCode(entity.getOrgaCode());
        valueObject.setSno(entity.getSno());
        valueObject.setRemark(entity.getRemark());
        valueObject.setParentId(entity.getParentId());
        valueObject.setId(entity.getId());

        return valueObject;
    }
}
