// license-header java merge-point
package com.demo.entity.orga.crud;

public final class PeoplesManageableServiceBase
    implements PeoplesManageableService
{
    private com.demo.entity.orga.crud.PeoplesManageableDao dao;

    public void setDao(com.demo.entity.orga.crud.PeoplesManageableDao dao)
    {
        this.dao = dao;
    }

    protected com.demo.entity.orga.crud.PeoplesManageableDao getDao()
    {
        return this.dao;
    }

    public com.demo.entity.orga.crud.PeoplesValueObject create(java.lang.String peopleName, java.lang.String peoplePassword, java.lang.String peopleStatus, java.util.Date birthDay, java.lang.String sex, java.lang.String birthPlace, java.lang.String address, java.lang.String tel, java.lang.String engageMode, java.util.Date engageDate, java.lang.String gradeEnum, java.lang.String remark, java.lang.Long id)
        throws Exception
    {
        if (peopleName == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.orga.crud.PeoplesManageableService.create(java.lang.String peopleName, java.lang.String peoplePassword, java.lang.String peopleStatus, java.util.Date birthDay, java.lang.String sex, java.lang.String birthPlace, java.lang.String address, java.lang.String tel, java.lang.String engageMode, java.util.Date engageDate, java.lang.String gradeEnum, java.lang.String remark, java.lang.Long id) - 'peopleName' can not be null");
        }

        if (sex == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.orga.crud.PeoplesManageableService.create(java.lang.String peopleName, java.lang.String peoplePassword, java.lang.String peopleStatus, java.util.Date birthDay, java.lang.String sex, java.lang.String birthPlace, java.lang.String address, java.lang.String tel, java.lang.String engageMode, java.util.Date engageDate, java.lang.String gradeEnum, java.lang.String remark, java.lang.Long id) - 'sex' can not be null");
        }

        return toValueObject(dao.create(peopleName, peoplePassword, peopleStatus, birthDay, sex, birthPlace, address, tel, engageMode, engageDate, gradeEnum, remark, id));
    }

    public com.demo.entity.orga.crud.PeoplesValueObject readById(java.lang.Long id)
        throws Exception
    {
        return toValueObject(dao.readById(id));
    }

    public java.util.List read(java.lang.String peopleName, java.lang.String peoplePassword, java.lang.String peopleStatus, java.util.Date birthDay, java.lang.String sex, java.lang.String birthPlace, java.lang.String address, java.lang.String tel, java.lang.String engageMode, java.util.Date engageDate, java.lang.String gradeEnum, java.lang.String remark, java.lang.Long id)
        throws Exception
    {
        return toValueObjects(dao.read(peopleName, peoplePassword, peopleStatus, birthDay, sex, birthPlace, address, tel, engageMode, engageDate, gradeEnum, remark, id));
    }

    public java.util.List readAll()
        throws Exception
    {
        return toValueObjects(dao.readAll());
    }

    public com.demo.entity.orga.crud.PeoplesValueObject update(java.lang.String peopleName, java.lang.String peoplePassword, java.lang.String peopleStatus, java.util.Date birthDay, java.lang.String sex, java.lang.String birthPlace, java.lang.String address, java.lang.String tel, java.lang.String engageMode, java.util.Date engageDate, java.lang.String gradeEnum, java.lang.String remark, java.lang.Long id)
        throws Exception
    {
        if (peopleName == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.orga.crud.PeoplesManageableService.update(java.lang.String peopleName, java.lang.String peoplePassword, java.lang.String peopleStatus, java.util.Date birthDay, java.lang.String sex, java.lang.String birthPlace, java.lang.String address, java.lang.String tel, java.lang.String engageMode, java.util.Date engageDate, java.lang.String gradeEnum, java.lang.String remark, java.lang.Long id) - 'peopleName' can not be null");
        }

        if (sex == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.orga.crud.PeoplesManageableService.update(java.lang.String peopleName, java.lang.String peoplePassword, java.lang.String peopleStatus, java.util.Date birthDay, java.lang.String sex, java.lang.String birthPlace, java.lang.String address, java.lang.String tel, java.lang.String engageMode, java.util.Date engageDate, java.lang.String gradeEnum, java.lang.String remark, java.lang.Long id) - 'sex' can not be null");
        }

        if (id == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.orga.crud.PeoplesManageableService.update(java.lang.String peopleName, java.lang.String peoplePassword, java.lang.String peopleStatus, java.util.Date birthDay, java.lang.String sex, java.lang.String birthPlace, java.lang.String address, java.lang.String tel, java.lang.String engageMode, java.util.Date engageDate, java.lang.String gradeEnum, java.lang.String remark, java.lang.Long id) - 'id' can not be null");
        }

        return toValueObject(dao.update(peopleName, peoplePassword, peopleStatus, birthDay, sex, birthPlace, address, tel, engageMode, engageDate, gradeEnum, remark, id));
    }

    public void delete(java.lang.Long[] ids)
        throws Exception
    {
        if (ids == null)
        {
            throw new IllegalArgumentException(
                "com.demo.entity.orga.crud.PeoplesManageableService.delete(java.lang.Long[] ids) - 'ids' can not be null");
        }

        dao.delete(ids);
    }


    private static java.util.List toValueObjects(java.util.Collection entities)
    {
        final java.util.List list = new java.util.ArrayList();

        for (java.util.Iterator iterator = entities.iterator(); iterator.hasNext();)
        {
            list.add(toValueObject((com.demo.entity.orga.Peoples)iterator.next()));
        }

        return list;
    }

    private static com.demo.entity.orga.crud.PeoplesValueObject toValueObject(com.demo.entity.orga.Peoples entity)
    {
        final com.demo.entity.orga.crud.PeoplesValueObject valueObject = new com.demo.entity.orga.crud.PeoplesValueObject();

        valueObject.setPeopleName(entity.getPeopleName());
        valueObject.setPeoplePassword(entity.getPeoplePassword());
        valueObject.setPeopleStatus(entity.getPeopleStatus());
        valueObject.setBirthDay(entity.getBirthDay());
        valueObject.setSex(entity.getSex());
        valueObject.setBirthPlace(entity.getBirthPlace());
        valueObject.setAddress(entity.getAddress());
        valueObject.setTel(entity.getTel());
        valueObject.setEngageMode(entity.getEngageMode());
        valueObject.setEngageDate(entity.getEngageDate());
        valueObject.setGradeEnum(entity.getGradeEnum());
        valueObject.setRemark(entity.getRemark());
        valueObject.setId(entity.getId());

        return valueObject;
    }
}
