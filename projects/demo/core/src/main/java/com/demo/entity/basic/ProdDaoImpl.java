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
 * @see com.demo.entity.basic.Prod
 */
public class ProdDaoImpl
    extends com.demo.entity.basic.ProdDaoBase
{
    /**
     * @see com.demo.entity.basic.ProdDao#getProd(com.demo.entity.basic.ProdVO, int, int, java.lang.String)
     */
    protected java.util.List handleGetProd(com.demo.entity.basic.ProdVO Prod, int pageNumber, int pageSize, java.lang.String orderBy)
    {
        // @todo implement public java.util.List handleGetProd(com.demo.entity.basic.ProdVO Prod, int pageNumber, int pageSize, java.lang.String orderBy)
        final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.basic.ProdImpl.class);
            if (Prod != null) QueryAssCriteria.getProdCriteria(Prod,criteria);
            
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount()).uniqueResult()).intValue();
      
		      criteria.setProjection(null);  
		      Prod or=new com.demo.entity.basic.ProdImpl();
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
     * @see com.demo.entity.basic.ProdDao#toProdVO(com.demo.entity.basic.Prod, com.demo.entity.basic.ProdVO)
     */
    public void toProdVO(
        com.demo.entity.basic.Prod source,
        com.demo.entity.basic.ProdVO target)
    {
        // @todo verify behavior of toProdVO
        super.toProdVO(source, target);
        // WARNING! No conversion for target.price (can't convert source.getPrice():double to com.demo.entity.basic.NumberQuery
			NumberQuery priceNum=new NumberQuery();
        priceNum.setUpNumber(source.getPrice());
        target.setPrice(priceNum);
		//{entityProp.type.name}	= double	
	        // WARNING! No conversion for target.datef (can't convert source.getDatef():java.util.Date to com.demo.entity.basic.DateTimeQuery
			DateTimeQuery datefday=new DateTimeQuery();
        datefday.setUpDate(ProjectUtil.getFullDateStr(source.getDatef()));
        target.setDatef(datefday);
	        // WARNING! No conversion for target.prodCust (can't convert source.getProdCust():com.demo.entity.basic.Customer to com.demo.entity.basic.CustomerVO
			if(source.getProdCust()!=null)target.setProdCust(this.getCustomerDao().toCustomerVO(source.getProdCust()));
			if(source.getPrincipal()!=null)target.setPrincipal(this.getPeoplesDao().toPeoplesVO(source.getPrincipal()));
	    }


    /**
     * @see com.demo.entity.basic.ProdDao#toProdVO(com.demo.entity.basic.Prod)
     */
    public com.demo.entity.basic.ProdVO toProdVO(final com.demo.entity.basic.Prod entity)
    {
        // @todo verify behavior of toProdVO
        return super.toProdVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.demo.entity.basic.Prod loadProdFromProdVO(com.demo.entity.basic.ProdVO prodVO)
    {
        // @todo implement loadProdFromProdVO
        //throw new java.lang.UnsupportedOperationException("com.demo.entity.basic.loadProdFromProdVO(com.demo.entity.basic.ProdVO) not yet implemented.");

        /* A typical implementation looks like this:*/
        com.demo.entity.basic.Prod prod = this.load(prodVO.getId());
        if (prod == null)
        {
            prod = com.demo.entity.basic.Prod.Factory.newInstance();
        }
        return prod;
        
    }

    
    /**
     * @see com.demo.entity.basic.ProdDao#prodVOToEntity(com.demo.entity.basic.ProdVO)
     */
    public com.demo.entity.basic.Prod prodVOToEntity(com.demo.entity.basic.ProdVO prodVO)
    {
        // @todo verify behavior of prodVOToEntity
        com.demo.entity.basic.Prod entity = this.loadProdFromProdVO(prodVO);
        this.prodVOToEntity(prodVO, entity, true);
        return entity;
    }


    /**
     * @see com.demo.entity.basic.ProdDao#prodVOToEntity(com.demo.entity.basic.ProdVO, com.demo.entity.basic.Prod)
     */
    public void prodVOToEntity(
        com.demo.entity.basic.ProdVO source,
        com.demo.entity.basic.Prod target,
        boolean copyIfNull)
    {
        // @todo verify behavior of prodVOToEntity
        super.prodVOToEntity(source, target, copyIfNull);
        // No conversion for target.price (can't convert source.getPrice():com.demo.entity.basic.NumberQuery to double
			if(source.getPrice()!=null)target.setPrice(source.getPrice().getUpNumber());	
	        // No conversion for target.datef (can't convert source.getDatef():com.demo.entity.basic.DateTimeQuery to java.util.Date
			if(source.getDatef()!=null)target.setDatef(ProjectUtil.getDate(source.getDatef().getUpDate()));
	        // No conversion for target.prodCust (can't convert source.getProdCust():com.demo.entity.basic.CustomerVO to com.demo.entity.basic.Customer
			if(source.getProdCust()!=null)target.setProdCust(this.getCustomerDao().load(source.getProdCust().getId()));
			if(source.getPrincipal()!=null)target.setPrincipal(this.getPeoplesDao().load(source.getPrincipal().getId()));
	    }

}