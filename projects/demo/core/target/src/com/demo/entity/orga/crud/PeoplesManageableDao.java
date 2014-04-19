// license-header java merge-point
package com.demo.entity.orga.crud;

public interface PeoplesManageableDao
{
    public com.demo.entity.orga.Peoples create(java.lang.String peopleName, java.lang.String peoplePassword, java.lang.String peopleStatus, java.util.Date birthDay, java.lang.String sex, java.lang.String birthPlace, java.lang.String address, java.lang.String tel, java.lang.String engageMode, java.util.Date engageDate, java.lang.String gradeEnum, java.lang.String remark, java.lang.Long id);

    public com.demo.entity.orga.Peoples readById(java.lang.Long id);

    public java.util.List read(java.lang.String peopleName, java.lang.String peoplePassword, java.lang.String peopleStatus, java.util.Date birthDay, java.lang.String sex, java.lang.String birthPlace, java.lang.String address, java.lang.String tel, java.lang.String engageMode, java.util.Date engageDate, java.lang.String gradeEnum, java.lang.String remark, java.lang.Long id);

    public java.util.List readAll();

    public com.demo.entity.orga.Peoples update(java.lang.String peopleName, java.lang.String peoplePassword, java.lang.String peopleStatus, java.util.Date birthDay, java.lang.String sex, java.lang.String birthPlace, java.lang.String address, java.lang.String tel, java.lang.String engageMode, java.util.Date engageDate, java.lang.String gradeEnum, java.lang.String remark, java.lang.Long id);

    public void delete(java.lang.Long[] ids);

}