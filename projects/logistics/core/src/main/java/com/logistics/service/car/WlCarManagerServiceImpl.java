// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.service.car;

import java.util.Collection;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import com.logistics.entity.car.WlVoiture;
import com.logistics.entity.car.WlVoitureDao;
import com.logistics.entity.car.WlVoitureVO;
import com.logistics.entity.order.WlOrderDao;
import com.logistics.entity.order.WlOrderVO;
import com.logistics.entity.order.WlVoitureTaskVO;

/**
 * @see com.logistics.service.car.WlCarManagerService
 */
public class WlCarManagerServiceImpl
    extends com.logistics.service.car.WlCarManagerServiceBase
{

    /**
     * @see com.logistics.service.car.WlCarManagerService#getWlVoitureVO(com.logistics.entity.car.WlVoitureVO, int, int, java.lang.String)
     */
    protected  com.logistics.entity.car.WlVoitureVO[] handleGetWlVoitureVO(com.logistics.entity.car.WlVoitureVO WlVoitureVO, int pageNumber, int pageSize, java.lang.String orderBy)
        throws java.lang.Exception
    {
    	WlVoitureDao voitureDao=this.getWlVoitureDao();
	 	Collection voitures = voitureDao.getWlVoitureVO(WlVoitureVO,pageNumber,pageSize,orderBy);
	 	//(WlVoitureVO[])voitures.toArray(new WlVoitureVO[0]);
	    return  voitureDao.toWlVoitureVOArray(voitures);
	}

    /**
     * @see com.logistics.service.car.WlCarManagerService#getWlVoitureTaskVO(com.logistics.entity.order.WlVoitureTaskVO, int, int, java.lang.String)
     */
    protected  com.logistics.entity.order.WlVoitureTaskVO[] handleGetWlVoitureTaskVO(com.logistics.entity.order.WlVoitureTaskVO WlVoitureVO, int pageNumber, int pageSize, java.lang.String orderBy)
        throws java.lang.Exception
    {
    	WlVoitureDao voitureDao=this.getWlVoitureDao();
	 	List voitures = voitureDao.getWlVoitureTaskVO(WlVoitureVO,pageNumber,pageSize,orderBy);
	 	//(WlVoitureVO[])voitures.toArray(new WlVoitureVO[0]);
	 	WlVoitureTaskVO[] re=new WlVoitureTaskVO[voitures.size()];
	 	for(int i=0;i<voitures.size();i++){
	 		WlVoiture wlVoiturei=(WlVoiture)voitures.get(i);
	 		WlVoitureTaskVO temp=voitureDao.toWlVoitureTaskVO(wlVoiturei);
	 		
	 		java.lang.Object[] retask=new Object[wlVoiturei.getTasks().size()];
	        com.logistics.entity.order.WlTaskRow task=null;
	        	//new com.logistics.entity.order.WlTaskRowImpl();
	        if(wlVoiturei.getTasks() != null ){
	        	java.util.Iterator iterator = wlVoiturei.getTasks().iterator();
	        	Set taskids=new TreeSet();
	        	int t=0;
	        	while ( iterator.hasNext())
	            {   
	        		task=(com.logistics.entity.order.WlTaskRow)iterator.next();
	        		if(!task.getStatus().equals("7")){
	        			retask[t]=task.getTask().getId()+":"+task.getId()+"-"+task.getPath().getPathName();
	        			t++;
	        		}
	            }
	        	temp.setTasks(retask);
	        }
	 		re[i]=temp;
	 	}
	      
	      return re;
    }

    /**
     * @see com.logistics.service.car.WlCarManagerService#createWlVoiture(com.logistics.entity.car.WlVoitureVO)
     */
    protected  long handleCreateWlVoiture(com.logistics.entity.car.WlVoitureVO WlVoitureVO)
        throws java.lang.Exception
    {
    	return this.getWlVoitureDao().create(this.getWlVoitureDao().wlVoitureVOToEntity(WlVoitureVO)).getId();
    }

    /**
     * @see com.logistics.service.car.WlCarManagerService#updateWlVoiture(com.logistics.entity.car.WlVoitureVO)
     */
    protected  void handleUpdateWlVoiture(com.logistics.entity.car.WlVoitureVO WlVoitureVO)
        throws java.lang.Exception
    {
    	com.logistics.entity.car.WlVoiture entity =this.getWlVoitureDao().load(WlVoitureVO.getId());
    	this.getWlVoitureDao().wlVoitureVOToEntity(WlVoitureVO, entity, false);
    	this.getWlVoitureDao().update(entity);
    }

    /**
     * @see com.logistics.service.car.WlCarManagerService#deleteWlVoiture(long)
     */
    protected  void handleDeleteWlVoiture(long id)
        throws java.lang.Exception
    {
    	this.getWlVoitureDao().remove(id);
    }

	

}