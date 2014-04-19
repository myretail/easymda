// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.demo.service.order;
			import com.demo.entity.order.car;
		import com.demo.entity.order.carDao;
		import com.demo.entity.order.carVO;
				
import java.util.Collection;
import java.util.Random;
import java.util.List;

/**
 * @see com.demo.service.order.carManageService
 */
public class carManageServiceImpl
    extends com.demo.service.order.carManageServiceBase
{

    /**
     * @see com.demo.service.order.carManageService#createcar(com.demo.entity.order.carVO)
     */
    protected long handleCreatecar(com.demo.entity.order.carVO car)
		throws java.lang.Exception
    {
        // @todo implement public long createcar(com.demo.entity.order.carVO car) createcar
			return this.getCarDao().create(this.getCarDao().carVOToEntity(car)).getId();
	    }
	
    /**
     * @see com.demo.service.order.carManageService#updatecar(com.demo.entity.order.carVO)
     */
    protected void handleUpdatecar(com.demo.entity.order.carVO car)
		throws java.lang.Exception
    {
        // @todo implement public void updatecar(com.demo.entity.order.carVO car) updatecar
			car entity =this.getCarDao().load(car.getId());
    	this.getCarDao().carVOToEntity(car, entity, false);
    	this.getCarDao().update(entity);
		
	    }
	
    /**
     * @see com.demo.service.order.carManageService#deletecar(long)
     */
    protected void handleDeletecar(long id)
		throws java.lang.Exception
    {
        // @todo implement public void deletecar(long id) deletecar
			this.getCarDao().remove(id);
	    }
	
    /**
     * @see com.demo.service.order.carManageService#getcar(com.demo.entity.order.carVO, int, int, java.lang.String)
     */
    protected com.demo.entity.order.carVO[] handleGetcar(com.demo.entity.order.carVO car, int pageNumber, int pageSize, java.lang.String orderBy)
		throws java.lang.Exception
    {
        // @todo implement public com.demo.entity.order.carVO[] getcar(com.demo.entity.order.carVO car, int pageNumber, int pageSize, java.lang.String orderBy) getcar
			carDao infoDao=this.getCarDao();
	 	Collection infos = infoDao.getcar(car, pageNumber, pageSize, orderBy);
	 	return infoDao.toCarVOArray(infos);
	    }
	
}
