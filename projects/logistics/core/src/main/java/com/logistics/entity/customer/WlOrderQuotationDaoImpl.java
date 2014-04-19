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
import com.logistics.util.QueryAssCriteria;

/**
 * @see com.logistics.entity.customer.WlOrderQuotation
 */
public class WlOrderQuotationDaoImpl
    extends com.logistics.entity.customer.WlOrderQuotationDaoBase
{
    

    /**
     * @see com.logistics.entity.customer.WlOrderQuotationDao#toWlOrderQuotationVO(com.logistics.entity.customer.WlOrderQuotation, com.logistics.entity.customer.WlOrderQuotationVO)
     */
    public void toWlOrderQuotationVO(
        com.logistics.entity.customer.WlOrderQuotation source,
        com.logistics.entity.customer.WlOrderQuotationVO target)
    {
        // @todo verify behavior of toWlOrderQuotationVO
        super.toWlOrderQuotationVO(source, target);
        //target.setContract(this.getWlContractDao().toWlContractVO(source.getContract()));
        //target.setOrderRow(this.getWlOrderRowDao().toWlOrderRowVO(source.getOrderRow()));
        NumberQuery tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getSum());
        target.setSum(tempNum);
    }


    /**
     * @see com.logistics.entity.customer.WlOrderQuotationDao#toWlOrderQuotationVO(com.logistics.entity.customer.WlOrderQuotation)
     */
    public com.logistics.entity.customer.WlOrderQuotationVO toWlOrderQuotationVO(final com.logistics.entity.customer.WlOrderQuotation entity)
    {
        // @todo verify behavior of toWlOrderQuotationVO
        return super.toWlOrderQuotationVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.customer.WlOrderQuotation loadWlOrderQuotationFromWlOrderQuotationVO(com.logistics.entity.customer.WlOrderQuotationVO wlOrderQuotationVO)
    {
        // @todo implement loadWlOrderQuotationFromWlOrderQuotationVO
       // throw new java.lang.UnsupportedOperationException("com.logistics.entity.customer.loadWlOrderQuotationFromWlOrderQuotationVO(com.logistics.entity.customer.WlOrderQuotationVO) not yet implemented.");

        /* A typical implementation looks like this: */
        com.logistics.entity.customer.WlOrderQuotation wlOrderQuotation = this.load(wlOrderQuotationVO.getId());
        if (wlOrderQuotation == null)
        {
            wlOrderQuotation = com.logistics.entity.customer.WlOrderQuotation.Factory.newInstance();
        }
        return wlOrderQuotation;
       
    }

    
    /**
     * @see com.logistics.entity.customer.WlOrderQuotationDao#wlOrderQuotationVOToEntity(com.logistics.entity.customer.WlOrderQuotationVO)
     */
    public com.logistics.entity.customer.WlOrderQuotation wlOrderQuotationVOToEntity(com.logistics.entity.customer.WlOrderQuotationVO wlOrderQuotationVO)
    {
        // @todo verify behavior of wlOrderQuotationVOToEntity
        com.logistics.entity.customer.WlOrderQuotation entity = this.loadWlOrderQuotationFromWlOrderQuotationVO(wlOrderQuotationVO);
        this.wlOrderQuotationVOToEntity(wlOrderQuotationVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.customer.WlOrderQuotationDao#wlOrderQuotationVOToEntity(com.logistics.entity.customer.WlOrderQuotationVO, com.logistics.entity.customer.WlOrderQuotation)
     */
    public void wlOrderQuotationVOToEntity(
        com.logistics.entity.customer.WlOrderQuotationVO source,
        com.logistics.entity.customer.WlOrderQuotation target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wlOrderQuotationVOToEntity
        super.wlOrderQuotationVOToEntity(source, target, copyIfNull);
        //target.setContract(this.getWlContractDao().load(source.getContract().getId()));
        //target.setOrderRow(this.getWlOrderRowDao().load(source.getOrderRow().getId()));
        if(source.getSum()!=null)target.setSum(source.getSum().getUpNumber());
    }

    /**
     * @see com.logistics.entity.customer.WlOrderQuotationDao#getOrderQuotation()
     */
    protected List handleGetWlOrderQuotation(WlOrderQuotationVO WLOrderQuotation, int pageNumber, int pageSize,String orderBy) throws Exception {
    	final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.customer.WlOrderQuotationImpl.class);
            if (WLOrderQuotation != null) QueryAssCriteria.getWLOrderQuotationCriteria(WLOrderQuotation,criteria);
             //条数
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
                    .uniqueResult())  
                    .intValue();//取得符合条件的总数  
      
		      criteria.setProjection(null);  
		      com.logistics.entity.customer.WlOrderQuotation or=new com.logistics.entity.customer.WlOrderQuotationImpl();
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