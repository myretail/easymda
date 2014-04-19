// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.entity.car;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;

import com.logistics.entity.order.WlOrder;
import com.logistics.entity.order.WlOrderRow;
import com.logistics.entity.order.WlTask;
import com.logistics.entity.order.WlTaskRow;
import com.logistics.entity.order.WlTaskRowVO;
import com.logistics.entity.order.WlVoitureTaskVO;
import com.logistics.entity.basic.DateTimeQuery;
import com.logistics.entity.basic.NumberQuery;
import com.logistics.util.ProjectUtil;
import com.logistics.util.QueryAssCriteriaOrder;
/**
 * @see com.logistics.entity.car.WlVoiture
 */
public class WlVoitureDaoImpl
    extends com.logistics.entity.car.WlVoitureDaoBase
{
    /**
     * @see com.logistics.entity.car.WlVoitureDao#getVoitureByOrder(java.lang.Object[])
     * 返回的voitureTaskVO的List，但task字段的值为是一个String[] 
     */
    protected java.util.List handleGetVoitureByOrder(java.lang.Object[] orderRow,boolean ortherBool)
    {   
    	final Session session = getSession(false);
    	//Set voitureIDSet=new TreeSet();
    	List voitureIDSet=new ArrayList();
    	List voitureSet=new ArrayList();
    	System.out.println("taskpipupl=22==");
    	java.util.Calendar calendarBegin=new java.util.GregorianCalendar();
		java.util.Calendar calendarEnd=new java.util.GregorianCalendar();
		int timeRange=1;// 时间条件的偏移量
    	try
        { 
    		//获得所选订单所在的时间范围
        	for(int i=0;i<orderRow.length;i++){
        		WlOrderRow wlorderRow =(WlOrderRow)orderRow[i];
            	 java.util.Calendar calendar = new java.util.GregorianCalendar();
 	            calendar.setTime(wlorderRow.getOrder().getPlanFetchTime());
            	    if(i==0){
	                	calendarBegin=calendar;
	                }else{
	                	if(calendarBegin.after(calendar))calendarBegin=calendar;
	                }
	                
	            java.util.Calendar calendar1 = new java.util.GregorianCalendar();
	                calendar1.setTime(wlorderRow.getOrder().getPlanUnloadTime());
	                calendar1.add(java.util.Calendar.DATE, 1);
	                if(i==0){
	                	calendarEnd=calendar1;
	                }else{
	                	if(calendarEnd.before(calendar1))calendarEnd=calendar1;
	                }
        	}
        	calendarBegin.add(java.util.Calendar.DAY_OF_MONTH, -1*timeRange);
        	calendarEnd.add(java.util.Calendar.DAY_OF_MONTH, timeRange);
          	
    		//String sqls="select {wlorder.*}, sum({wlorderrow}.product_Num) as productNums from WlOrder {wlorder},WlOrderRow {wlorderrow} where ({wlorder}.id={wlorderrow}.order_FK) " ;
    		//获得指定时间段内有其他相似任务的车辆，按载重量从小到大排序
    		for(int i=0;i<orderRow.length;i++){
    			final Criteria criteriaTasks = session.createCriteria(com.logistics.entity.order.WlTaskRowImpl.class);
            	WlOrderRow wlorderRow =(WlOrderRow)orderRow[i];
            	 java.util.Calendar calendar = new java.util.GregorianCalendar();
 	            calendar.setTime(wlorderRow.getOrder().getPlanFetchTime());
 	            calendar.add(java.util.Calendar.DAY_OF_MONTH, -1*timeRange);
 	            java.util.Calendar calendar1 = new java.util.GregorianCalendar();
                calendar1.setTime(wlorderRow.getOrder().getPlanUnloadTime());
                calendar1.add(java.util.Calendar.DAY_OF_MONTH, timeRange);
                criteriaTasks.add(Expression.or(Expression.le("planFetchTime",calendar.getTime()),Expression.ge("planUnloadTime",calendar1.getTime())));
                criteriaTasks.add(Expression.in("status",new String[]{"1","2","3"}));
              //路径相同不是最智能的查询条件，如有条件可加上对取、卸货地的查询
                Criteria criteriaTasksPath = criteriaTasks.createCriteria("path");
                criteriaTasksPath.add(Expression.eq("id", wlorderRow.getOrder().getPath().getId()));
                criteriaTasks.addOrder(Order.asc("voiture"));
                criteriaTasks.addOrder(Order.asc("task"));
                criteriaTasks.setMaxResults(250);
	            List taskl=criteriaTasks.list();
	            System.out.println("taskl==="+taskl.size());
	            java.util.TreeMap taskRowArray=new TreeMap();
	            Object[] voitureTaskArray=new Object[orderRow.length+1];//获得了相似的taskRowlList
	            for(int j=0;j<taskl.size();j++){//
	            	int haveBoolean=voitureIDSet.indexOf(((WlTaskRow)taskl.get(j)).getVoiture().getId());//判断voitureIDSet（该方法要返回的车辆id的Set中是否包含相似taskRowlList的车辆
	            	if(haveBoolean==-1){//不包含
	            		System.out.println("haveBoolean haveBoolean:"+haveBoolean+"   j:"+j);
	            		voitureIDSet.add(((WlTaskRow)taskl.get(j)).getVoiture().getId());//则在voitureIDSet中加入
	            		System.out.println("haveBoolean haveBoolean voitureIDSet Voitureid:"+((WlTaskRow)taskl.get(j)).getVoiture().getId()+"   j:"+j);
	            		WlVoitureTaskVO voitureTaskvo=this.toWlVoitureTaskVO(((WlTaskRow)taskl.get(j)).getVoiture());
	            		voitureTaskArray=new Object[orderRow.length+1];
	            		voitureTaskArray[0]=voitureTaskvo;
	            		taskRowArray=new TreeMap();
	            		WlTaskRow taskRow=(WlTaskRow)taskl.get(j);
	            		System.out.println("haveBoolean haveBoolean taskRow.getTask().getId():"+taskRow.getTask().getId() + "i:"+i +"   j:"+j);
	            		taskRowArray.put(taskRow.getTask().getId(),taskRow.getId()+" "+taskRow.getPath().getPathName()+" "+ProjectUtil.getFullDateStr(taskRow.getPlanFetchTime())+" -> "+ProjectUtil.getFullDateStr(taskRow.getPlanUnloadTime()));
	            		voitureTaskArray[i+1]=taskRowArray;
	            		System.out.println("haveBoolean haveBoolean voitureTaskArray[i+1]:"+voitureTaskArray[i+1] + "i:"+i +"   j:"+j);
	            		voitureSet.add(voitureTaskArray);
	            		System.out.println("haveBoolean haveBoolean voitureSet:"+voitureSet.size() + "i:"+i +"   j:"+j);
	            	}else{
	            		System.out.println("haveBoolean :"+haveBoolean+ "i:"+i +"   j:"+j);
	            		voitureTaskArray=null;
	            		voitureTaskArray=(Object[])voitureSet.get(haveBoolean);
	            		System.out.println("haveBoolean  voitureTaskArray:"+voitureTaskArray + "i:"+i +"   j:"+j);
	            		if(null!=voitureTaskArray[i+1]){
	            			System.out.println("haveBoolean  voitureTaskArray.length:"+voitureTaskArray.length + "i:"+i +"   j:"+j);
	            			System.out.println("haveBoolean  voitureTaskArray[i+1]:"+voitureTaskArray[i+1] + "i:"+i +"   j:"+j);
	            			taskRowArray=null;
	            			taskRowArray=(TreeMap)voitureTaskArray[i+1];
	            			System.out.println("haveBoolean  taskRowArray:"+taskRowArray + "i:"+i +"   j:"+j);
	            		}else{
	            			taskRowArray=new TreeMap();
	            			System.out.println("haveBoolean  new taskRowArray:"+taskRowArray + "i:"+i +"   j:"+j);
	            		}
	            		WlTaskRow taskRow=(WlTaskRow)taskl.get(j);
	            		System.out.println("haveBoolean  taskRow.getTask().getId():"+taskRow.getTask().getId() + "i:"+i +"   j:"+j);
	            		if(taskRowArray.containsKey(taskRow.getTask().getId())){
	            			String taskRowString=(String)taskRowArray.get(taskRow.getTask().getId());
	            			System.out.println("haveBoolean 1 taskRowString:"+taskRowString + "i:"+i +"   j:"+j);
	            			taskRowString=taskRowString+"<br>"+taskRow.getId()+" "+taskRow.getPath().getPathName()+" "+ProjectUtil.getFullDateStr(taskRow.getPlanFetchTime())+" -> "+ProjectUtil.getFullDateStr(taskRow.getPlanUnloadTime());
	            			System.out.println("haveBoolean 2 taskRowString:"+taskRowString + "i:"+i +"   j:"+j);
	            			taskRowArray.put(taskRow.getTask().getId(),taskRowString);
	            		}else{
	            			
	            		taskRowArray.put(taskRow.getTask().getId(),taskRow.getId()+" "+taskRow.getPath().getPathName()+" "+ProjectUtil.getFullDateStr(taskRow.getPlanFetchTime())+" -> "+ProjectUtil.getFullDateStr(taskRow.getPlanUnloadTime()));
	            		System.out.println("haveBoolean 3 taskRowArray:"+taskRowArray + "i:"+i +"   j:"+j);
	            		}
	            		voitureTaskArray[i+1]=taskRowArray;
	            		System.out.println("voitureSet.set(haveBoolean,voitureTaskArray) voitureTaskArray :"+voitureTaskArray.toString() + "i:"+i +"   j:"+j);
	            		System.out.println("voitureSet.set(haveBoolean,voitureTaskArray) haveBoolean :"+haveBoolean + "i:"+i +"   j:"+j);
	            		voitureSet.set(haveBoolean,voitureTaskArray);
	            	}
	            }
	            System.out.println("voitureSet==="+voitureSet.size());
	        }
    		System.out.println("voitureSet======================"+voitureSet.size());
    		for(int m=0;m<voitureSet.size();m++){
            	Object[] tempVoitureTaskArray=null;
            	tempVoitureTaskArray=(Object[])voitureSet.get(m);
            	WlVoitureTaskVO wlVoitureTaskVO =null;
            	wlVoitureTaskVO =(WlVoitureTaskVO)tempVoitureTaskArray[0];
            	System.out.println("获得指定时间段内有其他相似任务的车辆  m:"+m+"  id:"+wlVoitureTaskVO.getId());
            	Object[] taskStringObject = null;
            	taskStringObject=new Object[tempVoitureTaskArray.length-1];
            	for(int n=1;n<tempVoitureTaskArray.length;n++){
            		TreeMap taskRowList=null;
            		taskRowList=	(TreeMap)tempVoitureTaskArray[n];
            		//if(taskRowList!=null)taskStringObject[n-1]=taskRowList.toString();
            		if(taskRowList!=null){
            			String taskString="";
            			while(taskRowList.size()!=0){
        					Long taskid=null;
        					taskid=(Long)taskRowList.firstKey();
            				System.out.println("  m taskid:"+taskid);
            				taskString=taskString+"<img src='../image/addsmall.gif' onclick='selectAddToTask("+taskid+");'  height='18' width='18' border='0'>派车计划 "+taskid+" :<br>"+taskRowList.get(taskid)+"<br>";
            				System.out.println("  m taskString:"+taskString);
            				taskRowList.remove(taskid);
            				}
            			taskStringObject[n-1]=taskString;
            			System.out.println("taskStringObject[n-1](Object):"+taskStringObject[n-1]+"  n:"+n);
            		}
            	}
            	wlVoitureTaskVO.setTasks(taskStringObject);
            	voitureSet.set(m, wlVoitureTaskVO);
            }
    		if(!ortherBool){
        	//获得指定时间段内无其他任务的车辆，按载重量从小到大排序
    		
        		final Criteria criteria1 = session.createCriteria(com.logistics.entity.car.WlVoitureImpl.class);
        		//criteria1.createCriteria("tasks").add(Expression.not(Expression.between("planFetchTime" ,calendarBegin.getTime(), calendarEnd.getTime()))).add(Expression.not(Expression.between("planUnloadTime", calendarBegin.getTime(), calendarEnd.getTime())));
	            Criteria criteriaTasks1 = criteria1.createCriteria("tasks");
	            criteriaTasks1.add(Expression.not(Expression.between("planFetchTime" ,calendarBegin.getTime(), calendarEnd.getTime())));
	            criteriaTasks1.add(Expression.not(Expression.between("planUnloadTime", calendarBegin.getTime(), calendarEnd.getTime())));
	            criteriaTasks1.add(Expression.in("status",new String[]{"1","2","3"}));
	            criteria1.setMaxResults(250);
	            List taskl=criteria1.list();
	            System.out.println("taskl=2222222222222222222222222=="+taskl.size());
	            for(int j=0;j<taskl.size();j++){
	            	int haveBoolean=voitureIDSet.indexOf(((WlVoiture)taskl.get(j)).getId());
	            	System.out.println("获得指定时间段内无其他任务的车辆  j:"+j+"  id:"+((WlVoiture)taskl.get(j)).getId());
	            	if(haveBoolean==-1){
	            		System.out.println("haveBoolean222222222222222222222222==-1==j:"+j);	
	            	WlVoitureTaskVO voitureTaskVO=this.toWlVoitureTaskVO((WlVoiture)taskl.get(j));
	            	//WlVoitureVO voitureVO=this.toWlVoitureVO((WlVoiture)taskl.get(j));
            		//Object[] voitureTaskArray=new Object[orderRow.length+1];
            		//voitureTaskArray[0]=voitureVO;
	            	voitureSet.add(voitureTaskVO);
	            	
	            	}
	            }
	            System.out.println("voitureSet=2222222222222222222222=="+voitureSet.size());
	            return new ArrayList(voitureSet);
          }else{
	        //指定时间段内有其他任务的车辆
        		final Criteria criteria2 = session.createCriteria(com.logistics.entity.car.WlVoitureImpl.class);
        		//criteria2.createCriteria("tasks").add(Expression.not(Expression.between("planFetchTime" ,calendarBegin.getTime(), calendarEnd.getTime()))).add(Expression.not(Expression.between("planUnloadTime", calendarBegin.getTime(), calendarEnd.getTime())));
	            Criteria criteriaTasks2 = criteria2.createCriteria("tasks");
	            criteriaTasks2.add(Expression.between("planFetchTime" ,calendarBegin.getTime(), calendarEnd.getTime()));
	            criteriaTasks2.add(Expression.between("planUnloadTime", calendarBegin.getTime(), calendarEnd.getTime()));
	            criteriaTasks2.add(Expression.in("status",new String[]{"1","2","3"}));
	            criteria2.setMaxResults(250);
	            List taskl2=criteria2.list();
	            System.out.println("taskl=111111111111111111111111111111111111111111111111111=="+taskl2.size());
	            ArrayList voitureIDSet2=new ArrayList();
	            List voitureSet2=new ArrayList();
	            for(int j=0;j<taskl2.size();j++){
	            	voitureIDSet2.add(((WlVoiture)taskl2.get(j)).getId());
	            	System.out.println("指定时间段内  有  其他任务的车辆  j:"+j+"  id:"+((WlVoiture)taskl2.get(j)).getId());
	            	WlVoitureTaskVO voitureTaskVO=this.toWlVoitureTaskVO((WlVoiture)taskl2.get(j));
	            	voitureSet2.add(voitureTaskVO);
	            }
	            
	            for(int j=0;j<voitureSet.size();j++){
	            	int listInt=voitureIDSet2.indexOf(((WlVoitureTaskVO)voitureSet.get(j)).getId());
	            	if(listInt!=-1){
	            	//WlVoitureTaskVO voitureTaskVO=this.toWlVoitureTaskVO((WlVoiture)voitureSet.get(j));
	            	voitureSet2.remove(listInt);//((WlVoitureTaskVO)voitureSet.get(j));}
	            	}}
	            //没有相关的未执行完毕的派车单的车辆
	            //????????????????????????????????
	            System.out.println("voitureSet=11111111111111111111111111111111111111111=="+voitureSet2.size());
	            return new ArrayList(voitureSet2);
          } 
         
        }
        catch (org.hibernate.HibernateException ex)
        {
            throw super.convertHibernateAccessException(ex);
        }
}

    /**
     * @see com.logistics.entity.car.WlVoitureDao#toWlVoitureTaskVO(com.logistics.entity.car.WlVoiture, com.logistics.entity.order.WlVoitureTaskVO)
     */
    public void toWlVoitureTaskVO(
        com.logistics.entity.car.WlVoiture source,
        com.logistics.entity.order.WlVoitureTaskVO target)
    {
    	
        super.toWlVoitureTaskVO(source, target);
        DateTimeQuery tempday=new DateTimeQuery();
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getBirthday()));
        target.setBirthday(tempday);
        tempday.setUpDate(ProjectUtil.getFullDateStr(source.getRegisterDay()));
        target.setRegisterDay(tempday);
        NumberQuery tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getLoad());
        target.setLoad(tempNum);
        tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getSelfWeight());
        target.setSelfWeight(tempNum);
        tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getOutLength());
        target.setOutLength(tempNum);
        tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getInLength());
        target.setInLength(tempNum);
        tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getOutWidth());
        target.setOutWidth(tempNum);
        tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getInHeight());
        target.setInHeight(tempNum);
        target.setDepart(this.getOrgaInfoDao().toOrgaInfoVO(source.getDepart()));
        tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getInitvalue());
        target.setInitvalue(tempNum);
        tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getInWidth());
        target.setInWidth(tempNum);
        target.setMasterDriver(this.getPeopleDao().toPeopleVO(source.getMasterDriver()));
        tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getOutHeight());
        target.setOutHeight(tempNum); 
        
        /*DateTimeQuery tempday=new DateTimeQuery();
        tempday.setUpDate(ProjectUtil.getFullDateStr(source.getBirthday()));
        target.setBirthday(tempday);
        tempday.setUpDate(ProjectUtil.getFullDateStr(source.getRegisterDay()));
        target.setRegisterDay(tempday);
        java.lang.Object[] retask=new Object[source.getTasks().size()];
        com.logistics.entity.order.WlTaskRow task=null;
        	//new com.logistics.entity.order.WlTaskRowImpl();
        if(source.getTasks() != null ){
        	java.util.Iterator iterator = source.getTasks().iterator();
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
        	target.setTasks(retask);
        }*/
        // WARNING! No conversion for target.birthday (can't convert source.getBirthday():java.util.Date to java.util.Date
        // WARNING! No conversion for target.registerDay (can't convert source.getRegisterDay():java.util.Date to java.util.Date
        // WARNING! No conversion for target.tasks (can't convert source.getTasks():com.logistics.entity.order.WlTaskRow to java.lang.Object[]
    	
    
    
    }


    /**
     * @see com.logistics.entity.car.WlVoitureDao#toWlVoitureTaskVO(com.logistics.entity.car.WlVoiture)
     */
    public com.logistics.entity.order.WlVoitureTaskVO toWlVoitureTaskVO(final com.logistics.entity.car.WlVoiture entity)
    {
        // @todo verify behavior of toWlVoitureTaskVO
        return super.toWlVoitureTaskVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.car.WlVoiture loadWlVoitureFromWlVoitureTaskVO(com.logistics.entity.order.WlVoitureTaskVO wlVoitureTaskVO)
    {
        // @todo implement loadWlVoitureFromWlVoitureTaskVO
        //throw new java.lang.UnsupportedOperationException("com.logistics.entity.car.loadWlVoitureFromWlVoitureTaskVO(com.logistics.entity.order.WlVoitureTaskVO) not yet implemented.");

        /* A typical implementation looks like this: */
        com.logistics.entity.car.WlVoiture wlVoiture = this.load(wlVoitureTaskVO.getId());
        if (wlVoiture == null)
        {
            wlVoiture = com.logistics.entity.car.WlVoiture.Factory.newInstance();
        }
        return wlVoiture;
       
    }

    
    /**
     * @see com.logistics.entity.car.WlVoitureDao#wlVoitureTaskVOToEntity(com.logistics.entity.order.WlVoitureTaskVO)
     */
    public com.logistics.entity.car.WlVoiture wlVoitureTaskVOToEntity(com.logistics.entity.order.WlVoitureTaskVO wlVoitureTaskVO)
    {
        // @todo verify behavior of wlVoitureTaskVOToEntity
        com.logistics.entity.car.WlVoiture entity = this.loadWlVoitureFromWlVoitureTaskVO(wlVoitureTaskVO);
        this.wlVoitureTaskVOToEntity(wlVoitureTaskVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.car.WlVoitureDao#wlVoitureTaskVOToEntity(com.logistics.entity.order.WlVoitureTaskVO, com.logistics.entity.car.WlVoiture)
     */
    public void wlVoitureTaskVOToEntity(
        com.logistics.entity.order.WlVoitureTaskVO source,
        com.logistics.entity.car.WlVoiture target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wlVoitureTaskVOToEntity
    	
        super.wlVoitureTaskVOToEntity(source, target, copyIfNull);
        target.setBirthday(ProjectUtil.getDate(source.getBirthday().getUpDate()));
        target.setRegisterDay(ProjectUtil.getDate(source.getRegisterDay().getUpDate()));
        // No conversion for target.birthday (can't convert source.getBirthday():java.util.Date to java.util.Date
        // No conversion for target.registerDay (can't convert source.getRegisterDay():java.util.Date to java.util.Date
    }

    /**
     * @see com.logistics.entity.car.WlVoitureDao#toWlVoitureVO(com.logistics.entity.car.WlVoiture, com.logistics.entity.car.WlVoitureVO)
     */
    public void toWlVoitureVO(
        com.logistics.entity.car.WlVoiture source,
        com.logistics.entity.car.WlVoitureVO target)
    {
        // @todo verify behavior of toWlVoitureVO
        super.toWlVoitureVO(source, target);
        DateTimeQuery tempday=new DateTimeQuery();
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getBirthday()));
        target.setBirthday(tempday);
        tempday.setUpDate(ProjectUtil.getFullDateStr(source.getRegisterDay()));
        target.setRegisterDay(tempday);
        NumberQuery tempNum=new NumberQuery();
        
        // No conversion for target.load (can't convert source.getLoad():double to com.logistics.entity.basic.NumberQuery)
        tempNum.setUpNumber(source.getLoad());
        target.setLoad(tempNum);
        // No conversion for target.selfWeight (can't convert source.getSelfWeight():double to com.logistics.entity.basic.NumberQuery)
        tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getSelfWeight());
        target.setSelfWeight(tempNum);
        // No conversion for target.outLength (can't convert source.getOutLength():double to com.logistics.entity.basic.NumberQuery)
        tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getOutLength());
        target.setOutLength(tempNum);
        // No conversion for target.inLength (can't convert source.getInLength():double to com.logistics.entity.basic.NumberQuery)
        tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getInLength());
        target.setInLength(tempNum);
        // No conversion for target.outWidth (can't convert source.getOutWidth():double to com.logistics.entity.basic.NumberQuery)
        tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getOutWidth());
        target.setOutWidth(tempNum);
        // No conversion for target.inHeight (can't convert source.getInHeight():double to com.logistics.entity.basic.NumberQuery)
        tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getInHeight());
        target.setInHeight(tempNum);
        // No conversion for target.depart (can't convert source.getDepart():com.logistics.entity.orga.OrgaInfo to com.logistics.entity.orga.OrgaInfoVO)
        target.setDepart(this.getOrgaInfoDao().toOrgaInfoVO(source.getDepart()));
        // No conversion for target.initvalue (can't convert source.getInitvalue():double to com.logistics.entity.basic.NumberQuery)
        tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getInitvalue());
        target.setInitvalue(tempNum);
        // No conversion for target.inWidth (can't convert source.getInWidth():double to com.logistics.entity.basic.NumberQuery)
        tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getInWidth());
        target.setInWidth(tempNum);
        // No conversion for target.masterDriver (can't convert source.getMasterDriver():com.logistics.entity.orga.People to com.logistics.entity.orga.PeopleVO)
        target.setMasterDriver(this.getPeopleDao().toPeopleVO(source.getMasterDriver()));
        // No conversion for target.outHeight (can't convert source.getOutHeight():double to com.logistics.entity.basic.NumberQuery)
        tempNum=new NumberQuery();
        tempNum.setUpNumber(source.getOutHeight());
        target.setOutHeight(tempNum);
    }


    /**
     * @see com.logistics.entity.car.WlVoitureDao#toWlVoitureVO(com.logistics.entity.car.WlVoiture)
     */
    public com.logistics.entity.car.WlVoitureVO toWlVoitureVO(final com.logistics.entity.car.WlVoiture entity)
    {
        // @todo verify behavior of toWlVoitureVO
        return super.toWlVoitureVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.car.WlVoiture loadWlVoitureFromWlVoitureVO(com.logistics.entity.car.WlVoitureVO wlVoitureVO)
    {
        // @todo implement loadWlVoitureFromWlVoitureVO
        //throw new java.lang.UnsupportedOperationException("com.logistics.entity.car.loadWlVoitureFromWlVoitureVO(com.logistics.entity.car.WlVoitureVO) not yet implemented.");

        /* A typical implementation looks like this: */
        com.logistics.entity.car.WlVoiture wlVoiture = this.load(wlVoitureVO.getId());
        if (wlVoiture == null)
        {
            wlVoiture = com.logistics.entity.car.WlVoiture.Factory.newInstance();
        }
        return wlVoiture;
       
    }

    
    /**
     * @see com.logistics.entity.car.WlVoitureDao#wlVoitureVOToEntity(com.logistics.entity.car.WlVoitureVO)
     */
    public com.logistics.entity.car.WlVoiture wlVoitureVOToEntity(com.logistics.entity.car.WlVoitureVO wlVoitureVO)
    {
        // @todo verify behavior of wlVoitureVOToEntity
        com.logistics.entity.car.WlVoiture entity = this.loadWlVoitureFromWlVoitureVO(wlVoitureVO);
        this.wlVoitureVOToEntity(wlVoitureVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.car.WlVoitureDao#wlVoitureVOToEntity(com.logistics.entity.car.WlVoitureVO, com.logistics.entity.car.WlVoiture)
     */
    public void wlVoitureVOToEntity(
        com.logistics.entity.car.WlVoitureVO source,
        com.logistics.entity.car.WlVoiture target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wlVoitureVOToEntity
        super.wlVoitureVOToEntity(source, target, copyIfNull);
        if(source.getBirthday()!=null)target.setBirthday(ProjectUtil.getDate(source.getBirthday().getUpDate()));
        //target.setBirthday(source.getBirthday())
        if(source.getRegisterDay()!=null)target.setRegisterDay(ProjectUtil.getDate(source.getRegisterDay().getUpDate()));
        if(source.getMasterDriver()!=null)target.setMasterDriver(this.getPeopleDao().load(source.getMasterDriver().getId()));
        if(source.getDepart()!=null)target.setDepart(this.getOrgaInfoDao().load(source.getMasterDriver().getId()));
        if(source.getInHeight()!=null)target.setInHeight(source.getInHeight().getUpNumber());
        if(source.getInitvalue()!=null)target.setInitvalue(source.getInitvalue().getUpNumber());
        if(source.getInLength()!=null)target.setInLength(source.getInLength().getUpNumber());
        if(source.getInWidth()!=null)target.setInWidth(source.getInWidth().getUpNumber());
        if(source.getLoad()!=null)target.setLoad(source.getLoad().getUpNumber());
        if(source.getOutHeight()!=null)target.setOutHeight(source.getOutHeight().getUpNumber());
        if(source.getOutLength()!=null)target.setOutLength(source.getOutLength().getUpNumber());
        if(source.getOutWidth()!=null)target.setOutWidth(source.getOutWidth().getUpNumber());
        if(source.getSelfWeight()!=null)target.setSelfWeight(source.getSelfWeight().getUpNumber());
        // No conversion for target.birthday (can't convert source.getBirthday():java.util.Date to java.util.Date
        // No conversion for target.registerDay (can't convert source.getRegisterDay():java.util.Date to java.util.Date
    }



	@Override
	protected List handleGetWlVoitureVO(WlVoitureVO WlVoitureVO,int pageNumber, int pageSize, String orderBy) throws Exception {
		  final Session session = getSession(false);

	        try
	        {
	            final Criteria criteria = session.createCriteria(com.logistics.entity.car.WlVoitureImpl.class);

	            if (WlVoitureVO.getLicense() != null)
	                criteria.add(Expression.ilike("license", WlVoitureVO.getLicense(), MatchMode.ANYWHERE));
	            if (WlVoitureVO.getManufacturer() != null)
	                criteria.add(Expression.ilike("manufacturer", WlVoitureVO.getManufacturer(), MatchMode.ANYWHERE));
	            if (WlVoitureVO.getOldModel() != null)
	                criteria.add(Expression.ilike("oldModel", WlVoitureVO.getOldModel(), MatchMode.ANYWHERE));
	            if (WlVoitureVO.getEngineCode() != null)
	                criteria.add(Expression.ilike("engineCode", WlVoitureVO.getEngineCode(), MatchMode.ANYWHERE));
	            if (WlVoitureVO.getBodyCode() != null)
	                criteria.add(Expression.ilike("bodyCode", WlVoitureVO.getBodyCode(), MatchMode.ANYWHERE));
	            if (WlVoitureVO.getBirthday() != null)
	            {   System.out.println("WlVoitureVO.getBirthday().getUpSign():"+WlVoitureVO.getBirthday().getUpSign());
	            System.out.println("WlVoitureVO.getBirthday().getDownSign():"+WlVoitureVO.getBirthday().getDownSign());
	                if("=".equals(WlVoitureVO.getBirthday().getUpSign())){
	                	criteria.add(Expression.eq("birthday", ProjectUtil.getDate(WlVoitureVO.getBirthday().getUpDate())));
	                }else if(">".equals(WlVoitureVO.getBirthday().getUpSign())){
	                	criteria.add(Expression.lt("birthday", ProjectUtil.getDate(WlVoitureVO.getBirthday().getUpDate())));
	                }else if("≥".equals(WlVoitureVO.getBirthday().getUpSign())){
	                	criteria.add(Expression.le("birthday", ProjectUtil.getDate(WlVoitureVO.getBirthday().getUpDate())));
	                }
	                if(!"=".equals(WlVoitureVO.getBirthday().getUpSign())){
		                if(">".equals(WlVoitureVO.getBirthday().getDownSign())){
		                	criteria.add(Expression.gt("birthday", ProjectUtil.getDate(WlVoitureVO.getBirthday().getDownDate())));
		                }else if("≥".equals(WlVoitureVO.getBirthday().getDownSign())){
		                	criteria.add(Expression.ge("birthday", ProjectUtil.getDate(WlVoitureVO.getBirthday().getDownDate())));
		                }
	                }
	            }
	            if (WlVoitureVO.getRegisterDay() != null)
	            {
	            	if("=".equals(WlVoitureVO.getRegisterDay().getUpSign())){
	                	criteria.add(Expression.eq("registerDay", ProjectUtil.getDate(WlVoitureVO.getRegisterDay().getUpDate())));
	                }else if(">".equals(WlVoitureVO.getRegisterDay().getUpSign())){
	                	criteria.add(Expression.lt("registerDay", ProjectUtil.getDate(WlVoitureVO.getRegisterDay().getUpDate())));
	                }else if("≥".equals(WlVoitureVO.getRegisterDay().getUpSign())){
	                	criteria.add(Expression.le("registerDay", ProjectUtil.getDate(WlVoitureVO.getRegisterDay().getUpDate())));
	                }
	                if(!"=".equals(WlVoitureVO.getRegisterDay().getUpSign())){
		                if(">".equals(WlVoitureVO.getRegisterDay().getDownSign())){
		                	criteria.add(Expression.gt("registerDay", ProjectUtil.getDate(WlVoitureVO.getRegisterDay().getDownDate())));
		                }else if("≥".equals(WlVoitureVO.getRegisterDay().getDownSign())){
		                	criteria.add(Expression.ge("registerDay", ProjectUtil.getDate(WlVoitureVO.getRegisterDay().getDownDate())));
		                }
	                }
	            }
	            //System.out.println("WlVoitureVO.getInWidth():"+WlVoitureVO.getInWidth());
	            if(WlVoitureVO.getLoad()!=null){
	            	if("=".equals(WlVoitureVO.getLoad().getUpSign())){
	                	criteria.add(Expression.eq("load", WlVoitureVO.getLoad().getUpNumber()));
	                }else if(">".equals(WlVoitureVO.getLoad().getUpSign())){
	                	criteria.add(Expression.lt("load", WlVoitureVO.getLoad().getUpNumber()));
	                }else if("≥".equals(WlVoitureVO.getLoad().getUpSign())){
	                	criteria.add(Expression.le("load", WlVoitureVO.getLoad().getUpNumber()));
	                }
	                if(!"=".equals(WlVoitureVO.getLoad().getUpSign())){
		                if(">".equals(WlVoitureVO.getLoad().getDownSign())){
		                	criteria.add(Expression.gt("load", WlVoitureVO.getLoad().getDownNumber()));
		                }else if("≥".equals(WlVoitureVO.getLoad().getDownSign())){
		                	criteria.add(Expression.ge("load", WlVoitureVO.getLoad().getDownNumber()));
		                }
	                }
	            }
	            if(WlVoitureVO.getSelfWeight()!=null){
	            	if("=".equals(WlVoitureVO.getSelfWeight().getUpSign())){
	                	criteria.add(Expression.eq("selfWeight", WlVoitureVO.getSelfWeight().getUpNumber()));
	                }else if(">".equals(WlVoitureVO.getSelfWeight().getUpSign())){
	                	criteria.add(Expression.lt("selfWeight", WlVoitureVO.getSelfWeight().getUpNumber()));
	                }else if("≥".equals(WlVoitureVO.getSelfWeight().getUpSign())){
	                	criteria.add(Expression.le("selfWeight", WlVoitureVO.getSelfWeight().getUpNumber()));
	                }
	                if(!"=".equals(WlVoitureVO.getSelfWeight().getUpSign())){
		                if(">".equals(WlVoitureVO.getSelfWeight().getDownSign())){
		                	criteria.add(Expression.gt("selfWeight", WlVoitureVO.getSelfWeight().getDownNumber()));
		                }else if("≥".equals(WlVoitureVO.getSelfWeight().getDownSign())){
		                	criteria.add(Expression.ge("selfWeight", WlVoitureVO.getSelfWeight().getDownNumber()));
		                }
	                }
	            }
	            if(WlVoitureVO.getOutLength()!=null){
	            	if("=".equals(WlVoitureVO.getOutLength().getUpSign())){
	                	criteria.add(Expression.eq("outLength", WlVoitureVO.getOutLength().getUpNumber()));
	                }else if(">".equals(WlVoitureVO.getOutLength().getUpSign())){
	                	criteria.add(Expression.lt("outLength", WlVoitureVO.getOutLength().getUpNumber()));
	                }else if("≥".equals(WlVoitureVO.getOutLength().getUpSign())){
	                	criteria.add(Expression.le("outLength", WlVoitureVO.getOutLength().getUpNumber()));
	                }
	                if(!"=".equals(WlVoitureVO.getOutLength().getUpSign())){
		                if(">".equals(WlVoitureVO.getOutLength().getDownSign())){
		                	criteria.add(Expression.gt("outLength", WlVoitureVO.getOutLength().getDownNumber()));
		                }else if("≥".equals(WlVoitureVO.getOutLength().getDownSign())){
		                	criteria.add(Expression.ge("outLength", WlVoitureVO.getOutLength().getDownNumber()));
		                }
	                }
	            }
	            if(WlVoitureVO.getInLength()!=null){
	            	if("=".equals(WlVoitureVO.getInLength().getUpSign())){
	                	criteria.add(Expression.eq("inLength", WlVoitureVO.getInLength().getUpNumber()));
	                }else if(">".equals(WlVoitureVO.getInLength().getUpSign())){
	                	criteria.add(Expression.lt("inLength", WlVoitureVO.getInLength().getUpNumber()));
	                }else if("≥".equals(WlVoitureVO.getInLength().getUpSign())){
	                	criteria.add(Expression.le("inLength", WlVoitureVO.getInLength().getUpNumber()));
	                }
	                if(!"=".equals(WlVoitureVO.getInLength().getUpSign())){
		                if(">".equals(WlVoitureVO.getInLength().getDownSign())){
		                	criteria.add(Expression.gt("inLength", WlVoitureVO.getInLength().getDownNumber()));
		                }else if("≥".equals(WlVoitureVO.getInLength().getDownSign())){
		                	criteria.add(Expression.ge("inLength", WlVoitureVO.getInLength().getDownNumber()));
		                }
	                }
	            }
	            if(WlVoitureVO.getOutWidth()!=null){
	            	if("=".equals(WlVoitureVO.getOutWidth().getUpSign())){
	                	criteria.add(Expression.eq("outWidth", WlVoitureVO.getOutWidth().getUpNumber()));
	                }else if(">".equals(WlVoitureVO.getOutWidth().getUpSign())){
	                	criteria.add(Expression.lt("outWidth", WlVoitureVO.getOutWidth().getUpNumber()));
	                }else if("≥".equals(WlVoitureVO.getOutWidth().getUpSign())){
	                	criteria.add(Expression.le("outWidth", WlVoitureVO.getOutWidth().getUpNumber()));
	                }
	                if(!"=".equals(WlVoitureVO.getOutWidth().getUpSign())){
		                if(">".equals(WlVoitureVO.getOutWidth().getDownSign())){
		                	criteria.add(Expression.gt("outWidth", WlVoitureVO.getOutWidth().getDownNumber()));
		                }else if("≥".equals(WlVoitureVO.getOutWidth().getDownSign())){
		                	criteria.add(Expression.ge("outWidth", WlVoitureVO.getOutWidth().getDownNumber()));
		                }
	                }
	            }
	            if(WlVoitureVO.getInWidth()!=null){
	            	if("=".equals(WlVoitureVO.getInWidth().getUpSign())){
	                	criteria.add(Expression.eq("inWidth", WlVoitureVO.getInWidth().getUpNumber()));
	                }else if(">".equals(WlVoitureVO.getInWidth().getUpSign())){
	                	criteria.add(Expression.lt("inWidth", WlVoitureVO.getInWidth().getUpNumber()));
	                }else if("≥".equals(WlVoitureVO.getInWidth().getUpSign())){
	                	criteria.add(Expression.le("inWidth", WlVoitureVO.getInWidth().getUpNumber()));
	                }
	                if(!"=".equals(WlVoitureVO.getInWidth().getUpSign())){
		                if(">".equals(WlVoitureVO.getInWidth().getDownSign())){
		                	criteria.add(Expression.gt("inWidth", WlVoitureVO.getInWidth().getDownNumber()));
		                }else if("≥".equals(WlVoitureVO.getInWidth().getDownSign())){
		                	criteria.add(Expression.ge("inWidth", WlVoitureVO.getInWidth().getDownNumber()));
		                }
	                }
	            }
	            if(WlVoitureVO.getOutHeight()!=null){
	            	if("=".equals(WlVoitureVO.getOutHeight().getUpSign())){
	                	criteria.add(Expression.eq("outHeight", WlVoitureVO.getOutHeight().getUpNumber()));
	                }else if(">".equals(WlVoitureVO.getOutHeight().getUpSign())){
	                	criteria.add(Expression.lt("outHeight", WlVoitureVO.getOutHeight().getUpNumber()));
	                }else if("≥".equals(WlVoitureVO.getOutHeight().getUpSign())){
	                	criteria.add(Expression.le("outHeight", WlVoitureVO.getOutHeight().getUpNumber()));
	                }
	                if(!"=".equals(WlVoitureVO.getOutHeight().getUpSign())){
		                if(">".equals(WlVoitureVO.getOutHeight().getDownSign())){
		                	criteria.add(Expression.gt("outHeight", WlVoitureVO.getOutHeight().getDownNumber()));
		                }else if("≥".equals(WlVoitureVO.getOutHeight().getDownSign())){
		                	criteria.add(Expression.ge("outHeight", WlVoitureVO.getOutHeight().getDownNumber()));
		                }
	                }
	            }
	            if(WlVoitureVO.getInHeight()!=null){
	            	if("=".equals(WlVoitureVO.getInHeight().getUpSign())){
	                	criteria.add(Expression.eq("inHeight", WlVoitureVO.getInHeight().getUpNumber()));
	                }else if(">".equals(WlVoitureVO.getInHeight().getUpSign())){
	                	criteria.add(Expression.lt("inHeight", WlVoitureVO.getInHeight().getUpNumber()));
	                }else if("≥".equals(WlVoitureVO.getInHeight().getUpSign())){
	                	criteria.add(Expression.le("inHeight", WlVoitureVO.getInHeight().getUpNumber()));
	                }
	                if(!"=".equals(WlVoitureVO.getInHeight().getUpSign())){
		                if(">".equals(WlVoitureVO.getInHeight().getDownSign())){
		                	criteria.add(Expression.gt("inHeight", WlVoitureVO.getInHeight().getDownNumber()));
		                }else if("≥".equals(WlVoitureVO.getInHeight().getDownSign())){
		                	criteria.add(Expression.ge("inHeight", WlVoitureVO.getInHeight().getDownNumber()));
		                }
	                }
	            }
	            if (WlVoitureVO.getColour() != null)
	                criteria.add(Expression.ilike("colour", WlVoitureVO.getColour(), MatchMode.ANYWHERE));
	            if (WlVoitureVO.getVoitureType() != null)
	                criteria.add(Expression.ilike("voitureType", WlVoitureVO.getVoitureType(), MatchMode.ANYWHERE));
	            if (WlVoitureVO.getTyreType() != null)
	                criteria.add(Expression.ilike("tyreType", WlVoitureVO.getTyreType(), MatchMode.ANYWHERE));
	            if (WlVoitureVO.getPin() != null)
	                criteria.add(Expression.ilike("pin", WlVoitureVO.getPin(), MatchMode.ANYWHERE));
	            if (WlVoitureVO.getCountry() != null)
	                criteria.add(Expression.ilike("country", WlVoitureVO.getCountry(), MatchMode.ANYWHERE));
	            if (WlVoitureVO.getTypeV() != null)
	                criteria.add(Expression.ilike("typeV", WlVoitureVO.getTypeV(), MatchMode.ANYWHERE));
	            if(WlVoitureVO.getInitvalue()!=null){
	            	//criteria.add(Expression.eq("initvalue", new java.lang.Double(WlVoitureVO.getInitvalue())));
	            	if("=".equals(WlVoitureVO.getInitvalue().getUpSign())){
	                	criteria.add(Expression.eq("initvalue", WlVoitureVO.getInitvalue().getUpNumber()));
	                }else if(">".equals(WlVoitureVO.getInitvalue().getUpSign())){
	                	criteria.add(Expression.lt("initvalue", WlVoitureVO.getInitvalue().getUpNumber()));
	                }else if("≥".equals(WlVoitureVO.getInitvalue().getUpSign())){
	                	criteria.add(Expression.le("initvalue", WlVoitureVO.getInitvalue().getUpNumber()));
	                }
	                if(!"=".equals(WlVoitureVO.getInitvalue().getUpSign())){
		                if(">".equals(WlVoitureVO.getInitvalue().getDownSign())){
		                	criteria.add(Expression.gt("initvalue", WlVoitureVO.getInitvalue().getDownNumber()));
		                }else if("≥".equals(WlVoitureVO.getInitvalue().getDownSign())){
		                	criteria.add(Expression.ge("initvalue", WlVoitureVO.getInitvalue().getDownNumber()));
		                }
	                }
	            }
	            if (WlVoitureVO.getRemark() != null)
	                criteria.add(Expression.ilike("remark", WlVoitureVO.getRemark(), MatchMode.ANYWHERE));
	            if (WlVoitureVO.getStatus() != null)
	                criteria.add(Expression.ilike("status", WlVoitureVO.getStatus(), MatchMode.ANYWHERE));
	            if (WlVoitureVO.getId() != 0)criteria.add(Expression.eq("id", WlVoitureVO.getId()));
	            //System.out.println("WlVoitureVO.getDepart():"+WlVoitureVO.getDepart());
	            if (WlVoitureVO.getDepart() != null) criteria.createCriteria("depart").add(Expression.eq("id", WlVoitureVO.getDepart().getId()));
	            //if (WlVoitureVO.getTasks() != null && tasks.length > 0) criteria.createCriteria("tasks").add(Expression.in("id", WlVoitureVO.getTasks()));
	            if (WlVoitureVO.getMasterDriver() != null) criteria.createCriteria("masterDriver").add(Expression.eq("id", WlVoitureVO.getMasterDriver().getId()));
	            //条数
	              int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
	                      .uniqueResult())  
	                      .intValue();//取得符合条件的总数  
	        
			      criteria.setProjection(null);  
			      WlVoiture or=new com.logistics.entity.car.WlVoitureImpl();
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

	protected List handleGetWlVoitureTaskVO(WlVoitureTaskVO WlVoitureVO,int pageNumber, int pageSize, String orderBy) throws Exception {
		//传入的WlVoitureVO(WlVoitureTaskVO)中的task必须是taskRowVO[0]型的，以便传入相关查询参数
		final Session session = getSession(false);
		List re=new ArrayList();
		List taskRowList=new ArrayList();
        
            if (WlVoitureVO != null&& WlVoitureVO.getTasks()!=null){//先获得满足查询条件的taskRow的taskRowList
            	final Criteria criteriaTaskRow = session.createCriteria(com.logistics.entity.order.WlTaskRowImpl.class);
            	QueryAssCriteriaOrder.getTaskRowCriteria((WlTaskRowVO)WlVoitureVO.getTasks()[0],criteriaTaskRow);
            	taskRowList=criteriaTaskRow.list();
            }
            
            //然后获得满足查询条件的voiture的List
            if (WlVoitureVO != null){
            	//以下为copy handleGetWlVoitureVO（） begin
            	 try
     	        {
     	            final Criteria criteria = session.createCriteria(com.logistics.entity.car.WlVoitureImpl.class);

     	            if (WlVoitureVO.getLicense() != null)
     	                criteria.add(Expression.ilike("license", WlVoitureVO.getLicense(), MatchMode.ANYWHERE));
     	            if (WlVoitureVO.getManufacturer() != null)
     	                criteria.add(Expression.ilike("manufacturer", WlVoitureVO.getManufacturer(), MatchMode.ANYWHERE));
     	            if (WlVoitureVO.getOldModel() != null)
     	                criteria.add(Expression.ilike("oldModel", WlVoitureVO.getOldModel(), MatchMode.ANYWHERE));
     	            if (WlVoitureVO.getEngineCode() != null)
     	                criteria.add(Expression.ilike("engineCode", WlVoitureVO.getEngineCode(), MatchMode.ANYWHERE));
     	            if (WlVoitureVO.getBodyCode() != null)
     	                criteria.add(Expression.ilike("bodyCode", WlVoitureVO.getBodyCode(), MatchMode.ANYWHERE));
     	            if (WlVoitureVO.getBirthday() != null)
     	            {   System.out.println("WlVoitureVO.getBirthday().getUpSign():"+WlVoitureVO.getBirthday().getUpSign());
     	            System.out.println("WlVoitureVO.getBirthday().getDownSign():"+WlVoitureVO.getBirthday().getDownSign());
     	                if("=".equals(WlVoitureVO.getBirthday().getUpSign())){
     	                	criteria.add(Expression.eq("birthday", ProjectUtil.getDate(WlVoitureVO.getBirthday().getUpDate())));
     	                }else if(">".equals(WlVoitureVO.getBirthday().getUpSign())){
     	                	criteria.add(Expression.lt("birthday", ProjectUtil.getDate(WlVoitureVO.getBirthday().getUpDate())));
     	                }else if("≥".equals(WlVoitureVO.getBirthday().getUpSign())){
     	                	criteria.add(Expression.le("birthday", ProjectUtil.getDate(WlVoitureVO.getBirthday().getUpDate())));
     	                }
     	                if(!"=".equals(WlVoitureVO.getBirthday().getUpSign())){
     		                if(">".equals(WlVoitureVO.getBirthday().getDownSign())){
     		                	criteria.add(Expression.gt("birthday", ProjectUtil.getDate(WlVoitureVO.getBirthday().getDownDate())));
     		                }else if("≥".equals(WlVoitureVO.getBirthday().getDownSign())){
     		                	criteria.add(Expression.ge("birthday", ProjectUtil.getDate(WlVoitureVO.getBirthday().getDownDate())));
     		                }
     	                }
     	            }
     	            if (WlVoitureVO.getRegisterDay() != null)
     	            {
     	            	if("=".equals(WlVoitureVO.getRegisterDay().getUpSign())){
     	                	criteria.add(Expression.eq("registerDay", ProjectUtil.getDate(WlVoitureVO.getRegisterDay().getUpDate())));
     	                }else if(">".equals(WlVoitureVO.getRegisterDay().getUpSign())){
     	                	criteria.add(Expression.lt("registerDay", ProjectUtil.getDate(WlVoitureVO.getRegisterDay().getUpDate())));
     	                }else if("≥".equals(WlVoitureVO.getRegisterDay().getUpSign())){
     	                	criteria.add(Expression.le("registerDay", ProjectUtil.getDate(WlVoitureVO.getRegisterDay().getUpDate())));
     	                }
     	                if(!"=".equals(WlVoitureVO.getRegisterDay().getUpSign())){
     		                if(">".equals(WlVoitureVO.getRegisterDay().getDownSign())){
     		                	criteria.add(Expression.gt("registerDay", ProjectUtil.getDate(WlVoitureVO.getRegisterDay().getDownDate())));
     		                }else if("≥".equals(WlVoitureVO.getRegisterDay().getDownSign())){
     		                	criteria.add(Expression.ge("registerDay", ProjectUtil.getDate(WlVoitureVO.getRegisterDay().getDownDate())));
     		                }
     	                }
     	            }
     	            //System.out.println("WlVoitureVO.getInWidth():"+WlVoitureVO.getInWidth());
     	            if(WlVoitureVO.getLoad()!=null){
     	            	if("=".equals(WlVoitureVO.getLoad().getUpSign())){
     	                	criteria.add(Expression.eq("load", WlVoitureVO.getLoad().getUpNumber()));
     	                }else if(">".equals(WlVoitureVO.getLoad().getUpSign())){
     	                	criteria.add(Expression.lt("load", WlVoitureVO.getLoad().getUpNumber()));
     	                }else if("≥".equals(WlVoitureVO.getLoad().getUpSign())){
     	                	criteria.add(Expression.le("load", WlVoitureVO.getLoad().getUpNumber()));
     	                }
     	                if(!"=".equals(WlVoitureVO.getLoad().getUpSign())){
     		                if(">".equals(WlVoitureVO.getLoad().getDownSign())){
     		                	criteria.add(Expression.gt("load", WlVoitureVO.getLoad().getDownNumber()));
     		                }else if("≥".equals(WlVoitureVO.getLoad().getDownSign())){
     		                	criteria.add(Expression.ge("load", WlVoitureVO.getLoad().getDownNumber()));
     		                }
     	                }
     	            }
     	            if(WlVoitureVO.getSelfWeight()!=null){
     	            	if("=".equals(WlVoitureVO.getSelfWeight().getUpSign())){
     	                	criteria.add(Expression.eq("selfWeight", WlVoitureVO.getSelfWeight().getUpNumber()));
     	                }else if(">".equals(WlVoitureVO.getSelfWeight().getUpSign())){
     	                	criteria.add(Expression.lt("selfWeight", WlVoitureVO.getSelfWeight().getUpNumber()));
     	                }else if("≥".equals(WlVoitureVO.getSelfWeight().getUpSign())){
     	                	criteria.add(Expression.le("selfWeight", WlVoitureVO.getSelfWeight().getUpNumber()));
     	                }
     	                if(!"=".equals(WlVoitureVO.getSelfWeight().getUpSign())){
     		                if(">".equals(WlVoitureVO.getSelfWeight().getDownSign())){
     		                	criteria.add(Expression.gt("selfWeight", WlVoitureVO.getSelfWeight().getDownNumber()));
     		                }else if("≥".equals(WlVoitureVO.getSelfWeight().getDownSign())){
     		                	criteria.add(Expression.ge("selfWeight", WlVoitureVO.getSelfWeight().getDownNumber()));
     		                }
     	                }
     	            }
     	            if(WlVoitureVO.getOutLength()!=null){
     	            	if("=".equals(WlVoitureVO.getOutLength().getUpSign())){
     	                	criteria.add(Expression.eq("outLength", WlVoitureVO.getOutLength().getUpNumber()));
     	                }else if(">".equals(WlVoitureVO.getOutLength().getUpSign())){
     	                	criteria.add(Expression.lt("outLength", WlVoitureVO.getOutLength().getUpNumber()));
     	                }else if("≥".equals(WlVoitureVO.getOutLength().getUpSign())){
     	                	criteria.add(Expression.le("outLength", WlVoitureVO.getOutLength().getUpNumber()));
     	                }
     	                if(!"=".equals(WlVoitureVO.getOutLength().getUpSign())){
     		                if(">".equals(WlVoitureVO.getOutLength().getDownSign())){
     		                	criteria.add(Expression.gt("outLength", WlVoitureVO.getOutLength().getDownNumber()));
     		                }else if("≥".equals(WlVoitureVO.getOutLength().getDownSign())){
     		                	criteria.add(Expression.ge("outLength", WlVoitureVO.getOutLength().getDownNumber()));
     		                }
     	                }
     	            }
     	            if(WlVoitureVO.getInLength()!=null){
     	            	if("=".equals(WlVoitureVO.getInLength().getUpSign())){
     	                	criteria.add(Expression.eq("inLength", WlVoitureVO.getInLength().getUpNumber()));
     	                }else if(">".equals(WlVoitureVO.getInLength().getUpSign())){
     	                	criteria.add(Expression.lt("inLength", WlVoitureVO.getInLength().getUpNumber()));
     	                }else if("≥".equals(WlVoitureVO.getInLength().getUpSign())){
     	                	criteria.add(Expression.le("inLength", WlVoitureVO.getInLength().getUpNumber()));
     	                }
     	                if(!"=".equals(WlVoitureVO.getInLength().getUpSign())){
     		                if(">".equals(WlVoitureVO.getInLength().getDownSign())){
     		                	criteria.add(Expression.gt("inLength", WlVoitureVO.getInLength().getDownNumber()));
     		                }else if("≥".equals(WlVoitureVO.getInLength().getDownSign())){
     		                	criteria.add(Expression.ge("inLength", WlVoitureVO.getInLength().getDownNumber()));
     		                }
     	                }
     	            }
     	            if(WlVoitureVO.getOutWidth()!=null){
     	            	if("=".equals(WlVoitureVO.getOutWidth().getUpSign())){
     	                	criteria.add(Expression.eq("outWidth", WlVoitureVO.getOutWidth().getUpNumber()));
     	                }else if(">".equals(WlVoitureVO.getOutWidth().getUpSign())){
     	                	criteria.add(Expression.lt("outWidth", WlVoitureVO.getOutWidth().getUpNumber()));
     	                }else if("≥".equals(WlVoitureVO.getOutWidth().getUpSign())){
     	                	criteria.add(Expression.le("outWidth", WlVoitureVO.getOutWidth().getUpNumber()));
     	                }
     	                if(!"=".equals(WlVoitureVO.getOutWidth().getUpSign())){
     		                if(">".equals(WlVoitureVO.getOutWidth().getDownSign())){
     		                	criteria.add(Expression.gt("outWidth", WlVoitureVO.getOutWidth().getDownNumber()));
     		                }else if("≥".equals(WlVoitureVO.getOutWidth().getDownSign())){
     		                	criteria.add(Expression.ge("outWidth", WlVoitureVO.getOutWidth().getDownNumber()));
     		                }
     	                }
     	            }
     	            if(WlVoitureVO.getInWidth()!=null){
     	            	if("=".equals(WlVoitureVO.getInWidth().getUpSign())){
     	                	criteria.add(Expression.eq("inWidth", WlVoitureVO.getInWidth().getUpNumber()));
     	                }else if(">".equals(WlVoitureVO.getInWidth().getUpSign())){
     	                	criteria.add(Expression.lt("inWidth", WlVoitureVO.getInWidth().getUpNumber()));
     	                }else if("≥".equals(WlVoitureVO.getInWidth().getUpSign())){
     	                	criteria.add(Expression.le("inWidth", WlVoitureVO.getInWidth().getUpNumber()));
     	                }
     	                if(!"=".equals(WlVoitureVO.getInWidth().getUpSign())){
     		                if(">".equals(WlVoitureVO.getInWidth().getDownSign())){
     		                	criteria.add(Expression.gt("inWidth", WlVoitureVO.getInWidth().getDownNumber()));
     		                }else if("≥".equals(WlVoitureVO.getInWidth().getDownSign())){
     		                	criteria.add(Expression.ge("inWidth", WlVoitureVO.getInWidth().getDownNumber()));
     		                }
     	                }
     	            }
     	            if(WlVoitureVO.getOutHeight()!=null){
     	            	if("=".equals(WlVoitureVO.getOutHeight().getUpSign())){
     	                	criteria.add(Expression.eq("outHeight", WlVoitureVO.getOutHeight().getUpNumber()));
     	                }else if(">".equals(WlVoitureVO.getOutHeight().getUpSign())){
     	                	criteria.add(Expression.lt("outHeight", WlVoitureVO.getOutHeight().getUpNumber()));
     	                }else if("≥".equals(WlVoitureVO.getOutHeight().getUpSign())){
     	                	criteria.add(Expression.le("outHeight", WlVoitureVO.getOutHeight().getUpNumber()));
     	                }
     	                if(!"=".equals(WlVoitureVO.getOutHeight().getUpSign())){
     		                if(">".equals(WlVoitureVO.getOutHeight().getDownSign())){
     		                	criteria.add(Expression.gt("outHeight", WlVoitureVO.getOutHeight().getDownNumber()));
     		                }else if("≥".equals(WlVoitureVO.getOutHeight().getDownSign())){
     		                	criteria.add(Expression.ge("outHeight", WlVoitureVO.getOutHeight().getDownNumber()));
     		                }
     	                }
     	            }
     	            if(WlVoitureVO.getInHeight()!=null){
     	            	if("=".equals(WlVoitureVO.getInHeight().getUpSign())){
     	                	criteria.add(Expression.eq("inHeight", WlVoitureVO.getInHeight().getUpNumber()));
     	                }else if(">".equals(WlVoitureVO.getInHeight().getUpSign())){
     	                	criteria.add(Expression.lt("inHeight", WlVoitureVO.getInHeight().getUpNumber()));
     	                }else if("≥".equals(WlVoitureVO.getInHeight().getUpSign())){
     	                	criteria.add(Expression.le("inHeight", WlVoitureVO.getInHeight().getUpNumber()));
     	                }
     	                if(!"=".equals(WlVoitureVO.getInHeight().getUpSign())){
     		                if(">".equals(WlVoitureVO.getInHeight().getDownSign())){
     		                	criteria.add(Expression.gt("inHeight", WlVoitureVO.getInHeight().getDownNumber()));
     		                }else if("≥".equals(WlVoitureVO.getInHeight().getDownSign())){
     		                	criteria.add(Expression.ge("inHeight", WlVoitureVO.getInHeight().getDownNumber()));
     		                }
     	                }
     	            }
     	            if (WlVoitureVO.getColour() != null)
     	                criteria.add(Expression.ilike("colour", WlVoitureVO.getColour(), MatchMode.ANYWHERE));
     	            if (WlVoitureVO.getVoitureType() != null)
     	                criteria.add(Expression.ilike("voitureType", WlVoitureVO.getVoitureType(), MatchMode.ANYWHERE));
     	            if (WlVoitureVO.getTyreType() != null)
     	                criteria.add(Expression.ilike("tyreType", WlVoitureVO.getTyreType(), MatchMode.ANYWHERE));
     	            if (WlVoitureVO.getPin() != null)
     	                criteria.add(Expression.ilike("pin", WlVoitureVO.getPin(), MatchMode.ANYWHERE));
     	            if (WlVoitureVO.getCountry() != null)
     	                criteria.add(Expression.ilike("country", WlVoitureVO.getCountry(), MatchMode.ANYWHERE));
     	            if (WlVoitureVO.getTypeV() != null)
     	                criteria.add(Expression.ilike("typeV", WlVoitureVO.getTypeV(), MatchMode.ANYWHERE));
     	            if(WlVoitureVO.getInitvalue()!=null){
     	            	//criteria.add(Expression.eq("initvalue", new java.lang.Double(WlVoitureVO.getInitvalue())));
     	            	if("=".equals(WlVoitureVO.getInitvalue().getUpSign())){
     	                	criteria.add(Expression.eq("initvalue", WlVoitureVO.getInitvalue().getUpNumber()));
     	                }else if(">".equals(WlVoitureVO.getInitvalue().getUpSign())){
     	                	criteria.add(Expression.lt("initvalue", WlVoitureVO.getInitvalue().getUpNumber()));
     	                }else if("≥".equals(WlVoitureVO.getInitvalue().getUpSign())){
     	                	criteria.add(Expression.le("initvalue", WlVoitureVO.getInitvalue().getUpNumber()));
     	                }
     	                if(!"=".equals(WlVoitureVO.getInitvalue().getUpSign())){
     		                if(">".equals(WlVoitureVO.getInitvalue().getDownSign())){
     		                	criteria.add(Expression.gt("initvalue", WlVoitureVO.getInitvalue().getDownNumber()));
     		                }else if("≥".equals(WlVoitureVO.getInitvalue().getDownSign())){
     		                	criteria.add(Expression.ge("initvalue", WlVoitureVO.getInitvalue().getDownNumber()));
     		                }
     	                }
     	            }
     	            if (WlVoitureVO.getRemark() != null)
     	                criteria.add(Expression.ilike("remark", WlVoitureVO.getRemark(), MatchMode.ANYWHERE));
     	            if (WlVoitureVO.getStatus() != null)
     	                criteria.add(Expression.ilike("status", WlVoitureVO.getStatus(), MatchMode.ANYWHERE));
     	            if (WlVoitureVO.getId() != 0)criteria.add(Expression.eq("id", WlVoitureVO.getId()));
     	            //System.out.println("WlVoitureVO.getDepart():"+WlVoitureVO.getDepart());
     	            if (WlVoitureVO.getDepart() != null) criteria.createCriteria("depart").add(Expression.eq("id", WlVoitureVO.getDepart().getId()));
     	            //if (WlVoitureVO.getTasks() != null && tasks.length > 0) criteria.createCriteria("tasks").add(Expression.in("id", WlVoitureVO.getTasks()));
     	            if (WlVoitureVO.getMasterDriver() != null) criteria.createCriteria("masterDriver").add(Expression.eq("id", WlVoitureVO.getMasterDriver().getId()));
     	            //条数
     	            
     	              int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
     	                      .uniqueResult())  
     	                      .intValue();//取得符合条件的总数  
     	        
     			      criteria.setProjection(null);  
     			      WlVoiture or=new com.logistics.entity.car.WlVoitureImpl();
     			     or.setId(new Long(totalCount));
     			     if(taskRowList.size()==0){
     			    	if (pageNumber > 0 && pageSize > 0)
     				     {
     				     	criteria.setFirstResult(this.calculateFirstResult(pageNumber, pageSize));
     				     	criteria.setMaxResults(pageSize);
     				     	
     				     }
 			    	}else{
     				     	criteria.setMaxResults(100);
     				}
     			    re=criteria.list();
	     			    re.add(or);
     			     
     			    
     	        }
     	        catch (org.hibernate.HibernateException ex)
     	        {
     	            throw super.convertHibernateAccessException(ex);
     	        }
            	//rnd
            	
            }
            if(taskRowList.size()>0){//遗留
            	
            }
		return re;
        }

}