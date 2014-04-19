<%
String peopleId = request.getParameter("peopleId");
%>
<html>
<!--????¨¤?????????¡À¨ª???????????¡Àvar dataChild=querydataTask[inRowIndex]-->
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
			dojo.require("projectDojo.Task");
     </script>
        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 	<script type="text/javascript" >
		var dojoTask= new  projectDojo.Task();
	    dojoTask.initTask();
	//??¡è???????????????¨¨?¡§		
												 var dojoOrderRowTask= new  projectDojo.OrderRowTask();
			dojoOrderRowTask.initOrderRowTask();
				</script>

	 	 				 
	<script type="text/javascript" >
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
	  var modelTaskDetail;
	  var modelTaskChild;
	  
	function taskFormSet(id,value){
        	/*var itemselect=taskFormStore._getItemByIdentity(value);
				if(itemselect!='undefined'&& itemselect!=null){
				}*/
	}


									//begin buildLayout


var mainLayout =[{//?????????colSpantoggle
					onBeforeRow: onBeforeRow,
					 cells: [
                      [
						{ name: i18nStr.detail, width: 3, get: getCheckTask, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
				  				  {name: i18nStr.num,field:2, width: 8}
						  						  				 ,  {name: i18nStr.volumne,field:3, width: 8}
						  						  				,   {name: i18nStr.remark, field: 4,width: 10}
						  				
//
					 ,   {name: i18nStr.taskForm,field: 5,get:function(inRowIndex){ var str='';if(querydataTask[inRowIndex]!=undefined && querydataTask[inRowIndex][5]!=undefined){str=querydataTask[inRowIndex][5][2];} return str;} ,width: 10 }
										],[
									{ name: '\u8be6\u7ec6', colSpan: 6 ,styles: 'padding: 0; margin: 0;', get: getSubTask }//value: '<div style="height:0px; background-color: white;"></div>'
						  ]
				  ]
	  
				}];	 
var subInt=	$childRow;			
function getSubTask(inRowIndex){
		var cell = this;
		setTimeout(function() { buildSubgridTask(inRowIndex, cell); }, 0);
		var h =0;
		if(detailRowsTask[inRowIndex]&&querydataTask[inRowIndex][$childRow].length>0){
							h=65+25*querydataTask[inRowIndex][$childRow].length;  		}
	return '<div style="height:'+h+'px; background-color: white;"></div>';
}				

//end buildLayout

var detailRowsTask=[];

function onBeforeRow(inDataIndex, inRow) {	if (inRow[1]!=undefined)inRow[1].hidden = !detailRowsTask[inDataIndex];}	

function toggleTask(inIndex, inShow) {
        			if (!inShow) destroySubGridIdGeneral('',querydataTask[inIndex][1],"TaskMainDetail");
					if (!inShow) destroySubGridIdGeneral('',querydataTask[inIndex][1],"TaskChild");
				    detailRowsTask[inIndex] = inShow;
				    dijit.byId("gridTask").updateRow(inIndex); 
				    
    } 

function getCheckTask(inRowIndex) {
	var image = (detailRowsTask[inRowIndex] ? 'open.gif' : 'closed.gif');
	var show = (detailRowsTask[inRowIndex] ? 'false' : 'true');
	return '<img src="../image/' + image + '" onclick="toggleTask(' + inRowIndex + ', ' + show + ')" height="11" width="11">';
}





//function makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString) {return parentRowIndex+"_"+idString+"_" + inRowIndex;		}

//function destroySubGridIdGeneral(parentRowIndex,inRowIndex,idString) {	var subGrid = dijit.byId(makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString));	if (subGrid) subGrid.destroy();	}

	  
function buildSubgridTask(inRowIndex, inCell) {  //makeSubgridIdMainDetail(id)??idmainDetailGridid
	if(inCell!=undefined && inCell.getNode(inRowIndex)!=undefined){
		var child = inCell.getNode(inRowIndex).firstChild;
		var idmainDetail = makeSubGridIdGeneral('',querydataTask[inRowIndex][1],"TaskMainDetail");//makeSubgridIdMainDetail(querydataTask[inRowIndex][1]);//taskmakeSubgridId(taskRowSubdata[inRowIndex][1]);
		var idchild = makeSubGridIdGeneral('',querydataTask[inRowIndex][1],"TaskChild");
		var subGridMainDetail = dijit.byId(idmainDetail);
		var subGridChild = dijit.byId(idchild);
		var dataChild=querydataTask[inRowIndex][$childRow];
		if(dataChild.length!=0){
			if (subGridChild){
				subGridChild.model.setData(dataChild);
				child.appendChild(subGridChild.domNode);
			}else{
				modelTaskChild=new dojox.grid.data.Table(null, dataChild);
				var childProps= {
								autoHeight: true, 
								autoRender: false,
								rowCount:dataChild.length,
								model:modelTaskChild,							};
				childProps.dataRow = inRowIndex;
				childProps.id = idchild;
				if(Math.ceil(inRowIndex/2)>inRowIndex/2){
					childProps.structure=childLayoutOdd;
				}else{
					childProps.structure=childLayout;
				}
				subGridChild = new dojox.Grid(childProps, child);//grid????¡Á¡À?¡À??DIV????
			}
			if (subGridChild) {
				subGridChild.render();
				subGridChild.cacheHeight = subGridChild.domNode.offsetHeight;
			}	      				
		}
		inCell.grid.rowHeightChanged(inRowIndex);
    }   
}
//var childLayout=//???????????????????????????????/ ?¡À??jshtml

function querybuttonTask(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvo.id=0 ;
              queryvoTask=new Object();
              n=queryNumber_fun("Tasknum");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvoTask.num=n;}  
              n=queryNumber_fun("Taskvolumne");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvoTask.volumne=n;}  
	          if(queryTaskremark.getDisplayedValue()!="")queryvoTask.remark=queryTaskremark.getDisplayedValue();//
			
	if(queryTasktaskForm.getDisplayedValue()!=""){
				var taskFormQuery= new Object();
				//taskFormQuery.TaskName=queryTasktaskForm.getDisplayedValue();
				taskFormQuery.id=queryTasktaskForm.getValue();
				queryvoTask.taskForm=taskFormQuery;
			  }

			if(validstate==0){
              pagenumberTask=1;
              getTaskVO(queryvoTask); 
             }      
       }

