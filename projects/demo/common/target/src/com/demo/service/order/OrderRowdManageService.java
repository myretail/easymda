// license-header java merge-point
//
// Attention: Generated code! Do not modify by hand!
// Generated by: SpringService.vsl in andromda-spring-cartridge.
//
package com.demo.service.order;

/**
 * 
 */
public interface OrderRowdManageService
{

    /**
     * 
     */
    public long createOrderRowd(com.demo.entity.order.OrderRowdVO OrderRowd);

    /**
     * 
     */
    public void updateOrderRowd(com.demo.entity.order.OrderRowdVO OrderRowd);

    /**
     * 
     */
    public void deleteOrderRowd(long id);

    /**
     * 
     */
    public com.demo.entity.order.OrderRowdVO[] getOrderRowd(com.demo.entity.order.OrderRowdVO OrderRowd, int pageNumber, int pageSize, java.lang.String orderBy);

}
