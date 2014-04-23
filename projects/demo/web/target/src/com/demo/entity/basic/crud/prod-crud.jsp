<%@ include file="/taglib-imports.jspf" %>
<tiles:insert definition="main.layout">

    <tiles:put name="title" type="string">
        <bean:message key="prod.page.title"/>
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

            function setAction(crud) { document.forms['manageProdForm'].elements['crud'].value = crud; }

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
                setFields("","","","","","","","",form);
            }

            function setFields(prodName,code,price,datef,prodType,id,prodCust,principal,form)
            {
                form.elements["prodName"].value = prodName;
                form.elements["code"].value = code;
                form.elements["price"].value = price;
                form.elements["datefAsString"].value = datef;
                form.elements["prodType"].value = prodType;
                form.elements["id"].value = id;
                setSelect(false,form,"prodCust",prodCust);
                setSelect(false,form,"principal",principal);
            }
        //-->
        </script>
    </tiles:put>

    <tiles:put name="body" type="string">

        <div>
            <h1><bean:message key="prod.page.title"/></h1>
        </div>

        <html:form styleId="manageProdForm" action="/Prod/Manage" method="post">
            <input type="hidden" name="crud" value=""/>
            <div id="criteria">
                <c:if test="${!empty manageableForm}">
                    <table>
                        <tr>
                            <td><nobr><bean:message key="prod.prod.name"/> <div class="important">*</div></nobr></td>
                            <td>
                                <html:text name="manageableForm" property="prodName" styleClass="criteriaField" styleId="prodName"/>
                            </td>
                        </tr>
                        <tr>
                            <td><bean:message key="prod.code"/></td>
                            <td>
                                <html:text name="manageableForm" property="code" styleClass="criteriaField" styleId="code"/>
                            </td>
                        </tr>
                        <tr>
                            <td><bean:message key="prod.price"/></td>
                            <td>
                                <html:text name="manageableForm" property="price" styleClass="criteriaField" styleId="price"/>
                            </td>
                        </tr>
                        <tr>
                            <td><bean:message key="prod.datef"/></td>
                            <td>
                                <html:text name="manageableForm" property="datefAsString" styleClass="criteriaField" styleId="datef"/>
                                <html:img page="/layout/calendar/calendar.gif" styleId="datef_trigger" styleClass="calendar"/>
                                <script type="text/javascript">
                                //<!--
                                    Calendar.setup({
                                        inputField     :    "datef",
                                        ifFormat       :    "%m/%d/%Y",
                                        daFormat       :    "%m/%d/%Y",
                                        showsTime      :    false,
                                        button         :    "datef_trigger",
                                        singleClick    :    true
                                    });
                                //-->
                                </script>
                            </td>
                        </tr>
                        <tr>
                            <td><bean:message key="prod.prod.type"/></td>
                            <td>
                                <html:text name="manageableForm" property="prodType" styleClass="criteriaField" styleId="prodType"/>
                            </td>
                        </tr>
                    <html:hidden name="manageableForm" property="id"/>
                        <tr>
                            <td>
                                    <nobr><html:link action="/Customer/Manage"><bean:message key="prod.prod.cust"/></html:link> <div class="important">*</div></nobr>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${empty manageableForm.prodCustBackingList}">
                                        <select name="prodCust" disabled="disabled"/>
                                    </c:when>
                                    <c:otherwise>
                                        <select name="prodCust">
                                            <option value=""><bean:message key="select.option.blank"/></option>
                                            <c:forEach var="valueLabel" items="${manageableForm.prodCustBackingList}">
                                                <c:choose>
                                                    <c:when test="${valueLabel[0] eq manageableForm.prodCust}">
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
                                    <nobr><html:link action="/Peoples/Manage"><bean:message key="prod.principal"/></html:link> <div class="important">*</div></nobr>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${empty manageableForm.principalBackingList}">
                                        <select name="principal" disabled="disabled"/>
                                    </c:when>
                                    <c:otherwise>
                                        <select name="principal">
                                            <option value=""><bean:message key="select.option.blank"/></option>
                                            <c:forEach var="valueLabel" items="${manageableForm.principalBackingList}">
                                                <c:choose>
                                                    <c:when test="${valueLabel[0] eq manageableForm.principal}">
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
        <select onchange="document.location=this.options[this.selectedIndex].value+'?ref_Prod='+this.form.elements['id'].value;">
            <option value="<html:rewrite page="/Contact/Manage.do"/>"><bean:message key="contact"/></option>
            <option value="<html:rewrite page="/Customer/Manage.do"/>"><bean:message key="customer"/></option>
            <option value="<html:rewrite page="/Enumeration/Manage.do"/>"><bean:message key="enumeration"/></option>
            <option value="<html:rewrite page="/OrderRowTask/Manage.do"/>"><bean:message key="order.row.task"/></option>
            <option value="<html:rewrite page="/OrderRowd/Manage.do"/>"><bean:message key="order.rowd"/></option>
            <option value="<html:rewrite page="/Orderd/Manage.do"/>"><bean:message key="orderd"/></option>
            <option value="<html:rewrite page="/Orga/Manage.do"/>"><bean:message key="orga"/></option>
            <option value="<html:rewrite page="/OrgaPeoples/Manage.do"/>"><bean:message key="orga.peoples"/></option>
            <option value="<html:rewrite page="/Payment/Manage.do"/>"><bean:message key="payment"/></option>
            <option value="<html:rewrite page="/Peoples/Manage.do"/>"><bean:message key="peoples"/></option>
            <option selected="selected" value="<html:rewrite page="/Prod/Manage.do"/>"><bean:message key="prod"/></option>
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
                            <fmt:formatDate var="datefFormatted" value="${row.datef}" pattern="MM/dd/yyyy"/>
                            <nobr>
                                <input type="radio" name="_copy" onclick="enableUpdate(true);setFields('<formatting:escape language="javascript">${row.prodName}</formatting:escape>','<formatting:escape language="javascript">${row.code}</formatting:escape>','<formatting:escape language="javascript">${row.price}</formatting:escape>','<formatting:escape language="javascript">${datefFormatted}</formatting:escape>','<formatting:escape language="javascript">${row.prodType}</formatting:escape>','<formatting:escape language="javascript">${row.id}</formatting:escape>','<formatting:escape language="javascript">${row.prodCust}</formatting:escape>','<formatting:escape language="javascript">${row.principal}</formatting:escape>',this.form);"/>
                                <input type="checkbox" name="selectedRows" value="${row.id}" onclick="verifyEnableDelete(this);"/>
                            </nobr>
                        </display:column>
                        <display:column media="xml csv excel pdf"
                            property="prodName"
                            titleKey="prod.prod.name"/>
                        <display:column media="html"
                            headerClass="prodName" paramId="prodName" maxLength="36"
                            sortProperty="prodName" sortable="true"
                            titleKey="prod.prod.name"><nobr><formatting:escape language="javascript,html">${row.prodName}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="code"
                            titleKey="prod.code"/>
                        <display:column media="html"
                            headerClass="code" paramId="code" maxLength="36"
                            sortProperty="code" sortable="true"
                            titleKey="prod.code"><nobr><formatting:escape language="javascript,html">${row.code}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="price"
                            titleKey="prod.price"/>
                        <display:column media="html"
                            headerClass="price" paramId="price" maxLength="36"
                            sortProperty="price" sortable="true"
                            titleKey="prod.price"><nobr><formatting:escape language="javascript,html">${row.price}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf" titleKey="prod.datef">${datefFormatted}</display:column>
                        <display:column media="html"
                            headerClass="datef" paramId="datef" maxLength="36"
                            sortProperty="datef" sortable="true"
                            titleKey="prod.datef"><nobr>${datefFormatted}</nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="prodType"
                            titleKey="prod.prod.type"/>
                        <display:column media="html"
                            headerClass="prodType" paramId="prodType" maxLength="36"
                            sortProperty="prodType" sortable="true"
                            titleKey="prod.prod.type"><nobr><formatting:escape language="javascript,html">${row.prodType}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="prodCust"
                            titleKey="prod.prod.cust"/>
                        <display:column media="html"
                            headerClass="prodCust" paramId="prodCust" maxLength="36"
                            sortProperty="prodCust" sortable="true"
                            titleKey="prod.prod.cust"><nobr><formatting:escape language="javascript,html">${row.prodCust}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="principal"
                            titleKey="prod.principal"/>
                        <display:column media="html"
                            headerClass="principal" paramId="principal" maxLength="36"
                            sortProperty="principal" sortable="true"
                            titleKey="prod.principal"><nobr><formatting:escape language="javascript,html">${row.principal}</formatting:escape></nobr></display:column>
                    </display:table>
                </c:if>
            </div>

        </html:form>

        <div id="pageHelpSection">
            <blockquote>
                <a href="" id="pageHelp" style="display:inline;" onclick="openWindow('<html:rewrite action="/Prod/ManageHelp"/>','onlinehelp',true,false,760,540); return false;">
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
	 <script type="text/javascript" src="../js/Prod.js"></script>
	 		<script type="text/javascript" src="../js/Customer.js"></script>
	 		<script type="text/javascript" src="../js/Peoples.js"></script>
	 	<script type="text/javascript" >
	  var url = getUrl()+ "services/ProdManageService";
	  var deletedata =  new Array();
	  var querydata =  new Array();
	  var pagenumber=1;
	  var pagesize=10;
	  var totalCount=0;
	  var queryvo=new ProdVOJs();
	  var oddstyle='';
	  var model = new dojox.grid.data.Table(null, querydata);
	  var urle = getUrl()+ "services/BasicManageService";        
						
