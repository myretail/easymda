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
			dojo.require("projectDojo.TaskForm");
     </script>
        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 	<script type="text/javascript" >
		var dojoTaskForm= new  projectDojo.TaskForm();
	    dojoTaskForm.initTaskForm();
	//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
																			</script>

	 	 					<script type="text/javascript" src="../order/TaskSubCrud.js"></script>
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


var mainLayout =[{//?????????colSpantoggle
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
					 ,   {name: i18nStr.car,field: 6,get:function(inRowIndex){ var str='';if(querydataTaskForm[inRowIndex]!=undefined && querydataTaskForm[inRowIndex][6]!=undefined){str=querydataTaskForm[inRowIndex][6][2];} return str;} ,width: 10 }
										],[
									{ name: '\u8be6\u7ec6', colSpan: 6 ,styles: 'padding: 0; margin: 0;', get: getSubTaskForm }//value: '<div style="height:0px; background-color: white;"></div>'
						  ]
				  ]
	  
				}];	 
var subInt=	5;			
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
	
 	dojo.connect(dijit.byId("gridTaskForm"), "dodblclick", function(e){
	   if(document.getElementById('queryDivTaskForm').style.display=='')document.getElementById('queryDivTaskForm').style.display='none';
	   if(document.getElementById('addDivTaskForm').style.display=='none')document.getElementById('addDivTaskForm').style.display='';
		 document.getElementById('erowIndexTaskForm').value=e.rowIndex;
		 document.getElementById('TaskFormId').value=querydataTaskForm[e.rowIndex][1];
		 	 									  dijit.byId("addTaskFormsetDate").setValue(dojo.date.locale.parse(new String(querydataTaskForm[e.rowIndex][2]),{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
				  dijit.byId("addTaskFormsetDateTime").setValue(dojo.date.locale.parse(new String(querydataTaskForm[e.rowIndex][2]),{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
						 									dijit.byId("addTaskFormformState").setValue(querydataTaskForm[e.rowIndex][3]);
						 									dijit.byId("addTaskFormremark").setValue(querydataTaskForm[e.rowIndex][4]);
						 			 
									gridSub.selection.clear();
				gridSub.refresh();
				querydataSub=[];
				querydataSub=querydataTaskForm[e.rowIndex][5];
				gridSub.model.setData(querydataSub);
				gridSub.updateRowCount(querydataSub.length);
												dijit.byId("addTaskFormcar").setValue(querydataTaskForm[e.rowIndex][6][1]);
								   
	});  
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


 
//addDiv---------------begin-------------------------------------
var addDivAdd = function(){
	 //if(document.getElementById('queryDivTaskForm').style.display=='')document.getElementById('queryDivTaskForm').style.display='none';
	 //if(document.getElementById('addDivTaskForm').style.display=='none')document.getElementById('addDivTaskForm').style.display='';
	  document.getElementById('gridSub').style.height='60px';
	 //add
										dijit.byId("addTaskFormsetDate").setValue('');
				dijit.byId("addTaskFormsetDateTime").setValue('');
																				dijit.byId("addTaskFormformState").setValue('');
																								dijit.byId("addTaskFormremark").setValue('');
														
						gridSub.selection.clear();
			gridSub.refresh();	
			querydataSub=new Array();
			gridSub.model.setData(querydataSub);
			//gridSub.model.setData([]);
			//gridSub.updateRowCount(0);
			//querydataSub=new Array();
								dijit.byId("addTaskFormcar").setValue('');
			dijit.byId("addTaskFormcar").setDisplayedValue('');
				
	document.getElementById('TaskFormId').value='0';
	
} 
function addDivSave(){
	var padd = new SOAPClientParameters2();
	var vobject=new Object();
    vobject.id=document.getElementById('TaskFormId').value;
	var passAll=0;
										if(dijit.byId("addTaskFormsetDate").getValue() instanceof Date){ 
					if(dijit.byId("addTaskFormsetDateTime").getValue() instanceof Date){
						var dsetDate=new DateTimeQuery();
						dsetDate.upDate=dojo.date.locale.format(dijit.byId("addTaskFormsetDate").getValue(), dijit.byId("addTaskFormsetDate").constraints)+" "+dojo.date.locale.format(dijit.byId("addTaskFormsetDateTime").getValue(), dijit.byId("addTaskFormsetDateTime").constraints);
						vobject.setDate=dsetDate;
					}else if(dijit.byId("addTaskFormsetDateTime").getValue()==undefined){
						var dsetDate=new DateTimeQuery();
						dsetDate.upDate=dojo.date.locale.format(dijit.byId("addTaskFormsetDate").getValue(), dijit.byId("addTaskFormsetDate").constraints)+" 00:00";
						vobject.setDate=dsetDate;
					}else{passAll=1;}
				}else{
					passAll=1;}
															if(dijit.byId("addTaskFormformState").isValid(true)){
					vobject.formState=dijit.byId("addTaskFormformState").getValue();
				}else{
					passAll=1;
				}
															if(dijit.byId("addTaskFormremark").isValid(true)){
					vobject.remark=dijit.byId("addTaskFormremark").getValue();
				}else{
					passAll=1;
				}
										
				if(dijit.byId("addTaskFormcar").isValid(true)){
			//vobject.car=dijit.byId("addcar").getValue();
			var manageable=new Object();
			manageable.id=dijit.byId("addTaskFormcar").getValue();
			vobject.car=manageable;
		}else{
			passAll=1;
		}
		
if(passAll==0){
		var addrow=[];
														addrow.push(vobject.setDate.upDate);
																					addrow.push(vobject.formState);
																					addrow.push(vobject.remark);
																							if(vobject.id==0){
					addrow.push([]);
				}else{
					addrow.push(querydataTaskForm[document.getElementById('erowIndexTaskForm').value][5]);
				}
												addrow.push([false,addTaskFormcar.getValue(),addTaskFormcar.getDisplayedValue()]);
						 if(vobject.id==0){//create new row
		padd.add('TaskFormVO',vobject);
		SOAPClient.invoke(urlTaskForm, "createTaskForm", padd, false,  function GetEnu_callBack(ul, soapResponse){
			addrow.splice(0,0,false,ul);
			querydataTaskForm[querydataTaskForm.length]=addrow;
			document.getElementById('erowIndexTaskForm').value=querydataTaskForm.length-1;
			gridTaskForm.updateRowCount(querydataTaskForm.length);
			document.getElementById('TaskFormId').value=ul;
			});
	 }else{//modify row
		padd.add('TaskFormVO',vobject);
		SOAPClient.invoke(urlTaskForm, "updateTaskForm", padd, false,  function GetEnu_callBack(ul, soapResponse){
		});
		addrow.splice(0,0,false,vobject.id);
		querydataTaskForm[document.getElementById('erowIndexTaskForm').value]=addrow;
	 }
	}   call_funUpdGridSub();
	gridTaskForm.updateRow(document.getElementById('erowIndexTaskForm').value); 
}

 function addDivRemove(){
     if(window.confirm(i18nStr.deleteConfirm)){
       var s = dijit.byId("gridTaskForm").rowCount;
		console.log("sss:"+s);
        	  var delrowIndex=document.getElementById('erowIndexTaskForm').value;
              var sId=document.getElementById('TaskFormId').value;
              var pdel = new SOAPClientParameters();      
               pdel.add('id',sId);
               SOAPClient.invoke(urlTaskForm, "deleteTaskForm", pdel, false,  function GetEnu_callBack(ul, soapResponse){
               if(s-1!=delrowIndex){
					var e =document.createEvent("HTMLEvents");
					e.rowIndex=delrowIndex;
					dijit.byId("gridTaskForm").dodblclick(e);
			   }else{if(document.getElementById('addDivTaskForm').style.display=='')document.getElementById('addDivTaskForm').style.display='none';}
			   dijit.byId("gridTaskForm").model.remove(delrowIndex);
			   totalCountTaskForm--;
			   var totalpage=Math.ceil(new Number(new Number(totalCountTaskForm))/pagesizeTaskForm);
			   document.getElementById("rowCountTaskForm").innerHTML=i18nStr.di+" "+pagenumberTaskForm+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountTaskForm+" "+i18nStr.rowSize; 
               
	        });   
      }
 }    
 
 function adddis(){
	
	querydisplay("addDivTaskForm");
	if(document.getElementById('addDivTaskForm').style.display!='none')addDivAdd();
} 
//addDiv---------------end---------------------------------------	 
function allopen(){
          for(var i =0;i<querydataTaskForm.length;i++){
            toggleTaskForm(i,true);
          }
 }  

function allclose(){
          for(var i =0;i<querydataTaskForm.length;i++){
            toggleTaskForm(i,false);
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

</script>
</head>	 
<body class="tundra">
 <!--rowinum=$rowinum-->
 <!--addHeight=$addHeight-->
<div id="addDivTaskForm" style="margin-right: 0px;  height: 300px; display:none;" >
              <table align="center" width="100%" id="0" class="editorTable"  >
                <tr >
				<td align="center" style="{width:11%}" i18n="addNote" ></td>
                <td style="{width:22%}" ><input id="TaskFormId" style="{display:none}"  type="text"  /></td>
                <td style="{width:11%}"><input id="erowIndexTaskForm" style="{display:none}"  type="text"  /></td>
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
				<input class="editerDate"   jsId="addTaskFormsetDate" id="addTaskFormsetDate"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
				<input class="editerTime" jsId="addTaskFormsetDateTime" id="addTaskFormsetDateTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours.">
			</td>
					<td align="right" i18n="formState" >formState:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addTaskFormformState"  jsId="addTaskFormformState"   dojoType="dijit.form.ValidationTextBox" required="true" />
							</td>
					<td align="right" i18n="remark" >remark:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addTaskFormremark"  jsId="addTaskFormremark"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
		</tr>	

												<tr><td align="right"  i18n="car"  ></td>
					<td align="left" ><input  id="addTaskFormcar"  jsId="addTaskFormcar" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoTaskForm.carStore" onchange="carSet(0,arguments[0]);" /></td>  
						    <td align="right"    ></td><td align="right"    ></td><td align="right"    ></td><td align="right"    ></td></tr>

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
	<!--button dojoType="dijit.form.Button" onclick="addRowTaskForm();" iconClass="addIcon" i18n="add"  >add</button>
	<button dojoType="dijit.form.Button" onclick="removeSelectedRowsTaskForm();" iconClass="delIcon" i18n="delete" >delete</button>
	<button dojoType="dijit.form.Button"  onclick="call_funUpdTaskForm();" i18n="save" iconClass="saveIcon">save</button>
	<button dojoType="dijit.form.Button" onclick="addDivAdd();" iconClass="addIcon"  >add</button-->
	<button dojoType="dijit.form.Button" onclick="adddis();" iconClass="openDivIcon"  i18n="edit" >openAdd</button>
	<button dojoType="dijit.form.Button" onclick="querydisplay('queryDivTaskForm');" iconClass="queryIcon"  i18n="openQuery" >query</button>
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
		<button dojoType="dijit.form.myButton" onclick="allopen();"  iconClass="allopenIcon" i18n="allopen" >allopen</button>
		<button dojoType="dijit.form.myButton" onclick="allclose();" iconClass="allcloseIcon" i18n="allclose"  >allclose</button>
		</td>
	</tr>
</table>	   

<div id="gridTaskForm"  dojoType="dojox.Grid"  autoWidth="false" style="{width:100%;height:85%}" 	jsId="gridTaskForm"	model="modelTaskForm" structure="mainLayout"  ></div>
</body>
<script type="text/javascript">trans18tag();</script>
</html>					 





















					