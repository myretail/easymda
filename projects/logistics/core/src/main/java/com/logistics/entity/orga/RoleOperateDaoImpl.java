// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.entity.orga;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Query;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;

import com.logistics.util.QueryAssCriteria;

/**
 * @see com.logistics.entity.orga.RoleOperate
 */
public class RoleOperateDaoImpl
    extends com.logistics.entity.orga.RoleOperateDaoBase
{
    
	protected java.util.List handleGetRoleOperate(com.logistics.entity.orga.RoleOperateVO RoleOperateVO, int pageNumber, int pageSize, java.lang.String orderBy)
    {
    	final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.orga.RoleOperateImpl.class);
            if (RoleOperateVO != null) QueryAssCriteria.getRoleOperateCriteria(RoleOperateVO,criteria);
             //条数
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
                    .uniqueResult())  
                    .intValue();//取得符合条件的总数  
      
		      criteria.setProjection(null);  
		      RoleOperate or=new com.logistics.entity.orga.RoleOperateImpl();
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
     * @see com.logistics.entity.orga.RoleOperateDao#getRoleOperate(com.logistics.entity.orga.RoleOperateVO, int, int, java.lang.String)
     */
    /*protected java.util.List handleGetRoleOperate(com.logistics.entity.orga.RoleOperateVO RoleOperateVO, int pageNumber, int pageSize, java.lang.String orderBy)
    {
    	final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.orga.RoleOperateImpl.class);

            if (RoleOperateVO.getId() != 0)
            criteria.add(Expression.eq("id", RoleOperateVO.getId()));
            if (RoleOperateVO.getRole() != null){ 
            	RoleInfoVO roleVO =RoleOperateVO.getRole();
           	 final Criteria criteriaRole =criteria.createCriteria("role");
           	 
           	 if (roleVO.getRoleName() != null)
           		 criteriaRole.add(Expression.ilike("roleName", roleVO.getRoleName(), MatchMode.START));
                if (roleVO.getRemark() != null)
               	 criteriaRole.add(Expression.ilike("remark", roleVO.getRemark(), MatchMode.START));
                if (roleVO.getId() != 0)
               	 criteriaRole.add(Expression.eq("id",roleVO.getId()));
            }
            
            if(RoleOperateVO.getHandle() != null){ 
            	HandleInfoVO HandleInfoVO =RoleOperateVO.getHandle();
              	 final Criteria criteriaHan =criteria.createCriteria("handle");
            	 if (HandleInfoVO.getHandleSno() != null)
            		 criteriaHan.add(Expression.ilike("handleSno", HandleInfoVO.getHandleSno(), MatchMode.START));
                 if (HandleInfoVO.getHandleName() != null)
                	 criteriaHan.add(Expression.ilike("handleName", HandleInfoVO.getHandleName(), MatchMode.START));
                 if (HandleInfoVO.getProgramName() != null)
                	 criteriaHan.add(Expression.ilike("programName", HandleInfoVO.getProgramName(), MatchMode.START));
                 if (HandleInfoVO.getRemark() != null)
                	 criteriaHan.add(Expression.ilike("remark", HandleInfoVO.getRemark(), MatchMode.START));
                 if (HandleInfoVO.getHandleType() != null)
                	 criteriaHan.add(Expression.ilike("handleType", HandleInfoVO.getHandleType(), MatchMode.START));
                 if (HandleInfoVO.getId() != 0)
                	 criteriaHan.add(Expression.eq("id", HandleInfoVO.getId()));
            }
          //条数
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
                    .uniqueResult())  
                    .intValue();//取得符合条件的总数  
      
		      criteria.setProjection(null);  
		      RoleOperate or=new com.logistics.entity.orga.RoleOperateImpl();
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

    /**
     * @see com.logistics.entity.orga.RoleOperateDao#toRoleOperateVO(com.logistics.entity.orga.RoleOperate, com.logistics.entity.orga.RoleOperateVO)
     */
    public void toRoleOperateVO(
        com.logistics.entity.orga.RoleOperate source,
        com.logistics.entity.orga.RoleOperateVO target)
    {
        // @todo verify behavior of toRoleOperateVO
        super.toRoleOperateVO(source, target);
        target.setRole(this.getRoleInfoDao().toRoleInfoVO(source.getRole()));
        target.setHandle(this.getHandleInfoDao().toHandleInfoVO(source.getHandle()));
        // WARNING! No conversion for target.role (can't convert source.getRole():com.logistics.entity.orga.RoleInfo to com.logistics.entity.orga.RoleInfoVO
        // WARNING! No conversion for target.handle (can't convert source.getHandle():com.logistics.entity.orga.HandleInfo to com.logistics.entity.orga.HandleInfoVO
    }


    /**
     * @see com.logistics.entity.orga.RoleOperateDao#toRoleOperateVO(com.logistics.entity.orga.RoleOperate)
     */
    public com.logistics.entity.orga.RoleOperateVO toRoleOperateVO(final com.logistics.entity.orga.RoleOperate entity)
    {
        // @todo verify behavior of toRoleOperateVO
        return super.toRoleOperateVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.orga.RoleOperate loadRoleOperateFromRoleOperateVO(com.logistics.entity.orga.RoleOperateVO roleOperateVO)
    {
        // @todo implement loadRoleOperateFromRoleOperateVO
        //throw new java.lang.UnsupportedOperationException("com.logistics.entity.orga.loadRoleOperateFromRoleOperateVO(com.logistics.entity.orga.RoleOperateVO) not yet implemented.");

        /* A typical implementation looks like this: */
        com.logistics.entity.orga.RoleOperate roleOperate = this.load(roleOperateVO.getId());
        if (roleOperate == null)
        {
            roleOperate = com.logistics.entity.orga.RoleOperate.Factory.newInstance();
        }
        return roleOperate;
       
    }

    
    /**
     * @see com.logistics.entity.orga.RoleOperateDao#roleOperateVOToEntity(com.logistics.entity.orga.RoleOperateVO)
     */
    public com.logistics.entity.orga.RoleOperate roleOperateVOToEntity(com.logistics.entity.orga.RoleOperateVO roleOperateVO)
    {
        // @todo verify behavior of roleOperateVOToEntity
        com.logistics.entity.orga.RoleOperate entity = this.loadRoleOperateFromRoleOperateVO(roleOperateVO);
        this.roleOperateVOToEntity(roleOperateVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.orga.RoleOperateDao#roleOperateVOToEntity(com.logistics.entity.orga.RoleOperateVO, com.logistics.entity.orga.RoleOperate)
     */
    public void roleOperateVOToEntity(
        com.logistics.entity.orga.RoleOperateVO source,
        com.logistics.entity.orga.RoleOperate target,
        boolean copyIfNull)
    {
        // @todo verify behavior of roleOperateVOToEntity
        super.roleOperateVOToEntity(source, target, copyIfNull);
        target.setRole(this.getRoleInfoDao().load(source.getRole().getId()));
        target.setHandle(this.getHandleInfoDao().load(source.getHandle().getId()));
    }

	protected HandleInfoVO[] handleGetHandleByRoles(List roles,java.lang.String parentSno)throws Exception {
		
		final Session session = getSession(false);
		try
        {   
            final Criteria criteria = session.createCriteria(com.logistics.entity.orga.RoleOperateImpl.class);
                  criteria.createCriteria("role").add(Expression.in("id",roles));
                  System.out.println("parentSno:"+parentSno);
                  if(parentSno==null)parentSno="___";
                  criteria.createCriteria("handle").add(Expression.like("handleSno",parentSno,MatchMode.EXACT));
                  //criteria.createCriteria("handle").add(Expression.sql("handle_info.handleSno like "+parentSno+"___"));
                  List roleHandleList=criteria.list();
            HandleInfoVO[] handleInfoVO=new HandleInfoVO[roleHandleList.size()];
            RoleOperate roleOperate=new RoleOperateImpl();
            for(int i=0;i<roleHandleList.size();i++){
            	roleOperate=(RoleOperate)roleHandleList.get(i);
            	handleInfoVO[i]=this.getHandleInfoDao().toHandleInfoVO(roleOperate.getHandle());
            }
            return  handleInfoVO;
           	
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
	}
protected java.util.List handleGetAllRoleHandleByRoles(java.lang.String roles)throws Exception {
		
		final Session session = getSession(false);
		String[] roleIDs= roles.split(",");
		String sql="select * from Role_operate where ";
		for(int i=0;i<roleIDs.length;i++){
			if(i==0){
				sql=sql+"ROLE_FK = ? ";
			}else{
				sql=sql+"or ROLE_FK = ? ";
			}
		}
		try		
        {   
			Query sqlQuery = session.createSQLQuery(sql);
			for(int i=0;i<roleIDs.length;i++){
				sqlQuery.setLong(i,Long.parseLong(roleIDs[i]));
			}
            List roleHandleList=sqlQuery.list();
            //handleInfoVO[i]=this.getHandleInfoDao().toHandleInfoVO(roleOperate.getHandle());
            return  roleHandleList;
           	
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
	}

}