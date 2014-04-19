// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.service.order;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.Set;
import java.util.TreeSet;

import org.hibernate.Session;

import com.logistics.ServiceLocator;
import com.logistics.entity.basic.WlPath;
import com.logistics.entity.basic.WlPathVO;
import com.logistics.entity.basic.WlPlaceVO;
import com.logistics.entity.order.WlOrder;
import com.logistics.entity.order.WlOrderDao;
import com.logistics.entity.order.WlOrderRow;
import com.logistics.entity.order.WlOrderRowDao;
import com.logistics.entity.order.WlOrderRowVO;
import com.logistics.entity.order.WlOrderVO;
import com.logistics.entity.order.WlTaskVO;
import com.logistics.entity.order.crud.WlOrderRowManageableService;
import com.logistics.entity.orga.OrgaInfoDao;
import com.logistics.entity.orga.OrgaInfoVO;
import com.logistics.util.ProjectUtil;

/**
 * @see com.logistics.service.order.WlorderManageService
 */
public class WlorderManageServiceImpl
    extends com.logistics.service.order.WlorderManageServiceBase
{

    /**
     * @see com.logistics.service.order.WlorderManageService#getWlOrder(com.logistics.entity.order.WlOrderVO, int, int, java.lang.String)
     */
    protected  com.logistics.entity.order.WlOrderVO[] handleGetWlOrder(com.logistics.entity.order.WlOrderVO wlorder, int pageNumber, int pageSize, java.lang.String orderBy)
        throws java.lang.Exception
    {
    	WlOrderDao orderDao=this.getWlOrderDao();
	 	Collection orders = orderDao.getWlOrder(wlorder,pageNumber,pageSize,orderBy);
	 	orderDao.toWlOrderVOCollection(orders);
	    return  (WlOrderVO[])orders.toArray(new WlOrderVO[0]);
	 }

    /**
     * @see com.logistics.service.order.WlorderManageService#createWlOrder(com.logistics.entity.order.WlOrderVO)
     */
    protected  long handleCreateWlOrder(com.logistics.entity.order.WlOrderVO wlorder)
        throws java.lang.Exception
    {
    	
    	Random rd = new Random();
    	final com.logistics.entity.order.WlOrder entity = this.getWlOrderDao().wlOrderVOToEntity(wlorder);
    	entity.setId(System.currentTimeMillis()+rd.nextInt());
    	return this.getWlOrderDao().create(entity).getId();
    	
    }

    /**
     * @see com.logistics.service.order.WlorderManageService#updateWlOrder(com.logistics.entity.order.WlOrderVO)
     */
    protected  void handleUpdateWlOrder(com.logistics.entity.order.WlOrderVO wlOrder)
        throws java.lang.Exception
    {
    	//final com.logistics.entity.order.WlOrder entity = this.getWlOrderDao().wlOrderVOToEntity(wlOrder);
    	com.logistics.entity.order.WlOrder entity = this.getWlOrderDao().load(wlOrder.getId());
    	this.getWlOrderDao().wlOrderVOToEntity(wlOrder, entity, false);
    	this.getWlOrderDao().update(entity);
    	
    }

    /**
     * @see com.logistics.service.order.WlorderManageService#deleteWlOrder(long)
     */
    protected  void handleDeleteWlOrder(long id)
        throws java.lang.Exception
    {
    	this.getWlOrderDao().deleteWlOrder(id);
    	//WlOrderRowManageableService srv = ServiceLocator.instance().getWlOrderRowManageableService(); 
    	
        
    }

    /**
     * @see com.logistics.service.order.WlorderManageService#getWlOrderRow(com.logistics.entity.order.WlOrderRowVO, int, int, java.lang.String)
     */
    protected  com.logistics.entity.order.WlOrderRowVO[] handleGetWlOrderRow(com.logistics.entity.order.WlOrderRowVO wlorder, int pageNumber, int pageSize, java.lang.String orderBy)
        throws java.lang.Exception
    {
    	WlOrderRowDao orderRowDao=this.getWlOrderRowDao();
	 	Collection orderRows = orderRowDao.getWlOrderRow(wlorder,pageNumber,pageSize,orderBy);
	 	orderRowDao.toWlOrderRowVOCollection(orderRows);
	    return  (WlOrderRowVO[])orderRows.toArray(new WlOrderRowVO[0]);
    }

    /**
     * @see com.logistics.service.order.WlorderManageService#createWlOrderRow(com.logistics.entity.order.WlOrderRowVO)
     */
    protected  long handleCreateWlOrderRow(com.logistics.entity.order.WlOrderRowVO wlOrderRow)
        throws java.lang.Exception
    {
    	Random rd = new Random();
    	final com.logistics.entity.order.WlOrderRow entity = this.getWlOrderRowDao().wlOrderRowVOToEntity(wlOrderRow);
    	entity.setId(System.currentTimeMillis()+rd.nextInt());
    	return this.getWlOrderRowDao().create(entity).getId();

    }

    /**
     * @see com.logistics.service.order.WlorderManageService#updateWlOrderRow(com.logistics.entity.order.WlOrderRowVO)
     */
    protected  void handleUpdateWlOrderRow(com.logistics.entity.order.WlOrderRowVO wlOrderRow)
        throws java.lang.Exception
    {
    	final com.logistics.entity.order.WlOrderRow entity = this.getWlOrderRowDao().wlOrderRowVOToEntity(wlOrderRow);
    	this.getWlOrderRowDao().update(entity);
    }

    /**
     * @see com.logistics.service.order.WlorderManageService#deleteWlOrderRow(long)
     */
    protected  void handleDeleteWlOrderRow(long id)
        throws java.lang.Exception
    {
    	this.getWlOrderRowDao().remove(id);
    }

	@Override
	protected WlOrderRowVO[] handleGetOrderRowByOrderId(long orderId) throws Exception {
		WlOrderRowDao orderRowDao=this.getWlOrderRowDao();
	 	Collection orderRows = orderRowDao.getOrderRowByOrderId(orderId);
	 	orderRowDao.toWlOrderRowVOCollection(orderRows);
	    return  (WlOrderRowVO[])orderRows.toArray(new WlOrderRowVO[0]);
	}

	/**
     * @返回Object[0]=[pathName,orderArray[正路径orderInfos[startDate,endDate,sumWeight,orderID]],[反路径[startDate,endDate,sumWeight,orderID]]]
     */
	
	protected void getOrderList(long startPathID,java.util.List reList)  {
		//WlPathVO pathvo=new WlPathVO();
		//pathvo.setId(pathID);
		//1
		WlOrderVO ordervo=new WlOrderVO();
		if(startPathID!=0)ordervo.setRemark(String.valueOf(startPathID));//startPathID起点必不为0
		//if(endPathID!=0)ordervo.setPathName(String.valueOf(endPathID));//endPathID起点必为0
		List orderList=this.getWlOrderDao().getWlOrder(ordervo, 0, 0, "path");
		this.getWlOrderDao().toEntities(orderList);
		Set pathIDSet=new TreeSet();
		List pathList=new ArrayList();
		List pathOrderList=new ArrayList();
		//2
		List pathOrder=new ArrayList();
		orderList.remove(orderList.size()-1);
		if(orderList.size()>0)System.out.println("((List)orderList).get(0).getClass():"+(orderList).get(0).getClass());
		//Object[] orderArray=orderList.toArray();
		//for(int i=0;i<orderArray.length;i++){
		for(int i=0;i<orderList.size();i++){
			WlOrder order=(WlOrder)orderList.get(i);//orderArray[i];
			if(pathIDSet.add(order.getPath().getId())){
				pathList.add(order.getPath());
				pathOrderList.add(pathOrder);
				pathOrder=new ArrayList();
				pathOrder.add(order);
			}else{
				pathOrder.add(order);
			}
		}
		//3
		List repathOrderList=new ArrayList();
		List repathOrder=new ArrayList();
		WlPathVO pathvo=new WlPathVO();
		WlPlaceVO endplacevo=new WlPlaceVO();
		endplacevo.setId(startPathID);
		for(int i=0;i<pathList.size();i++){
			WlPath path=(WlPath)pathList.get(i);//获得相反路径的方法可以放到pathImpl中
			/*WlPlaceVO stplacevo=new WlPlaceVO();
			stplacevo.setId(path.getEndPlace().getId());
			pathvo.setStartPlaceID(stplacevo);
			pathvo.setEndPlaceID(endplacevo);*/
			//List reorderList=this.getWlOrderDao().getWlOrder(ordervo, 0, 0, "0");
			WlOrderVO ordervo1=new WlOrderVO();
			ordervo1.setRemark(String.valueOf(path.getEndPlace().getId()));
			ordervo1.setPathName(String.valueOf(startPathID));
			List reorders=this.getWlOrderDao().getWlOrder(ordervo1, 0, 0, "0");
			this.getWlOrderDao().toEntities(reorders);
			reorders.remove(reorders.size()-1);
			repathOrderList.add(reorders);
			/*Object[] reorderArray=reorders.toArray();
			for(int y=0;y<reorderArray.length;y++){
				repathOrder.add((WlOrder)reorderArray[y]);
			}
			repathOrderList.add(repathOrder);*/
			//从4中加入
			Object[] res=new Object[3];
			res[0]=pathList.get(i);
			res[1]=pathOrderList.get(i);
			res[2]=repathOrderList.get(i);
			reList.add(res);
			getOrderList(path.getEndPlace().getId().longValue(),reList);
		}
		//4合并到3循环中
		/*for(int i=0;i<pathList.size();i++){
			Object[] res=new Object[3];
			res[0]=pathList.get(i);
			res[1]=pathOrderList.get(i);
			res[2]=repathOrderList.get(i);
			reList.add(res);
			getOrderList(long startPathID,long endPathID,java.util.List reList)*/
		//return reList;
	}

	protected Object[] handleGetOrderChart() throws java.lang.Exception {
		
		
		List reList=new ArrayList();
		getOrderList(1,reList);
		Object[] reObject =new Object[reList.size()+1];
		
		
		//获得所有未处理订单所在的时间范围
		List d=this.getWlOrderDao().getDateRange();
		java.util.Calendar calendarBegin=new java.util.GregorianCalendar();
		java.util.Calendar calendarEnd=new java.util.GregorianCalendar();
		List dateReturn=new ArrayList();
		if(d.size()>0){
		System.out.println("d.get(0).alss:"+d.get(0).getClass());
		System.out.println("d.size():"+d.size());
		Object[] dd=(Object[])d.get(0);
		System.out.println("dd.length:"+dd.length);
		System.out.println("dd.toString:"+dd.toString());
		System.out.println("dd.get(0):"+dd[0]);
		System.out.println("dd.get(1):"+dd[1]);
		calendarBegin.setTime((Date)dd[0]);
		calendarEnd.setTime((Date)dd[1]);
		dateReturn.add(ProjectUtil.getDateStr((Date)dd[0]));
		//while(calendarBegin.compareTo(calendarEnd)!=0){
		while(!ProjectUtil.getDateStr(calendarBegin.getTime()).equals(ProjectUtil.getDateStr(calendarEnd.getTime()))){
			calendarBegin.add(java.util.Calendar.DAY_OF_MONTH,1);
			System.out.println("calendarBegin.getTime():"+calendarBegin.getTime());
			dateReturn.add(ProjectUtil.getDateStr(calendarBegin.getTime()));
		}
		//dateReturn.add(ProjectUtil.getFullDateStr((Date)dd[1]));
		calendarBegin.setTime((Date)dd[0]);
		}
		reObject[reList.size()]=(Object[])dateReturn.toArray();
		
		
		//----
		for(int i=0;i<reList.size();i++){  
			Object[] relisti=(Object[])reList.get(i);
			WlPath path=(WlPath)relisti[0];
			Object[] reObjectElem =new Object[3];
			reObjectElem[0]=path.getPathName();//[pathName,
			
			List orderList=(List)relisti[1];
			Object[] orderArray=new Object[orderList.size()];
			
			for(int j=0;j<orderList.size();j++){
				String[] orderInfos= new String[4];
				WlOrder order=(WlOrder)(orderList.get(j));
				java.util.Calendar planFetch=new java.util.GregorianCalendar();
				planFetch.setTime(order.getPlanFetchTime());
				java.util.Calendar planUnload=new java.util.GregorianCalendar();
				planUnload.setTime(order.getPlanUnloadTime());
				
				int betint=ProjectUtil.getDaysBetween(planFetch,calendarBegin);
				System.out.println("datebetween      :"+order.getPlanFetchTime()   +" - "+d.get(0)+" = " +betint);
				
				//orderInfos[0]=ProjectUtil.getFullDateStr(order.getPlanFetchTime());
				//orderInfos[1]=ProjectUtil.getFullDateStr(order.getPlanUnloadTime());
				orderInfos[0]=String.valueOf(betint);
				orderInfos[1]=String.valueOf(ProjectUtil.getDaysBetween(planUnload,calendarBegin));
				orderInfos[2]=String.valueOf(this.getWlOrderDao().getSumSuttle(order.getId()));
				orderInfos[3]=order.getId().toString();
				orderArray[j]=orderInfos;
			}
			reObjectElem[1]=orderArray;
			//-----
			
			List reorderList=(List)relisti[2];
			Object[] reorderArray=new Object[reorderList.size()];
			
			for(int j=0;j<reorderList.size();j++){
				String[] reorderInfos= new String[4];
				WlOrder order=(WlOrder)(reorderList.get(j));
				java.util.Calendar planFetch=new java.util.GregorianCalendar();
				planFetch.setTime(order.getPlanFetchTime());
				java.util.Calendar planUnload=new java.util.GregorianCalendar();
				planUnload.setTime(order.getPlanUnloadTime());
				reorderInfos[0]=String.valueOf(ProjectUtil.getDaysBetween(planFetch,calendarBegin));
				reorderInfos[1]=String.valueOf(ProjectUtil.getDaysBetween(planUnload,calendarBegin));
				//reorderInfos[0]=ProjectUtil.getFullDateStr(order.getPlanFetchTime());
				//reorderInfos[1]=ProjectUtil.getFullDateStr(order.getPlanUnloadTime());
				reorderInfos[2]=String.valueOf(this.getWlOrderDao().getSumSuttle(order.getId()));
				reorderInfos[3]=order.getId().toString();
				reorderArray[j]=reorderInfos;
			}
			reObjectElem[2]=reorderArray;
			reObject[i]=reObjectElem;
		}
		
	
		//return reObject;
		Object[] realReturn=new Object[reObject.length];
		dateReturn.add(0, "运输路径");
		String t=(String)dateReturn.get(0);
		for(int m=1;m<dateReturn.size();m++){
			t=t+","+dateReturn.get(m);
		}
		//realReturn[0]=dateReturn.toArray();
		realReturn[0]=t;
		//String[][] chartOrderData=new String[reObject.length-1][dateReturn.size()+1];
		Object[][] chartOrderData=new Object[reObject.length-1][dateReturn.size()];
		System.out.println("dateReturn.size()+1:"+dateReturn.size()+"    reObject.length-1:"+reObject.length);
		for(int i=0;i<reObject.length-1;i++){
			Object[] pathorder=(Object[])reObject[i];
			chartOrderData[i][0]=(String)pathorder[0];//第一列值为pathname
			Object[] orderArray=(Object[])pathorder[1];//获得正路径orderArray[orderInfos[startDateint,endDateint,sumWeight,orderID]]
			Object[] reorderArray=(Object[])pathorder[2];
			int pathorderIndex=0;
			for(int j=0;j<orderArray.length;j++){
				Object[] orderInfos=(Object[])orderArray[j];
				int beginInt=Integer.valueOf((String)orderInfos[0]);
				int endInt=Integer.valueOf((String)orderInfos[1]);
				System.out.println("beginInt:"+beginInt+"    endInt:"+endInt);
				if(beginInt==endInt){
					chartOrderData[i][beginInt+1]=chartOrderData[i][beginInt+1]+"<br>&nbsp;&nbsp;<input   onclick='getChartOrder("+(String)orderInfos[3]+","+ pathorderIndex +","+i+",this.checked)'   type='checkbox'/>&nbsp;&nbsp;&nbsp;<font color='red'>&larr; "+(String)orderInfos[2]+" &rarr;</font>";
				}else{	
					chartOrderData[i][beginInt+1]=chartOrderData[i][beginInt+1]+"<br>&nbsp;&nbsp;<input   onclick='getChartOrder("+(String)orderInfos[3]+","+ pathorderIndex +","+i+",this.checked)'   type='checkbox'/>&nbsp;&nbsp;&nbsp;<font color='red'>&larr; "+(String)orderInfos[2]+" </font>";
				}
				pathorderIndex++;
				while(beginInt<endInt){
					beginInt++;
					if(beginInt<endInt){
						chartOrderData[i][beginInt+1]=chartOrderData[i][beginInt+1]+"<br> <font color='red'>————</font>";
					}else if(beginInt==endInt){
						chartOrderData[i][endInt+1]=chartOrderData[i][endInt+1]+"<br> <font color='red'>———&rarr;</font>";
					}
				}
				
			}
			
			for(int j=0;j<reorderArray.length;j++){
				Object[] orderInfos=(Object[])reorderArray[j];
				int beginInt=Integer.valueOf((String)orderInfos[0]);
				int endInt=Integer.valueOf((String)orderInfos[1]);
				
				if(beginInt==endInt){
					chartOrderData[i][beginInt+1]=chartOrderData[i][beginInt+1]+"<br> <font color='blue'><——></font>";
				}else{	
					chartOrderData[i][beginInt+1]=chartOrderData[i][beginInt+1]+"<br> <font color='blue'><———</font>";
				}
				pathorderIndex++;
				while(beginInt+1<endInt){
					beginInt++;
					if(beginInt<endInt){
						chartOrderData[i][beginInt+1]=chartOrderData[i][beginInt+1]+"<br> <font color='blue'>————</font>";
					}else if(beginInt==endInt){
						chartOrderData[i][endInt+1]=chartOrderData[i][endInt+1]+"<br> <font color='blue'>———></font>";
					}
				}
				//chartOrderData[i][endInt+1]=chartOrderData[i][endInt+1]+"<br> <font color='blue'>———></font>";
			}
			String r="";
			for(int n=0;n<chartOrderData[i].length;n++){
				r=r+":"+chartOrderData[i][n];
			}
			r=r.substring(1);
			r=r.replaceAll("null<br>", "");
			r=r.replaceAll("null", "");
			System.out.println("r:"+r+"    i:"+i);
			realReturn[i+1]=r;
		}
		/*Object[] dataReturnArray=new Object[chartOrderData.length];
		for(int i=0;i<chartOrderData.length;i++){
			dataReturnArray[]chartOrderData[i]
		}*/
		//realReturn[1]=chartOrderData;
		return realReturn;
		//return null;
	}
	/*protected Object[] handleGetOrderChart() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}*/

	@Override
	protected WlOrderVO[] handleGetOrderVOByOrderIDs(String orderIDs)throws Exception {
		String[] orderIDArrays= orderIDs.split(",");
		List orderList=new ArrayList();
		for(int i=0;i<orderIDArrays.length;i++){
			orderList.add(this.getWlOrderDao().load(Long.valueOf(orderIDArrays[i])));
		}
		this.getWlOrderDao().toWlOrderVOCollection(orderList);
		return (WlOrderVO[])orderList.toArray(new WlOrderVO[0]);
	}

}