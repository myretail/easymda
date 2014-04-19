// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.service.basic;

import java.util.Collection;
import java.util.ArrayList;
import java.util.Random;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.MatchMode;

import com.logistics.ServiceLocator;
import com.logistics.entity.basic.EnumerationDao;
import com.logistics.entity.basic.EnumerationVO;
import com.logistics.entity.basic.WlCustProductDao;
import com.logistics.entity.basic.WlCustProductVO;
import com.logistics.entity.basic.WlPathDao;
import com.logistics.entity.basic.WlPathVO;
import com.logistics.entity.basic.WlPlaceDao;
import com.logistics.entity.basic.WlPlaceVO;
import com.logistics.entity.basic.crud.WlPathManageableService;
import com.logistics.entity.order.crud.WlOrderRowManageableService;
/**
 * @see com.logistics.service.basic.BasicManageService
 */
public class BasicManageServiceImpl
    extends com.logistics.service.basic.BasicManageServiceBase
{

    /**
     * @see com.logistics.service.basic.BasicManageService#getEnumerationByType(java.lang.String)
     */
    protected  com.logistics.entity.basic.EnumerationVO[] handleGetEnumerationByType(java.lang.String eType)
        throws java.lang.Exception
    {
    	EnumerationDao enuDao=this.getEnumerationDao();
 	    Collection EnumerationVOs = enuDao.getEnumerationByType(eType);
        enuDao.toEnumerationVOCollection(EnumerationVOs);
        return  (EnumerationVO[])EnumerationVOs.toArray(new EnumerationVO[0]);
    }

    /**
     * @see com.logistics.service.basic.BasicManageService#getPlaceEntityByID(long)
     */
    protected  com.logistics.entity.basic.WlPlaceVO handleGetPlaceEntityByID(long id)
        throws java.lang.Exception
    {
        // @todo implement protected  com.logistics.entity.basic.WlPlaceVO handleGetPlaceEntityByID(long id)
        throw new java.lang.UnsupportedOperationException("com.logistics.service.basic.BasicManageService.handleGetPlaceEntityByID(long id) Not implemented!");
    }

    /**
     * @see com.logistics.service.basic.BasicManageService#getPlacevoByParentPlaceId(long)
     */
    protected  com.logistics.entity.basic.WlPlaceVO[] handleGetPlacevoByParentPlaceId(long parentPlaceId)
        throws java.lang.Exception
    {
    	WlPlaceDao placeDao=this.getWlPlaceDao();
    	Collection placeVOs = placeDao.getPlacevoByParentPlaceId(parentPlaceId);
    	placeDao.toWlPlaceVOCollection(placeVOs);
    	return (WlPlaceVO[])placeVOs.toArray(new WlPlaceVO[0]);
    }

    /**
     * @see com.logistics.service.basic.BasicManageService#getPlacevoByPlaceType(java.lang.String)
     */
    protected  com.logistics.entity.basic.WlPlaceVO[] handleGetPlacevoByPlaceType(java.lang.String type)
        throws java.lang.Exception
    {
    	WlPlaceDao placeDao=this.getWlPlaceDao();
	 	Collection placeVOs = placeDao.getPlacevoByType(type);
	 	placeDao.toWlPlaceVOCollection(placeVOs);
	    return  (WlPlaceVO[])placeVOs.toArray(new WlPlaceVO[0]);
    }

    /**
     * @see com.logistics.service.basic.BasicManageService#getPlacevoByPostCode(java.lang.String)
     */
    protected  com.logistics.entity.basic.WlPlaceVO[] handleGetPlacevoByPostCode(java.lang.String postCode)
        throws java.lang.Exception
    {
    	WlPlaceDao placeDao=this.getWlPlaceDao();
 	    Collection placeVOs = placeDao.getPlacevoByPostCode(postCode);
 	    placeDao.toWlPlaceVOCollection(placeVOs);
        return  (WlPlaceVO[])placeVOs.toArray(new WlPlaceVO[0]);
    }

    /**
     * @see com.logistics.service.basic.BasicManageService#getAllPlacevo()
     */
    protected  com.logistics.entity.basic.WlPlaceVO[] handleGetAllPlacevo()
        throws java.lang.Exception
    {
        // @todo implement protected  com.logistics.entity.basic.WlPlaceVO[] handleGetAllPlacevo()
        throw new java.lang.UnsupportedOperationException("com.logistics.service.basic.BasicManageService.handleGetAllPlacevo() Not implemented!");
    }

    /**
     * @see com.logistics.service.basic.BasicManageService#getPathvoByPathName(java.lang.String)
     */
    protected  com.logistics.entity.basic.WlPathVO[] handleGetPathvoByPathName(java.lang.String pathName)
        throws java.lang.Exception
    {
        // @todo implement protected  com.logistics.entity.basic.WlPathVO[] handleGetPathvoByPathName(java.lang.String pathName)
        throw new java.lang.UnsupportedOperationException("com.logistics.service.basic.BasicManageService.handleGetPathvoByPathName(java.lang.String pathName) Not implemented!");
    }

    /**
     * @see com.logistics.service.basic.BasicManageService#getPathvoByStartPalce(long)
     */
    protected  com.logistics.entity.basic.WlPathVO[] handleGetPathvoByStartPalce(long startPlace)
        throws java.lang.Exception
    {
        // @todo implement protected  com.logistics.entity.basic.WlPathVO[] handleGetPathvoByStartPalce(long startPlace)
        throw new java.lang.UnsupportedOperationException("com.logistics.service.basic.BasicManageService.handleGetPathvoByStartPalce(long startPlace) Not implemented!");
    }

    /**
     * @see com.logistics.service.basic.BasicManageService#getPathvoByEndPlace(long)
     */
    protected  com.logistics.entity.basic.WlPathVO[] handleGetPathvoByEndPlace(long endPlaceID)
        throws java.lang.Exception
    {
    	WlPathDao PathDao=this.getWlPathDao();
	 	Collection PathVOs = PathDao.getPathvoByEndPlace(endPlaceID);
	 	PathDao.toWlPathVOCollection(PathVOs);
	    return  (WlPathVO[])PathVOs.toArray(new WlPathVO[0]);
    }

    /**
     * @see com.logistics.service.basic.BasicManageService#getEnumerationByParentId(long)
     */
    protected  com.logistics.entity.basic.EnumerationVO[] handleGetEnumerationByParentId(long parentType)
        throws java.lang.Exception
    {
    	EnumerationDao enuDao=this.getEnumerationDao();
	 	Collection EnumerationVOs = enuDao.getEnumerationByParentId(parentType);
	    enuDao.toEnumerationVOCollection(EnumerationVOs);
	    return  (EnumerationVO[])EnumerationVOs.toArray(new EnumerationVO[0]);
    }

    /**
     * @see com.logistics.service.basic.BasicManageService#createEnumeration(com.logistics.entity.basic.EnumerationVO)
     */
    protected  long handleCreateEnumeration(com.logistics.entity.basic.EnumerationVO EnumerationVO)
        throws java.lang.Exception
    {   
    	Random rd = new Random();
    	final com.logistics.entity.basic.Enumeration entity = this.getEnumerationDao().enumerationVOToEntity(EnumerationVO);
    	entity.setId(System.currentTimeMillis()+rd.nextInt());
    	return this.getEnumerationDao().create(entity).getId();
    }

    /**
     * @see com.logistics.service.basic.BasicManageService#updateEnumerations(com.logistics.entity.basic.EnumerationVO)
     */
    protected  void handleUpdateEnumerations(com.logistics.entity.basic.EnumerationVO enumerationVO)
        throws java.lang.Exception
    {
    	 final com.logistics.entity.basic.Enumeration entity = this.getEnumerationDao().enumerationVOToEntity(enumerationVO);
    	//this.getEnumerationDao().load(enumerationVO.getId());
    	 this.getEnumerationDao().update(entity);
    }

    /**
     * @see com.logistics.service.basic.BasicManageService#deleteEnumerations(long)
     */
    protected  void handleDeleteEnumerations(long ids)
        throws java.lang.Exception
    {
    	this.getEnumerationDao().remove(ids);
    }

    /**
     * @see com.logistics.service.basic.BasicManageService#getEnumerationById(long)
     */
    protected  String[] handleGetEnumerationType()
        throws java.lang.Exception
    {
    	EnumerationDao enuDao=this.getEnumerationDao();
	 	Collection EnumerationVOs = enuDao.getEnumerationType();
	    System.out.println("EnumerationVOs==="+EnumerationVOs);
	 	if(EnumerationVOs==null||EnumerationVOs.size()==0){
	 		return null;
	 	}else{
	    return  (String[])EnumerationVOs.toArray(new String[0]);
	 	}
    }

    /**
     * @see com.logistics.service.basic.BasicManageService#getAllEnumeration()
     */
    protected  com.logistics.entity.basic.EnumerationVO[] handleGetEnumeration(com.logistics.entity.basic.EnumerationVO enumerationVO)
        throws java.lang.Exception
    {
    	EnumerationDao enuDao=this.getEnumerationDao();
	 	Collection EnumerationVOs = enuDao.getEnumeration(enumerationVO);
	    enuDao.toEnumerationVOCollection(EnumerationVOs);
	    return  (EnumerationVO[])EnumerationVOs.toArray(new EnumerationVO[0]);
    }

    /**
     * @see com.logistics.service.basic.BasicManageService#getPlaceByName(java.lang.String)
     */
    protected  com.logistics.entity.basic.WlPlaceVO[] handleGetPlaceByName(java.lang.String name)
        throws java.lang.Exception
    {
        // @todo implement protected  com.logistics.entity.basic.WlPlaceVO[] handleGetPlaceByName(java.lang.String name)
        throw new java.lang.UnsupportedOperationException("com.logistics.service.basic.BasicManageService.handleGetPlaceByName(java.lang.String name) Not implemented!");
    }

    /**
     * @see com.logistics.service.basic.BasicManageService#createPlace(com.logistics.entity.basic.WlPlaceVO)
     */
    protected  long handleCreatePlace(com.logistics.entity.basic.WlPlaceVO place)
        throws java.lang.Exception
    {
    	final com.logistics.entity.basic.WlPlace entity = new com.logistics.entity.basic.WlPlaceImpl();
        entity.setPostCode(place.getPostCode());
        entity.setPlaceName(place.getPlaceName());
        entity.setParentPlaceId(place.getParentPlaceId());
        entity.setPlaceType(place.getPlaceType());
        entity.setTrafficeGrade(place.getTrafficeGrade());
        entity.setRemark(place.getRemark());    
        
        Random rd = new Random();
        entity.setId(System.currentTimeMillis()+rd.nextInt());
        
        //com.logistics.entity.basic.crud.WlPlaceManageableDaoBase.create();
        return this.getWlPlaceDao().create(entity).getId();
    }

    /**
     * @see com.logistics.service.basic.BasicManageService#updatePlace(com.logistics.entity.basic.WlPlaceVO)
     */
    protected  void handleUpdatePlace(com.logistics.entity.basic.WlPlaceVO places)
        throws java.lang.Exception
    {
    	 
    	 final com.logistics.entity.basic.WlPlace entity = this.getWlPlaceDao().load(places.getId());
    	 entity.setPostCode(places.getPostCode());
         entity.setPlaceName(places.getPlaceName());
         entity.setParentPlaceId(places.getParentPlaceId());
         entity.setPlaceType(places.getPlaceType());
         entity.setTrafficeGrade(places.getTrafficeGrade());
         entity.setRemark(places.getRemark());     
         entity.setId(places.getId());
         this.getWlPlaceDao().update(entity);
    	
    }

    /**
     * @see com.logistics.service.basic.BasicManageService#deletePlaces(long)
     */
    protected  void handleDeletePlaces(long id)
        throws java.lang.Exception
    {
    	this.getWlPlaceDao().remove(id);
    }

    /**
     * @see com.logistics.service.basic.BasicManageService#createPath(com.logistics.entity.basic.WlPathVO)
     */
    protected  long handleCreatePath(com.logistics.entity.basic.WlPathVO paths)
        throws java.lang.Exception
    {
    	final com.logistics.entity.basic.WlPath entity = this.getWlPathDao().wlPathVOToEntity(paths);
    	//this.getWlPathDao().toWlPathVO(entity,paths);
        /*entity.setDistance(paths.getDistance());
        entity.setEndPlace(this.getWlPlaceDao().load(paths.getEndPlaceID()));
        entity.setLoanStandard(paths.getLoanStandard());
        entity.setPathName(paths.getPathName());
        entity.setStartPlace(this.getWlPlaceDao().load(paths.getStartPlaceID()));
        entity.setTime(paths.getTime());  
        Random rd = new Random();
        entity.setId(System.currentTimeMillis()+rd.nextInt());*/
    	return this.getWlPathDao().create(entity).getId();
    }

    /**
     * @see com.logistics.service.basic.BasicManageService#updatePath(com.logistics.entity.basic.WlPathVO)
     */
    protected  void handleUpdatePath(com.logistics.entity.basic.WlPathVO paths)
        throws java.lang.Exception
    {
    	final com.logistics.entity.basic.WlPath entity = this.getWlPathDao().load(paths.getId());
    	//this.getWlPathDao().toWlPathVO(entity,paths);
    	/*  entity.setDistance(paths.getDistance());
        entity.setEndPlace(this.getWlPlaceDao().load(paths.getEndPlaceID()));
        entity.setLoanStandard(paths.getLoanStandard());
        entity.setPathName(paths.getPathName());
        entity.setStartPlace(this.getWlPlaceDao().load(paths.getStartPlaceID()));
        entity.setTime(paths.getTime()); */
    	this.getWlPathDao().wlPathVOToEntity(paths, entity, false);
        this.getWlPathDao().update(entity);
    }

    /**
     * @see com.logistics.service.basic.BasicManageService#deletePath(long)
     */
    protected  void handleDeletePath(long ids)
        throws java.lang.Exception
    {
    	this.getWlPathDao().remove(ids);
    }

    /**
     * @see com.logistics.service.basic.BasicManageService#getPlacevoByPlaceType(java.lang.String)
     */
    protected  com.logistics.entity.basic.WlPlaceVO[] handleGetPlaceVO(java.lang.String placeName,java.lang.String postCode ,java.lang.String placeType,java.lang.String remark)
        throws java.lang.Exception
    {
    	WlPlaceDao placeDao=this.getWlPlaceDao();
	 	Collection placeVOs = placeDao.getPlaceVO(placeName,postCode,placeType,remark);
	 	placeDao.toWlPlaceVOCollection(placeVOs);
	    return  (WlPlaceVO[])placeVOs.toArray(new WlPlaceVO[0]);
    }

    /**
     * @see com.logistics.service.basic.BasicManageService#getPathvo(java.lang.String)
     */
    protected  com.logistics.entity.basic.WlPathVO[] handleGetPathVO(java.lang.String pathName,double distance, double loanStandard,double time,long startPlaceId,long endPlaceId,java.lang.String startPlace,java.lang.String endPlace)
        throws java.lang.Exception
    {
    	WlPathDao pathDao=this.getWlPathDao();
	 	Collection pathVOs = pathDao.getPathVO(pathName,distance,loanStandard,time,startPlaceId,endPlaceId,startPlace,endPlace);
	 	pathDao.toWlPathVOCollection(pathVOs);
	    return  (WlPathVO[])pathVOs.toArray(new WlPathVO[0]);
    }

	@Override
	protected WlPathVO[] handleGetAllPathvo() throws Exception {
		WlPathDao pathDao=this.getWlPathDao();
		//WlPathManageableService srv = ServiceLocator.instance().getWlPathManageableService();
		//Collection pathVOs =srv.readAll();
		Collection pathVOs = pathDao.getAllPathvo();
	 	pathDao.toWlPathVOCollection(pathVOs);
		return  (WlPathVO[])pathVOs.toArray(new WlPathVO[0]);
	}

	@Override
	protected WlPathVO[] handleGetWlPath(WlPathVO WlPath, int pageNumber,int pageSize, String orderBy) throws Exception {
		WlPathDao dao=this.getWlPathDao();
		Collection WlPathDao = dao.getWlPath(WlPath, pageNumber, pageSize, orderBy);
    	dao.toWlPathVOCollection(WlPathDao);
        return  (WlPathVO[])WlPathDao.toArray(new WlPathVO[0]);    
	
	}

	@Override
	protected WlPlaceVO[] handleGetWlPlace(WlPlaceVO WlPlace, int pageNumber,int pageSize, String orderBy) throws Exception {
		WlPlaceDao dao=this.getWlPlaceDao();
		Collection WlPlaceDao = dao.getWlPlace(WlPlace, pageNumber, pageSize, orderBy);
    	dao.toWlPlaceVOCollection(WlPlaceDao);
        return  (WlPlaceVO[])WlPlaceDao.toArray(new WlPlaceVO[0]);    
	}

    
    
}
