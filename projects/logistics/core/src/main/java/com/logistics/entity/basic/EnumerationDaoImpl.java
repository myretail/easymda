// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.entity.basic;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.MatchMode;
/**
 * @see com.logistics.entity.basic.Enumeration
 */
public class EnumerationDaoImpl
    extends com.logistics.entity.basic.EnumerationDaoBase
{
    /**
     * @see com.logistics.entity.basic.EnumerationDao#getEnumerationByType(java.lang.String)
     */
    protected java.util.List handleGetEnumerationByType(java.lang.String eType)
    {
    	final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.basic.EnumerationImpl.class);

            
            if (eType != null)
                criteria.add(Expression.ilike("enumerationType", eType, MatchMode.START));
           
            criteria.setMaxResults(250);

            return criteria.list();
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
}

    /**
     * @see com.logistics.entity.basic.EnumerationDao#getEnumerationByParentId(long)
     */
    protected java.util.List handleGetEnumerationByParentId(long peType)
    {
    	 final Session session = getSession(false);

         try
         {
             final Criteria criteria = session.createCriteria(com.logistics.entity.basic.EnumerationImpl.class);

             criteria.add(Expression.eq("parentId", new java.lang.Long(peType)));
             criteria.setMaxResults(250);

             return criteria.list();
         }
         catch (org.hibernate.HibernateException ex)
         {
             throw super.convertHibernateAccessException(ex);
         }
}

    /**
     * @see com.logistics.entity.basic.EnumerationDao#createEnumerations(java.util.List)
     */
    protected long[] handleCreateEnumerations(java.util.List enumerationVo)
    {
        // @todo implement public long[] handleCreateEnumerations(java.util.List enumerationVo)
        return null;
}

    /**
     * @see com.logistics.entity.basic.EnumerationDao#updateEnumerations(java.util.List)
     */
    protected void handleUpdateEnumerations(java.util.List enumerationVO)
    {
        // @todo implement public void handleUpdateEnumerations(java.util.List enumerationVO)
        throw new java.lang.UnsupportedOperationException("com.logistics.entity.basic.Enumeration.handleUpdateEnumerations(java.util.List enumerationVO) Not implemented!");
}

    /**
     * @see com.logistics.entity.basic.EnumerationDao#deleteEnumerations(long[])
     */
    protected void handleDeleteEnumerations(long[] ids)
    {
        // @todo implement public void handleDeleteEnumerations(long[] ids)
        throw new java.lang.UnsupportedOperationException("com.logistics.entity.basic.Enumeration.handleDeleteEnumerations(long[] ids) Not implemented!");
}

    /**
     * @see com.logistics.entity.basic.EnumerationDao#getEnumerationById(long)
     */
    protected java.util.List handleGetEnumerationType()
    {
    	final Session session = getSession(false);

        try
        {   List ret=session.createSQLQuery("select distinct ENUMERATION.ENUMERATION_TYPE from ENUMERATION").list();
        	return  ret;   
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

    /**
     * @see com.logistics.entity.basic.EnumerationDao#getAllEnumeration()
     */
    protected java.util.List handleGetAllEnumeration()
    {
        // @todo implement public java.util.List handleGetAllEnumeration()
        return null;
}

    /**
     * @see com.logistics.entity.basic.EnumerationDao#toEnumerationVO(com.logistics.entity.basic.Enumeration, com.logistics.entity.basic.EnumerationVO)
     */
    public void toEnumerationVO(
        com.logistics.entity.basic.Enumeration source,
        com.logistics.entity.basic.EnumerationVO target)
    {
        // @todo verify behavior of toEnumerationVO
        super.toEnumerationVO(source, target);
    }


    /**
     * @see com.logistics.entity.basic.EnumerationDao#toEnumerationVO(com.logistics.entity.basic.Enumeration)
     */
    public com.logistics.entity.basic.EnumerationVO toEnumerationVO(final com.logistics.entity.basic.Enumeration entity)
    {
        // @todo verify behavior of toEnumerationVO
        return super.toEnumerationVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.basic.Enumeration loadEnumerationFromEnumerationVO(com.logistics.entity.basic.EnumerationVO enumerationVO)
    {
        // @todo implement loadEnumerationFromEnumerationVO
        //throw new java.lang.UnsupportedOperationException("com.logistics.entity.basic.loadEnumerationFromEnumerationVO(com.logistics.entity.basic.EnumerationVO) not yet implemented.");

        /* A typical implementation looks like this:*/
        com.logistics.entity.basic.Enumeration enumeration = this.load(enumerationVO.getId());
        if (enumeration == null)
        {
            enumeration = com.logistics.entity.basic.Enumeration.Factory.newInstance();
        }
        return enumeration;
        
    }

    
    /**
     * @see com.logistics.entity.basic.EnumerationDao#enumerationVOToEntity(com.logistics.entity.basic.EnumerationVO)
     */
    public com.logistics.entity.basic.Enumeration enumerationVOToEntity(com.logistics.entity.basic.EnumerationVO enumerationVO)
    {
        // @todo verify behavior of enumerationVOToEntity
        com.logistics.entity.basic.Enumeration entity = this.loadEnumerationFromEnumerationVO(enumerationVO);
        this.enumerationVOToEntity(enumerationVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.basic.EnumerationDao#enumerationVOToEntity(com.logistics.entity.basic.EnumerationVO, com.logistics.entity.basic.Enumeration)
     */
    public void enumerationVOToEntity(
        com.logistics.entity.basic.EnumerationVO source,
        com.logistics.entity.basic.Enumeration target,
        boolean copyIfNull)
    {
        // @todo verify behavior of enumerationVOToEntity
        super.enumerationVOToEntity(source, target, copyIfNull);
    }

	@Override
	protected List handleGetEnumeration(EnumerationVO enumerationVO) throws Exception {
		
		final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.basic.EnumerationImpl.class);

            
            if (enumerationVO.getEnumerationType() != null)
                criteria.add(Expression.ilike("enumerationType", enumerationVO.getEnumerationType(), MatchMode.START));
            if (enumerationVO.getFieldName() != null)
                criteria.add(Expression.ilike("fieldName", enumerationVO.getFieldName(), MatchMode.START));
            if (enumerationVO.getId() != 0)
                criteria.add(Expression.eq("id", enumerationVO.getId()));
            if (enumerationVO.getParentId() != 0)
                criteria.add(Expression.ilike("parentId", enumerationVO.getParentId()));
            criteria.setMaxResults(250);

            return criteria.list();
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
	}

}