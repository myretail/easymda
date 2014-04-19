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
			dojo.require("dojox.layout.FloatingPane");
			dojo.require("dijit.layout.TabContainer");
			dojo.require("dijit.layout.BorderContainer");
			dojo.require("dijit.layout.ContentPane");
			dojo.require("dojox.layout.ExpandoPane");
            dojo.require("dijit.Menu");
			dojo.require("dijit.Dialog");
			dojo.require("dijit.Tree");
            dojo.require("dojox.grid.Grid");
            dojo.require("dojox.validate._base");
            dojo.require("dojox.grid._data.model");
            dojo.require("dijit.form.ValidationTextBox");
            dojo.require("dijit.form.TextBox");
            dojo.require("dijit.form.FilteringSelect");
            dojo.require("dijit.form.ComboBox");
            dojo.require("dijit.form.Textarea");
            dojo.require("dojox.grid._data.dijitEditors");
            dojo.registerModulePath("mydojo", "../../../js/mydojo");
            dojo.require("mydojo.FilteringSelect");
            dojo.require("mydojo.ValidationTextBox");
            dojo.require("mydojo.NumberTextBox");
			dojo.registerModulePath("projectDojo", "../../../dojo/projectDojo");
			dojo.require("projectDojo.Task");

	//??¡è???????????????¨¨?¡§		
				//TaskForm==OrderRowTask---false
										dojo.require("projectDojo.OrderRowTask");
				     </script>
		        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	
 			<script type="text/javascript" src="../order/orderRowTasks2taskRightAFTab.js"></script>
	 	  		<script type="text/javascript" >
	  var dojoTask= new  projectDojo.Task();
	  dojoTask.initTask();
	//??¡è???????????????¨¨?¡§		
				//TaskForm==OrderRowTask---false
										 var dojoOrderRowTask= new  projectDojo.OrderRowTask();
			dojoOrderRowTask.initOrderRowTask();
					  var urlTask = getUrl()+ "services/TaskManageService";
	  var deletedataTask =  new Array();
	  var querydataTask =  new Array();
	  var pagenumberTask=1;
	  var totalCountTask=0;
	  var pagesizeTask=10;
	  var orderByTask='0';
	  var queryvoTask=new Object();
	  var oddstyle='';
	  var modelTask = new dojox.grid.data.Table(null, querydataTask);
	  var urle = getUrl()+ "services/BasicManageService";    
	  
//begin-----?????¡À¨ª?¡§????¨ª??-------------------------------------------------------------------------------------------	  

//end-----?????¡À¨ª?¡§????)-------------------------------------------------------------------------------------------

//begin-------?????¡À¨ª????,??float????------------------------------------------------------------------------------------
 //???¡À????1212??layout??layoutstructure  (????layoutenumeration???????¨ª??!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
									 
	var layoutSingleRowQuery=[{
		//field????????¨°???js??toArray¡Á???querydate??
	    cells: [ [

                { name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
				  				  {name: i18nStr.num,field:2, width: 8}
						  						  				 ,  {name: i18nStr.volumne,field:3, width: 8}
						  						  				,   {name: i18nStr.remark, field: 4,width: 10}
						  				
//??????layout(org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[taskForm] in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[taskForm]])if(!false)  ????Float????¡ã???
				 ,   {name: i18nStr.taskForm,field: 5,get:function(inRowIndex){ var str='';if(querydataTask[inRowIndex]!=undefined && querydataTask[inRowIndex][5]!=undefined){str=querydataTask[inRowIndex][5][2];} return str;} ,width: 10 }
				
					]]}];	 
					
					
					
//end-------?????¡À¨ª????,??float????------------------------------------------------------------------------------------

/*	dojo.connect(dijit.byId("TaskAFTab"), "selectChild", function(e){
			if (dijit.byId("TaskAFTab").selectedChildWidget.id=="orderRowTasks2task"){
			buildorderRowTasks2task();
					}
		}); */

function resetNU(trueTab){
						NUorderRowTasks2task=true;
						}
function clickRowTab(){
							buildorderRowTasks2task();
						}
				
var mainID;
function getVOTask(queryvo){
	var totalCount=0;
      var pu = new SOAPClientParameters2();
      pu.add('TaskVO',queryvo) ;
      pu.add('pageNumber',pagenumberTask) ;
	    pu.add('pageSize',pagesizeTask) ;
	    pu.add('orderBy',orderByTask) ;
      SOAPClient.invoke(urlTask,"getTask", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydataTask=new Array();
		   querydataTask=dojoTask.TaskVOtoArray_fun(ul,false);
           totalCountTask=ul[ul.length-1]["ns:id"]; 
      }); 
      querydataTask.splice(querydataTask.length-1,1);
      modelTask.setData(querydataTask);
      var totalpage=Math.ceil(new Number(totalCountTask)/pagesizeTask);
	  
	if(totalpage>1){
		if(pagenumberTask==1){
			dijit.byId("but6Task").setDisabled(true);
			dijit.byId("but7Task").setDisabled(false);
		}else if(pagenumberTask==totalpage){
			dijit.byId("but6Task").setDisabled(false);
			dijit.byId("but7Task").setDisabled(true);
		}else{
			dijit.byId("but6Task").setDisabled(false);
			dijit.byId("but7Task").setDisabled(false);
		}
	}else{
		dijit.byId("but6Task").setDisabled(true);
		dijit.byId("but7Task").setDisabled(true);
	
	}
	if(pagesizeTask==0){
		totalpage=1;
		dijit.byId("but6Task").setDisabled(true);
		dijit.byId("but7Task").setDisabled(true);
	}
	if(totalpage==1)pagenumberTask=1;
	
	 document.getElementById("rowCountTask").innerHTML=i18nStr.di+" "+pagenumberTask+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountTask+" "+i18nStr.rowSize; 	
	  
	  
 }
