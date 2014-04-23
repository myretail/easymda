	  						//set (= taskForm2tasks)
	//name =taskForm2tasksCrudAFTab.js  manageable.name=Task
									  var NUtaskForm2tasks = false;//needUpdate
  var urltaskForm2tasks = getUrl()+ "services/TaskFormManageService";
  var deletedatataskForm2tasks =  new Array();
  var querydatataskForm2tasks =  new Array();
  var pagenumbertaskForm2tasks=1;
  var totalCounttaskForm2tasks=0;
  var pagesizetaskForm2tasks=10;
  var orderBytaskForm2tasks='0';
  var queryvotaskForm2tasks=new Object();
  var oddstyle='';
  var modeltaskForm2tasks = new dojox.grid.data.Table(null, querydatataskForm2tasks);
  var gridtaskForm2tasks;
  var urle2 = getUrl()+ "services/BasicManageService";   
//----------move from 30.1 begin-----------

																		                  // totleinum = 5 
	var layouttaskForm2tasks =[{//Þ¸Ä¸ÒªÏ¢Ö¶Ê±ÒªÞ¸Ó¦colSpantoggle
					onBeforeRow: onBeforeRow,
					 cells: [
                      [
						{ name: 'choise', width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },
						{ name: i18nStr.detail, width: 3, get: getCheckTaskForm, styles: 'text-align: center;' },
							{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
						  				  {name: i18nStr.setDate,field:2, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
								,   {name: i18nStr.setDateTime,field:3, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
						  							  												,   {name: i18nStr.formState, field: 4,width: 10 , editor: mydojo.ValidationTextBox ,required:true ,maxLength:30}
														  							  												,   {name: i18nStr.remark, field: 5,width: 10, editor: dojox.grid.editors.Editor,required:false, editorToolbar: true  }
														  							 

	//
							//
							 ,   {name: i18nStr.car,field: 7,get:function(inRowIndex){ var str='';var strid;if(querydatataskForm2tasks[inRowIndex]!=undefined && querydatataskForm2tasks[inRowIndex][7]!=undefined && querydatataskForm2tasks[inRowIndex][7][1]!=undefined){str=querydatataskForm2tasks[inRowIndex][7][2];strid=querydatataskForm2tasks[inRowIndex][7][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" class="imgSelectStyle"onclick="dojoTaskForm.selectcar('+strid+','+inRowIndex+',7,0,event);"   >';} ,width: 10 }
								],[
				{ name: '\u8be6\u7ec6', colSpan: 8 ,styles: 'padding: 0; margin: 0;', get: getDetailTaskForm }//value: '<div style="height:0px; background-color: white;"></div>'
			  ]
		  ]

		}];	 




var detailRowsTaskForm=[];

function onBeforeRow(inDataIndex, inRow) {	if (inRow[1]!=undefined)inRow[1].hidden = !detailRowsTaskForm[inDataIndex];}	

function toggleTaskForm(inIndex, inShow) {
        			//if (!inShow) destroySubGridIdGeneral('',querydatataskForm2tasks[inIndex][1],"TaskFormMainDetail");
					if (!inShow) destroySubGridIdGeneral('',querydatataskForm2tasks[inIndex][1],"TaskFormChild");
				    detailRowsTaskForm[inIndex] = inShow;
				    dijit.byId("gridtaskForm2tasks").updateRow(inIndex); 
				    
    } 

function getCheckTaskForm(inRowIndex) {
	var image = (detailRowsTaskForm[inRowIndex] ? 'open.gif' : 'closed.gif');
	var show = (detailRowsTaskForm[inRowIndex] ? 'false' : 'true');
	return '<img src="../image/' + image + '" onclick="toggleTaskForm(' + inRowIndex + ', ' + show + ')" height="11" width="11">';
}

function getDetailTaskForm(inRowIndex){
	if(detailRowsTaskForm[inRowIndex]){
		var cell = this;
		setTimeout(function() { buildSubgridtaskForm2tasks(inRowIndex, cell); }, 0);  }
		var h =0;
		if(detailRowsTaskForm[inRowIndex]&&querydatataskForm2tasks[inRowIndex][6].length>0){
							h=65+25*querydatataskForm2tasks[inRowIndex][6].length;  		}
	return '<div style="height:'+h+'px; background-color: white;"></div>';
}

//function makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString) {return parentRowIndex+"_"+idString+"_" + inRowIndex;		}

//function destroySubGridIdGeneral(parentRowIndex,inRowIndex,idString) {	var subGrid = dijit.byId(makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString));	if (subGrid) subGrid.destroy();	}
var childRow= 6;
var layoutInRowIndex;	  
function buildSubgridtaskForm2tasks(inRowIndex, inCell) {  //makeSubgridIdMainDetail(id)?idmainDetailGridid
	if(inCell!=undefined && inCell.getNode(inRowIndex)!=undefined){
		var child = inCell.getNode(inRowIndex).firstChild;
		//var child = inCell.getNode(inRowIndex).lastChild;
		//var idmainDetail = makeSubGridIdGeneral('',querydatataskForm2tasks[inRowIndex][1],"TaskFormMainDetail");//makeSubgridIdMainDetail(querydatataskForm2tasks[inRowIndex][1]);//taskmakeSubgridId(taskRowSubdata[inRowIndex][1]);
		var idchild = makeSubGridIdGeneral('',querydatataskForm2tasks[inRowIndex][1],"TaskFormChild");
		//var subGridMainDetail = dijit.byId(idmainDetail);
		var subGridChild = dijit.byId(idchild);
		var dataChild=querydatataskForm2tasks[inRowIndex][6];
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
								model:modelTaskFormChild						};
				childProps.dataRow = inRowIndex;
				childProps.id = idchild;
				if(Math.ceil(inRowIndex/2)>inRowIndex/2){
					childLayoutOdd=buildChildLayout(pre,headerstyleodd,inRowIndex);	
					childProps.structure=childLayoutOdd;
				}else{
					childLayout=buildChildLayout(pre,headerstyle,inRowIndex);
					childProps.structure=childLayout;
				}
				subGridChild = new dojox.Grid(childProps, child);//grid?????DIV?§³
			}
			if (subGridChild) {
				subGridChild.render();
				subGridChild.cacheHeight = subGridChild.domNode.offsetHeight;
			}	      				
		//}
		
		/*var detailDate=[];
		detailDate[0]=querydatataskForm2tasks[inRowIndex];  
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
			}*/	
		inCell.grid.rowHeightChanged(inRowIndex);
    }   
}


  
//-----------move from 30.1 end------------  
var getVOtaskForm2tasks=function(queryvo){

	var pu = new SOAPClientParameters2();
	pu.add('TaskFormVO',queryvo) ;
	pu.add('pageNumber',pagenumbertaskForm2tasks) ;
	pu.add('pageSize',pagesizetaskForm2tasks) ;
	pu.add('orderBy',orderBytaskForm2tasks) ;
	SOAPClient.invoke(urltaskForm2tasks,"getTaskForm", pu, false,  function GetEnu_callBack(ul, soapResponse){     
//ÅÐ¶Ï±¾±íÊÇ·ñÎª×Ó±í,µ±Ò»¸ö±íÊÇ¶à¸ö±íµÄ×Ó±íÊ±£¬´Ë´¦¿ÉÄÜÓÐ´íÎó¡£	
	querydatataskForm2tasks=dojoTaskForm.TaskFormVOtoArray_fun(ul,true);
	totalCounttaskForm2tasks=ul[ul.length-1]["ns:id"]; 
	}); 
	var totalpage=Math.ceil(new Number(totalCounttaskForm2tasks)/pagesizetaskForm2tasks);
	
	if(totalpage>1){
		if(pagenumbertaskForm2tasks==1){
			dijit.byId("but6taskForm2tasks").setDisabled(true);
			dijit.byId("but7taskForm2tasks").setDisabled(false);
		}else if(pagenumbertaskForm2tasks==totalpage){
			dijit.byId("but6taskForm2tasks").setDisabled(false);
			dijit.byId("but7taskForm2tasks").setDisabled(true);
		}else{
			dijit.byId("but6taskForm2tasks").setDisabled(false);
			dijit.byId("but7taskForm2tasks").setDisabled(false);
		}
	}else{
		dijit.byId("but6taskForm2tasks").setDisabled(true);
		dijit.byId("but7taskForm2tasks").setDisabled(true);
	
	}
	if(pagesizetaskForm2tasks==0){
		totalpage=1;
		dijit.byId("but6taskForm2tasks").setDisabled(true);
		dijit.byId("but7taskForm2tasks").setDisabled(true);
	}
	if(totalpage==1)pagenumbertaskForm2tasks=1;
	
	 document.getElementById("rowCounttaskForm2tasks").innerHTML=i18nStr.di+" "+pagenumbertaskForm2tasks+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCounttaskForm2tasks+" "+i18nStr.rowSize; 	

	querydatataskForm2tasks.splice(querydatataskForm2tasks.length-1,1);
	modeltaskForm2tasks.setData(querydatataskForm2tasks);
}

var buildtaskForm2tasks=function(mainID){
	if(NUtaskForm2tasks && mainID!=undefined && mainID!=''){
		var queryFloatTaskForm=new Object();
		queryFloatTaskForm.id=mainID;
		var queryFloatTask=new Object();
		queryFloatTask.taskForm=queryFloatTaskForm;
		queryvotaskForm2tasks.tasks =[queryFloatTask];
		//queryvotaskForm2tasks.taskForm=queryFloatTaskForm;
		getVOtaskForm2tasks(queryvotaskForm2tasks);
		if(dijit.byId("gridtaskForm2tasks")==undefined){
			  gridtaskForm2tasks = new dojox.Grid({
						title: "",
						id: "gridtaskForm2tasks",
						jsId: "gridtaskForm2tasks",
						structure: layouttaskForm2tasks,
						rowCount:querydatataskForm2tasks.length,
						model:modeltaskForm2tasks
					}, dojo.byId("gridtaskForm2tasks"));
				gridtaskForm2tasks.resize({ h: dijit.byId("bottomPane").domNode.clientHeight-90});
				
		}else{
			gridtaskForm2tasks.updateRowCount(querydatataskForm2tasks.length); 
		}
		NUtaskForm2tasks=false;
	}

}

																
//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
	//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
									   
var addRowtaskForm2tasks = function(){
var addrow=[];
														addrow.push('');
					addrow.push('');
																					addrow.push('');
																					addrow.push('');
																							addrow.push('');
												addrow.push([false,mainID,mainName]);
						addrow.splice(0,0,false,0);
	gridtaskForm2tasks.addRow(addrow,gridtaskForm2tasks.model.getRowCount());
} 						   


function removetaskForm2tasks(){
       var s= new Array();
       var sall=gridtaskForm2tasks.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
          s.push(i);
          var thisCell=sall[i];
          if(thisCell[1]!=0){//the row which will be deleted
            deletedatataskForm2tasks.splice(deletedatataskForm2tasks.length,0,thisCell[1]);
       }}}
       gridtaskForm2tasks.model.remove(s);//grid.removeSelectedRows();
 }

function call_funUpdtaskForm2tasks() {
       var sall=gridtaskForm2tasks.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
         var passAll=0;
         var thisCell=sall[i];
         var padd = new SOAPClientParameters2();
         var vobject=new Object();
         vobject.id=thisCell[1];
var  d=new DateTimeQuery();
             if(thisCell[2] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[2], gridtaskForm2tasks.getCell(gridtaskForm2tasks.model.fieldArray[2]).constraint);
             }else{gridtaskForm2tasks.getCell(gridtaskForm2tasks.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[3] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[3], gridtaskForm2tasks.getCell(gridtaskForm2tasks.model.fieldArray[3]).constraint);
             vobject.setDate=d;
             }else{gridtaskForm2tasks.getCell(gridtaskForm2tasks.model.fieldArray[3]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null
 

              if(dojox.validate.isText(thisCell[4], {minlength: 1})){vobject.formState=thisCell[4];
             }else{gridtaskForm2tasks.getCell(gridtaskForm2tasks.model.fieldArray[4]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;}//not null
 
               vobject.remark=thisCell[5];
 

										var manageable=new Object();
			 if(querydatataskForm2tasks[i][7]!=''&&querydatataskForm2tasks[i][7]!=undefined){
             manageable.id=querydatataskForm2tasks[i][7][1];
             vobject.car=manageable;
			 }else{
			 gridtaskForm2tasks.getCell(gridtaskForm2tasks.model.fieldArray[7]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
			


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('TaskFormVO',vobject);
                SOAPClient.invoke(urltaskForm2tasks, "createTaskForm", padd, false,  function GetEnu_callBack(ul, soapResponse){
                gridtaskForm2tasks.model.setDatum(ul,i,1);
				});
	         }else{//modify row
                padd.add('TaskFormVO',vobject);
                SOAPClient.invoke(urltaskForm2tasks, "updateTaskForm", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
			 call_funUpdGridSub(i);
        } }}//for
//submit delete
          for(var i=0;i<deletedatataskForm2tasks.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',deletedatataskForm2tasks[i]);
               SOAPClient.invoke(urltaskForm2tasks, "deleteTaskForm", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
	           });
          }
          deletedatataskForm2tasks=new Array();
          //dojo.byId("rowCount").innerHTML = 'saved'; 
//submit delete end          
	
 } 
 
	function selectTaskFun(rep){
		querydatataskForm2tasks[dojoTaskForm.selectTaskInRow][dojoTaskForm.noTask]=rep;
		gridtaskForm2tasks.updateRow(dojoTaskForm.selectTaskInRow);	
			
	}
	function selectcarFun(rep){
		querydatataskForm2tasks[dojoTaskForm.selectcarInRow][dojoTaskForm.nocar]=rep;
		gridtaskForm2tasks.updateRow(dojoTaskForm.selectcarInRow);	
			
	}

function pageSizeChangetaskForm2tasks(mylabel){
	pagesizetaskForm2tasks=mylabel;
	getVOtaskForm2tasks(queryvotaskForm2tasks);
}

function allpagetaskForm2tasks(){
	pagesizetaskForm2tasks=0;
	getVOtaskForm2tasks(queryvotaskForm2tasks);
}

function upPagetaskForm2tasks(){
	pagenumbertaskForm2tasks--;
	getVOtaskForm2tasks(queryvotaskForm2tasks);
}
function downPagetaskForm2tasks(){
	pagenumbertaskForm2tasks++;
	getVOtaskForm2tasks(queryvotaskForm2tasks);
}

//move from 30.4 begin---------
var addRowSub = function(addindex){
	  var subGrid = dijit.byId(makeSubGridIdGeneral('',querydatataskForm2tasks[addindex][1],"TaskFormChild"));
	  var addrow=[];
	  													addrow.push('');
																					addrow.push('');
																					addrow.push('');
																							addrow.push('');
						addrow.splice(0,0,false,0);
	
	  subGrid.addRow(addrow,subGrid.model.getRowCount());
}


var deleteSub= function(mainRow,subIndexRow,subId){
	var subGrid = dijit.byId(makeSubGridIdGeneral('',querydatataskForm2tasks[mainRow][1],"TaskFormChild"));
	var s= new Array();
	s[0]=subIndexRow;
	if(subId!=0){
		var pdel = new SOAPClientParameters();      
	    pdel.add('id',subId);
	    SOAPClient.invoke(urlTaskForm, "deleteTask", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	});}
	subGrid.model.remove(s);
 }

function saveSubRow(subGrid,thisCell,i){		 
         var vobject=new Object();
		 var passAll=0;
         var padd = new SOAPClientParameters2();
	     vobject.id=thisCell[1];
             if(dojox.validate.isInRange(thisCell[2],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[2];vobject.num=n;
             }else{subGrid.getCell(subGrid.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[3],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[3];vobject.volumne=n;
             }else{subGrid.getCell(subGrid.model.fieldArray[3]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

               vobject.remark=thisCell[4];
 




       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('TaskVO',vobject);
                SOAPClient.invoke(urlTask, "createTask", padd, false,  function GetEnu_callBack(ul, soapResponse){
                subGrid.model.setDatum(ul,i,1);
				
                });
	         }else{//modify row
                padd.add('TaskVO',vobject);
                SOAPClient.invoke(urlTask, "updateTask", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
			 //querydatataskForm2tasks[document.getElementById('erowIndexTask').value][childRow]=querydataSub;//????????????????????????????????????????????????????????????????????????????/
        } }
		
function call_funUpdGridSub(mainRow,subIndexRow) {
var subGrid = dijit.byId(makeSubGridIdGeneral('',querydatataskForm2tasks[mainRow][1],"TaskFormChild"));
	if(subGrid){
	
	var sall=subGrid.model.data;
	if(subIndexRow==undefined && subIndexRow==''){
		for(var i=0;i<sall.length;i++){
         var thisCell=sall[i];
         saveSubRow(subGrid,thisCell,i);
		}//for
	}else{
		 var thisCell=sall[subIndexRow];
		saveSubRow(subGrid,thisCell,subIndexRow);
	}}
}		  

var urlTask = getUrl()+ "services/TaskManageService";
//var deletedataTask =  new Array();
//var querydataTask =  new Array();
var deletedataSub =  new Array();
//var querydataSub=  new Array();
var pagenumberTask=1;
var pagesizeTask=10;
var orderByTask='0';
var queryvoTask=new Object();
var oddstyle='';
//var modelChildAdd = new dojox.grid.data.Table(null, querydataSub);
var childLayout;
var childLayoutOdd;

function buildChildLayout(pre,mystyle,addRowIndex){
	var myLayout=[{
          
                 //¸ù¾ÝfieldµÄÖµ£¬ÒÀ¾ÝÄ¬ÈÏµÄË³Ðò£¬´ÓjsÖÐµÄtoArray×ª»»·½·¨·µ»ØµÄquerydataÖÐÈ¡Êý¾Ý
                       
 cells: [ [
			{ name: '<img src="../image/addsmall.gif" onclick="addRowSub('+addRowIndex +');"   height="18" width="18" border="0">' ,get:function(inRowIndex) {return '<img src="../image/delsmall.gif" onclick="deleteSub('+addRowIndex +','+inRowIndex+','+(querydatataskForm2tasks[addRowIndex][childRow]!=undefined ? 0:querydatataskForm2tasks[addRowIndex][childRow][inRowIndex][1])+');"  height="18" width="18" border="0">&nbsp;&nbsp;&nbsp;<img src="../image/savesmall.gif" onclick="call_funUpdGridSub('+addRowIndex +','+inRowIndex+');"  height="18" width="18" border="0">';}, width: 6,styles: 'text-align: center;',headerStyles:mystyle},//
			{ name: pre+i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool,headerStyles:mystyle },//
		    { name: pre+i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} ,headerStyles:mystyle},//
            {name: pre+i18nStr.num,field:2, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 },headerStyles:mystyle }
		             ,  {name: pre+i18nStr.volumne,field:3, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 },headerStyles:mystyle }
		        				    ,   {name: pre+i18nStr.remark, field: 4,width: 20, editor: dojox.grid.editors.Editor, editorToolbar: true  ,headerStyles:mystyle}
					      
//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
				                                        ] ]
                           }];  
						   
			return myLayout;			   
}

	//move from 30.4 end-----------
