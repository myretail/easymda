<%@ include file="/taglib-imports.jspf" %>
<tiles:insert definition="main.layout">

    <tiles:put name="title" type="string">
        <bean:message key="order.row.task.page.title"/>
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

            function setAction(crud) { document.forms['manageOrderRowTaskForm'].elements['crud'].value = crud; }

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
                setFields("","","",form);
            }

            function setFields(id,orderRow,task,form)
            {
                form.elements["id"].value = id;
                setSelect(false,form,"orderRow",orderRow);
                setSelect(false,form,"task",task);
            }
        //-->
        </script>
    </tiles:put>

    <tiles:put name="body" type="string">

        <div>
            <h1><bean:message key="order.row.task.page.title"/></h1>
        </div>

        <html:form styleId="manageOrderRowTaskForm" action="/OrderRowTask/Manage" method="post">
            <input type="hidden" name="crud" value=""/>
            <div id="criteria">
                <c:if test="${!empty manageableForm}">
                    <table>
                    <html:hidden name="manageableForm" property="id"/>
                        <tr>
                            <td>
                                    <nobr><html:link action="/OrderRowd/Manage"><bean:message key="order.row.task.order.row"/></html:link> <div class="important">*</div></nobr>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${empty manageableForm.orderRowBackingList}">
                                        <select name="orderRow" disabled="disabled"$columnCount/>
                                    </c:when>
                                    <c:otherwise>
                                        <select name="orderRow"$columnCount>
                                            <option value=""><bean:message key="select.option.blank"/></option>
                                            <c:forEach var="valueLabel" items="${manageableForm.orderRowBackingList}">
                                                <c:choose>
                                                    <c:when test="${valueLabel[0] eq manageableForm.orderRow}">
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
                                    <nobr><html:link action="/Task/Manage"><bean:message key="order.row.task.task"/></html:link> <div class="important">*</div></nobr>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${empty manageableForm.taskBackingList}">
                                        <select name="task" disabled="disabled"$columnCount/>
                                    </c:when>
                                    <c:otherwise>
                                        <select name="task"$columnCount>
                                            <option value=""><bean:message key="select.option.blank"/></option>
                                            <c:forEach var="valueLabel" items="${manageableForm.taskBackingList}">
                                                <c:choose>
                                                    <c:when test="${valueLabel[0] eq manageableForm.task}">
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
        <select onchange="document.location=this.options[this.selectedIndex].value+'?ref_OrderRowTask='+this.form.elements['id'].value;">
            <option value="<html:rewrite page="/Contact/Manage.do"/>"><bean:message key="contact"/></option>
            <option value="<html:rewrite page="/Customer/Manage.do"/>"><bean:message key="customer"/></option>
            <option value="<html:rewrite page="/Enumeration/Manage.do"/>"><bean:message key="enumeration"/></option>
            <option selected="selected" value="<html:rewrite page="/OrderRowTask/Manage.do"/>"><bean:message key="order.row.task"/></option>
            <option value="<html:rewrite page="/OrderRowd/Manage.do"/>"><bean:message key="order.rowd"/></option>
            <option value="<html:rewrite page="/Orderd/Manage.do"/>"><bean:message key="orderd"/></option>
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
                                <input type="radio" name="_copy" onclick="enableUpdate(true);setFields('<formatting:escape language="javascript">${row.id}</formatting:escape>','<formatting:escape language="javascript">${row.orderRow}</formatting:escape>','<formatting:escape language="javascript">${row.task}</formatting:escape>',this.form);"/>
                                <input type="checkbox" name="selectedRows" value="${row.id}" onclick="verifyEnableDelete(this);"/>
                            </nobr>
                        </display:column>
                        <display:column media="xml csv excel pdf"
                            property="orderRow"
                            titleKey="order.row.task.order.row"/>
                        <display:column media="html"
                            headerClass="orderRow" paramId="orderRow" maxLength="36"
                            sortProperty="orderRow" sortable="true"
                            titleKey="order.row.task.order.row"><nobr><formatting:escape language="javascript,html">${row.orderRow}</formatting:escape></nobr></display:column>
                        <display:column media="xml csv excel pdf"
                            property="task"
                            titleKey="order.row.task.task"/>
                        <display:column media="html"
                            headerClass="task" paramId="task" maxLength="36"
                            sortProperty="task" sortable="true"
                            titleKey="order.row.task.task"><nobr><formatting:escape language="javascript,html">${row.task}</formatting:escape></nobr></display:column>
                    </display:table>
                </c:if>
            </div>

        </html:form>

        <div id="pageHelpSection">
            <blockquote>
                <a href="" id="pageHelp" style="display:inline;" onclick="openWindow('<html:rewrite action="/OrderRowTask/ManageHelp"/>','onlinehelp',true,false,760,540); return false;">
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
	 <script type="text/javascript" src="../js/OrderRowTask.js"></script>
	 		<script type="text/javascript" src="../js/OrderRowd.js"></script>
	 		<script type="text/javascript" src="../js/Task.js"></script>
	 	<script type="text/javascript" >
	  var url = getUrl()+ "services/OrderRowTaskManageService";
	  var deletedata =  new Array();
	  var querydata =  new Array();
	  var pagenumber=1;
	  var pagesize=10;
	  var totalCount=0;
	  var queryvo=new OrderRowTaskVOJs();
	  var oddstyle='';
	  var model = new dojox.grid.data.Table(null, querydata);
	  var urle = getUrl()+ "services/BasicManageService";        
	
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
	var ptask = new SOAPClientParameters();
	var itemstask = new Array();  
		ptask.add('TaskVO',new  TaskVOJs()) ;
		ptask.add('pageNumber',0) ;
		ptask.add('pageSize',0) ;
	    ptask.add('orderBy','0') ;
	SOAPClient.invoke(getUrl()+ "services/"+"TaskManageService","getTask", ptask, false,  function GetEnu_callBack(ul, soapResponse){      
				for(var i = 0; i < ul.length-1; i++){		
				  var ulo=ul[i];
				  itemstask.push({name: ulo["ns:TaskName"], value:ulo["ns:id"]});
				}                
	});       
	var taskStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemstask }});

	function taskSet(id,value){
        	/*var itemselect=taskStore._getItemByIdentity(value);
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

//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
					   {name: i18nStr.orderRow,field: 2,get:function(inRowIndex){ var str='';var strid;if(querydata[inRowIndex]!=undefined && querydata[inRowIndex][2]!=undefined){str=querydata[inRowIndex][2][2];strid=querydata[inRowIndex][2][1];} return str+'<button dojoType="dijit.form.Button" onclick="selectOrderRowd('+strid+','+inRowIndex+',2,0,event);"   iconClass="OrderRowdIcon">sel</button>';} ,width: 10 }
			//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
					   {name: i18nStr.task,field: 3,get:function(inRowIndex){ var str='';var strid;if(querydata[inRowIndex]!=undefined && querydata[inRowIndex][3]!=undefined){str=querydata[inRowIndex][3][2];strid=querydata[inRowIndex][3][1];} return str+'<button dojoType="dijit.form.Button" onclick="selectTask('+strid+','+inRowIndex+',3,0,event);"   iconClass="TaskIcon">sel</button>';} ,width: 10 }
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
         var vobject=new OrderRowTaskVOJs();
         vobject.id=thisCell[1];

				var manageable=new OrderRowdVOJs();
			 if(querydata[i][2]!=''&&querydata[i][2]!=undefined){
             manageable.id=querydata[i][2][1];
             vobject.orderRow=manageable;
			 }else{
			 grid.getCell(grid.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
							var manageable=new TaskVOJs();
			 if(querydata[i][3]!=''&&querydata[i][3]!=undefined){
             manageable.id=querydata[i][3][1];
             vobject.task=manageable;
			 }else{
			 grid.getCell(grid.model.fieldArray[3]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
			


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('OrderRowTaskVO',vobject);
                SOAPClient.invoke(url, "createOrderRowTask", padd, false,  function GetEnu_callBack(ul, soapResponse){
                grid.model.setDatum(ul,i,1);
                });
	         }else{//modify row
                padd.add('OrderRowTaskVO',vobject);
                SOAPClient.invoke(url, "updateOrderRowTask", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
        } }}//for
//submit delete
          for(var i=0;i<deletedata.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',deletedata[i]);
               SOAPClient.invoke(url, "deleteOrderRowTask", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
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
              queryvo=new OrderRowTaskVOJs();
			
	if(queryorderRow.getDisplayedValue()!=""){
				var orderRowQuery= new OrderRowdVOJs();
				//orderRowQuery.OrderRowTaskName=queryorderRow.getDisplayedValue();
				orderRowQuery.id=queryorderRow.getValue();
				queryvo.orderRow=orderRowQuery;
			  }
	if(querytask.getDisplayedValue()!=""){
				var taskQuery= new TaskVOJs();
				//taskQuery.OrderRowTaskName=querytask.getDisplayedValue();
				taskQuery.id=querytask.getValue();
				queryvo.task=taskQuery;
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
      pu.add('OrderRowTaskVO',queryvo) ;
      pu.add('pageNumber',pagenumber) ;
	    pu.add('pageSize',pagesize) ;
	    pu.add('orderBy',orderBy) ;
      SOAPClient.invoke(url,"getOrderRowTask", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydata=new Array();
		   querydata=OrderRowTaskVOtoArray_fun(ul,true);
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
		 document.getElementById('OrderRowTaskId').value=querydata[e.rowIndex][1];
		 	 			 
					dijit.byId("addorderRow").setValue(querydata[e.rowIndex][2][1]);
			//dijit.byId("addorderRow").setDisplayedValue('');
					dijit.byId("addtask").setValue(querydata[e.rowIndex][2][1]);
			//dijit.byId("addtask").setDisplayedValue('');
			});     
}

 dojo.addOnLoad(init);   

	function selectOrderRowdFun(rep){
		querydata[selectOrderRowdInRow][noOrderRowd]=rep;
		grid.updateRow(selectOrderRowdInRow);		
	}
	function selectTaskFun(rep){
		querydata[selectTaskInRow][noTask]=rep;
		grid.updateRow(selectTaskInRow);		
	}
//addDiv---------------begin-------------------------------------
var addDivAdd = function(){
	 if(document.getElementById('queryDiv').style.display=='')document.getElementById('queryDiv').style.display='none';
	 if(document.getElementById('addDiv').style.display=='none')document.getElementById('addDiv').style.display='';
	 //Çå¿Õadd½çÃæ
					
			dijit.byId("addorderRow").setValue('');
	    dijit.byId("addorderRow").setDisplayedValue('');
			dijit.byId("addtask").setValue('');
	    dijit.byId("addtask").setDisplayedValue('');
		
	document.getElementById('OrderRowTaskId').value='0';
	//document.getElementById('referTimeAdd1').value=dojo.date.locale.format(new Date(),{ datePattern: "yyyy-MM-dd", selector: "date"});
	//document.getElementById('referTimeAdd2').value=dojo.date.locale.format(new Date(),{ timePattern: "HH:mm", selector: "time"});
} 
function addDivSave(){
	var padd = new SOAPClientParameters2();
	var vobject=new OrderRowTaskVOJs();
    vobject.id=document.getElementById('OrderRowTaskId').value;
	var passAll=0;
					
	if(dijit.byId("addorderRow").isValid(true)){
		//vobject.orderRow=dijit.byId("addorderRow").getValue();
		var manageable=new OrderRowdVOJs();
		manageable.id=dijit.byId("addorderRow").getValue();
		vobject.orderRow=manageable;
	}else{
		passAll=1;
	}
	if(dijit.byId("addtask").isValid(true)){
		//vobject.task=dijit.byId("addtask").getValue();
		var manageable=new TaskVOJs();
		manageable.id=dijit.byId("addtask").getValue();
		vobject.task=manageable;
	}else{
		passAll=1;
	}
	
if(passAll==0){
		//var addrow='';
		var addrow=[];
												//addrow=addrow+","+OrderRowdVOtoArray_fun(vobject.orderRow,true);//addrow.push(OrderRowdVOtoArray_fun(vobject.orderRow,true));
			addrow.push([false,addorderRow.getValue(),addorderRow.getDisplayedValue()]);
					//addrow=addrow+","+TaskVOtoArray_fun(vobject.task,true);//addrow.push(TaskVOtoArray_fun(vobject.task,true));
			addrow.push([false,addtask.getValue(),addtask.getDisplayedValue()]);
			 if(vobject.id==0){//create new row
		padd.add('OrderRowTaskVO',vobject);
		SOAPClient.invoke(url, "createOrderRowTask", padd, false,  function GetEnu_callBack(ul, soapResponse){
		//addrow='false,ul'+addrow;
		addrow.splice(0,0,false,ul);
				console.log("addrow.lenght:"+addrow.length);
				console.log("addrow:"+addrow);
		grid.addRow(addrow ,grid.model.getRowCount());//grid.addRow([addrow]);
		});
	 }else{//modify row
		padd.add('OrderRowTaskVO',vobject);
		SOAPClient.invoke(url, "updateOrderRowTask", padd, false,  function GetEnu_callBack(ul, soapResponse){
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
               SOAPClient.invoke(url, "deleteOrderRowTask", pdel, false,  function GetEnu_callBack(ul, soapResponse){
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
//totleinum=3
 //rowinum=1
 //addHeight=50
</script>
</head>	 
<body class="tundra">
		<div id="addDiv" style="margin-right: 0px;  height: 50px; display:none;" >
              <table align="center" width="100%" id="0" class="editorTable"  >
                <tr >
				<td align="center" style="{width:11%}" i18n="addNote" ></td>
                <td style="{width:22%}" ><input id="OrderRowTaskId" style="{display:none}"  type="text"  /></td>
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

//if (1==1)     
//    <--/tr-->
//end

//set ($inume =1) 
								<tr><td align="right"  i18n="orderRow"  ></td>
					<td align="left" ><input  id="addorderRow"  jsId="addorderRow" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="orderRowStore" onchange="orderRowSet(0,arguments[0]);" /></td>  
														<td align="right"  i18n="task"  ></td>
					<td align="left" ><!--colspan="3" --><input  id="addtask"  jsId="addtask" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="taskStore" onchange="taskSet(0,arguments[0]);" /></td>  
						    <td align="right"    ></td><td align="right"    ></td></tr>
</table></div>
<div id="queryDiv" style="margin-right: 0px;  height: 80px; display:none;" >
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


//if (!="over" && 1!=1)     
    <!--/tr-->
//end 
//set ($inume =1) 
								<tr><td align="right"  i18n="orderRow"  ></td>
					<td align="left" ><input  id="queryorderRow"  jsId="queryorderRow" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="orderRowStore"  /></td>  
														<td align="right"  i18n="task"  ></td>
					<td align="left" ><!--colspan="3" --><input  id="querytask"  jsId="querytask" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="taskStore"  /></td>  
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
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
