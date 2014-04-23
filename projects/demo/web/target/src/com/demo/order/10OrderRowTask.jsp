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


					//begin buildLayout


var mainLayout =[{//?????????colSpantoggle
					onBeforeRow: onBeforeRow,
					 cells: [
                      [
						{ name: i18nStr.detail, width: 3, get: getCheckOrderRowTask, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
		
//
					   {name: i18nStr.orderRow,field: 2,get:function(inRowIndex){ var str='';if(querydataOrderRowTask[inRowIndex]!=undefined && querydataOrderRowTask[inRowIndex][2]!=undefined){str=querydataOrderRowTask[inRowIndex][2][2];} return str;} ,width: 10 }
					//
					 ,   {name: i18nStr.task,field: 3,get:function(inRowIndex){ var str='';if(querydataOrderRowTask[inRowIndex]!=undefined && querydataOrderRowTask[inRowIndex][3]!=undefined){str=querydataOrderRowTask[inRowIndex][3][2];} return str;} ,width: 10 }
										],[
									{ name: '\u8be6\u7ec6', colSpan: 4 ,styles: 'padding: 0; margin: 0;', get: getSubOrderRowTask }//value: '<div style="height:0px; background-color: white;"></div>'
						  ]
				  ]
	  
				}];	 
var subInt=	$childRow;			
function getSubOrderRowTask(inRowIndex){
		var cell = this;
		setTimeout(function() { buildSubgridOrderRowTask(inRowIndex, cell); }, 0);
		var h =0;
		if(detailRowsOrderRowTask[inRowIndex]&&querydataOrderRowTask[inRowIndex][$childRow].length>0){
							h=65+25*querydataOrderRowTask[inRowIndex][$childRow].length;  		}
	return '<div style="height:'+h+'px; background-color: white;"></div>';
}				

//end buildLayout

var detailRowsOrderRowTask=[];

function onBeforeRow(inDataIndex, inRow) {	if (inRow[1]!=undefined)inRow[1].hidden = !detailRowsOrderRowTask[inDataIndex];}	

function toggleOrderRowTask(inIndex, inShow) {
        			if (!inShow) destroySubGridIdGeneral('',querydataOrderRowTask[inIndex][1],"OrderRowTaskMainDetail");
					if (!inShow) destroySubGridIdGeneral('',querydataOrderRowTask[inIndex][1],"OrderRowTaskChild");
				    detailRowsOrderRowTask[inIndex] = inShow;
				    dijit.byId("gridOrderRowTask").updateRow(inIndex); 
				    
    } 

function getCheckOrderRowTask(inRowIndex) {
	var image = (detailRowsOrderRowTask[inRowIndex] ? 'open.gif' : 'closed.gif');
	var show = (detailRowsOrderRowTask[inRowIndex] ? 'false' : 'true');
	return '<img src="../image/' + image + '" onclick="toggleOrderRowTask(' + inRowIndex + ', ' + show + ')" height="11" width="11">';
}





//function makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString) {return parentRowIndex+"_"+idString+"_" + inRowIndex;		}

//function destroySubGridIdGeneral(parentRowIndex,inRowIndex,idString) {	var subGrid = dijit.byId(makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString));	if (subGrid) subGrid.destroy();	}

	  
function buildSubgridOrderRowTask(inRowIndex, inCell) {  //makeSubgridIdMainDetail(id)Ç¸idmainDetailGridid
	if(inCell!=undefined && inCell.getNode(inRowIndex)!=undefined){
		var child = inCell.getNode(inRowIndex).firstChild;
		var idmainDetail = makeSubGridIdGeneral('',querydataOrderRowTask[inRowIndex][1],"OrderRowTaskMainDetail");//makeSubgridIdMainDetail(querydataOrderRowTask[inRowIndex][1]);//taskmakeSubgridId(taskRowSubdata[inRowIndex][1]);
		var idchild = makeSubGridIdGeneral('',querydataOrderRowTask[inRowIndex][1],"OrderRowTaskChild");
		var subGridMainDetail = dijit.byId(idmainDetail);
		var subGridChild = dijit.byId(idchild);
		var dataChild=querydataOrderRowTask[inRowIndex][$childRow];
		if(dataChild.length!=0){
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
		   querydataOrderRowTask=dojoOrderRowTask.OrderRowTaskVOtoArray_fun(ul,false);
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
	
 	dojo.connect(dijit.byId("gridOrderRowTask"), "dodblclick", function(e){
	   if(document.getElementById('queryDivOrderRowTask').style.display=='')document.getElementById('queryDivOrderRowTask').style.display='none';
	   if(document.getElementById('addDivOrderRowTask').style.display=='none')document.getElementById('addDivOrderRowTask').style.display='';
		 document.getElementById('erowIndexOrderRowTask').value=e.rowIndex;
		 document.getElementById('OrderRowTaskId').value=querydataOrderRowTask[e.rowIndex][1];
		 	 			 
									dijit.byId("addOrderRowTaskorderRow").setValue(querydataOrderRowTask[e.rowIndex][2][1]);
												dijit.byId("addOrderRowTasktask").setValue(querydataOrderRowTask[e.rowIndex][3][1]);
								   
	});  
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


 
//addDiv---------------begin-------------------------------------
var addDivAdd = function(){
	 //if(document.getElementById('queryDivOrderRowTask').style.display=='')document.getElementById('queryDivOrderRowTask').style.display='none';
	 //if(document.getElementById('addDivOrderRowTask').style.display=='none')document.getElementById('addDivOrderRowTask').style.display='';
	  document.getElementById('gridSub').style.height='60px';
	 //add
					
						dijit.byId("addOrderRowTaskorderRow").setValue('');
			dijit.byId("addOrderRowTaskorderRow").setDisplayedValue('');
								dijit.byId("addOrderRowTasktask").setValue('');
			dijit.byId("addOrderRowTasktask").setDisplayedValue('');
				
	document.getElementById('OrderRowTaskId').value='0';
	
} 
function addDivSave(){
	var padd = new SOAPClientParameters2();
	var vobject=new Object();
    vobject.id=document.getElementById('OrderRowTaskId').value;
	var passAll=0;
					
			if(dijit.byId("addOrderRowTaskorderRow").isValid(true)){
			//vobject.orderRow=dijit.byId("addorderRow").getValue();
			var manageable=new Object();
			manageable.id=dijit.byId("addOrderRowTaskorderRow").getValue();
			vobject.orderRow=manageable;
		}else{
			passAll=1;
		}
				if(dijit.byId("addOrderRowTasktask").isValid(true)){
			//vobject.task=dijit.byId("addtask").getValue();
			var manageable=new Object();
			manageable.id=dijit.byId("addOrderRowTasktask").getValue();
			vobject.task=manageable;
		}else{
			passAll=1;
		}
		
if(passAll==0){
		var addrow=[];
																addrow.push([false,addOrderRowTaskorderRow.getValue(),addOrderRowTaskorderRow.getDisplayedValue()]);
												addrow.push([false,addOrderRowTasktask.getValue(),addOrderRowTasktask.getDisplayedValue()]);
						 if(vobject.id==0){//create new row
		padd.add('OrderRowTaskVO',vobject);
		SOAPClient.invoke(urlOrderRowTask, "createOrderRowTask", padd, false,  function GetEnu_callBack(ul, soapResponse){
			addrow.splice(0,0,false,ul);
			querydataOrderRowTask[querydataOrderRowTask.length]=addrow;
			document.getElementById('erowIndexOrderRowTask').value=querydataOrderRowTask.length-1;
			gridOrderRowTask.updateRowCount(querydataOrderRowTask.length);
			document.getElementById('OrderRowTaskId').value=ul;
			});
	 }else{//modify row
		padd.add('OrderRowTaskVO',vobject);
		SOAPClient.invoke(urlOrderRowTask, "updateOrderRowTask", padd, false,  function GetEnu_callBack(ul, soapResponse){
		});
		addrow.splice(0,0,false,vobject.id);
		querydataOrderRowTask[document.getElementById('erowIndexOrderRowTask').value]=addrow;
	 }
	}   call_funUpdGridSub();
	gridOrderRowTask.updateRow(document.getElementById('erowIndexOrderRowTask').value); 
}

 function addDivRemove(){
     if(window.confirm(i18nStr.deleteConfirm)){
       var s = dijit.byId("gridOrderRowTask").rowCount;
		console.log("sss:"+s);
        	  var delrowIndex=document.getElementById('erowIndexOrderRowTask').value;
              var sId=document.getElementById('OrderRowTaskId').value;
              var pdel = new SOAPClientParameters();      
               pdel.add('id',sId);
               SOAPClient.invoke(urlOrderRowTask, "deleteOrderRowTask", pdel, false,  function GetEnu_callBack(ul, soapResponse){
               if(s-1!=delrowIndex){
					var e =document.createEvent("HTMLEvents");
					e.rowIndex=delrowIndex;
					dijit.byId("gridOrderRowTask").dodblclick(e);
			   }else{if(document.getElementById('addDivOrderRowTask').style.display=='')document.getElementById('addDivOrderRowTask').style.display='none';}
			   dijit.byId("gridOrderRowTask").model.remove(delrowIndex);
			   totalCountOrderRowTask--;
			   var totalpage=Math.ceil(new Number(new Number(totalCountOrderRowTask))/pagesizeOrderRowTask);
			   document.getElementById("rowCountOrderRowTask").innerHTML=i18nStr.di+" "+pagenumberOrderRowTask+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountOrderRowTask+" "+i18nStr.rowSize; 
               
	        });   
      }
 }    
 
 function adddis(){
	
	querydisplay("addDivOrderRowTask");
	if(document.getElementById('addDivOrderRowTask').style.display!='none')addDivAdd();
} 
//addDiv---------------end---------------------------------------	 
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

</script>
</head>	 
<body class="tundra">
 <!--rowinum=$rowinum-->
 <!--addHeight=$addHeight-->
<div id="addDivOrderRowTask" style="margin-right: 0px;  height: 280px; display:none;" >
              <table align="center" width="100%" id="0" class="editorTable"  >
                <tr >
				<td align="center" style="{width:11%}" i18n="addNote" ></td>
                <td style="{width:22%}" ><input id="OrderRowTaskId" style="{display:none}"  type="text"  /></td>
                <td style="{width:11%}"><input id="erowIndexOrderRowTask" style="{display:none}"  type="text"  /></td>
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

								<tr><td align="right"  i18n="orderRow"  ></td>
					<td align="left" ><input  id="addOrderRowTaskorderRow"  jsId="addOrderRowTaskorderRow" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrderRowTask.orderRowStore" onchange="orderRowSet(0,arguments[0]);" /></td>  
														<td align="right"  i18n="task"  ></td>
					<td align="left" ><!--colspan="3" --><input  id="addOrderRowTasktask"  jsId="addOrderRowTasktask" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrderRowTask.taskStore" onchange="taskSet(0,arguments[0]);" /></td>  
						    <td align="right"    ></td><td align="right"    ></td></tr>
	

<tr><td align="right"> &nbsp;</td></tr>
	</table>
	<div style="{height:200px;}"  >
		<div id="gridSub"   dojoType="dojox.Grid" autoWidth="false" style="{width:1200px;height:200px;left:30px;}"  jsId="gridSub"	model="modelChildAdd"  structure="childAddLayout" singleClickEdit="true" ></div>
	 </div>
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button dojoType="dijit.form.Button" id="but1" jsId="but1" onclick="addRowSub();"  disabled='false' iconClass="addIcon" i18n="addRow" >addSub</button>
	 <button dojoType="dijit.form.Button" id="but2" jsId="but2" onclick="deleteSub();" disabled='false' iconClass="delIcon" i18n="delRow" >deleteSub</button>
	 <button dojoType="dijit.form.Button" onclick="addDivRemove();" iconClass="delIcon"  i18n="delete" >remove</button>
	 <button dojoType="dijit.form.Button" onclick="addDivSave();" iconClass="saveIcon"  i18n="save">save</button>
			 
</div>

 <!--rowinum=$rowinum-->

<div id="queryDivOrderRowTask" style="margin-right: 0px;  height: 80px; display:none;" >
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
	<!--button dojoType="dijit.form.Button" onclick="addRowOrderRowTask();" iconClass="addIcon" i18n="add"  >add</button>
	<button dojoType="dijit.form.Button" onclick="removeSelectedRowsOrderRowTask();" iconClass="delIcon" i18n="delete" >delete</button>
	<button dojoType="dijit.form.Button"  onclick="call_funUpdOrderRowTask();" i18n="save" iconClass="saveIcon">save</button>
	<button dojoType="dijit.form.Button" onclick="addDivAdd();" iconClass="addIcon"  >add</button-->
	<button dojoType="dijit.form.Button" onclick="adddis();" iconClass="openDivIcon"  i18n="edit" >openAdd</button>
	<button dojoType="dijit.form.Button" onclick="querydisplay('queryDivOrderRowTask');" iconClass="queryIcon"  i18n="openQuery" >query</button>
	<span id="rowCountOrderRowTask"></span>
		<button dojoType="dijit.form.myButton" onclick="upPageOrderRowTask();"  id="but6OrderRowTask" disabled='true' jsId="but6OrderRowTask" iconClass="upPageIcon" >pageup</button><!--span dojoType="dijit.Tooltip" connectId="but6">pageup</span-->
		<button dojoType="dijit.form.myButton" onclick="downPageOrderRowTask();" id="but7OrderRowTask" disabled='true' jsId="but7OrderRowTask" iconClass="downPageIcon" >pagedown</button><!--span dojoType="dijit.Tooltip" connectId="but7">pagedown</span-->
		<div  dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
			  <div dojoType="dijit.Menu">
				  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChangeOrderRowTask(this.label);"></div>
				  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChangeOrderRowTask(this.label);"></div>
			  <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChangeOrderRowTask(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChangeOrderRowTask(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpageOrderRowTask();"></div>
			  </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
		</div>
		<button dojoType="dijit.form.myButton" onclick="allopen();"  iconClass="allopenIcon" i18n="allopen" >allopen</button>
		<button dojoType="dijit.form.myButton" onclick="allclose();" iconClass="allcloseIcon" i18n="allclose"  >allclose</button>
		</td>
	</tr>
</table>	   

<div id="gridOrderRowTask"  dojoType="dojox.Grid"  autoWidth="false" style="{width:100%;height:85%}" 	jsId="gridOrderRowTask"	model="modelOrderRowTask" structure="mainLayout"  ></div>
</body>
<script type="text/javascript">trans18tag();</script>
</html>					 





















					