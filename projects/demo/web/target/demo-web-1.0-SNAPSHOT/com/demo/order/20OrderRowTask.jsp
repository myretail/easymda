<%
String peopleId = request.getParameter("peopleId");
%>
<html>
<!--Ò»Ô¶à£¬Ö»Ò»Ò»Ó±í£¬Ã»Ð¿Ò»Ô¶Ó±var dataChild=querydataOrderRowTask[inRowIndex]-->
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
			dojo.require("projectDojo.OrderRowTask");
     </script>
        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	<script type="text/javascript" >
		var dojoOrderRowTask= new  projectDojo.OrderRowTask();
	    dojoOrderRowTask.initOrderRowTask();
		</script>
	 	 							<script type="text/javascript" >
	  var urlOrderRowTask = getUrl()+ "services/OrderRowTaskManageService";
	  var deletedataOrderRowTask =  new Array();
	  var querydataOrderRowTask =  new Array();
	  var pagenumberOrderRowTask=1;
	  var totalCountOrderRowTask=0;
	  var pagesizeOrderRowTask=10;
	  var orderByOrderRowTask='0';
	  var queryvoOrderRowTask=new Object();
	  var oddstyle='';
	  var modelOrderRowTask = new dojox.grid.data.Table(null, querydataOrderRowTask);
	  var urle = getUrl()+ "services/BasicManageService";
	  var modelOrderRowTaskDetail;
	  var modelOrderRowTaskChild;
	  
	function orderRowSet(id,value){
        	/*var itemselect=orderRowStore._getItemByIdentity(value);
				if(itemselect!='undefined'&& itemselect!=null){
				}*/
	}
	function taskSet(id,value){
        	/*var itemselect=taskStore._getItemByIdentity(value);
				if(itemselect!='undefined'&& itemselect!=null){
				}*/
	}

					                  // totleinum = 2 
	var mainLayout =[{//Þ¸Ä¸ÒªÏ¢Ö¶Ê±ÒªÞ¸Ó¦colSpantoggle
					onBeforeRow: onBeforeRow,
					 cells: [
                      [
						{ name: 'choise', width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },
						{ name: i18nStr.detail, width: 3, get: getCheckOrderRowTask, styles: 'text-align: center;' },
							{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
						 

	//
							   {name: i18nStr.orderRow,field: 2,get:function(inRowIndex){ var str='';var strid;if(querydataOrderRowTask[inRowIndex]!=undefined && querydataOrderRowTask[inRowIndex][2]!=undefined && querydataOrderRowTask[inRowIndex][2][1]!=undefined){str=querydataOrderRowTask[inRowIndex][2][2];strid=querydataOrderRowTask[inRowIndex][2][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" class="imgSelectStyle" onclick="dojoOrderRowTask.selectOrderRowd('+strid+','+inRowIndex+',2,0,event);"   >';} ,width: 10 }
								//
							 ,   {name: i18nStr.task,field: 3,get:function(inRowIndex){ var str='';var strid;if(querydataOrderRowTask[inRowIndex]!=undefined && querydataOrderRowTask[inRowIndex][3]!=undefined && querydataOrderRowTask[inRowIndex][3][1]!=undefined){str=querydataOrderRowTask[inRowIndex][3][2];strid=querydataOrderRowTask[inRowIndex][3][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" class="imgSelectStyle" onclick="dojoOrderRowTask.selectTask('+strid+','+inRowIndex+',3,0,event);"   >';} ,width: 10 }
								],[
				{ name: '\u8be6\u7ec6', colSpan: 5 ,styles: 'padding: 0; margin: 0;', get: getDetailOrderRowTask }//value: '<div style="height:0px; background-color: white;"></div>'
			  ]
		  ]

		}];	 


var detailRowsOrderRowTask=[];
function onBeforeRow(inDataIndex, inRow) {	if (inRow[1]!=undefined)inRow[1].hidden = !detailRowsOrderRowTask[inDataIndex];}	
function toggleOrderRowTask(inIndex, inShow) {
        			//if (!inShow) destroySubGridIdGeneral('',querydataOrderRowTask[inIndex][1],"OrderRowTaskMainDetail");
					if (!inShow) destroySubGridIdGeneral('',querydataOrderRowTask[inIndex][1],"OrderRowTaskChild");
				    detailRowsOrderRowTask[inIndex] = inShow;
				    dijit.byId("gridOrderRowTask").updateRow(inIndex); 
				    
    } 

function getCheckOrderRowTask(inRowIndex) {
	var image = (detailRowsOrderRowTask[inRowIndex] ? 'open.gif' : 'closed.gif');
	var show = (detailRowsOrderRowTask[inRowIndex] ? 'false' : 'true');
	return '<img src="../image/' + image + '" onclick="toggleOrderRowTask(' + inRowIndex + ', ' + show + ')" height="11" width="11">';
}

function getDetailOrderRowTask(inRowIndex){
	if(detailRowsOrderRowTask[inRowIndex]){
		var cell = this;
		setTimeout(function() { buildSubgridOrderRowTask(inRowIndex, cell); }, 0);  }
		var h =0;
		if(detailRowsOrderRowTask[inRowIndex]&&querydataOrderRowTask[inRowIndex][$childRow]!=undefined &&querydataOrderRowTask[inRowIndex][$childRow].length>0){
							h=65+25*querydataOrderRowTask[inRowIndex][$childRow].length;  		}
	return '<div style="height:'+h+'px; background-color: white;"></div>';
}

//function makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString) {return parentRowIndex+"_"+idString+"_" + inRowIndex;		}

//function destroySubGridIdGeneral(parentRowIndex,inRowIndex,idString) {	var subGrid = dijit.byId(makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString));	if (subGrid) subGrid.destroy();	}
var childRow= ${childRow};
var layoutInRowIndex;	  



var addrow=[];
				
addrow.splice(0,0,false,0);




function buildSubgridOrderRowTask(inRowIndex, inCell) {  //makeSubgridIdMainDetail(id)Ç¸idmainDetailGridid
	if(inCell!=undefined && inCell.getNode(inRowIndex)!=undefined){
		var child = inCell.getNode(inRowIndex).firstChild;
		//var child = inCell.getNode(inRowIndex).lastChild;
		//var idmainDetail = makeSubGridIdGeneral('',querydataOrderRowTask[inRowIndex][1],"OrderRowTaskMainDetail");//makeSubgridIdMainDetail(querydataOrderRowTask[inRowIndex][1]);//taskmakeSubgridId(taskRowSubdata[inRowIndex][1]);
		var idchild = makeSubGridIdGeneral('',querydataOrderRowTask[inRowIndex][1],"OrderRowTaskChild");
		//var subGridMainDetail = dijit.byId(idmainDetail);
		var subGridChild = dijit.byId(idchild);
		var dataChild=querydataOrderRowTask[inRowIndex][$childRow];
		if(dataChild!=undefined){
			if (subGridChild){
				subGridChild.model.setData(dataChild);
				child.appendChild(subGridChild.domNode);
			}else{
				modelOrderRowTaskChild=new dojox.grid.data.Table(null, dataChild);
				var childProps= {
								autoHeight: true, 
								autoRender: false,
								rowCount:dataChild.length,
								model:modelOrderRowTaskChild,							};
				childProps.dataRow = inRowIndex;
				childProps.id = idchild;
				if(Math.ceil(inRowIndex/2)>inRowIndex/2){
					childLayoutOdd=buildChildLayout(pre,headerstyleodd,inRowIndex);	
					childProps.structure=childLayoutOdd;
				}else{
					childLayout=buildChildLayout(pre,headerstyle,inRowIndex);
					childProps.structure=childLayout;
				}
				subGridChild = new dojox.Grid(childProps, child);//gridÎªÇ¶×±Ê±Ô¶DIVÄ´Ð¡
			}
			if (subGridChild) {
				subGridChild.render();
				subGridChild.cacheHeight = subGridChild.domNode.offsetHeight;
			}	      				
		}
		
		/*var detailDate=[];
		detailDate[0]=querydataOrderRowTask[inRowIndex];  
	    modelOrderRowTaskDetail=new dojox.grid.data.Table(null, detailDate);
		if (subGridMainDetail) {
			subGridMainDetail.model.setData(detailDate);
			mainDetail.appendChild(subGridMainDetail.domNode);
		} else {
			var mainDetailProps = {
				rowCount: 1, 
				autoHeight: true, 
				autoRender: false,
				model:modelOrderRowTaskDetail
				};
				mainDetailProps.dataRow = inRowIndex;
				mainDetailProps.id = idmainDetail;//	tasksubGridProps.widgetId = id;
				if(Math.ceil(inRowIndex/2)>inRowIndex/2){
					mainDetailProps.structure=mainDetailLayoutOdd;
				}else{
					mainDetailProps.structure=mainDetailLayout;
				}
				subGridMainDetail = new dojox.Grid(mainDetailProps, mainDetail );
		}
			
		if (subGridMainDetail) {
				subGridMainDetail.render();
				subGridMainDetail.cacheHeight = subGridMainDetail.domNode.offsetHeight;
			}*/	
		inCell.grid.rowHeightChanged(inRowIndex);
    }   
}
//var childLayout=//???????????????????????????????/ Ö±É£jshtml

function querybuttonOrderRowTask(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvo.id=0 ;
              queryvoOrderRowTask=new Object();
			
	if(queryOrderRowTaskorderRow.getDisplayedValue()!=""){
				var orderRowQuery= new Object();
				//orderRowQuery.OrderRowTaskName=queryOrderRowTaskorderRow.getDisplayedValue();
				orderRowQuery.id=queryOrderRowTaskorderRow.getValue();
				queryvoOrderRowTask.orderRow=orderRowQuery;
			  }
	if(queryOrderRowTasktask.getDisplayedValue()!=""){
				var taskQuery= new Object();
				//taskQuery.OrderRowTaskName=queryOrderRowTasktask.getDisplayedValue();
				taskQuery.id=queryOrderRowTasktask.getValue();
				queryvoOrderRowTask.task=taskQuery;
			  }

			if(validstate==0){
              pagenumberOrderRowTask=1;
              getOrderRowTaskVO(queryvoOrderRowTask); 
             }      
       }

function getOrderRowTaskVO(queryvo){
	var totalCount=0;
	deletedataOrderRowTask =new Array();
      var pu = new SOAPClientParameters2();
      pu.add('OrderRowTaskVO',queryvo) ;
      pu.add('pageNumber',pagenumberOrderRowTask) ;
	    pu.add('pageSize',pagesizeOrderRowTask) ;
	    pu.add('orderBy',orderByOrderRowTask) ;
      SOAPClient.invoke(urlOrderRowTask,"getOrderRowTask", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydataOrderRowTask=new Array();
		   querydataOrderRowTask=dojoOrderRowTask.OrderRowTaskVOtoArray_fun(ul,true);
           totalCountOrderRowTask=ul[ul.length-1]["ns:id"]; 
      }); 
      querydataOrderRowTask.splice(querydataOrderRowTask.length-1,1);
	  gridOrderRowTask.selection.clear();
      modelOrderRowTask.setData(querydataOrderRowTask);
      //dijit.byId("grid").updateRowCount(querydataOrderRowTask.length); 
	   var totalpage=Math.ceil(new Number(totalCountOrderRowTask)/pagesizeOrderRowTask);
	  
	if(totalpage>1){
		if(pagenumberOrderRowTask==1){
			dijit.byId("but6OrderRowTask").setDisabled(true);
			dijit.byId("but7OrderRowTask").setDisabled(false);
		}else if(pagenumberOrderRowTask==totalpage){
			dijit.byId("but6OrderRowTask").setDisabled(false);
			dijit.byId("but7OrderRowTask").setDisabled(true);
		}else{
			dijit.byId("but6OrderRowTask").setDisabled(false);
			dijit.byId("but7OrderRowTask").setDisabled(false);
		}
	}else{
		dijit.byId("but6OrderRowTask").setDisabled(true);
		dijit.byId("but7OrderRowTask").setDisabled(true);
	
	}
	if(pagesizeOrderRowTask==0){
		totalpage=1;
		dijit.byId("but6OrderRowTask").setDisabled(true);
		dijit.byId("but7OrderRowTask").setDisabled(true);
	}
	if(totalpage==1)pagenumberOrderRowTask=1;
	
	 document.getElementById("rowCountOrderRowTask").innerHTML=i18nStr.di+" "+pagenumberOrderRowTask+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountOrderRowTask+" "+i18nStr.rowSize; 	
}

function init(){
	
 	gridOrderRowTask.onStyleRow=OnStyleRowClassBlue();
	getOrderRowTaskVO(queryvoOrderRowTask);
}

 dojo.addOnLoad(init);   

	function selectOrderRowdFun(rep){
		querydataOrderRowTask[dojoOrderRowTask.selectOrderRowdInRow][dojoOrderRowTask.noOrderRowd]=rep;
		gridOrderRowTask.updateRow(dojoOrderRowTask.selectOrderRowdInRow);		
	}
	function selectTaskFun(rep){
		querydataOrderRowTask[dojoOrderRowTask.selectTaskInRow][dojoOrderRowTask.noTask]=rep;
		gridOrderRowTask.updateRow(dojoOrderRowTask.selectTaskInRow);		
	}


function allopen(){
          for(var i =0;i<querydataOrderRowTask.length;i++){
            toggleOrderRowTask(i,true);
          }
 }  

function allclose(){
          for(var i =0;i<querydataOrderRowTask.length;i++){
            toggleOrderRowTask(i,false);
          }
}


function pageSizeChangeOrderRowTask(mylabel){
	pagesizeOrderRowTask=mylabel;
	pagenumberOrderRowTask=1;
	getOrderRowTaskVO(queryvoOrderRowTask);
}

function allpageOrderRowTask(){
	pagesizeOrderRowTask=0;
	getOrderRowTaskVO(queryvoOrderRowTask);
}

function upPageOrderRowTask(){
	pagenumberOrderRowTask--;
	getOrderRowTaskVO(queryvoOrderRowTask);
}
function downPageOrderRowTask(){
	pagenumberOrderRowTask++;
	getOrderRowTaskVO(queryvoOrderRowTask);
}


var addRowOrderRowTask = function(){
	gridOrderRowTask.addRow([false,0,"","",""],gridOrderRowTask.model.getRowCount());
} 

function removeOrderRowTask(){
       var s= new Array();
       var sall=gridOrderRowTask.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
          s.push(i);
          var thisCell=sall[i];
          if(thisCell[1]!=0){//the row which will be deleted
            deletedataOrderRowTask.splice(deletedataOrderRowTask.length,0,thisCell[1]);
       }}}
       gridOrderRowTask.model.remove(s);//grid.removeSelectedRows();
 }
function call_funUpdOrderRowTask() {
       var sall=gridOrderRowTask.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
         var passAll=0;
         var thisCell=sall[i];
         var padd = new SOAPClientParameters2();
         var vobject=new Object();
         vobject.id=thisCell[1];

								var manageable=new Object();
			 if(querydataOrderRowTask[i][2]!=''&&querydataOrderRowTask[i][2]!=undefined){
             manageable.id=querydataOrderRowTask[i][2][1];
             vobject.orderRow=manageable;
			 }else{
			 gridOrderRowTask.getCell(gridOrderRowTask.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
											var manageable=new Object();
			 if(querydataOrderRowTask[i][3]!=''&&querydataOrderRowTask[i][3]!=undefined){
             manageable.id=querydataOrderRowTask[i][3][1];
             vobject.task=manageable;
			 }else{
			 gridOrderRowTask.getCell(gridOrderRowTask.model.fieldArray[3]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
			


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('OrderRowTaskVO',vobject);
                SOAPClient.invoke(urlOrderRowTask, "createOrderRowTask", padd, false,  function GetEnu_callBack(ul, soapResponse){
                gridOrderRowTask.model.setDatum(ul,i,1);
				querydataOrderRowTask[i][${childRow}]=[addrow];
				});
	         }else{//modify row
                padd.add('OrderRowTaskVO',vobject);
                SOAPClient.invoke(urlOrderRowTask, "updateOrderRowTask", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
			 call_funUpdGridSub(i);
        } }}//for
//submit delete
          for(var i=0;i<deletedataOrderRowTask.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',deletedataOrderRowTask[i]);
               SOAPClient.invoke(urlOrderRowTask, "deleteOrderRowTask", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
	           });
          }
          deletedataOrderRowTask=new Array();
          //dojo.byId("rowCount").innerHTML = 'saved'; 
//submit delete end          
	
 } 

	//totleinum=2
 //rowinum=0

 
</script>
</head>	 
<body class="tundra">
<div id="queryDivOrderRowTask"  style="margin-right: 0px;  height: 80px; display:none;"  >
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



			
					<tr><td align="right"  i18n="orderRow"  ></td>
					<td align="left" ><input  id="queryOrderRowTaskorderRow"  jsId="queryOrderRowTaskorderRow" class="selectInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrderRowTask.orderRowStore"  /><div dojoType="dijit.form.myDropDownButton" iconClass="dialogIcon"  ><div dojoType="dijit.TooltipDialog"  href="../common/queryOrderRowdFloat.html"title="detail" execute="" ></div></div></td>  
					
				
					<td align="right"  i18n="task"  ></td>
					<td align="left" colspan="3"  ><!----><input  id="queryOrderRowTasktask"  jsId="queryOrderRowTasktask" class="selectInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrderRowTask.taskStore"  /><div dojoType="dijit.form.myDropDownButton" iconClass="dialogIcon"  ><div dojoType="dijit.TooltipDialog"  href="../common/queryTaskFloat.html"title="detail" execute="" ></div></div></td>  
					
	    <td align="right"    ></td><td align="right"    ></td></tr>

         <tr align="center"><td></td>
           <td colspan="1"> <button dojoType="dijit.form.Button" onclick="querybuttonOrderRowTask();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="1"><button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="3"></td></tr>
         </table>
</div>	

<table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   OrderRowTask List</b></td>
		<td align="right" >
	<button dojoType="dijit.form.Button" onclick="addRowOrderRowTask();" iconClass="addIcon" i18n="add"  >add</button>
	<button dojoType="dijit.form.Button" onclick="removeOrderRowTask();" iconClass="delIcon" i18n="delete" >delete</button>
	<button dojoType="dijit.form.Button"  onclick="call_funUpdOrderRowTask();" i18n="save" iconClass="saveIcon">save</button>
	<button dojoType="dijit.form.Button" onclick="querydisplay('queryDivOrderRowTask');" iconClass="queryIcon"  i18n="openQuery" >query</button>
	<span id="rowCountOrderRowTask"></span>
		<button dojoType="dijit.form.myButton" onclick="upPageOrderRowTask();"  id="but6OrderRowTask" disabled='true' jsId="but6OrderRowTask" iconClass="upPageIcon" ></button>
		<button dojoType="dijit.form.myButton" onclick="downPageOrderRowTask();" id="but7OrderRowTask" disabled='true' jsId="but7OrderRowTask" iconClass="downPageIcon" ></button>
		<div  dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
			  <div dojoType="dijit.Menu">
				  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChangeOrderRowTask(this.label);"></div>
				  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChangeOrderRowTask(this.label);"></div>
			  <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChangeOrderRowTask(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChangeOrderRowTask(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpageOrderRowTask();"></div>
			  </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
		</div>
		<button dojoType="dijit.form.myButton" onclick="allopen();"  iconClass="allopenIcon" i18n="allopen" ></button>
		<button dojoType="dijit.form.myButton" onclick="allclose();" iconClass="allcloseIcon" i18n="allclose"  ></button>
		</td>
	</tr>
</table>	   

<div id="gridOrderRowTask"  dojoType="dojox.Grid"  autoWidth="false" style="{width:100%;height:85%}" 	jsId="gridOrderRowTask"	model="modelOrderRowTask" structure="mainLayout"  ></div>
</body>
<script type="text/javascript">trans18tag();</script>
</html>		