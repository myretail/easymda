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
			dojo.require("dojox.layout.FloatingPane");
			dojo.require("dijit.layout.TabContainer");
			dojo.require("dijit.layout.ContentPane");
            dojo.require("dijit.Menu");
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
            dojo.require("dojox.layout.FloatingPane");
            dojo.registerModulePath("mydojo", "../../../js/mydojo");
            dojo.require("mydojo.FilteringSelect");
            dojo.require("mydojo.ValidationTextBox");
            dojo.require("mydojo.NumberTextBox");
			dojo.require("dijit.Dialog");
			dojo.registerModulePath("projectDojo", "../../../dojo/projectDojo");
			dojo.require("projectDojo.TaskForm");
	//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
																			     </script>
		        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	<script type="text/javascript" >
		var dojoTaskForm= new  projectDojo.TaskForm();
	    dojoTaskForm.initTaskForm();
	//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
																			
		 function taskForm2tasksFloatPara(id){
		  //this.ID=id;
		  this.deletedatataskForm2tasks=new Array();
		  this.querydatataskForm2tasks=new Array();
		  this.pagenumbertaskForm2tasks=1;
		  this.totalCounttaskForm2tasks=0;
		  this.pagesizetaskForm2tasks=10;
		  this.orderBytaskForm2tasks='0';
		  this.queryvotaskForm2tasks=new Object();
		  //this.oddstyle='';
		  this.modeltaskForm2tasks = new dojox.grid.data.Table(null, this.querydatataskForm2tasks);
		  this.gridtaskForm2tasks=''
	 }
	 
	 var taskForm2tasksFloatArray=new Array();
		</script>	
 					<script type="text/javascript" src="../order/taskForm2tasksFloatCrudAFTab.js"></script>
			 	  			<script type="text/javascript" src="tasks.js"></script><!--sub Table script    eg:taskRow.js    Ð¶Ç·Îªí£¬Ò³Ê¼Ó±childRow=0-->
			<script type="text/javascript" >
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
	  var urle = getUrl()+ "services/BasicManageService";    
	  
//begin-----Ð¶Ç·Ó±í£¨Ç·Îªí£©-------------------------------------------------------------------------------------------	  

//end-----Ð¶Ç·Ó±í£¨Ç·Îª)-------------------------------------------------------------------------------------------
//begin-----Ã¶Ö¶Enumeration storeÄ»Ã·-------------------------------------------------------------------------------------------

//end-----Ã¶Ö¶Enumeration storeÄ»Ã·------------------------------------------------------------------------------------------- 

//begin-----Î²ÃµÄ± storeÄ»Ã·  	have set function's manageableAssociationEnds-------------------------------------------------------------------------------------------

//end-----Î²ÃµÄ± storeÄ»Ã·  	have set function's manageableAssociationEnds-------------------------------------------------------------------------------------------
 
