// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */

package com.demo.entity.order;

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
 * @see com.demo.entity.order.Task
 */
public class TaskDaoImpl
    extends com.demo.entity.order.TaskDaoBase
{
    /**
     * @see com.demo.entity.order.TaskDao#getTask(com.demo.entity.order.TaskVO, int, int, java.lang.String)
     */
    protected java.util.List handleGetTask(com.demo.entity.order.TaskVO Task, int pageNumber, int pageSize, java.lang.String orderBy)
    {
        // @todo implement public java.util.List handleGetTask(com.demo.entity.order.TaskVO Task, int pageNumber, int pageSize, java.lang.String orderBy)
        final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.order.TaskImpl.class);
            if (Task != null) QueryAssCriteria.getTaskCriteria(Task,criteria);
            
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount()).uniqueResult()).intValue();
      
		      criteria.setProjection(null);  
		      Task or=new com.demo.entity.order.TaskImpl();
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
     * @see com.demo.entity.order.TaskDao#toTaskVO(com.demo.entity.order.Task, com.demo.entity.order.TaskVO)
     */
    public void toTaskVO(
        com.demo.entity.order.Task source,
        com.demo.entity.order.TaskVO target)
    {
        // @todo verify behavior of toTaskVO
        super.toTaskVO(source, target);
        // WARNING! No conversion for target.num (can't convert source.getNum():double to com.demo.entity.basic.NumberQuery
			NumberQuery numNum=new NumberQuery();
        numNum.setUpNumber(source.getNum());
        target.setNum(numNum);
		//{entityProp.type.name}	= double	
	        // WARNING! No conversion for target.volumne (can't convert source.getVolumne():double to com.demo.entity.basic.NumberQuery
			NumberQuery volumneNum=new NumberQuery();
        volumneNum.setUpNumber(source.getVolumne());
        target.setVolumne(volumneNum);
		//{entityProp.type.name}	= double
		/*com.demo.entity.order.Task sourceNoRow;
		if(source.getTaskForm() != null){
			sourceNoRow=source.getTaskForm();
			
		}
		target.setTaskForm(source.getTaskForm() == null ? null :this.getTaskFormDao().toTaskFormVO(source.getTaskForm()));*/
	    }


    /**
     * @see com.demo.entity.order.TaskDao#toTaskVO(com.demo.entity.order.Task)
     */
    public com.demo.entity.order.TaskVO toTaskVO(final com.demo.entity.order.Task entity)
    {
        // @todo verify behavior of toTaskVO
        return super.toTaskVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.demo.entity.order.Task loadTaskFromTaskVO(com.demo.entity.order.TaskVO taskVO)
    {
        // @todo implement loadTaskFromTaskVO
        //throw new java.lang.UnsupportedOperationException("com.demo.entity.order.loadTaskFromTaskVO(com.demo.entity.order.TaskVO) not yet implemented.");

        /* A typical implementation looks like this:*/
        com.demo.entity.order.Task task = this.load(taskVO.getId());
        if (task == null)
        {
            task = com.demo.entity.order.Task.Factory.newInstance();
        }
        return task;
        
    }

    
    /**
     * @see com.demo.entity.order.TaskDao#taskVOToEntity(com.demo.entity.order.TaskVO)
     */
    public com.demo.entity.order.Task taskVOToEntity(com.demo.entity.order.TaskVO taskVO)
    {
        // @todo verify behavior of taskVOToEntity
        com.demo.entity.order.Task entity = this.loadTaskFromTaskVO(taskVO);
        this.taskVOToEntity(taskVO, entity, true);
        return entity;
    }


    /**
     * @see com.demo.entity.order.TaskDao#taskVOToEntity(com.demo.entity.order.TaskVO, com.demo.entity.order.Task)
     */
    public void taskVOToEntity(
        com.demo.entity.order.TaskVO source,
        com.demo.entity.order.Task target,
        boolean copyIfNull)
    {
        // @todo verify behavior of taskVOToEntity
        super.taskVOToEntity(source, target, copyIfNull);
        // No conversion for target.num (can't convert source.getNum():com.demo.entity.basic.NumberQuery to double
			if(source.getNum()!=null)target.setNum(source.getNum().getUpNumber());	
	        // No conversion for target.volumne (can't convert source.getVolumne():com.demo.entity.basic.NumberQuery to double
			if(source.getVolumne()!=null)target.setVolumne(source.getVolumne().getUpNumber());	
			if(source.getTaskForm()!=null)target.setTaskForm(this.getTaskFormDao().load(source.getTaskForm().getId()));
	    }

}