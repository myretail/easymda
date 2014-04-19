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
 * @see com.demo.entity.orga.Peoples
 */
public class PeoplesDaoImpl
    extends com.demo.entity.orga.PeoplesDaoBase
{
    /**
     * @see com.demo.entity.orga.PeoplesDao#getPeoples(com.demo.entity.orga.PeoplesVO, int, int, java.lang.String)
     */
    protected java.util.List handleGetPeoples(com.demo.entity.orga.PeoplesVO Peoples, int pageNumber, int pageSize, java.lang.String orderBy)
    {
        // @todo implement public java.util.List handleGetPeoples(com.demo.entity.orga.PeoplesVO Peoples, int pageNumber, int pageSize, java.lang.String orderBy)
        final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.orga.PeoplesImpl.class);
            if (Peoples != null) QueryAssCriteria.getPeoplesCriteria(Peoples,criteria);
            
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount()).uniqueResult()).intValue();
      
		      criteria.setProjection(null);  
		      Peoples or=new com.demo.entity.orga.PeoplesImpl();
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
     * @see com.demo.entity.orga.PeoplesDao#toPeoplesVO(com.demo.entity.orga.Peoples, com.demo.entity.orga.PeoplesVO)
     */
    public void toPeoplesVO(
        com.demo.entity.orga.Peoples source,
        com.demo.entity.orga.PeoplesVO target)
    {
        // @todo verify behavior of toPeoplesVO
        super.toPeoplesVO(source, target);
        // WARNING! No conversion for target.birthDay (can't convert source.getBirthDay():java.util.Date to com.demo.entity.basic.DateTimeQuery
			DateTimeQuery birthDayday=new DateTimeQuery();
        birthDayday.setUpDate(ProjectUtil.getFullDateStr(source.getBirthDay()));
        target.setBirthDay(birthDayday);
	        // WARNING! No conversion for target.engageDate (can't convert source.getEngageDate():java.util.Date to com.demo.entity.basic.DateTimeQuery
			DateTimeQuery engageDateday=new DateTimeQuery();
        engageDateday.setUpDate(ProjectUtil.getFullDateStr(source.getEngageDate()));
        target.setEngageDate(engageDateday);
	    }


    /**
     * @see com.demo.entity.orga.PeoplesDao#toPeoplesVO(com.demo.entity.orga.Peoples)
     */
    public com.demo.entity.orga.PeoplesVO toPeoplesVO(final com.demo.entity.orga.Peoples entity)
    {
        // @todo verify behavior of toPeoplesVO
        return super.toPeoplesVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.demo.entity.orga.Peoples loadPeoplesFromPeoplesVO(com.demo.entity.orga.PeoplesVO peoplesVO)
    {
        // @todo implement loadPeoplesFromPeoplesVO
        //throw new java.lang.UnsupportedOperationException("com.demo.entity.orga.loadPeoplesFromPeoplesVO(com.demo.entity.orga.PeoplesVO) not yet implemented.");

        /* A typical implementation looks like this:*/
        com.demo.entity.orga.Peoples peoples = this.load(peoplesVO.getId());
        if (peoples == null)
        {
            peoples = com.demo.entity.orga.Peoples.Factory.newInstance();
        }
        return peoples;
        
    }

    
    /**
     * @see com.demo.entity.orga.PeoplesDao#peoplesVOToEntity(com.demo.entity.orga.PeoplesVO)
     */
    public com.demo.entity.orga.Peoples peoplesVOToEntity(com.demo.entity.orga.PeoplesVO peoplesVO)
    {
        // @todo verify behavior of peoplesVOToEntity
        com.demo.entity.orga.Peoples entity = this.loadPeoplesFromPeoplesVO(peoplesVO);
        this.peoplesVOToEntity(peoplesVO, entity, true);
        return entity;
    }


    /**
     * @see com.demo.entity.orga.PeoplesDao#peoplesVOToEntity(com.demo.entity.orga.PeoplesVO, com.demo.entity.orga.Peoples)
     */
    public void peoplesVOToEntity(
        com.demo.entity.orga.PeoplesVO source,
        com.demo.entity.orga.Peoples target,
        boolean copyIfNull)
    {
        // @todo verify behavior of peoplesVOToEntity
        super.peoplesVOToEntity(source, target, copyIfNull);
        // No conversion for target.birthDay (can't convert source.getBirthDay():com.demo.entity.basic.DateTimeQuery to java.util.Date
			if(source.getBirthDay()!=null)target.setBirthDay(ProjectUtil.getDate(source.getBirthDay().getUpDate()));
	        // No conversion for target.engageDate (can't convert source.getEngageDate():com.demo.entity.basic.DateTimeQuery to java.util.Date
			if(source.getEngageDate()!=null)target.setEngageDate(ProjectUtil.getDate(source.getEngageDate().getUpDate()));
	    }

}