<%@ include file="/taglib-imports.jspf" %>
<tiles:insert definition="main.layout">

    <tiles:put name="title" type="string">
        <bean:message key="order.rowd.page.title"/>
    </tiles:put>

    <tiles:put name="style" type="string">
        <link rel="stylesheet" type="text/css" media="screen" href="<html:rewrite page="/layout/default-manageable.css"/>"></link>
        <link rel="stylesheet" type="text/css" media="all" href="<html:rewrite page="/layout/default-calendar.css"/>"/>
    </tiles:put>

    <tiles:put name="javascript" type="string">
        <script type="text/javascript" src="<html:rewrite action="/calendar"/>"></script>
        <script type="text/javascript">
        //<!--
            function setSelect(multi, form, name, value)
            {
                var select = form.elements[name];
                var options = select.options;

                // for browser compatibility's sake we go through the options ourselves
                for (var i=0; i<options.length; i++)
                {
                    if (multi)
                    {
                        // Array.indexOf is defined in Javascript 1.5, not before
                        options[i].selected = arrayContainsElement(value,options[i].value);
                    }
                    else
                    {
                        if (options[i].value == value)
                        {
                            select.selectedIndex = i;
                            break;
                        }
                    }

                }
            }

            function arrayContainsElement(array, element)
            {
              var containsElement = false;
              for (var i=0; i<array.length && !containsElement; i++) containsElement = (array[i] == element);
              return containsElement;
            }

            function setAction(crud) { document.forms['manageOrderRowdForm'].elements['crud'].value = crud; }

            function enableUpdate(enabled) { document.getElementById("updateButton").disabled = !enabled; }

            var selectionCount = 0;

            function verifyEnableDelete(checkbox)
            {
                if (checkbox.checked) selectionCount++; else selectionCount--;
                document.getElementById("deleteButton").disabled = (selectionCount < 1);
            }

            function clearFields(form)
            {
                form.reset();
                enableUpdate(false);
                setFields("","","","","","","","","","","","","",form);
            }

            function setFields(productNum,unitNum,goodsSuttle,goodsWeight,goodsVolume,label,carriage,especial,goodsState,remark,id,order,product,form)
            {
                form.elements["productNum"].value = productNum;
                form.elements["unitNum"].value = unitNum;
                form.elements["goodsSuttle"].value = goodsSuttle;
                form.elements["goodsWeight"].value = goodsWeight;
                form.elements["goodsVolume"].value = goodsVolume;
                form.elements["label"].value = label;
                form.elements["carriage"].value = carriage;
                form.elements["especial"].value = especial;
                form.elements["goodsState"].value = goodsState;
                form.elements["remark"].value = remark;
                form.elements["id"].value = id;
                setSelect(false,form,"order",order);
                setSelect(false,form,"product",product);
            }
        //-->
        </script>
    </tiles:put>

    <tiles:put name="body" type="string">

        <div>
            <h1><bean:message key="order.rowd.page.title"/></h1>
        </div>

        <html:form styleId="manageOrderRowdForm" action="/OrderRowd/Manage" method="post">
            <input type="hidden" name="crud" value=""/>
            <div id="criteria">
                <c:if test="${!empty manageableForm}">
                    <table>
                        <tr>
                            <td><nobr><bean:message key="order.rowd.product.num"/> <div class="important">*</div></nobr></td>
                            <td>
                                <html:text name="manageableForm" property="productNum" styleClass="criteriaField" styleId="productNum"/>
                            </td>
                        </tr>
                        <tr>
                            <td><nobr><bean:message key="order.rowd.unit.num"/> <div class="important">*</div></nobr></td>
                            <td>
                                <html:text name="manageableForm" property="unitNum" styleClass="criteriaField" styleId="unitNum"/>
                            </td>
                        </tr>
                        <tr>
                            <td><nobr><bean:message key="order.rowd.goods.suttle"/> <div class="important">*</div></nobr></td>
                            <td>
                                <html:text name="manageableForm" property="goodsSuttle" styleClass="criteriaField" styleId="goodsSuttle"/>
                            </td>
                        </tr>
                        <tr>
                            <td><nobr><bean:message key="order.rowd.goods.weight"/> <div class="important">*</div></nobr></td>
                            <td>
                                <html:text name="manageableForm" property="goodsWeight" styleClass="criteriaField" styleId="goodsWeight"/>
                            </td>
                        </tr>
                        <tr>
                            <td><nobr><bean:message key="order.rowd.goods.volume"/> <div class="important">*</div></nobr></td>
                            <td>
                                <html:text name="manageableForm" property="goodsVolume" styleClass="criteriaField" styleId="goodsVolume"/>
                            </td>
                        </tr>
                        <tr>
                            <td><bean:message key="order.rowd.label"/></td>
                            <td>
                                <html:text name="manageableForm" property="label" styleClass="criteriaField" styleId="label"/>
                            </td>
                        </tr>
                        <tr>
                            <td><nobr><bean:message key="order.rowd.carriage"/> <div class="important">*</div></nobr></td>
                            <td>
                                <html:text name="manageableForm" property="carriage" styleClass="criteriaField" styleId="carriage"/>
                            </td>
                        </tr>
                        <tr>
                            <td><bean:message key="order.rowd.especial"/></td>
                            <td>
                                <html:text name="manageableForm" property="especial" styleClass="criteriaField" styleId="especial"/>
                            </td>
                        </tr>
                        <tr>
                            <td><bean:message key="order.rowd.goods.state"/></td>
                            <td>
                                <html:text name="manageableForm" property="goodsState" styleClass="criteriaField" styleId="goodsState"/>
                            </td>
                        </tr>
                        <tr>
                            <td><bean:message key="order.rowd.remark"/></td>
                            <td>
                                <html:text name="manageableForm" property="remark" styleClass="criteriaField" styleId="remark"/>
                            </td>
                        </tr>
                    <html:hidden name="manageableForm" property="id"/>
                        <tr>
                            <td>
                                    <nobr><html:link action="/Orderd/Manage"><bean:message key="order.rowd.order"/></html:link> <div class="important">*</div></nobr>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${empty manageableForm.orderBackingList}">
                                        <select name="order" disabled="disabled"/>
                                    </c:when>
                                    <c:otherwise>
                                        <select name="order">
                                            <option value=""><bean:message key="select.option.blank"/></option>
                                            <c:forEach var="valueLabel" items="${manageableForm.orderBackingList}">
                                                <c:choose>
                                                    <c:when test="${valueLabel[0] eq manageableForm.order}">
                                                        <option value="${valueLabel[0]}" selected="selected">${valueLabel[1]}</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="${valueLabel[0]}">${valueLabel[1]}</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </select>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                    <nobr><html:link action="/Prod/Manage"><bean:message key="order.rowd.product"/></html:link> <div class="important">*</div></nobr>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${empty manageableForm.productBackingList}">
                                        <select name="product" disabled="disabled"/>
                                    </c:when>
                                    <c:otherwise>
                                        <select name="product">
                                            <option value=""><bean:message key="select.option.blank"/></option>
                                            <c:forEach var="valueLabel" items="${manageableForm.productBackingList}">
                                                <c:choose>
                                                    <c:when test="${valueLabel[0] eq manageableForm.product}">
                                                        <option value="${valueLabel[0]}" selected="selected">${valueLabel[1]}</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="${valueLabel[0]}">${valueLabel[1]}</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </select>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </table>

                    <input type="submit" id="readButton" class="button" value="<bean:message key="button.read"/>" onclick="this.form.elements['id'].value='';setAction('read');"/>
                    <input type="submit" id="createButton" class="button" value="<bean:message key="button.create"/>" onclick="setAction('create');"/>
                    <input type="submit" id="deleteButton" class="button" value="<bean:message key="button.delete"/>" disabled="disabled" onclick="setAction('delete');"/>
                    <input type="submit" id="updateButton" class="button" value="<bean:message key="button.update"/>" disabled="disabled" onclick="setAction('update');return validateUpdate();"/>
                    <input type="button" id="clearButton" class="button" value="<bean:message key="button.clear"/>" onclick="clearFields(this.form);"/>
                </c:if>

