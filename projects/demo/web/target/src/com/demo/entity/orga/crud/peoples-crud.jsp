<%@ include file="/taglib-imports.jspf" %>
<tiles:insert definition="main.layout">

    <tiles:put name="title" type="string">
        <bean:message key="peoples.page.title"/>
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

            function setAction(crud) { document.forms['managePeoplesForm'].elements['crud'].value = crud; }

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

            function setFields(peopleName,peoplePassword,peopleStatus,birthDay,sex,birthPlace,address,tel,engageMode,engageDate,gradeEnum,remark,id,form)
            {
                form.elements["peopleName"].value = peopleName;
                form.elements["peoplePassword"].value = peoplePassword;
                form.elements["peopleStatus"].value = peopleStatus;
                form.elements["birthDayAsString"].value = birthDay;
                form.elements["sex"].value = sex;
                form.elements["birthPlace"].value = birthPlace;
                form.elements["address"].value = address;
                form.elements["tel"].value = tel;
                form.elements["engageMode"].value = engageMode;
                form.elements["engageDateAsString"].value = engageDate;
                form.elements["gradeEnum"].value = gradeEnum;
                form.elements["remark"].value = remark;
                form.elements["id"].value = id;
            }
        //-->
        </script>
    </tiles:put>

    <tiles:put name="body" type="string">

        <div>
            <h1><bean:message key="peoples.page.title"/></h1>
        </div>

        <html:form styleId="managePeoplesForm" action="/Peoples/Manage" method="post">
            <input type="hidden" name="crud" value=""/>
            <div id="criteria">
                <c:if test="${!empty manageableForm}">
                    <table>
                        <tr>
                            <td><nobr><bean:message key="peoples.people.name"/> <div class="important">*</div></nobr></td>
                            <td>
                                <html:text name="manageableForm" property="peopleName" styleClass="criteriaField" styleId="peopleName"/>
                            </td>
                        </tr>
                        <tr>
                            <td><bean:message key="peoples.people.password"/></td>
                            <td>
                                <html:text name="manageableForm" property="peoplePassword" styleClass="criteriaField" styleId="peoplePassword"/>
                            </td>
                        </tr>
                        <tr>
                            <td><bean:message key="peoples.people.status"/></td>
                            <td>
                                <html:text name="manageableForm" property="peopleStatus" styleClass="criteriaField" styleId="peopleStatus"/>
                            </td>
                        </tr>
                        <tr>
                            <td><bean:message key="peoples.birth.day"/></td>
                            <td>
                                <html:text name="manageableForm" property="birthDayAsString" styleClass="criteriaField" styleId="birthDay"/>
                                <html:img page="/layout/calendar/calendar.gif" styleId="birthDay_trigger" styleClass="calendar"/>
                                <script type="text/javascript">
                                //<!--
                                    Calendar.setup({
                                        inputField     :    "birthDay",
                                        ifFormat       :    "%m/%d/%Y",
                                        daFormat       :    "%m/%d/%Y",
                                        showsTime      :    false,
                                        button         :    "birthDay_trigger",
                                        singleClick    :    true
                                    });
                                //-->
                                </script>
                            </td>
                        </tr>
                        <tr>
                            <td><nobr><bean:message key="peoples.sex"/> <div class="important">*</div></nobr></td>
                            <td>
                                <html:text name="manageableForm" property="sex" styleClass="criteriaField" styleId="sex"/>
                            </td>
                        </tr>
                        <tr>
                            <td><bean:message key="peoples.birth.place"/></td>
                            <td>
                                <html:text name="manageableForm" property="birthPlace" styleClass="criteriaField" styleId="birthPlace"/>
                            </td>
                        </tr>
                        <tr>
                            <td><bean:message key="peoples.address"/></td>
                            <td>
                                <html:text name="manageableForm" property="address" styleClass="criteriaField" styleId="address"/>
                            </td>
                        </tr>
                        <tr>
                            <td><bean:message key="peoples.tel"/></td>
                            <td>
                                <html:text name="manageableForm" property="tel" styleClass="criteriaField" styleId="tel"/>
                            </td>
                        </tr>
                        <tr>
                            <td><bean:message key="peoples.engage.mode"/></td>
                            <td>
                                <html:text name="manageableForm" property="engageMode" styleClass="criteriaField" styleId="engageMode"/>
                            </td>
                        </tr>
                        <tr>
                            <td><bean:message key="peoples.engage.date"/></td>
                            <td>
                                <html:text name="manageableForm" property="engageDateAsString" styleClass="criteriaField" styleId="engageDate"/>
                                <html:img page="/layout/calendar/calendar.gif" styleId="engageDate_trigger" styleClass="calendar"/>
                                <script type="text/javascript">
                                //<!--
                                    Calendar.setup({
                                        inputField     :    "engageDate",
                                        ifFormat       :    "%m/%d/%Y",
                                        daFormat       :    "%m/%d/%Y",
                                        showsTime      :    false,
                                        button         :    "engageDate_trigger",
                                        singleClick    :    true
                                    });
                                //-->
                                </script>
                            </td>
                        </tr>
                        <tr>
                            <td><bean:message key="peoples.grade.enum"/></td>
                            <td>
                                <html:text name="manageableForm" property="gradeEnum" styleClass="criteriaField" styleId="gradeEnum"/>
                            </td>
                        </tr>
                        <tr>
                            <td><bean:message key="peoples.remark"/></td>
                            <td>
                                <html:text name="manageableForm" property="remark" styleClass="criteriaField" styleId="remark"/>
                            </td>
                        </tr>
                    <html:hidden name="manageableForm" property="id"/>
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
        <select onchange="document.location=this.options[this.selectedIndex].value+'?ref_Peoples='+this.form.elements['id'].value;">
            <option value="<html:rewrite page="/Contact/Manage.do"/>"><bean:message key="contact"/></option>
            <option value="<html:rewrite page="/Customer/Manage.do"/>"><bean:message key="customer"/></option>
            <option value="<html:rewrite page="/Enumeration/Manage.do"/>"><bean:message key="enumeration"/></option>
            <option value="<html:rewrite page="/OrderRowTask/Manage.do"/>"><bean:message key="order.row.task"/></option>
            <option value="<html:rewrite page="/OrderRowd/Manage.do"/>"><bean:message key="order.rowd"/></option>
            <option value="<html:rewrite page="/Orderd/Manage.do"/>"><bean:message key="orderd"/></option>
            <option value="<html:rewrite page="/Orga/Manage.do"/>"><bean:message key="orga"/></option>
            <option value="<html:rewrite page="/OrgaPeoples/Manage.do"/>"><bean:message key="orga.peoples"/></option>
            <option value="<html:rewrite page="/Payment/Manage.do"/>"><bean:message key="payment"/></option>
            <option selected="selected" value="<html:rewrite page="/Peoples/Manage.do"/>"><bean:message key="peoples"/></option>
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
                            <fmt:formatDate var="birthDayFormatted" value="${row.birthDay}" pattern="MM/dd/yyyy"/>
                            <fmt:formatDate var="engageDateFormatted" value="${row.engageDate}" pattern="MM/dd/yyyy"/>
                            <nobr>
                                <input type="radio" name="_copy" onclick="enableUpdate(true);setFields('<formatting:escape language="javascript">${row.peopleName}</formatting:escape>','<formatting:escape language="javascript">${row.peoplePassword}</formatting:escape>','<formatting:escape language="javascript">${row.peopleStatus}</formatting:escape>','<formatting:escape language="javascript">${birthDayFormatted}</formatting:escape>','<formatting:escape language="javascript">${row.sex}</formatting:escape>','<formatting:escape language="javascript">${row.birthPlace}</formatting:escape>','<formatting:escape language="javascript">${row.address}</formatting:escape>','<formatting:escape language="javascript">${row.tel}</formatting:escape>','<formatting:escape language="javascript">${row.engageMode}</formatting:escape>','<formatting:escape language="javascript">${engageDateFormatted}</formatting:escape>','<formatting:escape language="javascript">${row.gradeEnum}</formatting:escape>','<formatting:escape language="javascript">${row.remark}</formatting:escape>','<formatting:escape language="javascript">${row.id}</formatting:escape>',this.form);"/>
                                <input type="checkbox" name="selectedRows" value="${row.id}" onclick="verifyEnableDelete(this);"/>
                            </nobr>
                        </display:column>
                        <display:column media="xml csv excel pdf"
                            property="peopleName"
                            titleKey="peoples.people.name"/>
                        <display:column media="html"
                            headerClass="peopleName" paramId="peopleName" maxLength="36"
                            sortProperty="peopleName" sortable="true"
                            titleKey="peoples.people.name"><nobr><formatting:escape language="javascript,html">${row.peopleName}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="peoplePassword"
                            titleKey="peoples.people.password"/>
                        <display:column media="html"
                            headerClass="peoplePassword" paramId="peoplePassword" maxLength="36"
                            sortProperty="peoplePassword" sortable="true"
                            titleKey="peoples.people.password"><nobr><formatting:escape language="javascript,html">${row.peoplePassword}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="peopleStatus"
                            titleKey="peoples.people.status"/>
                        <display:column media="html"
                            headerClass="peopleStatus" paramId="peopleStatus" maxLength="36"
                            sortProperty="peopleStatus" sortable="true"
                            titleKey="peoples.people.status"><nobr><formatting:escape language="javascript,html">${row.peopleStatus}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf" titleKey="peoples.birth.day">${birthDayFormatted}</display:column>
                        <display:column media="html"
                            headerClass="birthDay" paramId="birthDay" maxLength="36"
                            sortProperty="birthDay" sortable="true"
                            titleKey="peoples.birth.day"><nobr>${birthDayFormatted}</nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="sex"
                            titleKey="peoples.sex"/>
                        <display:column media="html"
                            headerClass="sex" paramId="sex" maxLength="36"
                            sortProperty="sex" sortable="true"
                            titleKey="peoples.sex"><nobr><formatting:escape language="javascript,html">${row.sex}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="birthPlace"
                            titleKey="peoples.birth.place"/>
                        <display:column media="html"
                            headerClass="birthPlace" paramId="birthPlace" maxLength="36"
                            sortProperty="birthPlace" sortable="true"
                            titleKey="peoples.birth.place"><nobr><formatting:escape language="javascript,html">${row.birthPlace}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="address"
                            titleKey="peoples.address"/>
                        <display:column media="html"
                            headerClass="address" paramId="address" maxLength="36"
                            sortProperty="address" sortable="true"
                            titleKey="peoples.address"><nobr><formatting:escape language="javascript,html">${row.address}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="tel"
                            titleKey="peoples.tel"/>
                        <display:column media="html"
                            headerClass="tel" paramId="tel" maxLength="36"
                            sortProperty="tel" sortable="true"
                            titleKey="peoples.tel"><nobr><formatting:escape language="javascript,html">${row.tel}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="engageMode"
                            titleKey="peoples.engage.mode"/>
                        <display:column media="html"
                            headerClass="engageMode" paramId="engageMode" maxLength="36"
                            sortProperty="engageMode" sortable="true"
                            titleKey="peoples.engage.mode"><nobr><formatting:escape language="javascript,html">${row.engageMode}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf" titleKey="peoples.engage.date">${engageDateFormatted}</display:column>
                        <display:column media="html"
                            headerClass="engageDate" paramId="engageDate" maxLength="36"
                            sortProperty="engageDate" sortable="true"
                            titleKey="peoples.engage.date"><nobr>${engageDateFormatted}</nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="gradeEnum"
                            titleKey="peoples.grade.enum"/>
                        <display:column media="html"
                            headerClass="gradeEnum" paramId="gradeEnum" maxLength="36"
                            sortProperty="gradeEnum" sortable="true"
                            titleKey="peoples.grade.enum"><nobr><formatting:escape language="javascript,html">${row.gradeEnum}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="remark"
                            titleKey="peoples.remark"/>
                        <display:column media="html"
                            headerClass="remark" paramId="remark" maxLength="36"
                            sortProperty="remark" sortable="true"
                            titleKey="peoples.remark"><nobr><formatting:escape language="javascript,html">${row.remark}</formatting:escape></nobr></display:column>
                    </display:table>
                </c:if>
            </div>

        </html:form>

        <div id="pageHelpSection">
            <blockquote>
                <a href="" id="pageHelp" style="display:inline;" onclick="openWindow('<html:rewrite action="/Peoples/ManageHelp"/>','onlinehelp',true,false,760,540); return false;">
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
	 <script type="text/javascript" src="../js/Peoples.js"></script>
	 	<script type="text/javascript" >
	  var url = getUrl()+ "services/PeoplesManageService";
	  var deletedata =  new Array();
	  var querydata =  new Array();
	  var pagenumber=1;
	  var pagesize=10;
	  var totalCount=0;
	  var queryvo=new PeoplesVOJs();
	  var oddstyle='';
	  var model = new dojox.grid.data.Table(null, querydata);
	  var urle = getUrl()+ "services/BasicManageService";        
														var pgradeEnum = new SOAPClientParameters();
			pgradeEnum.add('eType','gradeEnum');
			var itemgradeEnum = new Array();
			var itemgradeEnumOption = new Array();
				SOAPClient.invoke(urle, "getEnumerationByType", pgradeEnum, false,  function GetEnu_callBack(ul, soapResponse){   
				for(var i = 0; i < ul.length; i++){		
				  var ulo=ul[i];
				  itemgradeEnum.push({name: ulo["ns:fieldName"], value:ulo["ns:fieldName"]});
				  itemgradeEnumOption.push(ulo["ns:fieldName"]);
				}                
			});       
			var gradeEnumStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemgradeEnum}}); 
			
