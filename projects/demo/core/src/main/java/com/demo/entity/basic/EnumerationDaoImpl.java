// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */

package com.demo.entity.basic;

import com.demo.entity.basic.NumberQuery;
import com.demo.entity.basic.DateTimeQuery;
import com.demo.util.ProjectUtil;
import com.demo.util.QueryAssCriteria;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;
/**
 * @see com.demo.entity.basic.Enumeration
 */
public class EnumerationDaoImpl
    extends com.demo.entity.basic.EnumerationDaoBase
{
    /**
     * @see com.demo.entity.basic.EnumerationDao#getEnumerationByType(java.lang.String)
     */
    protected java.util.List handleGetEnumerationByType(java.lang.String eType)
    {
    	final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.basic.EnumerationImpl.class);

            
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
     * @see com.demo.entity.basic.EnumerationDao#getEnumeration(com.demo.entity.basic.EnumerationVO, int, int, java.lang.String)
     */
    protected java.util.List handleGetEnumeration(com.demo.entity.basic.EnumerationVO Enumeration, int pageNumber, int pageSize, java.lang.String orderBy)
    {
        // @todo implement public java.util.List handleGetEnumeration(com.demo.entity.basic.EnumerationVO Enumeration, int pageNumber, int pageSize, java.lang.String orderBy)
        final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.basic.EnumerationImpl.class);
            if (Enumeration != null) QueryAssCriteria.getEnumerationCriteria(Enumeration,criteria);
            
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount()).uniqueResult()).intValue();
      
		      criteria.setProjection(null);  
		      Enumeration or=new com.demo.entity.basic.EnumerationImpl();
		     or.setId(new Long(totalCount));
		     //or.setRemark(new Integer(totalCount).toString());
		     if (pageNumber > 0 && pageSize > 0)
		     {
		     	criteria.setFirstResult(this.calculateFirstResult(pageNumber, pageSize));
		     	criteria.setMaxResults(pageSize);
		     }else{
		     	criteria.setMaxResults(100);
		     }
		     java.util.List re = criteria.list();
		     re.add(or);
		     return re;
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }

        

}

//end foreach
    /**
     * @see com.demo.entity.basic.EnumerationDao#toEnumerationVO(com.demo.entity.basic.Enumeration, com.demo.entity.basic.EnumerationVO)
     */
    public void toEnumerationVO(
        com.demo.entity.basic.Enumeration source,
        com.demo.entity.basic.EnumerationVO target)
    {
        // @todo verify behavior of toEnumerationVO
        super.toEnumerationVO(source, target);
    }


    /**
     * @see com.demo.entity.basic.EnumerationDao#toEnumerationVO(com.demo.entity.basic.Enumeration)
     */
    public com.demo.entity.basic.EnumerationVO toEnumerationVO(final com.demo.entity.basic.Enumeration entity)
    {
        // @todo verify behavior of toEnumerationVO
        return super.toEnumerationVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.demo.entity.basic.Enumeration loadEnumerationFromEnumerationVO(com.demo.entity.basic.EnumerationVO enumerationVO)
    {
        // @todo implement loadEnumerationFromEnumerationVO
        //throw new java.lang.UnsupportedOperationException("com.demo.entity.basic.loadEnumerationFromEnumerationVO(com.demo.entity.basic.EnumerationVO) not yet implemented.");

        /* A typical implementation looks like this:*/
        com.demo.entity.basic.Enumeration enumeration = this.load(enumerationVO.getId());
        if (enumeration == null)
        {
            enumeration = com.demo.entity.basic.Enumeration.Factory.newInstance();
        }
        return enumeration;
        
    }

    
    /**
     * @see com.demo.entity.basic.EnumerationDao#enumerationVOToEntity(com.demo.entity.basic.EnumerationVO)
     */
    public com.demo.entity.basic.Enumeration enumerationVOToEntity(com.demo.entity.basic.EnumerationVO enumerationVO)
    {
        // @todo verify behavior of enumerationVOToEntity
        com.demo.entity.basic.Enumeration entity = this.loadEnumerationFromEnumerationVO(enumerationVO);
        this.enumerationVOToEntity(enumerationVO, entity, true);
        return entity;
    }


    /**
     * @see com.demo.entity.basic.EnumerationDao#enumerationVOToEntity(com.demo.entity.basic.EnumerationVO, com.demo.entity.basic.Enumeration)
     */
    public void enumerationVOToEntity(
        com.demo.entity.basic.EnumerationVO source,
        com.demo.entity.basic.Enumeration target,
        boolean copyIfNull)
    {
        // @todo verify behavior of enumerationVOToEntity
        super.enumerationVOToEntity(source, target, copyIfNull);
    }

}