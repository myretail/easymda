// license-header java merge-point
package com.demo.entity.basic.crud;

import org.hibernate.Session;
import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Expression;

public final class EnumerationManageableDaoBase
    extends org.springframework.orm.hibernate3.support.HibernateDaoSupport
    implements EnumerationManageableDao
{
    private com.demo.entity.basic.EnumerationDao dao;

    public void setDao(com.demo.entity.basic.EnumerationDao dao)
    {
        this.dao = dao;
    }

    protected com.demo.entity.basic.EnumerationDao getDao()
    {
        return this.dao;
    }

    public com.demo.entity.basic.Enumeration create(java.lang.String fieldName, java.lang.String enumerationType, java.lang.Long id)
    {
        final com.demo.entity.basic.Enumeration entity = new com.demo.entity.basic.EnumerationImpl();
        entity.setFieldName(fieldName);
        entity.setEnumerationType(enumerationType);
        entity.setId(id);

        return (com.demo.entity.basic.Enumeration)this.getDao().create(entity);
    }

    public com.demo.entity.basic.Enumeration readById(java.lang.Long id)
    {
        return getDao().load(id);
    }

    public java.util.List read(java.lang.String fieldName, java.lang.String enumerationType, java.lang.Long id)
    {
        final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.basic.EnumerationImpl.class);

            if (fieldName != null)
                criteria.add(Expression.ilike("fieldName", fieldName, MatchMode.START));
            if (enumerationType != null)
                criteria.add(Expression.ilike("enumerationType", enumerationType, MatchMode.START));
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
            final Criteria criteria = session.createCriteria(com.demo.entity.basic.EnumerationImpl.class);
            criteria.setMaxResults(250);
            return criteria.list();
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

    public com.demo.entity.basic.Enumeration update(java.lang.String fieldName, java.lang.String enumerationType, java.lang.Long id)
    {
        final com.demo.entity.basic.Enumeration entity = this.getDao().load(id);

        entity.setFieldName(fieldName);
        entity.setEnumerationType(enumerationType);

        this.getDao().update(entity);
        return entity;
    }

    public void delete(java.lang.Long[] ids)
    {
        final Session session = getSession(false);
        try
        {
            final org.hibernate.Query queryObject =
                session.createQuery("delete com.demo.entity.basic.EnumerationImpl where id in (:ids)");
            queryObject.setParameterList("ids", ids);
            queryObject.executeUpdate();
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

}