package com.demo.service.orga;

import com.demo.entity.orga.OrgaDao;
import com.demo.entity.orga.OrgaPeoples;
import com.demo.entity.orga.OrgaPeoplesDao;
import com.demo.entity.orga.OrgaPeoplesVO;
import com.demo.entity.orga.OrgaVO;
import com.demo.entity.orga.PeoplesDao;
import com.demo.entity.orga.PeoplesVO;
import java.io.PrintStream;
import java.util.Collection;
import java.util.List;

public class OrgaPeoplesManageServiceImpl extends OrgaPeoplesManageServiceBase
{
  protected long handleCreateOrgaPeoples(OrgaPeoplesVO OrgaPeoples)
    throws Exception
  {
    return getOrgaPeoplesDao().create(getOrgaPeoplesDao().orgaPeoplesVOToEntity(OrgaPeoples)).getId().longValue();
  }

  protected void handleUpdateOrgaPeoples(OrgaPeoplesVO OrgaPeoples)
    throws Exception
  {
    OrgaPeoples entity = getOrgaPeoplesDao().load(Long.valueOf(OrgaPeoples.getId()));
    getOrgaPeoplesDao().orgaPeoplesVOToEntity(OrgaPeoples, entity, false);
    getOrgaPeoplesDao().update(entity);
  }

  protected void handleDeleteOrgaPeoples(long id)
    throws Exception
  {
    getOrgaPeoplesDao().remove(Long.valueOf(id));
  }

  protected OrgaPeoplesVO[] handleGetOrgaPeoples(OrgaPeoplesVO OrgaPeoples, int pageNumber, int pageSize, String orderBy)
    throws Exception
  {
    OrgaPeoplesDao infoDao = getOrgaPeoplesDao();
    Collection infos = infoDao.getOrgaPeoples(OrgaPeoples, pageNumber, pageSize, orderBy);
    return infoDao.toOrgaPeoplesVOArray(infos);
  }

  protected OrgaVO[] handleGetOrgaByPeoplesIdAndParentId(long PeoplesId, long parentId)
    throws Exception
  {
    OrgaVO orgaVO = new OrgaVO();
    orgaVO.setParentId(parentId);
    List reOrgaVOList = getOrgaDao().getOrga(orgaVO, 0, 0, "0");
    OrgaVO[] reOrgaVO = getOrgaDao().toOrgaVOArray(reOrgaVOList);
    OrgaPeoplesVO orgaPeoplesVO = new OrgaPeoplesVO();
    PeoplesVO pvo = new PeoplesVO();
    pvo.setId(PeoplesId);
    orgaPeoplesVO.setPeople(pvo);
    OrgaPeoplesVO[] re = getOrgaPeoples(orgaPeoplesVO, 0, 0, "0");
    for (int i = 0; i < re.length - 1; i++) {
      for (int j = 0; j < reOrgaVO.length - 1; j++) {
        System.out.println("re[i].getId():" + re[i].getId());
        System.out.println("re[i].getOrga().getId():" + re[i].getOrga().getId());
        System.out.println("reOrgaVO[j].getId():" + reOrgaVO[j].getId());
        if (re[i].getOrga().getId() == reOrgaVO[j].getId()){
        	reOrgaVO[j].setSelected(String.valueOf(re[i].getId()));
        	break;
        }
      }
    }

    return reOrgaVO;
  }

  protected PeoplesVO[] handleGetPeoplesByOrgaId(long OrgaId)
    throws Exception
  {
    PeoplesVO peovo = new PeoplesVO();
    List allpeoList = getPeoplesDao().getPeoples(peovo, 0, 0, "0");
    PeoplesVO[] allpeo = getPeoplesDao().toPeoplesVOArray(allpeoList);
    OrgaPeoplesVO peor = new OrgaPeoplesVO();
    OrgaVO ovo = new OrgaVO();
    ovo.setId(OrgaId);
    peor.setOrga(ovo);
    OrgaPeoplesVO[] orgaPeos = getOrgaPeoples(peor, 0, 0, "0");
    for (int i = 0; i < orgaPeos.length - 1; i++) {
      System.out.println("i:" + i);
      for (int j = 0; j < allpeo.length - 1; j++) {
        System.out.println("j:" + j);
        if (orgaPeos[i].getPeople().getId() == allpeo[j].getId()) {
          allpeo[j].setSelected(String.valueOf(orgaPeos[i].getId()));
          break;
        }
      }
    }
    return allpeo;
  }
}