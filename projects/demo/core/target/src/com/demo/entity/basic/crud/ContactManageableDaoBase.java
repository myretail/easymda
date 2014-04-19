// license-header java merge-point
package com.demo.entity.basic.crud;

import org.hibernate.Session;
import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Expression;

public final class ContactManageableDaoBase
    extends org.springframework.orm.hibernate3.support.HibernateDaoSupport
    implements ContactManageableDao
{
    private com.demo.entity.basic.ContactDao dao;

    public void setDao(com.demo.entity.basic.ContactDao dao)
    {
        this.dao = dao;
    }

    protected com.demo.entity.basic.ContactDao getDao()
    {
        return this.dao;
    }

    private com.demo.entity.basic.CustomerDao customerDao = null;

    public void setCustomerDao(com.demo.entity.basic.CustomerDao customerDao)
    {
        this.customerDao = customerDao;
    }

    protected com.demo.entity.basic.CustomerDao getCustomerDao()
    {
        return this.customerDao;
    }

    private java.util.Set findCustomerByIds(java.lang.Long[] ids)
    {
        final Session session = this.getSession(false);
        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.basic.CustomerImpl.class);
            criteria.add(Expression.in("id", ids));
            return new java.util.HashSet(criteria.list());
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

    public com.demo.entity.basic.Contact create(java.lang.String codeContact, java.lang.Long id, java.lang.Long customer)
    {
        final com.demo.entity.basic.Contact entity = new com.demo.entity.basic.ContactImpl();
        entity.setCodeContact(codeContact);
        entity.setId(id);
        com.demo.entity.basic.Customer customerEntity = null;
        if (customer != null)
        {
            customerEntity = (com.demo.entity.basic.Customer)getCustomerDao().load(customer);
        }

        entity.setCustomer(customerEntity);


        return (com.demo.entity.basic.Contact)this.getDao().create(entity);
    }

    public com.demo.entity.basic.Contact readById(java.lang.Long id)
    {
        return getDao().load(id);
    }

    public java.util.List read(java.lang.String codeContact, java.lang.Long id, java.lang.Long customer)
    {
        final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.basic.ContactImpl.class);

            if (codeContact != null)
                criteria.add(Expression.ilike("codeContact", codeContact, MatchMode.START));
            if (id != null)
            criteria.add(Expression.eq("id", id));
            if (customer != null) criteria.createCriteria("customer").add(Expression.eq("id", customer));
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
            final Criteria criteria = session.createCriteria(com.demo.entity.basic.ContactImpl.class);
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
            lists.put("customer", session.createQuery("select item.id, item.id from com.demo.entity.basic.Customer item order by item.id").list());
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
        return lists;
    }

    public com.demo.entity.basic.Contact update(java.lang.String codeContact, java.lang.Long id, java.lang.Long customer)
    {
        final com.demo.entity.basic.Contact entity = this.getDao().load(id);

        entity.setCodeContact(codeContact);
        com.demo.entity.basic.Customer customerEntity = null;
        if (customer != null)
        {
            customerEntity = getCustomerDao().load(customer);
        }

        entity.setCustomer(customerEntity);


        this.getDao().update(entity);
        return entity;
    }

    public void delete(java.lang.Long[] ids)
    {
        final Session session = getSession(false);
        try
        {
            final org.hibernate.Query queryObject =
                session.createQuery("delete com.demo.entity.basic.ContactImpl where id in (:ids)");
            queryObject.setParameterList("ids", ids);
            queryObject.executeUpdate();
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

}