var connecthandle=0 ;
var handle ;
function gridResize(){
			if(gridorderRowTasks2task!=undefined)gridorderRowTasks2task.resize({w: dijit.byId("rightPane").domNode.clientWidth-16,h:dijit.byId("rightPane").domNode.clientHeight-100});
	 	 		gridTask.resize({w:document.body.clientWidth-dijit.byId("rightPane").domNode.clientWidth-36});
}
function init(){
  getVOTask(queryvoTask);
  var m = dijit.byId("rightPane"); 
  if(m._showing)m.toggle();
  
setTimeout(function(){
	gridTask.resize({w: document.body.clientWidth-60,h: document.body.clientHeight-40});
	
	dojo.connect(dijit.byId("rightPane"), "_showEnd", function(e){
		gridResize();
		if(connecthandle==0){
			handle=dojo.connect(dijit.byId("gridTask"), "doclick", function(e){
				mainID=querydataTask[e.rowIndex][1];
				resetNU();
				clickRowTab();		
			});
			connecthandle=1;
		}
	  });
	  dojo.connect(dijit.byId("rightPane"), "_hideEnd", function(e){
	  gridResize();
		if(connecthandle==1){
			dojo.disconnect(handle);
			connecthandle=0;
		}
	  });	
	  
	   dojo.connect(dijit.byId("rightPane"), "_afterResize", function(e){
		gridResize();
	  }); 
	  
	},0);
  
}

 dojo.addOnLoad(init);   
function querybuttonTask(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvoTask.id=0 ;
              queryvoTask=new Object();
								  n=queryNumber_fun("Tasknum");
					  if(n==null){validstate=1;}else if(n.upSign!="%"){queryvoTask.num=n;}  
											  n=queryNumber_fun("Taskvolumne");
					  if(n==null){validstate=1;}else if(n.upSign!="%"){queryvoTask.volumne=n;}  
											  if(queryTaskremark.getDisplayedValue()!="")queryvoTask.remark=queryTaskremark.getDisplayedValue();//
							
	if(queryTasktaskForm.getDisplayedValue()!=""){
				var TasktaskFormQuery= new Object();
				//taskFormQuery.TaskName=querytaskForm.getDisplayedValue();
				TasktaskFormQuery.id=queryTasktaskForm.getValue();
				queryvoTask.taskForm=TasktaskFormQuery;
			  }

			if(validstate==0){
              pagenumber=1;
			  getVOTask(queryvoTask);
              //getVO(queryvoTask,pagenumber,pagesize,'0'); 
              //if(totalpage>1){dijit.byId("but7").setDisabled(false);}else{dijit.byId("but7").setDisabled(true);} 
             }      
       }

function pageSizeChangeTask(mylabel){
	pagesizeTask=mylabel;
	pagenumberTask=1;
	getVOTask(queryvoTask);
}

function allpageTask(){
	pagesizeTask=0;
	getVOTask(queryvoTask);
}

function upPageTask(){
	pagenumberTask--;
	getVOTask(queryvoTask);
}
function downPageTask(){
	pagenumberTask++;
	getVOTask(queryvoTask);
}
//totleinum=4
 //rowinum=1


