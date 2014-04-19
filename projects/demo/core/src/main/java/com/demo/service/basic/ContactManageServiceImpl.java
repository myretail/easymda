// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.demo.service.basic;
			import com.demo.entity.basic.Contact;
		import com.demo.entity.basic.ContactDao;
		import com.demo.entity.basic.ContactVO;
				
import java.util.Collection;
import java.util.Random;
import java.util.List;

/**
 * @see com.demo.service.basic.ContactManageService
 */
public class ContactManageServiceImpl
    extends com.demo.service.basic.ContactManageServiceBase
{

    /**
     * @see com.demo.service.basic.ContactManageService#createContact(com.demo.entity.basic.ContactVO)
     */
    protected long handleCreateContact(com.demo.entity.basic.ContactVO Contact)
		throws java.lang.Exception
    {
        // @todo implement public long createContact(com.demo.entity.basic.ContactVO Contact) createContact
			return this.getContactDao().create(this.getContactDao().contactVOToEntity(Contact)).getId();
	    }
	
    /**
     * @see com.demo.service.basic.ContactManageService#updateContact(com.demo.entity.basic.ContactVO)
     */
    protected void handleUpdateContact(com.demo.entity.basic.ContactVO Contact)
		throws java.lang.Exception
    {
        // @todo implement public void updateContact(com.demo.entity.basic.ContactVO Contact) updateContact
			Contact entity =this.getContactDao().load(Contact.getId());
    	this.getContactDao().contactVOToEntity(Contact, entity, false);
    	this.getContactDao().update(entity);
		
	    }
	
    /**
     * @see com.demo.service.basic.ContactManageService#deleteContact(long)
     */
    protected void handleDeleteContact(long id)
		throws java.lang.Exception
    {
        // @todo implement public void deleteContact(long id) deleteContact
			this.getContactDao().remove(id);
	    }
	
    /**
     * @see com.demo.service.basic.ContactManageService#getContact(com.demo.entity.basic.ContactVO, int, int, java.lang.String)
     */
    protected com.demo.entity.basic.ContactVO[] handleGetContact(com.demo.entity.basic.ContactVO Contact, int pageNumber, int pageSize, java.lang.String orderBy)
		throws java.lang.Exception
    {
        // @todo implement public com.demo.entity.basic.ContactVO[] getContact(com.demo.entity.basic.ContactVO Contact, int pageNumber, int pageSize, java.lang.String orderBy) getContact
			ContactDao infoDao=this.getContactDao();
	 	Collection infos = infoDao.getContact(Contact, pageNumber, pageSize, orderBy);
	 	return infoDao.toContactVOArray(infos);
	    }
	
}
