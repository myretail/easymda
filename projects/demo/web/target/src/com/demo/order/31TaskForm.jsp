			<%
String peopleId = request.getParameter("peopleId");
%>
<html>
<!--????¨¤?????????¡À¨ª???????????¡Àvar dataChild=querydataTaskForm[inRowIndex]-->
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
			@import "../dojo/dojo-release-1.0.0/dojox/layout/tests/_expando.css";
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
			dojo.require("dijit.layout.TabContainer");
			dojo.require("dijit.layout.BorderContainer");
			dojo.require("dijit.layout.ContentPane");
			dojo.require("dojox.layout.ExpandoPane");
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
	//??¡è???????????????¨¨?¡§		
																			     </script>

	 		<script type="text/javascript" src="TaskSelectPane.js"></script><!--????,??????????-->
	 		<script type="text/javascript" src="carSelectPane.js"></script><!--????,??????????-->
	 	 					<script type="text/javascript" src="../order/TaskSubCrudFor30.js"></script><!--sub Table script    eg:taskRow.js    ??????¨ª???????¡ÀchildRow=0-->
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

																		                  // totleinum = 5 
	var mainLayout =[{//¨¨?????¨¨???????????¨¨??¨¨?????colSpantoggle
					//onBeforeRow: onBeforeRow,
					 cells: [
                      [
						{ name: 'choise', width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },
						//{ name: i18nStr.detail, width: 3, get: getCheckTaskForm, styles: 'text-align: center;' },
							{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
						  				  {name: i18nStr.setDate,field:2, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
								,   {name: i18nStr.setDateTime,field:3, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
						  							  												,   {name: i18nStr.formState, field: 4,width: 10 , editor: mydojo.ValidationTextBox ,required:true ,maxLength:30}
														  							  												,   {name: i18nStr.remark, field: 5,width: 10, editor: dojox.grid.editors.Editor,required:false, editorToolbar: true  }
														  							 

	//
							//
							 ,   {name: i18nStr.car,field: 7,get:function(inRowIndex){ var str='';var strid;if(querydataTaskForm[inRowIndex]!=undefined && querydataTaskForm[inRowIndex][7]!=undefined && querydataTaskForm[inRowIndex][7][1]!=undefined){str=querydataTaskForm[inRowIndex][7][2];strid=querydataTaskForm[inRowIndex][7][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" class="imgSelectStyle" onclick="dojoTaskForm.selectcar('+strid+','+inRowIndex+',7,0,event);"   >';} ,width: 10 }
								]/*,[
				{ name: '\u8be6\u7ec6', colSpan: 7 ,styles: 'padding: 0; margin: 0;', get: getDetailTaskForm }//value: '<div style="height:0px; background-color: white;"></div>'
			  ]*/
		  ]

		}];	 





/*var detailRowsTaskForm=[];

function onBeforeRow(inDataIndex, inRow) {	if (inRow[1]!=undefined)inRow[1].hidden = !detailRowsTaskForm[inDataIndex];}	

function toggleTaskForm(inIndex, inShow) {
        			//if (!inShow) destroySubGridIdGeneral('',querydataTaskForm[inIndex][1],"TaskFormMainDetail");
					if (!inShow) destroySubGridIdGeneral('',querydataTaskForm[inIndex][1],"TaskFormChild");
				    detailRowsTaskForm[inIndex] = inShow;
				    dijit.byId("gridTaskForm").updateRow(inIndex); 
				    
    } 

function getCheckTaskForm(inRowIndex) {
	var image = (detailRowsTaskForm[inRowIndex] ? 'open.gif' : 'closed.gif');
	var show = (detailRowsTaskForm[inRowIndex] ? 'false' : 'true');
	return '<img src="../image/' + image + '" onclick="toggleTaskForm(' + inRowIndex + ', ' + show + ')" height="11" width="11">';
}

function getDetailTaskForm(inRowIndex){
	if(detailRowsWlTaskRow[inRowIndex]){
		var cell = this;
		setTimeout(function() { buildSubgridTaskForm(inRowIndex, cell); }, 0);  }
		var h =0;
		if(detailRowsTaskForm[inRowIndex]&&querydataTaskForm[inRowIndex][6].length>0){
							h=65+25*querydataTaskForm[inRowIndex][6].length;  		}
	return '<div style="height:'+h+'px; background-color: white;"></div>';
}

//function makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString) {return parentRowIndex+"_"+idString+"_" + inRowIndex;		}

//function destroySubGridIdGeneral(parentRowIndex,inRowIndex,idString) {	var subGrid = dijit.byId(makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString));	if (subGrid) subGrid.destroy();	}
var childRow= 6;
var layoutInRowIndex;	  
function buildSubgridTaskForm(inRowIndex, inCell) {  //makeSubgridIdMainDetail(id)??idmainDetailGridid
	if(inCell!=undefined && inCell.getNode(inRowIndex)!=undefined){
		var child = inCell.getNode(inRowIndex).firstChild;
		//var child = inCell.getNode(inRowIndex).lastChild;
		//var idmainDetail = makeSubGridIdGeneral('',querydataTaskForm[inRowIndex][1],"TaskFormMainDetail");//makeSubgridIdMainDetail(querydataTaskForm[inRowIndex][1]);//taskmakeSubgridId(taskRowSubdata[inRowIndex][1]);
		var idchild = makeSubGridIdGeneral('',querydataTaskForm[inRowIndex][1],"TaskFormChild");
		//var subGridMainDetail = dijit.byId(idmainDetail);
		var subGridChild = dijit.byId(idchild);
		var dataChild=querydataTaskForm[inRowIndex][6];
		//if(dataChild.length!=0){
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
					childLayoutOdd=buildChildLayout(pre,headerstyleodd,inRowIndex);	
					childProps.structure=childLayoutOdd;
				}else{
					childLayout=buildChildLayout(pre,headerstyle,inRowIndex);
					childProps.structure=childLayout;
				}
				subGridChild = new dojox.Grid(childProps, child);//grid????¡Á¡À?¡À??DIV????
			}
			if (subGridChild) {
				subGridChild.render();
				subGridChild.cacheHeight = subGridChild.domNode.offsetHeight;
			}	      				
		//}
		
		////////////////////////////////////////////////////////////////////////////////var detailDate=[];//??/
		detailDate[0]=querydataTaskForm[inRowIndex];  
	    modelTaskFormDetail=new dojox.grid.data.Table(null, detailDate);
		if (subGridMainDetail) {
			subGridMainDetail.model.setData(detailDate);
			mainDetail.appendChild(subGridMainDetail.domNode);
		} else {
			var mainDetailProps = {
				rowCount: 1, 
				autoHeight: true, 
				autoRender: false,
				model:modelTaskFormDetail
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
			}//////////////////////////////////////////////////////////////////////////////////	
		inCell.grid.rowHeightChanged(inRowIndex);
    }   
}
//var childLayout=//???????????????????????????????/ ?¡À??jshtml
*/
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
		   querydataTaskForm=dojoTaskForm.TaskFormVOtoArray_fun(ul,true);
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
var addRowTaskForm = function(){
var addrow=[];
														addrow.push('');
					addrow.push('');
																					addrow.push('');
																					addrow.push('');
																							addrow.push('');
												if(ifMultPanecar2taskForms!=undefined){
					var re=selectcar2taskFormsFunClick();
					addrow.push(re);}
						addrow.splice(0,0,false,0);
	gridTaskForm.addRow(addrow,gridTaskForm.model.getRowCount());
} 

function removeTaskForm(){
       var s= new Array();
       var sall=gridTaskForm.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
          s.push(i);
          var thisCell=sall[i];
          if(thisCell[1]!=0){//the row which will be deleted
            deletedataTaskForm.splice(deletedataTaskForm.length,0,thisCell[1]);
       }}}
       gridTaskForm.model.remove(s);//grid.removeSelectedRows();
 }
function call_funUpdTaskForm() {
       var sall=gridTaskForm.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
         var passAll=0;
         var thisCell=sall[i];
         var padd = new SOAPClientParameters2();
         var vobject=new Object();
         vobject.id=thisCell[1];
var  d=new DateTimeQuery();
             if(thisCell[2] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[2], gridTaskForm.getCell(gridTaskForm.model.fieldArray[2]).constraint);
             }else{gridTaskForm.getCell(gridTaskForm.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[3] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[3], gridTaskForm.getCell(gridTaskForm.model.fieldArray[3]).constraint);
             vobject.setDate=d;
             }else{gridTaskForm.getCell(gridTaskForm.model.fieldArray[3]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null
 

              if(dojox.validate.isText(thisCell[4], {minlength: 1})){vobject.formState=thisCell[4];
             }else{gridTaskForm.getCell(gridTaskForm.model.fieldArray[4]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;}//not null
 
               vobject.remark=thisCell[5];
 

										var manageable=new Object();
			 if(querydataTaskForm[i][7]!=''&&querydataTaskForm[i][7]!=undefined){
             manageable.id=querydataTaskForm[i][7][1];
             vobject.car=manageable;
			 }else{
			 gridTaskForm.getCell(gridTaskForm.model.fieldArray[7]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
			


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('TaskFormVO',vobject);
                SOAPClient.invoke(urlTaskForm, "createTaskForm", padd, false,  function GetEnu_callBack(ul, soapResponse){
                gridTaskForm.model.setDatum(ul,i,1);
				});
	         }else{//modify row
                padd.add('TaskFormVO',vobject);
                SOAPClient.invoke(urlTaskForm, "updateTaskForm", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
			 //call_funUpdGridSub();
        } }}//for
//submit delete
          for(var i=0;i<deletedataTaskForm.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',deletedataTaskForm[i]);
               SOAPClient.invoke(urlTaskForm, "deleteTaskForm", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
	           });
          }
          deletedataTaskForm=new Array();
          //dojo.byId("rowCount").innerHTML = 'saved'; 
//submit delete end          
	
 } 
 															//totleinum=6
 //rowinum=2

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
				

    </tr>
//
												<tr><td align="right"  i18n="car"  ></td>
					<td align="left" ><input  id="queryTaskFormcar"  jsId="queryTaskFormcar" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoTaskForm.carStore"  /></td>  
						    </tr>

         <tr align="center"><td></td>
           <td colspan="2"> <button dojoType="dijit.form.Button" onclick="querybutton();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="3"></td><td colspan="2"></td></tr>
         </table>
</div>	

<table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   TaskForm List</b></td>
		<td align="right" >
	<button dojoType="dijit.form.Button" onclick="addRowTaskForm();" iconClass="addIcon" i18n="add"  >add</button>
	<button dojoType="dijit.form.Button" onclick="removeTaskForm();" iconClass="delIcon" i18n="delete" >delete</button>
	<button dojoType="dijit.form.Button"  onclick="call_funUpdTaskForm();" i18n="save" iconClass="saveIcon">save</button>
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
</div>  
    
<div dojoType="dojox.layout.ExpandoPane" splitter="true" duration="125" region="bottom" title="" style="height:375px;"  onLoad="myOnLoad" id="bottomPane" jsId="bottomPane" ><!--href="TaskFormSelectTab.html"-->
											<table id="car2taskFormsTable"  style=" position:absolute;top:0px; width:90%; visibility:visible ">
				<tr height="25px" width="100%">
		<td align="right" >
					<span id="rowCountpanecar2taskForms"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button dojoType="dijit.form.myButton" onclick="upPagepanecar2taskForms();"  id="but6panecar2taskForms" disabled='true' jsId="but6panecar2taskForms" iconClass="upPageIcon" >pageup</button>
					<button dojoType="dijit.form.myButton" onclick="downPagepanecar2taskForms();" id="but7panecar2taskForms" disabled='true' jsId="but7panecar2taskForms" iconClass="downPageIcon" >pagedown</button>
	</td></tr></table>
							<div dojoType="dojox.layout.ContentPane" href="../common/car2taskFormsSelectPane.html"  >  </div>
	</div>

</div>
</body>
<script type="text/javascript">trans18tag();</script>
</html>		
