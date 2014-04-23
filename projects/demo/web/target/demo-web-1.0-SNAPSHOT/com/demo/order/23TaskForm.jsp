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
			@import "../dojo/dojo-release-1.0.0/dojox/layout/resources/ExpandoPane.css"; 
      </style>
      <script type="text/javascript" src="../dojo/dojo-release-1.0.0/dojo/dojo.js"  
                djConfig="parseOnLoad: true, isDebug: true,locale: 'zh-cn', extraLocale: ['zh-TW', 'fr']"></script>
      <script>
    
            dojo.require("dojo.data.ItemFileWriteStore");
            dojo.require("dojo.parser");
            dojo.require("dijit.form.Button");
			dojo.require("dijit.Tree");
			dojo.require("dojox.layout.FloatingPane");
			dojo.require("dijit.layout.TabContainer");
			dojo.require("dijit.layout.BorderContainer");
			dojo.require("dijit.layout.ContentPane");
			dojo.require("dojox.layout.ExpandoPane");
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
			dojo.require("dijit.Dialog");
            dojo.registerModulePath("mydojo", "../../../js/mydojo");
            dojo.require("mydojo.FilteringSelect");
            dojo.require("mydojo.ValidationTextBox");
            dojo.require("mydojo.NumberTextBox");
			dojo.registerModulePath("projectDojo", "../../../dojo/projectDojo");
			dojo.require("projectDojo.TaskForm");

	//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
				//Task==Task---false
										//car==Task---false
										//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
				//TaskForm==OrderRowTask---false
										dojo.require("projectDojo.OrderRowTask");
				
     </script>
		        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 			<script type="text/javascript" src="../order/TaskFormGridStyle2F23.js"></script>
 			<script type="text/javascript" src="../order/taskForm2tasksAFTab.js"></script><!--org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityLogicImpl[Task]-->
	 	   			<script type="text/javascript" src="../order/orderRowTasks2taskAFTabForSub.js"></script><!--org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityLogicImpl[OrderRowTask]-->
	 	 
 
 			<!--script type="text/javascript" src="tasks.js"></script--><!--sub Table script    eg:taskRow.js    Ð¶Ç·Îªí£¬í²³Ê¼Ó±childRow=0-->
			<script type="text/javascript" >
	  var dojoTaskForm= new  projectDojo.TaskForm();
	  dojoTaskForm.initTaskForm();
	//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
				//Task==Task---false
										//car==Task---false
									
	//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
				//TaskForm==OrderRowTask---false
										 var dojoOrderRowTask= new  projectDojo.OrderRowTask();
			dojoOrderRowTask.initOrderRowTask();
					  
	  var urlTaskForm = getUrl()+ "services/TaskFormManageService";
	  var deletedataTaskForm =  new Array();
	  var querydataTaskForm =  new Array();
	  var pagenumberTaskForm=1;
	  var totalCountTaskForm=0;
	  var pagesizeTaskForm=10;
	  var orderByTaskForm='0';
	  var queryvoTaskForm=new Object();
	  var oddstyle='';
	  var modelTaskForm = new dojox.grid.data.Table(null, querydataTaskForm);
	  var headerstyleodd="";
	  var headerstyle="";
	  //var urle = getUrl()+ "services/BasicManageService";    
//begin-----Ð¶Ç·Ó±í£¨Ç·Îªí£©-------------------------------------------------------------------------------------------	  

//end-----Ð¶Ç·Ó±í£¨Ç·Îª)-------------------------------------------------------------------------------------------

