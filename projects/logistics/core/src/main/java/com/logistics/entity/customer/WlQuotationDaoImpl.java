// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.entity.customer;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;

import com.logistics.entity.basic.NumberQuery;
import com.logistics.entity.orga.RoleOperate;
import com.logistics.util.QueryAssCriteria;

/**
 * @see com.logistics.entity.customer.WlQuotation
 */
public class WlQuotationDaoImpl
    extends com.logistics.entity.customer.WlQuotationDaoBase
{
    
    /**
     * @see com.logistics.entity.customer.WlQuotationDao#toWlQuotationVO(com.logistics.entity.customer.WlQuotation, com.logistics.entity.customer.WlQuotationVO)
     */
    public void toWlQuotationVO(
        com.logistics.entity.customer.WlQuotation source,
        com.logistics.entity.customer.WlQuotationVO target)
    {
        // @todo verify behavior of toWlQuotationVO
        super.toWlQuotationVO(source, target);
        //target.setContract(this.getWlContractDao().toWlContractVO(source.getContract()));
        target.setPath(this.getWlPathDao().toWlPathVO(source.getPath()));
        NumberQuery tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getBeginPrice());
        target.setBeginPrice(tempNum);
        tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getLowerLimit());
        target.setLowerLimit(tempNum);
        tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getUnitPrice());
        target.setUnitPrice(tempNum);
        tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getUpperLimit());
        target.setUpperLimit(tempNum);
       
    }


    /**
     * @see com.logistics.entity.customer.WlQuotationDao#toWlQuotationVO(com.logistics.entity.customer.WlQuotation)
     */
    public com.logistics.entity.customer.WlQuotationVO toWlQuotationVO(final com.logistics.entity.customer.WlQuotation entity)
    {
        // @todo verify behavior of toWlQuotationVO
        return super.toWlQuotationVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.customer.WlQuotation loadWlQuotationFromWlQuotationVO(com.logistics.entity.customer.WlQuotationVO wlQuotationVO)
    {
        // @todo implement loadWlQuotationFromWlQuotationVO
        //throw new java.lang.UnsupportedOperationException("com.logistics.entity.customer.loadWlQuotationFromWlQuotationVO(com.logistics.entity.customer.WlQuotationVO) not yet implemented.");

        /* A typical implementation looks like this:*/
        com.logistics.entity.customer.WlQuotation wlQuotation = this.load(wlQuotationVO.getId());
        if (wlQuotation == null)
        {
            wlQuotation = com.logistics.entity.customer.WlQuotation.Factory.newInstance();
        }
        return wlQuotation;
        
    }

    
    /**
     * @see com.logistics.entity.customer.WlQuotationDao#wlQuotationVOToEntity(com.logistics.entity.customer.WlQuotationVO)
     */
    public com.logistics.entity.customer.WlQuotation wlQuotationVOToEntity(com.logistics.entity.customer.WlQuotationVO wlQuotationVO)
    {
        // @todo verify behavior of wlQuotationVOToEntity
        com.logistics.entity.customer.WlQuotation entity = this.loadWlQuotationFromWlQuotationVO(wlQuotationVO);
        this.wlQuotationVOToEntity(wlQuotationVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.customer.WlQuotationDao#wlQuotationVOToEntity(com.logistics.entity.customer.WlQuotationVO, com.logistics.entity.customer.WlQuotation)
     */
    public void wlQuotationVOToEntity(
        com.logistics.entity.customer.WlQuotationVO source,
        com.logistics.entity.customer.WlQuotation target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wlQuotationVOToEntity
        super.wlQuotationVOToEntity(source, target, copyIfNull);
        if(source.getContract()!=null)target.setContract(this.getWlContractDao().load(source.getContract().getId()));
        if(source.getPath()!=null)target.setPath(this.getWlPathDao().load(source.getPath().getId()));
        if(source.getBeginPrice()!=null)target.setBeginPrice(source.getBeginPrice().getUpNumber());
        if(source.getLowerLimit()!=null)target.setLowerLimit(source.getLowerLimit().getUpNumber());
        if(source.getUnitPrice()!=null)target.setUnitPrice(source.getUnitPrice().getUpNumber());
        if(source.getUpperLimit()!=null)target.setUpperLimit(source.getUpperLimit().getUpNumber());
    }

    /**
     * @see com.logistics.entity.customer.WlQuotationDao#getQuotation()
     */
    protected List handleGetWlQuotation(WlQuotationVO WLQuotation,int pageNumber, int pageSize, String orderBy) throws Exception {
    	final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.customer.WlQuotationImpl.class);
            if (WLQuotation != null) QueryAssCriteria.getWlQuotationCriteria(WLQuotation,criteria);
             //条数
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
                    .uniqueResult())  
                    .intValue();//取得符合条件的总数  
      
		      criteria.setProjection(null);  
		      com.logistics.entity.customer.WlQuotation or=new com.logistics.entity.customer.WlQuotationImpl();
		     or.setId(new Long(totalCount));
		     //or.setRemark(new Integer(totalCount).toString());
		     if (pageNumber > 0 && pageSize > 0)
		     {
		     	criteria.setFirstResult(this.calculateFirstResult(pageNumber, pageSize));
		     	criteria.setMaxResults(pageSize);
		     }else{
		     	criteria.setMaxResults(100);
		     }
		     List re=criteria.list();
		     re.add(or);
		     return re;
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
	}
    
}