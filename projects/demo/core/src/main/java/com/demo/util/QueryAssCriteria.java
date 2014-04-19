//di=14
//d1=com.demo.entit
package  com.demo.util;

import org.hibernate.Criteria;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.MatchMode;
public class QueryAssCriteria  extends org.springframework.orm.hibernate3.support.HibernateDaoSupport{
	public static void getEnumerationCriteria(com.demo.entity.basic.EnumerationVO  enumerationVO, Criteria criteria){
		            
		if (enumerationVO.getFieldName() != null)
                criteria.add(Expression.ilike("fieldName", enumerationVO.getFieldName(), MatchMode.ANYWHERE));
            
		if (enumerationVO.getEnumerationType() != null)
                criteria.add(Expression.ilike("enumerationType", enumerationVO.getEnumerationType(), MatchMode.ANYWHERE));
            
        			if (enumerationVO.getId() != 0)criteria.add(Expression.eq("id", enumerationVO.getId()));
			}
	public static void getProdCriteria(com.demo.entity.basic.ProdVO  prodVO, Criteria criteria){
		            
		if (prodVO.getProdName() != null)
                criteria.add(Expression.ilike("prodName", prodVO.getProdName(), MatchMode.ANYWHERE));
            
		if (prodVO.getCode() != null)
                criteria.add(Expression.ilike("code", prodVO.getCode(), MatchMode.ANYWHERE));
			  if (prodVO.getPrice() != null)
              ProjectUtil.getNumberCriteria(prodVO.getPrice(),"price",criteria);
			
            
		if (prodVO.getDatef() != null)
           ProjectUtil.getDateCriteria(prodVO.getDatef(),"datef",criteria);
            
		if (prodVO.getProdType() != null)
                criteria.add(Expression.ilike("prodType", prodVO.getProdType(), MatchMode.ANYWHERE));
            System.out.println("prodVO.getId()================"+prodVO.getId());
        			if (prodVO.getId() != 0)criteria.add(Expression.eq("id", prodVO.getId()));
		            //if (prodCust != null) criteria.createCriteria("prodCust").add(Expression.eq("id", prodCust));
			if (prodVO.getProdCust() != null ){
             	//criteria.createCriteria("prodCust").add(Expression.in("id", prodCust));
             	final Criteria criteriaprodCust =criteria.createCriteria("prodCust");
            	QueryAssCriteria.getCustomerCriteria(prodVO.getProdCust(),criteriaprodCust);
             }
            //if (principal != null) criteria.createCriteria("principal").add(Expression.eq("id", principal));
			if (prodVO.getPrincipal() != null ){
             	//criteria.createCriteria("principal").add(Expression.in("id", principal));
             	final Criteria criteriaprincipal =criteria.createCriteria("principal");
            	QueryAssCriteria.getPeoplesCriteria(prodVO.getPrincipal(),criteriaprincipal);
             }
	}
	public static void getCustomerCriteria(com.demo.entity.basic.CustomerVO  customerVO, Criteria criteria){
		            
		if (customerVO.getCustomerName() != null)
                criteria.add(Expression.ilike("customerName", customerVO.getCustomerName(), MatchMode.ANYWHERE));
            
		if (customerVO.getCustEnum() != null)
                criteria.add(Expression.ilike("custEnum", customerVO.getCustEnum(), MatchMode.ANYWHERE));
            
        			if (customerVO.getId() != 0)criteria.add(Expression.eq("id", customerVO.getId()));
			}
	public static void getContactCriteria(com.demo.entity.basic.ContactVO  contactVO, Criteria criteria){
		            
		if (contactVO.getCodeContact() != null)
                criteria.add(Expression.ilike("codeContact", contactVO.getCodeContact(), MatchMode.ANYWHERE));
            
        			if (contactVO.getId() != 0)criteria.add(Expression.eq("id", contactVO.getId()));
		            //if (customer != null) criteria.createCriteria("customer").add(Expression.eq("id", customer));
			if (contactVO.getCustomer() != null ){
             	//criteria.createCriteria("customer").add(Expression.in("id", customer));
             	final Criteria criteriacustomer =criteria.createCriteria("customer");
            	QueryAssCriteria.getCustomerCriteria(contactVO.getCustomer(),criteriacustomer);
             }
	}
	public static void getOrderdCriteria(com.demo.entity.order.OrderdVO  orderdVO, Criteria criteria){
		            
		if (orderdVO.getCustomerOrderNo() != null)
                criteria.add(Expression.ilike("customerOrderNo", orderdVO.getCustomerOrderNo(), MatchMode.ANYWHERE));
            
		if (orderdVO.getContractNo() != null)
                criteria.add(Expression.ilike("contractNo", orderdVO.getContractNo(), MatchMode.ANYWHERE));
            
		if (orderdVO.getConveyanceEnum() != null)
                criteria.add(Expression.ilike("conveyanceEnum", orderdVO.getConveyanceEnum(), MatchMode.ANYWHERE));
            
		if (orderdVO.getCarryTypeEnum() != null)
                criteria.add(Expression.ilike("carryTypeEnum", orderdVO.getCarryTypeEnum(), MatchMode.ANYWHERE));
            
		if (orderdVO.getShipperRemark() != null)
                criteria.add(Expression.ilike("shipperRemark", orderdVO.getShipperRemark(), MatchMode.ANYWHERE));
            
		if (orderdVO.getCarrierRemark() != null)
                criteria.add(Expression.ilike("carrierRemark", orderdVO.getCarrierRemark(), MatchMode.ANYWHERE));
            
		if (orderdVO.getLevelEnum() != null)
                criteria.add(Expression.ilike("levelEnum", orderdVO.getLevelEnum(), MatchMode.ANYWHERE));
            
		if (orderdVO.getCustomerTypeEnum() != null)
                criteria.add(Expression.ilike("customerTypeEnum", orderdVO.getCustomerTypeEnum(), MatchMode.ANYWHERE));
            
		if (orderdVO.getReferTime() != null)
           ProjectUtil.getDateCriteria(orderdVO.getReferTime(),"referTime",criteria);
            
		if (orderdVO.getLinkMan() != null)
                criteria.add(Expression.ilike("linkMan", orderdVO.getLinkMan(), MatchMode.ANYWHERE));
            
		if (orderdVO.getTel() != null)
                criteria.add(Expression.ilike("tel", orderdVO.getTel(), MatchMode.ANYWHERE));
            
		if (orderdVO.getBookTime() != null)
           ProjectUtil.getDateCriteria(orderdVO.getBookTime(),"bookTime",criteria);
            
		if (orderdVO.getCompleteTime() != null)
           ProjectUtil.getDateCriteria(orderdVO.getCompleteTime(),"completeTime",criteria);
            
		if (orderdVO.getRemark() != null)
                criteria.add(Expression.ilike("remark", orderdVO.getRemark(), MatchMode.ANYWHERE));
            
        			if (orderdVO.getId() != 0)criteria.add(Expression.eq("id", orderdVO.getId()));
					if (orderdVO.getOrderRow() != null){
					System.out.println("orderdVO.getOrderRow().length:"+orderdVO.getOrderRow().length);
					System.out.println("orderdVO.getOrderRow():"+orderdVO.getOrderRow());
					System.out.println("orderdVO.getOrderRow()[0]:"+orderdVO.getOrderRow()[0]);
					}
					//System.out.println("orderdVO.getOrderRow().get(0):"+orderdVO.getOrderRow().get(0));
		            if (orderdVO.getOrderRow() != null && orderdVO.getOrderRow().length > 0){
             	//criteria.createCriteria("orderRow").add(Expression.in("id", orderRow));
             	final Criteria criteriaorderRow =criteria.createCriteria("orderRow");
            	QueryAssCriteria.getOrderRowdCriteria(orderdVO.getOrderRow()[0],criteriaorderRow);
             }
            //if (customer != null) criteria.createCriteria("customer").add(Expression.eq("id", customer));
			if (orderdVO.getCustomer() != null ){
             	//criteria.createCriteria("customer").add(Expression.in("id", customer));
             	final Criteria criteriacustomer =criteria.createCriteria("customer");
            	QueryAssCriteria.getCustomerCriteria(orderdVO.getCustomer(),criteriacustomer);
             }
	}
	public static void getOrderRowdCriteria(com.demo.entity.order.OrderRowdVO  orderRowdVO, Criteria criteria){
					  if (orderRowdVO.getProductNum() != null)
              ProjectUtil.getNumberCriteria(orderRowdVO.getProductNum(),"productNum",criteria);
			
			  if (orderRowdVO.getUnitNum() != null)
              ProjectUtil.getNumberCriteria(orderRowdVO.getUnitNum(),"unitNum",criteria);
			
			  if (orderRowdVO.getGoodsSuttle() != null)
              ProjectUtil.getNumberCriteria(orderRowdVO.getGoodsSuttle(),"goodsSuttle",criteria);
			
			  if (orderRowdVO.getGoodsWeight() != null)
              ProjectUtil.getNumberCriteria(orderRowdVO.getGoodsWeight(),"goodsWeight",criteria);
			
			  if (orderRowdVO.getGoodsVolume() != null)
              ProjectUtil.getNumberCriteria(orderRowdVO.getGoodsVolume(),"goodsVolume",criteria);
			
            
		if (orderRowdVO.getLabel() != null)
                criteria.add(Expression.ilike("label", orderRowdVO.getLabel(), MatchMode.ANYWHERE));
			  if (orderRowdVO.getCarriage() != null)
              ProjectUtil.getNumberCriteria(orderRowdVO.getCarriage(),"carriage",criteria);
			
            
		if (orderRowdVO.getEspecial() != null)
                criteria.add(Expression.ilike("especial", orderRowdVO.getEspecial(), MatchMode.ANYWHERE));
            
		if (orderRowdVO.getGoodsState() != null)
                criteria.add(Expression.ilike("goodsState", orderRowdVO.getGoodsState(), MatchMode.ANYWHERE));
            
		if (orderRowdVO.getRemark() != null)
                criteria.add(Expression.ilike("remark", orderRowdVO.getRemark(), MatchMode.ANYWHERE));
            
        			if (orderRowdVO.getId() != 0)criteria.add(Expression.eq("id", orderRowdVO.getId()));
		            //if (order != null) criteria.createCriteria("order").add(Expression.eq("id", order));
			if (orderRowdVO.getOrder() != null ){
             	//criteria.createCriteria("order").add(Expression.in("id", order));
             	final Criteria criteriaorder =criteria.createCriteria("order");
            	QueryAssCriteria.getOrderdCriteria(orderRowdVO.getOrder(),criteriaorder);
             }
            //if (product != null) criteria.createCriteria("product").add(Expression.eq("id", product));
			System.out.println("orderRowdVO.getProduct()========="+orderRowdVO.getProduct());
			if (orderRowdVO.getProduct() != null ){
             	//criteria.createCriteria("product").add(Expression.in("id", product));
				System.out.println("orderRowdVO.getProduct()=========================================="+orderRowdVO.getProduct());
             	final Criteria criteriaproduct =criteria.createCriteria("product");
            	QueryAssCriteria.getProdCriteria(orderRowdVO.getProduct(),criteriaproduct);
             }
	}
	public static void getOrderRowTaskCriteria(com.demo.entity.order.OrderRowTaskVO  orderRowTaskVO, Criteria criteria){
		            
        			if (orderRowTaskVO.getId() != 0)criteria.add(Expression.eq("id", orderRowTaskVO.getId()));
		            //if (orderRow != null) criteria.createCriteria("orderRow").add(Expression.eq("id", orderRow));
			if (orderRowTaskVO.getOrderRow() != null ){
             	//criteria.createCriteria("orderRow").add(Expression.in("id", orderRow));
             	final Criteria criteriaorderRow =criteria.createCriteria("orderRow");
            	QueryAssCriteria.getOrderRowdCriteria(orderRowTaskVO.getOrderRow(),criteriaorderRow);
             }
            //if (task != null) criteria.createCriteria("task").add(Expression.eq("id", task));
			if (orderRowTaskVO.getTask() != null ){
             	//criteria.createCriteria("task").add(Expression.in("id", task));
             	final Criteria criteriatask =criteria.createCriteria("task");
            	QueryAssCriteria.getTaskCriteria(orderRowTaskVO.getTask(),criteriatask);
             }
	}
	public static void getTaskCriteria(com.demo.entity.order.TaskVO  taskVO, Criteria criteria){
					  if (taskVO.getNum() != null)
              ProjectUtil.getNumberCriteria(taskVO.getNum(),"num",criteria);
			
			  if (taskVO.getVolumne() != null)
              ProjectUtil.getNumberCriteria(taskVO.getVolumne(),"volumne",criteria);
			
            
		if (taskVO.getRemark() != null)
                criteria.add(Expression.ilike("remark", taskVO.getRemark(), MatchMode.ANYWHERE));
            
        			if (taskVO.getId() != 0)criteria.add(Expression.eq("id", taskVO.getId()));
		            //if (taskForm != null) criteria.createCriteria("taskForm").add(Expression.eq("id", taskForm));
			if (taskVO.getTaskForm() != null ){
             	//criteria.createCriteria("taskForm").add(Expression.in("id", taskForm));
             	final Criteria criteriataskForm =criteria.createCriteria("taskForm");
            	QueryAssCriteria.getTaskFormCriteria(taskVO.getTaskForm(),criteriataskForm);
             }
	}
	public static void getTaskFormCriteria(com.demo.entity.order.TaskFormVO  taskFormVO, Criteria criteria){
		            
		if (taskFormVO.getSetDate() != null)
           ProjectUtil.getDateCriteria(taskFormVO.getSetDate(),"setDate",criteria);
            
		if (taskFormVO.getFormState() != null)
                criteria.add(Expression.ilike("formState", taskFormVO.getFormState(), MatchMode.ANYWHERE));
            
		if (taskFormVO.getRemark() != null)
                criteria.add(Expression.ilike("remark", taskFormVO.getRemark(), MatchMode.ANYWHERE));
            
        			if (taskFormVO.getId() != 0)criteria.add(Expression.eq("id", taskFormVO.getId()));
		            if (taskFormVO.getTasks() != null && taskFormVO.getTasks().length > 0){
             	//criteria.createCriteria("tasks").add(Expression.in("id", tasks));
             	final Criteria criteriatasks =criteria.createCriteria("tasks");
            	QueryAssCriteria.getTaskCriteria(taskFormVO.getTasks()[0],criteriatasks);
             }
            //if (car != null) criteria.createCriteria("car").add(Expression.eq("id", car));
			if (taskFormVO.getCar() != null ){
             	//criteria.createCriteria("car").add(Expression.in("id", car));
             	final Criteria criteriacar =criteria.createCriteria("car");
            	QueryAssCriteria.getcarCriteria(taskFormVO.getCar(),criteriacar);
             }
	}
	public static void getcarCriteria(com.demo.entity.order.carVO  carVO, Criteria criteria){
					  if (carVO.getLoad() != null)
              ProjectUtil.getNumberCriteria(carVO.getLoad(),"load",criteria);
			
            
        			if (carVO.getId() != 0)criteria.add(Expression.eq("id", carVO.getId()));
			}
	public static void getOrgaCriteria(com.demo.entity.orga.OrgaVO  orgaVO, Criteria criteria){
		if (orgaVO.getParentId() == 0 && orgaVO.getId() == 0){
			criteria.add(Expression.eq("parentId", new java.lang.Long(orgaVO.getParentId())));           
		}else if(orgaVO.getParentId() == 0 && orgaVO.getId() != 0){
			if (orgaVO.getId() != 0)criteria.add(Expression.eq("id", orgaVO.getId()));
		}else {	
			criteria.add(Expression.eq("parentId", new java.lang.Long(orgaVO.getParentId())));           
			if (orgaVO.getOrgaName() != null)
                criteria.add(Expression.ilike("orgaName", orgaVO.getOrgaName(), MatchMode.ANYWHERE));
            
		if (orgaVO.getOrgaCode() != null)
                criteria.add(Expression.ilike("orgaCode", orgaVO.getOrgaCode(), MatchMode.ANYWHERE));
            
		if (orgaVO.getSno() != null)
                criteria.add(Expression.ilike("sno", orgaVO.getSno(), MatchMode.ANYWHERE));
            
		if (orgaVO.getRemark() != null)
                criteria.add(Expression.ilike("remark", orgaVO.getRemark(), MatchMode.ANYWHERE));
		
		if (orgaVO.getId() != 0)criteria.add(Expression.eq("id", orgaVO.getId()));
			
		}	}
	public static void getPeoplesCriteria(com.demo.entity.orga.PeoplesVO  peoplesVO, Criteria criteria){
		            
		if (peoplesVO.getPeopleName() != null)
                criteria.add(Expression.ilike("peopleName", peoplesVO.getPeopleName(), MatchMode.ANYWHERE));
            
		if (peoplesVO.getPeoplePassword() != null)
                criteria.add(Expression.ilike("peoplePassword", peoplesVO.getPeoplePassword(), MatchMode.ANYWHERE));
            
		if (peoplesVO.getPeopleStatus() != null)
                criteria.add(Expression.ilike("peopleStatus", peoplesVO.getPeopleStatus(), MatchMode.ANYWHERE));
            
		if (peoplesVO.getBirthDay() != null)
           ProjectUtil.getDateCriteria(peoplesVO.getBirthDay(),"birthDay",criteria);
            
		if (peoplesVO.getSex() != null)
                criteria.add(Expression.ilike("sex", peoplesVO.getSex(), MatchMode.ANYWHERE));
            
		if (peoplesVO.getBirthPlace() != null)
                criteria.add(Expression.ilike("birthPlace", peoplesVO.getBirthPlace(), MatchMode.ANYWHERE));
            
		if (peoplesVO.getAddress() != null)
                criteria.add(Expression.ilike("address", peoplesVO.getAddress(), MatchMode.ANYWHERE));
            
		if (peoplesVO.getTel() != null)
                criteria.add(Expression.ilike("tel", peoplesVO.getTel(), MatchMode.ANYWHERE));
            
		if (peoplesVO.getEngageMode() != null)
                criteria.add(Expression.ilike("engageMode", peoplesVO.getEngageMode(), MatchMode.ANYWHERE));
            
		if (peoplesVO.getEngageDate() != null)
           ProjectUtil.getDateCriteria(peoplesVO.getEngageDate(),"engageDate",criteria);
            
		if (peoplesVO.getGradeEnum() != null)
                criteria.add(Expression.ilike("gradeEnum", peoplesVO.getGradeEnum(), MatchMode.ANYWHERE));
            
		if (peoplesVO.getRemark() != null)
                criteria.add(Expression.ilike("remark", peoplesVO.getRemark(), MatchMode.ANYWHERE));
            
        			if (peoplesVO.getId() != 0)criteria.add(Expression.eq("id", peoplesVO.getId()));
			}
	public static void getOrgaPeoplesCriteria(com.demo.entity.orga.OrgaPeoplesVO  orgaPeoplesVO, Criteria criteria){
		            
        			if (orgaPeoplesVO.getId() != 0)criteria.add(Expression.eq("id", orgaPeoplesVO.getId()));
		            //if (orga != null) criteria.createCriteria("orga").add(Expression.eq("id", orga));
			if (orgaPeoplesVO.getOrga() != null ){
             	//criteria.createCriteria("orga").add(Expression.in("id", orga));
             	final Criteria criteriaorga =criteria.createCriteria("orga");
            	QueryAssCriteria.getOrgaCriteria(orgaPeoplesVO.getOrga(),criteriaorga);
             }
            //if (people != null) criteria.createCriteria("people").add(Expression.eq("id", people));
			if (orgaPeoplesVO.getPeople() != null ){
             	//criteria.createCriteria("people").add(Expression.in("id", people));
             	final Criteria criteriapeople =criteria.createCriteria("people");
            	QueryAssCriteria.getPeoplesCriteria(orgaPeoplesVO.getPeople(),criteriapeople);
             }
	}
	public static void getPaymentCriteria(com.demo.entity.order.PaymentVO  paymentVO, Criteria criteria){
		            
		if (paymentVO.getNewAttr1() != null)
                criteria.add(Expression.ilike("newAttr1", paymentVO.getNewAttr1(), MatchMode.ANYWHERE));
            
		if (paymentVO.getNewAttr2() != null)
                criteria.add(Expression.ilike("newAttr2", paymentVO.getNewAttr2(), MatchMode.ANYWHERE));
            
        			if (paymentVO.getId() != 0)criteria.add(Expression.eq("id", paymentVO.getId()));
		            //if (payment != null) criteria.createCriteria("payment").add(Expression.eq("id", payment));
			if (paymentVO.getPayment() != null ){
             	//criteria.createCriteria("payment").add(Expression.in("id", payment));
             	final Criteria criteriapayment =criteria.createCriteria("payment");
            	QueryAssCriteria.getOrderRowdCriteria(paymentVO.getPayment(),criteriapayment);
             }
	}
	 
}