//begin-------Ê¾Ñ¯Ð±í£¬Í·,Ó´floatÚµÍ¼------------------------------------------------------------------------------------
 //Ð¶Ï±Ö¶Ç·1212ÉµlayoutÛµlayoutstructure  (Ú²Ñ¯layoutenumerationÖ¶Î²â´¦í£©í°¡!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
										 
	var layoutSingleRowQuery=[{
		//fieldÖµÄ¬ÏµË³í©í¼´jsÐµtoArray×ªØµquerydateÈ¡
	    cells: [ [

                { name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
				  				  {name: i18nStr.setDate,field:2, width: 8}
						  						  				,   {name: i18nStr.formState, field: 3,width: 10}
						  						  				,   {name: i18nStr.remark, field: 4,width: 10}
						  				
//Ú¿Þ¸Äµlayout(org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[tasks] in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[tasks], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[car]])if(!true)  Ö¶Ó¦FloatÑ¡í¦í°¿Ú´
		//Ú¿Þ¸Äµlayout(org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[car] in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[tasks], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[car]])if(!false)  Ö¶Ó¦FloatÑ¡í¦í°¿Ú´
				 ,   {name: i18nStr.car,field: 6,get:function(inRowIndex){ var str='';if(querydataTaskForm[inRowIndex]!=undefined && querydataTaskForm[inRowIndex][6]!=undefined){str=querydataTaskForm[inRowIndex][6][2];} return str;} ,width: 10 }
									]]}];	 

					
						   
					
					
					
//end-------Ê¾Ñ¯Ð±í£¬Í·,Ó´floatÚµÍ¼------------------------------------------------------------------------------------

/*	dojo.connect(dijit.byId("TaskFormAFTab"), "selectChild", function(e){
			if (dijit.byId("TaskFormAFTab").selectedChildWidget.id=="taskForm2tasks"){
			buildtaskForm2tasks();
					}
		}); */

function resetNU(trueTab){
						NUtaskForm2tasks=true;
												NUorderRowTasks2task=true;
						}
function clickRowTab(){
									if (dijit.byId("TaskFormAFTab").selectedChildWidget.id=="taskForm2tasks"){
					buildtaskForm2tasks();
																							}else if (dijit.byId("TaskFormAFTab").selectedChildWidget.id=="orderRowTasks2task"){
					buildorderRowTasks2task(subID);
																		}
		}
				
var mainID;
function getVOTaskForm(queryvo){
	var totalCount=0;
      var pu = new SOAPClientParameters2();
      pu.add('TaskFormVO',queryvo) ;
      pu.add('pageNumber',pagenumberTaskForm) ;
	    pu.add('pageSize',pagesizeTaskForm) ;
	    pu.add('orderBy',orderByTaskForm) ;
      SOAPClient.invoke(urlTaskForm,"getTaskForm", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydataTaskForm=new Array();
		   querydataTaskForm=dojoTaskForm.TaskFormVOtoArray_fun(ul,false);
           totalCountTaskForm=ul[ul.length-1]["ns:id"]; 
      }); 
      querydataTaskForm.splice(querydataTaskForm.length-1,1);
      modelTaskForm.setData(querydataTaskForm);
      var totalpage=Math.ceil(new Number(totalCountTaskForm)/pagesizeTaskForm);
	  
	if(totalpage>1){
		if(pagenumberTaskForm==1){
			dijit.byId("but6TaskForm").setDisabled(true);
			dijit.byId("but7TaskForm").setDisabled(false);
		}else if(pagenumberTaskForm==totalpage){
			dijit.byId("but6TaskForm").setDisabled(false);
			dijit.byId("but7TaskForm").setDisabled(true);
		}else{
			dijit.byId("but6TaskForm").setDisabled(false);
			dijit.byId("but7TaskForm").setDisabled(false);
		}
	}else{
		dijit.byId("but6TaskForm").setDisabled(true);
		dijit.byId("but7TaskForm").setDisabled(true);
	
	}
	if(pagesizeTaskForm==0){
		totalpage=1;
		dijit.byId("but6TaskForm").setDisabled(true);
		dijit.byId("but7TaskForm").setDisabled(true);
	}
	if(totalpage==1)pagenumberTaskForm=1;
	
	 document.getElementById("rowCountTaskForm").innerHTML=i18nStr.di+" "+pagenumberTaskForm+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountTaskForm+" "+i18nStr.rowSize; 	
	  
	  
 }
