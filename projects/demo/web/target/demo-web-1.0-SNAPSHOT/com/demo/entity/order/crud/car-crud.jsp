<%@ include file="/taglib-imports.jspf" %>
<tiles:insert definition="main.layout">

    <tiles:put name="title" type="string">
        <bean:message key="car.page.title"/>
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

            function setAction(crud) { document.forms['managecarForm'].elements['crud'].value = crud; }

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
                setFields("","",form);
            }

            function setFields(load,id,form)
            {
                form.elements["load"].value = load;
                form.elements["id"].value = id;
            }
        //-->
        </script>
    </tiles:put>

    <tiles:put name="body" type="string">

        <div>
            <h1><bean:message key="car.page.title"/></h1>
        </div>

        <html:form styleId="managecarForm" action="/car/Manage" method="post">
            <input type="hidden" name="crud" value=""/>
            <div id="criteria">
                <c:if test="${!empty manageableForm}">
                    <table>
                        <tr>
                            <td><nobr><bean:message key="car.load"/> <div class="important">*</div></nobr></td>
                            <td>
                                <html:text name="manageableForm" property="load" styleClass="criteriaField" styleId="load"/>
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
        <select onchange="document.location=this.options[this.selectedIndex].value+'?ref_car='+this.form.elements['id'].value;">
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
            <option value="<html:rewrite page="/TaskForm/Manage.do"/>"><bean:message key="task.form"/></option>
            <option selected="selected" value="<html:rewrite page="/car/Manage.do"/>"><bean:message key="car"/></option>
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
                                <input type="radio" name="_copy" onclick="enableUpdate(true);setFields('<formatting:escape language="javascript">${row.load}</formatting:escape>','<formatting:escape language="javascript">${row.id}</formatting:escape>',this.form);"/>
                                <input type="checkbox" name="selectedRows" value="${row.id}" onclick="verifyEnableDelete(this);"/>
                            </nobr>
                        </display:column>
                        <display:column media="xml csv excel pdf"
                            property="load"
                            titleKey="car.load"/>
                        <display:column media="html"
                            headerClass="load" paramId="load" maxLength="36"
                            sortProperty="load" sortable="true"
                            titleKey="car.load"><nobr><formatting:escape language="javascript,html">${row.load}</formatting:escape></nobr></display:column>
                    </display:table>
                </c:if>
            </div>

        </html:form>

        <div id="pageHelpSection">
            <blockquote>
                <a href="" id="pageHelp" style="display:inline;" onclick="openWindow('<html:rewrite action="/car/ManageHelp"/>','onlinehelp',true,false,760,540); return false;">
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
	 <script type="text/javascript" src="../js/car.js"></script>
	 	<script type="text/javascript" >
	  var url = getUrl()+ "services/carManageService";
	  var deletedata =  new Array();
	  var querydata =  new Array();
	  var pagenumber=1;
	  var pagesize=10;
	  var totalCount=0;
	  var queryvo=new carVOJs();
	  var oddstyle='';
	  var model = new dojox.grid.data.Table(null, querydata);
	  var urle = getUrl()+ "services/BasicManageService";        
		
//have set function's manageableAssociationEnds

 
//ÏÈÅÐ¶Ï±íµÄ×Ö¶ÎÊýÊÇ·ñ´óÓÚ12£¬Èç¹û´óÓÚ12£¬ÔòÉú³Éµ¥ÐÐlayoutºÍÕÛµþlayoutÁ½¸östructure
//enumeration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
					
