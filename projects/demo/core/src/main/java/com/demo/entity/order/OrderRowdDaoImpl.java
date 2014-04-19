// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */

package com.demo.entity.order;

import com.demo.entity.basic.NumberQuery;
import com.demo.entity.basic.DateTimeQuery;
//import com.demo.entity.util.ProjectUtil;
//import com.demo.entity.util.QueryAssCriteria;
import com.demo.util.ProjectUtil;
import com.demo.util.QueryAssCriteria;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;
/**
 * @see com.demo.entity.order.OrderRowd
 */
public class OrderRowdDaoImpl
    extends com.demo.entity.order.OrderRowdDaoBase
{
    /**
     * @see com.demo.entity.order.OrderRowdDao#getOrderRowd(com.demo.entity.order.OrderRowdVO, int, int, java.lang.String)
     */
    protected java.util.List handleGetOrderRowd(com.demo.entity.order.OrderRowdVO OrderRowd, int pageNumber, int pageSize, java.lang.String orderBy)
    {
        // @todo implement public java.util.List handleGetOrderRowd(com.demo.entity.order.OrderRowdVO OrderRowd, int pageNumber, int pageSize, java.lang.String orderBy)
        final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.order.OrderRowdImpl.class);
            if (OrderRowd != null) QueryAssCriteria.getOrderRowdCriteria(OrderRowd,criteria);
            
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount()).uniqueResult()).intValue();
      
		      criteria.setProjection(null);  
		      OrderRowd or=new com.demo.entity.order.OrderRowdImpl();
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
     * @see com.demo.entity.order.OrderRowdDao#toOrderRowdVO(com.demo.entity.order.OrderRowd, com.demo.entity.order.OrderRowdVO)
     */
    public void toOrderRowdVO(
        com.demo.entity.order.OrderRowd source,
        com.demo.entity.order.OrderRowdVO target)
    {
	System.out.println("toOrderRowdVO1111111111====="+source.getProduct());
        // @todo verify behavior of toOrderRowdVO
        super.toOrderRowdVO(source, target);
        // WARNING! No conversion for target.productNum (can't convert source.getProductNum():double to com.demo.entity.basic.NumberQuery
			NumberQuery productNumNum=new NumberQuery();
        productNumNum.setUpNumber(source.getProductNum());
        target.setProductNum(productNumNum);
		//{entityProp.type.name}	= double	
	        // WARNING! No conversion for target.unitNum (can't convert source.getUnitNum():double to com.demo.entity.basic.NumberQuery
			NumberQuery unitNumNum=new NumberQuery();
        unitNumNum.setUpNumber(source.getUnitNum());
        target.setUnitNum(unitNumNum);
		//{entityProp.type.name}	= double	
	        // WARNING! No conversion for target.goodsSuttle (can't convert source.getGoodsSuttle():double to com.demo.entity.basic.NumberQuery
			NumberQuery goodsSuttleNum=new NumberQuery();
        goodsSuttleNum.setUpNumber(source.getGoodsSuttle());
        target.setGoodsSuttle(goodsSuttleNum);
		//{entityProp.type.name}	= double	
	        // WARNING! No conversion for target.goodsWeight (can't convert source.getGoodsWeight():double to com.demo.entity.basic.NumberQuery
			NumberQuery goodsWeightNum=new NumberQuery();
        goodsWeightNum.setUpNumber(source.getGoodsWeight());
        target.setGoodsWeight(goodsWeightNum);
		//{entityProp.type.name}	= double	
	        // WARNING! No conversion for target.goodsVolume (can't convert source.getGoodsVolume():double to com.demo.entity.basic.NumberQuery
			NumberQuery goodsVolumeNum=new NumberQuery();
        goodsVolumeNum.setUpNumber(source.getGoodsVolume());
        target.setGoodsVolume(goodsVolumeNum);
		//{entityProp.type.name}	= double	
	        // WARNING! No conversion for target.carriage (can't convert source.getCarriage():double to com.demo.entity.basic.NumberQuery
			NumberQuery carriageNum=new NumberQuery();
        carriageNum.setUpNumber(source.getCarriage());
        target.setCarriage(carriageNum);
			//{entityProp.type.name}	= double	
	        // WARNING! No conversion for target.order (can't convert source.getOrder():com.demo.entity.order.Orderd to com.demo.entity.order.OrderdVO
			//if(source.getOrder()!=null)target.setOrder(this.getOrderdDao().toOrderdVO(source.getOrder()));
	        // WARNING! No conversion for target.product (can't convert source.getProduct():com.demo.entity.basic.Prod to com.demo.entity.basic.ProdVO
				if(source.getProduct()!=null)target.setProduct(this.getProdDao().toProdVO(source.getProduct()));
			    }


    /**
     * @see com.demo.entity.order.OrderRowdDao#toOrderRowdVO(com.demo.entity.order.OrderRowd)
     */
    public com.demo.entity.order.OrderRowdVO toOrderRowdVO(final com.demo.entity.order.OrderRowd entity)
    {
	System.out.println("toOrderRowdVO22222=====");
        // @todo verify behavior of toOrderRowdVO
        return super.toOrderRowdVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.demo.entity.order.OrderRowd loadOrderRowdFromOrderRowdVO(com.demo.entity.order.OrderRowdVO orderRowdVO)
    {
        // @todo implement loadOrderRowdFromOrderRowdVO
        //throw new java.lang.UnsupportedOperationException("com.demo.entity.order.loadOrderRowdFromOrderRowdVO(com.demo.entity.order.OrderRowdVO) not yet implemented.");
System.out.println("loadOrderRowdFromOrderRowdVO=====");
        /* A typical implementation looks like this:*/
        com.demo.entity.order.OrderRowd orderRowd = this.load(orderRowdVO.getId());
        if (orderRowd == null)
        {
            orderRowd = com.demo.entity.order.OrderRowd.Factory.newInstance();
        }
        return orderRowd;
        
    }

    
    /**
     * @see com.demo.entity.order.OrderRowdDao#orderRowdVOToEntity(com.demo.entity.order.OrderRowdVO)
     */
    public com.demo.entity.order.OrderRowd orderRowdVOToEntity(com.demo.entity.order.OrderRowdVO orderRowdVO)
    {
        // @todo verify behavior of orderRowdVOToEntity
		System.out.println("orderRowdVOToEntity1111=====");
        com.demo.entity.order.OrderRowd entity = this.loadOrderRowdFromOrderRowdVO(orderRowdVO);
        this.orderRowdVOToEntity(orderRowdVO, entity, true);
        return entity;
    }


    /**
     * @see com.demo.entity.order.OrderRowdDao#orderRowdVOToEntity(com.demo.entity.order.OrderRowdVO, com.demo.entity.order.OrderRowd)
     */
    public void orderRowdVOToEntity(
        com.demo.entity.order.OrderRowdVO source,
        com.demo.entity.order.OrderRowd target,
        boolean copyIfNull)
    {
	System.out.println("orderRowdVOToEntity222====="+source.getProduct());
        // @todo verify behavior of orderRowdVOToEntity
        super.orderRowdVOToEntity(source, target, copyIfNull);
        // No conversion for target.productNum (can't convert source.getProductNum():com.demo.entity.basic.NumberQuery to double
			if(source.getProductNum()!=null)target.setProductNum(source.getProductNum().getUpNumber());	
	        // No conversion for target.unitNum (can't convert source.getUnitNum():com.demo.entity.basic.NumberQuery to double
			if(source.getUnitNum()!=null)target.setUnitNum(source.getUnitNum().getUpNumber());	
	        // No conversion for target.goodsSuttle (can't convert source.getGoodsSuttle():com.demo.entity.basic.NumberQuery to double
			if(source.getGoodsSuttle()!=null)target.setGoodsSuttle(source.getGoodsSuttle().getUpNumber());	
	        // No conversion for target.goodsWeight (can't convert source.getGoodsWeight():com.demo.entity.basic.NumberQuery to double
			if(source.getGoodsWeight()!=null)target.setGoodsWeight(source.getGoodsWeight().getUpNumber());	
	        // No conversion for target.goodsVolume (can't convert source.getGoodsVolume():com.demo.entity.basic.NumberQuery to double
			if(source.getGoodsVolume()!=null)target.setGoodsVolume(source.getGoodsVolume().getUpNumber());	
	        // No conversion for target.carriage (can't convert source.getCarriage():com.demo.entity.basic.NumberQuery to double
			if(source.getCarriage()!=null)target.setCarriage(source.getCarriage().getUpNumber());	
	        // No conversion for target.order (can't convert source.getOrder():com.demo.entity.order.OrderdVO to com.demo.entity.order.Orderd
						if(source.getOrder()!=null)target.setOrder(this.getOrderdDao().load(source.getOrder().getId()));
			        // No conversion for target.product (can't convert source.getProduct():com.demo.entity.basic.ProdVO to com.demo.entity.basic.Prod
						if(source.getProduct()!=null)target.setProduct(this.getProdDao().load(source.getProduct().getId()));
			    }

}