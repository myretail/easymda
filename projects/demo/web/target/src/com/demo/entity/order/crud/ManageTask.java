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

public final class ManageTask extends DispatchAction
{
    public ActionForward execute(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        request.getSession().setAttribute("manageableForm", actionForm);
        return super.execute(mapping, actionForm, request, response);
    }

    public ActionForward create(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.order.crud.TaskForm form = (com.demo.entity.order.crud.TaskForm)actionForm;

        com.demo.ManageableServiceLocator.instance().getTaskManageableService().create(
            (StringUtils.isBlank(request.getParameter("num"))) ? 0 : form.getNum()
            , (StringUtils.isBlank(request.getParameter("volumne"))) ? 0 : form.getVolumne()
            , (StringUtils.isBlank(request.getParameter("remark"))) ? null : form.getRemark()
            , (StringUtils.isBlank(request.getParameter("id"))) ? null : form.getId()
            , (StringUtils.isBlank(request.getParameter("taskForm"))) ? null : form.getTaskForm()
        );

        return preload(mapping, actionForm, request, response);
    }

    public ActionForward read(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.order.crud.TaskForm form = (com.demo.entity.order.crud.TaskForm)actionForm;

        final java.util.List list = com.demo.ManageableServiceLocator.instance().getTaskManageableService().read(
            (StringUtils.isBlank(request.getParameter("num"))) ? 0 : form.getNum()
            , (StringUtils.isBlank(request.getParameter("volumne"))) ? 0 : form.getVolumne()
            , (StringUtils.isBlank(request.getParameter("remark"))) ? null : form.getRemark()
            , (StringUtils.isBlank(request.getParameter("id"))) ? null : form.getId()
            , (StringUtils.isBlank(request.getParameter("taskForm"))) ? null : form.getTaskForm()
        );
        form.setManageableList(list);

        if (list.size() >= 250)
        {
            saveMaxResultsWarning(request);
        }

        final java.util.Map backingLists = com.demo.ManageableServiceLocator.instance().getTaskManageableService().readBackingLists();
        form.setTaskFormBackingList((java.util.List)backingLists.get("taskForm"));

        return mapping.getInputForward();
    }

    public ActionForward preload(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.order.crud.TaskForm form = (com.demo.entity.order.crud.TaskForm)actionForm;

        final java.util.List list = com.demo.ManageableServiceLocator.instance().getTaskManageableService().readAll();
        form.setManageableList(list);


        if (list.size() >= 250)
        {
            saveMaxResultsWarning(request);
        }

        final java.util.Map backingLists = com.demo.ManageableServiceLocator.instance().getTaskManageableService().readBackingLists();
        if (StringUtils.isNotBlank(request.getParameter("ref_TaskForm")))
        {
            form.setTaskForm(new java.lang.Long(request.getParameter("ref_TaskForm")));
        }
        form.setTaskFormBackingList((java.util.List)backingLists.get("taskForm"));

        return mapping.getInputForward();
    }

    protected ActionForward unspecified(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        return preload(mapping, actionForm, request, response);
    }

    public ActionForward update(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.order.crud.TaskForm form = (com.demo.entity.order.crud.TaskForm) actionForm;

        com.demo.ManageableServiceLocator.instance().getTaskManageableService().update(
            (StringUtils.isBlank(request.getParameter("num"))) ? 0 : form.getNum()
            , (StringUtils.isBlank(request.getParameter("volumne"))) ? 0 : form.getVolumne()
            , (StringUtils.isBlank(request.getParameter("remark"))) ? null : form.getRemark()
            , (StringUtils.isBlank(request.getParameter("id"))) ? null : form.getId()
            , (StringUtils.isBlank(request.getParameter("taskForm"))) ? null : form.getTaskForm()
        );

        return preload(mapping, actionForm, request, response);
    }

    public ActionForward delete(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.order.crud.TaskForm form = (com.demo.entity.order.crud.TaskForm) actionForm;

        final java.lang.Long[] selectedRows = form.getSelectedRows();
        if (selectedRows != null && selectedRows.length > 0)
        {
            com.demo.ManageableServiceLocator.instance().getTaskManageableService().delete(selectedRows);
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
