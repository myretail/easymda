// license-header java merge-point
package com.demo.entity.order.crud;

import org.hibernate.Session;
import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Expression;

public final class OrderRowdManageableDaoBase
    extends org.springframework.orm.hibernate3.support.HibernateDaoSupport
    implements OrderRowdManageableDao
{
    private com.demo.entity.order.OrderRowdDao dao;

    public void setDao(com.demo.entity.order.OrderRowdDao dao)
    {
        this.dao = dao;
    }

    protected com.demo.entity.order.OrderRowdDao getDao()
    {
        return this.dao;
    }

    private com.demo.entity.order.OrderdDao orderDao = null;

    public void setOrderDao(com.demo.entity.order.OrderdDao orderDao)
    {
        this.orderDao = orderDao;
    }

    protected com.demo.entity.order.OrderdDao getOrderDao()
    {
        return this.orderDao;
    }

    private com.demo.entity.basic.ProdDao productDao = null;

    public void setProductDao(com.demo.entity.basic.ProdDao productDao)
    {
        this.productDao = productDao;
    }

    protected com.demo.entity.basic.ProdDao getProductDao()
    {
        return this.productDao;
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

    private java.util.Set findPaymentByIds(java.lang.Long[] ids)
    {
        final Session session = this.getSession(false);
        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.order.PaymentImpl.class);
            criteria.add(Expression.in("id", ids));
            return new java.util.HashSet(criteria.list());
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

    public com.demo.entity.order.OrderRowd create(double productNum, double unitNum, double goodsSuttle, double goodsWeight, double goodsVolume, java.lang.String label, double carriage, java.lang.String especial, java.lang.String goodsState, java.lang.String remark, java.lang.Long id, java.lang.Long order, java.lang.Long product)
    {
        final com.demo.entity.order.OrderRowd entity = new com.demo.entity.order.OrderRowdImpl();
        entity.setProductNum(productNum);
        entity.setUnitNum(unitNum);
        entity.setGoodsSuttle(goodsSuttle);
        entity.setGoodsWeight(goodsWeight);
        entity.setGoodsVolume(goodsVolume);
        entity.setLabel(label);
        entity.setCarriage(carriage);
        entity.setEspecial(especial);
        entity.setGoodsState(goodsState);
        entity.setRemark(remark);
        entity.setId(id);
        com.demo.entity.order.Orderd orderEntity = null;
        if (order != null)
        {
            orderEntity = (com.demo.entity.order.Orderd)getOrderDao().load(order);
        }

        entity.setOrder(orderEntity);

        com.demo.entity.basic.Prod productEntity = null;
        if (product != null)
        {
            productEntity = (com.demo.entity.basic.Prod)getProductDao().load(product);
        }

        entity.setProduct(productEntity);


        return (com.demo.entity.order.OrderRowd)this.getDao().create(entity);
    }

    public com.demo.entity.order.OrderRowd readById(java.lang.Long id)
    {
        return getDao().load(id);
    }

    public java.util.List read(double productNum, double unitNum, double goodsSuttle, double goodsWeight, double goodsVolume, java.lang.String label, double carriage, java.lang.String especial, java.lang.String goodsState, java.lang.String remark, java.lang.Long id, java.lang.Long order, java.lang.Long product)
    {
        final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.order.OrderRowdImpl.class);

            criteria.add(Expression.eq("productNum", new java.lang.Double(productNum)));
            criteria.add(Expression.eq("unitNum", new java.lang.Double(unitNum)));
            criteria.add(Expression.eq("goodsSuttle", new java.lang.Double(goodsSuttle)));
            criteria.add(Expression.eq("goodsWeight", new java.lang.Double(goodsWeight)));
            criteria.add(Expression.eq("goodsVolume", new java.lang.Double(goodsVolume)));
            if (label != null)
                criteria.add(Expression.ilike("label", label, MatchMode.START));
            criteria.add(Expression.eq("carriage", new java.lang.Double(carriage)));
            if (especial != null)
                criteria.add(Expression.ilike("especial", especial, MatchMode.START));
            if (goodsState != null)
                criteria.add(Expression.ilike("goodsState", goodsState, MatchMode.START));
            if (remark != null)
                criteria.add(Expression.ilike("remark", remark, MatchMode.START));
            if (id != null)
            criteria.add(Expression.eq("id", id));
            if (order != null) criteria.createCriteria("order").add(Expression.eq("id", order));
            if (product != null) criteria.createCriteria("product").add(Expression.eq("id", product));
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
            final Criteria criteria = session.createCriteria(com.demo.entity.order.OrderRowdImpl.class);
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
            lists.put("order", session.createQuery("select item.id, item.id from com.demo.entity.order.Orderd item order by item.id").list());
            lists.put("product", session.createQuery("select item.id, item.id from com.demo.entity.basic.Prod item order by item.id").list());
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
        return lists;
    }

    public com.demo.entity.order.OrderRowd update(double productNum, double unitNum, double goodsSuttle, double goodsWeight, double goodsVolume, java.lang.String label, double carriage, java.lang.String especial, java.lang.String goodsState, java.lang.String remark, java.lang.Long id, java.lang.Long order, java.lang.Long product)
    {
        final com.demo.entity.order.OrderRowd entity = this.getDao().load(id);

        entity.setProductNum(productNum);
        entity.setUnitNum(unitNum);
        entity.setGoodsSuttle(goodsSuttle);
        entity.setGoodsWeight(goodsWeight);
        entity.setGoodsVolume(goodsVolume);
        entity.setLabel(label);
        entity.setCarriage(carriage);
        entity.setEspecial(especial);
        entity.setGoodsState(goodsState);
        entity.setRemark(remark);
        com.demo.entity.order.Orderd orderEntity = null;
        if (order != null)
        {
            orderEntity = getOrderDao().load(order);
        }

        entity.setOrder(orderEntity);

        com.demo.entity.basic.Prod productEntity = null;
        if (product != null)
        {
            productEntity = getProductDao().load(product);
        }

        entity.setProduct(productEntity);


        this.getDao().update(entity);
        return entity;
    }

    public void delete(java.lang.Long[] ids)
    {
        final Session session = getSession(false);
        try
        {
            final org.hibernate.Query queryObject =
                session.createQuery("delete com.demo.entity.order.OrderRowdImpl where id in (:ids)");
            queryObject.setParameterList("ids", ids);
            queryObject.executeUpdate();
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

}