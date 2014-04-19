// license-header java merge-point
package com.demo.entity.order.crud;

import org.apache.struts.actions.DispatchAction;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

public final class ManageOrderd extends DispatchAction
{
    public ActionForward execute(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        request.getSession().setAttribute("manageableForm", actionForm);
        return super.execute(mapping, actionForm, request, response);
    }

    public ActionForward create(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.order.crud.OrderdForm form = (com.demo.entity.order.crud.OrderdForm)actionForm;

        com.demo.ManageableServiceLocator.instance().getOrderdManageableService().create(
            (StringUtils.isBlank(request.getParameter("customerOrderNo"))) ? null : form.getCustomerOrderNo()
            , (StringUtils.isBlank(request.getParameter("contractNo"))) ? null : form.getContractNo()
            , (StringUtils.isBlank(request.getParameter("conveyanceEnum"))) ? null : form.getConveyanceEnum()
            , (StringUtils.isBlank(request.getParameter("carryTypeEnum"))) ? null : form.getCarryTypeEnum()
            , (StringUtils.isBlank(request.getParameter("shipperRemark"))) ? null : form.getShipperRemark()
            , (StringUtils.isBlank(request.getParameter("carrierRemark"))) ? null : form.getCarrierRemark()
            , (StringUtils.isBlank(request.getParameter("levelEnum"))) ? null : form.getLevelEnum()
            , (StringUtils.isBlank(request.getParameter("customerTypeEnum"))) ? null : form.getCustomerTypeEnum()
            , (StringUtils.isBlank(request.getParameter("referTimeAsString"))) ? null : form.getReferTime()
            , (StringUtils.isBlank(request.getParameter("linkMan"))) ? null : form.getLinkMan()
            , (StringUtils.isBlank(request.getParameter("tel"))) ? null : form.getTel()
            , (StringUtils.isBlank(request.getParameter("bookTimeAsString"))) ? null : form.getBookTime()
            , (StringUtils.isBlank(request.getParameter("completeTimeAsString"))) ? null : form.getCompleteTime()
            , (StringUtils.isBlank(request.getParameter("remark"))) ? null : form.getRemark()
            , (StringUtils.isBlank(request.getParameter("id"))) ? null : form.getId()
            , (StringUtils.isBlank(request.getParameter("orderRow"))) ? null : form.getOrderRow()
            , (StringUtils.isBlank(request.getParameter("customer"))) ? null : form.getCustomer()
        );

        return preload(mapping, actionForm, request, response);
    }

    public ActionForward read(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.order.crud.OrderdForm form = (com.demo.entity.order.crud.OrderdForm)actionForm;

        final java.util.List list = com.demo.ManageableServiceLocator.instance().getOrderdManageableService().read(
            (StringUtils.isBlank(request.getParameter("customerOrderNo"))) ? null : form.getCustomerOrderNo()
            , (StringUtils.isBlank(request.getParameter("contractNo"))) ? null : form.getContractNo()
            , (StringUtils.isBlank(request.getParameter("conveyanceEnum"))) ? null : form.getConveyanceEnum()
            , (StringUtils.isBlank(request.getParameter("carryTypeEnum"))) ? null : form.getCarryTypeEnum()
            , (StringUtils.isBlank(request.getParameter("shipperRemark"))) ? null : form.getShipperRemark()
            , (StringUtils.isBlank(request.getParameter("carrierRemark"))) ? null : form.getCarrierRemark()
            , (StringUtils.isBlank(request.getParameter("levelEnum"))) ? null : form.getLevelEnum()
            , (StringUtils.isBlank(request.getParameter("customerTypeEnum"))) ? null : form.getCustomerTypeEnum()
            , (StringUtils.isBlank(request.getParameter("referTimeAsString"))) ? null : form.getReferTime()
            , (StringUtils.isBlank(request.getParameter("linkMan"))) ? null : form.getLinkMan()
            , (StringUtils.isBlank(request.getParameter("tel"))) ? null : form.getTel()
            , (StringUtils.isBlank(request.getParameter("bookTimeAsString"))) ? null : form.getBookTime()
            , (StringUtils.isBlank(request.getParameter("completeTimeAsString"))) ? null : form.getCompleteTime()
            , (StringUtils.isBlank(request.getParameter("remark"))) ? null : form.getRemark()
            , (StringUtils.isBlank(request.getParameter("id"))) ? null : form.getId()
            , (StringUtils.isBlank(request.getParameter("orderRow"))) ? null : form.getOrderRow()
            , (StringUtils.isBlank(request.getParameter("customer"))) ? null : form.getCustomer()
        );
        form.setManageableList(list);

        if (list.size() >= 250)
        {
            saveMaxResultsWarning(request);
        }

        final java.util.Map backingLists = com.demo.ManageableServiceLocator.instance().getOrderdManageableService().readBackingLists();
        form.setOrderRowBackingList((java.util.List)backingLists.get("orderRow"));
        form.setCustomerBackingList((java.util.List)backingLists.get("customer"));

        return mapping.getInputForward();
    }

