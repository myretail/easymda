package com.demo.service.basic;

import com.demo.entity.basic.Enumeration;
import com.demo.entity.basic.EnumerationDao;
import com.demo.entity.basic.EnumerationVO;
import java.util.Collection;

public class BasicManageServiceImpl extends BasicManageServiceBase
{
  protected long handleCreateEnumeration(EnumerationVO Enumeration)
    throws Exception
  {
    return getEnumerationDao().create(getEnumerationDao().enumerationVOToEntity(Enumeration)).getId().longValue();
  }

  protected void handleUpdateEnumeration(EnumerationVO Enumeration)
    throws Exception
  {
    Enumeration entity = getEnumerationDao().load(Long.valueOf(Enumeration.getId()));
    getEnumerationDao().enumerationVOToEntity(Enumeration, entity, false);
    getEnumerationDao().update(entity);
  }

  protected void handleDeleteEnumeration(long id)
    throws Exception
  {
    getEnumerationDao().remove(Long.valueOf(id));
  }

  protected EnumerationVO[] handleGetEnumeration(EnumerationVO Enumeration, int pageNumber, int pageSize, String orderBy)
    throws Exception
  {
    EnumerationDao infoDao = getEnumerationDao();
    Collection infos = infoDao.getEnumeration(Enumeration, pageNumber, pageSize, orderBy);
    return infoDao.toEnumerationVOArray(infos);
  }

  protected EnumerationVO[] handleGetEnumerationByType(String eType)
    throws Exception
  {
    EnumerationDao enuDao = getEnumerationDao();
    Collection EnumerationVOs = enuDao.getEnumerationByType(eType);
    enuDao.toEnumerationVOCollection(EnumerationVOs);
    return ((EnumerationVO[])(EnumerationVO[])EnumerationVOs.toArray(new EnumerationVO[0]));
  }
}