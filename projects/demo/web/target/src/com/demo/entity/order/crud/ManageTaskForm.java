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

public final class ManageTaskForm extends DispatchAction
{
    public ActionForward execute(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        request.getSession().setAttribute("manageableForm", actionForm);
        return super.execute(mapping, actionForm, request, response);
    }

    public ActionForward create(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.order.crud.TaskFormForm form = (com.demo.entity.order.crud.TaskFormForm)actionForm;

        com.demo.ManageableServiceLocator.instance().getTaskFormManageableService().create(
            (StringUtils.isBlank(request.getParameter("setDateAsString"))) ? null : form.getSetDate()
            , (StringUtils.isBlank(request.getParameter("formState"))) ? null : form.getFormState()
            , (StringUtils.isBlank(request.getParameter("remark"))) ? null : form.getRemark()
            , (StringUtils.isBlank(request.getParameter("id"))) ? null : form.getId()
            , (StringUtils.isBlank(request.getParameter("tasks"))) ? null : form.getTasks()
            , (StringUtils.isBlank(request.getParameter("car"))) ? null : form.getCar()
        );

        return preload(mapping, actionForm, request, response);
    }

    public ActionForward read(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.order.crud.TaskFormForm form = (com.demo.entity.order.crud.TaskFormForm)actionForm;

        final java.util.List list = com.demo.ManageableServiceLocator.instance().getTaskFormManageableService().read(
            (StringUtils.isBlank(request.getParameter("setDateAsString"))) ? null : form.getSetDate()
            , (StringUtils.isBlank(request.getParameter("formState"))) ? null : form.getFormState()
            , (StringUtils.isBlank(request.getParameter("remark"))) ? null : form.getRemark()
            , (StringUtils.isBlank(request.getParameter("id"))) ? null : form.getId()
            , (StringUtils.isBlank(request.getParameter("tasks"))) ? null : form.getTasks()
            , (StringUtils.isBlank(request.getParameter("car"))) ? null : form.getCar()
        );
        form.setManageableList(list);

        if (list.size() >= 250)
        {
            saveMaxResultsWarning(request);
        }

        final java.util.Map backingLists = com.demo.ManageableServiceLocator.instance().getTaskFormManageableService().readBackingLists();
        form.setTasksBackingList((java.util.List)backingLists.get("tasks"));
        form.setCarBackingList((java.util.List)backingLists.get("car"));

        return mapping.getInputForward();
    }

    public ActionForward preload(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.order.crud.TaskFormForm form = (com.demo.entity.order.crud.TaskFormForm)actionForm;

        final java.util.List list = com.demo.ManageableServiceLocator.instance().getTaskFormManageableService().readAll();
        form.setManageableList(list);


        if (list.size() >= 250)
        {
            saveMaxResultsWarning(request);
        }

        final java.util.Map backingLists = com.demo.ManageableServiceLocator.instance().getTaskFormManageableService().readBackingLists();
        if (StringUtils.isNotBlank(request.getParameter("ref_Task")))
        {
            final java.lang.Long[] array = new java.lang.Long[1];
            array[0] = new java.lang.Long(request.getParameter("ref_Task"));
            form.setTasks(array);
        }
        form.setTasksBackingList((java.util.List)backingLists.get("tasks"));
        if (StringUtils.isNotBlank(request.getParameter("ref_car")))
        {
            form.setCar(new java.lang.Long(request.getParameter("ref_car")));
        }
        form.setCarBackingList((java.util.List)backingLists.get("car"));

        return mapping.getInputForward();
    }

    protected ActionForward unspecified(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        return preload(mapping, actionForm, request, response);
    }

    public ActionForward update(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.order.crud.TaskFormForm form = (com.demo.entity.order.crud.TaskFormForm) actionForm;

        com.demo.ManageableServiceLocator.instance().getTaskFormManageableService().update(
            (StringUtils.isBlank(request.getParameter("setDateAsString"))) ? null : form.getSetDate()
            , (StringUtils.isBlank(request.getParameter("formState"))) ? null : form.getFormState()
            , (StringUtils.isBlank(request.getParameter("remark"))) ? null : form.getRemark()
            , (StringUtils.isBlank(request.getParameter("id"))) ? null : form.getId()
            , (StringUtils.isBlank(request.getParameter("tasks"))) ? null : form.getTasks()
            , (StringUtils.isBlank(request.getParameter("car"))) ? null : form.getCar()
        );

        return preload(mapping, actionForm, request, response);
    }

    public ActionForward delete(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.order.crud.TaskFormForm form = (com.demo.entity.order.crud.TaskFormForm) actionForm;

        final java.lang.Long[] selectedRows = form.getSelectedRows();
        if (selectedRows != null && selectedRows.length > 0)
        {
            com.demo.ManageableServiceLocator.instance().getTaskFormManageableService().delete(selectedRows);
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
