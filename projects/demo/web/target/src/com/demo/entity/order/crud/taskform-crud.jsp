<%@ include file="/taglib-imports.jspf" %>
<tiles:insert definition="main.layout">

    <tiles:put name="title" type="string">
        <bean:message key="task.form.page.title"/>
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

            function setAction(crud) { document.forms['manageTaskFormForm'].elements['crud'].value = crud; }

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
                setFields("","","","","[]","",form);
            }

            function setFields(setDate,formState,remark,id,tasks,car,form)
            {
                form.elements["setDateAsString"].value = setDate;
                form.elements["formState"].value = formState;
                form.elements["remark"].value = remark;
                form.elements["id"].value = id;
                setSelect(true,form,"tasks",tasks.substring(1,tasks.length-1).split(", "));
                setSelect(false,form,"car",car);
            }
        //-->
        </script>
    </tiles:put>

    <tiles:put name="body" type="string">

        <div>
            <h1><bean:message key="task.form.page.title"/></h1>
        </div>

        <html:form styleId="manageTaskFormForm" action="/TaskForm/Manage" method="post">
            <input type="hidden" name="crud" value=""/>
            <div id="criteria">
                <c:if test="${!empty manageableForm}">
                    <table>
                        <tr>
                            <td><nobr><bean:message key="task.form.set.date"/> <div class="important">*</div></nobr></td>
                            <td>
                                <html:text name="manageableForm" property="setDateAsString" styleClass="criteriaField" styleId="setDate"/>
                                <html:img page="/layout/calendar/calendar.gif" styleId="setDate_trigger" styleClass="calendar"/>
                                <script type="text/javascript">
                                //<!--
                                    Calendar.setup({
                                        inputField     :    "setDate",
                                        ifFormat       :    "%m/%d/%Y",
                                        daFormat       :    "%m/%d/%Y",
                                        showsTime      :    false,
                                        button         :    "setDate_trigger",
                                        singleClick    :    true
                                    });
                                //-->
                                </script>
                            </td>
                        </tr>
                        <tr>
                            <td><nobr><bean:message key="task.form.form.state"/> <div class="important">*</div></nobr></td>
                            <td>
                                <html:text name="manageableForm" property="formState" styleClass="criteriaField" styleId="formState"/>
                            </td>
                        </tr>
                        <tr>
                            <td><bean:message key="task.form.remark"/></td>
                            <td>
                                <html:text name="manageableForm" property="remark" styleClass="criteriaField" styleId="remark"/>
                            </td>
                        </tr>
                    <html:hidden name="manageableForm" property="id"/>
                        <tr>
                            <td>
                                    <html:link action="/Task/Manage"><bean:message key="task.form.tasks"/></html:link>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${empty manageableForm.tasksBackingList}">
                                        <select name="tasks" disabled="disabled"/>
                                    </c:when>
                                    <c:otherwise>
                                        <select name="tasks" multiple="multiple">
                                            <c:forEach var="valueLabel" items="${manageableForm.tasksBackingList}">
                        <option value="${valueLabel[0]}"<collections:contains item="${valueLabel}" array="${manageableForm.tasks}"> selected="selected"</collections:contains>>${valueLabel[1]}</option>
                                            </c:forEach>
                                        </select>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                    <nobr><html:link action="/car/Manage"><bean:message key="task.form.car"/></html:link> <div class="important">*</div></nobr>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${empty manageableForm.carBackingList}">
                                        <select name="car" disabled="disabled"/>
                                    </c:when>
                                    <c:otherwise>
                                        <select name="car">
                                            <option value=""><bean:message key="select.option.blank"/></option>
                                            <c:forEach var="valueLabel" items="${manageableForm.carBackingList}">
                                                <c:choose>
                                                    <c:when test="${valueLabel[0] eq manageableForm.car}">
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
        <select onchange="document.location=this.options[this.selectedIndex].value+'?ref_TaskForm='+this.form.elements['id'].value;">
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
            <option value="<html:rewrite page="/Prod/Manage.do"/>"><bean:message key="prod"/></option>
            <option value="<html:rewrite page="/Task/Manage.do"/>"><bean:message key="task"/></option>
            <option selected="selected" value="<html:rewrite page="/TaskForm/Manage.do"/>"><bean:message key="task.form"/></option>
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
                            <fmt:formatDate var="setDateFormatted" value="${row.setDate}" pattern="MM/dd/yyyy"/>
                            <nobr>
                                <input type="radio" name="_copy" onclick="enableUpdate(true);setFields('<formatting:escape language="javascript">${setDateFormatted}</formatting:escape>','<formatting:escape language="javascript">${row.formState}</formatting:escape>','<formatting:escape language="javascript">${row.remark}</formatting:escape>','<formatting:escape language="javascript">${row.id}</formatting:escape>','<formatting:escape language="javascript">${row.tasks}</formatting:escape>','<formatting:escape language="javascript">${row.car}</formatting:escape>',this.form);"/>
                                <input type="checkbox" name="selectedRows" value="${row.id}" onclick="verifyEnableDelete(this);"/>
                            </nobr>
                        </display:column>
                        <display:column media="xml csv excel pdf" titleKey="task.form.set.date">${setDateFormatted}</display:column>
                        <display:column media="html"
                            headerClass="setDate" paramId="setDate" maxLength="36"
                            sortProperty="setDate" sortable="true"
                            titleKey="task.form.set.date"><nobr>${setDateFormatted}</nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="formState"
                            titleKey="task.form.form.state"/>
                        <display:column media="html"
                            headerClass="formState" paramId="formState" maxLength="36"
                            sortProperty="formState" sortable="true"
                            titleKey="task.form.form.state"><nobr><formatting:escape language="javascript,html">${row.formState}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="remark"
                            titleKey="task.form.remark"/>
                        <display:column media="html"
                            headerClass="remark" paramId="remark" maxLength="36"
                            sortProperty="remark" sortable="true"
                            titleKey="task.form.remark"><nobr><formatting:escape language="javascript,html">${row.remark}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="tasks"
                            titleKey="task.form.tasks"/>
                        <display:column media="html"
                            headerClass="tasks" paramId="tasks" maxLength="36"
                            sortProperty="tasks" sortable="true"
                            titleKey="task.form.tasks"><nobr><formatting:escape language="javascript,html">${row.tasks}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="car"
                            titleKey="task.form.car"/>
                        <display:column media="html"
                            headerClass="car" paramId="car" maxLength="36"
                            sortProperty="car" sortable="true"
                            titleKey="task.form.car"><nobr><formatting:escape language="javascript,html">${row.car}</formatting:escape></nobr></display:column>
                    </display:table>
                </c:if>
            </div>

        </html:form>

        <div id="pageHelpSection">
            <blockquote>
                <a href="" id="pageHelp" style="display:inline;" onclick="openWindow('<html:rewrite action="/TaskForm/ManageHelp"/>','onlinehelp',true,false,760,540); return false;">
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
	 <script type="text/javascript" src="../js/TaskForm.js"></script>
	 		<script type="text/javascript" src="../js/Task.js"></script>
	 		<script type="text/javascript" src="../js/car.js"></script>
	 	<script type="text/javascript" >
	  var url = getUrl()+ "services/TaskFormManageService";
	  var deletedata =  new Array();
	  var querydata =  new Array();
	  var pagenumber=1;
	  var pagesize=10;
	  var totalCount=0;
	  var queryvo=new TaskFormVOJs();
	  var oddstyle='';
	  var model = new dojox.grid.data.Table(null, querydata);
	  var urle = getUrl()+ "services/BasicManageService";        
				
