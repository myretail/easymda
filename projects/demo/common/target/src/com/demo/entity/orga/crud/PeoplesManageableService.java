// license-header java merge-point
package com.demo.entity.orga.crud;

public interface PeoplesManageableService
{
    public com.demo.entity.orga.crud.PeoplesValueObject create(java.lang.String peopleName, java.lang.String peoplePassword, java.lang.String peopleStatus, java.util.Date birthDay, java.lang.String sex, java.lang.String birthPlace, java.lang.String address, java.lang.String tel, java.lang.String engageMode, java.util.Date engageDate, java.lang.String gradeEnum, java.lang.String remark, java.lang.Long id)
        throws Exception;

    public com.demo.entity.orga.crud.PeoplesValueObject readById(java.lang.Long id)
        throws Exception;

    public java.util.List read(java.lang.String peopleName, java.lang.String peoplePassword, java.lang.String peopleStatus, java.util.Date birthDay, java.lang.String sex, java.lang.String birthPlace, java.lang.String address, java.lang.String tel, java.lang.String engageMode, java.util.Date engageDate, java.lang.String gradeEnum, java.lang.String remark, java.lang.Long id)
        throws Exception;

    public java.util.List readAll()
        throws Exception;

    public com.demo.entity.orga.crud.PeoplesValueObject update(java.lang.String peopleName, java.lang.String peoplePassword, java.lang.String peopleStatus, java.util.Date birthDay, java.lang.String sex, java.lang.String birthPlace, java.lang.String address, java.lang.String tel, java.lang.String engageMode, java.util.Date engageDate, java.lang.String gradeEnum, java.lang.String remark, java.lang.Long id)
        throws Exception;

    public void delete(java.lang.Long[] ids)
        throws Exception;

}
