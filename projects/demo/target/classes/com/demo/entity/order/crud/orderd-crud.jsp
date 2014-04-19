<%@ include file="/taglib-imports.jspf" %>
<tiles:insert definition="main.layout">

    <tiles:put name="title" type="string">
        <bean:message key="orderd.page.title"/>
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

            function setAction(crud) { document.forms['manageOrderdForm'].elements['crud'].value = crud; }

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
                setFields("","","","","","","","","","","","","","","","[]","",form);
            }

            function setFields(customerOrderNo,contractNo,conveyanceEnum,carryTypeEnum,shipperRemark,carrierRemark,levelEnum,customerTypeEnum,referTime,linkMan,tel,bookTime,completeTime,remark,id,orderRow,customer,form)
            {
                form.elements["customerOrderNo"].value = customerOrderNo;
                form.elements["contractNo"].value = contractNo;
                form.elements["conveyanceEnum"].value = conveyanceEnum;
                form.elements["carryTypeEnum"].value = carryTypeEnum;
                form.elements["shipperRemark"].value = shipperRemark;
                form.elements["carrierRemark"].value = carrierRemark;
                form.elements["levelEnum"].value = levelEnum;
                form.elements["customerTypeEnum"].value = customerTypeEnum;
                form.elements["referTimeAsString"].value = referTime;
                form.elements["linkMan"].value = linkMan;
                form.elements["tel"].value = tel;
                form.elements["bookTimeAsString"].value = bookTime;
                form.elements["completeTimeAsString"].value = completeTime;
                form.elements["remark"].value = remark;
                form.elements["id"].value = id;
                setSelect(true,form,"orderRow",orderRow.substring(1,orderRow.length-1).split(", "));
                setSelect(false,form,"customer",customer);
            }
        //-->
        </script>
    </tiles:put>

    <tiles:put name="body" type="string">

        <div>
            <h1><bean:message key="orderd.page.title"/></h1>
        </div>

        <html:form styleId="manageOrderdForm" action="/Orderd/Manage" method="post">
            <input type="hidden" name="crud" value=""/>
            <div id="criteria">
                <c:if test="${!empty manageableForm}">
                    <table>
                        <tr>
                            <td><bean:message key="orderd.customer.order.no"/></td>
                            <td>
                                <html:text name="manageableForm" property="customerOrderNo" styleClass="criteriaField" styleId="customerOrderNo"/>
                            </td>
                        </tr>
                        <tr>
                            <td><bean:message key="orderd.contract.no"/></td>
                            <td>
                                <html:text name="manageableForm" property="contractNo" styleClass="criteriaField" styleId="contractNo"/>
                            </td>
                        </tr>
                        <tr>
                            <td><nobr><bean:message key="orderd.conveyance.enum"/> <div class="important">*</div></nobr></td>
                            <td>
                                <html:text name="manageableForm" property="conveyanceEnum" styleClass="criteriaField" styleId="conveyanceEnum"/>
                            </td>
                        </tr>
                        <tr>
                            <td><bean:message key="orderd.carry.type.enum"/></td>
                            <td>
                                <html:text name="manageableForm" property="carryTypeEnum" styleClass="criteriaField" styleId="carryTypeEnum"/>
                            </td>
                        </tr>
                        <tr>
                            <td><bean:message key="orderd.shipper.remark"/></td>
                            <td>
                                <html:text name="manageableForm" property="shipperRemark" styleClass="criteriaField" styleId="shipperRemark"/>
                            </td>
                        </tr>
                        <tr>
                            <td><bean:message key="orderd.carrier.remark"/></td>
                            <td>
                                <html:text name="manageableForm" property="carrierRemark" styleClass="criteriaField" styleId="carrierRemark"/>
                            </td>
                        </tr>
                        <tr>
                            <td><bean:message key="orderd.level.enum"/></td>
                            <td>
                                <html:text name="manageableForm" property="levelEnum" styleClass="criteriaField" styleId="levelEnum"/>
                            </td>
                        </tr>
                        <tr>
                            <td><bean:message key="orderd.customer.type.enum"/></td>
                            <td>
                                <html:text name="manageableForm" property="customerTypeEnum" styleClass="criteriaField" styleId="customerTypeEnum"/>
                            </td>
                        </tr>
                        <tr>
                            <td><bean:message key="orderd.refer.time"/></td>
                            <td>
                                <html:text name="manageableForm" property="referTimeAsString" styleClass="criteriaField" styleId="referTime"/>
                                <html:img page="/layout/calendar/calendar.gif" styleId="referTime_trigger" styleClass="calendar"/>
                                <script type="text/javascript">
                                //<!--
                                    Calendar.setup({
                                        inputField     :    "referTime",
                                        ifFormat       :    "%m/%d/%Y",
                                        daFormat       :    "%m/%d/%Y",
                                        showsTime      :    false,
                                        button         :    "referTime_trigger",
                                        singleClick    :    true
                                    });
                                //-->
                                </script>
                            </td>
                        </tr>
                        <tr>
                            <td><bean:message key="orderd.link.man"/></td>
                            <td>
                                <html:text name="manageableForm" property="linkMan" styleClass="criteriaField" styleId="linkMan"/>
                            </td>
                        </tr>
                        <tr>
                            <td><bean:message key="orderd.tel"/></td>
                            <td>
                                <html:text name="manageableForm" property="tel" styleClass="criteriaField" styleId="tel"/>
                            </td>
                        </tr>
                        <tr>
                            <td><nobr><bean:message key="orderd.book.time"/> <div class="important">*</div></nobr></td>
                            <td>
                                <html:text name="manageableForm" property="bookTimeAsString" styleClass="criteriaField" styleId="bookTime"/>
                                <html:img page="/layout/calendar/calendar.gif" styleId="bookTime_trigger" styleClass="calendar"/>
                                <script type="text/javascript">
                                //<!--
                                    Calendar.setup({
                                        inputField     :    "bookTime",
                                        ifFormat       :    "%m/%d/%Y",
                                        daFormat       :    "%m/%d/%Y",
                                        showsTime      :    false,
                                        button         :    "bookTime_trigger",
                                        singleClick    :    true
                                    });
                                //-->
                                </script>
                            </td>
                        </tr>
                        <tr>
                            <td><bean:message key="orderd.complete.time"/></td>
                            <td>
                                <html:text name="manageableForm" property="completeTimeAsString" styleClass="criteriaField" styleId="completeTime"/>
                                <html:img page="/layout/calendar/calendar.gif" styleId="completeTime_trigger" styleClass="calendar"/>
                                <script type="text/javascript">
                                //<!--
                                    Calendar.setup({
                                        inputField     :    "completeTime",
                                        ifFormat       :    "%m/%d/%Y",
                                        daFormat       :    "%m/%d/%Y",
                                        showsTime      :    false,
                                        button         :    "completeTime_trigger",
                                        singleClick    :    true
                                    });
                                //-->
                                </script>
                            </td>
                        </tr>
                        <tr>
                            <td><bean:message key="orderd.remark"/></td>
                            <td>
                                <html:text name="manageableForm" property="remark" styleClass="criteriaField" styleId="remark"/>
                            </td>
                        </tr>
                    <html:hidden name="manageableForm" property="id"/>
                        <tr>
                            <td>
                                    <html:link action="/OrderRowd/Manage"><bean:message key="orderd.order.row"/></html:link>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${empty manageableForm.orderRowBackingList}">
                                        <select name="orderRow" disabled="disabled"/>
                                    </c:when>
                                    <c:otherwise>
                                        <select name="orderRow" multiple="multiple">
                                            <c:forEach var="valueLabel" items="${manageableForm.orderRowBackingList}">
                        <option value="${valueLabel[0]}"<collections:contains item="${valueLabel}" array="${manageableForm.orderRow}"> selected="selected"</collections:contains>>${valueLabel[1]}</option>
                                            </c:forEach>
                                        </select>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                    <nobr><html:link action="/Customer/Manage"><bean:message key="orderd.customer"/></html:link> <div class="important">*</div></nobr>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${empty manageableForm.customerBackingList}">
                                        <select name="customer" disabled="disabled"/>
                                    </c:when>
                                    <c:otherwise>
                                        <select name="customer">
                                            <option value=""><bean:message key="select.option.blank"/></option>
                                            <c:forEach var="valueLabel" items="${manageableForm.customerBackingList}">
                                                <c:choose>
                                                    <c:when test="${valueLabel[0] eq manageableForm.customer}">
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
        <select onchange="document.location=this.options[this.selectedIndex].value+'?ref_Orderd='+this.form.elements['id'].value;">
            <option value="<html:rewrite page="/Contact/Manage.do"/>"><bean:message key="contact"/></option>
            <option value="<html:rewrite page="/Customer/Manage.do"/>"><bean:message key="customer"/></option>
            <option value="<html:rewrite page="/Enumeration/Manage.do"/>"><bean:message key="enumeration"/></option>
            <option value="<html:rewrite page="/OrderRowTask/Manage.do"/>"><bean:message key="order.row.task"/></option>
            <option value="<html:rewrite page="/OrderRowd/Manage.do"/>"><bean:message key="order.rowd"/></option>
            <option selected="selected" value="<html:rewrite page="/Orderd/Manage.do"/>"><bean:message key="orderd"/></option>
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
                            <fmt:formatDate var="referTimeFormatted" value="${row.referTime}" pattern="MM/dd/yyyy"/>
                            <fmt:formatDate var="bookTimeFormatted" value="${row.bookTime}" pattern="MM/dd/yyyy"/>
                            <fmt:formatDate var="completeTimeFormatted" value="${row.completeTime}" pattern="MM/dd/yyyy"/>
                            <nobr>
                                <input type="radio" name="_copy" onclick="enableUpdate(true);setFields('<formatting:escape language="javascript">${row.customerOrderNo}</formatting:escape>','<formatting:escape language="javascript">${row.contractNo}</formatting:escape>','<formatting:escape language="javascript">${row.conveyanceEnum}</formatting:escape>','<formatting:escape language="javascript">${row.carryTypeEnum}</formatting:escape>','<formatting:escape language="javascript">${row.shipperRemark}</formatting:escape>','<formatting:escape language="javascript">${row.carrierRemark}</formatting:escape>','<formatting:escape language="javascript">${row.levelEnum}</formatting:escape>','<formatting:escape language="javascript">${row.customerTypeEnum}</formatting:escape>','<formatting:escape language="javascript">${referTimeFormatted}</formatting:escape>','<formatting:escape language="javascript">${row.linkMan}</formatting:escape>','<formatting:escape language="javascript">${row.tel}</formatting:escape>','<formatting:escape language="javascript">${bookTimeFormatted}</formatting:escape>','<formatting:escape language="javascript">${completeTimeFormatted}</formatting:escape>','<formatting:escape language="javascript">${row.remark}</formatting:escape>','<formatting:escape language="javascript">${row.id}</formatting:escape>','<formatting:escape language="javascript">${row.orderRow}</formatting:escape>','<formatting:escape language="javascript">${row.customer}</formatting:escape>',this.form);"/>
                                <input type="checkbox" name="selectedRows" value="${row.id}" onclick="verifyEnableDelete(this);"/>
                            </nobr>
                        </display:column>
                        <display:column media="xml csv excel pdf"
                            property="customerOrderNo"
                            titleKey="orderd.customer.order.no"/>
                        <display:column media="html"
                            headerClass="customerOrderNo" paramId="customerOrderNo" maxLength="36"
                            sortProperty="customerOrderNo" sortable="true"
                            titleKey="orderd.customer.order.no"><nobr><formatting:escape language="javascript,html">${row.customerOrderNo}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="contractNo"
                            titleKey="orderd.contract.no"/>
                        <display:column media="html"
                            headerClass="contractNo" paramId="contractNo" maxLength="36"
                            sortProperty="contractNo" sortable="true"
                            titleKey="orderd.contract.no"><nobr><formatting:escape language="javascript,html">${row.contractNo}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="conveyanceEnum"
                            titleKey="orderd.conveyance.enum"/>
                        <display:column media="html"
                            headerClass="conveyanceEnum" paramId="conveyanceEnum" maxLength="36"
                            sortProperty="conveyanceEnum" sortable="true"
                            titleKey="orderd.conveyance.enum"><nobr><formatting:escape language="javascript,html">${row.conveyanceEnum}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="carryTypeEnum"
                            titleKey="orderd.carry.type.enum"/>
                        <display:column media="html"
                            headerClass="carryTypeEnum" paramId="carryTypeEnum" maxLength="36"
                            sortProperty="carryTypeEnum" sortable="true"
                            titleKey="orderd.carry.type.enum"><nobr><formatting:escape language="javascript,html">${row.carryTypeEnum}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="shipperRemark"
                            titleKey="orderd.shipper.remark"/>
                        <display:column media="html"
                            headerClass="shipperRemark" paramId="shipperRemark" maxLength="36"
                            sortProperty="shipperRemark" sortable="true"
                            titleKey="orderd.shipper.remark"><nobr><formatting:escape language="javascript,html">${row.shipperRemark}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="carrierRemark"
                            titleKey="orderd.carrier.remark"/>
                        <display:column media="html"
                            headerClass="carrierRemark" paramId="carrierRemark" maxLength="36"
                            sortProperty="carrierRemark" sortable="true"
                            titleKey="orderd.carrier.remark"><nobr><formatting:escape language="javascript,html">${row.carrierRemark}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="levelEnum"
                            titleKey="orderd.level.enum"/>
                        <display:column media="html"
                            headerClass="levelEnum" paramId="levelEnum" maxLength="36"
                            sortProperty="levelEnum" sortable="true"
                            titleKey="orderd.level.enum"><nobr><formatting:escape language="javascript,html">${row.levelEnum}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="customerTypeEnum"
                            titleKey="orderd.customer.type.enum"/>
                        <display:column media="html"
                            headerClass="customerTypeEnum" paramId="customerTypeEnum" maxLength="36"
                            sortProperty="customerTypeEnum" sortable="true"
                            titleKey="orderd.customer.type.enum"><nobr><formatting:escape language="javascript,html">${row.customerTypeEnum}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf" titleKey="orderd.refer.time">${referTimeFormatted}</display:column>
                        <display:column media="html"
                            headerClass="referTime" paramId="referTime" maxLength="36"
                            sortProperty="referTime" sortable="true"
                            titleKey="orderd.refer.time"><nobr>${referTimeFormatted}</nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="linkMan"
                            titleKey="orderd.link.man"/>
                        <display:column media="html"
                            headerClass="linkMan" paramId="linkMan" maxLength="36"
                            sortProperty="linkMan" sortable="true"
                            titleKey="orderd.link.man"><nobr><formatting:escape language="javascript,html">${row.linkMan}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="tel"
                            titleKey="orderd.tel"/>
                        <display:column media="html"
                            headerClass="tel" paramId="tel" maxLength="36"
                            sortProperty="tel" sortable="true"
                            titleKey="orderd.tel"><nobr><formatting:escape language="javascript,html">${row.tel}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf" titleKey="orderd.book.time">${bookTimeFormatted}</display:column>
                        <display:column media="html"
                            headerClass="bookTime" paramId="bookTime" maxLength="36"
                            sortProperty="bookTime" sortable="true"
                            titleKey="orderd.book.time"><nobr>${bookTimeFormatted}</nobr></display:column>
                        <display:column media="xml csv excel pdf" titleKey="orderd.complete.time">${completeTimeFormatted}</display:column>
                        <display:column media="html"
                            headerClass="completeTime" paramId="completeTime" maxLength="36"
                            sortProperty="completeTime" sortable="true"
                            titleKey="orderd.complete.time"><nobr>${completeTimeFormatted}</nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="remark"
                            titleKey="orderd.remark"/>
                        <display:column media="html"
                            headerClass="remark" paramId="remark" maxLength="36"
                            sortProperty="remark" sortable="true"
                            titleKey="orderd.remark"><nobr><formatting:escape language="javascript,html">${row.remark}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="orderRow"
                            titleKey="orderd.order.row"/>
                        <display:column media="html"
                            headerClass="orderRow" paramId="orderRow" maxLength="36"
                            sortProperty="orderRow" sortable="true"
                            titleKey="orderd.order.row"><nobr><formatting:escape language="javascript,html">${row.orderRow}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="customer"
                            titleKey="orderd.customer"/>
                        <display:column media="html"
                            headerClass="customer" paramId="customer" maxLength="36"
                            sortProperty="customer" sortable="true"
                            titleKey="orderd.customer"><nobr><formatting:escape language="javascript,html">${row.customer}</formatting:escape></nobr></display:column>
                    </display:table>
                </c:if>
            </div>

        </html:form>

        <div id="pageHelpSection">
            <blockquote>
                <a href="" id="pageHelp" style="display:inline;" onclick="openWindow('<html:rewrite action="/Orderd/ManageHelp"/>','onlinehelp',true,false,760,540); return false;">
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
	 <script type="text/javascript" src="../js/Orderd.js"></script>
	 		<script type="text/javascript" src="../js/OrderRowd.js"></script>
	 		<script type="text/javascript" src="../js/Customer.js"></script>
	 	<script type="text/javascript" >
	  var url = getUrl()+ "services/OrderdManageService";
	  var deletedata =  new Array();
	  var querydata =  new Array();
	  var pagenumber=1;
	  var pagesize=10;
	  var totalCount=0;
	  var queryvo=new OrderdVOJs();
	  var oddstyle='';
	  var model = new dojox.grid.data.Table(null, querydata);
	  var urle = getUrl()+ "services/BasicManageService";        
						var pconveyanceEnum = new SOAPClientParameters();
			pconveyanceEnum.add('eType','conveyanceEnum');
			var itemconveyanceEnum = new Array();
			var itemconveyanceEnumOption = new Array();
				SOAPClient.invoke(urle, "getEnumerationByType", pconveyanceEnum, false,  function GetEnu_callBack(ul, soapResponse){   
				for(var i = 0; i < ul.length; i++){		
				  var ulo=ul[i];
				  itemconveyanceEnum.push({name: ulo["ns:fieldName"], value:ulo["ns:fieldName"]});
				  itemconveyanceEnumOption.push(ulo["ns:fieldName"]);
				}                
			});       
			var conveyanceEnumStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemconveyanceEnum}}); 
					var pcarryTypeEnum = new SOAPClientParameters();
			pcarryTypeEnum.add('eType','carryTypeEnum');
			var itemcarryTypeEnum = new Array();
			var itemcarryTypeEnumOption = new Array();
				SOAPClient.invoke(urle, "getEnumerationByType", pcarryTypeEnum, false,  function GetEnu_callBack(ul, soapResponse){   
				for(var i = 0; i < ul.length; i++){		
				  var ulo=ul[i];
				  itemcarryTypeEnum.push({name: ulo["ns:fieldName"], value:ulo["ns:fieldName"]});
				  itemcarryTypeEnumOption.push(ulo["ns:fieldName"]);
				}                
			});       
			var carryTypeEnumStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemcarryTypeEnum}}); 
							var plevelEnum = new SOAPClientParameters();
			plevelEnum.add('eType','levelEnum');
			var itemlevelEnum = new Array();
			var itemlevelEnumOption = new Array();
				SOAPClient.invoke(urle, "getEnumerationByType", plevelEnum, false,  function GetEnu_callBack(ul, soapResponse){   
				for(var i = 0; i < ul.length; i++){		
				  var ulo=ul[i];
				  itemlevelEnum.push({name: ulo["ns:fieldName"], value:ulo["ns:fieldName"]});
				  itemlevelEnumOption.push(ulo["ns:fieldName"]);
				}                
			});       
			var levelEnumStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemlevelEnum}}); 
					var pcustomerTypeEnum = new SOAPClientParameters();
			pcustomerTypeEnum.add('eType','customerTypeEnum');
			var itemcustomerTypeEnum = new Array();
			var itemcustomerTypeEnumOption = new Array();
				SOAPClient.invoke(urle, "getEnumerationByType", pcustomerTypeEnum, false,  function GetEnu_callBack(ul, soapResponse){   
				for(var i = 0; i < ul.length; i++){		
				  var ulo=ul[i];
				  itemcustomerTypeEnum.push({name: ulo["ns:fieldName"], value:ulo["ns:fieldName"]});
				  itemcustomerTypeEnumOption.push(ulo["ns:fieldName"]);
				}                
			});       
			var customerTypeEnumStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemcustomerTypeEnum}}); 
								
