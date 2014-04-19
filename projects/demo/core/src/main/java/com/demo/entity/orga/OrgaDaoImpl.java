// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */

package com.demo.entity.orga;

import com.demo.entity.basic.NumberQuery;
import com.demo.entity.basic.DateTimeQuery;
//import com.demo.entity.util.ProjectUtil;
//import com.demo.entity.util.QueryAssCriteria;
import com.demo.util.ProjectUtil;
import com.demo.util.QueryAssCriteria;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;
/**
 * @see com.demo.entity.orga.Orga
 */
public class OrgaDaoImpl
    extends com.demo.entity.orga.OrgaDaoBase
{
    /**
     * @see com.demo.entity.orga.OrgaDao#getOrga(com.demo.entity.orga.OrgaVO, int, int, java.lang.String)
     */
    protected java.util.List handleGetOrga(com.demo.entity.orga.OrgaVO Orga, int pageNumber, int pageSize, java.lang.String orderBy)
    {
        // @todo implement public java.util.List handleGetOrga(com.demo.entity.orga.OrgaVO Orga, int pageNumber, int pageSize, java.lang.String orderBy)
        final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.orga.OrgaImpl.class);
            if (Orga != null) QueryAssCriteria.getOrgaCriteria(Orga,criteria);
            
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount()).uniqueResult()).intValue();
      
		      criteria.setProjection(null);  
		      Orga or=new com.demo.entity.orga.OrgaImpl();
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
     * @see com.demo.entity.orga.OrgaDao#toOrgaVO(com.demo.entity.orga.Orga, com.demo.entity.orga.OrgaVO)
     */
    public void toOrgaVO(
        com.demo.entity.orga.Orga source,
        com.demo.entity.orga.OrgaVO target)
    {
        // @todo verify behavior of toOrgaVO
        super.toOrgaVO(source, target);
    }


    /**
     * @see com.demo.entity.orga.OrgaDao#toOrgaVO(com.demo.entity.orga.Orga)
     */
    public com.demo.entity.orga.OrgaVO toOrgaVO(final com.demo.entity.orga.Orga entity)
    {
        // @todo verify behavior of toOrgaVO
        return super.toOrgaVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.demo.entity.orga.Orga loadOrgaFromOrgaVO(com.demo.entity.orga.OrgaVO orgaVO)
    {
        // @todo implement loadOrgaFromOrgaVO
        //throw new java.lang.UnsupportedOperationException("com.demo.entity.orga.loadOrgaFromOrgaVO(com.demo.entity.orga.OrgaVO) not yet implemented.");

        /* A typical implementation looks like this:*/
        com.demo.entity.orga.Orga orga = this.load(orgaVO.getId());
        if (orga == null)
        {
            orga = com.demo.entity.orga.Orga.Factory.newInstance();
        }
        return orga;
        
    }

    
    /**
     * @see com.demo.entity.orga.OrgaDao#orgaVOToEntity(com.demo.entity.orga.OrgaVO)
     */
    public com.demo.entity.orga.Orga orgaVOToEntity(com.demo.entity.orga.OrgaVO orgaVO)
    {
        // @todo verify behavior of orgaVOToEntity
        com.demo.entity.orga.Orga entity = this.loadOrgaFromOrgaVO(orgaVO);
        this.orgaVOToEntity(orgaVO, entity, true);
        return entity;
    }


    /**
     * @see com.demo.entity.orga.OrgaDao#orgaVOToEntity(com.demo.entity.orga.OrgaVO, com.demo.entity.orga.Orga)
     */
    public void orgaVOToEntity(
        com.demo.entity.orga.OrgaVO source,
        com.demo.entity.orga.Orga target,
        boolean copyIfNull)
    {
        // @todo verify behavior of orgaVOToEntity
        super.orgaVOToEntity(source, target, copyIfNull);
    }

}