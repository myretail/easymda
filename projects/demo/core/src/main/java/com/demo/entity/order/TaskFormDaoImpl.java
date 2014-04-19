// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */

package com.demo.entity.order;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;

import com.demo.entity.basic.DateTimeQuery;
import com.demo.util.ProjectUtil;
import com.demo.util.QueryAssCriteria;
/**
 * @see com.demo.entity.order.TaskForm
 */
public class TaskFormDaoImpl
    extends com.demo.entity.order.TaskFormDaoBase
    
{
    /**
     * @see com.demo.entity.order.TaskFormDao#getTaskForm(com.demo.entity.order.TaskFormVO, int, int, java.lang.String)
     */
    protected java.util.List handleGetTaskForm(com.demo.entity.order.TaskFormVO TaskForm, int pageNumber, int pageSize, java.lang.String orderBy)
    {
        // @todo implement public java.util.List handleGetTaskForm(com.demo.entity.order.TaskFormVO TaskForm, int pageNumber, int pageSize, java.lang.String orderBy)
        final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.order.TaskFormImpl.class);
            if (TaskForm != null) QueryAssCriteria.getTaskFormCriteria(TaskForm,criteria);
            
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount()).uniqueResult()).intValue();
      
		      criteria.setProjection(null);  
		      TaskForm or=new com.demo.entity.order.TaskFormImpl();
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

    /**
     * @see com.demo.entity.order.TaskFormDao#deleteTaskForm(long)
     */
    protected void handleDeleteTaskForm(long id)
    {
        // @todo implement public void handleDeleteTaskForm(long id)
        /*final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.order.TaskFormImpl.class);
            if (TaskForm != null) QueryAssCriteria.getTaskFormCriteria(TaskForm,criteria);
            
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount()).uniqueResult()).intValue();
      
		      criteria.setProjection(null);  
		      TaskForm or=new com.demo.entity.order.TaskFormImpl();
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
*/
        

}

//end foreach
    /**
     * @see com.demo.entity.order.TaskFormDao#toTaskFormVO(com.demo.entity.order.TaskForm, com.demo.entity.order.TaskFormVO)
     */
    public void toTaskFormVO(
        com.demo.entity.order.TaskForm source,
        com.demo.entity.order.TaskFormVO target)
    {
        // @todo verify behavior of toTaskFormVO
        super.toTaskFormVO(source, target);
        // WARNING! No conversion for target.setDate (can't convert source.getSetDate():java.util.Date to com.demo.entity.basic.DateTimeQuery
			DateTimeQuery setDateday=new DateTimeQuery();
        setDateday.setUpDate(ProjectUtil.getFullDateStr(source.getSetDate()));
        target.setSetDate(setDateday);
	        // WARNING! No conversion for target.tasks (can't convert source.getTasks():com.demo.entity.order.Task to com.demo.entity.order.TaskVO[]
						target.setTasks(source.getTasks() == null ? null :this.getTaskDao().toTaskVOArray(source.getTasks()));
			        // WARNING! No conversion for target.car (can't convert source.getCar():com.demo.entity.order.car to com.demo.entity.order.carVO
						if(source.getCar()!=null)target.setCar(this.getCarDao().toCarVO(source.getCar()));

			    }


    /**
     * @see com.demo.entity.order.TaskFormDao#toTaskFormVO(com.demo.entity.order.TaskForm)
     */
    public com.demo.entity.order.TaskFormVO toTaskFormVO(final com.demo.entity.order.TaskForm entity)
    {
        // @todo verify behavior of toTaskFormVO
        return super.toTaskFormVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.demo.entity.order.TaskForm loadTaskFormFromTaskFormVO(com.demo.entity.order.TaskFormVO taskFormVO)
    {
        // @todo implement loadTaskFormFromTaskFormVO
        //throw new java.lang.UnsupportedOperationException("com.demo.entity.order.loadTaskFormFromTaskFormVO(com.demo.entity.order.TaskFormVO) not yet implemented.");

        /* A typical implementation looks like this:*/
        com.demo.entity.order.TaskForm taskForm = this.load(taskFormVO.getId());
        if (taskForm == null)
        {
            taskForm = com.demo.entity.order.TaskForm.Factory.newInstance();
        }
        return taskForm;
        
    }

    
    /**
     * @see com.demo.entity.order.TaskFormDao#taskFormVOToEntity(com.demo.entity.order.TaskFormVO)
     */
    public com.demo.entity.order.TaskForm taskFormVOToEntity(com.demo.entity.order.TaskFormVO taskFormVO)
    {
        // @todo verify behavior of taskFormVOToEntity
        com.demo.entity.order.TaskForm entity = this.loadTaskFormFromTaskFormVO(taskFormVO);
        this.taskFormVOToEntity(taskFormVO, entity, true);
        return entity;
    }


    /**
     * @see com.demo.entity.order.TaskFormDao#taskFormVOToEntity(com.demo.entity.order.TaskFormVO, com.demo.entity.order.TaskForm)
     */
    public void taskFormVOToEntity(
        com.demo.entity.order.TaskFormVO source,
        com.demo.entity.order.TaskForm target,
        boolean copyIfNull)
    {
        // @todo verify behavior of taskFormVOToEntity
        super.taskFormVOToEntity(source, target, copyIfNull);
        // No conversion for target.setDate (can't convert source.getSetDate():com.demo.entity.basic.DateTimeQuery to java.util.Date
			if(source.getSetDate()!=null)target.setSetDate(ProjectUtil.getDate(source.getSetDate().getUpDate()));
	        // No conversion for target.tasks (can't convert source.getTasks():com.demo.entity.order.TaskVO[] to com.demo.entity.order.Task
						//if(source.getTasks()!=null)target.setTasks(this.getTaskDao().load(source.getTasks().getId()));
			        // No conversion for target.car (can't convert source.getCar():com.demo.entity.order.carVO to com.demo.entity.order.car
						if(source.getCar()!=null)target.setCar(this.getCarDao().load(source.getCar().getId()));
			    }

}