    public ActionForward preload(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.order.crud.OrderdForm form = (com.demo.entity.order.crud.OrderdForm)actionForm;

        final java.util.List list = com.demo.ManageableServiceLocator.instance().getOrderdManageableService().readAll();
        form.setManageableList(list);


        if (list.size() >= 250)
        {
            saveMaxResultsWarning(request);
        }

        final java.util.Map backingLists = com.demo.ManageableServiceLocator.instance().getOrderdManageableService().readBackingLists();
        if (StringUtils.isNotBlank(request.getParameter("ref_OrderRowd")))
        {
            final java.lang.Long[] array = new java.lang.Long[1];
            array[0] = new java.lang.Long(request.getParameter("ref_OrderRowd"));
            form.setOrderRow(array);
        }
        form.setOrderRowBackingList((java.util.List)backingLists.get("orderRow"));
        if (StringUtils.isNotBlank(request.getParameter("ref_Customer")))
        {
            form.setCustomer(new java.lang.Long(request.getParameter("ref_Customer")));
        }
        form.setCustomerBackingList((java.util.List)backingLists.get("customer"));

        return mapping.getInputForward();
    }

    protected ActionForward unspecified(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        return preload(mapping, actionForm, request, response);
    }

    public ActionForward update(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.order.crud.OrderdForm form = (com.demo.entity.order.crud.OrderdForm) actionForm;

        com.demo.ManageableServiceLocator.instance().getOrderdManageableService().update(
            (StringUtils.isBlank(request.getParameter("customerOrderNo"))) ? null : form.getCustomerOrderNo()
            , (StringUtils.isBlank(request.getParameter("contractNo"))) ? null : form.getContractNo()
            , (StringUtils.isBlank(request.getParameter("conveyanceEnum"))) ? null : form.getConveyanceEnum()
            , (StringUtils.isBlank(request.getParameter("carryTypeEnum"))) ? null : form.getCarryTypeEnum()
            , (StringUtils.isBlank(request.getParameter("shipperRemark"))) ? null : form.getShipperRemark()
            , (StringUtils.isBlank(request.getParameter("carrierRemark"))) ? null : form.getCarrierRemark()
            , (StringUtils.isBlank(request.getParameter("levelEnum"))) ? null : form.getLevelEnum()
            , (StringUtils.isBlank(request.getParameter("customerTypeEnum"))) ? null : form.getCustomerTypeEnum()
            , (StringUtils.isBlank(request.getParameter("referTimeAsString"))) ? null : form.getReferTime()
            , (StringUtils.isBlank(request.getParameter("linkMan"))) ? null : form.getLinkMan()
            , (StringUtils.isBlank(request.getParameter("tel"))) ? null : form.getTel()
            , (StringUtils.isBlank(request.getParameter("bookTimeAsString"))) ? null : form.getBookTime()
            , (StringUtils.isBlank(request.getParameter("completeTimeAsString"))) ? null : form.getCompleteTime()
            , (StringUtils.isBlank(request.getParameter("remark"))) ? null : form.getRemark()
            , (StringUtils.isBlank(request.getParameter("id"))) ? null : form.getId()
            , (StringUtils.isBlank(request.getParameter("orderRow"))) ? null : form.getOrderRow()
            , (StringUtils.isBlank(request.getParameter("customer"))) ? null : form.getCustomer()
        );

        return preload(mapping, actionForm, request, response);
    }

    public ActionForward delete(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.order.crud.OrderdForm form = (com.demo.entity.order.crud.OrderdForm) actionForm;

        final java.lang.Long[] selectedRows = form.getSelectedRows();
        if (selectedRows != null && selectedRows.length > 0)
        {
            com.demo.ManageableServiceLocator.instance().getOrderdManageableService().delete(selectedRows);
        }

        return preload(mapping, actionForm, request, response);
    }

    private void saveMaxResultsWarning(HttpServletRequest request)
    {
        final HttpSession session = request.getSession();

        ActionMessages messages = (ActionMessages)session.getAttribute(org.apache.struts.Globals.MESSAGE_KEY);
        if (messages == null)
        {
            messages = new ActionMessages();
            session.setAttribute(org.apache.struts.Globals.MESSAGE_KEY, messages);
        }
        messages.add("org.andromda.bpm4struts.warningmessages", new ActionMessage("maximum.results.fetched.warning", "250"));
    }

}