<div id="entitySwitcher">
    <nobr>
        <bean:message key="select.other.entity"/>
        <select onchange="document.location=this.options[this.selectedIndex].value+'?ref_OrderRowd='+this.form.elements['id'].value;">
            <option value="<html:rewrite page="/Contact/Manage.do"/>"><bean:message key="contact"/></option>
            <option value="<html:rewrite page="/Customer/Manage.do"/>"><bean:message key="customer"/></option>
            <option value="<html:rewrite page="/Enumeration/Manage.do"/>"><bean:message key="enumeration"/></option>
            <option value="<html:rewrite page="/OrderRowTask/Manage.do"/>"><bean:message key="order.row.task"/></option>
            <option selected="selected" value="<html:rewrite page="/OrderRowd/Manage.do"/>"><bean:message key="order.rowd"/></option>
            <option value="<html:rewrite page="/Orderd/Manage.do"/>"><bean:message key="orderd"/><bean:message key="referencing.entity.marker"/></option>
            <option value="<html:rewrite page="/Orga/Manage.do"/>"><bean:message key="orga"/></option>
            <option value="<html:rewrite page="/OrgaPeoples/Manage.do"/>"><bean:message key="orga.peoples"/></option>
            <option value="<html:rewrite page="/Payment/Manage.do"/>"><bean:message key="payment"/></option>
            <option value="<html:rewrite page="/Peoples/Manage.do"/>"><bean:message key="peoples"/></option>
            <option value="<html:rewrite page="/Prod/Manage.do"/>"><bean:message key="prod"/></option>
            <option value="<html:rewrite page="/Task/Manage.do"/>"><bean:message key="task"/></option>
            <option value="<html:rewrite page="/TaskForm/Manage.do"/>"><bean:message key="task.form"/></option>
            <option value="<html:rewrite page="/car/Manage.do"/>"><bean:message key="car"/></option>
        </select>
    </nobr>
</div>

            </div>

            <div id="manageableList" class="table">
                <c:if test="${!empty manageableForm.manageableList}">
                    <display:table name="${manageableForm.manageableList}" id="row" requestURI="${pageContext.request.requestURI}"
                            requestURIcontext="false"
                            export="true" pagesize="15" sort="list">
                        <display:column media="html" sortable="false">
                            <nobr>
                                <input type="radio" name="_copy" onclick="enableUpdate(true);setFields('<formatting:escape language="javascript">${row.productNum}</formatting:escape>','<formatting:escape language="javascript">${row.unitNum}</formatting:escape>','<formatting:escape language="javascript">${row.goodsSuttle}</formatting:escape>','<formatting:escape language="javascript">${row.goodsWeight}</formatting:escape>','<formatting:escape language="javascript">${row.goodsVolume}</formatting:escape>','<formatting:escape language="javascript">${row.label}</formatting:escape>','<formatting:escape language="javascript">${row.carriage}</formatting:escape>','<formatting:escape language="javascript">${row.especial}</formatting:escape>','<formatting:escape language="javascript">${row.goodsState}</formatting:escape>','<formatting:escape language="javascript">${row.remark}</formatting:escape>','<formatting:escape language="javascript">${row.id}</formatting:escape>','<formatting:escape language="javascript">${row.order}</formatting:escape>','<formatting:escape language="javascript">${row.product}</formatting:escape>',this.form);"/>
                                <input type="checkbox" name="selectedRows" value="${row.id}" onclick="verifyEnableDelete(this);"/>
                            </nobr>
                        </display:column>
                        <display:column media="xml csv excel pdf"
                            property="productNum"
                            titleKey="order.rowd.product.num"/>
                        <display:column media="html"
                            headerClass="productNum" paramId="productNum" maxLength="36"
                            sortProperty="productNum" sortable="true"
                            titleKey="order.rowd.product.num"><nobr><formatting:escape language="javascript,html">${row.productNum}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="unitNum"
                            titleKey="order.rowd.unit.num"/>
                        <display:column media="html"
                            headerClass="unitNum" paramId="unitNum" maxLength="36"
                            sortProperty="unitNum" sortable="true"
                            titleKey="order.rowd.unit.num"><nobr><formatting:escape language="javascript,html">${row.unitNum}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="goodsSuttle"
                            titleKey="order.rowd.goods.suttle"/>
                        <display:column media="html"
                            headerClass="goodsSuttle" paramId="goodsSuttle" maxLength="36"
                            sortProperty="goodsSuttle" sortable="true"
                            titleKey="order.rowd.goods.suttle"><nobr><formatting:escape language="javascript,html">${row.goodsSuttle}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="goodsWeight"
                            titleKey="order.rowd.goods.weight"/>
                        <display:column media="html"
                            headerClass="goodsWeight" paramId="goodsWeight" maxLength="36"
                            sortProperty="goodsWeight" sortable="true"
                            titleKey="order.rowd.goods.weight"><nobr><formatting:escape language="javascript,html">${row.goodsWeight}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="goodsVolume"
                            titleKey="order.rowd.goods.volume"/>
                        <display:column media="html"
                            headerClass="goodsVolume" paramId="goodsVolume" maxLength="36"
                            sortProperty="goodsVolume" sortable="true"
                            titleKey="order.rowd.goods.volume"><nobr><formatting:escape language="javascript,html">${row.goodsVolume}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="label"
                            titleKey="order.rowd.label"/>
                        <display:column media="html"
                            headerClass="label" paramId="label" maxLength="36"
                            sortProperty="label" sortable="true"
                            titleKey="order.rowd.label"><nobr><formatting:escape language="javascript,html">${row.label}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="carriage"
                            titleKey="order.rowd.carriage"/>
                        <display:column media="html"
                            headerClass="carriage" paramId="carriage" maxLength="36"
                            sortProperty="carriage" sortable="true"
                            titleKey="order.rowd.carriage"><nobr><formatting:escape language="javascript,html">${row.carriage}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="especial"
                            titleKey="order.rowd.especial"/>
                        <display:column media="html"
                            headerClass="especial" paramId="especial" maxLength="36"
                            sortProperty="especial" sortable="true"
                            titleKey="order.rowd.especial"><nobr><formatting:escape language="javascript,html">${row.especial}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="goodsState"
                            titleKey="order.rowd.goods.state"/>
                        <display:column media="html"
                            headerClass="goodsState" paramId="goodsState" maxLength="36"
                            sortProperty="goodsState" sortable="true"
                            titleKey="order.rowd.goods.state"><nobr><formatting:escape language="javascript,html">${row.goodsState}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="remark"
                            titleKey="order.rowd.remark"/>
                        <display:column media="html"
                            headerClass="remark" paramId="remark" maxLength="36"
                            sortProperty="remark" sortable="true"
                            titleKey="order.rowd.remark"><nobr><formatting:escape language="javascript,html">${row.remark}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="order"
                            titleKey="order.rowd.order"/>
                        <display:column media="html"
                            headerClass="order" paramId="order" maxLength="36"
                            sortProperty="order" sortable="true"
                            titleKey="order.rowd.order"><nobr><formatting:escape language="javascript,html">${row.order}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="product"
                            titleKey="order.rowd.product"/>
                        <display:column media="html"
                            headerClass="product" paramId="product" maxLength="36"
                            sortProperty="product" sortable="true"
                            titleKey="order.rowd.product"><nobr><formatting:escape language="javascript,html">${row.product}</formatting:escape></nobr></display:column>
                    </display:table>
                </c:if>
            </div>

        </html:form>

        <div id="pageHelpSection">
            <blockquote>
                <a href="" id="pageHelp" style="display:inline;" onclick="openWindow('<html:rewrite action="/OrderRowd/ManageHelp"/>','onlinehelp',true,false,760,540); return false;">
                    <bean:message key="online.help.href"/>
                </a>
                <html:img page="/layout/help.gif" style="display:inline;"/>
            </blockquote>
        </div>

    </tiles:put>

