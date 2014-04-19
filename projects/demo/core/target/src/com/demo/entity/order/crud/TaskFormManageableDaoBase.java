// license-header java merge-point
package com.demo.entity.order.crud;

import org.hibernate.Session;
import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Expression;

public final class TaskFormManageableDaoBase
    extends org.springframework.orm.hibernate3.support.HibernateDaoSupport
    implements TaskFormManageableDao
{
    private com.demo.entity.order.TaskFormDao dao;

    public void setDao(com.demo.entity.order.TaskFormDao dao)
    {
        this.dao = dao;
    }

    protected com.demo.entity.order.TaskFormDao getDao()
    {
        return this.dao;
    }

    private com.demo.entity.order.TaskDao tasksDao = null;

    public void setTasksDao(com.demo.entity.order.TaskDao tasksDao)
    {
        this.tasksDao = tasksDao;
    }

    protected com.demo.entity.order.TaskDao getTasksDao()
    {
        return this.tasksDao;
    }

    private com.demo.entity.order.carDao carDao = null;

    public void setCarDao(com.demo.entity.order.carDao carDao)
    {
        this.carDao = carDao;
    }

    protected com.demo.entity.order.carDao getCarDao()
    {
        return this.carDao;
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

    private java.util.Set findcarByIds(java.lang.Long[] ids)
    {
        final Session session = this.getSession(false);
        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.order.carImpl.class);
            criteria.add(Expression.in("id", ids));
            return new java.util.HashSet(criteria.list());
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

    public com.demo.entity.order.TaskForm create(java.util.Date setDate, java.lang.String formState, java.lang.String remark, java.lang.Long id, java.lang.Long[] tasks, java.lang.Long car)
    {
        final com.demo.entity.order.TaskForm entity = new com.demo.entity.order.TaskFormImpl();
        entity.setSetDate(setDate);
        entity.setFormState(formState);
        entity.setRemark(remark);
        entity.setId(id);
        final java.util.Set tasksEntities = (tasks != null && tasks.length > 0)
            ? this.findTaskByIds(tasks)
            : java.util.Collections.EMPTY_SET;

        entity.setTasks(tasksEntities);

        com.demo.entity.order.car carEntity = null;
        if (car != null)
        {
            carEntity = (com.demo.entity.order.car)getCarDao().load(car);
        }

        entity.setCar(carEntity);


        return (com.demo.entity.order.TaskForm)this.getDao().create(entity);
    }

    public com.demo.entity.order.TaskForm readById(java.lang.Long id)
    {
        return getDao().load(id);
    }

    public java.util.List read(java.util.Date setDate, java.lang.String formState, java.lang.String remark, java.lang.Long id, java.lang.Long[] tasks, java.lang.Long car)
    {
        final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.order.TaskFormImpl.class);

            if (setDate != null)
            {
                // we check whether or not the user supplied time information within this particular date argument
                // if he/she didn't we assume he/she wishes to search in the scope of the entire day
                final java.util.Calendar calendar = new java.util.GregorianCalendar();
                calendar.setTime(setDate);
                if ( calendar.get(java.util.Calendar.HOUR) != 0
                     || calendar.get(java.util.Calendar.MINUTE) != 0
                     || calendar.get(java.util.Calendar.SECOND) != 0
                     || calendar.get(java.util.Calendar.MILLISECOND) != 0 )
                {
                    criteria.add(Expression.eq("setDate", setDate));
                }
                else
                {
                    calendar.add(java.util.Calendar.DATE, 1);
                    criteria.add(Expression.between("setDate", setDate, calendar.getTime()));
                }
            }
            if (formState != null)
                criteria.add(Expression.ilike("formState", formState, MatchMode.START));
            if (remark != null)
                criteria.add(Expression.ilike("remark", remark, MatchMode.START));
            if (id != null)
            criteria.add(Expression.eq("id", id));
            if (tasks != null && tasks.length > 0) criteria.createCriteria("tasks").add(Expression.in("id", tasks));
            if (car != null) criteria.createCriteria("car").add(Expression.eq("id", car));
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
            final Criteria criteria = session.createCriteria(com.demo.entity.order.TaskFormImpl.class);
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
            lists.put("tasks", session.createQuery("select item.id, item.id from com.demo.entity.order.Task item order by item.id").list());
            lists.put("car", session.createQuery("select item.id, item.id from com.demo.entity.order.car item order by item.id").list());
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
        return lists;
    }

    public com.demo.entity.order.TaskForm update(java.util.Date setDate, java.lang.String formState, java.lang.String remark, java.lang.Long id, java.lang.Long[] tasks, java.lang.Long car)
    {
        final com.demo.entity.order.TaskForm entity = this.getDao().load(id);

        entity.setSetDate(setDate);
        entity.setFormState(formState);
        entity.setRemark(remark);
        final java.util.Set tasksEntities = (tasks != null && tasks.length > 0)
            ? this.findTaskByIds(tasks)
            : java.util.Collections.EMPTY_SET;

        entity.setTasks(tasksEntities);

        com.demo.entity.order.car carEntity = null;
        if (car != null)
        {
            carEntity = getCarDao().load(car);
        }

        entity.setCar(carEntity);


        this.getDao().update(entity);
        return entity;
    }

    public void delete(java.lang.Long[] ids)
    {
        final Session session = getSession(false);
        try
        {
            final org.hibernate.Query queryObject =
                session.createQuery("delete com.demo.entity.order.TaskFormImpl where id in (:ids)");
            queryObject.setParameterList("ids", ids);
            queryObject.executeUpdate();
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

}