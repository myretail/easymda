// license-header java merge-point
package com.demo.entity.order.crud;

import org.hibernate.Session;
import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Expression;

public final class TaskManageableDaoBase
    extends org.springframework.orm.hibernate3.support.HibernateDaoSupport
    implements TaskManageableDao
{
    private com.demo.entity.order.TaskDao dao;

    public void setDao(com.demo.entity.order.TaskDao dao)
    {
        this.dao = dao;
    }

    protected com.demo.entity.order.TaskDao getDao()
    {
        return this.dao;
    }

    private com.demo.entity.order.TaskFormDao taskFormDao = null;

    public void setTaskFormDao(com.demo.entity.order.TaskFormDao taskFormDao)
    {
        this.taskFormDao = taskFormDao;
    }

    protected com.demo.entity.order.TaskFormDao getTaskFormDao()
    {
        return this.taskFormDao;
    }

    private java.util.Set findOrderRowTaskByIds(java.lang.Long[] ids)
    {
        final Session session = this.getSession(false);
        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.order.OrderRowTaskImpl.class);
            criteria.add(Expression.in("id", ids));
            return new java.util.HashSet(criteria.list());
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
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

    public com.demo.entity.order.Task create(double num, double volumne, java.lang.String remark, java.lang.Long id, java.lang.Long taskForm)
    {
        final com.demo.entity.order.Task entity = new com.demo.entity.order.TaskImpl();
        entity.setNum(num);
        entity.setVolumne(volumne);
        entity.setRemark(remark);
        entity.setId(id);
        com.demo.entity.order.TaskForm taskFormEntity = null;
        if (taskForm != null)
        {
            taskFormEntity = (com.demo.entity.order.TaskForm)getTaskFormDao().load(taskForm);
        }

        entity.setTaskForm(taskFormEntity);


        return (com.demo.entity.order.Task)this.getDao().create(entity);
    }

    public com.demo.entity.order.Task readById(java.lang.Long id)
    {
        return getDao().load(id);
    }

    public java.util.List read(double num, double volumne, java.lang.String remark, java.lang.Long id, java.lang.Long taskForm)
    {
        final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.order.TaskImpl.class);

            criteria.add(Expression.eq("num", new java.lang.Double(num)));
            criteria.add(Expression.eq("volumne", new java.lang.Double(volumne)));
            if (remark != null)
                criteria.add(Expression.ilike("remark", remark, MatchMode.START));
            if (id != null)
            criteria.add(Expression.eq("id", id));
            if (taskForm != null) criteria.createCriteria("taskForm").add(Expression.eq("id", taskForm));
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
            final Criteria criteria = session.createCriteria(com.demo.entity.order.TaskImpl.class);
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
            lists.put("taskForm", session.createQuery("select item.id, item.id from com.demo.entity.order.TaskForm item order by item.id").list());
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
        return lists;
    }

    public com.demo.entity.order.Task update(double num, double volumne, java.lang.String remark, java.lang.Long id, java.lang.Long taskForm)
    {
        final com.demo.entity.order.Task entity = this.getDao().load(id);

        entity.setNum(num);
        entity.setVolumne(volumne);
        entity.setRemark(remark);
        com.demo.entity.order.TaskForm taskFormEntity = null;
        if (taskForm != null)
        {
            taskFormEntity = getTaskFormDao().load(taskForm);
        }

        entity.setTaskForm(taskFormEntity);


        this.getDao().update(entity);
        return entity;
    }

    public void delete(java.lang.Long[] ids)
    {
        final Session session = getSession(false);
        try
        {
            final org.hibernate.Query queryObject =
                session.createQuery("delete com.demo.entity.order.TaskImpl where id in (:ids)");
            queryObject.setParameterList("ids", ids);
            queryObject.executeUpdate();
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

}