//have set function's manageableAssociationEnds
	var porderRow = new SOAPClientParameters();
	var itemsorderRow = new Array();  
		porderRow.add('OrderRowdVO',new  OrderRowdVOJs()) ;
		porderRow.add('pageNumber',0) ;
		porderRow.add('pageSize',0) ;
	    porderRow.add('orderBy','0') ;
	SOAPClient.invoke(getUrl()+ "services/"+"OrderRowdManageService","getOrderRowd", porderRow, false,  function GetEnu_callBack(ul, soapResponse){      
				for(var i = 0; i < ul.length-1; i++){		
				  var ulo=ul[i];
				  itemsorderRow.push({name: ulo["ns:OrderRowdName"], value:ulo["ns:id"]});
				}                
	});       
	var orderRowStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemsorderRow }});

	function orderRowSet(id,value){
        	/*var itemselect=orderRowStore._getItemByIdentity(value);
        	if(itemselect!='undefined'&& itemselect!=null){
        	}*/
        }
	var pcustomer = new SOAPClientParameters();
	var itemscustomer = new Array();  
		pcustomer.add('CustomerVO',new  CustomerVOJs()) ;
		pcustomer.add('pageNumber',0) ;
		pcustomer.add('pageSize',0) ;
	    pcustomer.add('orderBy','0') ;
	SOAPClient.invoke(getUrl()+ "services/"+"CustomerManageService","getCustomer", pcustomer, false,  function GetEnu_callBack(ul, soapResponse){      
				for(var i = 0; i < ul.length-1; i++){		
				  var ulo=ul[i];
				  itemscustomer.push({name: ulo["ns:CustomerName"], value:ulo["ns:id"]});
				}                
	});       
	var customerStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemscustomer }});

	function customerSet(id,value){
        	/*var itemselect=customerStore._getItemByIdentity(value);
        	if(itemselect!='undefined'&& itemselect!=null){
        	}*/
        }

 