//begin-------Ê¾Ñ¯Ð±í£¬Í·,Ó´floatÚµÍ¼------------------------------------------------------------------------------------
 //Ð¶Ï±Ö¶Ç·1212ÉµlayoutÛµlayoutstructure  (Ú²Ñ¯layoutenumerationÖ¶Î²â´¦í£©!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
										
 var layoutSingleRowQuery=[{
		//fieldÖµÄ¬ÏµË³ò£¬´jsÐµtoArray×ªØµquerydateÈ¡
	    cells: [ [
							{name: 'openFloat', styles: 'text-align: center;', width: 3, get:function(inRowIndex){return '<img src="../image/EmbedLink.gif" style="cursor:pointer" onclick="openFloat('+inRowIndex+',event);"  height="16" width="16" >';}},
                { name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
				  				  {name: i18nStr.setDate,field:2, width: 8}
						  						  				,   {name: i18nStr.formState, field: 3,width: 10}
						  						  				,   {name: i18nStr.remark, field: 4,width: 10}
						  				
//Ú¿Þ¸Äµlayout(org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[tasks] in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[tasks], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[car]])if(!true)  Ö¶Ó¦FloatÑ¡ñ´°¿Ú´
				//Ú¿Þ¸Äµlayout(org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[car] in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[tasks], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[car]])if(!false)  Ö¶Ó¦FloatÑ¡ñ´°¿Ú´
					 ,   {name: i18nStr.car,field: 6,get:function(inRowIndex){ var str='';if(querydataTaskForm[inRowIndex]!=undefined && querydataTaskForm[inRowIndex][6]!=undefined){str=querydataTaskForm[inRowIndex][6][2];} return str;} ,width: 10 }
										]]}];	 
					
					
					
					
					
					
//end-------Ê¾Ñ¯Ð±í£¬Í·,Ó´floatÚµÍ¼------------------------------------------------------------------------------------
var onloadmy=function(){
										buildtaskForm2tasks(mainID);
											}					
var mainID;
var floatIndex=0;
var flag=0;//0,1
function openFloat(indexRow,e){
	mainID=querydataTaskForm[indexRow][1];
	var FloatID ="openFloat_"+mainID;
	var openFloat = dijit.byId(FloatID);
	if(openFloat==undefined){
		if(floatIndex==5){
			floatIndex=floatIndex-1;
			flag=0;
		}else if(floatIndex==0){
			floatIndex=floatIndex+1;
			flag=1;
		}else if(flag==0){
			floatIndex=floatIndex-1;
		}else if(flag==1){
			floatIndex=floatIndex+1;
		}

		var div = dojo.doc.createElement('div');
		dojo.body().appendChild(div);
		var fp = new dojox.layout.FloatingPane({
			id:FloatID,
			title:"",
			maxable: true,
			closable: true,
			resizable: true ,
			dockable:true//,
			//onLoad:onloadmy,
			//href:"TaskFormAFFloat.html"
		},div);
		dojo.style(fp.domNode,{
			width:"1000px",
			height:"600px",
			top:80+30*floatIndex, left:120+30*floatIndex,
			position:"absolute",
			zIndex:"980"
		});
		openFloat=fp;
									buildtaskForm2tasks(mainID);
											fp.startup();
	fp.show();


dojo.connect(openFloat, "resize", function(e){
	var innerID=""+openFloat.id.replace("TaskForm","");
			taskForm2tasksFloatArray[""+innerID].gridtaskForm2tasks.resize({w: openFloat.domNode.clientWidth-16,h:openFloat.domNode.clientHeight-100});
			
}); 
	}else{
		openFloat.show();
		dojo.style(openFloat.domNode,{
			width:"1000px",
			height:"600px",
			//top:100, left:150,
			position:"absolute",
			zIndex:"980"});
	}
	
	
	if(dijit.byId("progMenu")==undefined){
		var pMenu = new dijit.Menu({contextMenuForWindow:true, id:"progMenu"});
		pMenu.addChild(new dijit.MenuItem({label:"width",iconClass:"dijitEditorIcon dijitEditorIconCut", onClick:heightFloat}));
		pMenu.addChild(new dijit.MenuItem({label:"height", iconClass:"dijitEditorIcon dijitEditorIconCut", onClick:widthFloat}));
		//pMenu.addChild(new dijit.MenuItem({label:"close all",  disabled:false , onClick:closeFloat}));
	}

}

function getAllOpenFloat(){
	var allFloatArray= [];
	for(var t in  $firstTabNameFloatArray){
		var tFloat=dijit.byId("openFloat_"+t);
		if(tFloat!=undefined){
			allFloatArray.push(tFloat);
		}
	}
	return allFloatArray;
}

function heightFloat(){
	var allFloatArray = getAllOpenFloat();
	if(allFloatArray.length!=0){
		var signHeight = dijit.byId("gridTaskForm").domNode.clientHeight/allFloatArray.length;
		var tt=0;
		for (var i=0; i<allFloatArray.length;i++){
			dojo.style(allFloatArray[i].domNode,{
			width:dijit.byId("gridTaskForm").domNode.clientWidth,
			height:signHeight,
			top:tt, left:0,
			position:"absolute",
			zIndex:"980"
		});
			allFloatArray[i].show();
			tt=tt+signHeight;
		}
	}
}

function widthFloat(){
	var allFloatArray = getAllOpenFloat();
	if(allFloatArray.length!=0){
		var signWidth = dijit.byId("gridTaskForm").domNode.clientWidth/allFloatArray.length;
		var tt=0;
		for (var i=0; i<allFloatArray.length;i++){
			//allFloatArray[i].resize({t:tt ,l : 0,w:dijit.byId("gridTaskForm").domNode.clientWidth,h:signHeight});
			dojo.style(allFloatArray[i].domNode,{
			width:signWidth,
			height:dijit.byId("gridTaskForm").domNode.clientHeight,
			top:0, left:tt,
			position:"absolute",
			zIndex:"980"
		});
			allFloatArray[i].show();
			tt=tt+signWidth;
		}
	}
}



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
 
 
function init(){
  getVOTaskForm(queryvoTaskForm);
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
//totleinum=4
 //rowinum=1

</script>
</head>
<body class="tundra">

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
						<button dojoType="dijit.form.myButton" onclick="upPageTaskForm();"  id="but6TaskForm" disabled='true' jsId="but6TaskForm" iconClass="upPageIcon" ></button>
						<button dojoType="dijit.form.myButton" onclick="downPageTaskForm();" id="but7TaskForm" disabled='true' jsId="but7TaskForm" iconClass="downPageIcon" ></button>
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
	    <div style="{height:90%;width:100%}"  >
	         <div id="gridTaskForm"  dojoType="dojox.Grid" autoWidth="false"  jsId="gridTaskForm"	model="modelTaskForm"  structure="layoutSingleRowQuery" singleClickEdit="true" ></div>
      </div>      
      
</body>
<script type="text/javascript">trans18tag();</script>
</html>
