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
			@import "../dojo/dojo-release-1.0.0/dojox/layout/resources/FloatingPane.css"; 
		    @import "../dojo/dojo-release-1.0.0/dojox/layout/resources/ResizeHandle.css"; 
      </style>
      <script type="text/javascript" src="../dojo/dojo-release-1.0.0/dojo/dojo.js"  
                djConfig="parseOnLoad: true, isDebug: true,locale: 'zh-cn', extraLocale: ['zh-TW', 'fr']"></script>
      <script>
    
            dojo.require("dojo.data.ItemFileWriteStore");
            dojo.require("dojo.parser");
            dojo.require("dijit.form.Button");
            dojo.require("dijit.Menu");
			dojo.require("dijit.Dialog");
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
			dojo.registerModulePath("projectDojo", "../../../dojo/projectDojo");
			dojo.require("projectDojo.TaskForm");
     </script>
		        
     <script type="text/javascript" src="../js/soapclient.js"></script>
	 <script type="text/javascript" >
	//manageablePackageName=com.demo.entity.order.crud
	//packageName=com.demo.entity.order
	  
	  </script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 <script type="text/javascript" >
	  var url = getUrl()+ "services/TaskFormManageService";
	  var dojoTaskForm= new  projectDojo.TaskForm();
	  dojoTaskForm.initTaskForm();
	  var deletedata =  new Array();
	  var querydata =  new Array();
	  var pagenumber=1;
	  var pagesize=10;
	  var totalCount=0;
	  var queryvo=new Object();
	  var oddstyle='';
	  var model = new dojox.grid.data.Table(null, querydata);
	  var urle = getUrl()+ "services/BasicManageService"; 

 
//???��????1212??layout??layoutstructure
//enumeration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
										
/*//????��?
		//????��?
					function setcarDetailFun(inrow,carColNo){
					return querydata[inrow][carColNo];
				}
			*/
/*function setDetailFloatFun(inrow,ColNo){
	return querydata[inrow][ColNo];
}	*/

