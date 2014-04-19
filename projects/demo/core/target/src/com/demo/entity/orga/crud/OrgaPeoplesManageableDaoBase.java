// license-header java merge-point
package com.demo.entity.orga.crud;

import org.hibernate.Session;
import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Expression;

public final class OrgaPeoplesManageableDaoBase
    extends org.springframework.orm.hibernate3.support.HibernateDaoSupport
    implements OrgaPeoplesManageableDao
{
    private com.demo.entity.orga.OrgaPeoplesDao dao;

    public void setDao(com.demo.entity.orga.OrgaPeoplesDao dao)
    {
        this.dao = dao;
    }

    protected com.demo.entity.orga.OrgaPeoplesDao getDao()
    {
        return this.dao;
    }

    private com.demo.entity.orga.OrgaDao orgaDao = null;

    public void setOrgaDao(com.demo.entity.orga.OrgaDao orgaDao)
    {
        this.orgaDao = orgaDao;
    }

    protected com.demo.entity.orga.OrgaDao getOrgaDao()
    {
        return this.orgaDao;
    }

    private com.demo.entity.orga.PeoplesDao peopleDao = null;

    public void setPeopleDao(com.demo.entity.orga.PeoplesDao peopleDao)
    {
        this.peopleDao = peopleDao;
    }

    protected com.demo.entity.orga.PeoplesDao getPeopleDao()
    {
        return this.peopleDao;
    }

    private java.util.Set findOrgaByIds(java.lang.Long[] ids)
    {
        final Session session = this.getSession(false);
        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.orga.OrgaImpl.class);
            criteria.add(Expression.in("id", ids));
            return new java.util.HashSet(criteria.list());
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

    private java.util.Set findPeoplesByIds(java.lang.Long[] ids)
    {
        final Session session = this.getSession(false);
        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.orga.PeoplesImpl.class);
            criteria.add(Expression.in("id", ids));
            return new java.util.HashSet(criteria.list());
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

    public com.demo.entity.orga.OrgaPeoples create(java.lang.Long id, java.lang.Long orga, java.lang.Long people)
    {
        final com.demo.entity.orga.OrgaPeoples entity = new com.demo.entity.orga.OrgaPeoplesImpl();
        entity.setId(id);
        com.demo.entity.orga.Orga orgaEntity = null;
        if (orga != null)
        {
            orgaEntity = (com.demo.entity.orga.Orga)getOrgaDao().load(orga);
        }

        entity.setOrga(orgaEntity);

        com.demo.entity.orga.Peoples peopleEntity = null;
        if (people != null)
        {
            peopleEntity = (com.demo.entity.orga.Peoples)getPeopleDao().load(people);
        }

        entity.setPeople(peopleEntity);


        return (com.demo.entity.orga.OrgaPeoples)this.getDao().create(entity);
    }

    public com.demo.entity.orga.OrgaPeoples readById(java.lang.Long id)
    {
        return getDao().load(id);
    }

    public java.util.List read(java.lang.Long id, java.lang.Long orga, java.lang.Long people)
    {
        final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.orga.OrgaPeoplesImpl.class);

            if (id != null)
            criteria.add(Expression.eq("id", id));
            if (orga != null) criteria.createCriteria("orga").add(Expression.eq("id", orga));
            if (people != null) criteria.createCriteria("people").add(Expression.eq("id", people));
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
            final Criteria criteria = session.createCriteria(com.demo.entity.orga.OrgaPeoplesImpl.class);
            criteria.setMaxResults(250);
            return criteria.list();
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

    public java.util.Map readBackingLists()
    {
        final java.util.Map lists = new java.util.HashMap();
        final Session session = this.getSession();

        try
        {
            lists.put("orga", session.createQuery("select item.id, item.id from com.demo.entity.orga.Orga item order by item.id").list());
            lists.put("people", session.createQuery("select item.id, item.id from com.demo.entity.orga.Peoples item order by item.id").list());
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
        return lists;
    }

    public com.demo.entity.orga.OrgaPeoples update(java.lang.Long id, java.lang.Long orga, java.lang.Long people)
    {
        final com.demo.entity.orga.OrgaPeoples entity = this.getDao().load(id);

        com.demo.entity.orga.Orga orgaEntity = null;
        if (orga != null)
        {
            orgaEntity = getOrgaDao().load(orga);
        }

        entity.setOrga(orgaEntity);

        com.demo.entity.orga.Peoples peopleEntity = null;
        if (people != null)
        {
            peopleEntity = getPeopleDao().load(people);
        }

        entity.setPeople(peopleEntity);


        this.getDao().update(entity);
        return entity;
    }

    public void delete(java.lang.Long[] ids)
    {
        final Session session = getSession(false);
        try
        {
            final org.hibernate.Query queryObject =
                session.createQuery("delete com.demo.entity.orga.OrgaPeoplesImpl where id in (:ids)");
            queryObject.setParameterList("ids", ids);
            queryObject.executeUpdate();
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

}