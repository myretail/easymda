// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */

package com.demo.entity.basic;

import com.demo.entity.basic.NumberQuery;
import com.demo.entity.basic.DateTimeQuery;
import com.demo.util.ProjectUtil;
import com.demo.util.QueryAssCriteria;                                                             
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;
/**
 * @see com.demo.entity.basic.Customer
 */
public class CustomerDaoImpl
    extends com.demo.entity.basic.CustomerDaoBase
{
    /**
     * @see com.demo.entity.basic.CustomerDao#getCustomer(com.demo.entity.basic.CustomerVO, int, int, java.lang.String)
     */
    protected java.util.List handleGetCustomer(com.demo.entity.basic.CustomerVO Customer, int pageNumber, int pageSize, java.lang.String orderBy)
    {
        // @todo implement public java.util.List handleGetCustomer(com.demo.entity.basic.CustomerVO Customer, int pageNumber, int pageSize, java.lang.String orderBy)
        final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.basic.CustomerImpl.class);
            
            if (Customer != null) QueryAssCriteria.getCustomerCriteria(Customer,criteria);
            
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount()).uniqueResult()).intValue();
      
		      criteria.setProjection(null);  
		      Customer or=new com.demo.entity.basic.CustomerImpl();
		     or.setId(new Long(totalCount));
		     //or.setRemark(new Integer(totalCount).toString());
		     if (pageNumber > 0 && pageSize > 0)
		     {
		     	criteria.setFirstResult(this.calculateFirstResult(pageNumber, pageSize));
		     	criteria.setMaxResults(pageSize);
		     }else{
		     	criteria.setMaxResults(100);
		     }
		     java.util.List re = criteria.list();
		     re.add(or);
		     return re;
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }

        

}

//end foreach
    /**
     * @see com.demo.entity.basic.CustomerDao#toCustomerVO(com.demo.entity.basic.Customer, com.demo.entity.basic.CustomerVO)
     */
    public void toCustomerVO(
        com.demo.entity.basic.Customer source,
        com.demo.entity.basic.CustomerVO target)
    {
        // @todo verify behavior of toCustomerVO
        super.toCustomerVO(source, target);
    }


    /**
     * @see com.demo.entity.basic.CustomerDao#toCustomerVO(com.demo.entity.basic.Customer)
     */
    public com.demo.entity.basic.CustomerVO toCustomerVO(final com.demo.entity.basic.Customer entity)
    {
        // @todo verify behavior of toCustomerVO
        return super.toCustomerVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.demo.entity.basic.Customer loadCustomerFromCustomerVO(com.demo.entity.basic.CustomerVO customerVO)
    {
        // @todo implement loadCustomerFromCustomerVO
        //throw new java.lang.UnsupportedOperationException("com.demo.entity.basic.loadCustomerFromCustomerVO(com.demo.entity.basic.CustomerVO) not yet implemented.");

        /* A typical implementation looks like this:*/
        com.demo.entity.basic.Customer customer = this.load(customerVO.getId());
        if (customer == null)
        {
            customer = com.demo.entity.basic.Customer.Factory.newInstance();
        }
        return customer;
        
    }

    
    /**
     * @see com.demo.entity.basic.CustomerDao#customerVOToEntity(com.demo.entity.basic.CustomerVO)
     */
    public com.demo.entity.basic.Customer customerVOToEntity(com.demo.entity.basic.CustomerVO customerVO)
    {
        // @todo verify behavior of customerVOToEntity
        com.demo.entity.basic.Customer entity = this.loadCustomerFromCustomerVO(customerVO);
        this.customerVOToEntity(customerVO, entity, true);
        return entity;
    }


    /**
     * @see com.demo.entity.basic.CustomerDao#customerVOToEntity(com.demo.entity.basic.CustomerVO, com.demo.entity.basic.Customer)
     */
    public void customerVOToEntity(
        com.demo.entity.basic.CustomerVO source,
        com.demo.entity.basic.Customer target,
        boolean copyIfNull)
    {
        // @todo verify behavior of customerVOToEntity
        super.customerVOToEntity(source, target, copyIfNull);
    }

}