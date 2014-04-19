// license-header java merge-point
package com.demo.entity.order.crud;

import org.hibernate.Session;
import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Expression;

public final class PaymentManageableDaoBase
    extends org.springframework.orm.hibernate3.support.HibernateDaoSupport
    implements PaymentManageableDao
{
    private com.demo.entity.order.PaymentDao dao;

    public void setDao(com.demo.entity.order.PaymentDao dao)
    {
        this.dao = dao;
    }

    protected com.demo.entity.order.PaymentDao getDao()
    {
        return this.dao;
    }

    private com.demo.entity.order.OrderRowdDao paymentDao = null;

    public void setPaymentDao(com.demo.entity.order.OrderRowdDao paymentDao)
    {
        this.paymentDao = paymentDao;
    }

    protected com.demo.entity.order.OrderRowdDao getPaymentDao()
    {
        return this.paymentDao;
    }

    private java.util.Set findOrderRowdByIds(java.lang.Long[] ids)
    {
        final Session session = this.getSession(false);
        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.order.OrderRowdImpl.class);
            criteria.add(Expression.in("id", ids));
            return new java.util.HashSet(criteria.list());
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

    public com.demo.entity.order.Payment create(java.lang.String newAttr1, java.lang.String newAttr2, java.lang.Long id, java.lang.Long payment)
    {
        final com.demo.entity.order.Payment entity = new com.demo.entity.order.PaymentImpl();
        entity.setNewAttr1(newAttr1);
        entity.setNewAttr2(newAttr2);
        entity.setId(id);
        com.demo.entity.order.OrderRowd paymentEntity = null;
        if (payment != null)
        {
            paymentEntity = (com.demo.entity.order.OrderRowd)getPaymentDao().load(payment);
        }

        entity.setPayment(paymentEntity);


        return (com.demo.entity.order.Payment)this.getDao().create(entity);
    }

    public com.demo.entity.order.Payment readById(java.lang.Long id)
    {
        return getDao().load(id);
    }

    public java.util.List read(java.lang.String newAttr1, java.lang.String newAttr2, java.lang.Long id, java.lang.Long payment)
    {
        final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.order.PaymentImpl.class);

            if (newAttr1 != null)
                criteria.add(Expression.ilike("newAttr1", newAttr1, MatchMode.START));
            if (newAttr2 != null)
                criteria.add(Expression.ilike("newAttr2", newAttr2, MatchMode.START));
            if (id != null)
            criteria.add(Expression.eq("id", id));
            if (payment != null) criteria.createCriteria("payment").add(Expression.eq("id", payment));
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
            final Criteria criteria = session.createCriteria(com.demo.entity.order.PaymentImpl.class);
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
            lists.put("payment", session.createQuery("select item.id, item.id from com.demo.entity.order.OrderRowd item order by item.id").list());
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
        return lists;
    }

    public com.demo.entity.order.Payment update(java.lang.String newAttr1, java.lang.String newAttr2, java.lang.Long id, java.lang.Long payment)
    {
        final com.demo.entity.order.Payment entity = this.getDao().load(id);

        entity.setNewAttr1(newAttr1);
        entity.setNewAttr2(newAttr2);
        com.demo.entity.order.OrderRowd paymentEntity = null;
        if (payment != null)
        {
            paymentEntity = getPaymentDao().load(payment);
        }

        entity.setPayment(paymentEntity);


        this.getDao().update(entity);
        return entity;
    }

    public void delete(java.lang.Long[] ids)
    {
        final Session session = getSession(false);
        try
        {
            final org.hibernate.Query queryObject =
                session.createQuery("delete com.demo.entity.order.PaymentImpl where id in (:ids)");
            queryObject.setParameterList("ids", ids);
            queryObject.executeUpdate();
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

}