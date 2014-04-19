// license-header java merge-point
package com.demo.entity.orga.crud;

import org.hibernate.Session;
import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Expression;

public final class OrgaManageableDaoBase
    extends org.springframework.orm.hibernate3.support.HibernateDaoSupport
    implements OrgaManageableDao
{
    private com.demo.entity.orga.OrgaDao dao;

    public void setDao(com.demo.entity.orga.OrgaDao dao)
    {
        this.dao = dao;
    }

    protected com.demo.entity.orga.OrgaDao getDao()
    {
        return this.dao;
    }

    private java.util.Set findOrgaPeoplesByIds(java.lang.Long[] ids)
    {
        final Session session = this.getSession(false);
        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.orga.OrgaPeoplesImpl.class);
            criteria.add(Expression.in("id", ids));
            return new java.util.HashSet(criteria.list());
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

    public com.demo.entity.orga.Orga create(java.lang.String orgaName, java.lang.String orgaCode, java.lang.String sno, java.lang.String remark, long parentId, java.lang.Long id)
    {
        final com.demo.entity.orga.Orga entity = new com.demo.entity.orga.OrgaImpl();
        entity.setOrgaName(orgaName);
        entity.setOrgaCode(orgaCode);
        entity.setSno(sno);
        entity.setRemark(remark);
        entity.setParentId(parentId);
        entity.setId(id);

        return (com.demo.entity.orga.Orga)this.getDao().create(entity);
    }

    public com.demo.entity.orga.Orga readById(java.lang.Long id)
    {
        return getDao().load(id);
    }

    public java.util.List read(java.lang.String orgaName, java.lang.String orgaCode, java.lang.String sno, java.lang.String remark, long parentId, java.lang.Long id)
    {
        final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.orga.OrgaImpl.class);

            if (orgaName != null)
                criteria.add(Expression.ilike("orgaName", orgaName, MatchMode.START));
            if (orgaCode != null)
                criteria.add(Expression.ilike("orgaCode", orgaCode, MatchMode.START));
            if (sno != null)
                criteria.add(Expression.ilike("sno", sno, MatchMode.START));
            if (remark != null)
                criteria.add(Expression.ilike("remark", remark, MatchMode.START));
            criteria.add(Expression.eq("parentId", new java.lang.Long(parentId)));
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
            final Criteria criteria = session.createCriteria(com.demo.entity.orga.OrgaImpl.class);
            criteria.setMaxResults(250);
            return criteria.list();
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

    public com.demo.entity.orga.Orga update(java.lang.String orgaName, java.lang.String orgaCode, java.lang.String sno, java.lang.String remark, long parentId, java.lang.Long id)
    {
        final com.demo.entity.orga.Orga entity = this.getDao().load(id);

        entity.setOrgaName(orgaName);
        entity.setOrgaCode(orgaCode);
        entity.setSno(sno);
        entity.setRemark(remark);
        entity.setParentId(parentId);

        this.getDao().update(entity);
        return entity;
    }

    public void delete(java.lang.Long[] ids)
    {
        final Session session = getSession(false);
        try
        {
            final org.hibernate.Query queryObject =
                session.createQuery("delete com.demo.entity.orga.OrgaImpl where id in (:ids)");
            queryObject.setParameterList("ids", ids);
            queryObject.executeUpdate();
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

}