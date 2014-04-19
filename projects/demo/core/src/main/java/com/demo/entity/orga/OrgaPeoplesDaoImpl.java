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
 * @see com.demo.entity.orga.OrgaPeoples
 */
public class OrgaPeoplesDaoImpl
    extends com.demo.entity.orga.OrgaPeoplesDaoBase
{
    /**
     * @see com.demo.entity.orga.OrgaPeoplesDao#getOrgaPeoples(com.demo.entity.orga.OrgaPeoplesVO, int, int, java.lang.String)
     */
    protected java.util.List handleGetOrgaPeoples(com.demo.entity.orga.OrgaPeoplesVO OrgaPeoples, int pageNumber, int pageSize, java.lang.String orderBy)
    {
        // @todo implement public java.util.List handleGetOrgaPeoples(com.demo.entity.orga.OrgaPeoplesVO OrgaPeoples, int pageNumber, int pageSize, java.lang.String orderBy)
        final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.orga.OrgaPeoplesImpl.class);
            if (OrgaPeoples != null) QueryAssCriteria.getOrgaPeoplesCriteria(OrgaPeoples,criteria);
            
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount()).uniqueResult()).intValue();
      
		      criteria.setProjection(null);  
		      OrgaPeoples or=new com.demo.entity.orga.OrgaPeoplesImpl();
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
     * @see com.demo.entity.orga.OrgaPeoplesDao#toOrgaPeoplesVO(com.demo.entity.orga.OrgaPeoples, com.demo.entity.orga.OrgaPeoplesVO)
     */
    public void toOrgaPeoplesVO(
        com.demo.entity.orga.OrgaPeoples source,
        com.demo.entity.orga.OrgaPeoplesVO target)
    {
        // @todo verify behavior of toOrgaPeoplesVO
        super.toOrgaPeoplesVO(source, target);
        // WARNING! No conversion for target.orga (can't convert source.getOrga():com.demo.entity.orga.Orga to com.demo.entity.orga.OrgaVO
						if(source.getOrga()!=null)target.setOrga(this.getOrgaDao().toOrgaVO(source.getOrga()));
			        // WARNING! No conversion for target.people (can't convert source.getPeople():com.demo.entity.orga.Peoples to com.demo.entity.orga.PeoplesVO
						if(source.getPeople()!=null)target.setPeople(this.getPeoplesDao().toPeoplesVO(source.getPeople()));
			    }


    /**
     * @see com.demo.entity.orga.OrgaPeoplesDao#toOrgaPeoplesVO(com.demo.entity.orga.OrgaPeoples)
     */
    public com.demo.entity.orga.OrgaPeoplesVO toOrgaPeoplesVO(final com.demo.entity.orga.OrgaPeoples entity)
    {
        // @todo verify behavior of toOrgaPeoplesVO
        return super.toOrgaPeoplesVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.demo.entity.orga.OrgaPeoples loadOrgaPeoplesFromOrgaPeoplesVO(com.demo.entity.orga.OrgaPeoplesVO orgaPeoplesVO)
    {
        // @todo implement loadOrgaPeoplesFromOrgaPeoplesVO
        //throw new java.lang.UnsupportedOperationException("com.demo.entity.orga.loadOrgaPeoplesFromOrgaPeoplesVO(com.demo.entity.orga.OrgaPeoplesVO) not yet implemented.");

        /* A typical implementation looks like this:*/
        com.demo.entity.orga.OrgaPeoples orgaPeoples = this.load(orgaPeoplesVO.getId());
        if (orgaPeoples == null)
        {
            orgaPeoples = com.demo.entity.orga.OrgaPeoples.Factory.newInstance();
        }
        return orgaPeoples;
        
    }

    
    /**
     * @see com.demo.entity.orga.OrgaPeoplesDao#orgaPeoplesVOToEntity(com.demo.entity.orga.OrgaPeoplesVO)
     */
    public com.demo.entity.orga.OrgaPeoples orgaPeoplesVOToEntity(com.demo.entity.orga.OrgaPeoplesVO orgaPeoplesVO)
    {
        // @todo verify behavior of orgaPeoplesVOToEntity
        com.demo.entity.orga.OrgaPeoples entity = this.loadOrgaPeoplesFromOrgaPeoplesVO(orgaPeoplesVO);
        this.orgaPeoplesVOToEntity(orgaPeoplesVO, entity, true);
        return entity;
    }


    /**
     * @see com.demo.entity.orga.OrgaPeoplesDao#orgaPeoplesVOToEntity(com.demo.entity.orga.OrgaPeoplesVO, com.demo.entity.orga.OrgaPeoples)
     */
    public void orgaPeoplesVOToEntity(
        com.demo.entity.orga.OrgaPeoplesVO source,
        com.demo.entity.orga.OrgaPeoples target,
        boolean copyIfNull)
    {
        // @todo verify behavior of orgaPeoplesVOToEntity
        super.orgaPeoplesVOToEntity(source, target, copyIfNull);
        // No conversion for target.orga (can't convert source.getOrga():com.demo.entity.orga.OrgaVO to com.demo.entity.orga.Orga
						if(source.getOrga()!=null)target.setOrga(this.getOrgaDao().load(source.getOrga().getId()));
			        // No conversion for target.people (can't convert source.getPeople():com.demo.entity.orga.PeoplesVO to com.demo.entity.orga.Peoples
						if(source.getPeople()!=null)target.setPeople(this.getPeoplesDao().load(source.getPeople().getId()));
			    }

}