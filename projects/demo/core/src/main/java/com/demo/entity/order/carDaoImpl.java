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
 * @see com.demo.entity.order.car
 */
public class carDaoImpl
    extends com.demo.entity.order.carDaoBase
{
    /**
     * @see com.demo.entity.order.carDao#getcar(com.demo.entity.order.carVO, int, int, java.lang.String)
     */
    protected java.util.List handleGetcar(com.demo.entity.order.carVO car, int pageNumber, int pageSize, java.lang.String orderBy)
    {
        // @todo implement public java.util.List handleGetcar(com.demo.entity.order.carVO car, int pageNumber, int pageSize, java.lang.String orderBy)
        final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.demo.entity.order.carImpl.class);
            if (car != null) QueryAssCriteria.getcarCriteria(car,criteria);
            
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount()).uniqueResult()).intValue();
      
		      criteria.setProjection(null);  
		      car or=new com.demo.entity.order.carImpl();
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
     * @see com.demo.entity.order.carDao#toCarVO(com.demo.entity.order.car, com.demo.entity.order.carVO)
     */
    public void toCarVO(
        com.demo.entity.order.car source,
        com.demo.entity.order.carVO target)
    {
        // @todo verify behavior of toCarVO
        super.toCarVO(source, target);
        NumberQuery loadNum=new NumberQuery();
        loadNum.setUpNumber(source.getLoad());
        target.setLoad(loadNum);
    }


    /**
     * @see com.demo.entity.order.carDao#toCarVO(com.demo.entity.order.car)
     */
    public com.demo.entity.order.carVO toCarVO(final com.demo.entity.order.car entity)
    {
        // @todo verify behavior of toCarVO
        return super.toCarVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.demo.entity.order.car loadcarFromcarVO(com.demo.entity.order.carVO carVO)
    {
        // @todo implement loadcarFromcarVO
        //throw new java.lang.UnsupportedOperationException("com.demo.entity.order.loadcarFromcarVO(com.demo.entity.order.carVO) not yet implemented.");

        /* A typical implementation looks like this:*/
        com.demo.entity.order.car car = this.load(carVO.getId());
        if (car == null)
        {
            car = com.demo.entity.order.car.Factory.newInstance();
        }
        return car;
        
    }

    
    /**
     * @see com.demo.entity.order.carDao#carVOToEntity(com.demo.entity.order.carVO)
     */
    public com.demo.entity.order.car carVOToEntity(com.demo.entity.order.carVO carVO)
    {
        // @todo verify behavior of carVOToEntity
        com.demo.entity.order.car entity = this.loadcarFromcarVO(carVO);
        this.carVOToEntity(carVO, entity, true);
        return entity;
    }


    /**
     * @see com.demo.entity.order.carDao#carVOToEntity(com.demo.entity.order.carVO, com.demo.entity.order.car)
     */
    public void carVOToEntity(
        com.demo.entity.order.carVO source,
        com.demo.entity.order.car target,
        boolean copyIfNull)
    {
        // @todo verify behavior of carVOToEntity
        super.carVOToEntity(source, target, copyIfNull);
        if(source.getLoad()!=null)target.setLoad(source.getLoad().getUpNumber());	
    }

}