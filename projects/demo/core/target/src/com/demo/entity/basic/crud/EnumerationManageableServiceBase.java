// license-header java merge-point
package com.demo.entity.basic.crud;

public final class EnumerationManageableServiceBase
    implements EnumerationManageableService
{
    private com.demo.entity.basic.crud.EnumerationManageableDao dao;

    public void setDao(com.demo.entity.basic.crud.EnumerationManageableDao dao)
    {
        this.dao = dao;
    }

    protected com.demo.entity.basic.crud.EnumerationManageableDao getDao()
    {
        return this.dao;
    }

    public com.demo.entity.basic.crud.EnumerationValueObject create(java.lang.String fieldName, java.lang.String enumerationType, java.lang.Long id)
        throws Exception
    {
        if (fieldName == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.basic.crud.EnumerationManageableService.create(java.lang.String fieldName, java.lang.String enumerationType, java.lang.Long id) - 'fieldName' can not be null");
        }

        if (enumerationType == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.basic.crud.EnumerationManageableService.create(java.lang.String fieldName, java.lang.String enumerationType, java.lang.Long id) - 'enumerationType' can not be null");
        }

        return toValueObject(dao.create(fieldName, enumerationType, id));
    }

    public com.demo.entity.basic.crud.EnumerationValueObject readById(java.lang.Long id)
        throws Exception
    {
        return toValueObject(dao.readById(id));
    }

    public java.util.List read(java.lang.String fieldName, java.lang.String enumerationType, java.lang.Long id)
        throws Exception
    {
        return toValueObjects(dao.read(fieldName, enumerationType, id));
    }

    public java.util.List readAll()
        throws Exception
    {
        return toValueObjects(dao.readAll());
    }

    public com.demo.entity.basic.crud.EnumerationValueObject update(java.lang.String fieldName, java.lang.String enumerationType, java.lang.Long id)
        throws Exception
    {
        if (fieldName == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.basic.crud.EnumerationManageableService.update(java.lang.String fieldName, java.lang.String enumerationType, java.lang.Long id) - 'fieldName' can not be null");
        }

        if (enumerationType == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.basic.crud.EnumerationManageableService.update(java.lang.String fieldName, java.lang.String enumerationType, java.lang.Long id) - 'enumerationType' can not be null");
        }

        if (id == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.basic.crud.EnumerationManageableService.update(java.lang.String fieldName, java.lang.String enumerationType, java.lang.Long id) - 'id' can not be null");
        }

        return toValueObject(dao.update(fieldName, enumerationType, id));
    }

    public void delete(java.lang.Long[] ids)
        throws Exception
    {
        if (ids == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.basic.crud.EnumerationManageableService.delete(java.lang.Long[] ids) - 'ids' can not be null");
        }

        dao.delete(ids);
    }


    private static java.util.List toValueObjects(java.util.Collection entities)
    {
        final java.util.List list = new java.util.ArrayList();

        for (java.util.Iterator iterator = entities.iterator(); iterator.hasNext();)
        {
            list.add(toValueObject((com.demo.entity.basic.Enumeration)iterator.next()));
        }

        return list;
    }

    private static com.demo.entity.basic.crud.EnumerationValueObject toValueObject(com.demo.entity.basic.Enumeration entity)
    {
        final com.demo.entity.basic.crud.EnumerationValueObject valueObject = new com.demo.entity.basic.crud.EnumerationValueObject();

        valueObject.setFieldName(entity.getFieldName());
        valueObject.setEnumerationType(entity.getEnumerationType());
        valueObject.setId(entity.getId());

        return valueObject;
    }
}
