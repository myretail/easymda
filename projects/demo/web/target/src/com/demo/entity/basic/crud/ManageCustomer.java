// license-header java merge-point
package com.demo.entity.basic.crud;

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

public final class ManageCustomer extends DispatchAction
{
    public ActionForward execute(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        request.getSession().setAttribute("manageableForm", actionForm);
        return super.execute(mapping, actionForm, request, response);
    }

    public ActionForward create(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.basic.crud.CustomerForm form = (com.demo.entity.basic.crud.CustomerForm)actionForm;

        com.demo.ManageableServiceLocator.instance().getCustomerManageableService().create(
            (StringUtils.isBlank(request.getParameter("customerName"))) ? null : form.getCustomerName()
            , (StringUtils.isBlank(request.getParameter("custEnum"))) ? null : form.getCustEnum()
            , (StringUtils.isBlank(request.getParameter("id"))) ? null : form.getId()
        );

        return preload(mapping, actionForm, request, response);
    }

    public ActionForward read(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.basic.crud.CustomerForm form = (com.demo.entity.basic.crud.CustomerForm)actionForm;

        final java.util.List list = com.demo.ManageableServiceLocator.instance().getCustomerManageableService().read(
            (StringUtils.isBlank(request.getParameter("customerName"))) ? null : form.getCustomerName()
            , (StringUtils.isBlank(request.getParameter("custEnum"))) ? null : form.getCustEnum()
            , (StringUtils.isBlank(request.getParameter("id"))) ? null : form.getId()
        );
        form.setManageableList(list);

        if (list.size() >= 250)
        {
            saveMaxResultsWarning(request);
        }

        return mapping.getInputForward();
    }

    public ActionForward preload(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.basic.crud.CustomerForm form = (com.demo.entity.basic.crud.CustomerForm)actionForm;

        final java.util.List list = com.demo.ManageableServiceLocator.instance().getCustomerManageableService().readAll();
        form.setManageableList(list);


        if (list.size() >= 250)
        {
            saveMaxResultsWarning(request);
        }

        return mapping.getInputForward();
    }

    protected ActionForward unspecified(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        return preload(mapping, actionForm, request, response);
    }

    public ActionForward update(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.basic.crud.CustomerForm form = (com.demo.entity.basic.crud.CustomerForm) actionForm;

        com.demo.ManageableServiceLocator.instance().getCustomerManageableService().update(
            (StringUtils.isBlank(request.getParameter("customerName"))) ? null : form.getCustomerName()
            , (StringUtils.isBlank(request.getParameter("custEnum"))) ? null : form.getCustEnum()
            , (StringUtils.isBlank(request.getParameter("id"))) ? null : form.getId()
        );

        return preload(mapping, actionForm, request, response);
    }

    public ActionForward delete(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.basic.crud.CustomerForm form = (com.demo.entity.basic.crud.CustomerForm) actionForm;

        final java.lang.Long[] selectedRows = form.getSelectedRows();
        if (selectedRows != null && selectedRows.length > 0)
        {
            com.demo.ManageableServiceLocator.instance().getCustomerManageableService().delete(selectedRows);
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