</tiles:insert>
<%
String peopleId = request.getParameter("peopleId");
%>
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
     <style type="text/css">
            @import "../dojo/dojo-release-1.0.0/dijit/themes/tundra/tundra.css";
            @import "../dojo/dojo-release-1.0.0/dojo/resources/dojo.css";
            @import "../dojo/dojo-release-1.0.0/dojox/grid/_grid/tundraGrid.css";
            @import "../dojo/dojo-release-1.0.0/dojox/grid/_grid/Grid.css";
            @import "../js/dijitTests.css";
            @import "../js/wlProject.css";
			
      </style>
      <script type="text/javascript" src="../dojo/dojo-release-1.0.0/dojo/dojo.js"  
                djConfig="parseOnLoad: true, isDebug: true,locale: 'zh-cn', extraLocale: ['zh-TW', 'fr']"></script>
      <script>
    
            dojo.require("dojo.data.ItemFileWriteStore");
            dojo.require("dojo.parser");
            dojo.require("dijit.form.Button");
            dojo.require("dijit.Menu");
            dojo.require("dojox.grid.Grid");
            dojo.require("dojox.validate._base");
            dojo.require("dojox.grid._data.model");
            dojo.require("dijit.form.ValidationTextBox");
            dojo.require("dijit.form.TextBox");
            dojo.require("dijit.form.FilteringSelect");
            dojo.require("dijit.form.ComboBox");
            dojo.require("dijit.form.Textarea");
            dojo.require("dojox.grid._data.dijitEditors");
            dojo.require("dojox.layout.FloatingPane");
            dojo.registerModulePath("mydojo", "../../../js/mydojo");
            dojo.require("mydojo.FilteringSelect");
            dojo.require("mydojo.ValidationTextBox");
            dojo.require("mydojo.NumberTextBox");
     </script>
		        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 <script type="text/javascript" src="../js/OrderRowd.js"></script>
	 		<script type="text/javascript" src="../js/Orderd.js"></script>
	 		<script type="text/javascript" src="../js/Prod.js"></script>
	 	<script type="text/javascript" >
	  var url = getUrl()+ "services/OrderRowdManageService";
	  var deletedata =  new Array();
	  var querydata =  new Array();
	  var pagenumber=1;
	  var pagesize=10;
	  var totalCount=0;
	  var queryvo=new OrderRowdVOJs();
	  var oddstyle='';
	  var model = new dojox.grid.data.Table(null, querydata);
	  var urle = getUrl()+ "services/BasicManageService";        
											
//have set function's manageableAssociationEnds
	var porder = new SOAPClientParameters();
	var itemsorder = new Array();  
		porder.add('OrderdVO',new  OrderdVOJs()) ;
		porder.add('pageNumber',0) ;
		porder.add('pageSize',0) ;
	    porder.add('orderBy','0') ;
	SOAPClient.invoke(getUrl()+ "services/"+"OrderdManageService","getOrderd", porder, false,  function GetEnu_callBack(ul, soapResponse){      
				for(var i = 0; i < ul.length-1; i++){		
				  var ulo=ul[i];
				  itemsorder.push({name: ulo["ns:OrderdName"], value:ulo["ns:id"]});
				}                
	});       
	var orderStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemsorder }});

	function orderSet(id,value){
        	/*var itemselect=orderStore._getItemByIdentity(value);
        	if(itemselect!='undefined'&& itemselect!=null){
        	}*/
        }
	var pproduct = new SOAPClientParameters();
	var itemsproduct = new Array();  
		pproduct.add('ProdVO',new  ProdVOJs()) ;
		pproduct.add('pageNumber',0) ;
		pproduct.add('pageSize',0) ;
	    pproduct.add('orderBy','0') ;
	SOAPClient.invoke(getUrl()+ "services/"+"ProdManageService","getProd", pproduct, false,  function GetEnu_callBack(ul, soapResponse){      
				for(var i = 0; i < ul.length-1; i++){		
				  var ulo=ul[i];
				  itemsproduct.push({name: ulo["ns:ProdName"], value:ulo["ns:id"]});
				}                
	});       
	var productStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemsproduct }});

	function productSet(id,value){
        	/*var itemselect=productStore._getItemByIdentity(value);
        	if(itemselect!='undefined'&& itemselect!=null){
        	}*/
        }

 
//ÏÈÅÐ¶Ï±íµÄ×Ö¶ÎÊýÊÇ·ñ´óÓÚ12£¬Èç¹û´óÓÚ12£¬ÔòÉú³Éµ¥ÐÐlayoutºÍÕÛµþlayoutÁ½¸östructure
//enumeration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
																																									
