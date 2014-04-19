// license-header java merge-point
package com.demo.entity.orga.crud;

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

public final class ManageOrgaPeoples extends DispatchAction
{
    public ActionForward execute(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        request.getSession().setAttribute("manageableForm", actionForm);
        return super.execute(mapping, actionForm, request, response);
    }

    public ActionForward create(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.orga.crud.OrgaPeoplesForm form = (com.demo.entity.orga.crud.OrgaPeoplesForm)actionForm;

        com.demo.ManageableServiceLocator.instance().getOrgaPeoplesManageableService().create(
            (StringUtils.isBlank(request.getParameter("id"))) ? null : form.getId()
            , (StringUtils.isBlank(request.getParameter("orga"))) ? null : form.getOrga()
            , (StringUtils.isBlank(request.getParameter("people"))) ? null : form.getPeople()
        );

        return preload(mapping, actionForm, request, response);
    }

    public ActionForward read(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.orga.crud.OrgaPeoplesForm form = (com.demo.entity.orga.crud.OrgaPeoplesForm)actionForm;

        final java.util.List list = com.demo.ManageableServiceLocator.instance().getOrgaPeoplesManageableService().read(
            (StringUtils.isBlank(request.getParameter("id"))) ? null : form.getId()
            , (StringUtils.isBlank(request.getParameter("orga"))) ? null : form.getOrga()
            , (StringUtils.isBlank(request.getParameter("people"))) ? null : form.getPeople()
        );
        form.setManageableList(list);

        if (list.size() >= 250)
        {
            saveMaxResultsWarning(request);
        }

        final java.util.Map backingLists = com.demo.ManageableServiceLocator.instance().getOrgaPeoplesManageableService().readBackingLists();
        form.setOrgaBackingList((java.util.List)backingLists.get("orga"));
        form.setPeopleBackingList((java.util.List)backingLists.get("people"));

        return mapping.getInputForward();
    }

    public ActionForward preload(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.orga.crud.OrgaPeoplesForm form = (com.demo.entity.orga.crud.OrgaPeoplesForm)actionForm;

        final java.util.List list = com.demo.ManageableServiceLocator.instance().getOrgaPeoplesManageableService().readAll();
        form.setManageableList(list);


        if (list.size() >= 250)
        {
            saveMaxResultsWarning(request);
        }

        final java.util.Map backingLists = com.demo.ManageableServiceLocator.instance().getOrgaPeoplesManageableService().readBackingLists();
        if (StringUtils.isNotBlank(request.getParameter("ref_Orga")))
        {
            form.setOrga(new java.lang.Long(request.getParameter("ref_Orga")));
        }
        form.setOrgaBackingList((java.util.List)backingLists.get("orga"));
        if (StringUtils.isNotBlank(request.getParameter("ref_Peoples")))
        {
            form.setPeople(new java.lang.Long(request.getParameter("ref_Peoples")));
        }
        form.setPeopleBackingList((java.util.List)backingLists.get("people"));

        return mapping.getInputForward();
    }

    protected ActionForward unspecified(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        return preload(mapping, actionForm, request, response);
    }

    public ActionForward update(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.orga.crud.OrgaPeoplesForm form = (com.demo.entity.orga.crud.OrgaPeoplesForm) actionForm;

        com.demo.ManageableServiceLocator.instance().getOrgaPeoplesManageableService().update(
            (StringUtils.isBlank(request.getParameter("id"))) ? null : form.getId()
            , (StringUtils.isBlank(request.getParameter("orga"))) ? null : form.getOrga()
            , (StringUtils.isBlank(request.getParameter("people"))) ? null : form.getPeople()
        );

        return preload(mapping, actionForm, request, response);
    }

    public ActionForward delete(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.orga.crud.OrgaPeoplesForm form = (com.demo.entity.orga.crud.OrgaPeoplesForm) actionForm;

        final java.lang.Long[] selectedRows = form.getSelectedRows();
        if (selectedRows != null && selectedRows.length > 0)
        {
            com.demo.ManageableServiceLocator.instance().getOrgaPeoplesManageableService().delete(selectedRows);
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
