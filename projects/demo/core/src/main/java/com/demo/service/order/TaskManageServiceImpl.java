// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.demo.service.order;
			import com.demo.entity.order.Task;
		import com.demo.entity.order.TaskDao;
		import com.demo.entity.order.TaskVO;
				
import java.util.Collection;
import java.util.Random;
import java.util.List;

/**
 * @see com.demo.service.order.TaskManageService
 */
public class TaskManageServiceImpl
    extends com.demo.service.order.TaskManageServiceBase
{

    /**
     * @see com.demo.service.order.TaskManageService#createTask(com.demo.entity.order.TaskVO)
     */
    protected long handleCreateTask(com.demo.entity.order.TaskVO Task)
		throws java.lang.Exception
    {
        // @todo implement public long createTask(com.demo.entity.order.TaskVO Task) createTask
			return this.getTaskDao().create(this.getTaskDao().taskVOToEntity(Task)).getId();
	    }
	
    /**
     * @see com.demo.service.order.TaskManageService#updateTask(com.demo.entity.order.TaskVO)
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
     * @see com.demo.service.order.TaskManageService#deleteTask(long)
     */
    protected void handleDeleteTask(long id)
		throws java.lang.Exception
    {
        // @todo implement public void deleteTask(long id) deleteTask
			this.getTaskDao().remove(id);
	    }
	
    /**
     * @see com.demo.service.order.TaskManageService#getTask(com.demo.entity.order.TaskVO, int, int, java.lang.String)
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
