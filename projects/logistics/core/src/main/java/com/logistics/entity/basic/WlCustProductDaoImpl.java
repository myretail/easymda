// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.entity.basic;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;

import com.logistics.entity.store.WlPackDaoImpl;
import com.logistics.util.QueryAssCriteriaOrder;
import com.logistics.util.QueryAssCriteria;
//import com.logistics.entity.store.WlPackDaoImpl;

/**
 * @see com.logistics.entity.basic.WlCustProduct
 */
public class WlCustProductDaoImpl
    extends com.logistics.entity.basic.WlCustProductDaoBase
{
    /**
     * @see com.logistics.entity.basic.WlCustProductDao#getProductsBy(java.lang.String, java.lang.String, java.lang.String, java.lang.String, long)
     */
    protected java.util.List handleGetProductsBy(java.lang.String code, java.lang.String name, java.lang.String type, java.lang.String model, long codeid, int pageNumber, int pageSize, java.lang.String orderBy)
    {
    	final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.basic.WlCustProductImpl.class);

            if (code != null)
                criteria.add(Expression.ilike("productCode", code, MatchMode.START));
            if (name != null)
                criteria.add(Expression.ilike("equName", name, MatchMode.START));
            if (type != null)
                criteria.add(Expression.ilike("productType",type, MatchMode.START));
            if (model != null)
                criteria.add(Expression.ilike("model", model, MatchMode.START));
            System.out.println("codeid========="+codeid);
            System.out.println("new java.lang.Long(codeid)========="+new java.lang.Long(codeid));
            if(codeid!=0)
            criteria.createCriteria("codeID").add(Expression.eq("id", new java.lang.Long(codeid)));
            
            /*if (unit != null)
                criteria.add(Expression.ilike("unit", unit, MatchMode.START));
            criteria.add(Expression.eq("price", new java.lang.Double(price)));
            criteria.add(Expression.eq("weight", new java.lang.Double(weight)));
            criteria.add(Expression.eq("volume", new java.lang.Double(volume)));
            if (level != null)
                criteria.add(Expression.ilike("level", level, MatchMode.START));
            if (request != null)
                criteria.add(Expression.ilike("request", request, MatchMode.START));
            if (remark != null)
                criteria.add(Expression.ilike("remark", remark, MatchMode.START));
            if (codeID != null) criteria.createCriteria("codeID").add(Expression.eq("id", codeID));
            if (customer != null) criteria.createCriteria("customer").add(Expression.eq("id", customer));
            if (pack != null) criteria.createCriteria("pack").add(Expression.eq("id", pack));*/
            
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
     * @see com.logistics.entity.basic.WlCustProductDao#createProducts(java.util.List)
     */
    protected long[] handleCreateProducts(java.util.List products)
    {
        // @todo implement public long[] handleCreateProducts(java.util.List products)
        return null;
}

    /**
     * @see com.logistics.entity.basic.WlCustProductDao#updateProducts(java.util.List)
     */
    protected void handleUpdateProducts(java.util.List products)
    {
        // @todo implement public void handleUpdateProducts(java.util.List products)
        throw new java.lang.UnsupportedOperationException("com.logistics.entity.basic.WlCustProduct.handleUpdateProducts(java.util.List products) Not implemented!");
}

    /**
     * @see com.logistics.entity.basic.WlCustProductDao#deleteProducts(long[])
     */
    protected void handleDeleteProducts(long[] ids)
    {
        // @todo implement public void handleDeleteProducts(long[] ids)
        throw new java.lang.UnsupportedOperationException("com.logistics.entity.basic.WlCustProduct.handleDeleteProducts(long[] ids) Not implemented!");
}

    /**
     * @see com.logistics.entity.basic.WlCustProductDao#toWlCustProductVO(com.logistics.entity.basic.WlCustProduct, com.logistics.entity.basic.WlCustProductVO)
     */
    public void toWlCustProductVO(
        com.logistics.entity.basic.WlCustProduct source,
        com.logistics.entity.basic.WlCustProductVO target)
    {
        // @todo verify behavior of toWlCustProductVO
        super.toWlCustProductVO(source, target);
        target.setCodeID(this.getWlCustCodeDao().toWlCustCodeVO(source.getCodeID()));
        target.setPack(this.getWlPackDao().toWlPackVO(source.getPack()));
        NumberQuery tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getPrice());
        target.setPrice(tempNum);
        tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getVolume());
        target.setVolume(tempNum);
        tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getWeight());
        target.setWeight(tempNum);
    }
    


    /**
     * @see com.logistics.entity.basic.WlCustProductDao#toWlCustProductVO(com.logistics.entity.basic.WlCustProduct)
     */
    public com.logistics.entity.basic.WlCustProductVO toWlCustProductVO(final com.logistics.entity.basic.WlCustProduct entity)
    {
        // @todo verify behavior of toWlCustProductVO
    	
        return super.toWlCustProductVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.basic.WlCustProduct loadWlCustProductFromWlCustProductVO(com.logistics.entity.basic.WlCustProductVO wlCustProductVO)
    {
        // @todo implement loadWlCustProductFromWlCustProductVO
        //throw new java.lang.UnsupportedOperationException("com.logistics.entity.basic.loadWlCustProductFromWlCustProductVO(com.logistics.entity.basic.WlCustProductVO) not yet implemented.");

        /* A typical implementation looks like this:*/
        com.logistics.entity.basic.WlCustProduct wlCustProduct = this.load(wlCustProductVO.getId());
        if (wlCustProduct == null)
        {
            wlCustProduct = com.logistics.entity.basic.WlCustProduct.Factory.newInstance();
        }
        return wlCustProduct;
        
    }

    
    /**
     * @see com.logistics.entity.basic.WlCustProductDao#wlCustProductVOToEntity(com.logistics.entity.basic.WlCustProductVO)
     */
    public com.logistics.entity.basic.WlCustProduct wlCustProductVOToEntity(com.logistics.entity.basic.WlCustProductVO wlCustProductVO)
    {
        // @todo verify behavior of wlCustProductVOToEntity
        com.logistics.entity.basic.WlCustProduct entity = this.loadWlCustProductFromWlCustProductVO(wlCustProductVO);
        this.wlCustProductVOToEntity(wlCustProductVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.basic.WlCustProductDao#wlCustProductVOToEntity(com.logistics.entity.basic.WlCustProductVO, com.logistics.entity.basic.WlCustProduct)
     */
    public void wlCustProductVOToEntity(
        com.logistics.entity.basic.WlCustProductVO source,
        com.logistics.entity.basic.WlCustProduct target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wlCustProductVOToEntity
        super.wlCustProductVOToEntity(source, target, copyIfNull);
        //com.logistics.entity.basic.WlCustCodeDaoBase codeEntity = new WlCustCodeDaoImpl();
        if(source.getCodeID()!=null)target.setCodeID(this.getWlCustCodeDao().load(new java.lang.Long(source.getCodeID().getId())));
        //com.logistics.entity.store.WlPackDaoBase packEntity =new WlPackDaoImpl();
        if(source.getPack()!=null)target.setPack(this.getWlPackDao().load(new java.lang.Long(source.getPack().getPackID())));
        if(source.getPrice()!=null)target.setPrice(source.getPrice().getUpNumber());
        if(source.getVolume()!=null)target.setVolume(source.getVolume().getUpNumber());
        if(source.getWeight()!=null)target.setWeight(source.getWeight().getUpNumber());

        
    }

	@Override
	protected List handleGetWlCustProduct( WlCustProductVO WlCustProduct, int pageNumber, int pageSize,String orderBy) throws Exception {
		final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.basic.WlCustProductImpl.class);
            if (WlCustProduct != null) QueryAssCriteria.getCustProductCriteria(WlCustProduct,criteria);
             //条数
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
                    .uniqueResult())  
                    .intValue();//取得符合条件的总数  
      
		      criteria.setProjection(null);  
		      com.logistics.entity.basic.WlCustProduct or=new com.logistics.entity.basic.WlCustProductImpl();
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