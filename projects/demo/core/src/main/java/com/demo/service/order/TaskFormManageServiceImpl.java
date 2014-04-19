// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.demo.service.order;
			import com.demo.entity.order.TaskForm;
		import com.demo.entity.order.TaskFormDao;
		import com.demo.entity.order.TaskFormVO;
							import com.demo.entity.order.Task;
		import com.demo.entity.order.TaskDao;
		import com.demo.entity.order.TaskVO;
				
import java.util.Collection;
import java.util.Random;
import java.util.List;

/**
 * @see com.demo.service.order.TaskFormManageService
 */
public class TaskFormManageServiceImpl
    extends com.demo.service.order.TaskFormManageServiceBase
{

    /**
     * @see com.demo.service.order.TaskFormManageService#createTaskForm(com.demo.entity.order.TaskFormVO)
     */
    protected long handleCreateTaskForm(com.demo.entity.order.TaskFormVO TaskForm)
		throws java.lang.Exception
    {
        // @todo implement public long createTaskForm(com.demo.entity.order.TaskFormVO TaskForm) createTaskForm
			return this.getTaskFormDao().create(this.getTaskFormDao().taskFormVOToEntity(TaskForm)).getId();
	    }
	
    /**
     * @see com.demo.service.order.TaskFormManageService#updateTaskForm(com.demo.entity.order.TaskFormVO)
     */
    protected void handleUpdateTaskForm(com.demo.entity.order.TaskFormVO TaskForm)
		throws java.lang.Exception
    {
        // @todo implement public void updateTaskForm(com.demo.entity.order.TaskFormVO TaskForm) updateTaskForm
			TaskForm entity =this.getTaskFormDao().load(TaskForm.getId());
    	this.getTaskFormDao().taskFormVOToEntity(TaskForm, entity, false);
    	this.getTaskFormDao().update(entity);
		
	    }
	
    /**
     * @see com.demo.service.order.TaskFormManageService#deleteTaskForm(long)
     */
    protected void handleDeleteTaskForm(long id)
		throws java.lang.Exception
    {
        // @todo implement public void deleteTaskForm(long id) deleteTaskForm
			this.getTaskFormDao().remove(id);
	    }
	
    /**
     * @see com.demo.service.order.TaskFormManageService#getTaskForm(com.demo.entity.order.TaskFormVO, int, int, java.lang.String)
     */
    protected com.demo.entity.order.TaskFormVO[] handleGetTaskForm(com.demo.entity.order.TaskFormVO TaskForm, int pageNumber, int pageSize, java.lang.String orderBy)
		throws java.lang.Exception
    {
        // @todo implement public com.demo.entity.order.TaskFormVO[] getTaskForm(com.demo.entity.order.TaskFormVO TaskForm, int pageNumber, int pageSize, java.lang.String orderBy) getTaskForm
			TaskFormDao infoDao=this.getTaskFormDao();
	 	Collection infos = infoDao.getTaskForm(TaskForm, pageNumber, pageSize, orderBy);
	 	return infoDao.toTaskFormVOArray(infos);
	    }
	
    /**
     * @see com.demo.service.order.TaskFormManageService#createTask(com.demo.entity.order.TaskVO)
     */
    protected long handleCreateTask(com.demo.entity.order.TaskVO Task)
		throws java.lang.Exception
    {
        // @todo implement public long createTask(com.demo.entity.order.TaskVO Task) createTask
			return this.getTaskDao().create(this.getTaskDao().taskVOToEntity(Task)).getId();
	    }
	
    /**
     * @see com.demo.service.order.TaskFormManageService#updateTask(com.demo.entity.order.TaskVO)
     */
    protected void handleUpdateTask(com.demo.entity.order.TaskVO Task)
		throws java.lang.Exception
    {
        // @todo implement public void updateTask(com.demo.entity.order.TaskVO Task) updateTask
			Task entity =this.getTaskDao().load(Task.getId());
    	this.getTaskDao().taskVOToEntity(Task, entity, false);
    	this.getTaskDao().update(entity);
		
	    }
	
    /**
     * @see com.demo.service.order.TaskFormManageService#deleteTask(long)
     */
    protected void handleDeleteTask(long id)
		throws java.lang.Exception
    {
        // @todo implement public void deleteTask(long id) deleteTask
			this.getTaskDao().remove(id);
	    }
	
    /**
     * @see com.demo.service.order.TaskFormManageService#getTask(com.demo.entity.order.TaskVO, int, int, java.lang.String)
     */
    protected com.demo.entity.order.TaskVO[] handleGetTask(com.demo.entity.order.TaskVO Task, int pageNumber, int pageSize, java.lang.String orderBy)
		throws java.lang.Exception
    {
        // @todo implement public com.demo.entity.order.TaskVO[] getTask(com.demo.entity.order.TaskVO Task, int pageNumber, int pageSize, java.lang.String orderBy) getTask
			TaskDao infoDao=this.getTaskDao();
	 	Collection infos = infoDao.getTask(Task, pageNumber, pageSize, orderBy);
	 	return infoDao.toTaskVOArray(infos);
	    }
	
}
