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

public final class ManageContact extends DispatchAction
{
    public ActionForward execute(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        request.getSession().setAttribute("manageableForm", actionForm);
        return super.execute(mapping, actionForm, request, response);
    }

    public ActionForward create(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.basic.crud.ContactForm form = (com.demo.entity.basic.crud.ContactForm)actionForm;

        com.demo.ManageableServiceLocator.instance().getContactManageableService().create(
            (StringUtils.isBlank(request.getParameter("codeContact"))) ? null : form.getCodeContact()
            , (StringUtils.isBlank(request.getParameter("id"))) ? null : form.getId()
            , (StringUtils.isBlank(request.getParameter("customer"))) ? null : form.getCustomer()
        );

        return preload(mapping, actionForm, request, response);
    }

    public ActionForward read(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.basic.crud.ContactForm form = (com.demo.entity.basic.crud.ContactForm)actionForm;

        final java.util.List list = com.demo.ManageableServiceLocator.instance().getContactManageableService().read(
            (StringUtils.isBlank(request.getParameter("codeContact"))) ? null : form.getCodeContact()
            , (StringUtils.isBlank(request.getParameter("id"))) ? null : form.getId()
            , (StringUtils.isBlank(request.getParameter("customer"))) ? null : form.getCustomer()
        );
        form.setManageableList(list);

        if (list.size() >= 250)
        {
            saveMaxResultsWarning(request);
        }

        final java.util.Map backingLists = com.demo.ManageableServiceLocator.instance().getContactManageableService().readBackingLists();
        form.setCustomerBackingList((java.util.List)backingLists.get("customer"));

        return mapping.getInputForward();
    }

    public ActionForward preload(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.basic.crud.ContactForm form = (com.demo.entity.basic.crud.ContactForm)actionForm;

        final java.util.List list = com.demo.ManageableServiceLocator.instance().getContactManageableService().readAll();
        form.setManageableList(list);


        if (list.size() >= 250)
        {
            saveMaxResultsWarning(request);
        }

        final java.util.Map backingLists = com.demo.ManageableServiceLocator.instance().getContactManageableService().readBackingLists();
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
        final com.demo.entity.basic.crud.ContactForm form = (com.demo.entity.basic.crud.ContactForm) actionForm;

        com.demo.ManageableServiceLocator.instance().getContactManageableService().update(
            (StringUtils.isBlank(request.getParameter("codeContact"))) ? null : form.getCodeContact()
            , (StringUtils.isBlank(request.getParameter("id"))) ? null : form.getId()
            , (StringUtils.isBlank(request.getParameter("customer"))) ? null : form.getCustomer()
        );

        return preload(mapping, actionForm, request, response);
    }

    public ActionForward delete(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.basic.crud.ContactForm form = (com.demo.entity.basic.crud.ContactForm) actionForm;

        final java.lang.Long[] selectedRows = form.getSelectedRows();
        if (selectedRows != null && selectedRows.length > 0)
        {
            com.demo.ManageableServiceLocator.instance().getContactManageableService().delete(selectedRows);
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
