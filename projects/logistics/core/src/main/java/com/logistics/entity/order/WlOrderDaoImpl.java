// license-header java merge-point
/**
 * This is only generated once! It will never be overwritten.
 * You can (and have to!) safely modify it by hand.
 */
package com.logistics.entity.order;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Calendar;
import java.util.Set;
import java.text.DateFormat;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;

import com.logistics.ServiceLocator;
import com.logistics.entity.basic.DateTimeQuery;
import com.logistics.entity.order.crud.WlOrderRowManageableService;
import com.logistics.util.ProjectUtil;
import com.logistics.util.QueryAssCriteriaOrder;
/**
 * @see com.logistics.entity.order.WlOrder
 */
public class WlOrderDaoImpl
    extends com.logistics.entity.order.WlOrderDaoBase
{
    /**
     * @see com.logistics.entity.order.WlOrderDao#getWlOrder(com.logistics.entity.order.WlOrderVO, int, int, java.lang.String)
     */
    protected java.util.List handleGetWlOrder(com.logistics.entity.order.WlOrderVO wlorder, int pageNumber, int pageSize, java.lang.String orderBy)
    {
    	//String sqls="select {wlorder.*}, sum({wlorderrow}.product_Num) as productNums from WlOrder {wlorder},WlOrderRow {wlorderrow} where ({wlorder}.id={wlorderrow}.order_FK) " ;
    	/*String sqls="select  WL_ORDER.ID,WL_ORDER.CUSTOMER_ORDER_NO, WL_ORDER.CONTRACT_NO, WL_ORDER.CONVEYANCE,WL_ORDER.CARRY_TYPE,WL_ORDER.SHIPPER_REMARK ,WL_ORDER.CARRIER_REMARK "+
       " ,WL_ORDER.WLLEVEL ,WL_ORDER.CUSTOMER_TYPE ,WL_ORDER.REFER_TIME,WL_ORDER.LINK_MAN ,WL_ORDER.TEL ,WL_ORDER.BOOK_TIME, "+
"WL_ORDER.COMPLETE_TIME,WL_ORDER.FORM_STATE ,WL_ORDER.PLAN_FETCH_TIME,WL_ORDER.FETCH_COMPANY_NAME ,WL_ORDER.FETCH_COMPANY_ADDRESS , "+
"WL_ORDER.FETCH_MAN ,WL_ORDER.FETCH_TEL ,WL_ORDER.PLAN_UNLOAD_TIME,WL_ORDER.UNLOAD_COMPANY_NAME ,WL_ORDER.UNLOAD_COMPANY_ADDRESS , "+
"WL_ORDER.UNLOAD_MAN ,WL_ORDER.UNLOAD_TEL ,WL_ORDER.REMARK ,WL_ORDER.PAY_COMPANY_FK ,WL_ORDER.FETCH_COMPANY_FK , "+
"WL_ORDER.UNLOAD_COMPANY_FK ,WL_ORDER.CUSTOMER_FK ,WL_ORDER.BOOKER_FK ,WL_ORDER.WLOPERATOR_FK ,WL_ORDER.TASK_PEOPLE_FK ,WL_ORDER.PATH_FK ,"+
    			"sum(wl_order_Row.product_Num) as productNums  from Wl_Order  left outer join Wl_Order_Row on WL_ORDER.ID=WL_ORDER_ROW.ORDER_FK where (1=1)  " ;
    	//String hsqls="select ord, sum(orderRow.productNum) as productNums  from    com.logistics.entity.order.WlOrderRowImpl as orderRow  left outer join com.logistics.entity.order.WlOrderImpl  as ord where (1=1) " ;
    	*/
    	//String sqls="select count(wlorder.id) from wlorder where 1=1 ";
    	//System.out.println("nmvmvtrtrtrioytrt:");
    	final Session session = getSession(false);
    	try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.order.WlOrderImpl.class);

                //sqls=sqls+" and ( ord.customerOrderNo like :customerOrderNo ) ";
            	//sqls=sqls+" and ( WL_ORDER.CUSTOMER_ORDER_NO like :customerOrderNo ) ";
            /*	if (wlorder.getCustomerOrderNo() != null) 	
              criteria.add(Expression.ilike("customerOrderNo", wlorder.getCustomerOrderNo(), MatchMode.START));
            if (wlorder.getContractNo() != null)
                criteria.add(Expression.ilike("contractNo", wlorder.getContractNo() , MatchMode.START));
            if (wlorder.getConveyance() != null)
                criteria.add(Expression.ilike("conveyance", wlorder.getConveyance(), MatchMode.START));
            if (wlorder.getCarryType() != null)
                criteria.add(Expression.ilike("carryType", wlorder.getCarryType(), MatchMode.START));
            if (wlorder.getShipperRemark() != null)
                criteria.add(Expression.ilike("shipperRemark", wlorder.getShipperRemark(), MatchMode.START));
            if (wlorder.getCarrierRemark() != null)
                criteria.add(Expression.ilike("carrierRemark", wlorder.getCarrierRemark(), MatchMode.START));
            if (wlorder.getWllevel() != null)
                criteria.add(Expression.ilike("wllevel", wlorder.getWllevel(), MatchMode.START));
            if (wlorder.getCustomerType() != null)
                criteria.add(Expression.ilike("customerType", wlorder.getCustomerType(), MatchMode.START));
            
            if ( !"%".equals(wlorder.getReferTime())){
                if (wlorder.getReferTime()=="null"){
                 	criteria.add(Expression.eq("referTime", null));
                }else if (wlorder.getReferTime().indexOf("to")==-1){
                    criteria.add(Expression.eq("referTime", ProjectUtil.getDate(wlorder.getReferTime())));//,"yyyy-MM-dd HH:mm:ss.SSS"
                }else if(wlorder.getReferTime().indexOf("to")!=wlorder.getReferTime().length()-2){
                	String startDate  = wlorder.getReferTime().substring(0,wlorder.getReferTime().indexOf("to"));
                	String endDate  = wlorder.getReferTime().substring(wlorder.getReferTime().indexOf("to")+2,wlorder.getReferTime().length());
                	System.out.print("startDate==="+startDate);
                	if(startDate!="")criteria.add(Expression.ge("referTime", ProjectUtil.getDate(startDate)));
                	if(endDate!="")criteria.add(Expression.le("referTime", ProjectUtil.getDate(endDate)));
                }
            }
            if (wlorder.getLinkMan() != null)
                criteria.add(Expression.ilike("linkMan", wlorder.getLinkMan(), MatchMode.START));
            if (wlorder.getTel() != null)
                criteria.add(Expression.ilike("tel", wlorder.getTel(), MatchMode.START));
            if (!"%".equals(wlorder.getBookTime())){   
            	 if (wlorder.getBookTime()=="null"){
                  	criteria.add(Expression.eq("bookTime", null));
                      }else  if (wlorder.getBookTime().indexOf("to")==-1){
	                criteria.add(Expression.eq("bookTime", ProjectUtil.getDate(wlorder.getBookTime())));//,"yyyy-MM-dd HH:mm:ss.SSS"
	            }else if(wlorder.getBookTime().indexOf("to")!=wlorder.getBookTime().length()-2){
	            	String startDate  = wlorder.getBookTime().substring(0,wlorder.getBookTime().indexOf("to"));
	            	String endDate  = wlorder.getBookTime().substring(wlorder.getBookTime().indexOf("to")+2,wlorder.getBookTime().length());
	            	if(startDate!="")criteria.add(Expression.ge("bookTime", ProjectUtil.getDate(startDate)));
	            	if(endDate!="")criteria.add(Expression.le("bookTime", ProjectUtil.getDate(startDate)));
	            }
            }
            if (!"%".equals(wlorder.getCompleteTime())){
            	if (wlorder.getCompleteTime()=="null"){
                  	criteria.add(Expression.eq("completeTime", null));
                }else  if (wlorder.getCompleteTime().indexOf("to")==-1){
                    criteria.add(Expression.eq("completeTime", ProjectUtil.getDate(wlorder.getCompleteTime())));//,"yyyy-MM-dd HH:mm:ss.SSS"
                }else if(wlorder.getCompleteTime().indexOf("to")!=wlorder.getCompleteTime().length()-2){
                	String startDate  = wlorder.getCompleteTime().substring(0,wlorder.getCompleteTime().indexOf("to"));
                	String endDate  = wlorder.getCompleteTime().substring(wlorder.getCompleteTime().indexOf("to")+2,wlorder.getCompleteTime().length());
                	if(startDate!="")criteria.add(Expression.ge("completeTime", ProjectUtil.getDate(startDate)));
                	if(endDate!="")criteria.add(Expression.le("completeTime", ProjectUtil.getDate(endDate)));
                }
            }
            if (wlorder.getFormState() != null)
                criteria.add(Expression.ilike("formState", wlorder.getFormState(), MatchMode.START));
            if (!"%".equals(wlorder.getPlanFetchTime())){
            	if (wlorder.getPlanFetchTime()=="null"){
                  	criteria.add(Expression.eq("planFetchTime", null));
                }else  if (wlorder.getPlanFetchTime().indexOf("to")==-1){
                    criteria.add(Expression.eq("planFetchTime", ProjectUtil.getDate(wlorder.getPlanFetchTime())));//,"yyyy-MM-dd HH:mm:ss.SSS"
                }else if(wlorder.getPlanFetchTime().indexOf("to")!=wlorder.getPlanFetchTime().length()-2){
                	String startDate  = wlorder.getPlanFetchTime().substring(0,wlorder.getPlanFetchTime().indexOf("to"));
                	String endDate  = wlorder.getPlanFetchTime().substring(wlorder.getPlanFetchTime().indexOf("to")+2,wlorder.getPlanFetchTime().length());
                	if(startDate!="")criteria.add(Expression.ge("planFetchTime", ProjectUtil.getDate(startDate)));
                	if(endDate!="")criteria.add(Expression.le("planFetchTime", ProjectUtil.getDate(endDate)));
                }
            }
            if (wlorder.getFetchCompanyName() != null)
                criteria.add(Expression.ilike("fetchCompanyName", wlorder.getFetchCompanyName(), MatchMode.START));
            if (wlorder.getFetchCompanyAddress() != null)
                criteria.add(Expression.ilike("fetchCompanyAddress", wlorder.getFetchCompanyAddress(), MatchMode.START));
            if (wlorder.getFetchMan() != null)
                criteria.add(Expression.ilike("fetchMan", wlorder.getFetchMan(), MatchMode.START));
            if (wlorder.getFetchTel() != null)
                criteria.add(Expression.ilike("fetchTel", wlorder.getFetchTel(), MatchMode.START));
            System.out.println("nmvmvtrtrtrtrt:"+wlorder.getPlanUnloadTime());
            
            if (!"%".equals(wlorder.getPlanUnloadTime())){   
            	System.out.println("nmvmvtrtrtrioytrt:");
            	if (wlorder.getPlanUnloadTime()=="null"){
            	    criteria.add(Expression.eq("planUnloadTime", null));
                }else if (wlorder.getPlanUnloadTime().indexOf("to")==-1){
                    criteria.add(Expression.eq("planUnloadTime", ProjectUtil.getDate(wlorder.getPlanUnloadTime())));//,"yyyy-MM-dd HH:mm:ss.SSS"
                }else if(wlorder.getPlanUnloadTime().indexOf("to")!=wlorder.getPlanUnloadTime().length()-2){
                	String startDate  = wlorder.getPlanUnloadTime().substring(0,wlorder.getPlanUnloadTime().indexOf("to"));
                	String endDate  = wlorder.getPlanUnloadTime().substring(wlorder.getPlanUnloadTime().indexOf("to")+2,wlorder.getPlanUnloadTime().length());
                	if(startDate!="")criteria.add(Expression.ge("planUnloadTime", ProjectUtil.getDate(startDate)));
                	if(endDate!="")criteria.add(Expression.le("planUnloadTime", ProjectUtil.getDate(endDate)));
                }
            }
            if (wlorder.getUnloadCompanyName() != null)
                criteria.add(Expression.ilike("unloadCompanyName", wlorder.getUnloadCompanyName(), MatchMode.START));
            if (wlorder.getUnloadCompanyAddress() != null)
                criteria.add(Expression.ilike("unloadCompanyAddress", wlorder.getUnloadCompanyAddress(), MatchMode.START));
            if (wlorder.getUnloadMan() != null)
                criteria.add(Expression.ilike("unloadMan", wlorder.getUnloadMan(), MatchMode.START));
            if (wlorder.getUnloadTel() != null)
                criteria.add(Expression.ilike("unloadTel", wlorder.getUnloadTel(), MatchMode.START));
            if (wlorder.getRemark() != null)
                criteria.add(Expression.ilike("remark", wlorder.getRemark(), MatchMode.START));
            if (wlorder.getId() != 0)criteria.add(Expression.eq("id", wlorder.getId()));
            //if (wlorder.rderRow != null && orderRow.length > 0) criteria.createCriteria("orderRow").add(Expression.in("id", orderRow));
            if (wlorder.getPayCompanyID() != 0) criteria.createCriteria("payCompany").add(Expression.eq("id", wlorder.getPayCompanyID()));
            if (wlorder.getFetchCompanyID() != 0) criteria.createCriteria("fetchCompany").add(Expression.eq("id", wlorder.getFetchCompanyID()));
            if (wlorder.getUnloadCompanyID() != 0) criteria.createCriteria("unloadCompany").add(Expression.eq("id", wlorder.getUnloadCompanyID()));
            if (wlorder.getCustomerID() != 0) criteria.createCriteria("customer").add(Expression.eq("id", wlorder.getCustomerID()));
            if (wlorder.getBookerId() != 0) criteria.createCriteria("booker").add(Expression.eq("id", wlorder.getBookerId()));
            if (wlorder.getOperatorId() != 0) criteria.createCriteria("wloperator").add(Expression.eq("id", wlorder.getOperatorId()));
            if (wlorder.getTaskPeopleId() != 0) criteria.createCriteria("taskPeople").add(Expression.eq("id", wlorder.getTaskPeopleId()));
            if (wlorder.getPathid() != 0) criteria.createCriteria("path").add(Expression.eq("id", wlorder.getPathid()));
            
          
           /* sqls = sqls+ "group by  WL_ORDER.ID,WL_ORDER.CUSTOMER_ORDER_NO, WL_ORDER.CONTRACT_NO, WL_ORDER.CONVEYANCE,WL_ORDER.CARRY_TYPE,WL_ORDER.SHIPPER_REMARK ,WL_ORDER.CARRIER_REMARK "+
       " ,WL_ORDER.WLLEVEL ,WL_ORDER.CUSTOMER_TYPE ,WL_ORDER.REFER_TIME,WL_ORDER.LINK_MAN ,WL_ORDER.TEL ,WL_ORDER.BOOK_TIME, "+
"WL_ORDER.COMPLETE_TIME,WL_ORDER.FORM_STATE ,WL_ORDER.PLAN_FETCH_TIME,WL_ORDER.FETCH_COMPANY_NAME ,WL_ORDER.FETCH_COMPANY_ADDRESS , "+
"WL_ORDER.FETCH_MAN ,WL_ORDER.FETCH_TEL ,WL_ORDER.PLAN_UNLOAD_TIME,WL_ORDER.UNLOAD_COMPANY_NAME ,WL_ORDER.UNLOAD_COMPANY_ADDRESS , "+
"WL_ORDER.UNLOAD_MAN ,WL_ORDER.UNLOAD_TEL ,WL_ORDER.REMARK ,WL_ORDER.PAY_COMPANY_FK ,WL_ORDER.FETCH_COMPANY_FK , "+
"WL_ORDER.UNLOAD_COMPANY_FK ,WL_ORDER.CUSTOMER_FK ,WL_ORDER.BOOKER_FK ,WL_ORDER.WLOPERATOR_FK ,WL_ORDER.TASK_PEOPLE_FK ,WL_ORDER.PATH_FK ";  */
            //sqls = sqls+ "group by ord";
            
            //Query sqlQuery = session.createSQLQuery(sqls);
        	//,sum(Wl_Order_Row.unitNum,sum(Wl_Order_Row.goodsSuttle,sum(Wl_Order_Row.goodsWeight,sum(Wl_Order_Row.goodsVolume, sum(Wl_Order_Row.carriage 
            //sqlQuery.setString("customerOrderNo",wlorder.getCustomerOrderNo());
            //List li=criteria.list();
            //s.createFilter( lazyCollection, "").setFirstResult(0).setMaxResults(10).list();*/
            if (wlorder != null) QueryAssCriteriaOrder.getOrderCriteria(wlorder,criteria);
            
            //条数
            int totalCount = ((Integer) criteria.setProjection(Projections.rowCount())
                             .uniqueResult())  
                             .intValue();//取得符合条件的总数  
               
             criteria.setProjection(null);  
             if(!"0".equals(orderBy)){
             	String[] orderBys=orderBy.split(",");
             	for(int i=0;i<orderBys.length;i++){
             		criteria.addOrder(Order.asc(orderBys[i]));//
             	}
             	
             }
            //int countInt= ( (Integer) session.createFilter( criteria.list(), "select count(*)" ).list().get(0) ).intValue();
            WlOrder or=new com.logistics.entity.order.WlOrderImpl();
            or.setId(new Long(0));
            or.setRemark(new Integer(totalCount).toString());
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

    /**
     * @see com.logistics.entity.order.WlOrderDao#deleteWlOrder(long)
     */
    protected void handleDeleteWlOrder(long id)
    {
    	final Session session = getSession(false);

        try
        {
            final Criteria criteria = session.createCriteria(com.logistics.entity.order.WlOrderRowImpl.class);
            if(id!=0)
            criteria.createCriteria("order").add(Expression.eq("id", new java.lang.Long(id)));
            criteria.setMaxResults(250);
            List orderRows=criteria.list();
            WlOrderRowManageableService srv = ServiceLocator.instance().getWlOrderRowManageableService(); 
            Long[] ids=new Long[250];
            for(int i=0;i<orderRows.size();i++){
            	WlOrderRow rowDao=(WlOrderRow)orderRows.get(i);
            	ids[i]=rowDao.getId();
            }
            srv.delete(ids);
            //this.getWlOrderRowDao().remove(orderRows);
            this.remove(id);
            
        }
        catch (org.hibernate.HibernateException ex)
        {
        	//session.c
            throw super.convertHibernateAccessException(ex);
        } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       
}

    /**
     * @see com.logistics.entity.order.WlOrderDao#toWlOrderVO(com.logistics.entity.order.WlOrder, com.logistics.entity.order.WlOrderVO)
     */
    public void toWlOrderVO(
        com.logistics.entity.order.WlOrder source,
        com.logistics.entity.order.WlOrderVO target)
    {
        // @todo verify behavior of toWlOrderVO
        super.toWlOrderVO(source, target);
        target.setPathid(source.getPath() == null ? 0 :source.getPath().getId());
        target.setPathName(source.getPath() == null ? "" :source.getPath().getPathName());
        target.setPayCompany(source.getCustomer() == null ? "" :source.getCustomer().getCustomerName());
        target.setPayCompanyID(source.getCustomer() == null ? 0 :source.getCustomer().getId());
        target.setFetchCompanyID(source.getFetchCompany() == null ? 0 :source.getFetchCompany().getId());
        target.setUnloadCompanyID(source.getUnloadCompany() == null ? 0 :source.getUnloadCompany().getId());
        // WARNING! No conversion for target.payCompany (can't convert source.getPayCompany():com.logistics.entity.customer.WlCustomer to java.lang.String
        target.setCustomer(source.getCustomer() == null ? "" :source.getCustomer().getCustomerName());
        target.setCustomerID(source.getCustomer() == null ? 0 :source.getCustomer().getId());
        // WARNING! No conversion for target.customer (can't convert source.getCustomer():com.logistics.entity.customer.WlCustomer to java.lang.String
        DateTimeQuery tempday=new DateTimeQuery();
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getReferTime()));
    	target.setReferTime(tempday);
        tempday.setUpDate(ProjectUtil.getFullDateStr(source.getBookTime()));
    	target.setBookTime(tempday);
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getCompleteTime()));
    	target.setCompleteTime(tempday);
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getPlanFetchTime()));
    	target.setPlanFetchTime(tempday);
    	tempday.setUpDate(ProjectUtil.getFullDateStr(source.getPlanUnloadTime()));
    	target.setPlanUnloadTime(tempday);
    	target.setBooker(source.getBooker() == null ? "" :source.getBooker().getPeopleName());
        target.setBookerId(source.getBooker() == null ? 0 :source.getBooker().getId());
        // WARNING! No conversion for target.booker (can't convert source.getBooker():com.logistics.entity.orga.People to java.lang.String
        target.setWloperator(source.getWloperator() == null ? "" :source.getWloperator().getPeopleName());
        target.setOperatorId(source.getWloperator() == null ? 0 :source.getWloperator().getId());
        // WARNING! No conversion for target.operator (can't convert source.getOperator():com.logistics.entity.orga.People to java.lang.String
        target.setTaskPeople(source.getTaskPeople() == null ? "" :source.getTaskPeople().getPeopleName());
        target.setTaskPeopleId(source.getTaskPeople() == null ? 0 :source.getTaskPeople().getId());
        // WARNING! No conversion for target.taskPeople (can't convert source.getTaskPeople():com.logistics.entity.orga.People to java.lang.String
        System.out.println("source.getOrderRow()===1"+source.getOrderRow());
        target.setOrderRows(source.getOrderRow() == null ? null :this.getWlOrderRowDao().toWlOrderRowVOArray(source.getOrderRow()));
       // if(source.getOrderRow() != null && target.getOrderRow()==null){//默认时
        	//target.setOrderRow(this.getWlOrderRowDao().toWlOrderRowVOArray(source.getOrderRow()));
        //}else if(source.getOrderRow() != null && target.getOrderRow()!=null){//==[]
        	//ordervo.orderRowvo=null;
        //}
        System.out.println("source.getOrderRow()===2"+source.getOrderRow());
    }


    /**
     * @see com.logistics.entity.order.WlOrderDao#toWlOrderVO(com.logistics.entity.order.WlOrder)
     */
    public com.logistics.entity.order.WlOrderVO toWlOrderVO(final com.logistics.entity.order.WlOrder entity)
    {
        // @todo verify behavior of toWlOrderVO
        return super.toWlOrderVO(entity);
    }


    /**
     * Retrieves the entity object that is associated with the specified value object
     * from the object store. If no such entity object exists in the object store,
     * a new, blank entity is created
     */
    private com.logistics.entity.order.WlOrder loadWlOrderFromWlOrderVO(com.logistics.entity.order.WlOrderVO wlOrderVO)
    {
        // @todo implement loadWlOrderFromWlOrderVO
        //throw new java.lang.UnsupportedOperationException("com.logistics.entity.order.loadWlOrderFromWlOrderVO(com.logistics.entity.order.WlOrderVO) not yet implemented.");

        /* A typical implementation looks like this:*/
        com.logistics.entity.order.WlOrder wlOrder = this.load(wlOrderVO.getId());
        if (wlOrder == null)
        {
            wlOrder = com.logistics.entity.order.WlOrder.Factory.newInstance();
        }
        return wlOrder;
        
    }

    
    /**
     * @see com.logistics.entity.order.WlOrderDao#wlOrderVOToEntity(com.logistics.entity.order.WlOrderVO)
     */
    public com.logistics.entity.order.WlOrder wlOrderVOToEntity(com.logistics.entity.order.WlOrderVO wlOrderVO)
    {
        // @todo verify behavior of wlOrderVOToEntity
        com.logistics.entity.order.WlOrder entity = this.loadWlOrderFromWlOrderVO(wlOrderVO);
        this.wlOrderVOToEntity(wlOrderVO, entity, true);
        return entity;
    }


    /**
     * @see com.logistics.entity.order.WlOrderDao#wlOrderVOToEntity(com.logistics.entity.order.WlOrderVO, com.logistics.entity.order.WlOrder)
     */
    public void wlOrderVOToEntity(
        com.logistics.entity.order.WlOrderVO source,
        com.logistics.entity.order.WlOrder target,
        boolean copyIfNull)
    {
        // @todo verify behavior of wlOrderVOToEntity
        super.wlOrderVOToEntity(source, target, copyIfNull);
        if(source.getPathid()!=0)target.setPath(this.getWlPathDao().load(new java.lang.Long(source.getPathid())));
        if(source.getBookerId()!=0)target.setBooker(this.getPeopleDao().load(new java.lang.Long(source.getBookerId())));
        if(source.getCustomerID()!=0)target.setCustomer(this.getWlCustomerDao().load(new java.lang.Long(source.getCustomerID())));
        if(source.getFetchCompanyID()!=0)target.setFetchCompany(this.getWlCustomerDao().load(new java.lang.Long(source.getFetchCompanyID())));
        if(source.getOperatorId()!=0)target.setWloperator(this.getPeopleDao().load(new java.lang.Long(source.getOperatorId())));
        if(source.getPayCompanyID()!=0)target.setPayCompany(this.getWlCustomerDao().load(new java.lang.Long(source.getPayCompanyID())));
        if(source.getTaskPeopleId()!=0)target.setTaskPeople(this.getPeopleDao().load(new java.lang.Long(source.getTaskPeopleId())));
        if(source.getUnloadCompanyID()!=0)target.setUnloadCompany(this.getWlCustomerDao().load(new java.lang.Long(source.getUnloadCompanyID())));
        //System.out.println("source.getReferTime():"+source.getReferTime());
        //System.out.println("projectUtil.getDate(source.getReferTime()):"+projectUtil.getDate(source.getReferTime()));
        if(source.getReferTime()!=null)target.setReferTime(ProjectUtil.getDate(source.getReferTime().getUpDate()));
        // No conversion for target.referTime (can't convert source.getReferTime():java.sql.Timestamp to java.sql.Timestamp
        if(source.getBookTime()!=null)target.setBookTime(ProjectUtil.getDate(source.getBookTime().getUpDate()));
        // No conversion for target.bookTime (can't convert source.getBookTime():java.util.Date to java.util.Date
        if(source.getCompleteTime()!=null)target.setCompleteTime(ProjectUtil.getDate(source.getCompleteTime().getUpDate()));
        // No conversion for target.completeTime (can't convert source.getCompleteTime():java.util.Date to java.util.Date
        if(source.getPlanFetchTime()!=null)target.setPlanFetchTime(ProjectUtil.getDate(source.getPlanFetchTime().getUpDate()));
        // No conversion for target.planFetchTime (can't convert source.getPlanFetchTime():java.util.Date to java.util.Date
        if(source.getPlanUnloadTime()!=null)target.setPlanUnloadTime(ProjectUtil.getDate(source.getPlanUnloadTime().getUpDate()));
        // No conversion for target.planUnloadTime (can't convert source.getPlanUnloadTime():java.util.Date to java.util.Date
    }

	@Override
	protected double handleGetSumSuttle(long id) throws Exception {
		com.logistics.entity.order.WlOrder order=this.load(id);
		Collection orderRow=order.getOrderRow();
		double sumSuttle=0;
		this.getWlOrderRowDao().toEntities(orderRow);
		Object[] orderRowArray=orderRow.toArray();
		for(int i=0;i<orderRow.size();i++){
			WlOrderRow orderRows=(WlOrderRow)orderRowArray[i];
			sumSuttle=sumSuttle+ orderRows.getGoodsSuttle();
		}
		return sumSuttle;
	}
	
	//获得所有未处理订单所在的时间范围
	protected java.util.List handleGetDateRange() throws Exception {
		String sqls="select min(plan_fetch_Time) as begindate ,max(plan_Unload_Time) as enddate from wl_order  ";//where form_state=?
    	final Session session = getSession(false);
    	try
        {
    		Query sqlQuery = session.createSQLQuery(sqls);
    		return sqlQuery.list();
    		
        }
	    catch (org.hibernate.HibernateException ex)
	    {
	    	//session.c
	        throw super.convertHibernateAccessException(ex);
	    } 
	    //return dates;
	}
    
}
