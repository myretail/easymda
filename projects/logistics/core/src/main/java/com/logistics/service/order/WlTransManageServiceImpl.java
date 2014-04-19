// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.service.order;

import java.util.Collection;

import com.logistics.entity.basic.WlPathDao;
import com.logistics.entity.basic.WlPathVO;
import com.logistics.entity.order.WlSteerRowDao;
import com.logistics.entity.order.WlSteerRowVO;

/**
 * @see com.logistics.service.order.WlTransManageService
 */
public class WlTransManageServiceImpl
    extends com.logistics.service.order.WlTransManageServiceBase
{

    /**
     * @see com.logistics.service.order.WlTransManageService#getWlAccident(com.logistics.entity.order.WlAccidentVO, int, int, java.lang.String)
     */
    protected  com.logistics.entity.order.WlAccidentVO[] handleGetWlAccident(com.logistics.entity.order.WlAccidentVO WlAccident, int pageNumber, int pageSize, java.lang.String orderBy)
        throws java.lang.Exception
    {
        // @todo implement protected  com.logistics.entity.order.WlAccidentVO[] handleGetWlAccident(com.logistics.entity.order.WlAccidentVO WlAccident, int pageNumber, int pageSize, java.lang.String orderBy)
        throw new java.lang.UnsupportedOperationException("com.logistics.service.order.WlTransManageService.handleGetWlAccident(com.logistics.entity.order.WlAccidentVO WlAccident, int pageNumber, int pageSize, java.lang.String orderBy) Not implemented!");
    }

    /**
     * @see com.logistics.service.order.WlTransManageService#createWlAccident(com.logistics.entity.order.WlAccidentVO)
     */
    protected  long handleCreateWlAccident(com.logistics.entity.order.WlAccidentVO WlAccident)
        throws java.lang.Exception
    {
        // @todo implement protected  long handleCreateWlAccident(com.logistics.entity.order.WlAccidentVO WlAccident)
        throw new java.lang.UnsupportedOperationException("com.logistics.service.order.WlTransManageService.handleCreateWlAccident(com.logistics.entity.order.WlAccidentVO WlAccident) Not implemented!");
    }

    /**
     * @see com.logistics.service.order.WlTransManageService#updateWlAccident(com.logistics.entity.order.WlAccidentVO)
     */
    protected  void handleUpdateWlAccident(com.logistics.entity.order.WlAccidentVO WlAccident)
        throws java.lang.Exception
    {
        // @todo implement protected  void handleUpdateWlAccident(com.logistics.entity.order.WlAccidentVO WlAccident)
        throw new java.lang.UnsupportedOperationException("com.logistics.service.order.WlTransManageService.handleUpdateWlAccident(com.logistics.entity.order.WlAccidentVO WlAccident) Not implemented!");
    }

    /**
     * @see com.logistics.service.order.WlTransManageService#deleteWlAccident(long)
     */
    protected  void handleDeleteWlAccident(long id)
        throws java.lang.Exception
    {
        // @todo implement protected  void handleDeleteWlAccident(long id)
        throw new java.lang.UnsupportedOperationException("com.logistics.service.order.WlTransManageService.handleDeleteWlAccident(long id) Not implemented!");
    }

    /**
     * @see com.logistics.service.order.WlTransManageService#getWlOpinion(com.logistics.entity.order.WlOpinionVO, int, int, java.lang.String)
     */
    protected  com.logistics.entity.order.WlOpinionVO[] handleGetWlOpinion(com.logistics.entity.order.WlOpinionVO WlOpinion, int pageNumber, int pageSize, java.lang.String orderBy)
        throws java.lang.Exception
    {
        // @todo implement protected  com.logistics.entity.order.WlOpinionVO[] handleGetWlOpinion(com.logistics.entity.order.WlOpinionVO WlOpinion, int pageNumber, int pageSize, java.lang.String orderBy)
        throw new java.lang.UnsupportedOperationException("com.logistics.service.order.WlTransManageService.handleGetWlOpinion(com.logistics.entity.order.WlOpinionVO WlOpinion, int pageNumber, int pageSize, java.lang.String orderBy) Not implemented!");
    }

    /**
     * @see com.logistics.service.order.WlTransManageService#createWlOpinion(com.logistics.entity.order.WlOpinionVO)
     */
    protected  long handleCreateWlOpinion(com.logistics.entity.order.WlOpinionVO WlOpinion)
        throws java.lang.Exception
    {
        // @todo implement protected  long handleCreateWlOpinion(com.logistics.entity.order.WlOpinionVO WlOpinion)
        throw new java.lang.UnsupportedOperationException("com.logistics.service.order.WlTransManageService.handleCreateWlOpinion(com.logistics.entity.order.WlOpinionVO WlOpinion) Not implemented!");
    }

    /**
     * @see com.logistics.service.order.WlTransManageService#updateWlOpinion(com.logistics.entity.order.WlOpinionVO)
     */
    protected  void handleUpdateWlOpinion(com.logistics.entity.order.WlOpinionVO WlOpinion)
        throws java.lang.Exception
    {
        // @todo implement protected  void handleUpdateWlOpinion(com.logistics.entity.order.WlOpinionVO WlOpinion)
        throw new java.lang.UnsupportedOperationException("com.logistics.service.order.WlTransManageService.handleUpdateWlOpinion(com.logistics.entity.order.WlOpinionVO WlOpinion) Not implemented!");
    }

    /**
     * @see com.logistics.service.order.WlTransManageService#deleteWlOpinion(long)
     */
    protected  void handleDeleteWlOpinion(long id)
        throws java.lang.Exception
    {
        // @todo implement protected  void handleDeleteWlOpinion(long id)
        throw new java.lang.UnsupportedOperationException("com.logistics.service.order.WlTransManageService.handleDeleteWlOpinion(long id) Not implemented!");
    }

	@Override
	protected long handleCreateWlSteerRow(WlSteerRowVO WlSteerRow)
			throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	protected void handleDeleteWlSteerRow(long id) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected WlSteerRowVO[] handleGetWlSteerRow(WlSteerRowVO WlSteerRow,
			int pageNumber, int pageSize, String orderBy) throws Exception {
		WlSteerRowDao dao=this.getWlSteerRowDao();
		Collection WlSteerRowDao = dao.getWlSteerRow(WlSteerRow, pageNumber, pageSize, orderBy);
    	dao.toWlSteerRowVOCollection(WlSteerRowDao);
        return  (WlSteerRowVO[])WlSteerRowDao.toArray(new WlSteerRowVO[0]);    
	}

	@Override
	protected void handleUpdateWlSteerRow(WlSteerRowVO WlSteerRow)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}