var layoutSingleRow=[{
          
 //field????????��???js??toArray��???querydate??
	   
				 cells: [ [
							//{name: '??', width: 3, get:getChoise},
						   { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
						   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
  		  {name: i18nStr.setDate,field:2, width: 8}
		        				,   {name: i18nStr.formState, field: 3,width: 8}
					       			    ,   {name: i18nStr.remark, field: 4,width: 10 }
					 
//??��????
		//??��????
					 ,   {name: i18nStr.car,field: 6,get:function(inRowIndex){ var str='';var strid;if(querydata[inRowIndex]!=undefined && querydata[inRowIndex][6]!=undefined && querydata[inRowIndex][6][2]){str=querydata[inRowIndex][6][2];strid=querydata[inRowIndex][6][1];} return str+'<img src="../image/detailFloat.jpg" height="16" width="16" style="vertical-align:middle;margin-top:0px;margin-left:8px;" onclick="dojoTaskForm.detailFloatcarData=querydata['+inRowIndex+'][6];dojoTaskForm.detailcar('+querydata[inRowIndex][6][1]+','+inRowIndex+',6,0,event,0);"   >';} ,width: 10 }
			                                        ] ]
                           }]; 
						   
						   

	 
function querybutton(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvo.id=0 ;
              queryvo=new Object();
              d=queryDate_fun("setDate");
              if(d==null){validstate=1;}else if(d.upSign!="%"){queryvo.setDate=d;}
	          if(queryformState.getDisplayedValue()!="")queryvo.formState=queryformState.getDisplayedValue();//
	          if(queryremark.getDisplayedValue()!="")queryvo.remark=queryremark.getDisplayedValue();//
			
	var tasksQuery= new Object();
	if(dojo.byId("querytasksForTaskFormDiv")!=undefined && getQueryCondtasksForTaskForm(tasksQuery)){
		queryvo.tasks=tasksQuery;
	}else if(querytasks.getDisplayedValue()!=""){
		//var prodCustQuery= new Object();
		//prodCustQuery.ProdName=queryprodCust.getDisplayedValue();
		tasksQuery.id=querytasks.getValue();
		queryvo.tasks=prodtasks;
	}
	var carQuery= new Object();
	if(dojo.byId("querycarForTaskFormDiv")!=undefined && getQueryCondcarForTaskForm(carQuery)){
		queryvo.car=carQuery;
	}else if(querycar.getDisplayedValue()!=""){
		//var prodCustQuery= new Object();
		//prodCustQuery.ProdName=queryprodCust.getDisplayedValue();
		carQuery.id=querycar.getValue();
		queryvo.car=prodcar;
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
		   querydata=dojoTaskForm.TaskFormVOtoArray_fun(ul,false);
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
		 	 									 dijit.byId("addsetDate").setValue(dojo.date.locale.parse(querydata[e.rowIndex][2],{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
				 dijit.byId("addsetDateTime").setValue(dojo.date.locale.parse(querydata[e.rowIndex][2],{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
						 									//enumeration ?��String??��??
				dijit.byId("addformState").setValue(querydata[e.rowIndex][3]);
						 									//enumeration ?��String??��??
				dijit.byId("addremark").setValue(querydata[e.rowIndex][4]);
						 			 
													dijit.byId("addcar").setValue(querydata[e.rowIndex][6][1]);
			//dijit.byId("addcar").setDisplayedValue('');
						});     
}

 dojo.addOnLoad(init);   

	function selectTaskFun(rep){
		querydata[dojoTaskForm.selectTaskInRow][dojoTaskForm.noTask]=rep;
		grid.updateRow(dojoTaskForm.selectTaskInRow);		
	}
	function selectcarFun(rep){
		querydata[dojoTaskForm.selectcarInRow][dojoTaskForm.nocar]=rep;
		grid.updateRow(dojoTaskForm.selectcarInRow);		
	}
//addDiv---------------begin-------------------------------------
var addDivAdd = function(){
	 //if(document.getElementById('queryDiv').style.display=='')document.getElementById('queryDiv').style.display='none';
	 //if(document.getElementById('addDiv').style.display=='none')document.getElementById('addDiv').style.display='';
	 //add
										dijit.byId("addsetDate").setValue('');
				dijit.byId("addsetDateTime").setValue('');
															//enumeration ?��String??��??
				
									dijit.byId("addformState").setValue('');
																			//enumeration ?��String??��??
				
									dijit.byId("addremark").setValue('');
														
								dijit.byId("addcar").setValue('');
	    dijit.byId("addcar").setDisplayedValue('');
				
	document.getElementById('TaskFormId').value='0';
	//document.getElementById('referTimeAdd1').value=dojo.date.locale.format(new Date(),{ datePattern: "yyyy-MM-dd", selector: "date"});
	//document.getElementById('referTimeAdd2').value=dojo.date.locale.format(new Date(),{ timePattern: "HH:mm", selector: "time"});
} 
function addDivSave(){
	var padd = new SOAPClientParameters2();
	var vobject=new Object();
    vobject.id=document.getElementById('TaskFormId').value;
	var passAll=0;
										if(dijit.byId("addsetDate").validate(true)){ 
					if(dijit.byId("addsetDate").getValue()!=''&&dijit.byId("addsetDate").getValue()!=undefined){	
					if(dijit.byId("addsetDateTime").validate(true)){
						if(dijit.byId("addsetDateTime").getValue()==''||dijit.byId("addsetDateTime").getValue()==undefined)dijit.byId("addsetDateTime").setValue(new Date(2000,1,1,0,0,0,0));
						var dsetDate=new DateTimeQuery();
						dsetDate.upDate=dojo.date.locale.format(dijit.byId("addsetDate").getValue(), dijit.byId("addsetDate").constraints)+" "+dojo.date.locale.format(dijit.byId("addsetDateTime").getValue(), dijit.byId("addsetDateTime").constraints);
						vobject.setDate=dsetDate;
					}else{setErrorClass(dijit.byId("addsetDateTime")); passAll=1;}
				}}else{
					setErrorClass(dijit.byId("addsetDate")); passAll=1;}
															//enumeration ?��String??��??
				if(dijit.byId("addformState").validate(true)){
					vobject.formState=dijit.byId("addformState").getValue();
				}else{
					setErrorClass(dijit.byId("addformState")); passAll=1;
				}
															//enumeration ?��String??��??
				if(dijit.byId("addremark").validate(true)){
					vobject.remark=dijit.byId("addremark").getValue();
				}else{
					setErrorClass(dijit.byId("addremark")); passAll=1;
				}
										
			if(dijit.byId("addcar").validate(true)){
		//vobject.car=dijit.byId("addcar").getValue();
		var manageable=new Object();
		manageable.id=dijit.byId("addcar").getValue();
		vobject.car=manageable;
	}else{
		setErrorClass(dijit.byId("addcar")); passAll=1;
	}
		
if(passAll==0){
		//var addrow='';
		var addrow=[];
														vobject.setDate?addrow.push(vobject.setDate.upDate):addrow.push('');
																					//addrow=addrow+","+vobject.formState;
					addrow.push(vobject.formState);
																					//addrow=addrow+","+vobject.remark;
					addrow.push(vobject.remark);
																						addrow.push([false,'','']);
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
		querydata[document.getElementById('erowIndex').value]=addrow;//[addrow];
		grid.updateRow(document.getElementById('erowIndex').value);
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
               document.getElementById("rowCount").innerHTML = i18nStr.di+" "+pagenumber+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCount+" "+i18nStr.rowSize; 	
               if(si=ii){if(document.getElementById('addDiv').style.display=='')document.getElementById('addDiv').style.display='none';}
	        });   
          //}             
           dijit.byId("grid").removeSelectedRows();
      }
 }    
 
function adddis(){
	
	querydisplay("addDiv");
	if(document.getElementById('addDiv').style.display!='none')addDivAdd();
} 
//addDiv---------------end---------------------------------------	 
//totleinum=4
 //rowinum=1
 //addHeight=125
</script>
</head>	 
<body class="tundra">
	<div id="addDiv" style="margin:25px 0px 20px 0px;  height:125px; display:none;" >
		<div  class="titleDiv"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font i18n="addNote">add</font></div>
              <table align="center" width="100%" id="0" class="editorTable"  >
                <tr >
				<td align="center" style="{width:11%}">&nbsp;</td>
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
				<input class="addDate"   jsId="addsetDate" id="addsetDate"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox" required="true" />
				<input class="addTime" jsId="addsetDateTime" id="addsetDateTime"  dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"  >
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

 <!--//if (1==1)     
//   /tr
//end

//set ($inume =1) -->
												<tr><td align="right"  i18n="car"  ></td>
					<td align="left" ><input  id="addcar"  jsId="addcar" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoTaskForm.carStore" onchange="carSet(0,arguments[0]);" required="true"/></td>  
						    <td align="right"    ></td><td align="right"    ></td><td align="right"    ></td><td align="right"    ></td></tr>
 <tr align="center"><td></td>
           <td colspan="5"><button dojoType="dijit.form.Button" onclick="addDivAdd();" iconClass="addIcon"  i18n="add" >add</button>
				<button dojoType="dijit.form.Button" onclick="addDivRemove();" iconClass="delIcon"  i18n="delete" >remove</button>
				<button dojoType="dijit.form.Button" onclick="addDivSave();" iconClass="saveIcon"   i18n="save">save</button></td>
           <td colspan="2"></td></tr>
</table></div>
<div id="queryDiv" style="margin:25px 0px 20px 0px; height: 125px; display:none;" >
 <div  class="titleDiv"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font i18n="queryNote"></font></div>
  <table align="center" width=100% class="queryTable"  >
	<tr >
	<td align="center" style="{width:11%}"  >&nbsp;</td>
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
						<td align="left"  colspan="3"><span id="querysetDateImg0"  ><input class="addDate"   jsId="querysetDate" id="querysetDate"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="addTime" jsId="querysetDateTime" id="querysetDateTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span id="querysetDateImg1" style="{display:none}" ><input class="editerDateSmaller"   jsId="query1setDate" id="query1setDate"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query1setDateTime" id="query1setDateTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="querysetDateImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="querysetDateImgdown" >></span>
							<span id="querysetDateImg2div" style="{display:none}"><input class="editerDateSmaller"   jsId="query2setDate" id="query2setDate"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query2setDateTime" id="query2setDateTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="querysetDateImg" class="imgStyle">
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
				<!--
//if (!="over" && 2!=1)     
/tr
//end 
//set ($inume =1) -->
			
					<td align="right"  i18n="tasks"  ></td>
					<td align="left" colspan="3"  ><!----><table class="innerTable">
							<tr>
								<td   ><input  id="querytasks"  jsId="querytasks" class="selectInput" dojoType="dijit.form.myFilteringSelect" store="dojoTaskForm.tasksStore"  /></td><td align="left" ><div dojoType="dijit.form.myDropDownButton" iconClass="dialogIcon" class="downButtonStyle"  ><div dojoType="dijit.TooltipDialog"  href="../common/querytasksForTaskFormFloat.html"title="detail" execute="" ></div></div>
					</td>
							</tr>
						</table></td>  
					
				
					<td align="right"  i18n="car"  ></td>
					<td align="left" ><table class="innerTable">
							<tr>
								<td   ><input  id="querycar"  jsId="querycar" class="selectInput" dojoType="dijit.form.myFilteringSelect" store="dojoTaskForm.carStore"  /></td><td align="left" ><div dojoType="dijit.form.myDropDownButton" iconClass="dialogIcon" class="downButtonStyle"  ><div dojoType="dijit.TooltipDialog"  href="../common/querycarForTaskFormFloat.html"title="detail" execute="" ></div></div></td>
							</tr>
						</table></td>
					</tr>
					
	
          <tr align="center"><td ></td>
           <td colspan="3"></td><td colspan="3" align="left"> <button dojoType="dijit.form.Button" onclick="querybutton();" iconClass="queryIcon"  i18n="query" >query</button>&nbsp;&nbsp;&nbsp;
           <button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="2"></td></tr>
         </table>
	     </div>
<table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   TaskForm List</b></td>
		<td align="right" >
				<button dojoType="dijit.form.Button" onclick="adddis();" iconClass="openDivIcon"  i18n="edit" >openAdd</button>&nbsp;
				<button dojoType="dijit.form.Button" onclick="querydis();" iconClass="openQueryIcon"  i18n="openQuery" >query</button>
				<span id="rowCount"></span>
	  <button dojoType="dijit.form.myButton" onclick="upPage();"  id="but6" disabled='true' jsId="but6" iconClass="upPageIcon" ></button>
        <button dojoType="dijit.form.myButton" onclick="downPage();" id="but7" disabled='true' jsId="but7" iconClass="downPageIcon" ></button>
        <div id="668" dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
  			  <div dojoType="dijit.Menu">
				  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChange(this.label);"></div>
				  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChange(this.label);"></div>
		      <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChange(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChange(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpage();"></div>
		      </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
        </div>
			          	     <!--button dojoType="dijit.form.Button" onclick="addRow();" iconClass="addIcon" i18n="add" >add</button-->
					 <!--button dojoType="dijit.form.Button" onclick="addDivAdd();" iconClass="addIcon"  >add</button-->
	                 <!--button dojoType="dijit.form.Button" onclick="removeSelectedRowsGrid();" iconClass="delIcon" i18n="delete" >delete</button>
	                 <button dojoType="dijit.form.Button" id="but3" jsId="but3" onclick="call_funUpd();" i18n="save" iconClass="saveIcon">save</button-->
		</td>
	</tr>
</table>    
	    <div style="{height:90%;width:100%}"  >
	         <div id="grid"  dojoType="dojox.Grid" autoWidth="false"  jsId="grid"	model="model"  structure="layoutSingleRow" singleClickEdit="true" ></div>
      </div>      
    
			  
</body>
<script type="text/javascript">trans18tag();</script>
</html>		 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
