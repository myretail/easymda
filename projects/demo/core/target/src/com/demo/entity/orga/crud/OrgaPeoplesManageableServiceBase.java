// license-header java merge-point
package com.demo.entity.orga.crud;

public final class OrgaPeoplesManageableServiceBase
    implements OrgaPeoplesManageableService
{
    private com.demo.entity.orga.crud.OrgaPeoplesManageableDao dao;

    public void setDao(com.demo.entity.orga.crud.OrgaPeoplesManageableDao dao)
    {
        this.dao = dao;
    }

    protected com.demo.entity.orga.crud.OrgaPeoplesManageableDao getDao()
    {
        return this.dao;
    }

    public com.demo.entity.orga.crud.OrgaPeoplesValueObject create(java.lang.Long id, java.lang.Long orga, java.lang.Long people)
        throws Exception
    {
        if (orga == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.orga.crud.OrgaPeoplesManageableService.create(java.lang.Long id, java.lang.Long orga, java.lang.Long people) - 'orga' can not be null");
        }

        if (people == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.orga.crud.OrgaPeoplesManageableService.create(java.lang.Long id, java.lang.Long orga, java.lang.Long people) - 'people' can not be null");
        }

        return toValueObject(dao.create(id, orga, people));
    }

    public com.demo.entity.orga.crud.OrgaPeoplesValueObject readById(java.lang.Long id)
        throws Exception
    {
        return toValueObject(dao.readById(id));
    }

    public java.util.List read(java.lang.Long id, java.lang.Long orga, java.lang.Long people)
        throws Exception
    {
        return toValueObjects(dao.read(id, orga, people));
    }

    public java.util.List readAll()
        throws Exception
    {
        return toValueObjects(dao.readAll());
    }

    public java.util.Map readBackingLists()
        throws Exception
    {
        return getDao().readBackingLists();
    }

    public com.demo.entity.orga.crud.OrgaPeoplesValueObject update(java.lang.Long id, java.lang.Long orga, java.lang.Long people)
        throws Exception
    {
        if (id == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.orga.crud.OrgaPeoplesManageableService.update(java.lang.Long id, java.lang.Long orga, java.lang.Long people) - 'id' can not be null");
        }

        if (orga == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.orga.crud.OrgaPeoplesManageableService.update(java.lang.Long id, java.lang.Long orga, java.lang.Long people) - 'orga' can not be null");
        }

        if (people == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.orga.crud.OrgaPeoplesManageableService.update(java.lang.Long id, java.lang.Long orga, java.lang.Long people) - 'people' can not be null");
        }

        return toValueObject(dao.update(id, orga, people));
    }

    public void delete(java.lang.Long[] ids)
        throws Exception
    {
        if (ids == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.orga.crud.OrgaPeoplesManageableService.delete(java.lang.Long[] ids) - 'ids' can not be null");
        }

        dao.delete(ids);
    }


    private static java.util.List toValueObjects(java.util.Collection entities)
    {
        final java.util.List list = new java.util.ArrayList();

        for (java.util.Iterator iterator = entities.iterator(); iterator.hasNext();)
        {
            list.add(toValueObject((com.demo.entity.orga.OrgaPeoples)iterator.next()));
        }

        return list;
    }

    private static com.demo.entity.orga.crud.OrgaPeoplesValueObject toValueObject(com.demo.entity.orga.OrgaPeoples entity)
    {
        final com.demo.entity.orga.crud.OrgaPeoplesValueObject valueObject = new com.demo.entity.orga.crud.OrgaPeoplesValueObject();

        valueObject.setId(entity.getId());

        final com.demo.entity.orga.Orga orga = entity.getOrga();
        if (orga != null)
        {
            valueObject.setOrga(orga.getId());
        }

        final com.demo.entity.orga.Peoples people = entity.getPeople();
        if (people != null)
        {
            valueObject.setPeople(people.getId());
        }

        return valueObject;
    }
}