var layoutSingleRow=[{
          
 //¸ù¾ÝfieldµÄÖµ£¬ÒÀ¾ÝÄ¬ÈÏµÄË³Ðò£¬´ÓjsÖÐµÄtoArray×ª»»·½·¨·µ»ØµÄquerydateÖÐÈ¡Êý¾Ý
	   
				 cells: [ [
							//{name: 'Ñ¡Ôñ', width: 3, get:getChoise},
						   { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
						   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
            {name: i18nStr.load,field:2, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
		  
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
         var vobject=new carVOJs();
         vobject.id=thisCell[1];
             if(dojox.validate.isInRange(thisCell[2],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[2];vobject.load=n;
             }else{grid.getCell(grid.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double





       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('carVO',vobject);
                SOAPClient.invoke(url, "createcar", padd, false,  function GetEnu_callBack(ul, soapResponse){
                grid.model.setDatum(ul,i,1);
                });
	         }else{//modify row
                padd.add('carVO',vobject);
                SOAPClient.invoke(url, "updatecar", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
        } }}//for
//submit delete
          for(var i=0;i<deletedata.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',deletedata[i]);
               SOAPClient.invoke(url, "deletecar", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
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
              queryvo=new carVOJs();
              n=queryNumber_fun("load");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvo.load=n;}  
			

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
      pu.add('carVO',queryvo) ;
      pu.add('pageNumber',pagenumber) ;
	    pu.add('pageSize',pagesize) ;
	    pu.add('orderBy',orderBy) ;
      SOAPClient.invoke(url,"getcar", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydata=new Array();
		   querydata=carVOtoArray_fun(ul,true);
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
		 document.getElementById('carId').value=querydata[e.rowIndex][1];
		 	 									//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addload").setValue(querydata[e.rowIndex][2]);
						 			 
			});     
}

 dojo.addOnLoad(init);   

//addDiv---------------begin-------------------------------------
var addDivAdd = function(){
	 if(document.getElementById('queryDiv').style.display=='')document.getElementById('queryDiv').style.display='none';
	 if(document.getElementById('addDiv').style.display=='none')document.getElementById('addDiv').style.display='';
	 //Çå¿Õadd½çÃæ
										//enumeration ÓëÆÕÍ¨µÄStringÏàÍ¬´¦Àí£¿
				dijit.byId("addload").setValue('');
										
		
	document.getElementById('carId').value='0';
	//document.getElementById('referTimeAdd1').value=dojo.date.locale.format(new Date(),{ datePattern: "yyyy-MM-dd", selector: "date"});
	//document.getElementById('referTimeAdd2').value=dojo.date.locale.format(new Date(),{ timePattern: "HH:mm", selector: "time"});
} 
function addDivSave(){
	var padd = new SOAPClientParameters2();
	var vobject=new carVOJs();
    vobject.id=document.getElementById('carId').value;
	var passAll=0;
										if(dijit.byId("addload").isValid(true)){
					var nload=new NumberQuery();
					nload.upNumber=dijit.byId("addload").getValue();
					vobject.load=nload;
				}else{
					passAll=1;
				}
										
	
if(passAll==0){
		//var addrow='';
		var addrow=[];
														//addrow=addrow+","+vobject.load.upNumber;
					addrow.push(vobject.load.upNumber);
																	 if(vobject.id==0){//create new row
		padd.add('carVO',vobject);
		SOAPClient.invoke(url, "createcar", padd, false,  function GetEnu_callBack(ul, soapResponse){
		//addrow='false,ul'+addrow;
		addrow.splice(0,0,false,ul);
				console.log("addrow.lenght:"+addrow.length);
				console.log("addrow:"+addrow);
		grid.addRow(addrow ,grid.model.getRowCount());//grid.addRow([addrow]);
		});
	 }else{//modify row
		padd.add('carVO',vobject);
		SOAPClient.invoke(url, "updatecar", padd, false,  function GetEnu_callBack(ul, soapResponse){
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
               SOAPClient.invoke(url, "deletecar", pdel, false,  function GetEnu_callBack(ul, soapResponse){
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
//totleinum=2
 //rowinum=0
 //addHeight=50
</script>
</head>	 
<body class="tundra">
		<div id="addDiv" style="margin-right: 0px;  height: 50px; display:none;" >
              <table align="center" width="100%" id="0" class="editorTable"  >
                <tr >
				<td align="center" style="{width:11%}" i18n="addNote" ></td>
                <td style="{width:22%}" ><input id="carId" style="{display:none}"  type="text"  /></td>
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
				<td align="right" i18n="load" >load:</td>
			<td align="left"  >
							<input type="text" class="editerNumber"   jsId="addload"  id="addload"  dojoType="mydojo.NumberTextBox" constraints="{min:0,max:9999999,places:4 }" />
			</td>
	
//if (2==1)     
//    <--/tr-->
//end

//set ($inume =1) 
    <td align="right"    ></td><td align="right"    ></td><td align="right"    ></td><td align="right"    ></td></tr>
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
                <tr>
				<td align="right" i18n="load" >load:</td>
			<td align="left"  >
							<span id="queryloadImg0"  ><input type="text" class="editerNumber"   jsId="queryload"  id="queryload"  dojoType="mydojo.NumberTextBox"  /></span>
							<span id="queryloadImg1" style="{display:none}" ><input type="text"  class="editerNumberSmall" jsId="queryload1"  id="queryload1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryloadImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryloadImgdown" >></span>
							<span id="queryloadImg2div" style="{display:none}"> <input type="text"  class="editerNumberSmall"  jsId="queryload2"  id="queryload2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="queryloadImg" style="vertical-align:middle;margin-top:0px;">
							
						</td>
				

//if (!="over" && 2!=1)     
    <!--/tr-->
//end 
//set ($inume =1) 
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
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
