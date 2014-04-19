package com.demo.service.order;

import com.demo.entity.order.OrderRowTask;
import com.demo.entity.order.OrderRowTaskDao;
import com.demo.entity.order.OrderRowTaskVO;
import com.demo.entity.order.OrderRowdDao;
import com.demo.entity.order.OrderRowdVO;
import com.demo.entity.order.TaskDao;
import com.demo.entity.order.TaskVO;
import com.demo.entity.order.TaskFormVO;
import com.demo.entity.order.TaskFormDao;
import com.demo.entity.order.TaskFormDaoImpl;
import java.io.PrintStream;
import java.util.Collection;
import java.util.List;

public class OrderRowTaskManageServiceImpl extends OrderRowTaskManageServiceBase
{
  protected long handleCreateOrderRowTask(OrderRowTaskVO OrderRowTask)
    throws Exception
  {
    return getOrderRowTaskDao().create(getOrderRowTaskDao().orderRowTaskVOToEntity(OrderRowTask)).getId().longValue();
  }

  protected void handleUpdateOrderRowTask(OrderRowTaskVO OrderRowTask)
    throws Exception
  {
    OrderRowTask entity = getOrderRowTaskDao().load(Long.valueOf(OrderRowTask.getId()));
    getOrderRowTaskDao().orderRowTaskVOToEntity(OrderRowTask, entity, false);
    getOrderRowTaskDao().update(entity);
  }

  protected void handleDeleteOrderRowTask(long id)
    throws Exception
  {
    getOrderRowTaskDao().remove(Long.valueOf(id));
  }

  protected OrderRowTaskVO[] handleGetOrderRowTask(OrderRowTaskVO OrderRowTask, int pageNumber, int pageSize, String orderBy)
    throws Exception
  {
    OrderRowTaskDao infoDao = getOrderRowTaskDao();
    Collection infos = infoDao.getOrderRowTask(OrderRowTask, pageNumber, pageSize, orderBy);
    return infoDao.toOrderRowTaskVOArray(infos);
  }

  protected OrderRowdVO[] handleGetOrderRowdByTaskId(long TaskId)
    throws Exception
  {
    OrderRowdVO orderRowdVO = new OrderRowdVO();
    List allorList = getOrderRowdDao().getOrderRowd(orderRowdVO, 0, 0, "0");
    OrderRowdVO[] allor = getOrderRowdDao().toOrderRowdVOArray(allorList);
    OrderRowTaskVO peor = new OrderRowTaskVO();
    TaskVO ovo = new TaskVO();
    ovo.setId(TaskId);
    peor.setTask(ovo);
    OrderRowTaskVO[] orgaPeos = getOrderRowTask(peor, 0, 0, "0");
    for (int i = 0; i < orgaPeos.length - 1; ++i) {
      System.out.println("i:" + i);
      for (int j = 0; j < allor.length - 1; ++j) {
        System.out.println("j:" + j);
        if (orgaPeos[i].getOrderRow().getId() == allor[j].getId()) {
          allor[j].setSelected(String.valueOf(orgaPeos[i].getId()));
          break;
        }
      }
    }
    return allor;
  }

  protected TaskVO[] handleGetTaskByOrderRowdId(long OrderRowdId)
    throws Exception
  {
    TaskVO TaskVO = new TaskVO();
    List allorList = getTaskDao().getTask(TaskVO, 0, 0, "0");
    TaskVO[] allor = getTaskDao().toTaskVOArray(allorList);
    OrderRowTaskVO peor = new OrderRowTaskVO();
    OrderRowdVO ovo = new OrderRowdVO();/**/
    ovo.setId(OrderRowdId);/**/
    peor.setOrderRow(ovo);/**/
    OrderRowTaskVO[] orgaPeos = getOrderRowTask(peor, 0, 0, "0");
    for (int i = 0; i < orgaPeos.length - 1; ++i) {
      System.out.println("i:" + i+":"+orgaPeos[i].getTask().getId());
	  System.out.println("i:" + i+"::::OrderRowTaskVOid::::"+orgaPeos[i].getId());
      for (int j = 0; j < allor.length - 1; ++j) {
        System.out.println("j:" + j+":"+allor[j].getId());
		//System.out.println("j:" + j+"::::OrderRowTaskVOid::::"+allor[j].getId());
        if (orgaPeos[i].getTask().getId() == allor[j].getId()) {
          allor[j].setSelected(String.valueOf(orgaPeos[i].getId()));
         // break;
        }
      }
    }
    return allor;
  }
  /**/
  protected TaskFormVO[] handleGetTaskFormByOrderRowdId(long OrderRowdId)
    throws Exception
  {
    TaskFormVO taskFormVO = new TaskFormVO();
	//com.demo.entity.order.TaskFormDao taskFormDao = new TaskFormDaoImpl();
    List allorList = getTaskFormDao().getTaskForm(taskFormVO, 0, 0, "0");
    TaskFormVO[] allor = getTaskFormDao().toTaskFormVOArray(allorList);
    OrderRowTaskVO peor = new OrderRowTaskVO();
    OrderRowdVO ovo = new OrderRowdVO();/**/
    ovo.setId(OrderRowdId);/**/
    peor.setOrderRow(ovo);/**/
    OrderRowTaskVO[] orderRowTask = getOrderRowTask(peor, 0, 0, "0");
    for (int i = 0; i < orderRowTask.length - 1; ++i) {
      System.out.println("i:" + i+":"+orderRowTask[i].getTask().getId());
	  System.out.println("i:" + i+"::::OrderRowTaskVOid::::"+orderRowTask[i].getId());
	  for (int j = 0; j < allor.length - 1; ++j) {
	  System.out.println("j:" + j);
		  TaskFormVO allorFormVO = allor[j];
		  com.demo.entity.order.TaskVO[] allorArray = allorFormVO.getTasks();
		  for (int jj = 0; jj < allorArray.length ; ++jj) {
			System.out.println("jj:" + jj+":"+allorArray[jj].getId());
			//System.out.println("j:" + j+"::::OrderRowTaskVOid::::"+allorArray[jj].getId());
			if (orderRowTask[i].getTask().getId() == allorArray[jj].getId()) {
			  allorArray[jj].setSelected(String.valueOf(orderRowTask[i].getId()));
			 // break;
			}
		  }
	  }
    }
    return allor;
  }
}