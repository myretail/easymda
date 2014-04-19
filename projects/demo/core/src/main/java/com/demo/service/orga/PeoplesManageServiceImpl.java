package com.demo.service.orga;

import com.demo.entity.orga.Peoples;
import com.demo.entity.orga.PeoplesDao;
import com.demo.entity.orga.PeoplesVO;
import java.util.Collection;

public class PeoplesManageServiceImpl extends PeoplesManageServiceBase
{
  protected long handleCreatePeoples(PeoplesVO Peoples)
    throws Exception
  {
    return getPeoplesDao().create(getPeoplesDao().peoplesVOToEntity(Peoples)).getId().longValue();
  }

  protected void handleUpdatePeoples(PeoplesVO Peoples)
    throws Exception
  {
    Peoples entity = getPeoplesDao().load(Long.valueOf(Peoples.getId()));
    getPeoplesDao().peoplesVOToEntity(Peoples, entity, false);
    getPeoplesDao().update(entity);
  }

  protected void handleDeletePeoples(long id)
    throws Exception
  {
    getPeoplesDao().remove(Long.valueOf(id));
  }

  protected PeoplesVO[] handleGetPeoples(PeoplesVO Peoples, int pageNumber, int pageSize, String orderBy)
    throws Exception
  {
    PeoplesDao infoDao = getPeoplesDao();
    Collection infos = infoDao.getPeoples(Peoples, pageNumber, pageSize, orderBy);
    return infoDao.toPeoplesVOArray(infos);
  }
}