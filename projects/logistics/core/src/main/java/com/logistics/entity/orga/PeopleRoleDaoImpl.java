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

import com.logistics.util.ProjectUtil;
import com.logistics.util.QueryAssCriteria;

/**
 * @see com.logistics.entity.orga.PeopleRole
 */
public class PeopleRoleDaoImpl
    extends com.logistics.entity.orga.PeopleRoleDaoBase
{
    /**
     * @see com.logistics.entity.orga.PeopleRoleDao#getPeopleRoleVO(long, long, long)
     */
    protected java.util.List handleGetPeopleRoleVO(long peopleId, long ruleId, long id)
    {
        // @todo implement public java.util.List handleGetPeopleRoleVO(long peopleId, long ruleId, long id)
        return null;
}

    /**
     * @see com.logistics.entity.orga.PeopleRoleDao#getPeopleRole(com.logistics.entity.orga.PeopleRoleVO, int, int, java.lang.String)
     */
    /*protected java.util.List handleGetPeopleRole(com.logistics.entity.orga.PeopleRoleVO PeopleRoleVO, int pageNumber, int pageSize, java.lang.String orderBy)
    {
    	final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.orga.PeopleRoleImpl.class);

            if (PeopleRoleVO.getId() != 0)
            criteria.add(Expression.eq("id", PeopleRoleVO.getId()));
            if (PeopleRoleVO.getRole() != null){
            	RoleInfoVO roleVO =PeopleRoleVO.getRole();
            	 final Criteria criteriaRole =criteria.createCriteria("role");
            	 if (roleVO.getRoleName() != null)
            		 criteriaRole.add(Expression.ilike("roleName", roleVO.getRoleName(), MatchMode.START));
                 if (roleVO.getRemark() != null)
                	 criteriaRole.add(Expression.ilike("remark", roleVO.getRemark(), MatchMode.START));
                 if (roleVO.getId() != 0)
                	 criteriaRole.add(Expression.eq("id",roleVO.getId()));
            }
            if (PeopleRoleVO.getPeople() != null) {
            	PeopleVO peoVO=PeopleRoleVO.getPeople();
            	final Criteria criteriaPeo =   criteria.createCriteria("people");
            	if (peoVO.getPeopleName() != null)
            		criteriaPeo.add(Expression.ilike("peopleName", peoVO.getPeopleName(), MatchMode.START));
                if (peoVO.getPeoplePassword() != null)
                	criteriaPeo.add(Expression.ilike("peoplePassword", peoVO.getPeoplePassword(), MatchMode.START));
                if (peoVO.getRemark() != null)
                	criteriaPeo.add(Expression.ilike("remark", peoVO.getRemark(), MatchMode.START));
                if (peoVO.getPeopleStatus() != null)
                	criteriaPeo.add(Expression.ilike("peopleStatus", peoVO.getPeopleStatus(), MatchMode.START));
                if (peoVO.getBirthDay() != null)
                {
                	if("=".equals(peoVO.getBirthDay().getUpSign())){
	                	criteria.add(Expression.eq("birthDay", ProjectUtil.getDate(peoVO.getBirthDay().getUpDate())));
	                }else if(">".equals(peoVO.getBirthDay().getUpSign())){
	                	criteria.add(Expression.lt("birthDay", ProjectUtil.getDate(peoVO.getBirthDay().getUpDate())));
	                }else if("≥".equals(peoVO.getBirthDay().getUpSign())){
	                	criteria.add(Expression.le("birthDay", ProjectUtil.getDate(peoVO.getBirthDay().getUpDate())));
	                }
	                if(!"=".equals(peoVO.getBirthDay().getUpSign())){
		                if(">".equals(peoVO.getBirthDay().getDownSign())){
		                	criteria.add(Expression.gt("birthDay", ProjectUtil.getDate(peoVO.getBirthDay().getDownDate())));
		                }else if("≥".equals(peoVO.getBirthDay().getDownSign())){
		                	criteria.add(Expression.ge("birthDay", ProjectUtil.getDate(peoVO.getBirthDay().getDownDate())));
		                }
	                }
                }
                if (peoVO.getSex() != null)
                	criteriaPeo.add(Expression.ilike("sex", peoVO.getSex(), MatchMode.START));
                if (peoVO.getBirthPlace() != null)
                	criteriaPeo.add(Expression.ilike("birthPlace", peoVO.getBirthPlace(), MatchMode.START));
                if (peoVO.getAddress() != null)
                	criteriaPeo.add(Expression.ilike("address", peoVO.getAddress(), MatchMode.START));
                if (peoVO.getTel() != null)
                	criteriaPeo.add(Expression.ilike("tel", peoVO.getTel(), MatchMode.START));
                if (peoVO.getEngageMode() != null)
                	criteriaPeo.add(Expression.ilike("engageMode", peoVO.getEngageMode(), MatchMode.START));
                if (peoVO.getEngageDate() != null)
                {
                	if("=".equals(peoVO.getEngageDate().getUpSign())){
	                	criteria.add(Expression.eq("engageDate", ProjectUtil.getDate(peoVO.getEngageDate().getUpDate())));
	                }else if(">".equals(peoVO.getEngageDate().getUpSign())){
	                	criteria.add(Expression.lt("engageDate", ProjectUtil.getDate(peoVO.getEngageDate().getUpDate())));
	                }else if("≥".equals(peoVO.getEngageDate().getUpSign())){
	                	criteria.add(Expression.le("engageDate", ProjectUtil.getDate(peoVO.getEngageDate().getUpDate())));
	                }
	                if(!"=".equals(peoVO.getEngageDate().getUpSign())){
		                if(">".equals(peoVO.getEngageDate().getDownSign())){
		                	criteria.add(Expression.gt("engageDate", ProjectUtil.getDate(peoVO.getEngageDate().getDownDate())));
		                }else if("≥".equals(peoVO.getEngageDate().getDownSign())){
		                	criteria.add(Expression.ge("engageDate", ProjectUtil.getDate(peoVO.getEngageDate().getDownDate())));
		                }
	                }
                }
                if (peoVO.getGrade() != null)
                	criteriaPeo.add(Expression.ilike("grade", peoVO.getGrade(), MatchMode.START));
                if (peoVO.getId() != 0)
                	criteriaPeo.add(Expression.eq("id", peoVO.getId()));
            }
            //条数
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
                    .uniqueResult())  
                    .intValue();//取得符合条件的总数  
      
		      criteria.setProjection(null);  
		      PeopleRole or=new com.logistics.entity.orga.PeopleRoleImpl();
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
    protected java.util.List handleGetPeopleRole(com.logistics.entity.orga.PeopleRoleVO PeopleRoleVO, int pageNumber, int pageSize, java.lang.String orderBy)
    {
    	final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.orga.PeopleRoleImpl.class);
            if (PeopleRoleVO != null) QueryAssCriteria.getPeopleRoleCriteria(PeopleRoleVO,criteria);
            //条数
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
                    .uniqueResult())  
                    .intValue();//取得符合条件的总数  
      
		      criteria.setProjection(null);  
		      PeopleRole or=new com.logistics.entity.orga.PeopleRoleImpl();
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
    /**
     * @see com.logistics.entity.orga.PeopleRoleDao#toPeopleRoleVO(com.logistics.entity.orga.PeopleRole, com.logistics.entity.orga.PeopleRoleVO)
     */
    public void toPeopleRoleVO(
        com.logistics.entity.orga.PeopleRole source,
        com.logistics.entity.orga.PeopleRoleVO target)
    {
        // @todo verify behavior of toPeopleRoleVO
        super.toPeopleRoleVO(source, target);
        target.setPeople(this.getPeopleDao().toPeopleVO(source.getPeople()));
        target.setRole(this.getRoleInfoDao().toRoleInfoVO(source.getRole()));
        // WARNING! No conversion for target.role (can't convert source.getRole():com.logistics.entity.orga.RoleInfo to com.logistics.entity.orga.RoleInfoVO
        // WARNING! No conversion for target.people (can't convert source.getPeople():com.logistics.entity.orga.People to com.logistics.entity.orga.PeopleVO
    }


    /**
     * @see com.logistics.entity.orga.PeopleRoleDao#toPeopleRoleVO(com.logistics.entity.orga.PeopleRole)
     */
    public com.logistics.entity.orga.PeopleRoleVO toPeopleRoleVO(final com.logistics.entity.orga.PeopleRole entity)
    {
        // @todo verify behavior of toPeopleRoleVO
        return super.toPeopleRoleVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.orga.PeopleRole loadPeopleRoleFromPeopleRoleVO(com.logistics.entity.orga.PeopleRoleVO peopleRoleVO)
    {
        // @todo implement loadPeopleRoleFromPeopleRoleVO
        //throw new java.lang.UnsupportedOperationException("com.logistics.entity.orga.loadPeopleRoleFromPeopleRoleVO(com.logistics.entity.orga.PeopleRoleVO) not yet implemented.");

        /* A typical implementation looks like this:*/
        com.logistics.entity.orga.PeopleRole peopleRole = this.load(peopleRoleVO.getId());
        if (peopleRole == null)
        {
            peopleRole = com.logistics.entity.orga.PeopleRole.Factory.newInstance();
        }
        return peopleRole;
        
    }

    
    /**
     * @see com.logistics.entity.orga.PeopleRoleDao#peopleRoleVOToEntity(com.logistics.entity.orga.PeopleRoleVO)
     */
    public com.logistics.entity.orga.PeopleRole peopleRoleVOToEntity(com.logistics.entity.orga.PeopleRoleVO peopleRoleVO)
    {
        // @todo verify behavior of peopleRoleVOToEntity
        com.logistics.entity.orga.PeopleRole entity = this.loadPeopleRoleFromPeopleRoleVO(peopleRoleVO);
        this.peopleRoleVOToEntity(peopleRoleVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.orga.PeopleRoleDao#peopleRoleVOToEntity(com.logistics.entity.orga.PeopleRoleVO, com.logistics.entity.orga.PeopleRole)
     */
    public void peopleRoleVOToEntity(
        com.logistics.entity.orga.PeopleRoleVO source,
        com.logistics.entity.orga.PeopleRole target,
        boolean copyIfNull)
    {
        // @todo verify behavior of peopleRoleVOToEntity
        super.peopleRoleVOToEntity(source, target, copyIfNull);
        target.setPeople(this.getPeopleDao().load(source.getPeople().getId()));
        target.setRole(this.getRoleInfoDao().load(source.getRole().getId()));
    }

}