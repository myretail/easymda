// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.entity.order;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;

import com.logistics.ServiceLocator;
import com.logistics.entity.basic.NumberQuery;
import com.logistics.entity.order.crud.WlOrderRowManageableService;
import com.logistics.util.QueryAssCriteriaOrder;

/**
 * @see com.logistics.entity.order.WlOrderRow
 */
public class WlOrderRowDaoImpl
    extends com.logistics.entity.order.WlOrderRowDaoBase
{
    /**
     * @see com.logistics.entity.order.WlOrderRowDao#getWlOrderRow(com.logistics.entity.order.WlOrderRowVO, int, int, java.lang.String)
     */
    protected java.util.List handleGetWlOrderRow(com.logistics.entity.order.WlOrderRowVO wlorder, int pageNumber, int pageSize, java.lang.String orderBy)
    {
    	final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.order.WlOrderRowImpl.class);
            if (wlorder != null) QueryAssCriteriaOrder.getOrderRowCriteria(wlorder,criteria);
            //条数
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
                    .uniqueResult())  
                    .intValue();//取得符合条件的总数  
      
		      criteria.setProjection(null);  
		      WlOrderRow or=new com.logistics.entity.order.WlOrderRowImpl();
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
           /* if (wlorder.getProductCode() != null)
                criteria.add(Expression.ilike("productCode", wlorder.getProductCode(), MatchMode.START));
            if (wlorder.getProductName() != null)
                criteria.add(Expression.ilike("productName", wlorder.getProductName(), MatchMode.START));
            if (wlorder.getProductEquType() != null)
                criteria.add(Expression.ilike("productEquType", wlorder.getProductEquType(), MatchMode.START));
            if (wlorder.getMeasureUnit() != null)
                criteria.add(Expression.ilike("measureUnit", wlorder.getMeasureUnit(), MatchMode.START));
            if (wlorder.getProductNum() != 0)
            criteria.add(Expression.eq("productNum", new java.lang.Double(wlorder.getProductNum())));
            if (wlorder.getUnitNum() != 0)
            criteria.add(Expression.eq("unitNum", new java.lang.Double(wlorder.getUnitNum())));
            if (wlorder.getGoodsSuttle() != 0)
            criteria.add(Expression.eq("goodsSuttle", new java.lang.Double(wlorder.getGoodsSuttle())));
            if (wlorder.getGoodsWeight() != 0)
            criteria.add(Expression.eq("goodsWeight", new java.lang.Double(wlorder.getGoodsWeight())));
            if (wlorder.getGoodsVolume() != 0)
            criteria.add(Expression.eq("goodsVolume", new java.lang.Double(wlorder.getGoodsVolume())));
            if (wlorder.getLabel() != null)
                criteria.add(Expression.ilike("label", wlorder.getLabel(), MatchMode.START));
            if (wlorder.getCarriage() != 0l)
            criteria.add(Expression.eq("carriage", new java.lang.Double(wlorder.getCarriage())));
            if (wlorder.getEspecial() != null)
                criteria.add(Expression.ilike("especial", wlorder.getEspecial(), MatchMode.START));
            if (wlorder.getGoodsState() != null)
                criteria.add(Expression.ilike("goodsState", wlorder.getGoodsState(), MatchMode.START));
            if (wlorder.getStatus() != null)
                criteria.add(Expression.ilike("status", wlorder.getStatus(), MatchMode.START));
            criteria.add(Expression.eq("version", new java.lang.Double(wlorder.getVersion())));
            if (wlorder.getRemark() != null)
                criteria.add(Expression.ilike("remark", wlorder.getRemark(), MatchMode.START));
            if (wlorder.getId() != 0)
            criteria.add(Expression.eq("id", wlorder.getId()));
            if (wlorder.getWlOrderid()!= 0) criteria.createCriteria("order").add(Expression.eq("id", wlorder.getWlOrderid()));
            if (wlorder.getProductID() != 0) criteria.createCriteria("product").add(Expression.eq("id", wlorder.getProductID()));
            if (pageNumber > 0 && pageSize > 0)
            {
                criteria.setFirstResult(this.calculateFirstResult(pageNumber, pageSize));
                criteria.setMaxResults(pageSize);
            }else{
           	 criteria.setMaxResults(100);
            }

            return criteria.list();*/
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
}

    /**
     * @see com.logistics.entity.order.WlOrderRowDao#toWlOrderRowVO(com.logistics.entity.order.WlOrderRow, com.logistics.entity.order.WlOrderRowVO)
     */
    public void toWlOrderRowVO(
        com.logistics.entity.order.WlOrderRow source,
        com.logistics.entity.order.WlOrderRowVO target)
    {
        // @todo verify behavior of toWlOrderRowVO
    	System.out.println("wlorderRowdaoimpl===1");
        super.toWlOrderRowVO(source, target);
        System.out.println("wlorderRowdaoimpl===2");
        /*if(target.getWlOrderid()!=0){
        	target.setWlOrderid(source.getOrder().getId());
        	target.setWlOrderVO(this.getWlOrderDao().toWlOrderVO(source.getOrder()));
        	//target.setWlOrderVO(this.getWlOrderDao().toWlOrderVO(source.getOrder()));
        }else {//默认都为0*/
        if(source.getOrder()!=null)	target.setWlOrderid(source.getOrder().getId());
        	
    	//}
        if(source.getProduct()!=null)	target.setProductID(source.getProduct().getId());
        //target.setPathName(source.getPath().getPathName());
        
        NumberQuery tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getCarriage());
        target.setCarriage(tempNum);
        tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getGoodsSuttle());
        target.setGoodsSuttle(tempNum);
        tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getGoodsVolume());
        target.setGoodsVolume(tempNum);
        tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getUnitNum());
        target.setUnitNum(tempNum);
        tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getGoodsWeight());
        target.setGoodsWeight(tempNum);
        tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getProductNum());
        target.setProductNum(tempNum);
               
    }


    /**
     * @see com.logistics.entity.order.WlOrderRowDao#toWlOrderRowVO(com.logistics.entity.order.WlOrderRow)
     */
    public com.logistics.entity.order.WlOrderRowVO toWlOrderRowVO(final com.logistics.entity.order.WlOrderRow entity)
    {
        // @todo verify behavior of toWlOrderRowVO
        return super.toWlOrderRowVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.order.WlOrderRow loadWlOrderRowFromWlOrderRowVO(com.logistics.entity.order.WlOrderRowVO wlOrderRowVO)
    {
        // @todo implement loadWlOrderRowFromWlOrderRowVO
       //throw new java.lang.UnsupportedOperationException("com.logistics.entity.order.loadWlOrderRowFromWlOrderRowVO(com.logistics.entity.order.WlOrderRowVO) not yet implemented.");

        /* A typical implementation looks like this: */
        com.logistics.entity.order.WlOrderRow wlOrderRow = this.load(wlOrderRowVO.getId());
        if (wlOrderRow == null)
        {
            wlOrderRow = com.logistics.entity.order.WlOrderRow.Factory.newInstance();
        }
        return wlOrderRow;
       
    }

    
    /**
     * @see com.logistics.entity.order.WlOrderRowDao#wlOrderRowVOToEntity(com.logistics.entity.order.WlOrderRowVO)
     */
    public com.logistics.entity.order.WlOrderRow wlOrderRowVOToEntity(com.logistics.entity.order.WlOrderRowVO wlOrderRowVO)
    {
        // @todo verify behavior of wlOrderRowVOToEntity
        com.logistics.entity.order.WlOrderRow entity = this.loadWlOrderRowFromWlOrderRowVO(wlOrderRowVO);
        this.wlOrderRowVOToEntity(wlOrderRowVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.order.WlOrderRowDao#wlOrderRowVOToEntity(com.logistics.entity.order.WlOrderRowVO, com.logistics.entity.order.WlOrderRow)
     */
    public void wlOrderRowVOToEntity(
        com.logistics.entity.order.WlOrderRowVO source,
        com.logistics.entity.order.WlOrderRow target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wlOrderRowVOToEntity
        super.wlOrderRowVOToEntity(source, target, copyIfNull);
        target.setOrder(this.getWlOrderDao().load(new java.lang.Long(source.getWlOrderid())));
        target.setProduct(this.getWlCustProductDao().load(new java.lang.Long(source.getProductID())));
        target.setCarriage(source.getCarriage().getUpNumber());
        target.setGoodsSuttle(source.getGoodsSuttle().getUpNumber());
        target.setGoodsVolume(source.getGoodsVolume().getUpNumber());
        target.setGoodsWeight(source.getGoodsWeight().getUpNumber());
        target.setProductNum(source.getProductNum().getUpNumber());
        target.setUnitNum(source.getUnitNum().getUpNumber());
    }

	protected List handleGetOrderRowByOrderId(long orderId) throws Exception {
		final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.order.WlOrderRowImpl.class);
            if(orderId!=0)
            criteria.createCriteria("order").add(Expression.eq("id", orderId));
            criteria.setMaxResults(250);
            
            return criteria.list();
            
        }
        catch (org.hibernate.HibernateException ex)
        {
        	//session.c
            throw super.convertHibernateAccessException(ex);
        
		}
	}

}