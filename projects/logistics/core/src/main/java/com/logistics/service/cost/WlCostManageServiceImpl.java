// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.service.cost;

import java.util.Collection;

import com.logistics.entity.cost.WlCarryCostDao;
import com.logistics.entity.cost.WlFeeListDao;
import com.logistics.entity.cost.WlFeeRowDao;
import com.logistics.entity.cost.WlLoanDao;
import com.logistics.entity.cost.WlPeopleCostDao;
import com.logistics.entity.cost.WlTaskRowCostDao;
import com.logistics.entity.customer.WlCustomerDao;

/**
 * @see com.logistics.service.cost.WlCostManageService
 */
public class WlCostManageServiceImpl
    extends com.logistics.service.cost.WlCostManageServiceBase
{

    /**
     * @see com.logistics.service.cost.WlCostManageService#getWlFeeList(com.logistics.entity.cost.WlFeeListVO, int, int, java.lang.String)
     */
    protected  com.logistics.entity.cost.WlFeeListVO[] handleGetWlFeeList(com.logistics.entity.cost.WlFeeListVO WlFeeList, int pageNumber, int pageSize, java.lang.String orderBy)
        throws java.lang.Exception
    {
    	WlFeeListDao infoDao=this.getWlFeeListDao();
	 	Collection infos = infoDao.getWlFeeList(WlFeeList, pageNumber, pageSize, orderBy);
	 	return infoDao.toWlFeeListVOArray(infos);
    }

    /**
     * @see com.logistics.service.cost.WlCostManageService#createWlFeeList(com.logistics.entity.cost.WlFeeListVO)
     */
    protected  long handleCreateWlFeeList(com.logistics.entity.cost.WlFeeListVO WlFeeList)
        throws java.lang.Exception
    {
    	return this.getWlFeeListDao().create(this.getWlFeeListDao().wlFeeListVOToEntity(WlFeeList)).getId();
}

    /**
     * @see com.logistics.service.cost.WlCostManageService#updateWlFeeList(com.logistics.entity.cost.WlFeeListVO)
     */
    protected  void handleUpdateWlFeeList(com.logistics.entity.cost.WlFeeListVO WlFeeList)
        throws java.lang.Exception
    {
    	this.getWlFeeListDao().update(this.getWlFeeListDao().wlFeeListVOToEntity(WlFeeList));
    }

    /**
     * @see com.logistics.service.cost.WlCostManageService#deleteWlFeeList(long)
     */
    protected  void handleDeleteWlFeeList(long id)
        throws java.lang.Exception
    {
    	this.getWlFeeListDao().remove(id);
    }

    /**
     * @see com.logistics.service.cost.WlCostManageService#getWlFeeRow(com.logistics.entity.cost.WlFeeRowVO, int, int, java.lang.String)
     */
    protected  com.logistics.entity.cost.WlFeeRowVO[] handleGetWlFeeRow(com.logistics.entity.cost.WlFeeRowVO WlFeeRow, int pageNumber, int pageSize, java.lang.String orderBy)
        throws java.lang.Exception
    {
    	WlFeeRowDao infoDao=this.getWlFeeRowDao();
	 	Collection infos = infoDao.getWlFeeRow(WlFeeRow, pageNumber, pageSize, orderBy);
	 	return infoDao.toWlFeeRowVOArray(infos);
    }

    /**
     * @see com.logistics.service.cost.WlCostManageService#createWlFeeRow(com.logistics.entity.cost.WlFeeRowVO)
     */
    protected  long handleCreateWlFeeRow(com.logistics.entity.cost.WlFeeRowVO WlFeeRow)
        throws java.lang.Exception
    {
    	return this.getWlFeeRowDao().create(this.getWlFeeRowDao().wlFeeRowVOToEntity(WlFeeRow)).getId();
    }

    /**
     * @see com.logistics.service.cost.WlCostManageService#updateWlFeeRow(com.logistics.entity.cost.WlFeeRowVO)
     */
    protected  void handleUpdateWlFeeRow(com.logistics.entity.cost.WlFeeRowVO WlFeeRow)
        throws java.lang.Exception
    {
    	this.getWlFeeRowDao().update(this.getWlFeeRowDao().wlFeeRowVOToEntity(WlFeeRow));
    }

    /**
     * @see com.logistics.service.cost.WlCostManageService#deleteWlFeeRow(long)
     */
    protected  void handleDeleteWlFeeRow(long id)
        throws java.lang.Exception
    {
    	this.getWlFeeRowDao().remove(id);
    }

    /**
     * @see com.logistics.service.cost.WlCostManageService#getWlTaskRowCost(com.logistics.entity.cost.WlTaskRowCostVO, int, int, java.lang.String)
     */
    protected  com.logistics.entity.cost.WlTaskRowCostVO[] handleGetWlTaskRowCost(com.logistics.entity.cost.WlTaskRowCostVO WlTaskRowCost, int pageNumber, int pageSize, java.lang.String orderBy)
        throws java.lang.Exception
    {
    	WlTaskRowCostDao infoDao=this.getWlTaskRowCostDao();
	 	Collection infos = infoDao.getWlTaskRowCost(WlTaskRowCost, pageNumber, pageSize, orderBy);
	 	return infoDao.toWlTaskRowCostVOArray(infos);
    }

    /**
     * @see com.logistics.service.cost.WlCostManageService#createWlTaskRowCost(com.logistics.entity.cost.WlTaskRowCostVO)
     */
    protected  long handleCreateWlTaskRowCost(com.logistics.entity.cost.WlTaskRowCostVO WlTaskRowCost)
        throws java.lang.Exception
    {
    	return this.getWlTaskRowCostDao().create(this.getWlTaskRowCostDao().wlTaskRowCostVOToEntity(WlTaskRowCost)).getId();
    }

    /**
     * @see com.logistics.service.cost.WlCostManageService#updateWlTaskRowCost(com.logistics.entity.cost.WlTaskRowCostVO)
     */
    protected  void handleUpdateWlTaskRowCost(com.logistics.entity.cost.WlTaskRowCostVO WlTaskRowCost)
        throws java.lang.Exception
    {
    	this.getWlTaskRowCostDao().update(this.getWlTaskRowCostDao().wlTaskRowCostVOToEntity(WlTaskRowCost));
    }

    /**
     * @see com.logistics.service.cost.WlCostManageService#deleteWlTaskRowCost(long)
     */
    protected  void handleDeleteWlTaskRowCost(long id)
        throws java.lang.Exception
    {
    	this.getWlTaskRowCostDao().remove(id);
    	}

    /**
     * @see com.logistics.service.cost.WlCostManageService#getWlCarryCost(com.logistics.entity.cost.WlCarryCostVO, int, int, java.lang.String)
     */
    protected  com.logistics.entity.cost.WlCarryCostVO[] handleGetWlCarryCost(com.logistics.entity.cost.WlCarryCostVO WlCarryCost, int pageNumber, int pageSize, java.lang.String orderBy)
        throws java.lang.Exception
    {
    	WlCarryCostDao infoDao=this.getWlCarryCostDao();
	 	Collection infos = infoDao.getWlCarryCost(WlCarryCost, pageNumber, pageSize, orderBy);
	 	return infoDao.toWlCarryCostVOArray(infos);
    }

    /**
     * @see com.logistics.service.cost.WlCostManageService#createWlCarryCost(com.logistics.entity.cost.WlCarryCostVO)
     */
    protected  long handleCreateWlCarryCost(com.logistics.entity.cost.WlCarryCostVO WlCarryCost)
        throws java.lang.Exception
    {
    	return this.getWlCarryCostDao().create(this.getWlCarryCostDao().wlCarryCostVOToEntity(WlCarryCost)).getId();
    }

    /**
     * @see com.logistics.service.cost.WlCostManageService#updateWlCarryCost(com.logistics.entity.cost.WlCarryCostVO)
     */
    protected  void handleUpdateWlCarryCost(com.logistics.entity.cost.WlCarryCostVO WlCarryCost)
        throws java.lang.Exception
    {
    	this.getWlCarryCostDao().update(this.getWlCarryCostDao().wlCarryCostVOToEntity(WlCarryCost));
    	}

    /**
     * @see com.logistics.service.cost.WlCostManageService#deleteWlCarryCost(long)
     */
    protected  void handleDeleteWlCarryCost(long id)
        throws java.lang.Exception
    {
    	this.getWlCarryCostDao().remove(id);
    }

    /**
     * @see com.logistics.service.cost.WlCostManageService#getWlPeopleCost(com.logistics.entity.cost.WlPeopleCostVO, int, int, java.lang.String)
     */
    protected  com.logistics.entity.cost.WlPeopleCostVO[] handleGetWlPeopleCost(com.logistics.entity.cost.WlPeopleCostVO WlPeopleCost, int pageNumber, int pageSize, java.lang.String orderBy)
        throws java.lang.Exception
    {
    	WlPeopleCostDao infoDao=this.getWlPeopleCostDao();
	 	Collection infos = infoDao.getWlPeopleCost(WlPeopleCost, pageNumber, pageSize, orderBy);
	 	return infoDao.toWlPeopleCostVOArray(infos);
    }

    /**
     * @see com.logistics.service.cost.WlCostManageService#createWlPeopleCost(com.logistics.entity.cost.WlPeopleCostVO)
     */
    protected  long handleCreateWlPeopleCost(com.logistics.entity.cost.WlPeopleCostVO WlPeopleCost)
        throws java.lang.Exception
    {
    	return this.getWlPeopleCostDao().create(this.getWlPeopleCostDao().wlPeopleCostVOToEntity(WlPeopleCost)).getId();
    }

    /**
     * @see com.logistics.service.cost.WlCostManageService#updateWlPeopleCost(com.logistics.entity.cost.WlPeopleCostVO)
     */
    protected  void handleUpdateWlPeopleCost(com.logistics.entity.cost.WlPeopleCostVO WlPeopleCost)
        throws java.lang.Exception
    {
    	this.getWlPeopleCostDao().update(this.getWlPeopleCostDao().wlPeopleCostVOToEntity(WlPeopleCost));
    }

    /**
     * @see com.logistics.service.cost.WlCostManageService#deleteWlPeopleCost(long)
     */
    protected  void handleDeleteWlPeopleCost(long id)
        throws java.lang.Exception
    {
    	this.getWlPeopleCostDao().remove(id);
    }

    /**
     * @see com.logistics.service.cost.WlCostManageService#getWlLoan(com.logistics.entity.cost.WlLoanVO, int, int, java.lang.String)
     */
    protected  com.logistics.entity.cost.WlLoanVO[] handleGetWlLoan(com.logistics.entity.cost.WlLoanVO WlLoan, int pageNumber, int pageSize, java.lang.String orderBy)
        throws java.lang.Exception
    {
    	WlLoanDao infoDao=this.getWlLoanDao();
	 	Collection infos = infoDao.getWlLoan(WlLoan, pageNumber, pageSize, orderBy);
	 	return infoDao.toWlLoanVOArray(infos);
    }

    /**
     * @see com.logistics.service.cost.WlCostManageService#createWlLoan(com.logistics.entity.cost.WlLoanVO)
     */
    protected  long handleCreateWlLoan(com.logistics.entity.cost.WlLoanVO WlLoan)
        throws java.lang.Exception
    {
    	return this.getWlLoanDao().create(this.getWlLoanDao().wlLoanVOToEntity(WlLoan)).getId();
    }

    /**
     * @see com.logistics.service.cost.WlCostManageService#updateWlLoan(com.logistics.entity.cost.WlLoanVO)
     */
    protected  void handleUpdateWlLoan(com.logistics.entity.cost.WlLoanVO WlLoan)
        throws java.lang.Exception
    {
    	this.getWlLoanDao().update(this.getWlLoanDao().wlLoanVOToEntity(WlLoan));
    }

    /**
     * @see com.logistics.service.cost.WlCostManageService#deleteWlLoan(long)
     */
    protected  void handleDeleteWlLoan(long id)
        throws java.lang.Exception
    {
    	this.getWlLoanDao().remove(id);
    }

}