var connecthandle=0 ;
var handle ;
function gridResize(){
TaskFormAFTab.resize({t:8,h: dijit.byId("bottomPane").domNode.clientHeight-40});
			if(gridtaskForm2tasks!=undefined)gridtaskForm2tasks.resize({h: dijit.byId("bottomPane").domNode.clientHeight-90});
	 	  			if(gridorderRowTasks2task!=undefined)gridorderRowTasks2task.resize({h: dijit.byId("bottomPane").domNode.clientHeight-90});
	 	 		gridTaskForm.resize({h:document.body.clientHeight-dijit.byId("bottomPane").domNode.clientHeight-36});
}		
function init(){
  getVOTaskForm(queryvoTaskForm);
  var m = dijit.byId("bottomPane"); 
  if(m._showing)m.toggle();
  
setTimeout(function(){
	gridTaskForm.resize({h: document.body.clientHeight-86});
		dojo.connect(dijit.byId("TaskFormAFTab"), "selectChild", function(e){
		dojo.byId("taskForm2tasksTable").style.visibility="hidden";
				dojo.byId("orderRowTasks2taskTable").style.visibility="hidden";
		dojo.byId(dijit.byId("TaskFormAFTab").selectedChildWidget.id+"Table").style.visibility="visible";
	clickRowTab();
	}); 
		dojo.connect(dijit.byId("bottomPane"), "_showEnd", function(e){
		if(connecthandle==0){
			handle=dojo.connect(dijit.byId("gridTaskForm"), "doclick", function(e){
													if(e.cellIndex < 6){
				mainID=querydataTaskForm[e.rowIndex][1];
				resetNU();
				clickRowTab();	}	
			});
			connecthandle=1;
		}
		gridResize();
	  });
	  dojo.connect(dijit.byId("bottomPane"), "_hideEnd", function(e){
	  gridResize();
		if(connecthandle==1){
			dojo.disconnect(handle);
			connecthandle=0;
		}
	  });	
	  
	   dojo.connect(dijit.byId("bottomPane"), "_afterResize", function(e){
			gridResize();
	  }); 
	  
	},0);
  
}

 dojo.addOnLoad(init);   
function querybuttonTaskForm(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvoTaskForm.id=0 ;
              queryvoTaskForm=new Object();
								  d=queryDate_fun("TaskFormsetDate");
					  if(d==null){validstate=1;}else if(d.upSign!="%"){queryvoTaskForm.setDate=d;}
											  if(queryTaskFormformState.getDisplayedValue()!="")queryvoTaskForm.formState=queryTaskFormformState.getDisplayedValue();//
											  if(queryTaskFormremark.getDisplayedValue()!="")queryvoTaskForm.remark=queryTaskFormremark.getDisplayedValue();//
							
	if(queryTaskFormtasks.getDisplayedValue()!=""){
				var TaskFormtasksQuery= new Object();
				//tasksQuery.TaskFormName=querytasks.getDisplayedValue();
				TaskFormtasksQuery.id=queryTaskFormtasks.getValue();
				queryvoTaskForm.tasks=TaskFormtasksQuery;
			  }
	if(queryTaskFormcar.getDisplayedValue()!=""){
				var TaskFormcarQuery= new Object();
				//carQuery.TaskFormName=querycar.getDisplayedValue();
				TaskFormcarQuery.id=queryTaskFormcar.getValue();
				queryvoTaskForm.car=TaskFormcarQuery;
			  }

			if(validstate==0){
              pagenumber=1;
			  getVOTaskForm(queryvoTaskForm);
              //getVO(queryvoTaskForm,pagenumber,pagesize,'0'); 
              //if(totalpage>1){dijit.byId("but7").setDisabled(false);}else{dijit.byId("but7").setDisabled(true);} 
             }      
       }

function pageSizeChangeTaskForm(mylabel){
	pagesizeTaskForm=mylabel;
	pagenumberTaskForm=1;
	getVOTaskForm(queryvoTaskForm);
}