//??????¡À¨ª??¡Á??????????¨®??12???????¨®??12???¨°?¨²??????layout??????layout????structure
//enumeration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
																																																															
var layoutSingleRow=[{
          
 //?¨´??field???????????????????¨°????js????toArray¡Á??????¡§??????querydate????????
	   
				 cells: [ [
							//{name: '????', width: 3, get:getChoise},
						   { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
						   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
      					  {name: i18nStr.customerOrderNo, field: 2,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					            					,   {name: i18nStr.contractNo, field: 3,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					            	    ,   {name: i18nStr.conveyanceEnum, field: 4,width: 10 , editor: mydojo.FilteringSelect ,options:itemconveyanceEnumOption,required:true ,invalidMessage:'can not be empty'}
			        	    ,   {name: i18nStr.carryTypeEnum, field: 5,width: 10 , editor: mydojo.FilteringSelect ,options:itemcarryTypeEnumOption,required:false ,invalidMessage:'can not be empty'}
			        					,   {name: i18nStr.shipperRemark, field: 6,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					            					,   {name: i18nStr.carrierRemark, field: 7,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					            	    ,   {name: i18nStr.levelEnum, field: 8,width: 10 , editor: mydojo.FilteringSelect ,options:itemlevelEnumOption,required:false ,invalidMessage:'can not be empty'}
			        	    ,   {name: i18nStr.customerTypeEnum, field: 9,width: 10 , editor: mydojo.FilteringSelect ,options:itemcustomerTypeEnumOption,required:false ,invalidMessage:'can not be empty'}
			    		,   {name: i18nStr.referTime,field:10, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
				,   {name: i18nStr.referTimeTime,field:11, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
		        					,   {name: i18nStr.linkMan, field: 12,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					            					,   {name: i18nStr.tel, field: 13,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					        		,   {name: i18nStr.bookTime,field:14, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
				,   {name: i18nStr.bookTimeTime,field:15, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
		    		,   {name: i18nStr.completeTime,field:16, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
				,   {name: i18nStr.completeTimeTime,field:17, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
		        				    ,   {name: i18nStr.remark, field: 18,width: 10, editor: dojox.grid.editors.Editor,required:false, editorToolbar: true  }
					      
//??????¡À¨ª???¨ª????????
	//??????¡À¨ª???¨ª????????
					 ,   {name: i18nStr.customer,field: 19,get:function(inRowIndex){ var str='';var strid;if(querydata[inRowIndex]!=undefined && querydata[inRowIndex][19]!=undefined){str=querydata[inRowIndex][19][2];strid=querydata[inRowIndex][19][1];} return str+'<button dojoType="dijit.form.Button" onclick="selectCustomer('+strid+','+inRowIndex+',19,0,event);"   iconClass="CustomerIcon">sel</button>';} ,width: 10 }
			                                        ] ]
                           }]; 

  //rowinum=10
var layoutTwoRow=[{
          
 //?¨´??field???????????????????¨°????js????toArray¡Á??????¡§??????querydate????????
	   
				 cells: [
                      [
						{ name: 'choise', width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },
						{ name: i18nStr.detail, width: 3, get: getCheckOrderd, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
										  															  {name: i18nStr.customerOrderNo, field: 2,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																		  			//--------------  if (3 == 9)
														  															,   {name: i18nStr.contractNo, field: 3,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																		  			//--------------  if (4 == 9)
														  									,   {name: i18nStr.conveyanceEnum, field: 4,width: 10 , editor: mydojo.FilteringSelect ,options:itemconveyanceEnumOption,required:true ,invalidMessage:'can not be empty'}
												  			//--------------  if (5 == 9)
														  									,   {name: i18nStr.carryTypeEnum, field: 5,width: 10 , editor: mydojo.FilteringSelect ,options:itemcarryTypeEnumOption,required:false ,invalidMessage:'can not be empty'}
												  			//--------------  if (6 == 9)
														  															,   {name: i18nStr.shipperRemark, field: 6,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																		  			//--------------  if (7 == 9)
														  															,   {name: i18nStr.carrierRemark, field: 7,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																		  			//--------------  if (8 == 9)
														  									,   {name: i18nStr.levelEnum, field: 8,width: 10 , editor: mydojo.FilteringSelect ,options:itemlevelEnumOption,required:false ,invalidMessage:'can not be empty'}
												  			//--------------  if (9 == 9)
								//
												  															,   {name: i18nStr.customerTypeEnum, field: 9,width: 10 , editor: mydojo.FilteringSelect ,options:itemcustomerTypeEnumOption,required:false ,invalidMessage:'can not be empty'}
																				  								]
												                     //----------------(inum:10)  (rowinum: 9)
									                     //----------------(inum:10)  (rowinum: 9)
									                     //----------------(inum:10)  (rowinum: 9)
									                     //----------------(inum:10)  (rowinum: 9)
									                     //----------------(inum:10)  (rowinum: 9)
									                     //----------------(inum:10)  (rowinum: 9)
									                     //----------------(inum:10)  (rowinum: 9)
								
	//????
		  //(10 > 9)
						//????
		  //(10 > 9)
							,[
	 //  22222222222inum= 2   inum2=10
																																																																									  					  {name: i18nStr.referTime,field:10, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
										,   {name: i18nStr.referTimeTime,field:11, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
								  														  																		,   {name: i18nStr.linkMan, field: 12,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																					  														  																		,   {name: i18nStr.tel, field: 13,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																					  														  					,   {name: i18nStr.bookTime,field:14, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
										,   {name: i18nStr.bookTimeTime,field:15, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
								  														  					,   {name: i18nStr.completeTime,field:16, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
										,   {name: i18nStr.completeTimeTime,field:17, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
								  														  																		,   {name: i18nStr.remark, field: 18,width: 10, editor: dojox.grid.editors.Editor,required:false, editorToolbar: true  }
																					  														
	//????
											//????
									 ,   {name: i18nStr.customer,field: 20,get:function(inRowIndex){ var str='';var strid;if(querydataOrderd[inRowIndex]!=undefined && querydataOrderd[inRowIndex][20]!=undefined && querydataOrderd[inRowIndex][20][1]!=undefined){str=querydataOrderd[inRowIndex][20][2];strid=querydataOrderd[inRowIndex][20][1];} return str+'<button dojoType="dijit.form.Button" onclick="selectCustomer('+strid+','+inRowIndex+',20,0,event);"   iconClass="CustomerIcon">sel</button>';} ,width: 10 }
										 	
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
         var vobject=new OrderdVOJs();
         vobject.id=thisCell[1];
               vobject.customerOrderNo=thisCell[2];
 
               vobject.contractNo=thisCell[3];
 
              if(dojox.validate.isText(thisCell[4], {minlength: 1})){vobject.conveyanceEnum=thisCell[4];
             }else{grid.getCell(grid.model.fieldArray[4]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;}//not null
 
               vobject.carryTypeEnum=thisCell[5];
 
               vobject.shipperRemark=thisCell[6];
 
               vobject.carrierRemark=thisCell[7];
 
               vobject.levelEnum=thisCell[8];
 
               vobject.customerTypeEnum=thisCell[9];
 
 var  d=new DateTimeQuery();
             if(thisCell[10] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[10], grid.getCell(grid.model.fieldArray[10]).constraint);
             }else{grid.getCell(grid.model.fieldArray[10]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[11] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[11], grid.getCell(grid.model.fieldArray[11]).constraint);
             vobject.referTime=d;
             }else{grid.getCell(grid.model.fieldArray[11]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null


               vobject.linkMan=thisCell[12];
 
               vobject.tel=thisCell[13];
 
 var  d=new DateTimeQuery();
             if(thisCell[14] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[14], grid.getCell(grid.model.fieldArray[14]).constraint);
             }else{grid.getCell(grid.model.fieldArray[14]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[15] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[15], grid.getCell(grid.model.fieldArray[15]).constraint);
             vobject.bookTime=d;
             }else{grid.getCell(grid.model.fieldArray[15]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null


 var  d=new DateTimeQuery();
             if(thisCell[16] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[16], grid.getCell(grid.model.fieldArray[16]).constraint);
             }else{grid.getCell(grid.model.fieldArray[16]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[17] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[17], grid.getCell(grid.model.fieldArray[17]).constraint);
             vobject.completeTime=d;
             }else{grid.getCell(grid.model.fieldArray[17]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null


               vobject.remark=thisCell[18];
 

					var manageable=new CustomerVOJs();
			 if(querydata[i][19]!=''&&querydata[i][19]!=undefined){
             manageable.id=querydata[i][19][1];
             vobject.customer=manageable;
			 }else{
			 grid.getCell(grid.model.fieldArray[19]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
			


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('OrderdVO',vobject);
                SOAPClient.invoke(url, "createOrderd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                grid.model.setDatum(ul,i,1);
                });
	         }else{//modify row
                padd.add('OrderdVO',vobject);
                SOAPClient.invoke(url, "updateOrderd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
        } }}//for
//submit delete
          for(var i=0;i<deletedata.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',deletedata[i]);
               SOAPClient.invoke(url, "deleteOrderd", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
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
              queryvo=new OrderdVOJs();
	          if(querycustomerOrderNo.getDisplayedValue()!="")queryvo.customerOrderNo=querycustomerOrderNo.getDisplayedValue();//
	          if(querycontractNo.getDisplayedValue()!="")queryvo.contractNo=querycontractNo.getDisplayedValue();//
	          if(queryconveyanceEnum.getDisplayedValue()!="")queryvo.conveyanceEnum=queryconveyanceEnum.getDisplayedValue();//
	          if(querycarryTypeEnum.getDisplayedValue()!="")queryvo.carryTypeEnum=querycarryTypeEnum.getDisplayedValue();//
	          if(queryshipperRemark.getDisplayedValue()!="")queryvo.shipperRemark=queryshipperRemark.getDisplayedValue();//
	          if(querycarrierRemark.getDisplayedValue()!="")queryvo.carrierRemark=querycarrierRemark.getDisplayedValue();//
	          if(querylevelEnum.getDisplayedValue()!="")queryvo.levelEnum=querylevelEnum.getDisplayedValue();//
	          if(querycustomerTypeEnum.getDisplayedValue()!="")queryvo.customerTypeEnum=querycustomerTypeEnum.getDisplayedValue();//
              d=queryDate_fun("referTime");
              if(d==null){validstate=1;}else if(d.upSign!="%"){queryvo.referTime=d;}
	          if(querylinkMan.getDisplayedValue()!="")queryvo.linkMan=querylinkMan.getDisplayedValue();//
	          if(querytel.getDisplayedValue()!="")queryvo.tel=querytel.getDisplayedValue();//
              d=queryDate_fun("bookTime");
              if(d==null){validstate=1;}else if(d.upSign!="%"){queryvo.bookTime=d;}
              d=queryDate_fun("completeTime");
              if(d==null){validstate=1;}else if(d.upSign!="%"){queryvo.completeTime=d;}
	          if(queryremark.getDisplayedValue()!="")queryvo.remark=queryremark.getDisplayedValue();//
			
	if(queryorderRow.getDisplayedValue()!=""){
				var orderRowQuery= new OrderRowdVOJs();
				//orderRowQuery.OrderdName=queryorderRow.getDisplayedValue();
				orderRowQuery.id=queryorderRow.getValue();
				queryvo.orderRow=orderRowQuery;
			  }
	if(querycustomer.getDisplayedValue()!=""){
				var customerQuery= new CustomerVOJs();
				//customerQuery.OrderdName=querycustomer.getDisplayedValue();
				customerQuery.id=querycustomer.getValue();
				queryvo.customer=customerQuery;
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
      pu.add('OrderdVO',queryvo) ;
      pu.add('pageNumber',pagenumber) ;
	    pu.add('pageSize',pagesize) ;
	    pu.add('orderBy',orderBy) ;
      SOAPClient.invoke(url,"getOrderd", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydata=new Array();
		   querydata=OrderdVOtoArray_fun(ul,true);
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
		 document.getElementById('OrderdId').value=querydata[e.rowIndex][1];
		 	 									//enumeration ?????¡§??String?¨¤?????¨ª??
				dijit.byId("addcustomerOrderNo").setValue(querydata[e.rowIndex][2]);
						 									//enumeration ?????¡§??String?¨¤?????¨ª??
				dijit.byId("addcontractNo").setValue(querydata[e.rowIndex][3]);
						 									//enumeration ?????¡§??String?¨¤?????¨ª??
				dijit.byId("addconveyanceEnum").setValue(querydata[e.rowIndex][4]);
						 									//enumeration ?????¡§??String?¨¤?????¨ª??
				dijit.byId("addcarryTypeEnum").setValue(querydata[e.rowIndex][5]);
						 									//enumeration ?????¡§??String?¨¤?????¨ª??
				dijit.byId("addshipperRemark").setValue(querydata[e.rowIndex][6]);
						 									//enumeration ?????¡§??String?¨¤?????¨ª??
				dijit.byId("addcarrierRemark").setValue(querydata[e.rowIndex][7]);
						 									//enumeration ?????¡§??String?¨¤?????¨ª??
				dijit.byId("addlevelEnum").setValue(querydata[e.rowIndex][8]);
						 									//enumeration ?????¡§??String?¨¤?????¨ª??
				dijit.byId("addcustomerTypeEnum").setValue(querydata[e.rowIndex][9]);
						 									 dijit.byId("addreferTime").setValue(querydata[e.rowIndex][10].substring(0,10));
				  				  dijit.byId("addreferTimeTime").setValue(querydata[e.rowIndex][11].substring(11,16));
						 									//enumeration ?????¡§??String?¨¤?????¨ª??
				dijit.byId("addlinkMan").setValue(querydata[e.rowIndex][12]);
						 									//enumeration ?????¡§??String?¨¤?????¨ª??
				dijit.byId("addtel").setValue(querydata[e.rowIndex][13]);
						 									 dijit.byId("addbookTime").setValue(querydata[e.rowIndex][14].substring(0,10));
				  				  dijit.byId("addbookTimeTime").setValue(querydata[e.rowIndex][15].substring(11,16));
						 									 dijit.byId("addcompleteTime").setValue(querydata[e.rowIndex][16].substring(0,10));
				  				  dijit.byId("addcompleteTimeTime").setValue(querydata[e.rowIndex][17].substring(11,16));
						 									//enumeration ?????¡§??String?¨¤?????¨ª??
				dijit.byId("addremark").setValue(querydata[e.rowIndex][18]);
						 			 
					dijit.byId("addorderRow").setValue(querydata[e.rowIndex][19][1]);
			//dijit.byId("addorderRow").setDisplayedValue('');
					dijit.byId("addcustomer").setValue(querydata[e.rowIndex][19][1]);
			//dijit.byId("addcustomer").setDisplayedValue('');
			});     
}

 dojo.addOnLoad(init);   

	function selectOrderRowdFun(rep){
		querydata[selectOrderRowdInRow][noOrderRowd]=rep;
		grid.updateRow(selectOrderRowdInRow);		
	}
	function selectCustomerFun(rep){
		querydata[selectCustomerInRow][noCustomer]=rep;
		grid.updateRow(selectCustomerInRow);		
	}
//addDiv---------------begin-------------------------------------
var addDivAdd = function(){
	 if(document.getElementById('queryDiv').style.display=='')document.getElementById('queryDiv').style.display='none';
	 if(document.getElementById('addDiv').style.display=='none')document.getElementById('addDiv').style.display='';
	 //????add????
										//enumeration ?????¡§??String?¨¤?????¨ª??
				dijit.byId("addcustomerOrderNo").setValue('');
															//enumeration ?????¡§??String?¨¤?????¨ª??
				dijit.byId("addcontractNo").setValue('');
															//enumeration ?????¡§??String?¨¤?????¨ª??
				dijit.byId("addconveyanceEnum").setValue('');
															//enumeration ?????¡§??String?¨¤?????¨ª??
				dijit.byId("addcarryTypeEnum").setValue('');
															//enumeration ?????¡§??String?¨¤?????¨ª??
				dijit.byId("addshipperRemark").setValue('');
															//enumeration ?????¡§??String?¨¤?????¨ª??
				dijit.byId("addcarrierRemark").setValue('');
															//enumeration ?????¡§??String?¨¤?????¨ª??
				dijit.byId("addlevelEnum").setValue('');
															//enumeration ?????¡§??String?¨¤?????¨ª??
				dijit.byId("addcustomerTypeEnum").setValue('');
															dijit.byId("addreferTime").setValue('');
				dijit.byId("addreferTimeTime").setValue('');
															//enumeration ?????¡§??String?¨¤?????¨ª??
				dijit.byId("addlinkMan").setValue('');
															//enumeration ?????¡§??String?¨¤?????¨ª??
				dijit.byId("addtel").setValue('');
															dijit.byId("addbookTime").setValue('');
				dijit.byId("addbookTimeTime").setValue('');
															dijit.byId("addcompleteTime").setValue('');
				dijit.byId("addcompleteTimeTime").setValue('');
															//enumeration ?????¡§??String?¨¤?????¨ª??
				dijit.byId("addremark").setValue('');
										
			dijit.byId("addorderRow").setValue('');
	    dijit.byId("addorderRow").setDisplayedValue('');
			dijit.byId("addcustomer").setValue('');
	    dijit.byId("addcustomer").setDisplayedValue('');
		
	document.getElementById('OrderdId').value='0';
	//document.getElementById('referTimeAdd1').value=dojo.date.locale.format(new Date(),{ datePattern: "yyyy-MM-dd", selector: "date"});
	//document.getElementById('referTimeAdd2').value=dojo.date.locale.format(new Date(),{ timePattern: "HH:mm", selector: "time"});
} 
function addDivSave(){
	var padd = new SOAPClientParameters2();
	var vobject=new OrderdVOJs();
    vobject.id=document.getElementById('OrderdId').value;
	var passAll=0;
										//enumeration ?????¡§??String?¨¤?????¨ª??
				if(dijit.byId("addcustomerOrderNo").isValid(true)){
					vobject.customerOrderNo=dijit.byId("addcustomerOrderNo").getValue();
				}else{
					passAll=1;
				}
															//enumeration ?????¡§??String?¨¤?????¨ª??
				if(dijit.byId("addcontractNo").isValid(true)){
					vobject.contractNo=dijit.byId("addcontractNo").getValue();
				}else{
					passAll=1;
				}
															//enumeration ?????¡§??String?¨¤?????¨ª??
				if(dijit.byId("addconveyanceEnum").isValid(true)){
					vobject.conveyanceEnum=dijit.byId("addconveyanceEnum").getValue();
				}else{
					passAll=1;
				}
															//enumeration ?????¡§??String?¨¤?????¨ª??
				if(dijit.byId("addcarryTypeEnum").isValid(true)){
					vobject.carryTypeEnum=dijit.byId("addcarryTypeEnum").getValue();
				}else{
					passAll=1;
				}
															//enumeration ?????¡§??String?¨¤?????¨ª??
				if(dijit.byId("addshipperRemark").isValid(true)){
					vobject.shipperRemark=dijit.byId("addshipperRemark").getValue();
				}else{
					passAll=1;
				}
															//enumeration ?????¡§??String?¨¤?????¨ª??
				if(dijit.byId("addcarrierRemark").isValid(true)){
					vobject.carrierRemark=dijit.byId("addcarrierRemark").getValue();
				}else{
					passAll=1;
				}
															//enumeration ?????¡§??String?¨¤?????¨ª??
				if(dijit.byId("addlevelEnum").isValid(true)){
					vobject.levelEnum=dijit.byId("addlevelEnum").getValue();
				}else{
					passAll=1;
				}
															//enumeration ?????¡§??String?¨¤?????¨ª??
				if(dijit.byId("addcustomerTypeEnum").isValid(true)){
					vobject.customerTypeEnum=dijit.byId("addcustomerTypeEnum").getValue();
				}else{
					passAll=1;
				}
															if(dijit.byId("addreferTime").getValue() instanceof Date){ 
					if(dijit.byId("addreferTimeTime").getValue() instanceof Date){
						var dreferTime=new DateTimeQuery();
						dreferTime.upDate=dojo.date.locale.format(dijit.byId("addreferTime").getValue(), dijit.byId("addreferTime").constraints)+" "+dojo.date.locale.format(dijit.byId("addreferTimeTime").getValue(), dijit.byId("addreferTimeTime").constraints);
						vobject.referTime=dreferTime;
					}else{passAll=1;}
				}else{
					passAll=1;}
															//enumeration ?????¡§??String?¨¤?????¨ª??
				if(dijit.byId("addlinkMan").isValid(true)){
					vobject.linkMan=dijit.byId("addlinkMan").getValue();
				}else{
					passAll=1;
				}
															//enumeration ?????¡§??String?¨¤?????¨ª??
				if(dijit.byId("addtel").isValid(true)){
					vobject.tel=dijit.byId("addtel").getValue();
				}else{
					passAll=1;
				}
															if(dijit.byId("addbookTime").getValue() instanceof Date){ 
					if(dijit.byId("addbookTimeTime").getValue() instanceof Date){
						var dbookTime=new DateTimeQuery();
						dbookTime.upDate=dojo.date.locale.format(dijit.byId("addbookTime").getValue(), dijit.byId("addbookTime").constraints)+" "+dojo.date.locale.format(dijit.byId("addbookTimeTime").getValue(), dijit.byId("addbookTimeTime").constraints);
						vobject.bookTime=dbookTime;
					}else{passAll=1;}
				}else{
					passAll=1;}
															if(dijit.byId("addcompleteTime").getValue() instanceof Date){ 
					if(dijit.byId("addcompleteTimeTime").getValue() instanceof Date){
						var dcompleteTime=new DateTimeQuery();
						dcompleteTime.upDate=dojo.date.locale.format(dijit.byId("addcompleteTime").getValue(), dijit.byId("addcompleteTime").constraints)+" "+dojo.date.locale.format(dijit.byId("addcompleteTimeTime").getValue(), dijit.byId("addcompleteTimeTime").constraints);
						vobject.completeTime=dcompleteTime;
					}else{passAll=1;}
				}else{
					passAll=1;}
															//enumeration ?????¡§??String?¨¤?????¨ª??
				if(dijit.byId("addremark").isValid(true)){
					vobject.remark=dijit.byId("addremark").getValue();
				}else{
					passAll=1;
				}
										
	if(dijit.byId("addorderRow").isValid(true)){
		//vobject.orderRow=dijit.byId("addorderRow").getValue();
		var manageable=new OrderRowdVOJs();
		manageable.id=dijit.byId("addorderRow").getValue();
		vobject.orderRow=manageable;
	}else{
		passAll=1;
	}
	if(dijit.byId("addcustomer").isValid(true)){
		//vobject.customer=dijit.byId("addcustomer").getValue();
		var manageable=new CustomerVOJs();
		manageable.id=dijit.byId("addcustomer").getValue();
		vobject.customer=manageable;
	}else{
		passAll=1;
	}
	
if(passAll==0){
		//var addrow='';
		var addrow=[];
														//addrow=addrow+","+vobject.customerOrderNo;
					addrow.push(vobject.customerOrderNo);
																					//addrow=addrow+","+vobject.contractNo;
					addrow.push(vobject.contractNo);
																					//addrow=addrow+","+vobject.conveyanceEnum;
					addrow.push(vobject.conveyanceEnum);
																					//addrow=addrow+","+vobject.carryTypeEnum;
					addrow.push(vobject.carryTypeEnum);
																					//addrow=addrow+","+vobject.shipperRemark;
					addrow.push(vobject.shipperRemark);
																					//addrow=addrow+","+vobject.carrierRemark;
					addrow.push(vobject.carrierRemark);
																					//addrow=addrow+","+vobject.levelEnum;
					addrow.push(vobject.levelEnum);
																					//addrow=addrow+","+vobject.customerTypeEnum;
					addrow.push(vobject.customerTypeEnum);
																					//addrow=addrow+","+vobject.referTime.upDate+","+vobject.referTime.upDate;
					addrow.push(dojo.date.locale.parse(vobject.referTime.upDate,{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
					addrow.push(dojo.date.locale.parse(vobject.referTime.upDate,{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
																					//addrow=addrow+","+vobject.linkMan;
					addrow.push(vobject.linkMan);
																					//addrow=addrow+","+vobject.tel;
					addrow.push(vobject.tel);
																					//addrow=addrow+","+vobject.bookTime.upDate+","+vobject.bookTime.upDate;
					addrow.push(dojo.date.locale.parse(vobject.bookTime.upDate,{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
					addrow.push(dojo.date.locale.parse(vobject.bookTime.upDate,{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
																					//addrow=addrow+","+vobject.completeTime.upDate+","+vobject.completeTime.upDate;
					addrow.push(dojo.date.locale.parse(vobject.completeTime.upDate,{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
					addrow.push(dojo.date.locale.parse(vobject.completeTime.upDate,{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
																					//addrow=addrow+","+vobject.remark;
					addrow.push(vobject.remark);
																			//addrow=addrow+","+OrderRowdVOtoArray_fun(vobject.orderRow,true);//addrow.push(OrderRowdVOtoArray_fun(vobject.orderRow,true));
			addrow.push([false,addorderRow.getValue(),addorderRow.getDisplayedValue()]);
					//addrow=addrow+","+CustomerVOtoArray_fun(vobject.customer,true);//addrow.push(CustomerVOtoArray_fun(vobject.customer,true));
			addrow.push([false,addcustomer.getValue(),addcustomer.getDisplayedValue()]);
			 if(vobject.id==0){//create new row
		padd.add('OrderdVO',vobject);
		SOAPClient.invoke(url, "createOrderd", padd, false,  function GetEnu_callBack(ul, soapResponse){
		//addrow='false,ul'+addrow;
		addrow.splice(0,0,false,ul);
				console.log("addrow.lenght:"+addrow.length);
				console.log("addrow:"+addrow);
		grid.addRow(addrow ,grid.model.getRowCount());//grid.addRow([addrow]);
		});
	 }else{//modify row
		padd.add('OrderdVO',vobject);
		SOAPClient.invoke(url, "updateOrderd", padd, false,  function GetEnu_callBack(ul, soapResponse){
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
               SOAPClient.invoke(url, "deleteOrderd", pdel, false,  function GetEnu_callBack(ul, soapResponse){
               if(si>ii){
					if(si-1>=0){document.getElementById('erowIndex').value=si-1;}//else{document.getElementById('erowIndex').value='';}//????????????????????????????????//
               }
			   totalCount--;
               var totalpage=Math.ceil(new Number(totalCount)/pagesize);
               document.getElementById("rowCount").innerHTML="??"+pagenumber+"??/??"+totalpage+"??/¡Á???"+totalCount+"??????" ; 
               if(si=ii){if(document.getElementById('addDiv').style.display=='')document.getElementById('addDiv').style.display='none';}
	        });   
          //}             
           dijit.byId("grid").removeSelectedRows();
      }
 }    
//addDiv---------------end---------------------------------------	 
//totleinum=20
 //rowinum=6
 //addHeight=170
</script>
</head>	 
<body class="tundra">
		<div id="addDiv" style="margin-right: 0px;  height: 170px; display:none;" >
              <table align="center" width="100%" id="0" class="editorTable"  >
                <tr >
				<td align="center" style="{width:11%}" i18n="addNote" ></td>
                <td style="{width:22%}" ><input id="OrderdId" style="{display:none}"  type="text"  /></td>
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
				<td align="right" i18n="customerOrderNo" >customerOrderNo:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addcustomerOrderNo"  jsId="addcustomerOrderNo"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
					<td align="right" i18n="contractNo" >contractNo:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addcontractNo"  jsId="addcontractNo"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
					<td align="right" i18n="conveyanceEnum" >conveyanceEnum:</td>
			<td align="left"  >
									<input  id="addconveyanceEnum"  jsId="addconveyanceEnum" class="editerInput"  dojoType="dijit.form.myFilteringSelect" store="conveyanceEnumStore"  />
							</td>
		</tr>	
                <tr>
				<td align="right" i18n="carryTypeEnum" >carryTypeEnum:</td>
			<td align="left"  >
									<input  id="addcarryTypeEnum"  jsId="addcarryTypeEnum" class="editerInput"  dojoType="dijit.form.myFilteringSelect" store="carryTypeEnumStore"  />
							</td>
					<td align="right" i18n="shipperRemark" >shipperRemark:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addshipperRemark"  jsId="addshipperRemark"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
					<td align="right" i18n="carrierRemark" >carrierRemark:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addcarrierRemark"  jsId="addcarrierRemark"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
		</tr>	
                <tr>
				<td align="right" i18n="levelEnum" >levelEnum:</td>
			<td align="left"  >
									<input  id="addlevelEnum"  jsId="addlevelEnum" class="editerInput"  dojoType="dijit.form.myFilteringSelect" store="levelEnumStore"  />
							</td>
					<td align="right" i18n="customerTypeEnum" >customerTypeEnum:</td>
			<td align="left"  >
									<input  id="addcustomerTypeEnum"  jsId="addcustomerTypeEnum" class="editerInput"  dojoType="dijit.form.myFilteringSelect" store="customerTypeEnumStore"  />
							</td>
					<td align="right" i18n="referTime"  >referTime:</td> 
			<td align="left" >
				<input class="editerDate"   jsId="addreferTime" id="addreferTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
				<input class="editerTime" jsId="addreferTimeTime" id="addreferTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours.">
			</td>
		</tr>	
                <tr>
				<td align="right" i18n="linkMan" >linkMan:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addlinkMan"  jsId="addlinkMan"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
					<td align="right" i18n="tel" >tel:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addtel"  jsId="addtel"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
					<td align="right" i18n="bookTime"  >bookTime:</td> 
			<td align="left" >
				<input class="editerDate"   jsId="addbookTime" id="addbookTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
				<input class="editerTime" jsId="addbookTimeTime" id="addbookTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours.">
			</td>
		</tr>	
                <tr>
				<td align="right" i18n="completeTime"  >completeTime:</td> 
			<td align="left" >
				<input class="editerDate"   jsId="addcompleteTime" id="addcompleteTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
				<input class="editerTime" jsId="addcompleteTimeTime" id="addcompleteTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours.">
			</td>
					<td align="right" i18n="remark" >remark:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addremark"  jsId="addremark"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
	
//if (3==1)     
//    <--/tr-->
//end

//set ($inume =1) 
												<td align="right"  i18n="customer"  ></td>
					<td align="left" ><input  id="addcustomer"  jsId="addcustomer" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="customerStore" onchange="customerSet(0,arguments[0]);" /></td>
					</tr>
						</table></div>
<div id="queryDiv" style="margin-right: 0px;  height: 200px; display:none;" >
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
							<td align="right" i18n="customerOrderNo" >customerOrderNo:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="querycustomerOrderNo"  jsId="querycustomerOrderNo"   dojoType="dijit.form.TextBox"  />
													</td>
														<td align="right"  i18n="contractNo" >contractNo:</td>
						<td align="left"  colspan="3" >
													<input type="text" class="editerInput"  id="querycontractNo"  jsId="querycontractNo"   dojoType="dijit.form.TextBox"  />
												</td>  
													<td align="right"  i18n="conveyanceEnum" >conveyanceEnum:</td>
						<td align="left"  >
													<input  id="queryconveyanceEnum" jsId="queryconveyanceEnum" class="editerInput"  dojoType="dijit.form.FilteringSelect" store="conveyanceEnumStore" />
												</td>  
										  </tr>
			                <tr>
							<td align="right" i18n="carryTypeEnum" >carryTypeEnum:</td>
						<td align="left"  >
						
														<input  id="querycarryTypeEnum"  jsId="querycarryTypeEnum" class="editerInput"  dojoType="dijit.form.FilteringSelect" store="carryTypeEnumStore" />
													</td>
														<td align="right"  i18n="shipperRemark" >shipperRemark:</td>
						<td align="left"  colspan="3" >
													<input type="text" class="editerInput"  id="queryshipperRemark"  jsId="queryshipperRemark"   dojoType="dijit.form.TextBox"  />
												</td>  
													<td align="right"  i18n="carrierRemark" >carrierRemark:</td>
						<td align="left"  >
													<input type="text" class="editerInput"  id="querycarrierRemark"  jsId="querycarrierRemark"   dojoType="dijit.form.TextBox"  />
												</td>  
										  </tr>
			                <tr>
							<td align="right" i18n="levelEnum" >levelEnum:</td>
						<td align="left"  >
						
														<input  id="querylevelEnum"  jsId="querylevelEnum" class="editerInput"  dojoType="dijit.form.FilteringSelect" store="levelEnumStore" />
													</td>
														<td align="right"  i18n="customerTypeEnum" >customerTypeEnum:</td>
						<td align="left"  colspan="3" >
												<input  id="querycustomerTypeEnum" jsId="querycustomerTypeEnum" class="editerInput"  dojoType="dijit.form.FilteringSelect" store="customerTypeEnumStore" />
												</td>  
											<td align="right"  > </td>
						<td align="right"  ></td>
					</tr><tr >
						<td align="right"  i18n="referTime" >referTime:</td>
						<td align="left"  colspan="3"><span id="queryreferTimeImg0"  ><input class="editerDate"   jsId="queryreferTime" id="queryreferTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTime" jsId="queryreferTimeTime" id="queryreferTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span id="queryreferTimeImg1" style="{display:none}" ><input class="editerDateSmaller"   jsId="query1referTime" id="query1referTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query1referTimeTime" id="query1referTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryreferTimeImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryreferTimeImgdown" >></span>
							<span id="queryreferTimeImg2div" style="{display:none}"><input class="editerDateSmaller"   jsId="query2referTime" id="query2referTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query2referTimeTime" id="query2referTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="queryreferTimeImg" style="vertical-align:middle;margin-top:0px;">
							
						</td>
															<td align="right" colspan="2" ></td>
						<td align="right"  i18n="linkMan" >linkMan:</td>
						<td align="left"  >
							 								<input type="text" class="editerInput"  id="querylinkMan"  jsId="querylinkMan"   dojoType="dijit.form.TextBox"  />  
													</td></tr>
					                <tr>
							<td align="right" i18n="tel" >tel:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="querytel"  jsId="querytel"   dojoType="dijit.form.TextBox"  />
													</td>
																<td align="right"  i18n="bookTime" >bookTime:</td>
						<td align="left"   colspan="5"><span id="querybookTimeImg0"  ><input class="editerDate"   jsId="querybookTime" id="querybookTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTime" jsId="querybookTimeTime" id="querybookTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span id="querybookTimeImg1" style="{display:none}" ><input class="editerDateSmall"   jsId="query1bookTime" id="query1bookTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmall" jsId="query1bookTimeTime" id="query1bookTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="querybookTimeImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="querybookTimeImgdown" >></span>
							<span id="querybookTimeImg2div" style="{display:none}"><input class="editerDateSmall"   jsId="query2bookTime" id="query2bookTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmall" jsId="query2bookTimeTime" id="query2bookTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="querybookTimeImg" style="vertical-align:middle;margin-top:0px;">
						</td></tr>
			                <tr>
							<td align="right" i18n="completeTime"  >completeTime:</td> 
						<td align="left"  colspan="3"><span id="querycompleteTimeImg0"  ><input class="editerDate"   jsId="querycompleteTime" id="querycompleteTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTime" jsId="querycompleteTimeTime" id="querycompleteTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span id="querycompleteTimeImg1" style="{display:none}" ><input class="editerDateSmaller"   jsId="query1completeTime" id="query1completeTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query1completeTimeTime" id="query1completeTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="querycompleteTimeImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="querycompleteTimeImgdown" >></span>
							<span id="querycompleteTimeImg2div" style="{display:none}"><input class="editerDateSmaller"   jsId="query2completeTime" id="query2completeTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query2completeTimeTime" id="query2completeTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="querycompleteTimeImg" style="vertical-align:middle;margin-top:0px;">
						</td>
													<td align="right" colspan="2" ></td>
						<td align="right"  i18n="remark" >remark:</td>
						<td align="left"  >
							 								<input type="text" class="editerInput"  id="queryremark"  jsId="queryremark"   dojoType="dijit.form.TextBox"  />  
													</td></tr>
					

//if (!="over" && 1!=1)     
    <!--/tr-->
//end 
//set ($inume =1) 
												<tr><td align="right"  i18n="customer"  ></td>
					<td align="left" ><input  id="querycustomer"  jsId="querycustomer" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="customerStore"  /></td>  
						    <td align="right"    ></td><td align="right"    ></td><td align="right"    ></td><td align="right"    ></td></tr>

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
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
