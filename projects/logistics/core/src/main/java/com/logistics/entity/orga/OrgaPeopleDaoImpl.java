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

import com.logistics.entity.car.WlVoiture;
import com.logistics.util.ProjectUtil;
import com.logistics.util.QueryAssCriteria;

/**
 * @see com.logistics.entity.orga.OrgaPeople
 */
public class OrgaPeopleDaoImpl
    extends com.logistics.entity.orga.OrgaPeopleDaoBase
{
    /**
     * @see com.logistics.entity.orga.OrgaPeopleDao#getOrgaPeople(com.logistics.entity.orga.OrgaPeopleVO, int, int, java.lang.String)
     */
    /*protected java.util.List handleGetOrgaPeople(com.logistics.entity.orga.OrgaPeopleVO OrgaPeopleVO, int pageNumber, int pageSize, java.lang.String orderBy)
    {
    	final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.orga.OrgaPeopleImpl.class);

            if (OrgaPeopleVO.getId() != 0)
            criteria.add(Expression.eq("id", OrgaPeopleVO.getId()));
            if (OrgaPeopleVO.getPeople() != null) {
            	PeopleVO peoVO=OrgaPeopleVO.getPeople();
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
                		criteriaPeo.add(Expression.eq("birthDay", ProjectUtil.getDate(peoVO.getBirthDay().getUpDate())));
	                }else if(">".equals(peoVO.getBirthDay().getUpSign())){
	                	criteriaPeo.add(Expression.lt("birthDay", ProjectUtil.getDate(peoVO.getBirthDay().getUpDate())));
	                }else if("≥".equals(peoVO.getBirthDay().getUpSign())){
	                	criteriaPeo.add(Expression.le("birthDay", ProjectUtil.getDate(peoVO.getBirthDay().getUpDate())));
	                }
	                if(!"=".equals(peoVO.getBirthDay().getUpSign())){
		                if(">".equals(peoVO.getBirthDay().getDownSign())){
		                	criteriaPeo.add(Expression.gt("birthDay", ProjectUtil.getDate(peoVO.getBirthDay().getDownDate())));
		                }else if("≥".equals(peoVO.getBirthDay().getDownSign())){
		                	criteriaPeo.add(Expression.ge("birthDay", ProjectUtil.getDate(peoVO.getBirthDay().getDownDate())));
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
                		criteriaPeo.add(Expression.eq("engageDate", ProjectUtil.getDate(peoVO.getEngageDate().getUpDate())));
	                }else if(">".equals(peoVO.getEngageDate().getUpSign())){
	                	criteriaPeo.add(Expression.lt("engageDate", ProjectUtil.getDate(peoVO.getEngageDate().getUpDate())));
	                }else if("≥".equals(peoVO.getEngageDate().getUpSign())){
	                	criteriaPeo.add(Expression.le("engageDate", ProjectUtil.getDate(peoVO.getEngageDate().getUpDate())));
	                }
	                if(!"=".equals(peoVO.getEngageDate().getUpSign())){
		                if(">".equals(peoVO.getEngageDate().getDownSign())){
		                	criteriaPeo.add(Expression.gt("engageDate", ProjectUtil.getDate(peoVO.getEngageDate().getDownDate())));
		                }else if("≥".equals(peoVO.getEngageDate().getDownSign())){
		                	criteriaPeo.add(Expression.ge("engageDate", ProjectUtil.getDate(peoVO.getEngageDate().getDownDate())));
		                }
	                }
                }
                if (peoVO.getGrade() != null)
                	criteriaPeo.add(Expression.ilike("grade", peoVO.getGrade(), MatchMode.START));
                if (peoVO.getId() != 0)
                	criteriaPeo.add(Expression.eq("id", peoVO.getId()));
            }
            if (OrgaPeopleVO.getOrga() != null) {
            	OrgaInfoVO orgVO=OrgaPeopleVO.getOrga();
            	final Criteria criteriaOrga =   criteria.createCriteria("orga");
            	if (orgVO.getOrgaSno() != null)
            		criteriaOrga.add(Expression.ilike("orgaSno", orgVO.getOrgaSno(), MatchMode.START));
                if (orgVO.getOrgaName() != null)
                	criteriaOrga.add(Expression.ilike("orgaName", orgVO.getOrgaName(), MatchMode.START));
                if (orgVO.getOrgaCode() != null)
                	criteriaOrga.add(Expression.ilike("orgaCode", orgVO.getOrgaCode(), MatchMode.START));
                if (orgVO.getRemark() != null)
                	criteriaOrga.add(Expression.ilike("remark", orgVO.getRemark(), MatchMode.START));
                if (orgVO.getOrgaState() != null)
                	criteriaOrga.add(Expression.ilike("orgaState", orgVO.getOrgaState(), MatchMode.START));
                if (orgVO.getId() != 0)
                	criteriaOrga.add(Expression.eq("id", orgVO.getId()));
            }
          //条数
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
                    .uniqueResult())  
                    .intValue();//取得符合条件的总数  
      
		      criteria.setProjection(null);  
		      OrgaPeople or=new com.logistics.entity.orga.OrgaPeopleImpl();
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
	
	protected java.util.List handleGetOrgaPeople(com.logistics.entity.orga.OrgaPeopleVO OrgaPeopleVO, int pageNumber, int pageSize, java.lang.String orderBy)
    {
    	final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.orga.OrgaPeopleImpl.class);
            if (OrgaPeopleVO != null) QueryAssCriteria.getOrgaPeopleCriteria(OrgaPeopleVO,criteria);
            //条数
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
                    .uniqueResult())  
                    .intValue();//取得符合条件的总数  
      
		      criteria.setProjection(null);  
		      OrgaPeople or=new com.logistics.entity.orga.OrgaPeopleImpl();
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
     * @see com.logistics.entity.orga.OrgaPeopleDao#toOrgaPeopleVO(com.logistics.entity.orga.OrgaPeople, com.logistics.entity.orga.OrgaPeopleVO)
     */
    public void toOrgaPeopleVO(
        com.logistics.entity.orga.OrgaPeople source,
        com.logistics.entity.orga.OrgaPeopleVO target)
    {
        // @todo verify behavior of toOrgaPeopleVO
        super.toOrgaPeopleVO(source, target);
        target.setOrga(this.getOrgaInfoDao().toOrgaInfoVO(source.getOrga()));
        // WARNING! No conversion for target.orga (can't convert source.getOrga():com.logistics.entity.orga.OrgaInfo to com.logistics.entity.orga.OrgaInfoVO
        target.setPeople(this.getPeopleDao().toPeopleVO(source.getPeople()));
        // WARNING! No conversion for target.people (can't convert source.getPeople():com.logistics.entity.orga.People to com.logistics.entity.orga.PeopleVO
    }


    /**
     * @see com.logistics.entity.orga.OrgaPeopleDao#toOrgaPeopleVO(com.logistics.entity.orga.OrgaPeople)
     */
    public com.logistics.entity.orga.OrgaPeopleVO toOrgaPeopleVO(final com.logistics.entity.orga.OrgaPeople entity)
    {
        // @todo verify behavior of toOrgaPeopleVO
        return super.toOrgaPeopleVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.orga.OrgaPeople loadOrgaPeopleFromOrgaPeopleVO(com.logistics.entity.orga.OrgaPeopleVO orgaPeopleVO)
    {
        // @todo implement loadOrgaPeopleFromOrgaPeopleVO
        //throw new java.lang.UnsupportedOperationException("com.logistics.entity.orga.loadOrgaPeopleFromOrgaPeopleVO(com.logistics.entity.orga.OrgaPeopleVO) not yet implemented.");

        /* A typical implementation looks like this:*/
        com.logistics.entity.orga.OrgaPeople orgaPeople = this.load(orgaPeopleVO.getId());
        if (orgaPeople == null)
        {
            orgaPeople = com.logistics.entity.orga.OrgaPeople.Factory.newInstance();
        }
        return orgaPeople;
        
    }

    
    /**
     * @see com.logistics.entity.orga.OrgaPeopleDao#orgaPeopleVOToEntity(com.logistics.entity.orga.OrgaPeopleVO)
     */
    public com.logistics.entity.orga.OrgaPeople orgaPeopleVOToEntity(com.logistics.entity.orga.OrgaPeopleVO orgaPeopleVO)
    {
        // @todo verify behavior of orgaPeopleVOToEntity
        com.logistics.entity.orga.OrgaPeople entity = this.loadOrgaPeopleFromOrgaPeopleVO(orgaPeopleVO);
        this.orgaPeopleVOToEntity(orgaPeopleVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.orga.OrgaPeopleDao#orgaPeopleVOToEntity(com.logistics.entity.orga.OrgaPeopleVO, com.logistics.entity.orga.OrgaPeople)
     */
    public void orgaPeopleVOToEntity(
        com.logistics.entity.orga.OrgaPeopleVO source,
        com.logistics.entity.orga.OrgaPeople target,
        boolean copyIfNull)
    {
        // @todo verify behavior of orgaPeopleVOToEntity
        super.orgaPeopleVOToEntity(source, target, copyIfNull);
        target.setPeople(this.getPeopleDao().load(source.getPeople().getId()));
        target.setOrga(this.getOrgaInfoDao().load(source.getOrga().getId()));
    }

}