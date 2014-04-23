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
			dojo.require("dijit.Dialog");
            dojo.registerModulePath("mydojo", "../../../js/mydojo");
            dojo.require("mydojo.FilteringSelect");
            dojo.require("mydojo.ValidationTextBox");
            dojo.require("mydojo.NumberTextBox");
			dojo.registerModulePath("projectDojo", "../../../dojo/projectDojo");
			dojo.require("projectDojo.Task");
	//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
				//TaskForm==OrderRowTask---false
										dojo.require("projectDojo.OrderRowTask");
				
		 function orderRowTasks2taskFloatPara(id){
		  //this.ID=id;
		  this.deletedataorderRowTasks2task=new Array();
		  this.querydataorderRowTasks2task=new Array();
		  this.pagenumberorderRowTasks2task=1;
		  this.totalCountorderRowTasks2task=0;
		  this.pagesizeorderRowTasks2task=10;
		  this.orderByorderRowTasks2task='0';
		  this.queryvoorderRowTasks2task=new Object();
		  //this.oddstyle='';
		  this.modelorderRowTasks2task = new dojox.grid.data.Table(null, this.querydataorderRowTasks2task);
		  this.gridorderRowTasks2task=''
	 }
	 
	 var orderRowTasks2taskFloatArray=new Array();
		
     </script>
		        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>

 					<script type="text/javascript" src="../order/orderRowTasks2taskFloatAFTab.js"></script>
		
	 	  		<script type="text/javascript" >
	  var dojoTask= new  projectDojo.Task();
	  dojoTask.initTask();
	//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
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
//begin-----Ð¶Ç·Ó±í£¨Ç·Îªí£©-------------------------------------------------------------------------------------------	  

//end-----Ð¶Ç·Ó±í£¨Ç·Îª)-------------------------------------------------------------------------------------------

 
//begin-------Ê¾Ñ¯Ð±í£¬Í·,Ó´floatÚµÍ¼------------------------------------------------------------------------------------
 //Ð¶Ï±Ö¶Ç·1212ÉµlayoutÛµlayoutstructure  (Ú²Ñ¯layoutenumerationÖ¶Î²â´¦í£©!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 										var layoutSingleRowQuery=[{
		//fieldÖµÄ¬ÏµË³ò£¬´jsÐµtoArray×ªØµquerydateÈ¡
	    cells: [ [
							{name: 'openFloat', styles: 'text-align: center;', width: 3, get:function(inRowIndex){return '<img src="../image/EmbedLink.gif" style="cursor:pointer"  onclick="openFloat('+inRowIndex+',event);"  height="16" width="16" >';}},
                { name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
				  				  {name: i18nStr.num,field:2, width: 8}
						  						  				 ,  {name: i18nStr.volumne,field:3, width: 8}
						  						  				,   {name: i18nStr.remark, field: 4,width: 10}
						  				
//Ú¿Þ¸Äµlayout(org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[taskForm] in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[taskForm]])if(!false)  Ö¶Ó¦FloatÑ¡ñ´°¿Ú´
					 ,   {name: i18nStr.taskForm,field: 5,get:function(inRowIndex){ var str='';if(querydataTask[inRowIndex]!=undefined && querydataTask[inRowIndex][5]!=undefined){str=querydataTask[inRowIndex][5][2];} return str;} ,width: 10 }
										]]}];	 
					
					
					
					
					
//end-------Ê¾Ñ¯Ð±í£¬Í·,Ó´floatÚµÍ¼------------------------------------------------------------------------------------
var onloadmy=function(){
										buildorderRowTasks2task(mainID);
											}					
var mainID;
var floatIndex=0;
var flag=0;//0,1

function openFloat(indexRow,e){
	mainID=querydataTask[indexRow][1];
	var FloatID ="openFloat_"+mainID;//É´ò¿ª¶floatÎ´Êµ
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
			title:"float",
			maxable: true,
			closable: true,
			resizable: true ,
			dockable:true//,
			//onLoad:onloadmy,
			//href:"TaskQueryAFFloat.html"
		},div);
		dojo.style(fp.domNode,{
			width:"1000px",
			height:"600px",
			top:80+30*floatIndex, left:120+30*floatIndex,
			position:"absolute",
			zIndex:"980"
		});
		openFloat=fp;
											buildorderRowTasks2task(mainID);
											fp.startup();
	fp.show();