//have set function's manageableAssociationEnds

 
//ÏÈÅÐ¶Ï±íµÄ×Ö¶ÎÊýÊÇ·ñ´óÓÚ12£¬Èç¹û´óÓÚ12£¬ÔòÉú³Éµ¥ÐÐlayoutºÍÕÛµþlayoutÁ½¸östructure
//enumeration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
																																																					
var layoutSingleRow=[{
          
 //¸ù¾ÝfieldµÄÖµ£¬ÒÀ¾ÝÄ¬ÈÏµÄË³Ðò£¬´ÓjsÖÐµÄtoArray×ª»»·½·¨·µ»ØµÄquerydateÖÐÈ¡Êý¾Ý
	   
				 cells: [ [
							//{name: 'Ñ¡Ôñ', width: 3, get:getChoise},
						   { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
						   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
      					  {name: i18nStr.peopleName, field: 2,width: 10 , editor: mydojo.ValidationTextBox ,required:true ,maxLength:30}
					            					,   {name: i18nStr.peoplePassword, field: 3,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					            					,   {name: i18nStr.peopleStatus, field: 4,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					        		,   {name: i18nStr.birthDay,field:5, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
				,   {name: i18nStr.birthDayTime,field:6, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
		        					,   {name: i18nStr.sex, field: 7,width: 10 , editor: mydojo.ValidationTextBox ,required:true ,maxLength:30}
					            					,   {name: i18nStr.birthPlace, field: 8,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					            					,   {name: i18nStr.address, field: 9,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					            					,   {name: i18nStr.tel, field: 10,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					            					,   {name: i18nStr.engageMode, field: 11,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					        		,   {name: i18nStr.engageDate,field:12, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
				,   {name: i18nStr.engageDateTime,field:13, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
		        	    ,   {name: i18nStr.gradeEnum, field: 14,width: 10 , editor: mydojo.FilteringSelect ,options:itemgradeEnumOption,required:false ,invalidMessage:'can not be empty'}
			        				    ,   {name: i18nStr.remark, field: 15,width: 10, editor: dojox.grid.editors.Editor,required:false, editorToolbar: true  }
					      
                                        ] ]
                           }]; 

  //rowinum=7
var layoutTwoRow=[{
          
 //¸ù¾ÝfieldµÄÖµ£¬ÒÀ¾ÝÄ¬ÈÏµÄË³Ðò£¬´ÓjsÖÐµÄtoArray×ª»»·½·¨·µ»ØµÄquerydateÖÐÈ¡Êý¾Ý
	   
				 cells: [
                      [
						{ name: 'choise', width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },
						{ name: i18nStr.detail, width: 3, get: getCheckPeoples, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
										  															  {name: i18nStr.peopleName, field: 2,width: 10 , editor: mydojo.ValidationTextBox ,required:true ,maxLength:30}
																		  			//--------------  if (3 == 6)
														  															,   {name: i18nStr.peoplePassword, field: 3,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																		  			//--------------  if (4 == 6)
														  															,   {name: i18nStr.peopleStatus, field: 4,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																		  			//--------------  if (5 == 6)
														  					,   {name: i18nStr.birthDay,field:5, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
														 ,   {name: i18nStr.birthDayTime,field:6, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
					 					 ]
							  			//--------------  if (7 == 6)
								                     //----------------(inum:7)  (rowinum: 6)
									                     //----------------(inum:7)  (rowinum: 6)
									                     //----------------(inum:7)  (rowinum: 6)
									                     //----------------(inum:7)  (rowinum: 6)
									                     //----------------(inum:7)  (rowinum: 6)
									                     //----------------(inum:7)  (rowinum: 6)
									                     //----------------(inum:7)  (rowinum: 6)
									                     //----------------(inum:7)  (rowinum: 6)
									                     //----------------(inum:7)  (rowinum: 6)
								
		,[
	 //  22222222222inum= 2   inum2=7
																																												  																		  {name: i18nStr.sex, field: 7,width: 10 , editor: mydojo.ValidationTextBox ,required:true ,maxLength:30}
																					  														  																		,   {name: i18nStr.birthPlace, field: 8,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																					  														  																		,   {name: i18nStr.address, field: 9,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																					  														  																		,   {name: i18nStr.tel, field: 10,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																					  														  																		,   {name: i18nStr.engageMode, field: 11,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																					  														  					,   {name: i18nStr.engageDate,field:12, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
										,   {name: i18nStr.engageDateTime,field:13, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
								  														  											,   {name: i18nStr.gradeEnum, field: 14,width: 10 , editor: mydojo.FilteringSelect ,options:itemgradeEnumOption,required:false ,invalidMessage:'can not be empty'}
														  														  																		,   {name: i18nStr.remark, field: 15,width: 10, editor: dojox.grid.editors.Editor,required:false, editorToolbar: true  }
																					  														
	 	
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
         var vobject=new PeoplesVOJs();
         vobject.id=thisCell[1];
              if(dojox.validate.isText(thisCell[2], {minlength: 1})){vobject.peopleName=thisCell[2];
             }else{grid.getCell(grid.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;}//not null
 
               vobject.peoplePassword=thisCell[3];
 
               vobject.peopleStatus=thisCell[4];
 
 var  d=new DateTimeQuery();
             if(thisCell[5] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[5], grid.getCell(grid.model.fieldArray[5]).constraint);
             }else{grid.getCell(grid.model.fieldArray[5]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[6] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[6], grid.getCell(grid.model.fieldArray[6]).constraint);
             vobject.birthDay=d;
             }else{grid.getCell(grid.model.fieldArray[6]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null


              if(dojox.validate.isText(thisCell[7], {minlength: 1})){vobject.sex=thisCell[7];
             }else{grid.getCell(grid.model.fieldArray[7]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;}//not null
 
               vobject.birthPlace=thisCell[8];
 
               vobject.address=thisCell[9];
 
               vobject.tel=thisCell[10];
 
               vobject.engageMode=thisCell[11];
 
 var  d=new DateTimeQuery();
             if(thisCell[12] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[12], grid.getCell(grid.model.fieldArray[12]).constraint);
             }else{grid.getCell(grid.model.fieldArray[12]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[13] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[13], grid.getCell(grid.model.fieldArray[13]).constraint);
             vobject.engageDate=d;
             }else{grid.getCell(grid.model.fieldArray[13]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null


               vobject.gradeEnum=thisCell[14];
 
               vobject.remark=thisCell[15];
 




       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('PeoplesVO',vobject);
                SOAPClient.invoke(url, "createPeoples", padd, false,  function GetEnu_callBack(ul, soapResponse){
                grid.model.setDatum(ul,i,1);
                });
	         }else{//modify row
                padd.add('PeoplesVO',vobject);
                SOAPClient.invoke(url, "updatePeoples", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
        } }}//for
//submit delete
          for(var i=0;i<deletedata.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',deletedata[i]);
               SOAPClient.invoke(url, "deletePeoples", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
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
              queryvo=new PeoplesVOJs();
	          if(querypeopleName.getDisplayedValue()!="")queryvo.peopleName=querypeopleName.getDisplayedValue();//
	          if(querypeoplePassword.getDisplayedValue()!="")queryvo.peoplePassword=querypeoplePassword.getDisplayedValue();//
	          if(querypeopleStatus.getDisplayedValue()!="")queryvo.peopleStatus=querypeopleStatus.getDisplayedValue();//
              d=queryDate_fun("birthDay");
              if(d==null){validstate=1;}else if(d.upSign!="%"){queryvo.birthDay=d;}
	          if(querysex.getDisplayedValue()!="")queryvo.sex=querysex.getDisplayedValue();//
	          if(querybirthPlace.getDisplayedValue()!="")queryvo.birthPlace=querybirthPlace.getDisplayedValue();//
	          if(queryaddress.getDisplayedValue()!="")queryvo.address=queryaddress.getDisplayedValue();//
	          if(querytel.getDisplayedValue()!="")queryvo.tel=querytel.getDisplayedValue();//
	          if(queryengageMode.getDisplayedValue()!="")queryvo.engageMode=queryengageMode.getDisplayedValue();//
              d=queryDate_fun("engageDate");
              if(d==null){validstate=1;}else if(d.upSign!="%"){queryvo.engageDate=d;}
	          if(querygradeEnum.getDisplayedValue()!="")queryvo.gradeEnum=querygradeEnum.getDisplayedValue();//
	          if(queryremark.getDisplayedValue()!="")queryvo.remark=queryremark.getDisplayedValue();//
			

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
      pu.add('PeoplesVO',queryvo) ;
      pu.add('pageNumber',pagenumber) ;
	    pu.add('pageSize',pagesize) ;
	    pu.add('orderBy',orderBy) ;
      SOAPClient.invoke(url,"getPeoples", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydata=new Array();
		   querydata=PeoplesVOtoArray_fun(ul,true);
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
		 document.getElementById('PeoplesId').value=querydata[e.rowIndex][1];
		 	 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addpeopleName").setValue(querydata[e.rowIndex][2]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addpeoplePassword").setValue(querydata[e.rowIndex][3]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addpeopleStatus").setValue(querydata[e.rowIndex][4]);
						 									 dijit.byId("addbirthDay").setValue(querydata[e.rowIndex][5].substring(0,10));
				  				  dijit.byId("addbirthDayTime").setValue(querydata[e.rowIndex][6].substring(11,16));
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addsex").setValue(querydata[e.rowIndex][7]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addbirthPlace").setValue(querydata[e.rowIndex][8]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addaddress").setValue(querydata[e.rowIndex][9]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addtel").setValue(querydata[e.rowIndex][10]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addengageMode").setValue(querydata[e.rowIndex][11]);
						 									 dijit.byId("addengageDate").setValue(querydata[e.rowIndex][12].substring(0,10));
				  				  dijit.byId("addengageDateTime").setValue(querydata[e.rowIndex][13].substring(11,16));
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addgradeEnum").setValue(querydata[e.rowIndex][14]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addremark").setValue(querydata[e.rowIndex][15]);
						 			 
			});     
}

 dojo.addOnLoad(init);   

//addDiv---------------begin-------------------------------------
var addDivAdd = function(){
	 if(document.getElementById('queryDiv').style.display=='')document.getElementById('queryDiv').style.display='none';
	 if(document.getElementById('addDiv').style.display=='none')document.getElementById('addDiv').style.display='';
	 //Çå¿Õadd½çÃæ
										//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addpeopleName").setValue('');
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addpeoplePassword").setValue('');
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addpeopleStatus").setValue('');
															dijit.byId("addbirthDay").setValue('');
				dijit.byId("addbirthDayTime").setValue('');
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addsex").setValue('');
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addbirthPlace").setValue('');
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addaddress").setValue('');
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addtel").setValue('');
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addengageMode").setValue('');
															dijit.byId("addengageDate").setValue('');
				dijit.byId("addengageDateTime").setValue('');
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addgradeEnum").setValue('');
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addremark").setValue('');
										
		
	document.getElementById('PeoplesId').value='0';
	//document.getElementById('referTimeAdd1').value=dojo.date.locale.format(new Date(),{ datePattern: "yyyy-MM-dd", selector: "date"});
	//document.getElementById('referTimeAdd2').value=dojo.date.locale.format(new Date(),{ timePattern: "HH:mm", selector: "time"});
} 
function addDivSave(){
	var padd = new SOAPClientParameters2();
	var vobject=new PeoplesVOJs();
    vobject.id=document.getElementById('PeoplesId').value;
	var passAll=0;
										//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addpeopleName").isValid(true)){
					vobject.peopleName=dijit.byId("addpeopleName").getValue();
				}else{
					passAll=1;
				}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addpeoplePassword").isValid(true)){
					vobject.peoplePassword=dijit.byId("addpeoplePassword").getValue();
				}else{
					passAll=1;
				}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addpeopleStatus").isValid(true)){
					vobject.peopleStatus=dijit.byId("addpeopleStatus").getValue();
				}else{
					passAll=1;
				}
															if(dijit.byId("addbirthDay").getValue() instanceof Date){ 
					if(dijit.byId("addbirthDayTime").getValue() instanceof Date){
						var dbirthDay=new DateTimeQuery();
						dbirthDay.upDate=dojo.date.locale.format(dijit.byId("addbirthDay").getValue(), dijit.byId("addbirthDay").constraints)+" "+dojo.date.locale.format(dijit.byId("addbirthDayTime").getValue(), dijit.byId("addbirthDayTime").constraints);
						vobject.birthDay=dbirthDay;
					}else{passAll=1;}
				}else{
					passAll=1;}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addsex").isValid(true)){
					vobject.sex=dijit.byId("addsex").getValue();
				}else{
					passAll=1;
				}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addbirthPlace").isValid(true)){
					vobject.birthPlace=dijit.byId("addbirthPlace").getValue();
				}else{
					passAll=1;
				}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addaddress").isValid(true)){
					vobject.address=dijit.byId("addaddress").getValue();
				}else{
					passAll=1;
				}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addtel").isValid(true)){
					vobject.tel=dijit.byId("addtel").getValue();
				}else{
					passAll=1;
				}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addengageMode").isValid(true)){
					vobject.engageMode=dijit.byId("addengageMode").getValue();
				}else{
					passAll=1;
				}
															if(dijit.byId("addengageDate").getValue() instanceof Date){ 
					if(dijit.byId("addengageDateTime").getValue() instanceof Date){
						var dengageDate=new DateTimeQuery();
						dengageDate.upDate=dojo.date.locale.format(dijit.byId("addengageDate").getValue(), dijit.byId("addengageDate").constraints)+" "+dojo.date.locale.format(dijit.byId("addengageDateTime").getValue(), dijit.byId("addengageDateTime").constraints);
						vobject.engageDate=dengageDate;
					}else{passAll=1;}
				}else{
					passAll=1;}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addgradeEnum").isValid(true)){
					vobject.gradeEnum=dijit.byId("addgradeEnum").getValue();
				}else{
					passAll=1;
				}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addremark").isValid(true)){
					vobject.remark=dijit.byId("addremark").getValue();
				}else{
					passAll=1;
				}
										
	
if(passAll==0){
		//var addrow='';
		var addrow=[];
														//addrow=addrow+","+vobject.peopleName;
					addrow.push(vobject.peopleName);
																					//addrow=addrow+","+vobject.peoplePassword;
					addrow.push(vobject.peoplePassword);
																					//addrow=addrow+","+vobject.peopleStatus;
					addrow.push(vobject.peopleStatus);
																					//addrow=addrow+","+vobject.birthDay.upDate+","+vobject.birthDay.upDate;
					addrow.push(dojo.date.locale.parse(vobject.birthDay.upDate,{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
					addrow.push(dojo.date.locale.parse(vobject.birthDay.upDate,{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
																					//addrow=addrow+","+vobject.sex;
					addrow.push(vobject.sex);
																					//addrow=addrow+","+vobject.birthPlace;
					addrow.push(vobject.birthPlace);
																					//addrow=addrow+","+vobject.address;
					addrow.push(vobject.address);
																					//addrow=addrow+","+vobject.tel;
					addrow.push(vobject.tel);
																					//addrow=addrow+","+vobject.engageMode;
					addrow.push(vobject.engageMode);
																					//addrow=addrow+","+vobject.engageDate.upDate+","+vobject.engageDate.upDate;
					addrow.push(dojo.date.locale.parse(vobject.engageDate.upDate,{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
					addrow.push(dojo.date.locale.parse(vobject.engageDate.upDate,{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
																					//addrow=addrow+","+vobject.gradeEnum;
					addrow.push(vobject.gradeEnum);
																					//addrow=addrow+","+vobject.remark;
					addrow.push(vobject.remark);
																	 if(vobject.id==0){//create new row
		padd.add('PeoplesVO',vobject);
		SOAPClient.invoke(url, "createPeoples", padd, false,  function GetEnu_callBack(ul, soapResponse){
		//addrow='false,ul'+addrow;
		addrow.splice(0,0,false,ul);
				console.log("addrow.lenght:"+addrow.length);
				console.log("addrow:"+addrow);
		grid.addRow(addrow ,grid.model.getRowCount());//grid.addRow([addrow]);
		});
	 }else{//modify row
		padd.add('PeoplesVO',vobject);
		SOAPClient.invoke(url, "updatePeoples", padd, false,  function GetEnu_callBack(ul, soapResponse){
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
               SOAPClient.invoke(url, "deletePeoples", pdel, false,  function GetEnu_callBack(ul, soapResponse){
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
//totleinum=15
 //rowinum=5
 //addHeight=130
</script>
</head>	 
<body class="tundra">
		<div id="addDiv" style="margin-right: 0px;  height: 130px; display:none;" >
              <table align="center" width="100%" id="0" class="editorTable"  >
                <tr >
				<td align="center" style="{width:11%}" i18n="addNote" ></td>
                <td style="{width:22%}" ><input id="PeoplesId" style="{display:none}"  type="text"  /></td>
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
				<td align="right" i18n="peopleName" >peopleName:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addpeopleName"  jsId="addpeopleName"   dojoType="dijit.form.ValidationTextBox" required="true" />
							</td>
					<td align="right" i18n="peoplePassword" >peoplePassword:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addpeoplePassword"  jsId="addpeoplePassword"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
					<td align="right" i18n="peopleStatus" >peopleStatus:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addpeopleStatus"  jsId="addpeopleStatus"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
		</tr>	
                <tr>
				<td align="right" i18n="birthDay"  >birthDay:</td> 
			<td align="left" >
				<input class="editerDate"   jsId="addbirthDay" id="addbirthDay"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
				<input class="editerTime" jsId="addbirthDayTime" id="addbirthDayTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours.">
			</td>
					<td align="right" i18n="sex" >sex:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addsex"  jsId="addsex"   dojoType="dijit.form.ValidationTextBox" required="true" />
							</td>
					<td align="right" i18n="birthPlace" >birthPlace:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addbirthPlace"  jsId="addbirthPlace"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
		</tr>	
                <tr>
				<td align="right" i18n="address" >address:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addaddress"  jsId="addaddress"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
					<td align="right" i18n="tel" >tel:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addtel"  jsId="addtel"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
					<td align="right" i18n="engageMode" >engageMode:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addengageMode"  jsId="addengageMode"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
		</tr>	
                <tr>
				<td align="right" i18n="engageDate"  >engageDate:</td> 
			<td align="left" >
				<input class="editerDate"   jsId="addengageDate" id="addengageDate"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
				<input class="editerTime" jsId="addengageDateTime" id="addengageDateTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours.">
			</td>
					<td align="right" i18n="gradeEnum" >gradeEnum:</td>
			<td align="left"  >
									<input  id="addgradeEnum"  jsId="addgradeEnum" class="editerInput"  dojoType="dijit.form.myFilteringSelect" store="gradeEnumStore"  />
							</td>
					<td align="right" i18n="remark" >remark:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addremark"  jsId="addremark"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
		</tr>	

//if (1==1)     
//    <--/tr-->
//end

//set ($inume =1) 
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
							<td align="right" i18n="peopleName" >peopleName:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="querypeopleName"  jsId="querypeopleName"   dojoType="dijit.form.TextBox"  />
													</td>
														<td align="right"  i18n="peoplePassword" >peoplePassword:</td>
						<td align="left"  colspan="3" >
													<input type="text" class="editerInput"  id="querypeoplePassword"  jsId="querypeoplePassword"   dojoType="dijit.form.TextBox"  />
												</td>  
													<td align="right"  i18n="peopleStatus" >peopleStatus:</td>
						<td align="left"  >
													<input type="text" class="editerInput"  id="querypeopleStatus"  jsId="querypeopleStatus"   dojoType="dijit.form.TextBox"  />
												</td>  
										  </tr>
			                <tr>
							<td align="right" i18n="birthDay"  >birthDay:</td> 
						<td align="left"  colspan="3"><span id="querybirthDayImg0"  ><input class="editerDate"   jsId="querybirthDay" id="querybirthDay"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTime" jsId="querybirthDayTime" id="querybirthDayTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span id="querybirthDayImg1" style="{display:none}" ><input class="editerDateSmaller"   jsId="query1birthDay" id="query1birthDay"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query1birthDayTime" id="query1birthDayTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="querybirthDayImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="querybirthDayImgdown" >></span>
							<span id="querybirthDayImg2div" style="{display:none}"><input class="editerDateSmaller"   jsId="query2birthDay" id="query2birthDay"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query2birthDayTime" id="query2birthDayTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="querybirthDayImg" style="vertical-align:middle;margin-top:0px;">
						</td>
													<td align="right" colspan="2" ></td>
						<td align="right"  i18n="sex" >sex:</td>
						<td align="left"  >
							 								<input type="text" class="editerInput"  id="querysex"  jsId="querysex"   dojoType="dijit.form.TextBox"  />  
													</td></tr>
					                <tr>
							<td align="right" i18n="birthPlace" >birthPlace:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="querybirthPlace"  jsId="querybirthPlace"   dojoType="dijit.form.TextBox"  />
													</td>
														<td align="right"  i18n="address" >address:</td>
						<td align="left"  colspan="3" >
													<input type="text" class="editerInput"  id="queryaddress"  jsId="queryaddress"   dojoType="dijit.form.TextBox"  />
												</td>  
													<td align="right"  i18n="tel" >tel:</td>
						<td align="left"  >
													<input type="text" class="editerInput"  id="querytel"  jsId="querytel"   dojoType="dijit.form.TextBox"  />
												</td>  
										  </tr>
			                <tr>
							<td align="right" i18n="engageMode" >engageMode:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="queryengageMode"  jsId="queryengageMode"   dojoType="dijit.form.TextBox"  />
													</td>
																<td align="right"  i18n="engageDate" >engageDate:</td>
						<td align="left"   colspan="5"><span id="queryengageDateImg0"  ><input class="editerDate"   jsId="queryengageDate" id="queryengageDate"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTime" jsId="queryengageDateTime" id="queryengageDateTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span id="queryengageDateImg1" style="{display:none}" ><input class="editerDateSmall"   jsId="query1engageDate" id="query1engageDate"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmall" jsId="query1engageDateTime" id="query1engageDateTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryengageDateImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryengageDateImgdown" >></span>
							<span id="queryengageDateImg2div" style="{display:none}"><input class="editerDateSmall"   jsId="query2engageDate" id="query2engageDate"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmall" jsId="query2engageDateTime" id="query2engageDateTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="queryengageDateImg" style="vertical-align:middle;margin-top:0px;">
						</td></tr>
			                <tr>
							<td align="right" i18n="gradeEnum" >gradeEnum:</td>
						<td align="left"  >
						
														<input  id="querygradeEnum"  jsId="querygradeEnum" class="editerInput"  dojoType="dijit.form.FilteringSelect" store="gradeEnumStore" />
													</td>
														<td align="right"  i18n="remark" >remark:</td>
						<td align="left"  colspan="3" >
													<input type="text" class="editerInput"  id="queryremark"  jsId="queryremark"   dojoType="dijit.form.TextBox"  />
												</td>  
				

//if (!="over" && 3!=1)     
    <!--/tr-->
//end 
//set ($inume =1) 
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
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
