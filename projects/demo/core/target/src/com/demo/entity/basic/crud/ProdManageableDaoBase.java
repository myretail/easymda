// license-header java merge-point
package com.demo.entity.basic.crud;

import org.hibernate.Session;
import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Expression;

public final class ProdManageableDaoBase
    extends org.springframework.orm.hibernate3.support.HibernateDaoSupport
    implements ProdManageableDao
{
    private com.demo.entity.basic.ProdDao dao;

    public void setDao(com.demo.entity.basic.ProdDao dao)
    {
        this.dao = dao;
    }

    protected com.demo.entity.basic.ProdDao getDao()
    {
        return this.dao;
    }

    private com.demo.entity.basic.CustomerDao prodCustDao = null;

    public void setProdCustDao(com.demo.entity.basic.CustomerDao prodCustDao)
    {
        this.prodCustDao = prodCustDao;
    }

    protected com.demo.entity.basic.CustomerDao getProdCustDao()
    {
        return this.prodCustDao;
    }

    private com.demo.entity.orga.PeoplesDao principalDao = null;

    public void setPrincipalDao(com.demo.entity.orga.PeoplesDao principalDao)
    {
        this.principalDao = principalDao;
    }

    protected com.demo.entity.orga.PeoplesDao getPrincipalDao()
    {
        return this.principalDao;
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

    public com.demo.entity.basic.Prod create(java.lang.String prodName, java.lang.String code, double price, java.util.Date datef, java.lang.String prodType, java.lang.Long id, java.lang.Long prodCust, java.lang.Long principal)
    {
        final com.demo.entity.basic.Prod entity = new com.demo.entity.basic.ProdImpl();
        entity.setProdName(prodName);
        entity.setCode(code);
        entity.setPrice(price);
        entity.setDatef(datef);
        entity.setProdType(prodType);
        entity.setId(id);
        com.demo.entity.basic.Customer prodCustEntity = null;
        if (prodCust != null)
        {
            prodCustEntity = (com.demo.entity.basic.Customer)getProdCustDao().load(prodCust);
        }

        entity.setProdCust(prodCustEntity);

        com.demo.entity.orga.Peoples principalEntity = null;
        if (principal != null)
        {
            principalEntity = (com.demo.entity.orga.Peoples)getPrincipalDao().load(principal);
        }

        entity.setPrincipal(principalEntity);


        return (com.demo.entity.basic.Prod)this.getDao().create(entity);
    }

    public com.demo.entity.basic.Prod readById(java.lang.Long id)
    {
        return getDao().load(id);
    }

    public java.util.List read(java.lang.String prodName, java.lang.String code, double price, java.util.Date datef, java.lang.String prodType, java.lang.Long id, java.lang.Long prodCust, java.lang.Long principal)
    {
        final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.basic.ProdImpl.class);

            if (prodName != null)
                criteria.add(Expression.ilike("prodName", prodName, MatchMode.START));
            if (code != null)
                criteria.add(Expression.ilike("code", code, MatchMode.START));
            criteria.add(Expression.eq("price", new java.lang.Double(price)));
            if (datef != null)
            {
                // we check whether or not the user supplied time information within this particular date argument
                // if he/she didn't we assume he/she wishes to search in the scope of the entire day
                final java.util.Calendar calendar = new java.util.GregorianCalendar();
                calendar.setTime(datef);
                if ( calendar.get(java.util.Calendar.HOUR) != 0
                     || calendar.get(java.util.Calendar.MINUTE) != 0
                     || calendar.get(java.util.Calendar.SECOND) != 0
                     || calendar.get(java.util.Calendar.MILLISECOND) != 0 )
                {
                    criteria.add(Expression.eq("datef", datef));
                }
                else
                {
                    calendar.add(java.util.Calendar.DATE, 1);
                    criteria.add(Expression.between("datef", datef, calendar.getTime()));
                }
            }
            if (prodType != null)
                criteria.add(Expression.ilike("prodType", prodType, MatchMode.START));
            if (id != null)
            criteria.add(Expression.eq("id", id));
            if (prodCust != null) criteria.createCriteria("prodCust").add(Expression.eq("id", prodCust));
            if (principal != null) criteria.createCriteria("principal").add(Expression.eq("id", principal));
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
            final Criteria criteria = session.createCriteria(com.demo.entity.basic.ProdImpl.class);
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
            lists.put("prodCust", session.createQuery("select item.id, item.id from com.demo.entity.basic.Customer item order by item.id").list());
            lists.put("principal", session.createQuery("select item.id, item.id from com.demo.entity.orga.Peoples item order by item.id").list());
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
        return lists;
    }

    public com.demo.entity.basic.Prod update(java.lang.String prodName, java.lang.String code, double price, java.util.Date datef, java.lang.String prodType, java.lang.Long id, java.lang.Long prodCust, java.lang.Long principal)
    {
        final com.demo.entity.basic.Prod entity = this.getDao().load(id);

        entity.setProdName(prodName);
        entity.setCode(code);
        entity.setPrice(price);
        entity.setDatef(datef);
        entity.setProdType(prodType);
        com.demo.entity.basic.Customer prodCustEntity = null;
        if (prodCust != null)
        {
            prodCustEntity = getProdCustDao().load(prodCust);
        }

        entity.setProdCust(prodCustEntity);

        com.demo.entity.orga.Peoples principalEntity = null;
        if (principal != null)
        {
            principalEntity = getPrincipalDao().load(principal);
        }

        entity.setPrincipal(principalEntity);


        this.getDao().update(entity);
        return entity;
    }

    public void delete(java.lang.Long[] ids)
    {
        final Session session = getSession(false);
        try
        {
            final org.hibernate.Query queryObject =
                session.createQuery("delete com.demo.entity.basic.ProdImpl where id in (:ids)");
            queryObject.setParameterList("ids", ids);
            queryObject.executeUpdate();
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

}