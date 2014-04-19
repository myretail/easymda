// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.service.customer;

import java.util.Collection;

import com.logistics.entity.basic.EnumerationDao;
import com.logistics.entity.basic.EnumerationVO;
import com.logistics.entity.customer.WlContractDao;
import com.logistics.entity.customer.WlContractVO;
import com.logistics.entity.customer.WlCustomerDao;
import com.logistics.entity.customer.WlCustomerVO;
import com.logistics.entity.customer.WlOrderQuotationDao;
import com.logistics.entity.customer.WlOrderQuotationVO;
import com.logistics.entity.customer.WlQuotationDao;
import com.logistics.entity.customer.WlQuotationVO;
import com.logistics.entity.orga.RoleOperateDao;

/**
 * @see com.logistics.service.customer.CustomerManageService
 */
public class CustomerManageServiceImpl
    extends com.logistics.service.customer.CustomerManageServiceBase
{

    /**
     * @see com.logistics.service.customer.CustomerManageService#getCustomerVO(java.lang.String, long, long, java.lang.String, java.lang.String, java.lang.String, long)
     */
    protected  com.logistics.entity.customer.WlCustomerVO[] handleGetCustomerVO(java.lang.String customerName, long address, long parentCustomerID, java.lang.String customerStatus, java.lang.String customerSort, java.lang.String relation, long id)
        throws java.lang.Exception
    {
        // @todo implement protected  com.logistics.entity.customer.WlCustomerVO[] handleGetCustomerVO(java.lang.String customerName, long address, long parentCustomerID, java.lang.String customerStatus, java.lang.String customerSort, java.lang.String relation, long id)
        throw new java.lang.UnsupportedOperationException("com.logistics.service.customer.CustomerManageService.handleGetCustomerVO(java.lang.String customerName, long address, long parentCustomerID, java.lang.String customerStatus, java.lang.String customerSort, java.lang.String relation, long id) Not implemented!");
    }

    /**
     * @see com.logistics.service.customer.CustomerManageService#createCustomer(com.logistics.entity.customer.WlCustomerVO)
     */
    protected  long handleCreateWlCustomer(com.logistics.entity.customer.WlCustomerVO customer)
        throws java.lang.Exception
    {
    	return this.getWlCustomerDao().create(this.getWlCustomerDao().wlCustomerVOToEntity(customer)).getId();
    }

    /**
     * @see com.logistics.service.customer.CustomerManageService#updateCustomer(com.logistics.entity.customer.WlCustomerVO)
     */
    protected  void handleUpdateWlCustomer(com.logistics.entity.customer.WlCustomerVO customer)
        throws java.lang.Exception
    {
    	this.getWlCustomerDao().update(this.getWlCustomerDao().wlCustomerVOToEntity(customer));
    }

    /**
     * @see com.logistics.service.customer.CustomerManageService#deleteCustomer(long)
     */
    protected  void handleDeleteWlCustomer(long id)
        throws java.lang.Exception
    {
    	this.getWlCustomerDao().remove(id);
    }

    /**
     * @see com.logistics.service.customer.CustomerManageService#getContractVO(long, java.lang.String, java.lang.String, long, java.util.Date, java.util.Date, java.util.Date, java.lang.String, java.lang.String, long, java.util.Date, java.lang.String, java.lang.String, long)
     */
    protected  com.logistics.entity.customer.WlContractVO[] handleGetContractVO(long customerId, java.lang.String no, java.lang.String status, long dep, java.util.Date fillDAte, java.util.Date startDate, java.util.Date endDate, java.lang.String contractType, java.lang.String contRelation, long orderCode, java.util.Date checkDate, java.lang.String insurance, java.lang.String remark, long id)
        throws java.lang.Exception
    {
        // @todo implement protected  com.logistics.entity.customer.WlContractVO[] handleGetContractVO(long customerId, java.lang.String no, java.lang.String status, long dep, java.util.Date fillDAte, java.util.Date startDate, java.util.Date endDate, java.lang.String contractType, java.lang.String contRelation, long orderCode, java.util.Date checkDate, java.lang.String insurance, java.lang.String remark, long id)
        throw new java.lang.UnsupportedOperationException("com.logistics.service.customer.CustomerManageService.handleGetContractVO(long customerId, java.lang.String no, java.lang.String status, long dep, java.util.Date fillDAte, java.util.Date startDate, java.util.Date endDate, java.lang.String contractType, java.lang.String contRelation, long orderCode, java.util.Date checkDate, java.lang.String insurance, java.lang.String remark, long id) Not implemented!");
    }

    /**
     * @see com.logistics.service.customer.CustomerManageService#createContract(com.logistics.entity.customer.WlContractVO)
     */
    protected  long handleCreateWlContract(com.logistics.entity.customer.WlContractVO contract)
        throws java.lang.Exception
    {
    	return this.getWlContractDao().create(this.getWlContractDao().wlContractVOToEntity(contract)).getId();
    }

    /**
     * @see com.logistics.service.customer.CustomerManageService#updateContract(com.logistics.entity.customer.WlContractVO)
     */
    protected  void handleUpdateWlContract(com.logistics.entity.customer.WlContractVO contract)
        throws java.lang.Exception
    {
    	this.getWlContractDao().update(this.getWlContractDao().wlContractVOToEntity(contract));
    }

    /**
     * @see com.logistics.service.customer.CustomerManageService#deleteContract(long)
     */
    protected  void handleDeleteWlContract(long id)
        throws java.lang.Exception
    {
    	this.getWlContractDao().remove(id);
    }

    /**
     * @see com.logistics.service.customer.CustomerManageService#getQuotation(long)
     */
    protected  com.logistics.entity.customer.WlQuotationVO[] handleGetWlQuotation(WlQuotationVO WlQuotation,int pageNumber, int pageSize, String orderBy) throws Exception 
    {
    	WlQuotationDao infoDao=this.getWlQuotationDao();
	 	Collection infos = infoDao.getWlQuotation(WlQuotation, pageNumber, pageSize, orderBy);
	 	return infoDao.toWlQuotationVOArray(infos);
    }

    /**
     * @see com.logistics.service.customer.CustomerManageService#createQuotation(com.logistics.entity.customer.WlQuotationVO)
     */
    protected  long handleCreateWlQuotation(com.logistics.entity.customer.WlQuotationVO quotation)
        throws java.lang.Exception
    {
    	return this.getWlQuotationDao().create(this.getWlQuotationDao().wlQuotationVOToEntity(quotation)).getId();
    }

    /**
     * @see com.logistics.service.customer.CustomerManageService#updateQuotation(com.logistics.entity.customer.WlQuotationVO)
     */
    protected  void handleUpdateWlQuotation(com.logistics.entity.customer.WlQuotationVO quotation)
        throws java.lang.Exception
    {
    	this.getWlQuotationDao().update(this.getWlQuotationDao().wlQuotationVOToEntity(quotation));
    }

    /**
     * @see com.logistics.service.customer.CustomerManageService#deleteQuotation(long)
     */
    protected  void handleDeleteWlQuotation(long id)
        throws java.lang.Exception
    {
    	this.getWlQuotationDao().remove(id);
    }

    /**
     * @see com.logistics.service.customer.CustomerManageService#getOrderQuotation(long, java.lang.String, java.lang.String)
     */
    protected  com.logistics.entity.customer.WlOrderQuotationVO[] handleGetWlOrderQuotation(WlOrderQuotationVO WlOrderQuotation, int pageNumber, int pageSize,String orderBy) throws Exception 
    {
    	WlOrderQuotationDao infoDao=this.getWlOrderQuotationDao();
	 	Collection infos = infoDao.getWlOrderQuotation(WlOrderQuotation, pageNumber, pageSize, orderBy);
	 	return infoDao.toWlOrderQuotationVOArray(infos); 
    }

    /**
     * @see com.logistics.service.customer.CustomerManageService#createOrderQuotation(com.logistics.entity.customer.WlOrderQuotationVO)
     */
    protected  long handleCreateWlOrderQuotation(com.logistics.entity.customer.WlOrderQuotationVO orderQuotation)
        throws java.lang.Exception
    {
    	return this.getWlOrderQuotationDao().create(this.getWlOrderQuotationDao().wlOrderQuotationVOToEntity(orderQuotation)).getId();
    }

    /**
     * @see com.logistics.service.customer.CustomerManageService#updateOrderQuotation(com.logistics.entity.customer.WlOrderQuotationVO)
     */
    protected  void handleUpdateWlOrderQuotation(com.logistics.entity.customer.WlOrderQuotationVO orderQuotation)
        throws java.lang.Exception
    {
    	this.getWlOrderQuotationDao().update(this.getWlOrderQuotationDao().wlOrderQuotationVOToEntity(orderQuotation));
    }

    /**
     * @see com.logistics.service.customer.CustomerManageService#deleteOrderQuotation(long)
     */
    protected  void handleDeleteWlOrderQuotation(long id)  throws java.lang.Exception
    {
    	this.getWlOrderQuotationDao().remove(id);
    }

	protected WlCustomerVO[] handleGetWlCustomerByStatusAndSort(java.lang.String status, java.lang.String sort, int pageNumber, int pageSize, java.lang.String orderBys) throws Exception {
		WlCustomerDao custDao=this.getWlCustomerDao();
 	    Collection customerVOs = custDao.getWlCustomerByStatusAndSort(status,sort,pageNumber,pageSize,orderBys);
 	   custDao.toWlCustomerVOCollection(customerVOs);
        return  (WlCustomerVO[])customerVOs.toArray(new WlCustomerVO[0]);
	}

	
	protected WlContractVO[] handleGetWlContract(WlContractVO WlContract,int pageNumber, int pageSize, String orderBy) throws Exception {
		WlContractDao infoDao=this.getWlContractDao();
	 	Collection infos = infoDao.getWlContract(WlContract, pageNumber, pageSize, orderBy);
	 	return infoDao.toWlContractVOArray(infos); 
	}

	protected WlCustomerVO[] handleGetWlCustomer(WlCustomerVO WlCustomer,int pageNumber, int pageSize, String orderBy) throws Exception {
		WlCustomerDao infoDao=this.getWlCustomerDao();
	 	Collection infos = infoDao.getWlCustomer(WlCustomer, pageNumber, pageSize, orderBy);
	 	return infoDao.toWlCustomerVOArray(infos);
	}

	

}