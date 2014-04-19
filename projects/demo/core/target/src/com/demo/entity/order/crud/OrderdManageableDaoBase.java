// license-header java merge-point
package com.demo.entity.order.crud;

import org.hibernate.Session;
import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Expression;

public final class OrderdManageableDaoBase
    extends org.springframework.orm.hibernate3.support.HibernateDaoSupport
    implements OrderdManageableDao
{
    private com.demo.entity.order.OrderdDao dao;

    public void setDao(com.demo.entity.order.OrderdDao dao)
    {
        this.dao = dao;
    }

    protected com.demo.entity.order.OrderdDao getDao()
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

    private com.demo.entity.basic.CustomerDao customerDao = null;

    public void setCustomerDao(com.demo.entity.basic.CustomerDao customerDao)
    {
        this.customerDao = customerDao;
    }

    protected com.demo.entity.basic.CustomerDao getCustomerDao()
    {
        return this.customerDao;
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

    public com.demo.entity.order.Orderd create(java.lang.String customerOrderNo, java.lang.String contractNo, java.lang.String conveyanceEnum, java.lang.String carryTypeEnum, java.lang.String shipperRemark, java.lang.String carrierRemark, java.lang.String levelEnum, java.lang.String customerTypeEnum, java.util.Date referTime, java.lang.String linkMan, java.lang.String tel, java.util.Date bookTime, java.util.Date completeTime, java.lang.String remark, java.lang.Long id, java.lang.Long[] orderRow, java.lang.Long customer)
    {
        final com.demo.entity.order.Orderd entity = new com.demo.entity.order.OrderdImpl();
        entity.setCustomerOrderNo(customerOrderNo);
        entity.setContractNo(contractNo);
        entity.setConveyanceEnum(conveyanceEnum);
        entity.setCarryTypeEnum(carryTypeEnum);
        entity.setShipperRemark(shipperRemark);
        entity.setCarrierRemark(carrierRemark);
        entity.setLevelEnum(levelEnum);
        entity.setCustomerTypeEnum(customerTypeEnum);
        entity.setReferTime(referTime);
        entity.setLinkMan(linkMan);
        entity.setTel(tel);
        entity.setBookTime(bookTime);
        entity.setCompleteTime(completeTime);
        entity.setRemark(remark);
        entity.setId(id);
        final java.util.Set orderRowEntities = (orderRow != null && orderRow.length > 0)
            ? this.findOrderRowdByIds(orderRow)
            : java.util.Collections.EMPTY_SET;

        entity.setOrderRow(orderRowEntities);

        com.demo.entity.basic.Customer customerEntity = null;
        if (customer != null)
        {
            customerEntity = (com.demo.entity.basic.Customer)getCustomerDao().load(customer);
        }

        entity.setCustomer(customerEntity);


        return (com.demo.entity.order.Orderd)this.getDao().create(entity);
    }

    public com.demo.entity.order.Orderd readById(java.lang.Long id)
    {
        return getDao().load(id);
    }

    public java.util.List read(java.lang.String customerOrderNo, java.lang.String contractNo, java.lang.String conveyanceEnum, java.lang.String carryTypeEnum, java.lang.String shipperRemark, java.lang.String carrierRemark, java.lang.String levelEnum, java.lang.String customerTypeEnum, java.util.Date referTime, java.lang.String linkMan, java.lang.String tel, java.util.Date bookTime, java.util.Date completeTime, java.lang.String remark, java.lang.Long id, java.lang.Long[] orderRow, java.lang.Long customer)
    {
        final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.order.OrderdImpl.class);

            if (customerOrderNo != null)
                criteria.add(Expression.ilike("customerOrderNo", customerOrderNo, MatchMode.START));
            if (contractNo != null)
                criteria.add(Expression.ilike("contractNo", contractNo, MatchMode.START));
            if (conveyanceEnum != null)
                criteria.add(Expression.ilike("conveyanceEnum", conveyanceEnum, MatchMode.START));
            if (carryTypeEnum != null)
                criteria.add(Expression.ilike("carryTypeEnum", carryTypeEnum, MatchMode.START));
            if (shipperRemark != null)
                criteria.add(Expression.ilike("shipperRemark", shipperRemark, MatchMode.START));
            if (carrierRemark != null)
                criteria.add(Expression.ilike("carrierRemark", carrierRemark, MatchMode.START));
            if (levelEnum != null)
                criteria.add(Expression.ilike("levelEnum", levelEnum, MatchMode.START));
            if (customerTypeEnum != null)
                criteria.add(Expression.ilike("customerTypeEnum", customerTypeEnum, MatchMode.START));
            if (referTime != null)
            {
                // we check whether or not the user supplied time information within this particular date argument
                // if he/she didn't we assume he/she wishes to search in the scope of the entire day
                final java.util.Calendar calendar = new java.util.GregorianCalendar();
                calendar.setTime(referTime);
                if ( calendar.get(java.util.Calendar.HOUR) != 0
                     || calendar.get(java.util.Calendar.MINUTE) != 0
                     || calendar.get(java.util.Calendar.SECOND) != 0
                     || calendar.get(java.util.Calendar.MILLISECOND) != 0 )
                {
                    criteria.add(Expression.eq("referTime", referTime));
                }
                else
                {
                    calendar.add(java.util.Calendar.DATE, 1);
                    criteria.add(Expression.between("referTime", referTime, calendar.getTime()));
                }
            }
            if (linkMan != null)
                criteria.add(Expression.ilike("linkMan", linkMan, MatchMode.START));
            if (tel != null)
                criteria.add(Expression.ilike("tel", tel, MatchMode.START));
            if (bookTime != null)
            {
                // we check whether or not the user supplied time information within this particular date argument
                // if he/she didn't we assume he/she wishes to search in the scope of the entire day
                final java.util.Calendar calendar = new java.util.GregorianCalendar();
                calendar.setTime(bookTime);
                if ( calendar.get(java.util.Calendar.HOUR) != 0
                     || calendar.get(java.util.Calendar.MINUTE) != 0
                     || calendar.get(java.util.Calendar.SECOND) != 0
                     || calendar.get(java.util.Calendar.MILLISECOND) != 0 )
                {
                    criteria.add(Expression.eq("bookTime", bookTime));
                }
                else
                {
                    calendar.add(java.util.Calendar.DATE, 1);
                    criteria.add(Expression.between("bookTime", bookTime, calendar.getTime()));
                }
            }
            if (completeTime != null)
            {
                // we check whether or not the user supplied time information within this particular date argument
                // if he/she didn't we assume he/she wishes to search in the scope of the entire day
                final java.util.Calendar calendar = new java.util.GregorianCalendar();
                calendar.setTime(completeTime);
                if ( calendar.get(java.util.Calendar.HOUR) != 0
                     || calendar.get(java.util.Calendar.MINUTE) != 0
                     || calendar.get(java.util.Calendar.SECOND) != 0
                     || calendar.get(java.util.Calendar.MILLISECOND) != 0 )
                {
                    criteria.add(Expression.eq("completeTime", completeTime));
                }
                else
                {
                    calendar.add(java.util.Calendar.DATE, 1);
                    criteria.add(Expression.between("completeTime", completeTime, calendar.getTime()));
                }
            }
            if (remark != null)
                criteria.add(Expression.ilike("remark", remark, MatchMode.START));
            if (id != null)
            criteria.add(Expression.eq("id", id));
            if (orderRow != null && orderRow.length > 0) criteria.createCriteria("orderRow").add(Expression.in("id", orderRow));
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
            final Criteria criteria = session.createCriteria(com.demo.entity.order.OrderdImpl.class);
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
            lists.put("customer", session.createQuery("select item.id, item.id from com.demo.entity.basic.Customer item order by item.id").list());
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
        return lists;
    }

    public com.demo.entity.order.Orderd update(java.lang.String customerOrderNo, java.lang.String contractNo, java.lang.String conveyanceEnum, java.lang.String carryTypeEnum, java.lang.String shipperRemark, java.lang.String carrierRemark, java.lang.String levelEnum, java.lang.String customerTypeEnum, java.util.Date referTime, java.lang.String linkMan, java.lang.String tel, java.util.Date bookTime, java.util.Date completeTime, java.lang.String remark, java.lang.Long id, java.lang.Long[] orderRow, java.lang.Long customer)
    {
        final com.demo.entity.order.Orderd entity = this.getDao().load(id);

        entity.setCustomerOrderNo(customerOrderNo);
        entity.setContractNo(contractNo);
        entity.setConveyanceEnum(conveyanceEnum);
        entity.setCarryTypeEnum(carryTypeEnum);
        entity.setShipperRemark(shipperRemark);
        entity.setCarrierRemark(carrierRemark);
        entity.setLevelEnum(levelEnum);
        entity.setCustomerTypeEnum(customerTypeEnum);
        entity.setReferTime(referTime);
        entity.setLinkMan(linkMan);
        entity.setTel(tel);
        entity.setBookTime(bookTime);
        entity.setCompleteTime(completeTime);
        entity.setRemark(remark);
        final java.util.Set orderRowEntities = (orderRow != null && orderRow.length > 0)
            ? this.findOrderRowdByIds(orderRow)
            : java.util.Collections.EMPTY_SET;

        entity.setOrderRow(orderRowEntities);

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
                session.createQuery("delete com.demo.entity.order.OrderdImpl where id in (:ids)");
            queryObject.setParameterList("ids", ids);
            queryObject.executeUpdate();
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

}