function getTaskVO(queryvo){
	var totalCount=0;
	deletedataTask =new Array();
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
	  gridTask.selection.clear();
      modelTask.setData(querydataTask);
      //dijit.byId("grid").updateRowCount(querydataTask.length); 
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

function init(){
	
 	dojo.connect(dijit.byId("gridTask"), "dodblclick", function(e){
	   if(document.getElementById('queryDivTask').style.display=='')document.getElementById('queryDivTask').style.display='none';
	   if(document.getElementById('addDivTask').style.display=='none')document.getElementById('addDivTask').style.display='';
		 document.getElementById('erowIndexTask').value=e.rowIndex;
		 document.getElementById('TaskId').value=querydataTask[e.rowIndex][1];
		 	 									dijit.byId("addTasknum").setValue(querydataTask[e.rowIndex][2]);
						 									dijit.byId("addTaskvolumne").setValue(querydataTask[e.rowIndex][3]);
						 									dijit.byId("addTaskremark").setValue(querydataTask[e.rowIndex][4]);
						 			 
									dijit.byId("addTasktaskForm").setValue(querydataTask[e.rowIndex][5][1]);
								   
	});  
	gridTask.onStyleRow=OnStyleRowClassBlue();
	getTaskVO(queryvoTask);
}

 dojo.addOnLoad(init);   

	function selectTaskFormFun(rep){
		querydataTask[dojoTask.selectTaskFormInRow][dojoTask.noTaskForm]=rep;
		gridTask.updateRow(dojoTask.selectTaskFormInRow);		
	}


 
//addDiv---------------begin-------------------------------------
var addDivAdd = function(){
	 //if(document.getElementById('queryDivTask').style.display=='')document.getElementById('queryDivTask').style.display='none';
	 //if(document.getElementById('addDivTask').style.display=='none')document.getElementById('addDivTask').style.display='';
	  document.getElementById('gridSub').style.height='60px';
	 //add
															dijit.byId("addTasknum").setValue('');
																								dijit.byId("addTaskvolumne").setValue('');
																								dijit.byId("addTaskremark").setValue('');
														
						dijit.byId("addTasktaskForm").setValue('');
			dijit.byId("addTasktaskForm").setDisplayedValue('');
				
	document.getElementById('TaskId').value='0';
	
} 
function addDivSave(){
	var padd = new SOAPClientParameters2();
	var vobject=new Object();
    vobject.id=document.getElementById('TaskId').value;
	var passAll=0;
										if(dijit.byId("addTasknum").isValid(true)){
					var nnum=new NumberQuery();
					nnum.upNumber=dijit.byId("addTasknum").getValue();
					vobject.num=nnum;
				}else{
					passAll=1;
				}
															if(dijit.byId("addTaskvolumne").isValid(true)){
					var nvolumne=new NumberQuery();
					nvolumne.upNumber=dijit.byId("addTaskvolumne").getValue();
					vobject.volumne=nvolumne;
				}else{
					passAll=1;
				}
															if(dijit.byId("addTaskremark").isValid(true)){
					vobject.remark=dijit.byId("addTaskremark").getValue();
				}else{
					passAll=1;
				}
										
			if(dijit.byId("addTasktaskForm").isValid(true)){
			//vobject.taskForm=dijit.byId("addtaskForm").getValue();
			var manageable=new Object();
			manageable.id=dijit.byId("addTasktaskForm").getValue();
			vobject.taskForm=manageable;
		}else{
			passAll=1;
		}
		
if(passAll==0){
		var addrow=[];
														addrow.push(vobject.num.upNumber);
																					addrow.push(vobject.volumne.upNumber);
																					addrow.push(vobject.remark);
																							addrow.push([false,addTasktaskForm.getValue(),addTasktaskForm.getDisplayedValue()]);
						 if(vobject.id==0){//create new row
		padd.add('TaskVO',vobject);
		SOAPClient.invoke(urlTask, "createTask", padd, false,  function GetEnu_callBack(ul, soapResponse){
			addrow.splice(0,0,false,ul);
			querydataTask[querydataTask.length]=addrow;
			document.getElementById('erowIndexTask').value=querydataTask.length-1;
			gridTask.updateRowCount(querydataTask.length);
			document.getElementById('TaskId').value=ul;
			});
	 }else{//modify row
		padd.add('TaskVO',vobject);
		SOAPClient.invoke(urlTask, "updateTask", padd, false,  function GetEnu_callBack(ul, soapResponse){
		});
		addrow.splice(0,0,false,vobject.id);
		querydataTask[document.getElementById('erowIndexTask').value]=addrow;
	 }
	}   call_funUpdGridSub();
	gridTask.updateRow(document.getElementById('erowIndexTask').value); 
}

 function addDivRemove(){
     if(window.confirm(i18nStr.deleteConfirm)){
       var s = dijit.byId("gridTask").rowCount;
		console.log("sss:"+s);
        	  var delrowIndex=document.getElementById('erowIndexTask').value;
              var sId=document.getElementById('TaskId').value;
              var pdel = new SOAPClientParameters();      
               pdel.add('id',sId);
               SOAPClient.invoke(urlTask, "deleteTask", pdel, false,  function GetEnu_callBack(ul, soapResponse){
               if(s-1!=delrowIndex){
					var e =document.createEvent("HTMLEvents");
					e.rowIndex=delrowIndex;
					dijit.byId("gridTask").dodblclick(e);
			   }else{if(document.getElementById('addDivTask').style.display=='')document.getElementById('addDivTask').style.display='none';}
			   dijit.byId("gridTask").model.remove(delrowIndex);
			   totalCountTask--;
			   var totalpage=Math.ceil(new Number(new Number(totalCountTask))/pagesizeTask);
			   document.getElementById("rowCountTask").innerHTML=i18nStr.di+" "+pagenumberTask+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountTask+" "+i18nStr.rowSize; 
               
	        });   
      }
 }    
 
 function adddis(){
	
	querydisplay("addDivTask");
	if(document.getElementById('addDivTask').style.display!='none')addDivAdd();
} 
//addDiv---------------end---------------------------------------	 
function allopen(){
          for(var i =0;i<querydataTask.length;i++){
            toggleTask(i,true);
          }
 }  

function allclose(){
          for(var i =0;i<querydataTask.length;i++){
            toggleTask(i,false);
          }
}

function pageSizeChangeTask(mylabel){
	pagesizeTask=mylabel;
	pagenumberTask=1;
	getTaskVO(queryvoTask);
}

function allpageTask(){
	pagesizeTask=0;
	getTaskVO(queryvoTask);
}

function upPageTask(){
	pagenumberTask--;
	getTaskVO(queryvoTask);
}
function downPageTask(){
	pagenumberTask++;
	getTaskVO(queryvoTask);
}

</script>
</head>	 
<body class="tundra">
 <!--rowinum=$rowinum-->
 <!--addHeight=$addHeight-->
<div id="addDivTask" style="margin-right: 0px;  height: 300px; display:none;" >
              <table align="center" width="100%" id="0" class="editorTable"  >
                <tr >
				<td align="center" style="{width:11%}" i18n="addNote" ></td>
                <td style="{width:22%}" ><input id="TaskId" style="{display:none}"  type="text"  /></td>
                <td style="{width:11%}"><input id="erowIndexTask" style="{display:none}"  type="text"  /></td>
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
				<td align="right" i18n="num" >num:</td>
			<td align="left"  >
							<input type="text" class="editerNumber"   jsId="addTasknum"  id="addTasknum"  dojoType="mydojo.NumberTextBox" constraints="{min:0,max:9999999,places:4 }" />
			</td>
					<td align="right" i18n="volumne" >volumne:</td>
			<td align="left"  >
							<input type="text" class="editerNumber"   jsId="addTaskvolumne"  id="addTaskvolumne"  dojoType="mydojo.NumberTextBox" constraints="{min:0,max:9999999,places:4 }" />
			</td>
					<td align="right" i18n="remark" >remark:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addTaskremark"  jsId="addTaskremark"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
		</tr>	

								<tr><td align="right"  i18n="taskForm"  ></td>
					<td align="left" ><input  id="addTasktaskForm"  jsId="addTasktaskForm" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoTask.taskFormStore" onchange="taskFormSet(0,arguments[0]);" /></td>  
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
	<!--button dojoType="dijit.form.Button" onclick="addRowTask();" iconClass="addIcon" i18n="add"  >add</button>
	<button dojoType="dijit.form.Button" onclick="removeSelectedRowsTask();" iconClass="delIcon" i18n="delete" >delete</button>
	<button dojoType="dijit.form.Button"  onclick="call_funUpdTask();" i18n="save" iconClass="saveIcon">save</button>
	<button dojoType="dijit.form.Button" onclick="addDivAdd();" iconClass="addIcon"  >add</button-->
	<button dojoType="dijit.form.Button" onclick="adddis();" iconClass="openDivIcon"  i18n="edit" >openAdd</button>
	<button dojoType="dijit.form.Button" onclick="querydisplay('queryDivTask');" iconClass="queryIcon"  i18n="openQuery" >query</button>
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
		<button dojoType="dijit.form.myButton" onclick="allopen();"  iconClass="allopenIcon" i18n="allopen" >allopen</button>
		<button dojoType="dijit.form.myButton" onclick="allclose();" iconClass="allcloseIcon" i18n="allclose"  >allclose</button>
		</td>
	</tr>
</table>	   

<div id="gridTask"  dojoType="dojox.Grid"  autoWidth="false" style="{width:100%;height:85%}" 	jsId="gridTask"	model="modelTask" structure="mainLayout"  ></div>
</body>
<script type="text/javascript">trans18tag();</script>
</html>					 





















					