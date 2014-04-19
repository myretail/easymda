// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.demo.service.basic;
			import com.demo.entity.basic.Customer;
		import com.demo.entity.basic.CustomerDao;
		import com.demo.entity.basic.CustomerVO;
				
import java.util.Collection;
import java.util.Random;
import java.util.List;

/**
 * @see com.demo.service.basic.CustomerManageService
 */
public class CustomerManageServiceImpl
    extends com.demo.service.basic.CustomerManageServiceBase
{

    /**
     * @see com.demo.service.basic.CustomerManageService#createCustomer(com.demo.entity.basic.CustomerVO)
     */
    protected long handleCreateCustomer(com.demo.entity.basic.CustomerVO Customer)
		throws java.lang.Exception
    {
        // @todo implement public long createCustomer(com.demo.entity.basic.CustomerVO Customer) createCustomer
			return this.getCustomerDao().create(this.getCustomerDao().customerVOToEntity(Customer)).getId();
	    }
	
    /**
     * @see com.demo.service.basic.CustomerManageService#updateCustomer(com.demo.entity.basic.CustomerVO)
     */
    protected void handleUpdateCustomer(com.demo.entity.basic.CustomerVO Customer)
		throws java.lang.Exception
    {
        // @todo implement public void updateCustomer(com.demo.entity.basic.CustomerVO Customer) updateCustomer
			Customer entity =this.getCustomerDao().load(Customer.getId());
    	this.getCustomerDao().customerVOToEntity(Customer, entity, false);
    	this.getCustomerDao().update(entity);
		
	    }
	
    /**
     * @see com.demo.service.basic.CustomerManageService#deleteCustomer(long)
     */
    protected void handleDeleteCustomer(long id)
		throws java.lang.Exception
    {
        // @todo implement public void deleteCustomer(long id) deleteCustomer
			this.getCustomerDao().remove(id);
	    }
	
    /**
     * @see com.demo.service.basic.CustomerManageService#getCustomer(com.demo.entity.basic.CustomerVO, int, int, java.lang.String)
     */
    protected com.demo.entity.basic.CustomerVO[] handleGetCustomer(com.demo.entity.basic.CustomerVO Customer, int pageNumber, int pageSize, java.lang.String orderBy)
		throws java.lang.Exception
    {
        // @todo implement public com.demo.entity.basic.CustomerVO[] getCustomer(com.demo.entity.basic.CustomerVO Customer, int pageNumber, int pageSize, java.lang.String orderBy) getCustomer
			CustomerDao infoDao=this.getCustomerDao();
	 	Collection infos = infoDao.getCustomer(Customer, pageNumber, pageSize, orderBy);
	 	return infoDao.toCustomerVOArray(infos);
	    }
	
}
