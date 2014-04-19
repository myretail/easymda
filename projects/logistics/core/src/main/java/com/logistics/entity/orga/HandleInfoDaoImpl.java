// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.entity.orga;
/**
 * @see com.logistics.entity.orga.HandleInfo
 */
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;

import com.logistics.entity.car.WlVoiture;
import com.logistics.util.QueryAssCriteria;

public class HandleInfoDaoImpl
    extends com.logistics.entity.orga.HandleInfoDaoBase
{
    /**
     * @see com.logistics.entity.orga.HandleInfoDao#getHandleInfo(com.logistics.entity.orga.HandleInfoVO, int, int, java.lang.String)
     */
   /* protected java.util.List handleGetHandleInfo(com.logistics.entity.orga.HandleInfoVO HandleInfoVO, int pageNumber, int pageSize, java.lang.String orderBy)
    {
    	 final Session session = getSession(false);

         try
         {
             final Criteria criteria = session.createCriteria(com.logistics.entity.orga.HandleInfoImpl.class);

             if (HandleInfoVO.getHandleSno() != null)
                 criteria.add(Expression.ilike("handleSno", HandleInfoVO.getHandleSno(), MatchMode.START));
             if (HandleInfoVO.getHandleName() != null)
                 criteria.add(Expression.ilike("handleName", HandleInfoVO.getHandleName(), MatchMode.START));
             if (HandleInfoVO.getProgramName() != null)
                 criteria.add(Expression.ilike("programName", HandleInfoVO.getProgramName(), MatchMode.START));
             if (HandleInfoVO.getRemark() != null)
                 criteria.add(Expression.ilike("remark", HandleInfoVO.getRemark(), MatchMode.START));
             if (HandleInfoVO.getHandleType() != null)
                 criteria.add(Expression.ilike("handleType", HandleInfoVO.getHandleType(), MatchMode.START));
             if (HandleInfoVO.getId() != 0)
             criteria.add(Expression.eq("id", HandleInfoVO.getId()));
           //条数
             int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
                     .uniqueResult())  
                     .intValue();//取得符合条件的总数  
       
		      criteria.setProjection(null);  
		      HandleInfo or=new com.logistics.entity.orga.HandleInfoImpl();
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
	protected java.util.List handleGetHandleInfo(com.logistics.entity.orga.HandleInfoVO HandleInfoVO, int pageNumber, int pageSize, java.lang.String orderBy)
    {
    	 final Session session = getSession(false);

         try
         {
             final Criteria criteria = session.createCriteria(com.logistics.entity.orga.HandleInfoImpl.class);
             if (HandleInfoVO != null) 	QueryAssCriteria.getHandleCriteria( HandleInfoVO, criteria);	  
           //条数
             int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
                     .uniqueResult())  
                     .intValue();//取得符合条件的总数  
       
		      criteria.setProjection(null);  
		      HandleInfo or=new com.logistics.entity.orga.HandleInfoImpl();
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
     * @see com.logistics.entity.orga.HandleInfoDao#toHandleInfoVO(com.logistics.entity.orga.HandleInfo, com.logistics.entity.orga.HandleInfoVO)
     */
    public void toHandleInfoVO(
        com.logistics.entity.orga.HandleInfo source,
        com.logistics.entity.orga.HandleInfoVO target)
    {
        // @todo verify behavior of toHandleInfoVO
        super.toHandleInfoVO(source, target);
    }


    /**
     * @see com.logistics.entity.orga.HandleInfoDao#toHandleInfoVO(com.logistics.entity.orga.HandleInfo)
     */
    public com.logistics.entity.orga.HandleInfoVO toHandleInfoVO(final com.logistics.entity.orga.HandleInfo entity)
    {
        // @todo verify behavior of toHandleInfoVO
        return super.toHandleInfoVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.orga.HandleInfo loadHandleInfoFromHandleInfoVO(com.logistics.entity.orga.HandleInfoVO handleInfoVO)
    {
        // @todo implement loadHandleInfoFromHandleInfoVO
        //throw new java.lang.UnsupportedOperationException("com.logistics.entity.orga.loadHandleInfoFromHandleInfoVO(com.logistics.entity.orga.HandleInfoVO) not yet implemented.");

        /* A typical implementation looks like this:*/
        com.logistics.entity.orga.HandleInfo handleInfo = this.load(handleInfoVO.getId());
        if (handleInfo == null)
        {
            handleInfo = com.logistics.entity.orga.HandleInfo.Factory.newInstance();
        }
        return handleInfo;
        
    }

    
    /**
     * @see com.logistics.entity.orga.HandleInfoDao#handleInfoVOToEntity(com.logistics.entity.orga.HandleInfoVO)
     */
    public com.logistics.entity.orga.HandleInfo handleInfoVOToEntity(com.logistics.entity.orga.HandleInfoVO handleInfoVO)
    {
        // @todo verify behavior of handleInfoVOToEntity
        com.logistics.entity.orga.HandleInfo entity = this.loadHandleInfoFromHandleInfoVO(handleInfoVO);
        this.handleInfoVOToEntity(handleInfoVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.orga.HandleInfoDao#handleInfoVOToEntity(com.logistics.entity.orga.HandleInfoVO, com.logistics.entity.orga.HandleInfo)
     */
    public void handleInfoVOToEntity(
        com.logistics.entity.orga.HandleInfoVO source,
        com.logistics.entity.orga.HandleInfo target,
        boolean copyIfNull)
    {
        // @todo verify behavior of handleInfoVOToEntity
        super.handleInfoVOToEntity(source, target, copyIfNull);
    }
    
    protected java.lang.String  handleGetMaxSno(java.lang.String parentSno) throws Exception {
    	final Session session = getSession(false);
    	Query sqlQuery = session.createSQLQuery("select max(handle_Sno) from handle_info where handle_Sno like ?");
    	if(parentSno==null)parentSno="";
    	sqlQuery.setString(0,parentSno+"___");
        List li=sqlQuery.list();
        String sOrgaSno="000";
        String	maxOrgaSno=(String)li.get(0);
        if(maxOrgaSno!=null){
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