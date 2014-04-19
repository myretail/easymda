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
 * @see com.demo.entity.basic.Contact
 */
public class ContactDaoImpl
    extends com.demo.entity.basic.ContactDaoBase
{
    /**
     * @see com.demo.entity.basic.ContactDao#getContact(com.demo.entity.basic.ContactVO, int, int, java.lang.String)
     */
    protected java.util.List handleGetContact(com.demo.entity.basic.ContactVO Contact, int pageNumber, int pageSize, java.lang.String orderBy)
    {
        // @todo implement public java.util.List handleGetContact(com.demo.entity.basic.ContactVO Contact, int pageNumber, int pageSize, java.lang.String orderBy)
        final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.basic.ContactImpl.class);
            if (Contact != null) QueryAssCriteria.getContactCriteria(Contact,criteria);
            
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount()).uniqueResult()).intValue();
      
		      criteria.setProjection(null);  
		      Contact or=new com.demo.entity.basic.ContactImpl();
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
     * @see com.demo.entity.basic.ContactDao#toContactVO(com.demo.entity.basic.Contact, com.demo.entity.basic.ContactVO)
     */
    public void toContactVO(
        com.demo.entity.basic.Contact source,
        com.demo.entity.basic.ContactVO target)
    {
        // @todo verify behavior of toContactVO
        super.toContactVO(source, target);
        // WARNING! No conversion for target.customer (can't convert source.getCustomer():com.demo.entity.basic.Customer to com.demo.entity.basic.CustomerVO
			if(source.getCustomer()!=null)target.setCustomer(this.getCustomerDao().toCustomerVO(source.getCustomer()));
	    }


    /**
     * @see com.demo.entity.basic.ContactDao#toContactVO(com.demo.entity.basic.Contact)
     */
    public com.demo.entity.basic.ContactVO toContactVO(final com.demo.entity.basic.Contact entity)
    {
        // @todo verify behavior of toContactVO
        return super.toContactVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.demo.entity.basic.Contact loadContactFromContactVO(com.demo.entity.basic.ContactVO contactVO)
    {
        // @todo implement loadContactFromContactVO
        //throw new java.lang.UnsupportedOperationException("com.demo.entity.basic.loadContactFromContactVO(com.demo.entity.basic.ContactVO) not yet implemented.");

        /* A typical implementation looks like this:*/
        com.demo.entity.basic.Contact contact = this.load(contactVO.getId());
        if (contact == null)
        {
            contact = com.demo.entity.basic.Contact.Factory.newInstance();
        }
        return contact;
        
    }

    
    /**
     * @see com.demo.entity.basic.ContactDao#contactVOToEntity(com.demo.entity.basic.ContactVO)
     */
    public com.demo.entity.basic.Contact contactVOToEntity(com.demo.entity.basic.ContactVO contactVO)
    {
        // @todo verify behavior of contactVOToEntity
        com.demo.entity.basic.Contact entity = this.loadContactFromContactVO(contactVO);
        this.contactVOToEntity(contactVO, entity, true);
        return entity;
    }


    /**
     * @see com.demo.entity.basic.ContactDao#contactVOToEntity(com.demo.entity.basic.ContactVO, com.demo.entity.basic.Contact)
     */
    public void contactVOToEntity(
        com.demo.entity.basic.ContactVO source,
        com.demo.entity.basic.Contact target,
        boolean copyIfNull)
    {
        // @todo verify behavior of contactVOToEntity
        super.contactVOToEntity(source, target, copyIfNull);
        // No conversion for target.customer (can't convert source.getCustomer():com.demo.entity.basic.CustomerVO to com.demo.entity.basic.Customer
			if(source.getCustomer()!=null)target.setCustomer(this.getCustomerDao().load(source.getCustomer().getId()));
	    }

}