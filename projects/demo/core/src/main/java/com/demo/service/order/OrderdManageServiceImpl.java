package com.demo.service.order;

import com.demo.entity.order.OrderRowd;
import com.demo.entity.order.OrderRowdDao;
import com.demo.entity.order.OrderRowdVO;
import com.demo.entity.order.Orderd;
import com.demo.entity.order.OrderdDao;
import com.demo.entity.order.OrderdVO;
import java.util.Collection;

public class OrderdManageServiceImpl extends OrderdManageServiceBase
{
  protected long handleCreateOrderd(OrderdVO Orderd)
    throws Exception
  {
    return getOrderdDao().create(getOrderdDao().orderdVOToEntity(Orderd)).getId().longValue();
  }

  protected void handleUpdateOrderd(OrderdVO Orderd)
    throws Exception
  {
    Orderd entity = getOrderdDao().load(Long.valueOf(Orderd.getId()));
    getOrderdDao().orderdVOToEntity(Orderd, entity, false);
    getOrderdDao().update(entity);
  }

  protected void handleDeleteOrderd(long id)
    throws Exception
  {
    getOrderdDao().deleteOrderd(id);
  }

  protected OrderdVO[] handleGetOrderd(OrderdVO orderdvo, int pageNumber, int pageSize, String orderBy)
    throws Exception
  {
    OrderdDao infoDao = getOrderdDao();
    Collection infos = infoDao.getOrderd(orderdvo, pageNumber, pageSize, orderBy);
    return infoDao.toOrderdVOArray(infos);
  }

  protected long handleCreateOrderRowd(OrderRowdVO OrderRowd)
    throws Exception
  {
    return getOrderRowdDao().create(getOrderRowdDao().orderRowdVOToEntity(OrderRowd)).getId().longValue();
  }

  protected void handleUpdateOrderRowd(OrderRowdVO OrderRowd)
    throws Exception
  {
    OrderRowd entity = getOrderRowdDao().load(Long.valueOf(OrderRowd.getId()));
    getOrderRowdDao().orderRowdVOToEntity(OrderRowd, entity, false);
    getOrderRowdDao().update(entity);
  }

  protected void handleDeleteOrderRowd(long id)
    throws Exception
  {
    getOrderRowdDao().remove(Long.valueOf(id));
  }

  protected OrderRowdVO[] handleGetOrderRowd(OrderRowdVO OrderRowd, int pageNumber, int pageSize, String orderBy)
    throws Exception
  {
    OrderRowdDao infoDao = getOrderRowdDao();
    Collection infos = infoDao.getOrderRowd(OrderRowd, pageNumber, pageSize, orderBy);
    return infoDao.toOrderRowdVOArray(infos);
  }
}