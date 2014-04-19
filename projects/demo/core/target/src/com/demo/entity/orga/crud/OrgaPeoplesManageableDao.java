// license-header java merge-point
package com.demo.entity.orga.crud;

public interface OrgaPeoplesManageableDao
{
    public com.demo.entity.orga.OrgaPeoples create(java.lang.Long id, java.lang.Long orga, java.lang.Long people);

    public com.demo.entity.orga.OrgaPeoples readById(java.lang.Long id);

    public java.util.List read(java.lang.Long id, java.lang.Long orga, java.lang.Long people);

    public java.util.List readAll();

    public java.util.Map readBackingLists();

    public com.demo.entity.orga.OrgaPeoples update(java.lang.Long id, java.lang.Long orga, java.lang.Long people);

    public void delete(java.lang.Long[] ids);

}