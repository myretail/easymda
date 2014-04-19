// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.service.orga;

import java.util.Collection;
import java.util.Random;
import com.logistics.util.ProjectUtil;
import com.logistics.entity.orga.HandleInfoDao;
import com.logistics.entity.orga.OrgaInfoDao;
import com.logistics.entity.orga.OrgaInfoVO;
import com.logistics.entity.orga.OrgaPeopleDao;
import com.logistics.entity.orga.OrgaPeopleVO;
import com.logistics.entity.orga.People;
import com.logistics.entity.orga.PeopleDao;
import com.logistics.entity.orga.PeopleRoleDao;
import com.logistics.entity.orga.PeopleRoleVO;
import com.logistics.entity.orga.PeopleVO;
import com.logistics.entity.orga.RoleInfoVO;

/**
 * @see com.logistics.service.orga.OrgaPeopleManageService
 */
public class OrgaPeopleManageServiceImpl
    extends com.logistics.service.orga.OrgaPeopleManageServiceBase
{

    /**
     * @see com.logistics.service.orga.OrgaPeopleManageService#getOrgaInfoVO(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, long)
     */
    protected  com.logistics.entity.orga.OrgaInfoVO[] handleGetOrgaInfoVO(java.lang.String orgaSno, java.lang.String orgaName, java.lang.String orgaCode, java.lang.String remark, java.lang.String orgaState, long id)
        throws java.lang.Exception
    {
        
        	OrgaInfoDao OrgaInfoDao=this.getOrgaInfoDao();
    	 	Collection orgaInfos = OrgaInfoDao.getOrgaInfoVO(orgaSno,orgaName,orgaCode,remark,orgaState,id);
    	 	OrgaInfoDao.toOrgaInfoVOCollection(orgaInfos);
    	    return  (OrgaInfoVO[])orgaInfos.toArray(new OrgaInfoVO[0]);}

    /**
     * @see com.logistics.service.orga.OrgaPeopleManageService#createOrgaInfo(com.logistics.entity.orga.OrgaInfoVO)
     */
    protected  long handleCreateOrgaInfo(com.logistics.entity.orga.OrgaInfoVO orgaInfoVO)
        throws java.lang.Exception
    {   
    	
    	orgaInfoVO.setOrgaSno(this.getOrgaInfoDao().getMaxSno(orgaInfoVO.getOrgaSno()));
    	return this.getOrgaInfoDao().create(this.getOrgaInfoDao().orgaInfoVOToEntity(orgaInfoVO)).getId();
    }

    /**
     * @see com.logistics.service.orga.OrgaPeopleManageService#updateOrgaInfo(com.logistics.entity.orga.OrgaInfoVO)
     */
    protected  void handleUpdateOrgaInfo(com.logistics.entity.orga.OrgaInfoVO orgaInfoVO)
        throws java.lang.Exception
    {
    	this.getOrgaInfoDao().update(this.getOrgaInfoDao().orgaInfoVOToEntity(orgaInfoVO));
    }

    /**
     * @see com.logistics.service.orga.OrgaPeopleManageService#deleteOrgaInfo(long)
     */
    protected  void handleDeleteOrgaInfo(long id)
        throws java.lang.Exception
    {
    	this.getOrgaInfoDao().remove(id);
    }

    /**
     * @see com.logistics.service.orga.OrgaPeopleManageService#updatePeopleAndOrgapeo(long, long, long, long)
     */
    protected  void handleUpdatePeopleAndOrgapeo(long peopleId, long oldOrga, long newOrga, long orgaPeoId)
        throws java.lang.Exception
    {
        
        	final com.logistics.entity.orga.OrgaPeople entity = this.getOrgaPeopleDao().load(orgaPeoId);
        	entity.setOrga(this.getOrgaInfoDao().load(newOrga));
        	this.getOrgaPeopleDao().update(entity); }

    /**
     * @see com.logistics.service.orga.OrgaPeopleManageService#getPeopelVO(java.lang.String, java.lang.String, java.util.Date, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.util.Date, java.lang.String, java.lang.String)
     */
    protected  com.logistics.entity.orga.PeopleVO[] handleGetPeopelVO(java.lang.String peopleName, java.lang.String peopleStatus, java.util.Date birthDay, java.lang.String sex, java.lang.String birthPlace, java.lang.String address, java.lang.String tel, java.util.Date engageDate, java.lang.String engageMode, java.lang.String grade)
        throws java.lang.Exception
    {
    	PeopleDao peopleDao=this.getPeopleDao();
	 	Collection peoples = peopleDao.getPeopelVO(peopleName,peopleStatus,birthDay,sex,birthPlace,address,tel,engageMode,engageDate,grade);
	 	peopleDao.toPeopleVOCollection(peoples);
	    return  (PeopleVO[])peoples.toArray(new PeopleVO[0]);
    }

    /**
     * @see com.logistics.service.orga.OrgaPeopleManageService#createPeopleAndOrgapeo(com.logistics.entity.orga.PeopleVO, long)
     */
    protected  long handleCreatePeopleAndOrgapeo(com.logistics.entity.orga.PeopleVO peopleVO, long orgaId)
        throws java.lang.Exception
    {
    	Random rd = new Random();
    	final com.logistics.entity.orga.People entity = this.getPeopleDao().peopleVOToEntity(peopleVO);
    	entity.setId(System.currentTimeMillis()+rd.nextInt());
    	long id=this.getPeopleDao().create(entity).getId();
    	peopleVO.setId(id);
    	StringBuffer cipBuf = new StringBuffer(20);
        cipBuf.append(id);
        entity.setPeoplePassword(ProjectUtil.getGenerated(peopleVO.getPeoplePassword(),cipBuf.reverse().toString()));
        this.getPeopleDao().update(entity);
        //this.getPeopleDao().toPeopleVO(this.getPeopleDao().load(id));
    	com.logistics.entity.orga.OrgaPeopleVO  orgaPeopleVO = new OrgaPeopleVO();
    	orgaPeopleVO.setId(0);
    	orgaPeopleVO.setOrga(this.getOrgaInfoDao().toOrgaInfoVO(this.getOrgaInfoDao().load(orgaId)));
    	orgaPeopleVO.setPeople(peopleVO);//直接set从页面传来的VO
    	//orgaPeopleVO.setPeople();
    	final com.logistics.entity.orga.OrgaPeople opentity= this.getOrgaPeopleDao().orgaPeopleVOToEntity(orgaPeopleVO);
    	this.getOrgaPeopleDao().create(opentity);
    	return id;
    }

    /**
     * @see com.logistics.service.orga.OrgaPeopleManageService#updatePeople(com.logistics.entity.orga.PeopleVO)
     */
    protected  void handleUpdatePeople(com.logistics.entity.orga.PeopleVO peopleVO)
        throws java.lang.Exception
    {
    	this.getPeopleDao().update(this.getPeopleDao().peopleVOToEntity(peopleVO));
    }

    /**
     * @see com.logistics.service.orga.OrgaPeopleManageService#deletePeopleAndOrgapeo(long)
     */
    protected  void handleDeletePeopleAndOrgapeo(long id)
        throws java.lang.Exception
    {
    	long peopleId=this.getOrgaPeopleDao().load(id).getPeople().getId();
    	this.getOrgaPeopleDao().remove(id);
    	this.getPeopleDao().remove(peopleId);
    }

    /**
     * @see com.logistics.service.orga.OrgaPeopleManageService#getPeopleRuleVO(long, long, long)
     */
    protected  com.logistics.entity.orga.PeopleRoleVO[] handleGetPeopleRuleVO(long peopleId, long ruleId, long id)
        throws java.lang.Exception
    {
        // @todo implement protected  com.logistics.entity.orga.PeopleRoleVO[] handleGetPeopleRuleVO(long peopleId, long ruleId, long id)
        throw new java.lang.UnsupportedOperationException("com.logistics.service.orga.OrgaPeopleManageService.handleGetPeopleRuleVO(long peopleId, long ruleId, long id) Not implemented!");
    }

    /**
     * @see com.logistics.service.orga.OrgaPeopleManageService#createPeopleRole(com.logistics.entity.orga.PeopleRoleVO)
     */
    protected  long handleCreatePeopleRole(com.logistics.entity.orga.PeopleRoleVO peopleRole)
        throws java.lang.Exception
    {
    	return this.getPeopleRoleDao().create(this.getPeopleRoleDao().peopleRoleVOToEntity(peopleRole)).getId();
    }

    /**
     * @see com.logistics.service.orga.OrgaPeopleManageService#deletePeopleRole(long)
     */
    protected  void handleDeletePeopleRole(long id)
        throws java.lang.Exception
    {
    	this.getPeopleRoleDao().remove(id);
    }

    /**
     * @see com.logistics.service.orga.OrgaPeopleManageService#getOrgaInfo(com.logistics.entity.orga.OrgaInfoVO, int, int, java.lang.String)
     */
    protected  com.logistics.entity.orga.OrgaInfoVO[] handleGetOrgaInfo(com.logistics.entity.orga.OrgaInfoVO OrgaInfoVO, int pageNumber, int pageSize, java.lang.String orderBy)
        throws java.lang.Exception
    {
    	OrgaInfoDao infoDao=this.getOrgaInfoDao();
	 	Collection infos = infoDao.getOrgaInfo(OrgaInfoVO, pageNumber, pageSize, orderBy);
	 	return infoDao.toOrgaInfoVOArray(infos);
    }

    /**
     * @see com.logistics.service.orga.OrgaPeopleManageService#getPeople(com.logistics.entity.orga.PeopleVO, int, int, java.lang.String)
     */
    protected  com.logistics.entity.orga.PeopleVO[] handleGetPeople(com.logistics.entity.orga.PeopleVO PeopleVO, int pageNumber, int pageSize, java.lang.String orderBy)
        throws java.lang.Exception
    {
    	PeopleDao infoDao=this.getPeopleDao();
	 	Collection infos = infoDao.getPeople(PeopleVO, pageNumber, pageSize, orderBy);
	 	return infoDao.toPeopleVOArray(infos);
	 }

    /**
     * @see com.logistics.service.orga.OrgaPeopleManageService#getOrgaPeople(com.logistics.entity.orga.OrgaPeopleVO, int, int, java.lang.String)
     */
    protected  com.logistics.entity.orga.OrgaPeopleVO[] handleGetOrgaPeople(com.logistics.entity.orga.OrgaPeopleVO OrgaPeopleVO, int pageNumber, int pageSize, java.lang.String orderBy)
        throws java.lang.Exception
    {
    	OrgaPeopleDao infoDao=this.getOrgaPeopleDao();
	 	Collection infos = infoDao.getOrgaPeople(OrgaPeopleVO, pageNumber, pageSize, orderBy);
	 	return infoDao.toOrgaPeopleVOArray(infos);
    }

    /**
     * @see com.logistics.service.orga.OrgaPeopleManageService#getPeopleRole(com.logistics.entity.orga.PeopleRoleVO, int, int, java.lang.String)
     */
    protected  com.logistics.entity.orga.PeopleRoleVO[] handleGetPeopleRole(com.logistics.entity.orga.PeopleRoleVO PeopleRoleVO, int pageNumber, int pageSize, java.lang.String orderBy)
        throws java.lang.Exception
    {
    	PeopleRoleDao infoDao=this.getPeopleRoleDao();
	 	Collection infos = infoDao.getPeopleRole(PeopleRoleVO, pageNumber, pageSize, orderBy);
	 	return infoDao.toPeopleRoleVOArray(infos);
    }

	protected int handleVerifyPassword(long peopleId, String password)throws Exception {
		//People VerifyPeople=this.getPeopleDao().load(peopleId);
		//VerifyPeople.
		return this.getPeopleDao().verifyPassword(peopleId, password);
	}

	@Override
	protected PeopleVO[] handleGetPeopleForRole(long roleId) throws Exception {
		PeopleVO peovo=new PeopleVO();
		PeopleVO[] allpeo=this.getPeople(peovo, 0, 0, "0");
		PeopleRoleVO peor=new PeopleRoleVO();
		RoleInfoVO rvo=new RoleInfoVO();
		rvo.setId(roleId);
		peor.setRole(rvo);
		PeopleRoleVO[] peoRoles=this.getPeopleRole(peor, 0, 0, "0");
		for(int i=0;i<peoRoles.length-1;i++){
			System.out.println("i:"+i);
			for(int j=0;j<allpeo.length-1;j++){
				System.out.println("j:"+j);
				if(peoRoles[i].getPeople().getId()==allpeo[j].getId() ){
					allpeo[j].setSelected(String.valueOf(peoRoles[i].getId()));
					break;
				}
			}
		}
		return allpeo;
	}

	@Override
	protected RoleInfoVO[] handleGetRoleForPeople(long peopleId)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}