//have set function's manageableAssociationEnds
	var ptasks = new SOAPClientParameters();
	var itemstasks = new Array();  
		ptasks.add('TaskVO',new  TaskVOJs()) ;
		ptasks.add('pageNumber',0) ;
		ptasks.add('pageSize',0) ;
	    ptasks.add('orderBy','0') ;
	SOAPClient.invoke(getUrl()+ "services/"+"TaskManageService","getTask", ptasks, false,  function GetEnu_callBack(ul, soapResponse){      
				for(var i = 0; i < ul.length-1; i++){		
				  var ulo=ul[i];
				  itemstasks.push({name: ulo["ns:TaskName"], value:ulo["ns:id"]});
				}                
	});       
	var tasksStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemstasks }});

	function tasksSet(id,value){
        	/*var itemselect=tasksStore._getItemByIdentity(value);
        	if(itemselect!='undefined'&& itemselect!=null){
        	}*/
        }
	var pcar = new SOAPClientParameters();
	var itemscar = new Array();  
		pcar.add('carVO',new  carVOJs()) ;
		pcar.add('pageNumber',0) ;
		pcar.add('pageSize',0) ;
	    pcar.add('orderBy','0') ;
	SOAPClient.invoke(getUrl()+ "services/"+"carManageService","getcar", pcar, false,  function GetEnu_callBack(ul, soapResponse){      
				for(var i = 0; i < ul.length-1; i++){		
				  var ulo=ul[i];
				  itemscar.push({name: ulo["ns:carName"], value:ulo["ns:id"]});
				}                
	});       
	var carStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemscar }});

	function carSet(id,value){
        	/*var itemselect=carStore._getItemByIdentity(value);
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
  		  {name: i18nStr.setDate,field:2, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
				  {name: i18nStr.setDateTime,field:3, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
		        					,   {name: i18nStr.formState, field: 4,width: 10 , editor: mydojo.ValidationTextBox ,required:true ,maxLength:30}
					            				    ,   {name: i18nStr.remark, field: 5,width: 10, editor: dojox.grid.editors.Editor,required:false, editorToolbar: true  }
					      
//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
	//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
					 ,   {name: i18nStr.car,field: 6,get:function(inRowIndex){ var str='';var strid;if(querydata[inRowIndex]!=undefined && querydata[inRowIndex][6]!=undefined){str=querydata[inRowIndex][6][2];strid=querydata[inRowIndex][6][1];} return str+'<button dojoType="dijit.form.Button" onclick="selectcar('+strid+','+inRowIndex+',6,0,event);"   iconClass="carIcon">sel</button>';} ,width: 10 }
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
         var vobject=new TaskFormVOJs();
         vobject.id=thisCell[1];
 var  d=new DateTimeQuery();
             if(thisCell[2] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[2], grid.getCell(grid.model.fieldArray[2]).constraint);
             }else{grid.getCell(grid.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[3] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[3], grid.getCell(grid.model.fieldArray[3]).constraint);
             vobject.setDate=d;
             }else{grid.getCell(grid.model.fieldArray[3]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null


              if(dojox.validate.isText(thisCell[4], {minlength: 1})){vobject.formState=thisCell[4];
             }else{grid.getCell(grid.model.fieldArray[4]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;}//not null
 
               vobject.remark=thisCell[5];
 

					var manageable=new carVOJs();
			 if(querydata[i][6]!=''&&querydata[i][6]!=undefined){
             manageable.id=querydata[i][6][1];
             vobject.car=manageable;
			 }else{
			 grid.getCell(grid.model.fieldArray[6]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
			


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('TaskFormVO',vobject);
                SOAPClient.invoke(url, "createTaskForm", padd, false,  function GetEnu_callBack(ul, soapResponse){
                grid.model.setDatum(ul,i,1);
                });
	         }else{//modify row
                padd.add('TaskFormVO',vobject);
                SOAPClient.invoke(url, "updateTaskForm", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
        } }}//for
//submit delete
          for(var i=0;i<deletedata.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',deletedata[i]);
               SOAPClient.invoke(url, "deleteTaskForm", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
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
              queryvo=new TaskFormVOJs();
              d=queryDate_fun("setDate");
              if(d==null){validstate=1;}else if(d.upSign!="%"){queryvo.setDate=d;}
	          if(queryformState.getDisplayedValue()!="")queryvo.formState=queryformState.getDisplayedValue();//
	          if(queryremark.getDisplayedValue()!="")queryvo.remark=queryremark.getDisplayedValue();//
			
	if(querytasks.getDisplayedValue()!=""){
				var tasksQuery= new TaskVOJs();
				//tasksQuery.TaskFormName=querytasks.getDisplayedValue();
				tasksQuery.id=querytasks.getValue();
				queryvo.tasks=tasksQuery;
			  }
	if(querycar.getDisplayedValue()!=""){
				var carQuery= new carVOJs();
				//carQuery.TaskFormName=querycar.getDisplayedValue();
				carQuery.id=querycar.getValue();
				queryvo.car=carQuery;
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
      pu.add('TaskFormVO',queryvo) ;
      pu.add('pageNumber',pagenumber) ;
	    pu.add('pageSize',pagesize) ;
	    pu.add('orderBy',orderBy) ;
      SOAPClient.invoke(url,"getTaskForm", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydata=new Array();
		   querydata=TaskFormVOtoArray_fun(ul,true);
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
		 document.getElementById('TaskFormId').value=querydata[e.rowIndex][1];
		 	 									 dijit.byId("addsetDate").setValue(querydata[e.rowIndex][2].substring(0,10));
				  				  dijit.byId("addsetDateTime").setValue(querydata[e.rowIndex][3].substring(11,16));
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addformState").setValue(querydata[e.rowIndex][4]);
						 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addremark").setValue(querydata[e.rowIndex][5]);
						 			 
					dijit.byId("addtasks").setValue(querydata[e.rowIndex][6][1]);
			//dijit.byId("addtasks").setDisplayedValue('');
					dijit.byId("addcar").setValue(querydata[e.rowIndex][6][1]);
			//dijit.byId("addcar").setDisplayedValue('');
			});     
}

 dojo.addOnLoad(init);   

	function selectTaskFun(rep){
		querydata[selectTaskInRow][noTask]=rep;
		grid.updateRow(selectTaskInRow);		
	}
	function selectcarFun(rep){
		querydata[selectcarInRow][nocar]=rep;
		grid.updateRow(selectcarInRow);		
	}
//addDiv---------------begin-------------------------------------
var addDivAdd = function(){
	 if(document.getElementById('queryDiv').style.display=='')document.getElementById('queryDiv').style.display='none';
	 if(document.getElementById('addDiv').style.display=='none')document.getElementById('addDiv').style.display='';
	 //Çå¿Õadd½çÃæ
										dijit.byId("addsetDate").setValue('');
				dijit.byId("addsetDateTime").setValue('');
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addformState").setValue('');
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addremark").setValue('');
										
			dijit.byId("addtasks").setValue('');
	    dijit.byId("addtasks").setDisplayedValue('');
			dijit.byId("addcar").setValue('');
	    dijit.byId("addcar").setDisplayedValue('');
		
	document.getElementById('TaskFormId').value='0';
	//document.getElementById('referTimeAdd1').value=dojo.date.locale.format(new Date(),{ datePattern: "yyyy-MM-dd", selector: "date"});
	//document.getElementById('referTimeAdd2').value=dojo.date.locale.format(new Date(),{ timePattern: "HH:mm", selector: "time"});
} 
function addDivSave(){
	var padd = new SOAPClientParameters2();
	var vobject=new TaskFormVOJs();
    vobject.id=document.getElementById('TaskFormId').value;
	var passAll=0;
										if(dijit.byId("addsetDate").getValue() instanceof Date){ 
					if(dijit.byId("addsetDateTime").getValue() instanceof Date){
						var dsetDate=new DateTimeQuery();
						dsetDate.upDate=dojo.date.locale.format(dijit.byId("addsetDate").getValue(), dijit.byId("addsetDate").constraints)+" "+dojo.date.locale.format(dijit.byId("addsetDateTime").getValue(), dijit.byId("addsetDateTime").constraints);
						vobject.setDate=dsetDate;
					}else{passAll=1;}
				}else{
					passAll=1;}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addformState").isValid(true)){
					vobject.formState=dijit.byId("addformState").getValue();
				}else{
					passAll=1;
				}
															//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				if(dijit.byId("addremark").isValid(true)){
					vobject.remark=dijit.byId("addremark").getValue();
				}else{
					passAll=1;
				}
										
	if(dijit.byId("addtasks").isValid(true)){
		//vobject.tasks=dijit.byId("addtasks").getValue();
		var manageable=new TaskVOJs();
		manageable.id=dijit.byId("addtasks").getValue();
		vobject.tasks=manageable;
	}else{
		passAll=1;
	}
	if(dijit.byId("addcar").isValid(true)){
		//vobject.car=dijit.byId("addcar").getValue();
		var manageable=new carVOJs();
		manageable.id=dijit.byId("addcar").getValue();
		vobject.car=manageable;
	}else{
		passAll=1;
	}
	
if(passAll==0){
		//var addrow='';
		var addrow=[];
														//addrow=addrow+","+vobject.setDate.upDate+","+vobject.setDate.upDate;
					addrow.push(dojo.date.locale.parse(vobject.setDate.upDate,{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
					addrow.push(dojo.date.locale.parse(vobject.setDate.upDate,{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
																					//addrow=addrow+","+vobject.formState;
					addrow.push(vobject.formState);
																					//addrow=addrow+","+vobject.remark;
					addrow.push(vobject.remark);
																			//addrow=addrow+","+TaskVOtoArray_fun(vobject.tasks,true);//addrow.push(TaskVOtoArray_fun(vobject.tasks,true));
			addrow.push([false,addtasks.getValue(),addtasks.getDisplayedValue()]);
					//addrow=addrow+","+carVOtoArray_fun(vobject.car,true);//addrow.push(carVOtoArray_fun(vobject.car,true));
			addrow.push([false,addcar.getValue(),addcar.getDisplayedValue()]);
			 if(vobject.id==0){//create new row
		padd.add('TaskFormVO',vobject);
		SOAPClient.invoke(url, "createTaskForm", padd, false,  function GetEnu_callBack(ul, soapResponse){
		//addrow='false,ul'+addrow;
		addrow.splice(0,0,false,ul);
				console.log("addrow.lenght:"+addrow.length);
				console.log("addrow:"+addrow);
		grid.addRow(addrow ,grid.model.getRowCount());//grid.addRow([addrow]);
		});
	 }else{//modify row
		padd.add('TaskFormVO',vobject);
		SOAPClient.invoke(url, "updateTaskForm", padd, false,  function GetEnu_callBack(ul, soapResponse){
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
               SOAPClient.invoke(url, "deleteTaskForm", pdel, false,  function GetEnu_callBack(ul, soapResponse){
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
//totleinum=7
 //rowinum=2
 //addHeight=90
</script>
</head>	 
<body class="tundra">
		<div id="addDiv" style="margin-right: 0px;  height: 90px; display:none;" >
              <table align="center" width="100%" id="0" class="editorTable"  >
                <tr >
				<td align="center" style="{width:11%}" i18n="addNote" ></td>
                <td style="{width:22%}" ><input id="TaskFormId" style="{display:none}"  type="text"  /></td>
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
				<td align="right" i18n="setDate"  >setDate:</td> 
			<td align="left" >
				<input class="editerDate"   jsId="addsetDate" id="addsetDate"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
				<input class="editerTime" jsId="addsetDateTime" id="addsetDateTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours.">
			</td>
					<td align="right" i18n="formState" >formState:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addformState"  jsId="addformState"   dojoType="dijit.form.ValidationTextBox" required="true" />
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
												<tr><td align="right"  i18n="car"  ></td>
					<td align="left" ><input  id="addcar"  jsId="addcar" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="carStore" onchange="carSet(0,arguments[0]);" /></td>  
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
							<td align="right" i18n="setDate"  >setDate:</td> 
						<td align="left"  colspan="3"><span id="querysetDateImg0"  ><input class="editerDate"   jsId="querysetDate" id="querysetDate"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTime" jsId="querysetDateTime" id="querysetDateTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span id="querysetDateImg1" style="{display:none}" ><input class="editerDateSmaller"   jsId="query1setDate" id="query1setDate"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query1setDateTime" id="query1setDateTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="querysetDateImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="querysetDateImgdown" >></span>
							<span id="querysetDateImg2div" style="{display:none}"><input class="editerDateSmaller"   jsId="query2setDate" id="query2setDate"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query2setDateTime" id="query2setDateTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="querysetDateImg" style="vertical-align:middle;margin-top:0px;">
						</td>
													<td align="right" colspan="2" ></td>
						<td align="right"  i18n="formState" >formState:</td>
						<td align="left"  >
							 								<input type="text" class="editerInput"  id="queryformState"  jsId="queryformState"   dojoType="dijit.form.TextBox"  />  
													</td></tr>
					                <tr>
							<td align="right" i18n="remark" >remark:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="queryremark"  jsId="queryremark"   dojoType="dijit.form.TextBox"  />
													</td>
				

//if (!="over" && 2!=1)     
    <!--/tr-->
//end 
//set ($inume =1) 
												<td align="right"  i18n="car"  ></td>
					<td align="left" ><!--colspan="3" --><input  id="querycar"  jsId="querycar" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="carStore"  /></td>  
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
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