</script>
</head>
<body class="tundra">
<div id="bc" style="width:100%; height:100%;" dojoType="dijit.layout.BorderContainer">
<div dojoType="dijit.layout.ContentPane"  title="" region="center" id="topPane" 	 >
<div id="queryDivTask" style="margin-right: 0px;  height: 100px; display:none;" >
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
				<td align="right" i18n="num" >num:</td>
			<td align="left"  >
							<span id="queryTasknumImg0"  ><input type="text" class="editerNumber"   jsId="queryTasknum"  id="queryTasknum"  dojoType="mydojo.NumberTextBox"  /></span>
							<span id="queryTasknumImg1" style="{display:none}" ><input type="text"  class="editerNumberSmall" jsId="queryTasknum1"  id="queryTasknum1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryTasknumImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryTasknumImgdown" >></span>
							<span id="queryTasknumImg2div" style="{display:none}"> <input type="text"  class="editerNumberSmall"  jsId="queryTasknum2"  id="queryTasknum2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/nStart.gif" onclick="queryType(this);" id="queryTasknumImg" class="imgStyle">
							
						</td>
														<td align="right" i18n="volumne" >volumne:</td>
							<td align="left" colspan="3" >
								<span id="queryTaskvolumneImg0"  ><input type="text" class="editerNumber" jsId="queryTaskvolumne"  id="queryTaskvolumne"  dojoType="mydojo.NumberTextBox"  /></span>
								<span id="queryTaskvolumneImg1"  style="{display:none}" ><input type="text" class="editerNumberSmall" jsId="queryTaskvolumne1"  id="queryTaskvolumne1"  dojoType="mydojo.NumberTextBox"  /></span>
								<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryTaskvolumneImgup">></span>
								<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryTaskvolumneImgdown" >></span>
								<span id="queryTaskvolumneImg2div" style="{display:none}"> <input type="text" class="editerNumberSmall"  jsId="queryTaskvolumne2"  id="queryTaskvolumne2"  dojoType="mydojo.NumberTextBox"  /></span>
								<img src="../image/nStart.gif" onclick="queryType(this);" id="queryTaskvolumneImg" class="imgStyle">
							</td>  
																				<td align="right"  i18n="remark" >remark:</td>
						<td align="left"  >
													<input type="text" class="editerInput"  id="queryTaskremark"  jsId="queryTaskremark"   dojoType="dijit.form.TextBox"  />
												</td>  
										  </tr>
			
			
					<tr><td align="right"  i18n="taskForm"  ></td>
					<td align="left" ><input  id="queryTasktaskForm"  jsId="queryTasktaskForm" class="selectInput" dojoType="dijit.form.myFilteringSelect" store="dojoTask.taskFormStore"  /><div dojoType="dijit.form.myDropDownButton" iconClass="dialogIcon"  ><div dojoType="dijit.TooltipDialog"  href="../common/queryTaskFormFloat.html"title="detail" execute="" ></div></div></td>  
					
	    <td align="right"    ></td><td align="right"    ></td><td align="right"    ></td><td align="right"    ></td></tr>

         <tr align="center"><td></td>
           <td colspan="1"> <button dojoType="dijit.form.Button" onclick="querybuttonTask();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="1"><button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="3"></td></tr>
         </table>
	    </div>		
<table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   Task List</b></td>
		<td align="right" >
				<button dojoType="dijit.form.Button" onclick="querydisplay('queryDivTask');" iconClass="openQueryIcon"  i18n="openQuery" >query</button>
				<span id="rowCountTask"></span>
						<button dojoType="dijit.form.myButton" onclick="upPageTask();"  id="but6Task" disabled='true' jsId="but6Task" iconClass="upPageIcon" >pageup</button><!--span dojoType="dijit.Tooltip" connectId="but6">pageup</span-->
						<button dojoType="dijit.form.myButton" onclick="downPageTask();" id="but7Task" disabled='true' jsId="but7Task" iconClass="downPageIcon" >pagedown</button><!--span dojoType="dijit.Tooltip" connectId="but7">pagedown</span-->
						<div  dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
							  <div dojoType="dijit.Menu">
								  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChangeTask(this.label);"></div>
								  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChangeTask(this.label);"></div>
							  <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChangeTask(this.label);"></div>
									<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChangeTask(this.label);"></div>
									<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpageTask();"></div>
							  </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
						</div>
		</td>
	</tr>
</table>	       	
    
	         <div id="gridTask"  dojoType="dojox.Grid" autoWidth="false"  jsId="gridTask"	model="modelTask"  structure="layoutSingleRowQuery" singleClickEdit="true" ></div>
    </div>      
		
	<div dojoType="dojox.layout.ExpandoPane" splitter="true" duration="125" region="left" title="" style="width:400px;" id="rightPane" jsId="rightPane" >
		<table   style=" position:relative;top:0px; width:90%">
	<tr height="25px" width="100%">
		
						<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   orderRowTasks2task List</b></td>
			<td align="right" >
						<span id="rowCountorderRowTasks2task"></span>&nbsp;&nbsp;
						<button dojoType="dijit.form.myButton" onclick="upPageorderRowTasks2task();"  id="but6orderRowTasks2task" disabled='true' jsId="but6orderRowTasks2task" iconClass="upPageIcon" >pageup</button>
						<button dojoType="dijit.form.myButton" onclick="downPageorderRowTasks2task();" id="but7orderRowTasks2task" disabled='true' jsId="but7orderRowTasks2task" iconClass="downPageIcon" >pagedown</button>
			</td>
		</tr>
	</table>			
					<div id="gridorderRowTasks2task" dojoType="dojox.Grid" autoWidth="false"  jsId="gridorderRowTasks2task"	model="modelorderRowTasks2task"  structure="layoutorderRowTasks2task"  ></div>
				
						
	</div> 
</div>	
</body>
<script type="text/javascript">trans18tag();</script>
</html>
