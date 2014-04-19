// license-header java merge-point
package com.demo.entity.order.crud;

import org.hibernate.Session;
import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Expression;

public final class OrderRowTaskManageableDaoBase
    extends org.springframework.orm.hibernate3.support.HibernateDaoSupport
    implements OrderRowTaskManageableDao
{
    private com.demo.entity.order.OrderRowTaskDao dao;

    public void setDao(com.demo.entity.order.OrderRowTaskDao dao)
    {
        this.dao = dao;
    }

    protected com.demo.entity.order.OrderRowTaskDao getDao()
    {
        return this.dao;
    }

    private com.demo.entity.order.OrderRowdDao orderRowDao = null;

    public void setOrderRowDao(com.demo.entity.order.OrderRowdDao orderRowDao)
    {
        this.orderRowDao = orderRowDao;
    }

    protected com.demo.entity.order.OrderRowdDao getOrderRowDao()
    {
        return this.orderRowDao;
    }

    private com.demo.entity.order.TaskDao taskDao = null;

    public void setTaskDao(com.demo.entity.order.TaskDao taskDao)
    {
        this.taskDao = taskDao;
    }

    protected com.demo.entity.order.TaskDao getTaskDao()
    {
        return this.taskDao;
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

    private java.util.Set findTaskByIds(java.lang.Long[] ids)
    {
        final Session session = this.getSession(false);
        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.order.TaskImpl.class);
            criteria.add(Expression.in("id", ids));
            return new java.util.HashSet(criteria.list());
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

    public com.demo.entity.order.OrderRowTask create(java.lang.Long id, java.lang.Long orderRow, java.lang.Long task)
    {
        final com.demo.entity.order.OrderRowTask entity = new com.demo.entity.order.OrderRowTaskImpl();
        entity.setId(id);
        com.demo.entity.order.OrderRowd orderRowEntity = null;
        if (orderRow != null)
        {
            orderRowEntity = (com.demo.entity.order.OrderRowd)getOrderRowDao().load(orderRow);
        }

        entity.setOrderRow(orderRowEntity);

        com.demo.entity.order.Task taskEntity = null;
        if (task != null)
        {
            taskEntity = (com.demo.entity.order.Task)getTaskDao().load(task);
        }

        entity.setTask(taskEntity);


        return (com.demo.entity.order.OrderRowTask)this.getDao().create(entity);
    }

    public com.demo.entity.order.OrderRowTask readById(java.lang.Long id)
    {
        return getDao().load(id);
    }

    public java.util.List read(java.lang.Long id, java.lang.Long orderRow, java.lang.Long task)
    {
        final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.order.OrderRowTaskImpl.class);

            if (id != null)
            criteria.add(Expression.eq("id", id));
            if (orderRow != null) criteria.createCriteria("orderRow").add(Expression.eq("id", orderRow));
            if (task != null) criteria.createCriteria("task").add(Expression.eq("id", task));
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
            final Criteria criteria = session.createCriteria(com.demo.entity.order.OrderRowTaskImpl.class);
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
            lists.put("orderRow", session.createQuery("select item.id, item.id from com.demo.entity.order.OrderRowd item order by item.id").list());
            lists.put("task", session.createQuery("select item.id, item.id from com.demo.entity.order.Task item order by item.id").list());
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
        return lists;
    }

    public com.demo.entity.order.OrderRowTask update(java.lang.Long id, java.lang.Long orderRow, java.lang.Long task)
    {
        final com.demo.entity.order.OrderRowTask entity = this.getDao().load(id);

        com.demo.entity.order.OrderRowd orderRowEntity = null;
        if (orderRow != null)
        {
            orderRowEntity = getOrderRowDao().load(orderRow);
        }

        entity.setOrderRow(orderRowEntity);

        com.demo.entity.order.Task taskEntity = null;
        if (task != null)
        {
            taskEntity = getTaskDao().load(task);
        }

        entity.setTask(taskEntity);


        this.getDao().update(entity);
        return entity;
    }

    public void delete(java.lang.Long[] ids)
    {
        final Session session = getSession(false);
        try
        {
            final org.hibernate.Query queryObject =
                session.createQuery("delete com.demo.entity.order.OrderRowTaskImpl where id in (:ids)");
            queryObject.setParameterList("ids", ids);
            queryObject.executeUpdate();
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

}