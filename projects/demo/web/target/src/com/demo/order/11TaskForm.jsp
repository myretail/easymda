<%
String peopleId = request.getParameter("peopleId");
%>
<html>
<!--Ò»Ô¶à£¬Ö»Ò»Ò»Ó±í£¬Ã»Ð¿Ò»Ô¶Ó±var dataChild=querydataTaskForm[inRowIndex]-->
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
            dojo.require("dojox.grid.Grid");
            dojo.require("dojox.validate._base");
            dojo.require("dojox.grid._data.model");
			dojo.require("dijit.Tree");
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
			dojo.require("projectDojo.TaskForm");
     </script>
        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 			<script type="text/javascript" src="../order/TaskFormGridStyle2.js"></script>
	 <script type="text/javascript" >
		var dojoTaskForm= new  projectDojo.TaskForm();
	    dojoTaskForm.initTaskForm();
	//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
																			</script>
	 	 					<script type="text/javascript" src="../order/TaskSubQuery.js"></script>
			
			<!--sub Table script    eg:taskRow.js    Ð¶Ç·Îªí£¬Ò³Ê¼Ó±childRow=0-->
							 
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
	  var modelTaskFormDetail;
	  var modelTaskFormChild;
	  

//have set function's manageableAssociationEnds
	function tasksSet(id,value){
        	/*var itemselect=tasksStore._getItemByIdentity(value);
				if(itemselect!='undefined'&& itemselect!=null){
				}*/
	}
	function carSet(id,value){
        	/*var itemselect=carStore._getItemByIdentity(value);
				if(itemselect!='undefined'&& itemselect!=null){
				}*/
	}

										//begin buildLayout
