// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.entity.order;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.Iterator;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.Projections;
import java.math.BigInteger;
import com.logistics.entity.basic.DateTimeQuery;
import com.logistics.util.ProjectUtil;
import com.logistics.util.QueryAssCriteriaOrder;

/**
 * @see com.logistics.entity.order.WlTask
 */
public class WlTaskDaoImpl
    extends com.logistics.entity.order.WlTaskDaoBase
{
    /**
     * @see com.logistics.entity.order.WlTaskDao#getWlTask(com.logistics.entity.order.WlTaskVO, int, int, java.lang.String)
     */
    protected java.util.List handleGetWlTask(com.logistics.entity.order.WlTaskVO WlTaskVO, int pageNumber, int pageSize, java.lang.String orderBy)
    {
    	  final Session session = getSession(false);

          try
          {
              final Criteria criteria = session.createCriteria(com.logistics.entity.order.WlTaskImpl.class);
              if (WlTaskVO != null) QueryAssCriteriaOrder.getTaskCriteria(WlTaskVO,criteria);
        	  
              /*System.out.println("WlTaskVO.getCreateTime()==="+WlTaskVO.getCreateTime());
              if (!"%".equals(WlTaskVO.getCreateTime())&&WlTaskVO.getCreateTime()!=null){
              	if (WlTaskVO.getCreateTime()=="null"){
                    	criteria.add(Expression.eq("createTime", null));
                  }else  if (WlTaskVO.getCreateTime().indexOf("to")==-1){
                      criteria.add(Expression.eq("createTime", ProjectUtil.getDate(WlTaskVO.getCreateTime())));//,"yyyy-MM-dd HH:mm:ss.SSS"
                  }else if(WlTaskVO.getCreateTime().indexOf("to")!=WlTaskVO.getCreateTime().length()-2){
                  	String startDate  = WlTaskVO.getCreateTime().substring(0,WlTaskVO.getCreateTime().indexOf("to"));
                  	String endDate  = WlTaskVO.getCreateTime().substring(WlTaskVO.getCreateTime().indexOf("to")+2,WlTaskVO.getCreateTime().length());
                  	if(startDate!="")criteria.add(Expression.ge("createTime", ProjectUtil.getDate(startDate)));
                  	if(endDate!="")criteria.add(Expression.le("createTime", ProjectUtil.getDate(endDate)));
                  }
              }
              if (WlTaskVO.getId() != 0)
              criteria.add(Expression.eq("id", WlTaskVO.getId()));
              if (!"%".equals(WlTaskVO.getTaskRow())&&WlTaskVO.getTaskRow() != null && WlTaskVO.getTaskRow().length > 0) criteria.createCriteria("taskRow").add(Expression.in("id", WlTaskVO.getTaskRow()));
              if (!"%".equals(WlTaskVO.getManager())&&WlTaskVO.getManager() != null&&WlTaskVO.getManager().getId()!=0) {
            	  System.out.println("WlTaskVO.getManager()==="+WlTaskVO.getManager().getId());
            	  criteria.createCriteria("manager").add(Expression.eq("id", WlTaskVO.getManager().getId()));
              }
              System.out.println("WlTaskVO.getManager()=============="+WlTaskVO.getManager());*/
        	  
        	  
              //条数
              int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
                      .uniqueResult())  
                      .intValue();//取得符合条件的总数  
        
		      criteria.setProjection(null);  
		     WlTask or=new com.logistics.entity.order.WlTaskImpl();
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
     * @see com.logistics.entity.order.WlTaskDao#toWlTaskVO(com.logistics.entity.order.WlTask, com.logistics.entity.order.WlTaskVO)
     */
    public void toWlTaskVO(
        com.logistics.entity.order.WlTask source,
        com.logistics.entity.order.WlTaskVO target)
    {
        // @todo verify behavior of toWlTaskVO
        super.toWlTaskVO(source, target);
        // WARNING! No conversion for target.createTime (can't convert source.getCreateTime():java.util.Date to java.lang.String
        //target.setCreateTime(ProjectUtil.getFullDateStr(source.getCreateTime()));
        DateTimeQuery tempday=new DateTimeQuery();
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getCreateTime()));
    	target.setCreateTime(tempday);
    	System.out.println("toWlTaskVO,getCreateTime,,,,,,,,,,,,,,,,,,,,,"+target.getCreateTime().getUpDate());
        // WARNING! No conversion for target.manager (can't convert source.getManager():com.logistics.entity.orga.People to com.logistics.entity.orga.PeopleVO
        target.setManager(source.getManager() == null ? null :this.getPeopleDao().toPeopleVO(source.getManager()));
        // WARNING! No conversion for target.taskRow (can't convert source.getTaskRow():com.logistics.entity.order.WlTaskRow to com.logistics.entity.order.WlTaskRowVO[]
        System.out.println("source.getTaskRow()===ddddddddddd=="+source.getTaskRow());
        if(target.getTaskRowId()!=0){
        	//target.setTaskRowId(source.getTaskRow() == null ? 0 :this.getWlTaskRowDao().toWlTaskRowVOArray(source.getTaskRow()));
        }else{
        	target.setTaskRow(source.getTaskRow() == null ? null :this.getWlTaskRowDao().toWlTaskRowVOArray(source.getTaskRow()));
            
        }
        /*if(source.getTaskRow() == null ){
        	target.setTaskRow(null);
        }else{
        	WlTaskRowVO[] tvo=new WlTaskRowVO[source.getTaskRow().size()];
        	int t=0;
        	java.util.Iterator iterator = source.getTaskRow().iterator();
        	while ( iterator.hasNext())
            {   
                tvo[t]=this.getWlTaskRowDao().toWlTaskRowVO((com.logistics.entity.order.WlTaskRow)iterator.next());
                t++;
            }
        	target.setTaskRow(tvo);
        }*/
        //No conversion for target.sendTime (can't convert source.getSendTime():java.util.Date to java.lang.String)
        //target.setSendTime(ProjectUtil.getFullDateStr(source.getSendTime()));
        tempday=new DateTimeQuery();
        tempday.setUpDate(ProjectUtil.getFullDateStr(source.getSendTime()));
        target.setSendTime(tempday);
        System.out.println("toWlTaskVO,SendTime,,,,,,,,,,,,,,,,,,,,,"+target.getSendTime().getUpDate());
    	
        // No conversion for target.overTime (can't convert source.getOverTime():java.util.Date to java.lang.String)
        //target.setOverTime(ProjectUtil.getFullDateStr(source.getOverTime()));
    	tempday=new DateTimeQuery();
        tempday.setUpDate(ProjectUtil.getFullDateStr(source.getOverTime()));
        target.setOverTime(tempday);
        System.out.println("toWlTaskVO,,OverTime,,,,,,,,,,,,,,,,,,,,"+target.getOverTime().getUpDate());
    	
    }


    /**
     * @see com.logistics.entity.order.WlTaskDao#toWlTaskVO(com.logistics.entity.order.WlTask)
     */
    public com.logistics.entity.order.WlTaskVO toWlTaskVO(final com.logistics.entity.order.WlTask entity)
    {
        // @todo verify behavior of toWlTaskVO
        return super.toWlTaskVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.order.WlTask loadWlTaskFromWlTaskVO(com.logistics.entity.order.WlTaskVO wlTaskVO)
    {
        // @todo implement loadWlTaskFromWlTaskVO
        //throw new java.lang.UnsupportedOperationException("com.logistics.entity.order.loadWlTaskFromWlTaskVO(com.logistics.entity.order.WlTaskVO) not yet implemented.");

        /* A typical implementation looks like this:*/
    	System.out.println("wlTaskVO.getId()==="+wlTaskVO.getId());
        com.logistics.entity.order.WlTask wlTask = this.load(wlTaskVO.getId());
        System.out.println("wlTask==="+wlTask);
        if (wlTask == null)
        {
            wlTask = com.logistics.entity.order.WlTask.Factory.newInstance();
        }
        return wlTask;
        
    }

    
    /**
     * @see com.logistics.entity.order.WlTaskDao#wlTaskVOToEntity(com.logistics.entity.order.WlTaskVO)
     */
    public com.logistics.entity.order.WlTask wlTaskVOToEntity(com.logistics.entity.order.WlTaskVO wlTaskVO)
    {
        // @todo verify behavior of wlTaskVOToEntity
        com.logistics.entity.order.WlTask entity = this.loadWlTaskFromWlTaskVO(wlTaskVO);
        this.wlTaskVOToEntity(wlTaskVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.order.WlTaskDao#wlTaskVOToEntity(com.logistics.entity.order.WlTaskVO, com.logistics.entity.order.WlTask)
     */
    public void wlTaskVOToEntity(
        com.logistics.entity.order.WlTaskVO source,
        com.logistics.entity.order.WlTask target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wlTaskVOToEntity
        super.wlTaskVOToEntity(source, target, copyIfNull);
        // No conversion for target.createTime (can't convert source.getCreateTime():java.lang.String to java.util.Date
        if(source.getManager()!=null)target.setManager(this.getPeopleDao().load(source.getManager().getId()));
        //System.out.println("getCreateTime==="+source.getCreateTime());
        if(source.getCreateTime()!=null)target.setCreateTime(ProjectUtil.getDate(source.getCreateTime().getUpDate()));
        //System.out.println("getCreateTime===ddddddddddd"+ProjectUtil.getDate(source.getCreateTime()));
        if(source.getOverTime()!=null)target.setOverTime(ProjectUtil.getDate(source.getOverTime().getUpDate()));
        if(source.getSendTime()!=null)target.setSendTime(ProjectUtil.getDate(source.getSendTime().getUpDate()));
        
    }

	@Override
	protected List handleGetSimilarWlTaskByOrderPathIDs(List orderPathIDs,int pageNumber, int pageSize, String orderBy)throws Exception {
		final Session session = getSession(false);
		try
        {
			//final Criteria criteria = session.createCriteria(com.logistics.entity.order.WlTaskImpl.class);//
			//final Criteria criteriaTaskRow =criteria.createCriteria("taskRow");//
			String sqls="SELECT  count(distinct  wl_task_row.path_fk) ,wl_task.id from wl_task_row inner join wl_task  on wl_task_row.task_fk=wl_task.id where 1=1 ";
			//String sqls="";
			for(int i=0; i<orderPathIDs.size();i++){
				if(sqls.equals("")){
					sqls=sqls+" exists (select WL_TASK_ROW.id from WL_TASK_ROW  where WL_TASK_ROW.path_fk="+orderPathIDs.get(i)+" and WL_TASK.ID=WL_TASK_ROW.task_fk)";
				}else{
				sqls=sqls+"and exists (select WL_TASK_ROW.id from WL_TASK_ROW  where WL_TASK_ROW.path_fk="+orderPathIDs.get(i)+" and WL_TASK.ID=WL_TASK_ROW.task_fk)";
				}
			}
			sqls=sqls+" group by  WL_TASK.id  having count(distinct  WL_TASK_ROW.path_fk)="+orderPathIDs.size();
			//criteriaTaskRow.add(Expression.sql(sqls));//
			System.out.println("sqls sqls sqls=="+sqls);
			Query sqlQuery = session.createSQLQuery(sqls);
			sqlQuery.setFirstResult(this.calculateFirstResult(pageNumber, pageSize));
			sqlQuery.setMaxResults(pageSize);
			if (pageNumber > 0 && pageSize > 0)
            {
				sqlQuery.setFirstResult(this.calculateFirstResult(pageNumber, pageSize));
				sqlQuery.setMaxResults(pageSize);
            }else{
            	sqlQuery.setMaxResults(100);
            }	
			List re=sqlQuery.list();
			List reTask=new ArrayList();
			System.out.println("re.size()"+re.size());
			for(int j=0;j<re.size();j++){
				System.out.println("(Object[])re.get(j))==0:"+((Object[])re.get(j))[0]+"  1:"+((Object[])re.get(j))[1]);
				reTask.add(this.toWlTaskVO(this.load(((BigInteger)((Object[])re.get(j))[1]).longValue())));
			}
			return reTask;
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }		
        
		
	}

	protected void handleSendTask(String[] ids) throws Exception {
		for(int i=0;i<ids.length;i++){
			Set taskRowSet=(Set)this.load(Long.valueOf(ids[i])).getTaskRow();
			Iterator it=taskRowSet.iterator();
			while(it.hasNext()){
				WlTaskRow taskRow=(WlTaskRow)it.next();
				taskRow.setStatus("1");//已下发
				this.getWlTaskRowDao().update(taskRow);
			}
			
		}
	}

	protected List handleGetTaskVOByOrderIDs(List orderID) throws Exception {
		final Session session = getSession(false);
		try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.order.WlTaskImpl.class);
            criteria.createCriteria("taskRow").createCriteria("trwithor").createCriteria("orderRow").createCriteria("order").add(Expression.in("id",orderID));
            
            return criteria.list();
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
	}

	protected List handleGetRelTaskByVoitureIDs(List voitureID)	throws Exception {
		final Session session = getSession(false);
		try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.order.WlTaskImpl.class);
            criteria.createCriteria("taskRow").createCriteria("voiture").add(Expression.in("id",voitureID));
            
            return criteria.list();
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
	}

	

}