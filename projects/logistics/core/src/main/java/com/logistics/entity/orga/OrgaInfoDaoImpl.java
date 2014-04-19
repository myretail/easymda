// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.entity.orga;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;

import com.logistics.entity.car.WlVoiture;
import com.logistics.util.QueryAssCriteria;

/**
 * @see com.logistics.entity.orga.OrgaInfo
 */
public class OrgaInfoDaoImpl
    extends com.logistics.entity.orga.OrgaInfoDaoBase
{
    /**
     * @see com.logistics.entity.orga.OrgaInfoDao#getOrgaInfoVO(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, long)
     */
    protected java.util.List handleGetOrgaInfoVO(java.lang.String orgaSno, java.lang.String orgaName, java.lang.String orgaCode, java.lang.String remark, java.lang.String orgaState, long id)
    {
    	final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.orga.OrgaInfoImpl.class);
            System.out.println("orgaSno====="+orgaSno);
            if (orgaSno != null)
                criteria.add(Expression.ilike("orgaSno", orgaSno, MatchMode.EXACT));
            if (orgaName != null)
                criteria.add(Expression.ilike("orgaName", orgaName, MatchMode.START));
            if (orgaCode != null)
                criteria.add(Expression.ilike("orgaCode", orgaCode, MatchMode.START));
            if (remark != null)
                criteria.add(Expression.ilike("remark", remark, MatchMode.START));
            if (orgaState != null)
                criteria.add(Expression.ilike("orgaState", orgaState, MatchMode.START));
            if (id != 0)
            criteria.add(Expression.eq("id", id));
            criteria.setMaxResults(250);

            return criteria.list();
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
    }

    /**
     * @see com.logistics.entity.orga.OrgaInfoDao#toOrgaInfoVO(com.logistics.entity.orga.OrgaInfo, com.logistics.entity.orga.OrgaInfoVO)
     */
    public void toOrgaInfoVO(
        com.logistics.entity.orga.OrgaInfo source,
        com.logistics.entity.orga.OrgaInfoVO target)
    {
        // @todo verify behavior of toOrgaInfoVO
        super.toOrgaInfoVO(source, target);
        
    }


    /**
     * @see com.logistics.entity.orga.OrgaInfoDao#toOrgaInfoVO(com.logistics.entity.orga.OrgaInfo)
     */
    public com.logistics.entity.orga.OrgaInfoVO toOrgaInfoVO(final com.logistics.entity.orga.OrgaInfo entity)
    {
        // @todo verify behavior of toOrgaInfoVO
        return super.toOrgaInfoVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.orga.OrgaInfo loadOrgaInfoFromOrgaInfoVO(com.logistics.entity.orga.OrgaInfoVO orgaInfoVO)
    {
        // @todo implement loadOrgaInfoFromOrgaInfoVO
       //throw new java.lang.UnsupportedOperationException("com.logistics.entity.orga.loadOrgaInfoFromOrgaInfoVO(com.logistics.entity.orga.OrgaInfoVO) not yet implemented.");

        /* A typical implementation looks like this:*/
        com.logistics.entity.orga.OrgaInfo orgaInfo = this.load(orgaInfoVO.getId());
        if (orgaInfo == null)
        {
            orgaInfo = com.logistics.entity.orga.OrgaInfo.Factory.newInstance();
        }
        return orgaInfo;
        
    }

    
    /**
     * @see com.logistics.entity.orga.OrgaInfoDao#orgaInfoVOToEntity(com.logistics.entity.orga.OrgaInfoVO)
     */
    public com.logistics.entity.orga.OrgaInfo orgaInfoVOToEntity(com.logistics.entity.orga.OrgaInfoVO orgaInfoVO)
    {
        // @todo verify behavior of orgaInfoVOToEntity
        com.logistics.entity.orga.OrgaInfo entity = this.loadOrgaInfoFromOrgaInfoVO(orgaInfoVO);
        this.orgaInfoVOToEntity(orgaInfoVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.orga.OrgaInfoDao#orgaInfoVOToEntity(com.logistics.entity.orga.OrgaInfoVO, com.logistics.entity.orga.OrgaInfo)
     */
    public void orgaInfoVOToEntity(
        com.logistics.entity.orga.OrgaInfoVO source,
        com.logistics.entity.orga.OrgaInfo target,
        boolean copyIfNull)
    {
        // @todo verify behavior of orgaInfoVOToEntity
        super.orgaInfoVOToEntity(source, target, copyIfNull);
    }

	/*protected List handleGetOrgaInfo(OrgaInfoVO OrgaInfoVO, int pageNumber,	int pageSize, String orderBy) throws Exception {
		final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.orga.OrgaInfoImpl.class);

            if (OrgaInfoVO.getOrgaSno() != null)
                criteria.add(Expression.ilike("orgaSno", OrgaInfoVO.getOrgaSno(), MatchMode.START));
            if (OrgaInfoVO.getOrgaName() != null)
                criteria.add(Expression.ilike("orgaName", OrgaInfoVO.getOrgaName(), MatchMode.START));
            if (OrgaInfoVO.getOrgaCode() != null)
                criteria.add(Expression.ilike("orgaCode", OrgaInfoVO.getOrgaCode(), MatchMode.START));
            if (OrgaInfoVO.getRemark() != null)
                criteria.add(Expression.ilike("remark", OrgaInfoVO.getRemark(), MatchMode.START));
            if (OrgaInfoVO.getOrgaState() != null)
                criteria.add(Expression.ilike("orgaState", OrgaInfoVO.getOrgaState(), MatchMode.START));
            if (OrgaInfoVO.getId()!= 0)
            criteria.add(Expression.eq("id", OrgaInfoVO.getId()));
          //条数
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
                    .uniqueResult())  
                    .intValue();//取得符合条件的总数  
      
		      criteria.setProjection(null);  
		      OrgaInfo or=new com.logistics.entity.orga.OrgaInfoImpl();
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
    
    protected List handleGetOrgaInfo(OrgaInfoVO OrgaInfoVO, int pageNumber,	int pageSize, String orderBy) throws Exception {
		final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.orga.OrgaInfoImpl.class);
            if (OrgaInfoVO != null) QueryAssCriteria.getOrgaCriteria(OrgaInfoVO,criteria);
            
          //条数
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
                    .uniqueResult())  
                    .intValue();//取得符合条件的总数  
      
		      criteria.setProjection(null);  
		      OrgaInfo or=new com.logistics.entity.orga.OrgaInfoImpl();
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

    protected java.lang.String  handleGetMaxSno(java.lang.String parentSno) throws Exception {
    	final Session session = getSession(false);
    	Query sqlQuery = session.createSQLQuery("select max(orga_Sno) from orga_info where orga_Sno like ?");
    	System.out.println("parentSno:"+parentSno);
    	if(parentSno==null)parentSno="";
    	sqlQuery.setString(0,parentSno+"___");
        List li=sqlQuery.list();
        String sOrgaSno="000";
        //sOrgaSno
        String	maxOrgaSno=(String)li.get(0);
        System.out.println("maxOrgaSno:"+maxOrgaSno);
        if(maxOrgaSno!=null){
        //System.out.println("li:"+li);
        sOrgaSno = (Integer.parseInt(maxOrgaSno.substring(maxOrgaSno.length()-3, maxOrgaSno.length())) + 1)+"" ;
		switch (sOrgaSno.length()) {
			
			case 3 :
				break;
			case 2 :
				sOrgaSno = "0" + sOrgaSno;
				break;
			case 1 :
				sOrgaSno = "00" + sOrgaSno;
				break;
			default :
				sOrgaSno = "000" ;
		}
      }
		return parentSno+sOrgaSno;
    
    }
}