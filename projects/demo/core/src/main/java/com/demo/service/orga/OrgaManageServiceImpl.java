package com.demo.service.orga;

import com.demo.entity.orga.Orga;
import com.demo.entity.orga.OrgaDao;
import com.demo.entity.orga.OrgaVO;
import java.util.Collection;

public class OrgaManageServiceImpl extends OrgaManageServiceBase
{
  protected long handleCreateOrga(OrgaVO Orga)
    throws Exception
  {
    return getOrgaDao().create(getOrgaDao().orgaVOToEntity(Orga)).getId().longValue();
  }

  protected void handleUpdateOrga(OrgaVO Orga)
    throws Exception
  {
    Orga entity = getOrgaDao().load(Long.valueOf(Orga.getId()));
    getOrgaDao().orgaVOToEntity(Orga, entity, false);
    getOrgaDao().update(entity);
  }

  protected void handleDeleteOrga(long id)
    throws Exception
  {
    getOrgaDao().remove(Long.valueOf(id));
  }

  protected OrgaVO[] handleGetOrga(OrgaVO Orga, int pageNumber, int pageSize, String orderBy)
    throws Exception
  {
    OrgaDao infoDao = getOrgaDao();
    Collection infos = infoDao.getOrga(Orga, pageNumber, pageSize, orderBy);
    return infoDao.toOrgaVOArray(infos);
  }
}