dojo.connect(openFloat, "resize", function(e){
	var innerID=""+openFloat.id.replace("Task","");
			orderRowTasks2taskFloatArray[""+innerID].gridorderRowTasks2task.resize({w: openFloat.domNode.clientWidth-16,h:openFloat.domNode.clientHeight-100});
			
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
		var signHeight = dijit.byId("gridTask").domNode.clientHeight/allFloatArray.length;
		var tt=0;
		for (var i=0; i<allFloatArray.length;i++){
			dojo.style(allFloatArray[i].domNode,{
			width:dijit.byId("gridTask").domNode.clientWidth,
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
		var signWidth = dijit.byId("gridTask").domNode.clientWidth/allFloatArray.length;
		var tt=0;
		for (var i=0; i<allFloatArray.length;i++){
			//allFloatArray[i].resize({t:tt ,l : 0,w:dijit.byId("gridTask").domNode.clientWidth,h:signHeight});
			dojo.style(allFloatArray[i].domNode,{
			width:signWidth,
			height:dijit.byId("gridTask").domNode.clientHeight,
			top:0, left:tt,
			position:"absolute",
			zIndex:"980"
		});
			allFloatArray[i].show();
			tt=tt+signWidth;
		}
	}
}




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
 
function init(){
  getVOTask(queryvoTask);
}

 dojo.addOnLoad(init);   
function querybutton(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvoTask.id=0 ;
              queryvoTask=new Object();
								  n=queryNumber_fun("num");
					  if(n==null){validstate=1;}else if(n.upSign!="%"){queryvoTask.num=n;}  
											  n=queryNumber_fun("volumne");
					  if(n==null){validstate=1;}else if(n.upSign!="%"){queryvoTask.volumne=n;}  
											  if(queryremark.getDisplayedValue()!="")queryvoTask.remark=queryremark.getDisplayedValue();//
							
	if(querytaskForm.getDisplayedValue()!=""){
				var taskFormQuery= new Object();
				//taskFormQuery.Name=querytaskForm.getDisplayedValue();
				taskFormQuery.id=querytaskForm.getValue();
				queryvoTask.taskForm=taskFormQuery;
			  }

			if(validstate==0){
              pagenumber=1;
			  getVOTask(queryvoTask);
              //getVO(queryvoTask,pagenumber,pagesize,'0'); 
              //if(totalpage>1){dijit.byId("but7").setDisabled(false);}else{dijit.byId("but7").setDisabled(true);} 
             }      
       }
//totleinum=4
 //rowinum=1

</script>
</head>
<body class="tundra">

<div id="queryDiv" style="margin-right: 0px;  height: 100px; display:none;" >
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
							<span id="querynumImg0"  ><input type="text" class="editerNumber"   jsId="querynum"  id="querynum"  dojoType="mydojo.NumberTextBox"  /></span>
							<span id="querynumImg1" style="{display:none}" ><input type="text"  class="editerNumberSmall" jsId="querynum1"  id="querynum1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="querynumImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="querynumImgdown" >></span>
							<span id="querynumImg2div" style="{display:none}"> <input type="text"  class="editerNumberSmall"  jsId="querynum2"  id="querynum2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/nStart.gif" onclick="queryType(this);" id="querynumImg" class="imgStyle">
							
						</td>
														<td align="right" i18n="volumne" >volumne:</td>
							<td align="left" colspan="3" >
								<span id="queryvolumneImg0"  ><input type="text" class="editerNumber" jsId="queryvolumne"  id="queryvolumne"  dojoType="mydojo.NumberTextBox"  /></span>
								<span id="queryvolumneImg1"  style="{display:none}" ><input type="text" class="editerNumberSmall" jsId="queryvolumne1"  id="queryvolumne1"  dojoType="mydojo.NumberTextBox"  /></span>
								<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryvolumneImgup">></span>
								<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryvolumneImgdown" >></span>
								<span id="queryvolumneImg2div" style="{display:none}"> <input type="text" class="editerNumberSmall"  jsId="queryvolumne2"  id="queryvolumne2"  dojoType="mydojo.NumberTextBox"  /></span>
								<img src="../image/nStart.gif" onclick="queryType(this);" id="queryvolumneImg" class="imgStyle">
							</td>  
																				<td align="right"  i18n="remark" >remark:</td>
						<td align="left"  >
													<input type="text" class="editerInput"  id="queryremark"  jsId="queryremark"   dojoType="dijit.form.TextBox"  />
												</td>  
										  </tr>
			
			
					<tr><td align="right"  i18n="taskForm"  ></td>
					<td align="left" ><input  id="querytaskForm"  jsId="querytaskForm" class="selectInput" dojoType="dijit.form.myFilteringSelect" store="dojoTask.taskFormStore"  /><div dojoType="dijit.form.myDropDownButton" iconClass="dialogIcon"  ><div dojoType="dijit.TooltipDialog"  href="../common/queryTaskFormFloat.html"title="detail" execute="" ></div></div></td>  
					
	    <td align="right"    ></td><td align="right"    ></td><td align="right"    ></td><td align="right"    ></td></tr>

         <tr align="center"><td></td>
           <td colspan="1"> <button dojoType="dijit.form.Button" onclick="querybutton();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="1"><button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="3"></td></tr>
         </table>
	    </div>	
 <table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   Task List</b></td>
		<td align="right" >
				<button dojoType="dijit.form.Button" onclick="querydisplay('queryDiv');" iconClass="openQueryIcon"  i18n="openQuery" >query</button>
				<span id="rowCountTask"></span>
						<button dojoType="dijit.form.myButton" onclick="upPageTask();"  id="but6Task" disabled='true' jsId="but6Task" iconClass="upPageIcon" ></button>
						<button dojoType="dijit.form.myButton" onclick="downPageTask();" id="but7Task" disabled='true' jsId="but7Task" iconClass="downPageIcon" ></button>
						<div  dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
							  <div dojoType="dijit.Menu">
								  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChangeTask(this.label);"></div>
								  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChangeTask(this.label);"></div>
							  <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChangeTask(this.label);"></div>
									<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChangeTask(this.label);"></div>
									<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpageTask();"></div>
							  </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
						</div>
			</div>    
	    <div style="{height:90%;width:100%}"  >
	         <div id="gridTask"  dojoType="dojox.Grid" autoWidth="false"  jsId="gridTask"	model="modelTask"  structure="layoutSingleRowQuery" singleClickEdit="true" ></div>
		</td>
	</tr>
</table>    
      
</body>
<script type="text/javascript">trans18tag();</script>
</html>