function allpageTaskForm(){
	pagesizeTaskForm=0;
	getVOTaskForm(queryvoTaskForm);
}

function upPageTaskForm(){
	pagenumberTaskForm--;
	getVOTaskForm(queryvoTaskForm);
}
function downPageTaskForm(){
	pagenumberTaskForm++;
	getVOTaskForm(queryvoTaskForm);
}
//totleinum=4
 //rowinum=1


</script>
</head>
<body class="tundra">
<div id="bc" style="width:100%; height:100%;" dojoType="dijit.layout.BorderContainer">
<div dojoType="dijit.layout.ContentPane"  title="" region="center" id="topPane" 	 >
<div id="queryDivTaskForm" style="margin-right: 0px;  height: 100px; display:none;" >
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
						<td align="left"  colspan="3"><span id="queryTaskFormsetDateImg0"  ><input class="editerDate"   jsId="queryTaskFormsetDate" id="queryTaskFormsetDate"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTime" jsId="queryTaskFormsetDateTime" id="queryTaskFormsetDateTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span id="queryTaskFormsetDateImg1" style="{display:none}" ><input class="editerDateSmaller"   jsId="query1TaskFormsetDate" id="query1TaskFormsetDate"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query1TaskFormsetDateTime" id="query1TaskFormsetDateTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryTaskFormsetDateImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryTaskFormsetDateImgdown" >></span>
							<span id="queryTaskFormsetDateImg2div" style="{display:none}"><input class="editerDateSmaller"   jsId="query2TaskFormsetDate" id="query2TaskFormsetDate"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query2TaskFormsetDateTime" id="query2TaskFormsetDateTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="queryTaskFormsetDateImg" class="imgStyle">
						</td>
													<td align="right" colspan="2" ></td>
						<td align="right"  i18n="formState" >formState:</td>
						<td align="left"  >
							 								<input type="text" class="editerInput"  id="queryTaskFormformState"  jsId="queryTaskFormformState"   dojoType="dijit.form.TextBox"  />  
													</td></tr>
					                <tr>
							<td align="right" i18n="remark" >remark:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="queryTaskFormremark"  jsId="queryTaskFormremark"   dojoType="dijit.form.TextBox"  />
													</td>
				
			
					<td align="right"  i18n="tasks"  ></td>
					<td align="left" colspan="3"  ><!----><input  id="queryTaskFormtasks"  jsId="queryTaskFormtasks" class="selectInput" dojoType="dijit.form.myFilteringSelect" store="dojoTaskForm.tasksStore"  /><div dojoType="dijit.form.myDropDownButton" iconClass="dialogIcon"  ><div dojoType="dijit.TooltipDialog"  href="../common/queryTaskFloat.html"title="detail" execute="" ></div></div></td>  
					
				
					<td align="right"  i18n="car"  ></td>
					<td align="left" ><input  id="queryTaskFormcar"  jsId="queryTaskFormcar" class="selectInput" dojoType="dijit.form.myFilteringSelect" store="dojoTaskForm.carStore"  /><div dojoType="dijit.form.myDropDownButton" iconClass="dialogIcon"  ><div dojoType="dijit.TooltipDialog"  href="../common/querycarFloat.html"title="detail" execute="" ></div></div></td>
					</tr>
					
	
         <tr align="center"><td></td>
           <td colspan="1"> <button dojoType="dijit.form.Button" onclick="querybuttonTaskForm();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="1"><button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="3"></td></tr>
         </table>
	    </div>		
