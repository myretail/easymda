// license-header java merge-point
package com.demo.entity.orga.crud;

import org.hibernate.Session;
import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Expression;

public final class PeoplesManageableDaoBase
    extends org.springframework.orm.hibernate3.support.HibernateDaoSupport
    implements PeoplesManageableDao
{
    private com.demo.entity.orga.PeoplesDao dao;

    public void setDao(com.demo.entity.orga.PeoplesDao dao)
    {
        this.dao = dao;
    }

    protected com.demo.entity.orga.PeoplesDao getDao()
    {
        return this.dao;
    }

    private java.util.Set findProdByIds(java.lang.Long[] ids)
    {
        final Session session = this.getSession(false);
        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.basic.ProdImpl.class);
            criteria.add(Expression.in("id", ids));
            return new java.util.HashSet(criteria.list());
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

    private java.util.Set findOrgaPeoplesByIds(java.lang.Long[] ids)
    {
        final Session session = this.getSession(false);
        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.orga.OrgaPeoplesImpl.class);
            criteria.add(Expression.in("id", ids));
            return new java.util.HashSet(criteria.list());
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

    public com.demo.entity.orga.Peoples create(java.lang.String peopleName, java.lang.String peoplePassword, java.lang.String peopleStatus, java.util.Date birthDay, java.lang.String sex, java.lang.String birthPlace, java.lang.String address, java.lang.String tel, java.lang.String engageMode, java.util.Date engageDate, java.lang.String gradeEnum, java.lang.String remark, java.lang.Long id)
    {
        final com.demo.entity.orga.Peoples entity = new com.demo.entity.orga.PeoplesImpl();
        entity.setPeopleName(peopleName);
        entity.setPeoplePassword(peoplePassword);
        entity.setPeopleStatus(peopleStatus);
        entity.setBirthDay(birthDay);
        entity.setSex(sex);
        entity.setBirthPlace(birthPlace);
        entity.setAddress(address);
        entity.setTel(tel);
        entity.setEngageMode(engageMode);
        entity.setEngageDate(engageDate);
        entity.setGradeEnum(gradeEnum);
        entity.setRemark(remark);
        entity.setId(id);

        return (com.demo.entity.orga.Peoples)this.getDao().create(entity);
    }

    public com.demo.entity.orga.Peoples readById(java.lang.Long id)
    {
        return getDao().load(id);
    }

    public java.util.List read(java.lang.String peopleName, java.lang.String peoplePassword, java.lang.String peopleStatus, java.util.Date birthDay, java.lang.String sex, java.lang.String birthPlace, java.lang.String address, java.lang.String tel, java.lang.String engageMode, java.util.Date engageDate, java.lang.String gradeEnum, java.lang.String remark, java.lang.Long id)
    {
        final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.orga.PeoplesImpl.class);

            if (peopleName != null)
                criteria.add(Expression.ilike("peopleName", peopleName, MatchMode.START));
            if (peoplePassword != null)
                criteria.add(Expression.ilike("peoplePassword", peoplePassword, MatchMode.START));
            if (peopleStatus != null)
                criteria.add(Expression.ilike("peopleStatus", peopleStatus, MatchMode.START));
            if (birthDay != null)
            {
                // we check whether or not the user supplied time information within this particular date argument
                // if he/she didn't we assume he/she wishes to search in the scope of the entire day
                final java.util.Calendar calendar = new java.util.GregorianCalendar();
                calendar.setTime(birthDay);
                if ( calendar.get(java.util.Calendar.HOUR) != 0
                     || calendar.get(java.util.Calendar.MINUTE) != 0
                     || calendar.get(java.util.Calendar.SECOND) != 0
                     || calendar.get(java.util.Calendar.MILLISECOND) != 0 )
                {
                    criteria.add(Expression.eq("birthDay", birthDay));
                }
                else
                {
                    calendar.add(java.util.Calendar.DATE, 1);
                    criteria.add(Expression.between("birthDay", birthDay, calendar.getTime()));
                }
            }
            if (sex != null)
                criteria.add(Expression.ilike("sex", sex, MatchMode.START));
            if (birthPlace != null)
                criteria.add(Expression.ilike("birthPlace", birthPlace, MatchMode.START));
            if (address != null)
                criteria.add(Expression.ilike("address", address, MatchMode.START));
            if (tel != null)
                criteria.add(Expression.ilike("tel", tel, MatchMode.START));
            if (engageMode != null)
                criteria.add(Expression.ilike("engageMode", engageMode, MatchMode.START));
            if (engageDate != null)
            {
                // we check whether or not the user supplied time information within this particular date argument
                // if he/she didn't we assume he/she wishes to search in the scope of the entire day
                final java.util.Calendar calendar = new java.util.GregorianCalendar();
                calendar.setTime(engageDate);
                if ( calendar.get(java.util.Calendar.HOUR) != 0
                     || calendar.get(java.util.Calendar.MINUTE) != 0
                     || calendar.get(java.util.Calendar.SECOND) != 0
                     || calendar.get(java.util.Calendar.MILLISECOND) != 0 )
                {
                    criteria.add(Expression.eq("engageDate", engageDate));
                }
                else
                {
                    calendar.add(java.util.Calendar.DATE, 1);
                    criteria.add(Expression.between("engageDate", engageDate, calendar.getTime()));
                }
            }
            if (gradeEnum != null)
                criteria.add(Expression.ilike("gradeEnum", gradeEnum, MatchMode.START));
            if (remark != null)
                criteria.add(Expression.ilike("remark", remark, MatchMode.START));
            if (id != null)
            criteria.add(Expression.eq("id", id));
            criteria.setMaxResults(250);

            return criteria.list();
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

    public java.util.List readAll()
    {
        final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.orga.PeoplesImpl.class);
            criteria.setMaxResults(250);
            return criteria.list();
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

    public com.demo.entity.orga.Peoples update(java.lang.String peopleName, java.lang.String peoplePassword, java.lang.String peopleStatus, java.util.Date birthDay, java.lang.String sex, java.lang.String birthPlace, java.lang.String address, java.lang.String tel, java.lang.String engageMode, java.util.Date engageDate, java.lang.String gradeEnum, java.lang.String remark, java.lang.Long id)
    {
        final com.demo.entity.orga.Peoples entity = this.getDao().load(id);

        entity.setPeopleName(peopleName);
        entity.setPeoplePassword(peoplePassword);
        entity.setPeopleStatus(peopleStatus);
        entity.setBirthDay(birthDay);
        entity.setSex(sex);
        entity.setBirthPlace(birthPlace);
        entity.setAddress(address);
        entity.setTel(tel);
        entity.setEngageMode(engageMode);
        entity.setEngageDate(engageDate);
        entity.setGradeEnum(gradeEnum);
        entity.setRemark(remark);

        this.getDao().update(entity);
        return entity;
    }

    public void delete(java.lang.Long[] ids)
    {
        final Session session = getSession(false);
        try
        {
            final org.hibernate.Query queryObject =
                session.createQuery("delete com.demo.entity.orga.PeoplesImpl where id in (:ids)");
            queryObject.setParameterList("ids", ids);
            queryObject.executeUpdate();
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

}