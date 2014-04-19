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

public final class ManageProd extends DispatchAction
{
    public ActionForward execute(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        request.getSession().setAttribute("manageableForm", actionForm);
        return super.execute(mapping, actionForm, request, response);
    }

    public ActionForward create(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.basic.crud.ProdForm form = (com.demo.entity.basic.crud.ProdForm)actionForm;

        com.demo.ManageableServiceLocator.instance().getProdManageableService().create(
            (StringUtils.isBlank(request.getParameter("prodName"))) ? null : form.getProdName()
            , (StringUtils.isBlank(request.getParameter("code"))) ? null : form.getCode()
            , (StringUtils.isBlank(request.getParameter("price"))) ? 0 : form.getPrice()
            , (StringUtils.isBlank(request.getParameter("datefAsString"))) ? null : form.getDatef()
            , (StringUtils.isBlank(request.getParameter("prodType"))) ? null : form.getProdType()
            , (StringUtils.isBlank(request.getParameter("id"))) ? null : form.getId()
            , (StringUtils.isBlank(request.getParameter("prodCust"))) ? null : form.getProdCust()
            , (StringUtils.isBlank(request.getParameter("principal"))) ? null : form.getPrincipal()
        );

        return preload(mapping, actionForm, request, response);
    }

    public ActionForward read(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.basic.crud.ProdForm form = (com.demo.entity.basic.crud.ProdForm)actionForm;

        final java.util.List list = com.demo.ManageableServiceLocator.instance().getProdManageableService().read(
            (StringUtils.isBlank(request.getParameter("prodName"))) ? null : form.getProdName()
            , (StringUtils.isBlank(request.getParameter("code"))) ? null : form.getCode()
            , (StringUtils.isBlank(request.getParameter("price"))) ? 0 : form.getPrice()
            , (StringUtils.isBlank(request.getParameter("datefAsString"))) ? null : form.getDatef()
            , (StringUtils.isBlank(request.getParameter("prodType"))) ? null : form.getProdType()
            , (StringUtils.isBlank(request.getParameter("id"))) ? null : form.getId()
            , (StringUtils.isBlank(request.getParameter("prodCust"))) ? null : form.getProdCust()
            , (StringUtils.isBlank(request.getParameter("principal"))) ? null : form.getPrincipal()
        );
        form.setManageableList(list);

        if (list.size() >= 250)
        {
            saveMaxResultsWarning(request);
        }

        final java.util.Map backingLists = com.demo.ManageableServiceLocator.instance().getProdManageableService().readBackingLists();
        form.setProdCustBackingList((java.util.List)backingLists.get("prodCust"));
        form.setPrincipalBackingList((java.util.List)backingLists.get("principal"));

        return mapping.getInputForward();
    }

    public ActionForward preload(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.basic.crud.ProdForm form = (com.demo.entity.basic.crud.ProdForm)actionForm;

        final java.util.List list = com.demo.ManageableServiceLocator.instance().getProdManageableService().readAll();
        form.setManageableList(list);


        if (list.size() >= 250)
        {
            saveMaxResultsWarning(request);
        }

        final java.util.Map backingLists = com.demo.ManageableServiceLocator.instance().getProdManageableService().readBackingLists();
        if (StringUtils.isNotBlank(request.getParameter("ref_Customer")))
        {
            form.setProdCust(new java.lang.Long(request.getParameter("ref_Customer")));
        }
        form.setProdCustBackingList((java.util.List)backingLists.get("prodCust"));
        if (StringUtils.isNotBlank(request.getParameter("ref_Peoples")))
        {
            form.setPrincipal(new java.lang.Long(request.getParameter("ref_Peoples")));
        }
        form.setPrincipalBackingList((java.util.List)backingLists.get("principal"));

        return mapping.getInputForward();
    }

    protected ActionForward unspecified(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        return preload(mapping, actionForm, request, response);
    }

    public ActionForward update(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.basic.crud.ProdForm form = (com.demo.entity.basic.crud.ProdForm) actionForm;

        com.demo.ManageableServiceLocator.instance().getProdManageableService().update(
            (StringUtils.isBlank(request.getParameter("prodName"))) ? null : form.getProdName()
            , (StringUtils.isBlank(request.getParameter("code"))) ? null : form.getCode()
            , (StringUtils.isBlank(request.getParameter("price"))) ? 0 : form.getPrice()
            , (StringUtils.isBlank(request.getParameter("datefAsString"))) ? null : form.getDatef()
            , (StringUtils.isBlank(request.getParameter("prodType"))) ? null : form.getProdType()
            , (StringUtils.isBlank(request.getParameter("id"))) ? null : form.getId()
            , (StringUtils.isBlank(request.getParameter("prodCust"))) ? null : form.getProdCust()
            , (StringUtils.isBlank(request.getParameter("principal"))) ? null : form.getPrincipal()
        );

        return preload(mapping, actionForm, request, response);
    }

    public ActionForward delete(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.basic.crud.ProdForm form = (com.demo.entity.basic.crud.ProdForm) actionForm;

        final java.lang.Long[] selectedRows = form.getSelectedRows();
        if (selectedRows != null && selectedRows.length > 0)
        {
            com.demo.ManageableServiceLocator.instance().getProdManageableService().delete(selectedRows);
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
