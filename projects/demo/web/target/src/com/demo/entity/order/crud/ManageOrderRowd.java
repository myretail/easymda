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

public final class ManageOrderRowd extends DispatchAction
{
    public ActionForward execute(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        request.getSession().setAttribute("manageableForm", actionForm);
        return super.execute(mapping, actionForm, request, response);
    }

    public ActionForward create(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.order.crud.OrderRowdForm form = (com.demo.entity.order.crud.OrderRowdForm)actionForm;

        com.demo.ManageableServiceLocator.instance().getOrderRowdManageableService().create(
            (StringUtils.isBlank(request.getParameter("productNum"))) ? 0 : form.getProductNum()
            , (StringUtils.isBlank(request.getParameter("unitNum"))) ? 0 : form.getUnitNum()
            , (StringUtils.isBlank(request.getParameter("goodsSuttle"))) ? 0 : form.getGoodsSuttle()
            , (StringUtils.isBlank(request.getParameter("goodsWeight"))) ? 0 : form.getGoodsWeight()
            , (StringUtils.isBlank(request.getParameter("goodsVolume"))) ? 0 : form.getGoodsVolume()
            , (StringUtils.isBlank(request.getParameter("label"))) ? null : form.getLabel()
            , (StringUtils.isBlank(request.getParameter("carriage"))) ? 0 : form.getCarriage()
            , (StringUtils.isBlank(request.getParameter("especial"))) ? null : form.getEspecial()
            , (StringUtils.isBlank(request.getParameter("goodsState"))) ? null : form.getGoodsState()
            , (StringUtils.isBlank(request.getParameter("remark"))) ? null : form.getRemark()
            , (StringUtils.isBlank(request.getParameter("id"))) ? null : form.getId()
            , (StringUtils.isBlank(request.getParameter("order"))) ? null : form.getOrder()
            , (StringUtils.isBlank(request.getParameter("product"))) ? null : form.getProduct()
        );

        return preload(mapping, actionForm, request, response);
    }

    public ActionForward read(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.order.crud.OrderRowdForm form = (com.demo.entity.order.crud.OrderRowdForm)actionForm;

        final java.util.List list = com.demo.ManageableServiceLocator.instance().getOrderRowdManageableService().read(
            (StringUtils.isBlank(request.getParameter("productNum"))) ? 0 : form.getProductNum()
            , (StringUtils.isBlank(request.getParameter("unitNum"))) ? 0 : form.getUnitNum()
            , (StringUtils.isBlank(request.getParameter("goodsSuttle"))) ? 0 : form.getGoodsSuttle()
            , (StringUtils.isBlank(request.getParameter("goodsWeight"))) ? 0 : form.getGoodsWeight()
            , (StringUtils.isBlank(request.getParameter("goodsVolume"))) ? 0 : form.getGoodsVolume()
            , (StringUtils.isBlank(request.getParameter("label"))) ? null : form.getLabel()
            , (StringUtils.isBlank(request.getParameter("carriage"))) ? 0 : form.getCarriage()
            , (StringUtils.isBlank(request.getParameter("especial"))) ? null : form.getEspecial()
            , (StringUtils.isBlank(request.getParameter("goodsState"))) ? null : form.getGoodsState()
            , (StringUtils.isBlank(request.getParameter("remark"))) ? null : form.getRemark()
            , (StringUtils.isBlank(request.getParameter("id"))) ? null : form.getId()
            , (StringUtils.isBlank(request.getParameter("order"))) ? null : form.getOrder()
            , (StringUtils.isBlank(request.getParameter("product"))) ? null : form.getProduct()
        );
        form.setManageableList(list);

        if (list.size() >= 250)
        {
            saveMaxResultsWarning(request);
        }

        final java.util.Map backingLists = com.demo.ManageableServiceLocator.instance().getOrderRowdManageableService().readBackingLists();
        form.setOrderBackingList((java.util.List)backingLists.get("order"));
        form.setProductBackingList((java.util.List)backingLists.get("product"));

        return mapping.getInputForward();
    }

    public ActionForward preload(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.order.crud.OrderRowdForm form = (com.demo.entity.order.crud.OrderRowdForm)actionForm;

        final java.util.List list = com.demo.ManageableServiceLocator.instance().getOrderRowdManageableService().readAll();
        form.setManageableList(list);


        if (list.size() >= 250)
        {
            saveMaxResultsWarning(request);
        }

        final java.util.Map backingLists = com.demo.ManageableServiceLocator.instance().getOrderRowdManageableService().readBackingLists();
        if (StringUtils.isNotBlank(request.getParameter("ref_Orderd")))
        {
            form.setOrder(new java.lang.Long(request.getParameter("ref_Orderd")));
        }
        form.setOrderBackingList((java.util.List)backingLists.get("order"));
        if (StringUtils.isNotBlank(request.getParameter("ref_Prod")))
        {
            form.setProduct(new java.lang.Long(request.getParameter("ref_Prod")));
        }
        form.setProductBackingList((java.util.List)backingLists.get("product"));

        return mapping.getInputForward();
    }

    protected ActionForward unspecified(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        return preload(mapping, actionForm, request, response);
    }

    public ActionForward update(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.order.crud.OrderRowdForm form = (com.demo.entity.order.crud.OrderRowdForm) actionForm;

        com.demo.ManageableServiceLocator.instance().getOrderRowdManageableService().update(
            (StringUtils.isBlank(request.getParameter("productNum"))) ? 0 : form.getProductNum()
            , (StringUtils.isBlank(request.getParameter("unitNum"))) ? 0 : form.getUnitNum()
            , (StringUtils.isBlank(request.getParameter("goodsSuttle"))) ? 0 : form.getGoodsSuttle()
            , (StringUtils.isBlank(request.getParameter("goodsWeight"))) ? 0 : form.getGoodsWeight()
            , (StringUtils.isBlank(request.getParameter("goodsVolume"))) ? 0 : form.getGoodsVolume()
            , (StringUtils.isBlank(request.getParameter("label"))) ? null : form.getLabel()
            , (StringUtils.isBlank(request.getParameter("carriage"))) ? 0 : form.getCarriage()
            , (StringUtils.isBlank(request.getParameter("especial"))) ? null : form.getEspecial()
            , (StringUtils.isBlank(request.getParameter("goodsState"))) ? null : form.getGoodsState()
            , (StringUtils.isBlank(request.getParameter("remark"))) ? null : form.getRemark()
            , (StringUtils.isBlank(request.getParameter("id"))) ? null : form.getId()
            , (StringUtils.isBlank(request.getParameter("order"))) ? null : form.getOrder()
            , (StringUtils.isBlank(request.getParameter("product"))) ? null : form.getProduct()
        );

        return preload(mapping, actionForm, request, response);
    }

    public ActionForward delete(ActionMapping mapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        final com.demo.entity.order.crud.OrderRowdForm form = (com.demo.entity.order.crud.OrderRowdForm) actionForm;

        final java.lang.Long[] selectedRows = form.getSelectedRows();
        if (selectedRows != null && selectedRows.length > 0)
        {
            com.demo.ManageableServiceLocator.instance().getOrderRowdManageableService().delete(selectedRows);
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