var mainLayout =[{//Þ¸Ä¸ÒªÏ¢Ö¶Ê±ÒªÞ¸Ó¦colSpantoggle
					onBeforeRow: onBeforeRow,
					 cells: [
                      [
						{ name: i18nStr.detail, width: 3, get: getCheckTaskForm, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
				  				  {name: i18nStr.setDate,field:2, width: 8}
						  						  				,   {name: i18nStr.formState, field: 3,width: 10}
						  						  				,   {name: i18nStr.remark, field: 4,width: 10}
						  				
//
				//
					 ,   {name: i18nStr.car,field: 5,get:function(inRowIndex){ var str='';if(querydataTaskForm[inRowIndex]!=undefined && querydataTaskForm[inRowIndex][5]!=undefined){str=querydataTaskForm[inRowIndex][5][2];} return str;} ,width: 10 }
										],[
							
							{ name: '\u8be6\u7ec6', colSpan: 6 ,styles: 'padding: 0; margin: 0;', get: getSubTaskForm }//value: '<div style="height:0px; background-color: white;"></div>'
						  ]
				  ]
	  
				}];	 
				
function getSubTaskForm(inRowIndex){
		var cell = this;
		setTimeout(function() { buildSubgridTaskForm(inRowIndex, cell); }, 0);
		var h =0;
		if(detailRowsTaskForm[inRowIndex]&&querydataTaskForm[inRowIndex][5].length>0){
							h=65+25*querydataTaskForm[inRowIndex][5].length;  		}
	return '<div style="height:'+h+'px; background-color: white;"></div>';
}				

//end buildLayout

var detailRowsTaskForm=[];

function onBeforeRow(inDataIndex, inRow) {	if (inRow[1]!=undefined)inRow[1].hidden = !detailRowsTaskForm[inDataIndex];}	

function toggleTaskForm(inIndex, inShow) {
        			if (!inShow) destroySubGridIdGeneral('',querydataTaskForm[inIndex][1],"TaskFormMainDetail");
					if (!inShow) destroySubGridIdGeneral('',querydataTaskForm[inIndex][1],"TaskFormChild");
				    detailRowsTaskForm[inIndex] = inShow;
				    dijit.byId("gridTaskForm").updateRow(inIndex); 
				    
    } 

function getCheckTaskForm(inRowIndex) {
	var image = (detailRowsTaskForm[inRowIndex] ? 'open.gif' : 'closed.gif');
	var show = (detailRowsTaskForm[inRowIndex] ? 'false' : 'true');
	return '<img src="../image/' + image + '" onclick="toggleTaskForm(' + inRowIndex + ', ' + show + ')" height="11" width="11">';
}



//function makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString) {return parentRowIndex+"_"+idString+"_" + inRowIndex;		}

//function destroySubGridIdGeneral(parentRowIndex,inRowIndex,idString) {	var subGrid = dijit.byId(makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString));	if (subGrid) subGrid.destroy();	}

	  
function buildSubgridTaskForm(inRowIndex, inCell) {  //makeSubgridIdMainDetail(id)Ç¸idmainDetailGridid
	if(inCell!=undefined && inCell.getNode(inRowIndex)!=undefined){
		var child = inCell.getNode(inRowIndex).firstChild;
		var idmainDetail = makeSubGridIdGeneral('',querydataTaskForm[inRowIndex][1],"TaskFormMainDetail");//makeSubgridIdMainDetail(querydataTaskForm[inRowIndex][1]);//taskmakeSubgridId(taskRowSubdata[inRowIndex][1]);
		var idchild = makeSubGridIdGeneral('',querydataTaskForm[inRowIndex][1],"TaskFormChild");
		var subGridMainDetail = dijit.byId(idmainDetail);
		var subGridChild = dijit.byId(idchild);
		var dataChild=querydataTaskForm[inRowIndex][5];
		if(dataChild.length!=0){
			if (subGridChild){
				subGridChild.model.setData(dataChild);
				child.appendChild(subGridChild.domNode);
			}else{
				modelTaskFormChild=new dojox.grid.data.Table(null, dataChild);
				var childProps= {
								autoHeight: true, 
								autoRender: false,
								rowCount:dataChild.length,
								model:modelTaskFormChild,							};
				childProps.dataRow = inRowIndex;
				childProps.id = idchild;
				if(Math.ceil(inRowIndex/2)>inRowIndex/2){
					childProps.structure=childLayoutOdd;
				}else{
					childProps.structure=childLayout;
				}
				subGridChild = new dojox.Grid(childProps, child);//gridÎªÇ¶×±Ê±Ô¶DIVÄ´Ð¡
			}
			if (subGridChild) {
				subGridChild.render();
				subGridChild.cacheHeight = subGridChild.domNode.offsetHeight;
			}	      				
		}
		inCell.grid.rowHeightChanged(inRowIndex);
    }   
}
//var childLayout=//???????????????????????????????/ Ö±É£jshtml

function querybuttonTaskForm(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvo.id=0 ;
              queryvoTaskForm=new Object();
              d=queryDate_fun("TaskFormsetDate");
              if(d==null){validstate=1;}else if(d.upSign!="%"){queryvoTaskForm.setDate=d;}
	          if(queryTaskFormformState.getDisplayedValue()!="")queryvoTaskForm.formState=queryTaskFormformState.getDisplayedValue();//
	          if(queryTaskFormremark.getDisplayedValue()!="")queryvoTaskForm.remark=queryTaskFormremark.getDisplayedValue();//
			
	if(queryTaskFormtasks.getDisplayedValue()!=""){
				var tasksQuery= new Object();
				//tasksQuery.TaskFormName=queryTaskFormtasks.getDisplayedValue();
				tasksQuery.id=queryTaskFormtasks.getValue();
				queryvoTaskForm.tasks=tasksQuery;
			  }
	if(queryTaskFormcar.getDisplayedValue()!=""){
				var carQuery= new Object();
				//carQuery.TaskFormName=queryTaskFormcar.getDisplayedValue();
				carQuery.id=queryTaskFormcar.getValue();
				queryvoTaskForm.car=carQuery;
			  }

			if(validstate==0){
              pagenumberTaskForm=1;
              getTaskFormVO(queryvoTaskForm); 
             }      
       }

function getTaskFormVO(queryvo){
	var totalCount=0;
	deletedataTaskForm =new Array();
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
	  gridTaskForm.selection.clear();
      modelTaskForm.setData(querydataTaskForm);
      //dijit.byId("grid").updateRowCount(querydataTaskForm.length); 
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

function init(){
	
 	gridTaskForm.onStyleRow=OnStyleRowClassBlue();
	getTaskFormVO(queryvoTaskForm);
}

 dojo.addOnLoad(init);   

	function selectTaskFun(rep){
		querydataTaskForm[dojoTaskForm.selectTaskInRow][dojoTaskForm.noTask]=rep;
		gridTaskForm.updateRow(dojoTaskForm.selectTaskInRow);		
	}
	function selectcarFun(rep){
		querydataTaskForm[dojoTaskForm.selectcarInRow][dojoTaskForm.nocar]=rep;
		gridTaskForm.updateRow(dojoTaskForm.selectcarInRow);		
	}


function allopen(){
		if(styleSign==0){
          for(var i =0;i<querydataTaskForm.length;i++){
            toggleTaskForm(i,true);
          }
	    }else{
			for(var i =0;i<querydataTaskForm.length;i++){
            toggleTaskForm2(i,true);
          }
		}
 }  

function allclose(){
		if(styleSign==0){
          for(var i =0;i<querydataTaskForm.length;i++){
            toggleTaskForm(i,false);
          }
		}else{
			for(var i =0;i<querydataTaskForm.length;i++){
            toggleTaskForm2(i,false);
          }
		}
}

function pageSizeChangeTaskForm(mylabel){
	pagesizeTaskForm=mylabel;
	pagenumberTaskForm=1;
	getTaskFormVO(queryvoTaskForm);
}

function allpageTaskForm(){
	pagesizeTaskForm=0;
	getTaskFormVO(queryvoTaskForm);
}

function upPageTaskForm(){
	pagenumberTaskForm--;
	getTaskFormVO(queryvoTaskForm);
}
function downPageTaskForm(){
	pagenumberTaskForm++;
	getTaskFormVO(queryvoTaskForm);
}

function pageStyleTaskForm(style){//nomarl,col,noscroll
	gridTaskForm.scrollToRow(0);
	if(style=="simply"){
		gridTaskForm.setStructure(mainLayout);
		styleSign=0;
	}else if(style=="whole"){
		gridTaskForm.setStructure(mainLayout2);
		styleSign=2;
	/*}else if(style=="noscroll"){
		gridOrderd.setStructure(layoutNoscroll);*/
	}
}


</script>
</head>	 
<body class="tundra">
 <!--rowinum=$rowinum-->

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
							<input class="editerTime" jsid="queryTaskFormsetDateTime" id="queryTaskFormsetDateTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
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
	<button dojoType="dijit.form.Button" onclick="querydisplay('queryDivTaskForm');" iconClass="queryIcon"  i18n="openQuery" >query</button>
	<span id="rowCountTaskForm"></span>
		<button dojoType="dijit.form.myButton" onclick="upPageTaskForm();"  id="but6TaskForm" disabled='true' jsId="but6TaskForm" iconClass="upPageIcon" ></button><!--span dojoType="dijit.Tooltip" connectId="but6">pageup</span-->
		<button dojoType="dijit.form.myButton" onclick="downPageTaskForm();" id="but7TaskForm" disabled='true' jsId="but7TaskForm" iconClass="downPageIcon" ></button><!--span dojoType="dijit.Tooltip" connectId="but7">pagedown</span-->
		<div  dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
			  <div dojoType="dijit.Menu">
				  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChangeTaskForm(this.label);"></div>
				  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChangeTaskForm(this.label);"></div>
			  <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChangeTaskForm(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChangeTaskForm(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpageTaskForm();"></div>
			  </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
		</div>
		<button dojoType="dijit.form.myButton" onclick="allopen();"  iconClass="allopenIcon" ></button>
		<button dojoType="dijit.form.myButton" onclick="allclose();" iconClass="allcloseIcon"  ></button>
		</td>
	</tr>
</table>	    

<div id="gridTaskForm"  dojoType="dojox.Grid"  autoWidth="false" style="{width:100%;height:85%}" 	jsId="gridTaskForm"	model="modelTaskForm" structure="mainLayout"  ></div>
</body>
<script type="text/javascript">trans18tag();</script>
</html>					 





















					
