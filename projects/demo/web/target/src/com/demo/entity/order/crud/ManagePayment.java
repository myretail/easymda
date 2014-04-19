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

public final class ManagePayment extends DispatchAction
{
    public ActionForward execute(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        request.getSession().setAttribute("manageableForm", actionForm);
        return super.execute(mapping, actionForm, request, response);
    }

    public ActionForward create(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.order.crud.PaymentForm form = (com.demo.entity.order.crud.PaymentForm)actionForm;

        com.demo.ManageableServiceLocator.instance().getPaymentManageableService().create(
            (StringUtils.isBlank(request.getParameter("newAttr1"))) ? null : form.getNewAttr1()
            , (StringUtils.isBlank(request.getParameter("newAttr2"))) ? null : form.getNewAttr2()
            , (StringUtils.isBlank(request.getParameter("id"))) ? null : form.getId()
            , (StringUtils.isBlank(request.getParameter("payment"))) ? null : form.getPayment()
        );

        return preload(mapping, actionForm, request, response);
    }

    public ActionForward read(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.order.crud.PaymentForm form = (com.demo.entity.order.crud.PaymentForm)actionForm;

        final java.util.List list = com.demo.ManageableServiceLocator.instance().getPaymentManageableService().read(
            (StringUtils.isBlank(request.getParameter("newAttr1"))) ? null : form.getNewAttr1()
            , (StringUtils.isBlank(request.getParameter("newAttr2"))) ? null : form.getNewAttr2()
            , (StringUtils.isBlank(request.getParameter("id"))) ? null : form.getId()
            , (StringUtils.isBlank(request.getParameter("payment"))) ? null : form.getPayment()
        );
        form.setManageableList(list);

        if (list.size() >= 250)
        {
            saveMaxResultsWarning(request);
        }

        final java.util.Map backingLists = com.demo.ManageableServiceLocator.instance().getPaymentManageableService().readBackingLists();
        form.setPaymentBackingList((java.util.List)backingLists.get("payment"));

        return mapping.getInputForward();
    }

    public ActionForward preload(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.order.crud.PaymentForm form = (com.demo.entity.order.crud.PaymentForm)actionForm;

        final java.util.List list = com.demo.ManageableServiceLocator.instance().getPaymentManageableService().readAll();
        form.setManageableList(list);


        if (list.size() >= 250)
        {
            saveMaxResultsWarning(request);
        }

        final java.util.Map backingLists = com.demo.ManageableServiceLocator.instance().getPaymentManageableService().readBackingLists();
        if (StringUtils.isNotBlank(request.getParameter("ref_OrderRowd")))
        {
            form.setPayment(new java.lang.Long(request.getParameter("ref_OrderRowd")));
        }
        form.setPaymentBackingList((java.util.List)backingLists.get("payment"));

        return mapping.getInputForward();
    }

    protected ActionForward unspecified(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        return preload(mapping, actionForm, request, response);
    }

    public ActionForward update(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.order.crud.PaymentForm form = (com.demo.entity.order.crud.PaymentForm) actionForm;

        com.demo.ManageableServiceLocator.instance().getPaymentManageableService().update(
            (StringUtils.isBlank(request.getParameter("newAttr1"))) ? null : form.getNewAttr1()
            , (StringUtils.isBlank(request.getParameter("newAttr2"))) ? null : form.getNewAttr2()
            , (StringUtils.isBlank(request.getParameter("id"))) ? null : form.getId()
            , (StringUtils.isBlank(request.getParameter("payment"))) ? null : form.getPayment()
        );

        return preload(mapping, actionForm, request, response);
    }

    public ActionForward delete(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.order.crud.PaymentForm form = (com.demo.entity.order.crud.PaymentForm) actionForm;

        final java.lang.Long[] selectedRows = form.getSelectedRows();
        if (selectedRows != null && selectedRows.length > 0)
        {
            com.demo.ManageableServiceLocator.instance().getPaymentManageableService().delete(selectedRows);
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
