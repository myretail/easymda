// license-header java merge-point
package com.demo.entity.basic.crud;

import org.hibernate.Session;
import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Expression;

public final class CustomerManageableDaoBase
    extends org.springframework.orm.hibernate3.support.HibernateDaoSupport
    implements CustomerManageableDao
{
    private com.demo.entity.basic.CustomerDao dao;

    public void setDao(com.demo.entity.basic.CustomerDao dao)
    {
        this.dao = dao;
    }

    protected com.demo.entity.basic.CustomerDao getDao()
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

    private java.util.Set findContactByIds(java.lang.Long[] ids)
    {
        final Session session = this.getSession(false);
        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.basic.ContactImpl.class);
            criteria.add(Expression.in("id", ids));
            return new java.util.HashSet(criteria.list());
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

    private java.util.Set findOrderdByIds(java.lang.Long[] ids)
    {
        final Session session = this.getSession(false);
        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.order.OrderdImpl.class);
            criteria.add(Expression.in("id", ids));
            return new java.util.HashSet(criteria.list());
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

    public com.demo.entity.basic.Customer create(java.lang.String customerName, java.lang.String custEnum, java.lang.Long id)
    {
        final com.demo.entity.basic.Customer entity = new com.demo.entity.basic.CustomerImpl();
        entity.setCustomerName(customerName);
        entity.setCustEnum(custEnum);
        entity.setId(id);

        return (com.demo.entity.basic.Customer)this.getDao().create(entity);
    }

    public com.demo.entity.basic.Customer readById(java.lang.Long id)
    {
        return getDao().load(id);
    }

    public java.util.List read(java.lang.String customerName, java.lang.String custEnum, java.lang.Long id)
    {
        final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.basic.CustomerImpl.class);

            if (customerName != null)
                criteria.add(Expression.ilike("customerName", customerName, MatchMode.START));
            if (custEnum != null)
                criteria.add(Expression.ilike("custEnum", custEnum, MatchMode.START));
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
            final Criteria criteria = session.createCriteria(com.demo.entity.basic.CustomerImpl.class);
            criteria.setMaxResults(250);
            return criteria.list();
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

    public com.demo.entity.basic.Customer update(java.lang.String customerName, java.lang.String custEnum, java.lang.Long id)
    {
        final com.demo.entity.basic.Customer entity = this.getDao().load(id);

        entity.setCustomerName(customerName);
        entity.setCustEnum(custEnum);

        this.getDao().update(entity);
        return entity;
    }

    public void delete(java.lang.Long[] ids)
    {
        final Session session = getSession(false);
        try
        {
            final org.hibernate.Query queryObject =
                session.createQuery("delete com.demo.entity.basic.CustomerImpl where id in (:ids)");
            queryObject.setParameterList("ids", ids);
            queryObject.executeUpdate();
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

}