var layoutSingleRow=[{
          
 //¸ù¾ÝfieldµÄÖµ£¬ÒÀ¾ÝÄ¬ÈÏµÄË³Ðò£¬´ÓjsÖÐµÄtoArray×ª»»·½·¨·µ»ØµÄquerydateÖÐÈ¡Êý¾Ý
	   
				 cells: [ [
							//{name: 'Ñ¡Ôñ', width: 3, get:getChoise},
						   { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
						   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
            {name: i18nStr.productNum,field:2, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
		             ,  {name: i18nStr.unitNum,field:3, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
		             ,  {name: i18nStr.goodsSuttle,field:4, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
		             ,  {name: i18nStr.goodsWeight,field:5, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
		             ,  {name: i18nStr.goodsVolume,field:6, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
		        					,   {name: i18nStr.label, field: 7,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					                 ,  {name: i18nStr.carriage,field:8, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
		        					,   {name: i18nStr.especial, field: 9,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					            					,   {name: i18nStr.goodsState, field: 10,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					            				    ,   {name: i18nStr.remark, field: 11,width: 10, editor: dojox.grid.editors.Editor,required:false, editorToolbar: true  }
					      
//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
					 ,   {name: i18nStr.order,field: 12,get:function(inRowIndex){ var str='';var strid;if(querydata[inRowIndex]!=undefined && querydata[inRowIndex][12]!=undefined){str=querydata[inRowIndex][12][2];strid=querydata[inRowIndex][12][1];} return str+'<button dojoType="dijit.form.Button" onclick="selectOrderd('+strid+','+inRowIndex+',12,0,event);"   iconClass="OrderdIcon">sel</button>';} ,width: 10 }
			//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
					 ,   {name: i18nStr.product,field: 13,get:function(inRowIndex){ var str='';var strid;if(querydata[inRowIndex]!=undefined && querydata[inRowIndex][13]!=undefined){str=querydata[inRowIndex][13][2];strid=querydata[inRowIndex][13][1];} return str+'<button dojoType="dijit.form.Button" onclick="selectProd('+strid+','+inRowIndex+',13,0,event);"   iconClass="ProdIcon">sel</button>';} ,width: 10 }
			                                        ] ]
                           }]; 

  //rowinum=6
var layoutTwoRow=[{
          
 //¸ù¾ÝfieldµÄÖµ£¬ÒÀ¾ÝÄ¬ÈÏµÄË³Ðò£¬´ÓjsÖÐµÄtoArray×ª»»·½·¨·µ»ØµÄquerydateÖÐÈ¡Êý¾Ý
	   
				 cells: [
                      [
						{ name: 'choise', width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },
						{ name: i18nStr.detail, width: 3, get: getCheckOrderRowd, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
										  					  {name: i18nStr.productNum,field:2, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
								  			//--------------  if (3 == 5)
														  					 ,  {name: i18nStr.unitNum,field:3, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
								  			//--------------  if (4 == 5)
														  					 ,  {name: i18nStr.goodsSuttle,field:4, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
								  			//--------------  if (5 == 5)
								//
												  							 ,  {name: i18nStr.goodsWeight,field:5, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
												  								]
												                     //----------------(inum:6)  (rowinum: 5)
									                     //----------------(inum:6)  (rowinum: 5)
									                     //----------------(inum:6)  (rowinum: 5)
									                     //----------------(inum:6)  (rowinum: 5)
									                     //----------------(inum:6)  (rowinum: 5)
									                     //----------------(inum:6)  (rowinum: 5)
									                     //----------------(inum:6)  (rowinum: 5)
								
	//¶ÔÓÚ
		  //(6 > 5)
						//¶ÔÓÚ
		  //(6 > 5)
							,[
	 //  22222222222inum= 2   inum2=6
																																									  					  {name: i18nStr.goodsVolume,field:6, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
								  														  																		,   {name: i18nStr.label, field: 7,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																					  														  					 ,  {name: i18nStr.carriage,field:8, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
								  														  																		,   {name: i18nStr.especial, field: 9,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																					  														  																		,   {name: i18nStr.goodsState, field: 10,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																					  														  																		,   {name: i18nStr.remark, field: 11,width: 10, editor: dojox.grid.editors.Editor,required:false, editorToolbar: true  }
																					  														
	//¶ÔÓÚ
									 ,   {name: i18nStr.order,field: 12,get:function(inRowIndex){ var str='';var strid;if(querydataOrderRowd[inRowIndex]!=undefined && querydataOrderRowd[inRowIndex][12]!=undefined && querydataOrderRowd[inRowIndex][12][1]!=undefined){str=querydataOrderRowd[inRowIndex][12][2];strid=querydataOrderRowd[inRowIndex][12][1];} return str+'<button dojoType="dijit.form.Button" onclick="selectOrderd('+strid+','+inRowIndex+',12,0,event);"   iconClass="OrderdIcon">sel</button>';} ,width: 10 }
										//¶ÔÓÚ
									 ,   {name: i18nStr.product,field: 13,get:function(inRowIndex){ var str='';var strid;if(querydataOrderRowd[inRowIndex]!=undefined && querydataOrderRowd[inRowIndex][13]!=undefined && querydataOrderRowd[inRowIndex][13][1]!=undefined){str=querydataOrderRowd[inRowIndex][13][2];strid=querydataOrderRowd[inRowIndex][13][1];} return str+'<button dojoType="dijit.form.Button" onclick="selectProd('+strid+','+inRowIndex+',13,0,event);"   iconClass="ProdIcon">sel</button>';} ,width: 10 }
										 	
		]]
                           }]; 						   
						   
						   
	function call_funUpd() {
       //var s = grid.selection.getSelected();
       //var  d=new DateTimeQuery();
       //var n=new NumberQuery();
       var sall=grid.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
         var passAll=0;
         var thisCell=sall[i];
         var padd = new SOAPClientParameters2();
         var vobject=new OrderRowdVOJs();
         vobject.id=thisCell[1];
             if(dojox.validate.isInRange(thisCell[2],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[2];vobject.productNum=n;
             }else{grid.getCell(grid.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[3],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[3];vobject.unitNum=n;
             }else{grid.getCell(grid.model.fieldArray[3]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[4],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[4];vobject.goodsSuttle=n;
             }else{grid.getCell(grid.model.fieldArray[4]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[5],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[5];vobject.goodsWeight=n;
             }else{grid.getCell(grid.model.fieldArray[5]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[6],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[6];vobject.goodsVolume=n;
             }else{grid.getCell(grid.model.fieldArray[6]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

               vobject.label=thisCell[7];
 
             if(dojox.validate.isInRange(thisCell[8],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[8];vobject.carriage=n;
             }else{grid.getCell(grid.model.fieldArray[8]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

               vobject.especial=thisCell[9];
 
               vobject.goodsState=thisCell[10];
 
               vobject.remark=thisCell[11];
 

				var manageable=new OrderdVOJs();
			 if(querydata[i][12]!=''&&querydata[i][12]!=undefined){
             manageable.id=querydata[i][12][1];
             vobject.order=manageable;
			 }else{
			 grid.getCell(grid.model.fieldArray[12]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
							var manageable=new ProdVOJs();
			 if(querydata[i][13]!=''&&querydata[i][13]!=undefined){
             manageable.id=querydata[i][13][1];
             vobject.product=manageable;
			 }else{
			 grid.getCell(grid.model.fieldArray[13]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
			


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('OrderRowdVO',vobject);
                SOAPClient.invoke(url, "createOrderRowd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                grid.model.setDatum(ul,i,1);
                });
	         }else{//modify row
                padd.add('OrderRowdVO',vobject);
                SOAPClient.invoke(url, "updateOrderRowd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
        } }}//for
//submit delete
          for(var i=0;i<deletedata.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',deletedata[i]);
               SOAPClient.invoke(url, "deleteOrderRowd", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
	           });
          }
          deletedata=new Array();
          //dojo.byId("rowCount").innerHTML = 'saved'; 
//submit delete end          
 } 
 
 function removeSelectedRowsGrid(){
       //var s = grid.selection.getSelected();
       var s= new Array();
       var sall=grid.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
          s.push(i);
          var thisCell=sall[i];
          if(thisCell[1]!=0){//the row which will be deleted
            deletedata.splice(deletedata.length,0,thisCell[1]);
       }}}
       grid.model.remove(s);//grid.removeSelectedRows();
 }
        
addRow = function(){
          	grid.addRow([false,0,"","",""],grid.model.getRowCount());
	        } 	 
	 
function querybutton(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvo.id=0 ;
              queryvo=new OrderRowdVOJs();
              n=queryNumber_fun("productNum");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvo.productNum=n;}  
              n=queryNumber_fun("unitNum");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvo.unitNum=n;}  
              n=queryNumber_fun("goodsSuttle");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvo.goodsSuttle=n;}  
              n=queryNumber_fun("goodsWeight");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvo.goodsWeight=n;}  
              n=queryNumber_fun("goodsVolume");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvo.goodsVolume=n;}  
	          if(querylabel.getDisplayedValue()!="")queryvo.label=querylabel.getDisplayedValue();//
              n=queryNumber_fun("carriage");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvo.carriage=n;}  
	          if(queryespecial.getDisplayedValue()!="")queryvo.especial=queryespecial.getDisplayedValue();//
	          if(querygoodsState.getDisplayedValue()!="")queryvo.goodsState=querygoodsState.getDisplayedValue();//
	          if(queryremark.getDisplayedValue()!="")queryvo.remark=queryremark.getDisplayedValue();//
			
	if(queryorder.getDisplayedValue()!=""){
				var orderQuery= new OrderdVOJs();
				//orderQuery.OrderRowdName=queryorder.getDisplayedValue();
				orderQuery.id=queryorder.getValue();
				queryvo.order=orderQuery;
			  }
	if(queryproduct.getDisplayedValue()!=""){
				var productQuery= new ProdVOJs();
				//productQuery.OrderRowdName=queryproduct.getDisplayedValue();
				productQuery.id=queryproduct.getValue();
				queryvo.product=productQuery;
			  }

			if(validstate==0){
              pagenumber=1;
              getVO(queryvo,pagenumber,pagesize,'0'); 
              //if(totalpage>1){dijit.byId("but7").setDisabled(false);}else{dijit.byId("but7").setDisabled(true);} 
             }      
       }
	 
querydis = function(){
               querydisplay("queryDiv");
            }
 
 


function getVO(queryvo,pagenumber,pagesize,orderBy){
	
      var pu = new SOAPClientParameters2();
      pu.add('OrderRowdVO',queryvo) ;
      pu.add('pageNumber',pagenumber) ;
	    pu.add('pageSize',pagesize) ;
	    pu.add('orderBy',orderBy) ;
      SOAPClient.invoke(url,"getOrderRowd", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydata=new Array();
		   querydata=OrderRowdVOtoArray_fun(ul,true);
           totalCount=ul[ul.length-1]["ns:id"]; 
           //totalpage=Math.ceil(new Number(totalCount)/pagesize);
           //document.getElementById("rowCount").innerHTML=" "+pagenumber+" / "+totalpage+" / "+totalCount+" " ;
      }); 
      querydata.splice(querydata.length-1,1);
      model.setData(querydata);
      //dijit.byId("grid").updateRowCount(querydata.length); 
	   var totalpage=Math.ceil(new Number(totalCount)/pagesize);
	  
	if(totalpage>1){
		if(pagenumber==1){
			dijit.byId("but6").setDisabled(true);
			dijit.byId("but7").setDisabled(false);
		}else if(pagenumber==totalpage){
			dijit.byId("but6").setDisabled(false);
			dijit.byId("but7").setDisabled(true);
		}else{
			dijit.byId("but6").setDisabled(false);
			dijit.byId("but7").setDisabled(false);
		}
	}else{
		dijit.byId("but6").setDisabled(true);
		dijit.byId("but7").setDisabled(true);
	
	}
	if(pagesize==0){
		totalpage=1;
		dijit.byId("but6").setDisabled(true);
		dijit.byId("but7").setDisabled(true);
	}
	if(totalpage==1)pagenumber=1;
	
	 document.getElementById("rowCount").innerHTML=i18nStr.di+" "+pagenumber+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCount+" "+i18nStr.rowSize; 	
	  
	  
 }
 
function init(){
  getVO(queryvo,pagenumber,pagesize,'0');
  //if(totalpage>1)dijit.byId("but7").setDisabled(false);
  
 	dojo.connect(dijit.byId("grid"), "dodblclick", function(e){
	   if(document.getElementById('queryDiv').style.display=='')document.getElementById('queryDiv').style.display='none';
	   if(document.getElementById('addDiv').style.display=='none')document.getElementById('addDiv').style.display='';
		 document.getElementById('erowIndex').value=e.rowIndex;
		 document.getElementById('OrderRowdId').value=querydata[e.rowIndex][1];
		 	 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addproductNum").setValue(querydata[e.rowIndex][2]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addunitNum").setValue(querydata[e.rowIndex][3]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addgoodsSuttle").setValue(querydata[e.rowIndex][4]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addgoodsWeight").setValue(querydata[e.rowIndex][5]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addgoodsVolume").setValue(querydata[e.rowIndex][6]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addlabel").setValue(querydata[e.rowIndex][7]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addcarriage").setValue(querydata[e.rowIndex][8]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addespecial").setValue(querydata[e.rowIndex][9]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addgoodsState").setValue(querydata[e.rowIndex][10]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addremark").setValue(querydata[e.rowIndex][11]);
						 			 
					dijit.byId("addorder").setValue(querydata[e.rowIndex][12][1]);
			//dijit.byId("addorder").setDisplayedValue('');
					dijit.byId("addproduct").setValue(querydata[e.rowIndex][12][1]);
			//dijit.byId("addproduct").setDisplayedValue('');
			});     
}

 dojo.addOnLoad(init);   

	function selectOrderdFun(rep){
		querydata[selectOrderdInRow][noOrderd]=rep;
		grid.updateRow(selectOrderdInRow);		
	}
	function selectProdFun(rep){
		querydata[selectProdInRow][noProd]=rep;
		grid.updateRow(selectProdInRow);		
	}
//addDiv---------------begin-------------------------------------
var addDivAdd = function(){
	 if(document.getElementById('queryDiv').style.display=='')document.getElementById('queryDiv').style.display='none';
	 if(document.getElementById('addDiv').style.display=='none')document.getElementById('addDiv').style.display='';
	 //Çå¿Õadd½çÃæ
										//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addproductNum").setValue('');
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addunitNum").setValue('');
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addgoodsSuttle").setValue('');
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addgoodsWeight").setValue('');
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addgoodsVolume").setValue('');
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addlabel").setValue('');
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addcarriage").setValue('');
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addespecial").setValue('');
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addgoodsState").setValue('');
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addremark").setValue('');
										
			dijit.byId("addorder").setValue('');
	    dijit.byId("addorder").setDisplayedValue('');
			dijit.byId("addproduct").setValue('');
	    dijit.byId("addproduct").setDisplayedValue('');
		
	document.getElementById('OrderRowdId').value='0';
	//document.getElementById('referTimeAdd1').value=dojo.date.locale.format(new Date(),{ datePattern: "yyyy-MM-dd", selector: "date"});
	//document.getElementById('referTimeAdd2').value=dojo.date.locale.format(new Date(),{ timePattern: "HH:mm", selector: "time"});
} 
function addDivSave(){
	var padd = new SOAPClientParameters2();
	var vobject=new OrderRowdVOJs();
    vobject.id=document.getElementById('OrderRowdId').value;
	var passAll=0;
										if(dijit.byId("addproductNum").isValid(true)){
					var nproductNum=new NumberQuery();
					nproductNum.upNumber=dijit.byId("addproductNum").getValue();
					vobject.productNum=nproductNum;
				}else{
					passAll=1;
				}
															if(dijit.byId("addunitNum").isValid(true)){
					var nunitNum=new NumberQuery();
					nunitNum.upNumber=dijit.byId("addunitNum").getValue();
					vobject.unitNum=nunitNum;
				}else{
					passAll=1;
				}
															if(dijit.byId("addgoodsSuttle").isValid(true)){
					var ngoodsSuttle=new NumberQuery();
					ngoodsSuttle.upNumber=dijit.byId("addgoodsSuttle").getValue();
					vobject.goodsSuttle=ngoodsSuttle;
				}else{
					passAll=1;
				}
															if(dijit.byId("addgoodsWeight").isValid(true)){
					var ngoodsWeight=new NumberQuery();
					ngoodsWeight.upNumber=dijit.byId("addgoodsWeight").getValue();
					vobject.goodsWeight=ngoodsWeight;
				}else{
					passAll=1;
				}
															if(dijit.byId("addgoodsVolume").isValid(true)){
					var ngoodsVolume=new NumberQuery();
					ngoodsVolume.upNumber=dijit.byId("addgoodsVolume").getValue();
					vobject.goodsVolume=ngoodsVolume;
				}else{
					passAll=1;
				}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addlabel").isValid(true)){
					vobject.label=dijit.byId("addlabel").getValue();
				}else{
					passAll=1;
				}
															if(dijit.byId("addcarriage").isValid(true)){
					var ncarriage=new NumberQuery();
					ncarriage.upNumber=dijit.byId("addcarriage").getValue();
					vobject.carriage=ncarriage;
				}else{
					passAll=1;
				}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addespecial").isValid(true)){
					vobject.especial=dijit.byId("addespecial").getValue();
				}else{
					passAll=1;
				}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addgoodsState").isValid(true)){
					vobject.goodsState=dijit.byId("addgoodsState").getValue();
				}else{
					passAll=1;
				}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addremark").isValid(true)){
					vobject.remark=dijit.byId("addremark").getValue();
				}else{
					passAll=1;
				}
										
	if(dijit.byId("addorder").isValid(true)){
		//vobject.order=dijit.byId("addorder").getValue();
		var manageable=new OrderdVOJs();
		manageable.id=dijit.byId("addorder").getValue();
		vobject.order=manageable;
	}else{
		passAll=1;
	}
	if(dijit.byId("addproduct").isValid(true)){
		//vobject.product=dijit.byId("addproduct").getValue();
		var manageable=new ProdVOJs();
		manageable.id=dijit.byId("addproduct").getValue();
		vobject.product=manageable;
	}else{
		passAll=1;
	}
	
if(passAll==0){
		//var addrow='';
		var addrow=[];
														//addrow=addrow+","+vobject.productNum.upNumber;
					addrow.push(vobject.productNum.upNumber);
																					//addrow=addrow+","+vobject.unitNum.upNumber;
					addrow.push(vobject.unitNum.upNumber);
																					//addrow=addrow+","+vobject.goodsSuttle.upNumber;
					addrow.push(vobject.goodsSuttle.upNumber);
																					//addrow=addrow+","+vobject.goodsWeight.upNumber;
					addrow.push(vobject.goodsWeight.upNumber);
																					//addrow=addrow+","+vobject.goodsVolume.upNumber;
					addrow.push(vobject.goodsVolume.upNumber);
																					//addrow=addrow+","+vobject.label;
					addrow.push(vobject.label);
																					//addrow=addrow+","+vobject.carriage.upNumber;
					addrow.push(vobject.carriage.upNumber);
																					//addrow=addrow+","+vobject.especial;
					addrow.push(vobject.especial);
																					//addrow=addrow+","+vobject.goodsState;
					addrow.push(vobject.goodsState);
																					//addrow=addrow+","+vobject.remark;
					addrow.push(vobject.remark);
																			//addrow=addrow+","+OrderdVOtoArray_fun(vobject.order,true);//addrow.push(OrderdVOtoArray_fun(vobject.order,true));
			addrow.push([false,addorder.getValue(),addorder.getDisplayedValue()]);
					//addrow=addrow+","+ProdVOtoArray_fun(vobject.product,true);//addrow.push(ProdVOtoArray_fun(vobject.product,true));
			addrow.push([false,addproduct.getValue(),addproduct.getDisplayedValue()]);
			 if(vobject.id==0){//create new row
		padd.add('OrderRowdVO',vobject);
		SOAPClient.invoke(url, "createOrderRowd", padd, false,  function GetEnu_callBack(ul, soapResponse){
		//addrow='false,ul'+addrow;
		addrow.splice(0,0,false,ul);
				console.log("addrow.lenght:"+addrow.length);
				console.log("addrow:"+addrow);
		grid.addRow(addrow ,grid.model.getRowCount());//grid.addRow([addrow]);
		});
	 }else{//modify row
		padd.add('OrderRowdVO',vobject);
		SOAPClient.invoke(url, "updateOrderRowd", padd, false,  function GetEnu_callBack(ul, soapResponse){
		});
		//addrow='false,vobject.id'+addrow;
		addrow.splice(0,0,false,vobject.id);
		querydata[document.getElementById('erowIndex').value]=[addrow];
		//grid.updateRow(document.getElementById('erowIndex').value);
	 }
}   }

 function addDivRemove(){
     if(window.confirm(i18nStr.deleteConfirm)){
        //var s = dijit.byId("grid").selection.getSelected();
		var s = dijit.byId("grid").rowCount;
        //for(var i=0;i<s.length;i++){ 
              //var ii=s[i];
			  var ii=s.length;
              var si=document.getElementById('erowIndex').value;
              var pdel = new SOAPClientParameters();      
               //pdel.add('id',querydata[ii][1]);
			   pdel.add('id',si);
               SOAPClient.invoke(url, "deleteOrderRowd", pdel, false,  function GetEnu_callBack(ul, soapResponse){
               if(si>ii){
					if(si-1>=0){document.getElementById('erowIndex').value=si-1;}//else{document.getElementById('erowIndex').value='';}//????????????????????????????????//
               }
			   totalCount--;
               var totalpage=Math.ceil(new Number(totalCount)/pagesize);
               document.getElementById("rowCount").innerHTML="µÚ"+pagenumber+"Ò³/¹²"+totalpage+"Ò³/×Ü¼Æ"+totalCount+"Ìõ¼ÇÂ¼" ; 
               if(si=ii){if(document.getElementById('addDiv').style.display=='')document.getElementById('addDiv').style.display='none';}
	        });   
          //}             
           dijit.byId("grid").removeSelectedRows();
      }
 }    
//addDiv---------------end---------------------------------------	 
//totleinum=13
 //rowinum=4
 //addHeight=130
</script>
</head>	 
<body class="tundra">
		<div id="addDiv" style="margin-right: 0px;  height: 130px; display:none;" >
              <table align="center" width="100%" id="0" class="editorTable"  >
                <tr >
				<td align="center" style="{width:11%}" i18n="addNote" ></td>
                <td style="{width:22%}" ><input id="OrderRowdId" style="{display:none}"  type="text"  /></td>
                <td style="{width:11%}"><input id="erowIndex" style="{display:none}"  type="text"  /></td>
                <td style="{width:23%}" ></td>
                <td style="{width:11%}"></td>
                <td style="{width:22%}"></td>
				</tr> 
                <tr ><td align="center" style="{width:11%}"></td>
                <td style="{width:22%}" ></td>
                <td style="{width:11%}"></td>
				<td style="{width:23%}" ></td>
                <td style="{width:11%}"></td>
                <td style="{width:22%}"></td></tr>  
                <tr>
				<td align="right" i18n="productNum" >productNum:</td>
			<td align="left"  >
							<input type="text" class="editerNumber"   jsId="addproductNum"  id="addproductNum"  dojoType="mydojo.NumberTextBox" constraints="{min:0,max:9999999,places:4 }" />
			</td>
					<td align="right" i18n="unitNum" >unitNum:</td>
			<td align="left"  >
							<input type="text" class="editerNumber"   jsId="addunitNum"  id="addunitNum"  dojoType="mydojo.NumberTextBox" constraints="{min:0,max:9999999,places:4 }" />
			</td>
					<td align="right" i18n="goodsSuttle" >goodsSuttle:</td>
			<td align="left"  >
							<input type="text" class="editerNumber"   jsId="addgoodsSuttle"  id="addgoodsSuttle"  dojoType="mydojo.NumberTextBox" constraints="{min:0,max:9999999,places:4 }" />
			</td>
		</tr>	
                <tr>
				<td align="right" i18n="goodsWeight" >goodsWeight:</td>
			<td align="left"  >
							<input type="text" class="editerNumber"   jsId="addgoodsWeight"  id="addgoodsWeight"  dojoType="mydojo.NumberTextBox" constraints="{min:0,max:9999999,places:4 }" />
			</td>
					<td align="right" i18n="goodsVolume" >goodsVolume:</td>
			<td align="left"  >
							<input type="text" class="editerNumber"   jsId="addgoodsVolume"  id="addgoodsVolume"  dojoType="mydojo.NumberTextBox" constraints="{min:0,max:9999999,places:4 }" />
			</td>
					<td align="right" i18n="label" >label:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addlabel"  jsId="addlabel"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
		</tr>	
                <tr>
				<td align="right" i18n="carriage" >carriage:</td>
			<td align="left"  >
							<input type="text" class="editerNumber"   jsId="addcarriage"  id="addcarriage"  dojoType="mydojo.NumberTextBox" constraints="{min:0,max:9999999,places:4 }" />
			</td>
					<td align="right" i18n="especial" >especial:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addespecial"  jsId="addespecial"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
					<td align="right" i18n="goodsState" >goodsState:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addgoodsState"  jsId="addgoodsState"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
		</tr>	
                <tr>
				<td align="right" i18n="remark" >remark:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addremark"  jsId="addremark"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
	
//if (2==1)     
//    <--/tr-->
//end

//set ($inume =1) 
								<td align="right"  i18n="order"  ></td>
					<td align="left" ><!--colspan="3" --><input  id="addorder"  jsId="addorder" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="orderStore" onchange="orderSet(0,arguments[0]);" /></td>  
														<td align="right"  i18n="product"  ></td>
					<td align="left" ><input  id="addproduct"  jsId="addproduct" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="productStore" onchange="productSet(0,arguments[0]);" /></td>
					</tr>
						</table></div>
<div id="queryDiv" style="margin-right: 0px;  height: 160px; display:none;" >
  <table align="center" width=100% class="queryTable"  >
	<tr >
	<td align="center" style="{width:11%}" i18n="queryNote" >Please input criterial:</td>
	<td style="{width:22%}" ></td>
	<td style="{width:11%}"></td>
	<td style="{width:6%}" ></td>
	<td style="{width:11%}" ></td>
	<td style="{width:6%}" ></td>
	<td style="{width:11%}"></td>
	<td style="{width:22%}"></td>
	</tr> 
	<tr ><td align="center" style="{width:11%}"></td>
	<td style="{width:22%}" ></td>
	<td style="{width:11%}"></td>
	<td style="{width:6%}" ></td>
	<td style="{width:11%}" ></td>
	<td style="{width:6%}" ></td>
	<td style="{width:11%}"></td>
	<td style="{width:22%}"></td></tr>  
                <tr>
				<td align="right" i18n="productNum" >productNum:</td>
			<td align="left"  >
							<span id="queryproductNumImg0"  ><input type="text" class="editerNumber"   jsId="queryproductNum"  id="queryproductNum"  dojoType="mydojo.NumberTextBox"  /></span>
							<span id="queryproductNumImg1" style="{display:none}" ><input type="text"  class="editerNumberSmall" jsId="queryproductNum1"  id="queryproductNum1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryproductNumImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryproductNumImgdown" >></span>
							<span id="queryproductNumImg2div" style="{display:none}"> <input type="text"  class="editerNumberSmall"  jsId="queryproductNum2"  id="queryproductNum2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="queryproductNumImg" style="vertical-align:middle;margin-top:0px;">
							
						</td>
														<td align="right" i18n="unitNum" >unitNum:</td>
							<td align="left" colspan="3" >
								<span id="queryunitNumImg0"  ><input type="text" class="editerNumber" jsId="queryunitNum"  id="queryunitNum"  dojoType="mydojo.NumberTextBox"  /></span>
								<span id="queryunitNumImg1"  style="{display:none}" ><input type="text" class="editerNumberSmall" jsId="queryunitNum1"  id="queryunitNum1"  dojoType="mydojo.NumberTextBox"  /></span>
								<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryunitNumImgup">></span>
								<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryunitNumImgdown" >></span>
								<span id="queryunitNumImg2div" style="{display:none}"> <input type="text" class="editerNumberSmall"  jsId="queryunitNum2"  id="queryunitNum2"  dojoType="mydojo.NumberTextBox"  /></span>
								<img src="../image/start.gif" onclick="queryType(this);" id="queryunitNumImg" style="vertical-align:middle;margin-top:0px;">
							</td>  
																		<td align="right"  i18n="goodsSuttle" >goodsSuttle:</td>
						<td align="left"  >
							<span id="querygoodsSuttleImg0"  ><input type="text" class="editerNumber" jsId="querygoodsSuttle"  id="querygoodsSuttle"  dojoType="mydojo.NumberTextBox"  /></span>
							<span id="querygoodsSuttleImg1"  style="{display:none}" ><input type="text" class="editerNumberSmall" jsId="querygoodsSuttle1"  id="querygoodsSuttle1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="querygoodsSuttleImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="querygoodsSuttleImgdown" >></span>
							<span id="querygoodsSuttleImg2div" style="{display:none}"> <input type="text" class="editerNumberSmall"  jsId="querygoodsSuttle2"  id="querygoodsSuttle2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="querygoodsSuttleImg" style="vertical-align:middle;margin-top:0px;">
							
						</td>  
								  </tr>
			                <tr>
				<td align="right" i18n="goodsWeight" >goodsWeight:</td>
			<td align="left"  >
							<span id="querygoodsWeightImg0"  ><input type="text" class="editerNumber"   jsId="querygoodsWeight"  id="querygoodsWeight"  dojoType="mydojo.NumberTextBox"  /></span>
							<span id="querygoodsWeightImg1" style="{display:none}" ><input type="text"  class="editerNumberSmall" jsId="querygoodsWeight1"  id="querygoodsWeight1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="querygoodsWeightImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="querygoodsWeightImgdown" >></span>
							<span id="querygoodsWeightImg2div" style="{display:none}"> <input type="text"  class="editerNumberSmall"  jsId="querygoodsWeight2"  id="querygoodsWeight2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="querygoodsWeightImg" style="vertical-align:middle;margin-top:0px;">
							
						</td>
														<td align="right" i18n="goodsVolume" >goodsVolume:</td>
							<td align="left" colspan="3" >
								<span id="querygoodsVolumeImg0"  ><input type="text" class="editerNumber" jsId="querygoodsVolume"  id="querygoodsVolume"  dojoType="mydojo.NumberTextBox"  /></span>
								<span id="querygoodsVolumeImg1"  style="{display:none}" ><input type="text" class="editerNumberSmall" jsId="querygoodsVolume1"  id="querygoodsVolume1"  dojoType="mydojo.NumberTextBox"  /></span>
								<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="querygoodsVolumeImgup">></span>
								<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="querygoodsVolumeImgdown" >></span>
								<span id="querygoodsVolumeImg2div" style="{display:none}"> <input type="text" class="editerNumberSmall"  jsId="querygoodsVolume2"  id="querygoodsVolume2"  dojoType="mydojo.NumberTextBox"  /></span>
								<img src="../image/start.gif" onclick="queryType(this);" id="querygoodsVolumeImg" style="vertical-align:middle;margin-top:0px;">
							</td>  
																				<td align="right"  i18n="label" >label:</td>
						<td align="left"  >
													<input type="text" class="editerInput"  id="querylabel"  jsId="querylabel"   dojoType="dijit.form.TextBox"  />
												</td>  
										  </tr>
			                <tr>
				<td align="right" i18n="carriage" >carriage:</td>
			<td align="left"  >
							<span id="querycarriageImg0"  ><input type="text" class="editerNumber"   jsId="querycarriage"  id="querycarriage"  dojoType="mydojo.NumberTextBox"  /></span>
							<span id="querycarriageImg1" style="{display:none}" ><input type="text"  class="editerNumberSmall" jsId="querycarriage1"  id="querycarriage1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="querycarriageImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="querycarriageImgdown" >></span>
							<span id="querycarriageImg2div" style="{display:none}"> <input type="text"  class="editerNumberSmall"  jsId="querycarriage2"  id="querycarriage2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="querycarriageImg" style="vertical-align:middle;margin-top:0px;">
							
						</td>
												<td align="right"  i18n="especial" >especial:</td>
						<td align="left" colspan="3" >
														<input type="text" class="editerInput"  id="queryespecial"  jsId="queryespecial"   dojoType="dijit.form.TextBox"  />
													</td>  
															<td align="right"  i18n="goodsState" >goodsState:</td>
						<td align="left"  >
													<input type="text" class="editerInput"  id="querygoodsState"  jsId="querygoodsState"   dojoType="dijit.form.TextBox"  />
												</td>  
										  </tr>
			                <tr>
							<td align="right" i18n="remark" >remark:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="queryremark"  jsId="queryremark"   dojoType="dijit.form.TextBox"  />
													</td>
				

//if (!="over" && 2!=1)     
    <!--/tr-->
//end 
//set ($inume =1) 
								<td align="right"  i18n="order"  ></td>
					<td align="left" ><!--colspan="3" --><input  id="queryorder"  jsId="queryorder" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="orderStore"  /></td>  
														<td align="right"  i18n="product"  ></td>
					<td align="left" ><input  id="queryproduct"  jsId="queryproduct" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="productStore"  /></td>
					</tr>
						
         <tr align="center"><td></td>
           <td colspan="2"> <button dojoType="dijit.form.Button" onclick="querybutton();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="3"></td><td colspan="2"></td></tr>
         </table>
	     </div>
	       	<div align="right">
				<button dojoType="dijit.form.Button" onclick="addDivAdd();" iconClass="addIcon"  >add</button>
				<button dojoType="dijit.form.Button" onclick="addDivRemove();" iconClass="delIcon"  >remove</button>
				<button dojoType="dijit.form.Button" onclick="addDivSave();" iconClass="saveIcon"  >save</button>
	          	 &nbsp;&nbsp;&nbsp;
	          	     <button dojoType="dijit.form.Button" onclick="addRow();" iconClass="addIcon" i18n="add" >add</button>
					 <!--button dojoType="dijit.form.Button" onclick="addDivAdd();" iconClass="addIcon"  >add</button-->
	                 <button dojoType="dijit.form.Button" onclick="removeSelectedRowsGrid();" iconClass="delIcon" i18n="delete" >delete</button>
	                 <button dojoType="dijit.form.Button" id="but3" jsId="but3" onclick="call_funUpd();" i18n="save" iconClass="saveIcon">save</button>
	          	     <button dojoType="dijit.form.Button" onclick="querydis();" iconClass="queryIcon"  i18n="openQuery" >query</button>
            </div>    
	    <div style="{height:90%;width:100%}"  >
	         <div id="grid"  dojoType="dojox.Grid" autoWidth="false"  jsId="grid"	model="model"  structure="layoutSingleRow" singleClickEdit="true" ></div>
      </div>      
      <div align="right" ><span id="rowCount"></span>
        <button dojoType="dijit.form.myButton" onclick="upPage();"  id="but6" disabled='true' jsId="but6" iconClass="upPageIcon" >pageup</button><!--span dojoType="dijit.Tooltip" connectId="but6">pageup</span-->
        <button dojoType="dijit.form.myButton" onclick="downPage();" id="but7" disabled='true' jsId="but7" iconClass="downPageIcon" >pagedown</button><!--span dojoType="dijit.Tooltip" connectId="but7">pagedown</span-->
        <div id="668" dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
  			  <div dojoType="dijit.Menu">
				  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChange(this.label);"></div>
				  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChange(this.label);"></div>
		      <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChange(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChange(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpage();"></div>
		      </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
        </div>
		    <div id="669" dojoType="dijit.form.myDropDownButton" iconClass="pageStyleIcon"><span>pageStyle</span>
  			   <div dojoType="dijit.Menu">
  				 <div dojoType="dijit.MenuItem"  iconClass="rowIcon"		label="row"	onClick="pageStyle(this.label);"></div>
  				 <div dojoType="dijit.MenuItem"  iconClass="colIcon"		label="col"	onClick="pageStyle(this.label);"></div>
		    </div></div>
     </div> 
</body>
<script type="text/javascript">trans18tag();</script>
</html>		 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
