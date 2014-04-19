// license-header java merge-point
package com.demo.entity.order.crud;

import org.hibernate.Session;
import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Expression;

public final class carManageableDaoBase
    extends org.springframework.orm.hibernate3.support.HibernateDaoSupport
    implements carManageableDao
{
    private com.demo.entity.order.carDao dao;

    public void setDao(com.demo.entity.order.carDao dao)
    {
        this.dao = dao;
    }

    protected com.demo.entity.order.carDao getDao()
    {
        return this.dao;
    }

    private java.util.Set findTaskFormByIds(java.lang.Long[] ids)
    {
        final Session session = this.getSession(false);
        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.order.TaskFormImpl.class);
            criteria.add(Expression.in("id", ids));
            return new java.util.HashSet(criteria.list());
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

    public com.demo.entity.order.car create(double load, java.lang.Long id)
    {
        final com.demo.entity.order.car entity = new com.demo.entity.order.carImpl();
        entity.setLoad(load);
        entity.setId(id);

        return (com.demo.entity.order.car)this.getDao().create(entity);
    }

    public com.demo.entity.order.car readById(java.lang.Long id)
    {
        return getDao().load(id);
    }

    public java.util.List read(double load, java.lang.Long id)
    {
        final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.order.carImpl.class);

            criteria.add(Expression.eq("load", new java.lang.Double(load)));
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
            final Criteria criteria = session.createCriteria(com.demo.entity.order.carImpl.class);
            criteria.setMaxResults(250);
            return criteria.list();
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

    public com.demo.entity.order.car update(double load, java.lang.Long id)
    {
        final com.demo.entity.order.car entity = this.getDao().load(id);

        entity.setLoad(load);

        this.getDao().update(entity);
        return entity;
    }

    public void delete(java.lang.Long[] ids)
    {
        final Session session = getSession(false);
        try
        {
            final org.hibernate.Query queryObject =
                session.createQuery("delete com.demo.entity.order.carImpl where id in (:ids)");
            queryObject.setParameterList("ids", ids);
            queryObject.executeUpdate();
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

}