<table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   TaskForm List</b></td>
		<td align="right" >

				<button dojoType="dijit.form.Button" onclick="querydisplay('queryDivTaskForm');" iconClass="openQueryIcon"  i18n="openQuery" >query</button>
				<span id="rowCountTaskForm"></span>
						<button dojoType="dijit.form.myButton" onclick="upPageTaskForm();"  id="but6TaskForm" disabled='true' jsId="but6TaskForm" iconClass="upPageIcon" >pageup</button><!--span dojoType="dijit.Tooltip" connectId="but6">pageup</span-->
						<button dojoType="dijit.form.myButton" onclick="downPageTaskForm();" id="but7TaskForm" disabled='true' jsId="but7TaskForm" iconClass="downPageIcon" >pagedown</button><!--span dojoType="dijit.Tooltip" connectId="but7">pagedown</span-->
						<div  dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
							  <div dojoType="dijit.Menu">
								  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChangeTaskForm(this.label);"></div>
								  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChangeTaskForm(this.label);"></div>
							  <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChangeTaskForm(this.label);"></div>
									<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChangeTaskForm(this.label);"></div>
									<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpageTaskForm();"></div>
							  </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
						</div>
		</td>
	</tr>
</table>	       	
       <div id="gridTaskForm"  dojoType="dojox.Grid" autoWidth="false"  jsId="gridTaskForm"	model="modelTaskForm"  structure="layoutSingleRowQuery"  ></div>
    </div>  
	<div dojoType="dojox.layout.ExpandoPane" splitter="true" duration="125" region="bottom" title="relative data" style="height:375px;" id="bottomPane" jsId="bottomPane" >
								<table id="taskForm2tasksTable"  style=" position:absolute;top:0px; left:500px; width:50%;  visibility:visible;z-index:9000 ">
				<tr height="25px" width="100%">
		<td align="right" >
					<span id="rowCounttaskForm2tasks"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button dojoType="dijit.form.myButton" onclick="upPagetaskForm2tasks();"  id="but6taskForm2tasks" disabled='true' jsId="but6taskForm2tasks" iconClass="upPageIcon" >pageup</button>
					<button dojoType="dijit.form.myButton" onclick="downPagetaskForm2tasks();" id="but7taskForm2tasks" disabled='true' jsId="but7taskForm2tasks" iconClass="downPageIcon" >pagedown</button>
	</td></tr></table>
																					<table id="orderRowTasks2taskTable"  style=" position:absolute;top:0px;left:500px; width:50%; visibility:hidden ;z-index:9000">
								<tr height="25px" width="100%">
	<!--td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   orderRowTasks2task List</b></td-->
		<td align="right" >
					<span id="rowCountorderRowTasks2task"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button dojoType="dijit.form.myButton" onclick="upPageorderRowTasks2task();"  id="but6orderRowTasks2task" disabled='true' jsId="but6orderRowTasks2task" iconClass="upPageIcon" >pageup</button>
					<button dojoType="dijit.form.myButton" onclick="downPageorderRowTasks2task();" id="but7orderRowTasks2task" disabled='true' jsId="but7orderRowTasks2task" iconClass="downPageIcon" >pagedown</button>
	</td></tr></table>
							<div dojoType="dijit.layout.TabContainer" style="height:100%;width:99%; position:absolute;top:8px;"   id="TaskFormAFTab" jsId="TaskFormAFTab"  >
						<div dojoType="dijit.layout.ContentPane" title="taskForm2tasks"  id="taskForm2tasks" jsId="taskForm2tasks" >
				<div id="gridtaskForm2tasks" dojoType="dojox.Grid" autoWidth="false"  jsId="gridtaskForm2tasks"	model="modeltaskForm2tasks"  structure="layouttaskForm2tasks"  ></div>
			</div>
							
						<div dojoType="dijit.layout.ContentPane" title="orderRowTasks2task"  id="orderRowTasks2task" jsId="orderRowTasks2task" >
				<div id="gridorderRowTasks2task" dojoType="dojox.Grid" autoWidth="false"  jsId="gridorderRowTasks2task"	model="modelorderRowTasks2task"  structure="layoutorderRowTasks2task"  ></div>
			</div>
						
	</div> 
</div>	
</body>
<script type="text/javascript">trans18tag();</script>
</html>
  