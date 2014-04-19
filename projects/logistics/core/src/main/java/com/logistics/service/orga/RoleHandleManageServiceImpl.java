// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.service.orga;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import com.logistics.entity.car.WlVoitureDao;
import com.logistics.entity.orga.HandleInfoDao;
import com.logistics.entity.orga.HandleInfoVO;
import com.logistics.entity.orga.PeopleRole;
import com.logistics.entity.orga.PeopleRoleVO;
import com.logistics.entity.orga.PeopleVO;
import com.logistics.entity.orga.RoleInfoDao;
import com.logistics.entity.orga.RoleInfoVO;
import com.logistics.entity.orga.RoleOperateDao;
import com.logistics.entity.orga.RoleOperateVO;

/**
 * @see com.logistics.service.orga.RoleHandleManageService
 */
public class RoleHandleManageServiceImpl
    extends com.logistics.service.orga.RoleHandleManageServiceBase
{

    /**
     * @see com.logistics.service.orga.RoleHandleManageService#getRoleInfoVO(java.lang.String, java.lang.String, long)
     */
    protected  com.logistics.entity.orga.RoleInfoVO[] handleGetRoleInfoVO(java.lang.String roleName, java.lang.String remark, long id)
        throws java.lang.Exception
    {
        // @todo implement protected  com.logistics.entity.orga.RoleInfoVO[] handleGetRoleInfoVO(java.lang.String roleName, java.lang.String remark, long id)
        throw new java.lang.UnsupportedOperationException("com.logistics.service.orga.RoleHandleManageService.handleGetRoleInfoVO(java.lang.String roleName, java.lang.String remark, long id) Not implemented!");
    }

    /**
     * @see com.logistics.service.orga.RoleHandleManageService#createRoleInfo(com.logistics.entity.orga.RoleInfoVO)
     */
    protected  long handleCreateRoleInfo(com.logistics.entity.orga.RoleInfoVO ruleInfo)
        throws java.lang.Exception
    {
    	return this.getRoleInfoDao().create(this.getRoleInfoDao().roleInfoVOToEntity(ruleInfo)).getId();
    }

    /**
     * @see com.logistics.service.orga.RoleHandleManageService#updateRoleInfo(com.logistics.entity.orga.RoleInfoVO)
     */
    protected  void handleUpdateRoleInfo(com.logistics.entity.orga.RoleInfoVO ruleInfo)
        throws java.lang.Exception
    {
    	this.getRoleInfoDao().update(this.getRoleInfoDao().roleInfoVOToEntity(ruleInfo));
    }

    /**
     * @see com.logistics.service.orga.RoleHandleManageService#deleteRoleInfo(long)
     */
    protected  void handleDeleteRoleInfo(long id)
        throws java.lang.Exception
    {
    	this.getRoleInfoDao().remove(id);
    }

    /**
     * @see com.logistics.service.orga.RoleHandleManageService#getRoleOperateVO(long, long, long)
     */
    protected  com.logistics.entity.orga.RoleOperateVO[] handleGetRoleOperateVO(long id, long roleId, long handleId)
        throws java.lang.Exception
    {
        // @todo implement protected  com.logistics.entity.orga.RoleOperateVO[] handleGetRoleOperateVO(long id, long roleId, long handleId)
        throw new java.lang.UnsupportedOperationException("com.logistics.service.orga.RoleHandleManageService.handleGetRoleOperateVO(long id, long roleId, long handleId) Not implemented!");
    }

    /**
     * @see com.logistics.service.orga.RoleHandleManageService#createRoleOperate(com.logistics.entity.orga.RoleOperateVO)
     */
    protected  long handleCreateRoleOperate(com.logistics.entity.orga.RoleOperateVO roleOperate)
        throws java.lang.Exception
    {
    	return this.getRoleOperateDao().create(this.getRoleOperateDao().roleOperateVOToEntity(roleOperate)).getId();
    }

    /**
     * @see com.logistics.service.orga.RoleHandleManageService#updateRoleOperate(com.logistics.entity.orga.RoleOperateVO)
     */
    protected  void handleUpdateRoleOperate(com.logistics.entity.orga.RoleOperateVO roleOperate)
        throws java.lang.Exception
    {
    	this.getRoleOperateDao().update(this.getRoleOperateDao().roleOperateVOToEntity(roleOperate));
    }

    /**
     * @see com.logistics.service.orga.RoleHandleManageService#deleteRoleOperate(long)
     */
    protected  void handleDeleteRoleOperate(long id)
        throws java.lang.Exception
    {
    	this.getRoleOperateDao().remove(id);
    }

    /**
     * @see com.logistics.service.orga.RoleHandleManageService#getHandleInfoVO(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, long)
     */
    protected  com.logistics.entity.orga.HandleInfoVO[] handleGetHandleInfoVO(java.lang.String handleSno, java.lang.String handleName, java.lang.String programName, java.lang.String remark, java.lang.String handleType, long id)
        throws java.lang.Exception
    {
        // @todo implement protected  com.logistics.entity.orga.HandleInfoVO[] handleGetHandleInfoVO(java.lang.String handleSno, java.lang.String handleName, java.lang.String programName, java.lang.String remark, java.lang.String handleType, long id)
        throw new java.lang.UnsupportedOperationException("com.logistics.service.orga.RoleHandleManageService.handleGetHandleInfoVO(java.lang.String handleSno, java.lang.String handleName, java.lang.String programName, java.lang.String remark, java.lang.String handleType, long id) Not implemented!");
    }

    /**
     * @see com.logistics.service.orga.RoleHandleManageService#createHandleInfo(com.logistics.entity.orga.HandleInfoVO)
     */
    protected  long handleCreateHandleInfo(com.logistics.entity.orga.HandleInfoVO handleInfo)
        throws java.lang.Exception
    {
    	handleInfo.setHandleSno(this.getHandleInfoDao().getMaxSno(handleInfo.getHandleSno()));
    	return this.getHandleInfoDao().create(this.getHandleInfoDao().handleInfoVOToEntity(handleInfo)).getId();
    }

    /**
     * @see com.logistics.service.orga.RoleHandleManageService#updateHandleInfo(com.logistics.entity.orga.HandleInfoVO)
     */
    protected  void handleUpdateHandleInfo(com.logistics.entity.orga.HandleInfoVO handleInfo)
        throws java.lang.Exception
    {
    	this.getHandleInfoDao().update(this.getHandleInfoDao().handleInfoVOToEntity(handleInfo));
    }

    /**
     * @see com.logistics.service.orga.RoleHandleManageService#deleteHandleInfo(long, int)
     */
    protected  void handleDeleteHandleInfo(long id)
        throws java.lang.Exception
    {
    	this.getHandleInfoDao().remove(id);
    }

    /**
     * @see com.logistics.service.orga.RoleHandleManageService#getRoleInfo(com.logistics.entity.orga.RoleInfoVO, int, int, java.lang.String)
     */
    protected  com.logistics.entity.orga.RoleInfoVO[] handleGetRoleInfo(com.logistics.entity.orga.RoleInfoVO RoleInfoVO, int pageNumber, int pageSize, java.lang.String orderBy)
        throws java.lang.Exception
    {
    	RoleInfoDao infoDao=this.getRoleInfoDao();
	 	Collection infos = infoDao.getRoleInfo(RoleInfoVO, pageNumber, pageSize, orderBy);
	 	return infoDao.toRoleInfoVOArray(infos); 
    }

    /**
     * @see com.logistics.service.orga.RoleHandleManageService#getRoleOperate(com.logistics.entity.orga.RoleOperateVO, int, int, java.lang.String)
     */
    protected  com.logistics.entity.orga.RoleOperateVO[] handleGetRoleOperate(com.logistics.entity.orga.RoleOperateVO RoleOperateVO, int pageNumber, int pageSize, java.lang.String orderBy)
        throws java.lang.Exception
    {
    	RoleOperateDao infoDao=this.getRoleOperateDao();
	 	Collection infos = infoDao.getRoleOperate(RoleOperateVO, pageNumber, pageSize, orderBy);
	 	return infoDao.toRoleOperateVOArray(infos); 
    }

    /**
     * @see com.logistics.service.orga.RoleHandleManageService#getHandleInfo(com.logistics.entity.orga.HandleInfoVO, int, int, java.lang.String)
     */
    protected  com.logistics.entity.orga.HandleInfoVO[] handleGetHandleInfo(com.logistics.entity.orga.HandleInfoVO HandleInfoVO, int pageNumber, int pageSize, java.lang.String orderBy)
        throws java.lang.Exception
    {
    	HandleInfoDao infoDao=this.getHandleInfoDao();
	 	Collection infos = infoDao.getHandleInfo(HandleInfoVO, pageNumber, pageSize, orderBy);
	 	return infoDao.toHandleInfoVOArray(infos); //(HandleInfoVO[])infos.toArray(new HandleInfoVO[0]);toHandleInfoVOCollection(infos);
    }

	protected com.logistics.entity.orga.HandleInfoVO[] handleGetHandleByPeopleAndParentSno(long peopleId,java.lang.String parentSno) throws Exception {
		PeopleRoleVO peoRoleVO=new PeopleRoleVO();
		PeopleVO peoVO=new PeopleVO();
		peoVO.setId(peopleId);
		peoRoleVO.setPeople(peoVO);
		List infos=this.getPeopleRoleDao().getPeopleRole(peoRoleVO, 0, 0, "0");
		this.getPeopleRoleDao().toEntities(infos);
		System.out.println("infos:"+infos);
		System.out.println("infos:.size()"+infos.size());
		List roles=new ArrayList(infos.size());
		com.logistics.entity.orga.PeopleRole peoRole;
		//=new com.logistics.entity.orga.PeopleRoleImpl();
		for(int i=0;i<infos.size()-1;i++){
			peoRole=(com.logistics.entity.orga.PeopleRoleImpl)infos.get(i);
			System.out.println("peoRole:"+peoRole);
			System.out.println("peoRole.getRole():"+peoRole.getRole());
			roles.add(peoRole.getRole().getId());
		}
		//RoleOperateVO roleOperateVO=new RoleOperateVO();
		return this.getRoleOperateDao().getHandleByRoles(roles,parentSno);

	}

	protected RoleOperateVO[] handleGetAllRoleHandleByRoles(String roles)
			throws Exception {
		RoleOperateDao infoDao=this.getRoleOperateDao();
	 	Collection infos = infoDao.getAllRoleHandleByRoles(roles);
	 	return infoDao.toRoleOperateVOArray(infos);
	}

	@Override
	protected HandleInfoVO[] handleGetHandleForRoleByParentId(long roleId,String parent) throws Exception {//ParentId¼´ÎªparentSno
		if(parent==null)parent="___";
		HandleInfoVO handleInfoVO=new HandleInfoVO();
		handleInfoVO.setHandleSno(parent);
		HandleInfoVO[] reHand=this.getHandleInfo(handleInfoVO, 0, 0, "0");
		RoleOperateVO roleOperatevo = new RoleOperateVO();
		RoleInfoVO rvo=new RoleInfoVO();
		rvo.setId(roleId);
		roleOperatevo.setRole(rvo);
		RoleOperateVO[] reRole=this.getRoleOperate(roleOperatevo, 0, 0, "0");
		for(int i=0;i<reRole.length-1;i++){
			for(int j=0;j<reHand.length-1;j++){
				if(reRole[i].getHandle().getId()== reHand[j].getId() ){
					reHand[j].setSelected(String.valueOf(reRole[i].getId()));
					break;
				}
			}
		}
		return reHand;
	}

}