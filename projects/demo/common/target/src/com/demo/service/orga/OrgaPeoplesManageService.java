// license-header java merge-point
//
// Attention: Generated code! Do not modify by hand!
// Generated by: SpringService.vsl in andromda-spring-cartridge.
//
package com.demo.service.orga;

/**
 * 
 */
public interface OrgaPeoplesManageService
{

    /**
     * 
     */
    public long createOrgaPeoples(com.demo.entity.orga.OrgaPeoplesVO OrgaPeoples);

    /**
     * 
     */
    public void updateOrgaPeoples(com.demo.entity.orga.OrgaPeoplesVO OrgaPeoples);

    /**
     * 
     */
    public void deleteOrgaPeoples(long id);

    /**
     * 
     */
    public com.demo.entity.orga.OrgaPeoplesVO[] getOrgaPeoples(com.demo.entity.orga.OrgaPeoplesVO OrgaPeoples, int pageNumber, int pageSize, java.lang.String orderBy);

    /**
     * 
     */
    public com.demo.entity.orga.OrgaVO[] getOrgaByPeoplesIdAndParentId(long PeoplesId, long parentId);

    /**
     * 
     */
    public com.demo.entity.orga.PeoplesVO[] getPeoplesByOrgaId(long OrgaId);

}