//have set function's manageableAssociationEnds
	var pprodCust = new SOAPClientParameters();
	var itemsprodCust = new Array();  
		pprodCust.add('CustomerVO',new  CustomerVOJs()) ;
		pprodCust.add('pageNumber',0) ;
		pprodCust.add('pageSize',0) ;
	    pprodCust.add('orderBy','0') ;
	SOAPClient.invoke(getUrl()+ "services/"+"CustomerManageService","getCustomer", pprodCust, false,  function GetEnu_callBack(ul, soapResponse){      
				for(var i = 0; i < ul.length-1; i++){		
				  var ulo=ul[i];
				  itemsprodCust.push({name: ulo["ns:CustomerName"], value:ulo["ns:id"]});
				}                
	});       
	var prodCustStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemsprodCust }});

	function prodCustSet(id,value){
        	/*var itemselect=prodCustStore._getItemByIdentity(value);
        	if(itemselect!='undefined'&& itemselect!=null){
        	}*/
        }
	var pprincipal = new SOAPClientParameters();
	var itemsprincipal = new Array();  
		pprincipal.add('PeoplesVO',new  PeoplesVOJs()) ;
		pprincipal.add('pageNumber',0) ;
		pprincipal.add('pageSize',0) ;
	    pprincipal.add('orderBy','0') ;
	SOAPClient.invoke(getUrl()+ "services/"+"PeoplesManageService","getPeoples", pprincipal, false,  function GetEnu_callBack(ul, soapResponse){      
				for(var i = 0; i < ul.length-1; i++){		
				  var ulo=ul[i];
				  itemsprincipal.push({name: ulo["ns:PeoplesName"], value:ulo["ns:id"]});
				}                
	});       
	var principalStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemsprincipal }});

	function principalSet(id,value){
        	/*var itemselect=principalStore._getItemByIdentity(value);
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
      					  {name: i18nStr.prodName, field: 2,width: 10 , editor: mydojo.ValidationTextBox ,required:true ,maxLength:30}
					            					,   {name: i18nStr.code, field: 3,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					                 ,  {name: i18nStr.price,field:4, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
		    		,   {name: i18nStr.datef,field:5, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
				,   {name: i18nStr.datefTime,field:6, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
		        					,   {name: i18nStr.prodType, field: 7,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					      
//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
					 ,   {name: i18nStr.prodCust,field: 8,get:function(inRowIndex){ var str='';var strid;if(querydata[inRowIndex]!=undefined && querydata[inRowIndex][8]!=undefined){str=querydata[inRowIndex][8][2];strid=querydata[inRowIndex][8][1];} return str+'<button dojoType="dijit.form.Button" onclick="selectCustomer('+strid+','+inRowIndex+',8,0,event);"   iconClass="CustomerIcon">sel</button>';} ,width: 10 }
			//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
					 ,   {name: i18nStr.principal,field: 9,get:function(inRowIndex){ var str='';var strid;if(querydata[inRowIndex]!=undefined && querydata[inRowIndex][9]!=undefined){str=querydata[inRowIndex][9][2];strid=querydata[inRowIndex][9][1];} return str+'<button dojoType="dijit.form.Button" onclick="selectPeoples('+strid+','+inRowIndex+',9,0,event);"   iconClass="PeoplesIcon">sel</button>';} ,width: 10 }
			                                        ] ]
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
         var vobject=new ProdVOJs();
         vobject.id=thisCell[1];
              if(dojox.validate.isText(thisCell[2], {minlength: 1})){vobject.prodName=thisCell[2];
             }else{grid.getCell(grid.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;}//not null
 
               vobject.code=thisCell[3];
 
             if(dojox.validate.isInRange(thisCell[4],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[4];vobject.price=n;
             }else{grid.getCell(grid.model.fieldArray[4]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

 var  d=new DateTimeQuery();
             if(thisCell[5] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[5], grid.getCell(grid.model.fieldArray[5]).constraint);
             }else{grid.getCell(grid.model.fieldArray[5]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[6] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[6], grid.getCell(grid.model.fieldArray[6]).constraint);
             vobject.datef=d;
             }else{grid.getCell(grid.model.fieldArray[6]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null


               vobject.prodType=thisCell[7];
 

				var manageable=new CustomerVOJs();
			 if(querydata[i][8]!=''&&querydata[i][8]!=undefined){
             manageable.id=querydata[i][8][1];
             vobject.prodCust=manageable;
			 }else{
			 grid.getCell(grid.model.fieldArray[8]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
							var manageable=new PeoplesVOJs();
			 if(querydata[i][9]!=''&&querydata[i][9]!=undefined){
             manageable.id=querydata[i][9][1];
             vobject.principal=manageable;
			 }else{
			 grid.getCell(grid.model.fieldArray[9]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
			


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('ProdVO',vobject);
                SOAPClient.invoke(url, "createProd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                grid.model.setDatum(ul,i,1);
                });
	         }else{//modify row
                padd.add('ProdVO',vobject);
                SOAPClient.invoke(url, "updateProd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
        } }}//for
//submit delete
          for(var i=0;i<deletedata.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',deletedata[i]);
               SOAPClient.invoke(url, "deleteProd", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
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
              queryvo=new ProdVOJs();
	          if(queryprodName.getDisplayedValue()!="")queryvo.prodName=queryprodName.getDisplayedValue();//
	          if(querycode.getDisplayedValue()!="")queryvo.code=querycode.getDisplayedValue();//
              n=queryNumber_fun("price");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvo.price=n;}  
              d=queryDate_fun("datef");
              if(d==null){validstate=1;}else if(d.upSign!="%"){queryvo.datef=d;}
	          if(queryprodType.getDisplayedValue()!="")queryvo.prodType=queryprodType.getDisplayedValue();//
			
	if(queryprodCust.getDisplayedValue()!=""){
				var prodCustQuery= new CustomerVOJs();
				//prodCustQuery.ProdName=queryprodCust.getDisplayedValue();
				prodCustQuery.id=queryprodCust.getValue();
				queryvo.prodCust=prodCustQuery;
			  }
	if(queryprincipal.getDisplayedValue()!=""){
				var principalQuery= new PeoplesVOJs();
				//principalQuery.ProdName=queryprincipal.getDisplayedValue();
				principalQuery.id=queryprincipal.getValue();
				queryvo.principal=principalQuery;
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
      pu.add('ProdVO',queryvo) ;
      pu.add('pageNumber',pagenumber) ;
	    pu.add('pageSize',pagesize) ;
	    pu.add('orderBy',orderBy) ;
      SOAPClient.invoke(url,"getProd", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydata=new Array();
		   querydata=ProdVOtoArray_fun(ul,true);
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
		 document.getElementById('ProdId').value=querydata[e.rowIndex][1];
		 	 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addprodName").setValue(querydata[e.rowIndex][2]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addcode").setValue(querydata[e.rowIndex][3]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addprice").setValue(querydata[e.rowIndex][4]);
						 									 dijit.byId("adddatef").setValue(querydata[e.rowIndex][5].substring(0,10));
				  				  dijit.byId("adddatefTime").setValue(querydata[e.rowIndex][6].substring(11,16));
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addprodType").setValue(querydata[e.rowIndex][7]);
						 			 
					dijit.byId("addprodCust").setValue(querydata[e.rowIndex][8][1]);
			//dijit.byId("addprodCust").setDisplayedValue('');
					dijit.byId("addprincipal").setValue(querydata[e.rowIndex][8][1]);
			//dijit.byId("addprincipal").setDisplayedValue('');
			});     
}

 dojo.addOnLoad(init);   

	function selectCustomerFun(rep){
		querydata[selectCustomerInRow][noCustomer]=rep;
		grid.updateRow(selectCustomerInRow);		
	}
	function selectPeoplesFun(rep){
		querydata[selectPeoplesInRow][noPeoples]=rep;
		grid.updateRow(selectPeoplesInRow);		
	}
//addDiv---------------begin-------------------------------------
var addDivAdd = function(){
	 if(document.getElementById('queryDiv').style.display=='')document.getElementById('queryDiv').style.display='none';
	 if(document.getElementById('addDiv').style.display=='none')document.getElementById('addDiv').style.display='';
	 //Çå¿Õadd½çÃæ
										//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addprodName").setValue('');
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addcode").setValue('');
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addprice").setValue('');
															dijit.byId("adddatef").setValue('');
				dijit.byId("adddatefTime").setValue('');
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addprodType").setValue('');
										
			dijit.byId("addprodCust").setValue('');
	    dijit.byId("addprodCust").setDisplayedValue('');
			dijit.byId("addprincipal").setValue('');
	    dijit.byId("addprincipal").setDisplayedValue('');
		
	document.getElementById('ProdId').value='0';
	//document.getElementById('referTimeAdd1').value=dojo.date.locale.format(new Date(),{ datePattern: "yyyy-MM-dd", selector: "date"});
	//document.getElementById('referTimeAdd2').value=dojo.date.locale.format(new Date(),{ timePattern: "HH:mm", selector: "time"});
} 
function addDivSave(){
	var padd = new SOAPClientParameters2();
	var vobject=new ProdVOJs();
    vobject.id=document.getElementById('ProdId').value;
	var passAll=0;
										//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addprodName").isValid(true)){
					vobject.prodName=dijit.byId("addprodName").getValue();
				}else{
					passAll=1;
				}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addcode").isValid(true)){
					vobject.code=dijit.byId("addcode").getValue();
				}else{
					passAll=1;
				}
															if(dijit.byId("addprice").isValid(true)){
					var nprice=new NumberQuery();
					nprice.upNumber=dijit.byId("addprice").getValue();
					vobject.price=nprice;
				}else{
					passAll=1;
				}
															if(dijit.byId("adddatef").getValue() instanceof Date){ 
					if(dijit.byId("adddatefTime").getValue() instanceof Date){
						var ddatef=new DateTimeQuery();
						ddatef.upDate=dojo.date.locale.format(dijit.byId("adddatef").getValue(), dijit.byId("adddatef").constraints)+" "+dojo.date.locale.format(dijit.byId("adddatefTime").getValue(), dijit.byId("adddatefTime").constraints);
						vobject.datef=ddatef;
					}else{passAll=1;}
				}else{
					passAll=1;}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addprodType").isValid(true)){
					vobject.prodType=dijit.byId("addprodType").getValue();
				}else{
					passAll=1;
				}
										
	if(dijit.byId("addprodCust").isValid(true)){
		//vobject.prodCust=dijit.byId("addprodCust").getValue();
		var manageable=new CustomerVOJs();
		manageable.id=dijit.byId("addprodCust").getValue();
		vobject.prodCust=manageable;
	}else{
		passAll=1;
	}
	if(dijit.byId("addprincipal").isValid(true)){
		//vobject.principal=dijit.byId("addprincipal").getValue();
		var manageable=new PeoplesVOJs();
		manageable.id=dijit.byId("addprincipal").getValue();
		vobject.principal=manageable;
	}else{
		passAll=1;
	}
	
if(passAll==0){
		//var addrow='';
		var addrow=[];
														//addrow=addrow+","+vobject.prodName;
					addrow.push(vobject.prodName);
																					//addrow=addrow+","+vobject.code;
					addrow.push(vobject.code);
																					//addrow=addrow+","+vobject.price.upNumber;
					addrow.push(vobject.price.upNumber);
																					//addrow=addrow+","+vobject.datef.upDate+","+vobject.datef.upDate;
					addrow.push(dojo.date.locale.parse(vobject.datef.upDate,{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
					addrow.push(dojo.date.locale.parse(vobject.datef.upDate,{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
																					//addrow=addrow+","+vobject.prodType;
					addrow.push(vobject.prodType);
																			//addrow=addrow+","+CustomerVOtoArray_fun(vobject.prodCust,true);//addrow.push(CustomerVOtoArray_fun(vobject.prodCust,true));
			addrow.push([false,addprodCust.getValue(),addprodCust.getDisplayedValue()]);
					//addrow=addrow+","+PeoplesVOtoArray_fun(vobject.principal,true);//addrow.push(PeoplesVOtoArray_fun(vobject.principal,true));
			addrow.push([false,addprincipal.getValue(),addprincipal.getDisplayedValue()]);
			 if(vobject.id==0){//create new row
		padd.add('ProdVO',vobject);
		SOAPClient.invoke(url, "createProd", padd, false,  function GetEnu_callBack(ul, soapResponse){
		//addrow='false,ul'+addrow;
		addrow.splice(0,0,false,ul);
				console.log("addrow.lenght:"+addrow.length);
				console.log("addrow:"+addrow);
		grid.addRow(addrow ,grid.model.getRowCount());//grid.addRow([addrow]);
		});
	 }else{//modify row
		padd.add('ProdVO',vobject);
		SOAPClient.invoke(url, "updateProd", padd, false,  function GetEnu_callBack(ul, soapResponse){
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
               SOAPClient.invoke(url, "deleteProd", pdel, false,  function GetEnu_callBack(ul, soapResponse){
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
//totleinum=9
 //rowinum=3
 //addHeight=90
</script>
</head>	 
<body class="tundra">
		<div id="addDiv" style="margin-right: 0px;  height: 90px; display:none;" >
              <table align="center" width="100%" id="0" class="editorTable"  >
                <tr >
				<td align="center" style="{width:11%}" i18n="addNote" ></td>
                <td style="{width:22%}" ><input id="ProdId" style="{display:none}"  type="text"  /></td>
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
				<td align="right" i18n="prodName" >prodName:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addprodName"  jsId="addprodName"   dojoType="dijit.form.ValidationTextBox" required="true" />
							</td>
					<td align="right" i18n="code" >code:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addcode"  jsId="addcode"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
					<td align="right" i18n="price" >price:</td>
			<td align="left"  >
							<input type="text" class="editerNumber"   jsId="addprice"  id="addprice"  dojoType="mydojo.NumberTextBox" constraints="{min:0,max:9999999,places:4 }" />
			</td>
		</tr>	
                <tr>
				<td align="right" i18n="datef"  >datef:</td> 
			<td align="left" >
				<input class="editerDate"   jsId="adddatef" id="adddatef"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
				<input class="editerTime" jsId="adddatefTime" id="adddatefTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours.">
			</td>
					<td align="right" i18n="prodType" >prodType:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addprodType"  jsId="addprodType"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
	
//if (3==1)     
//    <--/tr-->
//end

//set ($inume =1) 
								<td align="right"  i18n="prodCust"  ></td>
					<td align="left" ><input  id="addprodCust"  jsId="addprodCust" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="prodCustStore" onchange="prodCustSet(0,arguments[0]);" /></td>
					</tr>
														<tr><td align="right"  i18n="principal"  ></td>
					<td align="left" ><input  id="addprincipal"  jsId="addprincipal" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="principalStore" onchange="principalSet(0,arguments[0]);" /></td>  
						    <td align="right"    ></td><td align="right"    ></td><td align="right"    ></td><td align="right"    ></td></tr>
</table></div>
<div id="queryDiv" style="margin-right: 0px;  height: 120px; display:none;" >
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
							<td align="right" i18n="prodName" >prodName:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="queryprodName"  jsId="queryprodName"   dojoType="dijit.form.TextBox"  />
													</td>
														<td align="right"  i18n="code" >code:</td>
						<td align="left"  colspan="3" >
													<input type="text" class="editerInput"  id="querycode"  jsId="querycode"   dojoType="dijit.form.TextBox"  />
												</td>  
											<td align="right"  i18n="price" >price:</td>
						<td align="left"  >
							<span id="querypriceImg0"  ><input type="text" class="editerNumber" jsId="queryprice"  id="queryprice"  dojoType="mydojo.NumberTextBox"  /></span>
							<span id="querypriceImg1"  style="{display:none}" ><input type="text" class="editerNumberSmall" jsId="queryprice1"  id="queryprice1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="querypriceImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="querypriceImgdown" >></span>
							<span id="querypriceImg2div" style="{display:none}"> <input type="text" class="editerNumberSmall"  jsId="queryprice2"  id="queryprice2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="querypriceImg" style="vertical-align:middle;margin-top:0px;">
							
						</td>  
								  </tr>
			                <tr>
							<td align="right" i18n="datef"  >datef:</td> 
						<td align="left"  colspan="3"><span id="querydatefImg0"  ><input class="editerDate"   jsId="querydatef" id="querydatef"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTime" jsId="querydatefTime" id="querydatefTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span id="querydatefImg1" style="{display:none}" ><input class="editerDateSmaller"   jsId="query1datef" id="query1datef"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query1datefTime" id="query1datefTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="querydatefImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="querydatefImgdown" >></span>
							<span id="querydatefImg2div" style="{display:none}"><input class="editerDateSmaller"   jsId="query2datef" id="query2datef"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query2datefTime" id="query2datefTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="querydatefImg" style="vertical-align:middle;margin-top:0px;">
						</td>
													<td align="right" colspan="2" ></td>
						<td align="right"  i18n="prodType" >prodType:</td>
						<td align="left"  >
							 								<input type="text" class="editerInput"  id="queryprodType"  jsId="queryprodType"   dojoType="dijit.form.TextBox"  />  
													</td></tr>
					

//if (!="over" && 1!=1)     
    <!--/tr-->
//end 
//set ($inume =1) 
								<tr><td align="right"  i18n="prodCust"  ></td>
					<td align="left" ><input  id="queryprodCust"  jsId="queryprodCust" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="prodCustStore"  /></td>  
														<td align="right"  i18n="principal"  ></td>
					<td align="left" ><!--colspan="3" --><input  id="queryprincipal"  jsId="queryprincipal" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="principalStore"  /></td>  
						    <td align="right"    ></td><td align="right"    ></td></tr>

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
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
