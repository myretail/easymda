<%
String peopleId = request.getParameter("peopleId");
%>
<html>
<!--Ò»Ô¶à£¬Ö»Ò»Ò»Ó±í£¬Ã»Ð¿Ò»Ô¶Ó±var dataChild=querydataTask[inRowIndex]-->
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
			dojo.require("projectDojo.Task");
     </script>
        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	<script type="text/javascript" >
		var dojoTask= new  projectDojo.Task();
	    dojoTask.initTask();
	//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
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

															                  // totleinum = 4 
	var mainLayout =[{//Þ¸Ä¸ÒªÏ¢Ö¶Ê±ÒªÞ¸Ó¦colSpantoggle
					onBeforeRow: onBeforeRow,
					 cells: [
                      [
						{ name: 'choise', width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },
						{ name: i18nStr.detail, width: 3, get: getCheckTask, styles: 'text-align: center;' },
							{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
						  				  {name: i18nStr.num,field:2, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
						  							  				 ,  {name: i18nStr.volumne,field:3, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
						  							  												,   {name: i18nStr.remark, field: 4,width: 10, editor: dojox.grid.editors.Editor,required:false, editorToolbar: true  }
														  							 

	//
							 ,   {name: i18nStr.taskForm,field: 5,get:function(inRowIndex){ var str='';var strid;if(querydataTask[inRowIndex]!=undefined && querydataTask[inRowIndex][5]!=undefined && querydataTask[inRowIndex][5][1]!=undefined){str=querydataTask[inRowIndex][5][2];strid=querydataTask[inRowIndex][5][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" class="imgSelectStyle" onclick="dojoTask.selectTaskForm('+strid+','+inRowIndex+',5,0,event);"   >';} ,width: 10 }
								],[
				{ name: '\u8be6\u7ec6', colSpan: 7 ,styles: 'padding: 0; margin: 0;', get: getDetailTask }//value: '<div style="height:0px; background-color: white;"></div>'
			  ]
		  ]

		}];	 


var detailRowsTask=[];
function onBeforeRow(inDataIndex, inRow) {	if (inRow[1]!=undefined)inRow[1].hidden = !detailRowsTask[inDataIndex];}	
function toggleTask(inIndex, inShow) {
        			//if (!inShow) destroySubGridIdGeneral('',querydataTask[inIndex][1],"TaskMainDetail");
					if (!inShow) destroySubGridIdGeneral('',querydataTask[inIndex][1],"TaskChild");
				    detailRowsTask[inIndex] = inShow;
				    dijit.byId("gridTask").updateRow(inIndex); 
				    
    } 

function getCheckTask(inRowIndex) {
	var image = (detailRowsTask[inRowIndex] ? 'open.gif' : 'closed.gif');
	var show = (detailRowsTask[inRowIndex] ? 'false' : 'true');
	return '<img src="../image/' + image + '" onclick="toggleTask(' + inRowIndex + ', ' + show + ')" height="11" width="11">';
}

function getDetailTask(inRowIndex){
	if(detailRowsTask[inRowIndex]){
		var cell = this;
		setTimeout(function() { buildSubgridTask(inRowIndex, cell); }, 0);  }
		var h =0;
		if(detailRowsTask[inRowIndex]&&querydataTask[inRowIndex][$childRow]!=undefined &&querydataTask[inRowIndex][$childRow].length>0){
							h=65+25*querydataTask[inRowIndex][$childRow].length;  		}
	return '<div style="height:'+h+'px; background-color: white;"></div>';
}

//function makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString) {return parentRowIndex+"_"+idString+"_" + inRowIndex;		}

//function destroySubGridIdGeneral(parentRowIndex,inRowIndex,idString) {	var subGrid = dijit.byId(makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString));	if (subGrid) subGrid.destroy();	}
var childRow= ${childRow};
var layoutInRowIndex;	  



var addrow=[];
				
addrow.splice(0,0,false,0);




function buildSubgridTask(inRowIndex, inCell) {  //makeSubgridIdMainDetail(id)Ç¸idmainDetailGridid
	if(inCell!=undefined && inCell.getNode(inRowIndex)!=undefined){
		var child = inCell.getNode(inRowIndex).firstChild;
		//var child = inCell.getNode(inRowIndex).lastChild;
		//var idmainDetail = makeSubGridIdGeneral('',querydataTask[inRowIndex][1],"TaskMainDetail");//makeSubgridIdMainDetail(querydataTask[inRowIndex][1]);//taskmakeSubgridId(taskRowSubdata[inRowIndex][1]);
		var idchild = makeSubGridIdGeneral('',querydataTask[inRowIndex][1],"TaskChild");
		//var subGridMainDetail = dijit.byId(idmainDetail);
		var subGridChild = dijit.byId(idchild);
		var dataChild=querydataTask[inRowIndex][$childRow];
		if(dataChild!=undefined){
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
		detailDate[0]=querydataTask[inRowIndex];  
	    modelTaskDetail=new dojox.grid.data.Table(null, detailDate);
		if (subGridMainDetail) {
			subGridMainDetail.model.setData(detailDate);
			mainDetail.appendChild(subGridMainDetail.domNode);
		} else {
			var mainDetailProps = {
				rowCount: 1, 
				autoHeight: true, 
				autoRender: false,
				model:modelTaskDetail
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
		   querydataTask=dojoTask.TaskVOtoArray_fun(ul,true);
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
	
 	gridTask.onStyleRow=OnStyleRowClassBlue();
	getTaskVO(queryvoTask);
}

 dojo.addOnLoad(init);   

	function selectTaskFormFun(rep){
		querydataTask[dojoTask.selectTaskFormInRow][dojoTask.noTaskForm]=rep;
		gridTask.updateRow(dojoTask.selectTaskFormInRow);		
	}


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


var addRowTask = function(){
	gridTask.addRow([false,0,"","",""],gridTask.model.getRowCount());
} 

function removeTask(){
       var s= new Array();
       var sall=gridTask.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
          s.push(i);
          var thisCell=sall[i];
          if(thisCell[1]!=0){//the row which will be deleted
            deletedataTask.splice(deletedataTask.length,0,thisCell[1]);
       }}}
       gridTask.model.remove(s);//grid.removeSelectedRows();
 }
function call_funUpdTask() {
       var sall=gridTask.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
         var passAll=0;
         var thisCell=sall[i];
         var padd = new SOAPClientParameters2();
         var vobject=new Object();
         vobject.id=thisCell[1];
             if(dojox.validate.isInRange(thisCell[2],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[2];vobject.num=n;
             }else{gridTask.getCell(gridTask.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[3],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[3];vobject.volumne=n;
             }else{gridTask.getCell(gridTask.model.fieldArray[3]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

               vobject.remark=thisCell[4];
 

														


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('TaskVO',vobject);
                SOAPClient.invoke(urlTask, "createTask", padd, false,  function GetEnu_callBack(ul, soapResponse){
                gridTask.model.setDatum(ul,i,1);
				querydataTask[i][${childRow}]=[addrow];
				});
	         }else{//modify row
                padd.add('TaskVO',vobject);
                SOAPClient.invoke(urlTask, "updateTask", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
			 call_funUpdGridSub(i);
        } }}//for
//submit delete
          for(var i=0;i<deletedataTask.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',deletedataTask[i]);
               SOAPClient.invoke(urlTask, "deleteTask", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
	           });
          }
          deletedataTask=new Array();
          //dojo.byId("rowCount").innerHTML = 'saved'; 
//submit delete end          
	
 } 

													//totleinum=4
 //rowinum=1

 
</script>
</head>	 
<body class="tundra">
<div id="queryDivTask"  style="margin-right: 0px;  height: 100px; display:none;"  >
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
							<span id="queryTasknumImg1" style="{display:none}" ><input type="text"  class="editerNumberSmall" jsid="queryTasknum1"  id="queryTasknum1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryTasknumImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryTasknumImgdown" >></span>
							<span id="queryTasknumImg2div" style="{display:none}"> <input type="text"  class="editerNumberSmall"  jsid="queryTasknum2"  id="queryTasknum2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="queryTasknumImg" class="imgStyle">
							
						</td>
														<td align="right" i18n="volumne" >volumne:</td>
							<td align="left" colspan="3" >
								<span id="queryTaskvolumneImg0"  ><input type="text" class="editerNumber" jsId="queryTaskvolumne"  id="queryTaskvolumne"  dojoType="mydojo.NumberTextBox"  /></span>
								<span id="queryTaskvolumneImg1"  style="{display:none}" ><input type="text" class="editerNumberSmall" jsid="queryTaskvolumne1"  id="queryTaskvolumne1"  dojoType="mydojo.NumberTextBox"  /></span>
								<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryTaskvolumneImgup">></span>
								<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryTaskvolumneImgdown" >></span>
								<span id="queryTaskvolumneImg2div" style="{display:none}"> <input type="text" class="editerNumberSmall"  jsid="queryTaskvolumne2"  id="queryTaskvolumne2"  dojoType="mydojo.NumberTextBox"  /></span>
								<img src="../image/start.gif" onclick="queryType(this);" id="queryTaskvolumneImg" class="imgStyle">
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
	<button dojoType="dijit.form.Button" onclick="addRowTask();" iconClass="addIcon" i18n="add"  >add</button>
	<button dojoType="dijit.form.Button" onclick="removeTask();" iconClass="delIcon" i18n="delete" >delete</button>
	<button dojoType="dijit.form.Button"  onclick="call_funUpdTask();" i18n="save" iconClass="saveIcon">save</button>
	<button dojoType="dijit.form.Button" onclick="querydisplay('queryDivTask');" iconClass="queryIcon"  i18n="openQuery" >query</button>
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
		<button dojoType="dijit.form.myButton" onclick="allopen();"  iconClass="allopenIcon" i18n="allopen" ></button>
		<button dojoType="dijit.form.myButton" onclick="allclose();" iconClass="allcloseIcon" i18n="allclose"  ></button>
		</td>
	</tr>
</table>	   

<div id="gridTask"  dojoType="dojox.Grid"  autoWidth="false" style="{width:100%;height:85%}" 	jsId="gridTask"	model="modelTask" structure="mainLayout"  ></div>
</body>
<script type="text/javascript">trans18tag();</script>
</html>		