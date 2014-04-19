// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.service.order;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.Random;
import java.util.TreeMap;

import com.logistics.util.ProjectUtil;
import java.util.List;

import java.util.Set;
import java.util.TreeSet;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Expression;

import com.logistics.entity.order.WlOrderDao;
import com.logistics.entity.order.WlOrderRow;
import com.logistics.entity.order.WlOrderRowVO;
import com.logistics.entity.order.WlOrderVO;
import com.logistics.entity.order.WlTask;
import com.logistics.entity.order.WlTaskDao;
import com.logistics.entity.order.WlTaskRow;
import com.logistics.entity.order.WlTaskRowDao;
import com.logistics.entity.order.WlTaskRowVO;
import com.logistics.entity.order.WlTaskVO;
import com.logistics.entity.order.WlVoitureTaskVO;
import com.logistics.entity.order.Wltrwithor;
import com.logistics.entity.order.WltrwithorDao;
import com.logistics.entity.order.WltrwithorVO;
import com.logistics.entity.car.WlVoiture;
import com.logistics.entity.car.WlVoitureVO;
/**
 * @see com.logistics.service.order.WlTaskManageService
 */
public class WlTaskManageServiceImpl
    extends com.logistics.service.order.WlTaskManageServiceBase
{

    /**
     * @see com.logistics.service.order.WlTaskManageService#getWlTask(com.logistics.entity.order.WlTaskVO, int, int, java.lang.String)
     */
    protected  com.logistics.entity.order.WlTaskVO[] handleGetWlTask(com.logistics.entity.order.WlTaskVO WlTaskVO, int pageNumber, int pageSize, java.lang.String orderBy)
        throws java.lang.Exception
    {
    	WlTaskDao taskDao=this.getWlTaskDao();
	 	Collection WlTasks = taskDao.getWlTask(WlTaskVO,pageNumber,pageSize,orderBy);
	 	if(WlTaskVO.getTaskRowId()!=0 ){//???????????????????????????????????????
	 		com.logistics.entity.order.WlTaskVO target= new WlTaskVO();
	 		target.setTaskRowId(1);
	 		Iterator it=WlTasks.iterator();
	 		WlTaskVO[] WlTaskvos= new WlTaskVO[WlTasks.size()];
	 		for(int i=0;it.hasNext();i++){
	 			taskDao.toWlTaskVO((WlTask)it.next(), target);
	 			WlTaskvos[i]=target;
	 		}
	 		return  WlTaskvos;
	 	}else{
	 		taskDao.toWlTaskVOCollection(WlTasks);
	 		return  (WlTaskVO[])WlTasks.toArray(new WlTaskVO[0]);
	 	}
	 	
    }
    protected  Object[] handleGetRelWlTask(com.logistics.entity.order.WlTaskVO WlTaskVO, int pageNumber, int pageSize, java.lang.String orderBy)
    throws java.lang.Exception
{
	WlTaskDao taskDao=this.getWlTaskDao();
 	Collection WlTasks = taskDao.getWlTask(WlTaskVO,pageNumber,pageSize,orderBy);
	String orderIdString="";
	ArrayList orders=new ArrayList();		//orderRowIdString="";
	Iterator it=WlTasks.iterator();
	while(it.hasNext()){
		WlTask task=(WlTask)it.next();
		Iterator itRow=task.getTaskRow().iterator();
		while(itRow.hasNext()){
			WlTaskRow taskRow=(WlTaskRow)itRow.next();
			Iterator itTr=taskRow.getTrwithor().iterator();
			if(itTr.hasNext()){//taskRow中的tr来自一个order
				Wltrwithor tr=(Wltrwithor)itTr.next();
				if(orderIdString.indexOf(String.valueOf(tr.getOrderRow().getOrder().getId()))==-1){
					orderIdString=orderIdString+","+tr.getOrderRow().getOrder().getId();
					orders.add(tr.getOrderRow().getOrder());
				}
			}
		}
 	}
	taskDao.toWlTaskVOCollection(WlTasks);
	WlTaskVO[] reTask= (WlTaskVO[])WlTasks.toArray(new WlTaskVO[0]);
	
	Object[] re=new Object[reTask.length+1];
	for(int i=0;i<reTask.length;i++){
		re[i]=reTask[i];
	}
	this.getWlOrderDao().toWlOrderVOCollection(orders);
	WlOrderVO[] reOrder= (WlOrderVO[])orders.toArray(new WlOrderVO[0]);
	re[reTask.length]=reOrder;
	return re;
}
    
    /**
     * @see com.logistics.service.order.WlTaskManageService#createWlTask(com.logistics.entity.order.WlTaskVO)
     */
    protected  long handleCreateWlTask(com.logistics.entity.order.WlTaskVO WlTaskVO)
        throws java.lang.Exception
    {
    	Random rd = new Random();
    	final com.logistics.entity.order.WlTask entity = this.getWlTaskDao().wlTaskVOToEntity(WlTaskVO);
    	entity.setId(System.currentTimeMillis()+rd.nextInt());
    	System.out.println("entity==="+entity.getCreateTime());
    	return this.getWlTaskDao().create(entity).getId();
    }

    /**
     * @see com.logistics.service.order.WlTaskManageService#updateWlTask(com.logistics.entity.order.WlTaskVO)
     */
    protected  void handleUpdateWlTask(com.logistics.entity.order.WlTaskVO WlTaskVO)
        throws java.lang.Exception
    {
    	final com.logistics.entity.order.WlTask entity = this.getWlTaskDao().wlTaskVOToEntity(WlTaskVO);
    	this.getWlTaskDao().update(entity);
    }

    /**
     * @see com.logistics.service.order.WlTaskManageService#deleteWlTask(long)
     */
    protected  void handleDeleteWlTask(long id)
        throws java.lang.Exception
    {
    	this.getWlTaskDao().remove(id);
    }

    /**
     * @see com.logistics.service.order.WlTaskManageService#getWlTaskRow(com.logistics.entity.order.WlTaskRowVO, int, int, java.lang.String)
     */
    protected  com.logistics.entity.order.WlTaskRowVO[] handleGetWlTaskRow(com.logistics.entity.order.WlTaskRowVO WlTaskRowVO, int pageNumber, int pageSize, java.lang.String orderBy)
        throws java.lang.Exception
    {
    	WlTaskRowDao taskRowDao=this.getWlTaskRowDao();
	 	Collection WlTaskRows = taskRowDao.getWlTaskRow(WlTaskRowVO,pageNumber,pageSize,orderBy);
	 	if(WlTaskRowVO.getTrwithorId()!=0 ){//???????????????????????????????????????
	 		com.logistics.entity.order.WlTaskRowVO target= new WlTaskRowVO();
	 		target.setTrwithorId(1);
	 		Iterator it=WlTaskRows.iterator();
	 		WlTaskRowVO[] WlTaskRowvos= new WlTaskRowVO[WlTaskRows.size()];
	 		for(int i=0;it.hasNext();i++){
	 			taskRowDao.toWlTaskRowVO((WlTaskRow)it.next(), target);
	 			WlTaskRowvos[i]=target;
	 		}
	 		return  WlTaskRowvos;
	 	}else{
	 		taskRowDao.toWlTaskRowVOCollection(WlTaskRows);
	    return  (WlTaskRowVO[])WlTaskRows.toArray(new WlTaskRowVO[0]);
	 	}
	}

    /**
     * @see com.logistics.service.order.WlTaskManageService#createWlTaskRow(com.logistics.entity.order.WlTaskRowVO)
     */
    protected  long handleCreateWlTaskRow(com.logistics.entity.order.WlTaskRowVO WlTaskRowVO)
        throws java.lang.Exception
    {
    	Random rd = new Random();
    	final com.logistics.entity.order.WlTaskRow entity = this.getWlTaskRowDao().wlTaskRowVOToEntity(WlTaskRowVO);
    	entity.setId(System.currentTimeMillis()+rd.nextInt());
    	return this.getWlTaskRowDao().create(entity).getId();
    }

    /**
     * @see com.logistics.service.order.WlTaskManageService#updateWlTaskRow(com.logistics.entity.order.WlTaskRowVO)
     */
    protected  void handleUpdateWlTaskRow(com.logistics.entity.order.WlTaskRowVO WlTaskRowVO)
        throws java.lang.Exception
    {
    	com.logistics.entity.order.WlTaskRow entity =this.getWlTaskRowDao().load(WlTaskRowVO.getId());
    	System.out.println("WlTaskRowVO.getTaskRype:::::::::"+WlTaskRowVO.getTaskType());
    	System.out.println("WlTaskRowVO.getUnloadUnitAddress:::::::::"+WlTaskRowVO.getUnloadUnitAddress());
    	System.out.println("WlTaskRowVO.getEndFetchTime:::::::::"+WlTaskRowVO.getEndFetchTime());
    	//System.out.println("WlTaskRowVO.getUnloadUnitAddress:::::::::"+WlTaskRowVO.g);
    	this.getWlTaskRowDao().wlTaskRowVOToEntity(WlTaskRowVO, entity, false);
    	//wlTaskRowVOToEntity(WlTaskRowVO);
    	this.getWlTaskRowDao().update(entity);
    }

    /**
     * @see com.logistics.service.order.WlTaskManageService#deleteWlTaskRow(long)
     */
    protected  void handleDeleteWlTaskRow(long id)
        throws java.lang.Exception
    {
    	this.getWlTaskRowDao().remove(id);
    }

    /**
     * @see com.logistics.service.order.WlTaskManageService#getWltrwithor(com.logistics.entity.order.WltrwithorVO, int, int, java.lang.String)
     */
    protected  com.logistics.entity.order.WltrwithorVO[] handleGetWltrwithor(com.logistics.entity.order.WltrwithorVO Wltrwithor, int pageNumber, int pageSize, java.lang.String orderBy)
        throws java.lang.Exception
    {
    	WltrwithorDao trDao=this.getWltrwithorDao();
	 	Collection WlTrs = trDao.getWltrwithor(Wltrwithor,pageNumber,pageSize,orderBy);
	 	if(Wltrwithor.getOrderRowId()!=0 ){//???????????????????????????????????????
	 		com.logistics.entity.order.WltrwithorVO target= new WltrwithorVO();
	 		target.setOrderRowId(1);
	 		Iterator it=WlTrs.iterator();
	 		WltrwithorVO[] WlTrvos= new WltrwithorVO[WlTrs.size()];
	 		for(int i=0;it.hasNext();i++){
	 			trDao.toWltrwithorVO((Wltrwithor)it.next(), target);
	 			WlTrvos[i]=target;
	 		}
	 		return  WlTrvos;
	 	}else{
	 		trDao.toWltrwithorVOCollection(WlTrs);
	 		return  (WltrwithorVO[])WlTrs.toArray(new WltrwithorVO[0]);
	 	}
	}

    /**
     * @see com.logistics.service.order.WlTaskManageService#createWltrwithor(com.logistics.entity.order.WltrwithorVO)
     */
    protected  long handleCreateWltrwithor(com.logistics.entity.order.WltrwithorVO WltrwithorVO)
        throws java.lang.Exception
    {
    	Random rd = new Random();
    	final com.logistics.entity.order.Wltrwithor entity = this.getWltrwithorDao().wltrwithorVOToEntity(WltrwithorVO);
    	entity.setId(System.currentTimeMillis()+rd.nextInt());
    	return this.getWltrwithorDao().create(entity).getId();
    }

    /**
     * @see com.logistics.service.order.WlTaskManageService#updateWltrwithor(com.logistics.entity.order.WltrwithorVO)
     */
    protected  void handleUpdateWltrwithor(com.logistics.entity.order.WltrwithorVO WltrwithorVO)
        throws java.lang.Exception
    {
    	com.logistics.entity.order.Wltrwithor entity = this.getWltrwithorDao().load(WltrwithorVO.getId());
    		this.getWltrwithorDao().wltrwithorVOToEntity(WltrwithorVO,entity,false);
    	this.getWltrwithorDao().update(entity);
    }

    /**
     * @see com.logistics.service.order.WlTaskManageService#deleteWltrwithor(long)
     */
    protected  void handleDeleteWltrwithor(long id)
        throws java.lang.Exception
    {
    	this.getWltrwithorDao().remove(id);
    }

	

	protected WlVoitureTaskVO[] handleGetVoitureByOrder(java.lang.String orderRowID) throws Exception {
		String[] orderRowIDs= orderRowID.split(",");
		Set orderset=new TreeSet();
		for(int i=0;i<orderRowIDs.length;i++){
			orderset.add(orderRowIDs[i]);
		   }
		Object[]orderRowIDso=orderset.toArray();
		System.out.println("orderRowIDsorderRowIDs="+orderRowIDs.length);
		Object[] orderRow=new Object[orderRowIDso.length];
		try{
			for(int i=0;i<orderRowIDso.length;i++){
				System.out.println("orderRowIDsorderRowIDs==="+orderRowIDso[i]);
				orderRow[i]=this.getWlOrderRowDao().load(Long.parseLong((String)orderRowIDso[i]));
			}
			System.out.println("taskpipupl=22=orderset="+orderset.size());
			System.out.println("taskpipupl=22=order="+orderRow.length);
			List voitureTaskList= this.getWlVoitureDao().getVoitureByOrder(orderRow,false); 
			
			System.out.println("taskpipupl=22=ordfdfdfer="+voitureTaskList.size());
			/*WlVoitureTaskVO[] re=new WlVoitureTaskVO[voitureTaskList.size()];
			for(int j=0;j<voitureTaskList.size();j++){
				re[j]=(WlVoitureTaskVO)voitureTaskList.get(j);
			}*/
			
				return (WlVoitureTaskVO[])voitureTaskList.toArray(new WlVoitureTaskVO[0]);
		}catch (Throwable   e){
			e.printStackTrace();
			throw new Exception(e);
		}
	}

	protected WlTaskVO[] handleBuildTaskByOrderAndVoi(java.lang.String orderRowID,java.lang.String VoitureID,long managerID)
			throws Exception {
			
			String[]  VoitureIDs=VoitureID.split(",");
			String[] orderRowIDs= orderRowID.split(",");
			List orderRiwIDList =new ArrayList();
			
			for(int i=0;i<orderRowIDs.length;i++){
				orderRiwIDList.add(orderRowIDs[i]);
				}
			WlTaskVO[] re=new WlTaskVO[VoitureIDs.length];
			for(int j=0;j<VoitureIDs.length;j++){
				com.logistics.entity.order.WlTask wlTask=this.getWlTaskDao().create(new Date(), this.getPeopleDao().load(managerID), new Date());
				//Set taskls=new TreeSet();
				for(int i=0;i<orderRiwIDList.size();i++){
				
					com.logistics.entity.order.WlOrder wlorder = this.getWlOrderRowDao().load(Long.parseLong((String)orderRiwIDList.get(i))).getOrder();
					com.logistics.entity.car.WlVoiture voi= this.getWlVoitureDao().load(Long.parseLong(VoitureIDs[j]));
					com.logistics.entity.orga.People md=voi.getMasterDriver();
					System.out.println("wlorder.getPlanFetchTime()::::"+wlorder.getPlanFetchTime());
					com.logistics.entity.order.WlTaskRow wlTaskRowNew=new com.logistics.entity.order.WlTaskRowImpl();
					//this.getWlTaskRowDao().create(md.getTel(), wlorder.getFetchMan(),wlorder.getFetchTel(),wlorder.getFetchCompany(),
					//wlorder.getFetchCompanyAddress(),md,wlorder.getPath(),wlorder.getPlanFetchTime(),wlorder.getPlanUnloadTime(),"0", wlTask,
					//"零担",  wlorder.getUnloadMan(), wlorder.getUnloadTel(), wlorder.getUnloadCompany(), wlorder.getUnloadCompanyAddress(), voi);
					
					wlTaskRowNew.setDriverTel(md.getTel());
					wlTaskRowNew.setFetchMan(wlorder.getFetchMan());
					wlTaskRowNew.setFetchTel(wlorder.getFetchTel());
					wlTaskRowNew.setFetchUnit(wlorder.getFetchCompany());
					wlTaskRowNew.setFetchUnitAddress(wlorder.getFetchCompanyAddress());
					wlTaskRowNew.setMasterDriver(md);
					wlTaskRowNew.setPath(wlorder.getPath());
					wlTaskRowNew.setPlanFetchTime(wlorder.getPlanFetchTime());
					wlTaskRowNew.setPlanUnloadTime(wlorder.getPlanUnloadTime());
					wlTaskRowNew.setStatus("0");
					wlTaskRowNew.setTask(wlTask);
					wlTaskRowNew.setTaskType("零担");
					wlTaskRowNew.setUnloadMan(wlorder.getUnloadMan());
					wlTaskRowNew.setUnloadTel(wlorder.getUnloadTel());
					wlTaskRowNew.setUnloadUnit(wlorder.getUnloadCompany());
					wlTaskRowNew.setUnloadUnitAddress( wlorder.getUnloadCompanyAddress());
					wlTaskRowNew.setVoiture(voi);
					com.logistics.entity.order.WlTaskRow wlTaskRow =	this.getWlTaskRowDao().create(wlTaskRowNew);
						//Set trwithorls=new TreeSet();
					for(int g=i;g<orderRiwIDList.size();g++){
						//System.out.println("gggggggggggggggg::::"+g);
						com.logistics.entity.order.WlOrder order = this.getWlOrderRowDao().load(Long.parseLong(orderRowIDs[g])).getOrder();
						if(order.equals(wlorder)){
							//根据orderrow create trwithor
							com.logistics.entity.order.WlOrderRow wlorderrow = this.getWlOrderRowDao().load(Long.parseLong(orderRowIDs[g]));
							com.logistics.entity.order.Wltrwithor  trwithor= this.getWltrwithorDao().create(wlorderrow.getUnitNum(),wlorderrow.getGoodsState(), 0, 0, 0, 0, wlorderrow.getGoodsVolume(), wlorderrow.getProductNum(), wlorderrow.getGoodsWeight(),wlorderrow, 0, wlorderrow.getGoodsState(), wlTaskRow);
							//trwithorls.add(trwithor);
							if(g>i)orderRiwIDList.remove(g);
						}
					}
					//wlTaskRow.setTrwithor(trwithorls);
					//taskls.add(wlTaskRow);
				}
				//wlTask.setTaskRow(taskls);
				re[j]=this.getWlTaskDao().toWlTaskVO(this.getWlTaskDao().load(wlTask.getId()));
				
			 }
			  
			  
				/*com.logistics.entity.order.WlTaskVO searchtaskvo =	new com.logistics.entity.order.WlTaskVO();
				searchtaskvo.setId(wlTask.getId());
				 System.out.println("WlTaskVO.getCreateTime()==="+((com.logistics.entity.order.WlTask)this.getWlTaskDao().getWlTask(searchtaskvo, 0, 0, "0").get(0)).getTaskRow());
			  re[j]=this.getWlTaskDao().toWlTaskVO((com.logistics.entity.order.WlTask)this.getWlTaskDao().getWlTask(searchtaskvo, 0, 0, "0").get(0));
			  */
		 	
			return re;
		

	}

	@Override
	protected WlVoitureTaskVO[] handleGetOrtherVoitureByOrder(String orderRowID, int timeRange) throws Exception {
		String[] orderRowIDs= orderRowID.split(",");//根据选择的orderRow，得到相关的order(orderset)
		Set orderset=new TreeSet();
		for(int i=0;i<orderRowIDs.length;i++){
			orderset.add(orderRowIDs[i]);
		   }
		Object[]orderRowIDso=orderset.toArray();
		System.out.println("orderRowIDsorderRowIDs="+orderRowIDs.length);
		Object[] orderRow=new Object[orderRowIDso.length];
		try{
			for(int i=0;i<orderRowIDso.length;i++){
				System.out.println("orderRowIDsorderRowIDs==="+orderRowIDso[i]);
				orderRow[i]=this.getWlOrderRowDao().load(Long.parseLong((String)orderRowIDso[i]));
			}
			System.out.println("taskpipupl=22=orderset="+orderset.size());
			System.out.println("taskpipupl=22=order="+orderRow.length);
			List voitureTaskList= this.getWlVoitureDao().getVoitureByOrder(orderRow,true); 
			System.out.println("taskpipupl=22=ordfdfdfer="+voitureTaskList.size());
			WlVoitureTaskVO[] re=new WlVoitureTaskVO[voitureTaskList.size()];
			for(int j=0;j<voitureTaskList.size();j++){
				re[j]=(WlVoitureTaskVO)voitureTaskList.get(j);
			}
				return re;
		}catch (Throwable   e){
			e.printStackTrace();
			throw new Exception(e);
		}
		
	}

	
	protected WlTaskVO[] handleAddTaskRowByOrder(String orderRowID,String taskID, String orderID) throws Exception {
		//WlTaskVO taskVO=new WlTaskVO();
		//taskVO.setId(new Long(taskID));
		//List oldtask=this.getWlTaskDao().getWlTask(taskVO, 0, 0, "0");
		WlTask taskr=this.getWlTaskDao().load(Long.parseLong(taskID));
		TreeMap orderIDList=new TreeMap();
		TreeMap taskRowIDList=new TreeMap();
		String[] orderIDs=orderID.split(",");
		String[] orderRowIDs=orderRowID.split(":");
		for(int i=0;i<orderIDs.length;i++){
			orderIDList.put(Long.parseLong((String)orderIDs[i]), orderRowIDs[i]);
		}
		//WlTask taskr=(WlTask)oldtask.get(0);//taskImp
		Set taskRowSet=(Set)taskr.getTaskRow();
		Object[] taskRows=taskRowSet.toArray();
		com.logistics.entity.car.WlVoiture voi= ((WlTaskRow)taskRows[0]).getVoiture();//默认一单对一车时，可以这样的获得车辆；应该从页面中传入这个id  遗留
		for(int i=0;i<taskRows.length;i++){
			WlTaskRow taskRow=null;
			taskRow=(WlTaskRow)taskRows[i];
			if(taskRow.getTrwithor().size()>0)
			taskRowIDList.put(((Wltrwithor)((Set)taskRow.getTrwithor()).toArray()[0]).getOrderRow().getId(),taskRow.getId());//getOrder!!!
		}
		while(orderIDList.size()!=0){
			Long orderid=(Long)orderIDList.firstKey();
			String[] orderRowids=((String)orderIDList.get(orderid)).split(",");
			com.logistics.entity.order.WlTaskRow taskRow;
			com.logistics.entity.order.WlOrder wlorder = this.getWlOrderRowDao().load(Long.parseLong(orderRowids[0])).getOrder();//0必有值，不算遗留
			//com.logistics.entity.order.WlOrder wlorder =wlorderrow0.getOrder();
			
			if(!taskRowIDList.containsKey(orderid)){//add taskRow
				//create taskRowByOrder
				//((WlTaskRowVO)taskRowVos[((Integer)taskRowIDList.get(orderid)).intValue()]).
				com.logistics.entity.orga.People md=voi.getMasterDriver();
				com.logistics.entity.order.WlTaskRow wlTaskRowNew=new com.logistics.entity.order.WlTaskRowImpl();
				wlTaskRowNew.setDriverTel(md.getTel());
				wlTaskRowNew.setFetchMan(wlorder.getFetchMan());
				wlTaskRowNew.setFetchTel(wlorder.getFetchTel());
				wlTaskRowNew.setFetchUnit(wlorder.getFetchCompany());
				wlTaskRowNew.setFetchUnitAddress(wlorder.getFetchCompanyAddress());
				wlTaskRowNew.setMasterDriver(md);
				wlTaskRowNew.setPath(wlorder.getPath());
				wlTaskRowNew.setPlanFetchTime(wlorder.getPlanFetchTime());
				wlTaskRowNew.setPlanUnloadTime(wlorder.getPlanUnloadTime());
				wlTaskRowNew.setStatus("0");
				wlTaskRowNew.setTask(taskr);
				wlTaskRowNew.setTaskType("零担");
				wlTaskRowNew.setUnloadMan(wlorder.getUnloadMan());
				wlTaskRowNew.setUnloadTel(wlorder.getUnloadTel());
				wlTaskRowNew.setUnloadUnit(wlorder.getUnloadCompany());
				wlTaskRowNew.setUnloadUnitAddress( wlorder.getUnloadCompanyAddress());
				wlTaskRowNew.setVoiture(voi);
				taskRow =	this.getWlTaskRowDao().create(wlTaskRowNew);
				
			}else{
				taskRow= this.getWlTaskRowDao().load((Long)taskRowIDList.get(orderid));
			}
			
			for(int i=0;i<orderRowids.length;i++){
				com.logistics.entity.order.WlOrderRow wlorderrow = this.getWlOrderRowDao().load(Long.parseLong(orderRowids[i]));
				com.logistics.entity.order.Wltrwithor  trwithor= this.getWltrwithorDao().create(wlorderrow.getUnitNum(),wlorderrow.getGoodsState(), 0, 0, 0, 0, wlorderrow.getGoodsVolume(), wlorderrow.getProductNum(), wlorderrow.getGoodsWeight(),wlorderrow, 0, wlorderrow.getGoodsState(),taskRow);
			}
			orderIDList.remove(orderid);
		}
		WlTaskVO[] re=new WlTaskVO[1];
		re[0]=this.getWlTaskDao().toWlTaskVO(this.getWlTaskDao().load(new Long(taskID)));
		return re;
		
	}

	@Override
	protected WlTaskVO[] handleGetSimilarWlTask(String orderRowID,int pageNumber, int pageSize, String orderBy) throws Exception {
		String[] orderRowIDs= orderRowID.split(",");
		List orderPathList=new ArrayList();
		for(int i=0;i<orderRowIDs.length;i++){
			Long pathID=this.getWlOrderRowDao().load(Long.parseLong(orderRowIDs[i])).getOrder().getPath().getId();
			if(!orderPathList.contains(pathID)){
				orderPathList.add(pathID);
			}
		}
		List re=this.getWlTaskDao().getSimilarWlTaskByOrderPathIDs(orderPathList,pageNumber,pageSize,orderBy);
		WlTaskVO[] res=new WlTaskVO[re.size()];
		//Object[] res=new Object[re.size()];
		re.toArray(res);
		return res;
	}

	protected void handleSendTask(String ids) throws Exception {
		String[] taskIDs= ids.split(",");
		this.getWlTaskDao().sendTask(taskIDs);
	}

	protected WlTaskVO[] handleGetTaskVOByOrderIDs(String orderIDs)	throws Exception {
		String[] orderIDArrays= orderIDs.split(",");
		ArrayList ids=new ArrayList();
		for(int i=0;i<orderIDArrays.length;i++){
			/*WlTaskVO queryRelvo=new WlTaskVO();
			WlTaskRowVO queryRelTaskRow=new WlTaskRowVO();
			WltrwithorVO queryRelTr=new WltrwithorVO();
			WlOrderRowVO queryRelOrderRow=new WlOrderRowVO();
			queryRelOrderRow.setId(Long.valueOf(orderIDArrays[i]));
			queryRelTr.setOrderRow(queryRelOrderRow);
			WltrwithorVO[] queryRelTrArr=new WltrwithorVO[1];
			queryRelTrArr[0]=queryRelTr;
			queryRelTaskRow.setTrwithor(queryRelTrArr);
			WlTaskRowVO[] queryRelTaskRowArr=new WlTaskRowVO[1];
			queryRelTaskRowArr[0]=queryRelTaskRow;
			queryRelvo.setTaskRow(queryRelTaskRowArr);
			this.getWlTask(queryRelvo, 0, 0, "0");*/
			ids.add(Long.parseLong(orderIDArrays[i]));
		}
		List re=this.getWlTaskDao().getTaskVOByOrderIDs(ids);
		this.getWlTaskDao().toWlTaskVOCollection(re);
		return (WlTaskVO[])re.toArray(new WlTaskVO[0]);
	}
	
	@Override
	protected Object[] handleGetRelTaskOrderByVoitureIDs(String voitureIDs) throws Exception {
		String[] voitureIDsArrays= voitureIDs.split(",");
		ArrayList ids=new ArrayList();
		for(int i=0;i<voitureIDsArrays.length;i++){
			ids.add(Long.parseLong(voitureIDsArrays[i]));
		}
		WlTaskDao taskDao=this.getWlTaskDao();
	 	Collection WlTasks = taskDao.getRelTaskByVoitureIDs(ids);
		String orderIdString="";
		ArrayList orders=new ArrayList();		//orderRowIdString="";
		Iterator it=WlTasks.iterator();
		while(it.hasNext()){
			WlTask task=(WlTask)it.next();
			Iterator itRow=task.getTaskRow().iterator();
			while(itRow.hasNext()){
				WlTaskRow taskRow=(WlTaskRow)itRow.next();
				Iterator itTr=taskRow.getTrwithor().iterator();
				if(itTr.hasNext()){//taskRow中的tr来自一个order
					Wltrwithor tr=(Wltrwithor)itTr.next();
					if(orderIdString.indexOf(String.valueOf(tr.getOrderRow().getOrder().getId()))==-1){
						orderIdString=orderIdString+","+tr.getOrderRow().getOrder().getId();
						orders.add(tr.getOrderRow().getOrder());
					}
				}
			}
	 	}
		taskDao.toWlTaskVOCollection(WlTasks);
		WlTaskVO[] reTask= (WlTaskVO[])WlTasks.toArray(new WlTaskVO[0]);
		
		this.getWlOrderDao().toWlOrderVOCollection(orders);
		WlOrderVO[] reOrder= (WlOrderVO[])orders.toArray(new WlOrderVO[0]);
		
		Object[] re=new Object[reTask.length+1+orders.size()];
		re[0]=reTask.length;
		for(int i=0;i<reTask.length;i++){
			re[i+1]=reTask[i];
		}
		for(int i=0;i<orders.size();i++){
			re[i+reTask.length+1]=reOrder[i];
		}
		/*Object[] re=new Object[orders.size()];
		for(int i=0;i<orders.size();i++){
			re[i]=reOrder[i];
		}*/
		//re[reTask.length]=reOrder;
		return re;
		
	}
	@Override
	protected WlOrderVO[] handleGetOrderVOByOrderIds(String orderIds)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}
