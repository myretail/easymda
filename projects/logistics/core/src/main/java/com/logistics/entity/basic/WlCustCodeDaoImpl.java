// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.entity.basic;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.MatchMode;

import com.logistics.entity.customer.WlCustomerDaoImpl;
import com.logistics.entity.customer.WlCustomerVO;

/**
 * @see com.logistics.entity.basic.WlCustCode
 */
public class WlCustCodeDaoImpl
    extends com.logistics.entity.basic.WlCustCodeDaoBase
{
    /**
     * @see com.logistics.entity.basic.WlCustCodeDao#getCodeByParCodeIDAndCustID(long, long)
     */
    protected java.util.List handleGetCodeByParCodeIDAndCustID(long codeid, long custid, int pageNumber, int pageSize, java.lang.String orderBy)
    {
    	 final Session session = getSession(false);

         try
         {
             final Criteria criteria = session.createCriteria(com.logistics.entity.basic.WlCustCodeImpl.class);
             
             //if(codeid!=0.0)
             criteria.add(Expression.eq("parCode", new java.lang.Long(codeid)));
             criteria.createCriteria("customer").add(Expression.eq("id", new java.lang.Long(custid)));
             if (pageNumber > 0 && pageSize > 0)
             {
                 criteria.setFirstResult(this.calculateFirstResult(pageNumber, pageSize));
                 criteria.setMaxResults(pageSize);
             }else{
            	 criteria.setMaxResults(100);
             }
             return criteria.list();
         }
         catch (org.hibernate.HibernateException ex)
         {
             throw super.convertHibernateAccessException(ex);
         }
    }

    /**
     * @see com.logistics.entity.basic.WlCustCodeDao#getCodeVO(com.logistics.entity.basic.WlCustCodeVO)
     */
    protected java.util.List handleGetCodeVO(com.logistics.entity.basic.WlCustCodeVO codevo, int pageNumber, int pageSize, java.lang.String orderBy)
    {
    	 final Session session = getSession(false);

         try
         {
             final Criteria criteria = session.createCriteria(com.logistics.entity.basic.WlCustCodeImpl.class);
             if (codevo.getParCode() != 0)
             criteria.add(Expression.eq("parCode", new java.lang.Long(codevo.getParCode())));
             if (codevo.getCode() != null)
                 criteria.add(Expression.ilike("code", codevo.getCode(), MatchMode.START));
             if (codevo.getSno() != null)
                 criteria.add(Expression.ilike("sno", codevo.getSno(), MatchMode.START));
             if (codevo.getName() != null)
                 criteria.add(Expression.ilike("name", codevo.getName(), MatchMode.START));
             if (codevo.getRemark() != null)
                 criteria.add(Expression.ilike("remark", codevo.getRemark(), MatchMode.START));
             System.out.println("handleGetCodeVO--customer===="+codevo.getCustomer());
             if (codevo.getId() != 0)criteria.add(Expression.eq("id", codevo.getId()));
             if (codevo.getCustomer() != null)criteria.createCriteria("customer").add(Expression.eq("id", codevo.getCustomer().getId()));
             
             if (pageNumber > 0 && pageSize > 0)
             {
                 criteria.setFirstResult(this.calculateFirstResult(pageNumber, pageSize));
                 criteria.setMaxResults(pageSize);
             }else{
            	 criteria.setMaxResults(100);
             }
             return criteria.list();
         }
         catch (org.hibernate.HibernateException ex)
         {
             throw super.convertHibernateAccessException(ex);
         }
    }

    /**
     * @see com.logistics.entity.basic.WlCustCodeDao#toWlCustCodeVO(com.logistics.entity.basic.WlCustCode, com.logistics.entity.basic.WlCustCodeVO)
     */
    public void toWlCustCodeVO(
        com.logistics.entity.basic.WlCustCode source,
        com.logistics.entity.basic.WlCustCodeVO target)
    {
        // @todo verify behavior of toWlCustCodeVO
        super.toWlCustCodeVO(source, target);
        target.setCustomer(this.getWlCustomerDao().toWlCustomerVO(source.getCustomer()));
        
    }


    /**
     * @see com.logistics.entity.basic.WlCustCodeDao#toWlCustCodeVO(com.logistics.entity.basic.WlCustCode)
     */
    public com.logistics.entity.basic.WlCustCodeVO toWlCustCodeVO(final com.logistics.entity.basic.WlCustCode entity)
    {
        // @todo verify behavior of toWlCustCodeVO
        return super.toWlCustCodeVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.basic.WlCustCode loadWlCustCodeFromWlCustCodeVO(com.logistics.entity.basic.WlCustCodeVO wlCustCodeVO)
    {
        
        /* A typical implementation looks like this:*/
        com.logistics.entity.basic.WlCustCode wlCustCode = this.load(wlCustCodeVO.getId());
        if (wlCustCode == null)
        {
            wlCustCode = com.logistics.entity.basic.WlCustCode.Factory.newInstance();
        }
        return wlCustCode;
        
    }

    
    /**
     * @see com.logistics.entity.basic.WlCustCodeDao#wlCustCodeVOToEntity(com.logistics.entity.basic.WlCustCodeVO)
     */
    public com.logistics.entity.basic.WlCustCode wlCustCodeVOToEntity(com.logistics.entity.basic.WlCustCodeVO wlCustCodeVO)
    {
        // @todo verify behavior of wlCustCodeVOToEntity
        com.logistics.entity.basic.WlCustCode entity = this.loadWlCustCodeFromWlCustCodeVO(wlCustCodeVO);
        this.wlCustCodeVOToEntity(wlCustCodeVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.basic.WlCustCodeDao#wlCustCodeVOToEntity(com.logistics.entity.basic.WlCustCodeVO, com.logistics.entity.basic.WlCustCode)
     */
    public void wlCustCodeVOToEntity(
        com.logistics.entity.basic.WlCustCodeVO source,
        com.logistics.entity.basic.WlCustCode target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wlCustCodeVOToEntity
        super.wlCustCodeVOToEntity(source, target, copyIfNull);
        if(source.getCustomer()!=null)target.setCustomer(this.getWlCustomerDao().load(source.getCustomer().getId()));
        
    }

	public WlCustCode wlCustomerVOToEntity(WlCustomerVO wlCustomerVO) {
		// TODO Auto-generated method stub
		return null;
	}

}