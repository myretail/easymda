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

import com.logistics.util.QueryAssCriteria;

/**
 * @see com.logistics.entity.orga.RoleInfo
 */
public class RoleInfoDaoImpl
    extends com.logistics.entity.orga.RoleInfoDaoBase
{
    
	
	/**
     * @see com.logistics.entity.orga.RoleInfoDao#getRoleInfo(com.logistics.entity.orga.RoleInfoVO, int, int, java.lang.String)
     */
	protected java.util.List handleGetRoleInfo(com.logistics.entity.orga.RoleInfoVO RoleInfoVO, int pageNumber, int pageSize, java.lang.String orderBy)
    {
    	 final Session session = getSession(false);

         try
         {
             final Criteria criteriaRole = session.createCriteria(com.logistics.entity.orga.RoleInfoImpl.class);
             if (RoleInfoVO != null) QueryAssCriteria.getRoleCriteria(RoleInfoVO,criteriaRole);
        	 //条数
                int totalCount = ((Integer) criteriaRole.setProjection(Projections.rowCount())
                        .uniqueResult())  
                        .intValue();//取得符合条件的总数  
          
    		      criteriaRole.setProjection(null);  
    		      RoleInfo or=new com.logistics.entity.orga.RoleInfoImpl();
    		     or.setId(new Long(totalCount));
    		     //or.setRemark(new Integer(totalCount).toString());
    		     if (pageNumber > 0 && pageSize > 0)
    		     {
    		     	criteriaRole.setFirstResult(this.calculateFirstResult(pageNumber, pageSize));
    		     	criteriaRole.setMaxResults(pageSize);
    		     }else{
    		     	criteriaRole.setMaxResults(100);
    		     }
    		     List re=criteriaRole.list();
    		     re.add(or);
    		     return re;
         }
         catch (org.hibernate.HibernateException ex)
         {
             throw super.convertHibernateAccessException(ex);
         }
   	}
	
    /*protected java.util.List handleGetRoleInfo(com.logistics.entity.orga.RoleInfoVO RoleInfoVO, int pageNumber, int pageSize, java.lang.String orderBy)
    {
    	 final Session session = getSession(false);

         try
         {
             final Criteria criteriaRole = session.createCriteria(com.logistics.entity.orga.RoleInfoImpl.class);

        	 if (RoleInfoVO.getRoleName() != null)
           		 criteriaRole.add(Expression.ilike("roleName", RoleInfoVO.getRoleName(), MatchMode.START));
                if (RoleInfoVO.getRemark() != null)
               	 criteriaRole.add(Expression.ilike("remark", RoleInfoVO.getRemark(), MatchMode.START));
                if (RoleInfoVO.getId() != 0)
               	 criteriaRole.add(Expression.eq("id",RoleInfoVO.getId()));
              //条数
                int totalCount = ((Integer) criteriaRole.setProjection(Projections.rowCount())
                        .uniqueResult())  
                        .intValue();//取得符合条件的总数  
          
    		      criteriaRole.setProjection(null);  
    		      RoleInfo or=new com.logistics.entity.orga.RoleInfoImpl();
    		     or.setId(new Long(totalCount));
    		     //or.setRemark(new Integer(totalCount).toString());
    		     if (pageNumber > 0 && pageSize > 0)
    		     {
    		     	criteriaRole.setFirstResult(this.calculateFirstResult(pageNumber, pageSize));
    		     	criteriaRole.setMaxResults(pageSize);
    		     }else{
    		     	criteriaRole.setMaxResults(100);
    		     }
    		     List re=criteriaRole.list();
    		     re.add(or);
    		     return re;
         }
         catch (org.hibernate.HibernateException ex)
         {
             throw super.convertHibernateAccessException(ex);
         }
   	 
   
    }*/

    /**
     * @see com.logistics.entity.orga.RoleInfoDao#toRoleInfoVO(com.logistics.entity.orga.RoleInfo, com.logistics.entity.orga.RoleInfoVO)
     */
    public void toRoleInfoVO(
        com.logistics.entity.orga.RoleInfo source,
        com.logistics.entity.orga.RoleInfoVO target)
    {
        // @todo verify behavior of toRoleInfoVO
        super.toRoleInfoVO(source, target);
    }


    /**
     * @see com.logistics.entity.orga.RoleInfoDao#toRoleInfoVO(com.logistics.entity.orga.RoleInfo)
     */
    public com.logistics.entity.orga.RoleInfoVO toRoleInfoVO(final com.logistics.entity.orga.RoleInfo entity)
    {
        // @todo verify behavior of toRoleInfoVO
        return super.toRoleInfoVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.orga.RoleInfo loadRoleInfoFromRoleInfoVO(com.logistics.entity.orga.RoleInfoVO roleInfoVO)
    {
        // @todo implement loadRoleInfoFromRoleInfoVO
        //throw new java.lang.UnsupportedOperationException("com.logistics.entity.orga.loadRoleInfoFromRoleInfoVO(com.logistics.entity.orga.RoleInfoVO) not yet implemented.");

        /* A typical implementation looks like this:  */
        com.logistics.entity.orga.RoleInfo roleInfo = this.load(roleInfoVO.getId());
        if (roleInfo == null)
        {
            roleInfo = com.logistics.entity.orga.RoleInfo.Factory.newInstance();
        }
        return roleInfo;
      
    }

    
    /**
     * @see com.logistics.entity.orga.RoleInfoDao#roleInfoVOToEntity(com.logistics.entity.orga.RoleInfoVO)
     */
    public com.logistics.entity.orga.RoleInfo roleInfoVOToEntity(com.logistics.entity.orga.RoleInfoVO roleInfoVO)
    {
        // @todo verify behavior of roleInfoVOToEntity
        com.logistics.entity.orga.RoleInfo entity = this.loadRoleInfoFromRoleInfoVO(roleInfoVO);
        this.roleInfoVOToEntity(roleInfoVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.orga.RoleInfoDao#roleInfoVOToEntity(com.logistics.entity.orga.RoleInfoVO, com.logistics.entity.orga.RoleInfo)
     */
    public void roleInfoVOToEntity(
        com.logistics.entity.orga.RoleInfoVO source,
        com.logistics.entity.orga.RoleInfo target,
        boolean copyIfNull)
    {
        // @todo verify behavior of roleInfoVOToEntity
        super.roleInfoVOToEntity(source, target, copyIfNull);
    }

}