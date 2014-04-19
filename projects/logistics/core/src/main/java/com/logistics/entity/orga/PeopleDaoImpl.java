// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.entity.orga;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;

import com.logistics.entity.basic.DateTimeQuery;
import com.logistics.util.ProjectUtil;
import com.logistics.util.QueryAssCriteria;

/**
 * @see com.logistics.entity.orga.People
 */
public class PeopleDaoImpl
    extends com.logistics.entity.orga.PeopleDaoBase
{
    /**
     * @see com.logistics.entity.orga.PeopleDao#getPeopelVO(java.lang.String, java.lang.String, java.util.Date, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.util.Date, java.lang.String)
     */
    protected java.util.List handleGetPeopelVO(java.lang.String peopleName, java.lang.String peopleStatus, java.util.Date birthDay, java.lang.String sex, java.lang.String birthPlace, java.lang.String address, java.lang.String tel, java.lang.String engageMode, java.util.Date engageDate, java.lang.String grade)
    {
    	final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.orga.PeopleImpl.class);

            if (peopleName != null)
                criteria.add(Expression.ilike("peopleName", peopleName, MatchMode.START));
            
            if (peopleStatus != null)
                criteria.add(Expression.ilike("peopleStatus", peopleStatus, MatchMode.START));
            if (birthDay != null)
            {
                // we check whether or not the user supplied time information within this particular date argument
                // if he/she didn't we assume he/she wishes to search in the scope of the entire day
                final java.util.Calendar calendar = new java.util.GregorianCalendar();
                calendar.setTime(birthDay);
                if ( calendar.get(java.util.Calendar.HOUR) != 0
                     || calendar.get(java.util.Calendar.MINUTE) != 0
                     || calendar.get(java.util.Calendar.SECOND) != 0
                     || calendar.get(java.util.Calendar.MILLISECOND) != 0 )
                {
                    criteria.add(Expression.eq("birthDay", birthDay));
                }
                else
                {
                    calendar.add(java.util.Calendar.DATE, 1);
                    criteria.add(Expression.between("birthDay", birthDay, calendar.getTime()));
                }
            }
            if (sex != null)
                criteria.add(Expression.ilike("sex", sex, MatchMode.START));
            if (birthPlace != null)
                criteria.add(Expression.ilike("birthPlace", birthPlace, MatchMode.START));
            if (address != null)
                criteria.add(Expression.ilike("address", address, MatchMode.START));
            if (tel != null)
                criteria.add(Expression.ilike("tel", tel, MatchMode.START));
            if (engageMode != null)
                criteria.add(Expression.ilike("engageMode", engageMode, MatchMode.START));
            if (engageDate != null)
            {
                // we check whether or not the user supplied time information within this particular date argument
                // if he/she didn't we assume he/she wishes to search in the scope of the entire day
                final java.util.Calendar calendar = new java.util.GregorianCalendar();
                calendar.setTime(engageDate);
                if ( calendar.get(java.util.Calendar.HOUR) != 0
                     || calendar.get(java.util.Calendar.MINUTE) != 0
                     || calendar.get(java.util.Calendar.SECOND) != 0
                     || calendar.get(java.util.Calendar.MILLISECOND) != 0 )
                {
                    criteria.add(Expression.eq("engageDate", engageDate));
                }
                else
                {
                    calendar.add(java.util.Calendar.DATE, 1);
                    criteria.add(Expression.between("engageDate", engageDate, calendar.getTime()));
                }
            }
            if (grade != null)
                criteria.add(Expression.ilike("grade", grade, MatchMode.START));
            
            criteria.setMaxResults(250);

            return criteria.list();
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
}

    /**
     * @see com.logistics.entity.orga.PeopleDao#toPeopleVO(com.logistics.entity.orga.People, com.logistics.entity.orga.PeopleVO)
     */
    public void toPeopleVO(
        com.logistics.entity.orga.People source,
        com.logistics.entity.orga.PeopleVO target)
    {
        // @todo verify behavior of toPeopleVO
        super.toPeopleVO(source, target);
        DateTimeQuery tempday=new DateTimeQuery();
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getBirthDay()));
        target.setBirthDay(tempday);
        // WARNING! No conversion for target.birthDay (can't convert source.getBirthDay():java.util.Date to java.util.Date
        tempday.setUpDate(ProjectUtil.getFullDateStr(source.getEngageDate()));
        target.setEngageDate(tempday);
        // WARNING! No conversion for target.engageDate (can't convert source.getEngageDate():java.util.Date to java.util.Date
    }


    /**
     * @see com.logistics.entity.orga.PeopleDao#toPeopleVO(com.logistics.entity.orga.People)
     */
    public com.logistics.entity.orga.PeopleVO toPeopleVO(final com.logistics.entity.orga.People entity)
    {
        // @todo verify behavior of toPeopleVO
        return super.toPeopleVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.orga.People loadPeopleFromPeopleVO(com.logistics.entity.orga.PeopleVO peopleVO)
    {
        // @todo implement loadPeopleFromPeopleVO
        //throw new java.lang.UnsupportedOperationException("com.logistics.entity.orga.loadPeopleFromPeopleVO(com.logistics.entity.orga.PeopleVO) not yet implemented.");

        /* A typical implementation looks like this: */
        com.logistics.entity.orga.People people = this.load(peopleVO.getId());
        if (people == null)
        {
            people = com.logistics.entity.orga.People.Factory.newInstance();
        }
        return people;
       
    }

    
    /**
     * @see com.logistics.entity.orga.PeopleDao#peopleVOToEntity(com.logistics.entity.orga.PeopleVO)
     */
    public com.logistics.entity.orga.People peopleVOToEntity(com.logistics.entity.orga.PeopleVO peopleVO)
    {
        // @todo verify behavior of peopleVOToEntity
        com.logistics.entity.orga.People entity = this.loadPeopleFromPeopleVO(peopleVO);
        this.peopleVOToEntity(peopleVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.orga.PeopleDao#peopleVOToEntity(com.logistics.entity.orga.PeopleVO, com.logistics.entity.orga.People)
     */
    public void peopleVOToEntity(
        com.logistics.entity.orga.PeopleVO source,
        com.logistics.entity.orga.People target,
        boolean copyIfNull)
    {
        // @todo verify behavior of peopleVOToEntity
        super.peopleVOToEntity(source, target, copyIfNull);
        target.setBirthDay(ProjectUtil.getDate(source.getBirthDay().getUpDate()));
        target.setEngageDate(ProjectUtil.getDate(source.getEngageDate().getUpDate()));
        // No conversion for target.birthDay (can't convert source.getBirthDay():java.util.Date to java.util.Date
        // No conversion for target.engageDate (can't convert source.getEngageDate():java.util.Date to java.util.Date
    }
    
    protected List handleGetPeople(PeopleVO PeopleVO, int pageNumber,int pageSize, String orderBy) throws Exception {
		final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.orga.PeopleImpl.class);

            if (PeopleVO != null) QueryAssCriteria.getPeopleCriteria(PeopleVO,criteria);
          //条数
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
                    .uniqueResult())  
                    .intValue();//取得符合条件的总数  
      
		      criteria.setProjection(null);  
		      People or=new com.logistics.entity.orga.PeopleImpl();
		     or.setId(new Long(totalCount));
		     //or.setRemark(new Integer(totalCount).toString());
		     if (pageNumber > 0 && pageSize > 0)
		     {
		     	criteria.setFirstResult(this.calculateFirstResult(pageNumber, pageSize));
		     	criteria.setMaxResults(pageSize);
		     }else{
		     	criteria.setMaxResults(100);
		     }
		     List re=criteria.list();
		     re.add(or);
		     return re;
      }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
	}

	protected int handleVerifyPassword(long peopleId, String password)throws Exception {
		People VerifyPeople=this.load(peopleId);
		System.out.println("VerifyPeople=="+VerifyPeople);
		if(VerifyPeople==null){
			return 2;
		}else{
			StringBuffer cipBuf = new StringBuffer(20);
		    cipBuf.append(peopleId);
		    String decoded = ProjectUtil.getOriginal(VerifyPeople.getPeoplePassword(),cipBuf.reverse().toString());
		    System.out.println("VerifyPeopledecoded=="+decoded);
		    if(decoded.equals(password)){
		    	return 0;
		    }else{
		    	return 1;
		    }
		}
	}
    
	/*protected List handleGetPeople(PeopleVO PeopleVO, int pageNumber,int pageSize, String orderBy) throws Exception {
		final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.orga.PeopleImpl.class);

            if (PeopleVO != null) {
            	if (PeopleVO.getPeopleName() != null)
            		criteria.add(Expression.ilike("peopleName", PeopleVO.getPeopleName(), MatchMode.START));
                if (PeopleVO.getPeoplePassword() != null)
                	criteria.add(Expression.ilike("peoplePassword", PeopleVO.getPeoplePassword(), MatchMode.START));
                if (PeopleVO.getRemark() != null)
                	criteria.add(Expression.ilike("remark", PeopleVO.getRemark(), MatchMode.START));
                if (PeopleVO.getPeopleStatus() != null)
                	criteria.add(Expression.ilike("peopleStatus", PeopleVO.getPeopleStatus(), MatchMode.START));
                if (PeopleVO.getBirthDay() != null)
                {
                	if("=".equals(PeopleVO.getBirthDay().getUpSign())){
	                	criteria.add(Expression.eq("birthDay", ProjectUtil.getDate(PeopleVO.getBirthDay().getUpDate())));
	                }else if(">".equals(PeopleVO.getBirthDay().getUpSign())){
	                	criteria.add(Expression.lt("birthDay", ProjectUtil.getDate(PeopleVO.getBirthDay().getUpDate())));
	                }else if("≥".equals(PeopleVO.getBirthDay().getUpSign())){
	                	criteria.add(Expression.le("birthDay", ProjectUtil.getDate(PeopleVO.getBirthDay().getUpDate())));
	                }
	                if(!"=".equals(PeopleVO.getBirthDay().getUpSign())){
		                if(">".equals(PeopleVO.getBirthDay().getDownSign())){
		                	criteria.add(Expression.gt("birthDay", ProjectUtil.getDate(PeopleVO.getBirthDay().getDownDate())));
		                }else if("≥".equals(PeopleVO.getBirthDay().getDownSign())){
		                	criteria.add(Expression.ge("birthDay", ProjectUtil.getDate(PeopleVO.getBirthDay().getDownDate())));
		                }
	                }
                }
                if (PeopleVO.getSex() != null)
                	criteria.add(Expression.ilike("sex", PeopleVO.getSex(), MatchMode.START));
                if (PeopleVO.getBirthPlace() != null)
                	criteria.add(Expression.ilike("birthPlace", PeopleVO.getBirthPlace(), MatchMode.START));
                if (PeopleVO.getAddress() != null)
                	criteria.add(Expression.ilike("address", PeopleVO.getAddress(), MatchMode.START));
                if (PeopleVO.getTel() != null)
                	criteria.add(Expression.ilike("tel", PeopleVO.getTel(), MatchMode.START));
                if (PeopleVO.getEngageMode() != null)
                	criteria.add(Expression.ilike("engageMode", PeopleVO.getEngageMode(), MatchMode.START));
                if (PeopleVO.getEngageDate() != null)
                {
                	if("=".equals(PeopleVO.getEngageDate().getUpSign())){
	                	criteria.add(Expression.eq("engageDate", ProjectUtil.getDate(PeopleVO.getEngageDate().getUpDate())));
	                }else if(">".equals(PeopleVO.getEngageDate().getUpSign())){
	                	criteria.add(Expression.lt("engageDate", ProjectUtil.getDate(PeopleVO.getEngageDate().getUpDate())));
	                }else if("≥".equals(PeopleVO.getEngageDate().getUpSign())){
	                	criteria.add(Expression.le("engageDate", ProjectUtil.getDate(PeopleVO.getEngageDate().getUpDate())));
	                }
	                if(!"=".equals(PeopleVO.getEngageDate().getUpSign())){
		                if(">".equals(PeopleVO.getEngageDate().getDownSign())){
		                	criteria.add(Expression.gt("engageDate", ProjectUtil.getDate(PeopleVO.getEngageDate().getDownDate())));
		                }else if("≥".equals(PeopleVO.getEngageDate().getDownSign())){
		                	criteria.add(Expression.ge("engageDate", ProjectUtil.getDate(PeopleVO.getEngageDate().getDownDate())));
		                }
	                }
                }
                if (PeopleVO.getGrade() != null)
                	criteria.add(Expression.ilike("grade", PeopleVO.getGrade(), MatchMode.START));
                if (PeopleVO.getId() != 0)
                	criteria.add(Expression.eq("id", PeopleVO.getId()));
            }
           
          //条数
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
                    .uniqueResult())  
                    .intValue();//取得符合条件的总数  
      
		      criteria.setProjection(null);  
		      People or=new com.logistics.entity.orga.PeopleImpl();
		     or.setId(new Long(totalCount));
		     //or.setRemark(new Integer(totalCount).toString());
		     if (pageNumber > 0 && pageSize > 0)
		     {
		     	criteria.setFirstResult(this.calculateFirstResult(pageNumber, pageSize));
		     	criteria.setMaxResults(pageSize);
		     }else{
		     	criteria.setMaxResults(100);
		     }
		     List re=criteria.list();
		     re.add(or);
		     return re;
      }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
	}*/

}