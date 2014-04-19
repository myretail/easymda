		  
			//set (= car2taskForms)
	//name =car2taskFormsAFTab.js  manageable.name=TaskForm
									  var NUcar2taskForms = false;//needUpdate
  var urlcar2taskForms = getUrl()+ "services/TaskFormManageService";
  var deletedatacar2taskForms =  new Array();
  var querydatacar2taskForms =  new Array();
  var pagenumbercar2taskForms=1;
  var totalCountcar2taskForms=0;
  var pagesizecar2taskForms=10;
  var orderBycar2taskForms='0';
  var queryvocar2taskForms=new Object();
  var oddstyle='';
  var modelcar2taskForms = new dojox.grid.data.Table(null, querydatacar2taskForms);
  var gridcar2taskForms;
  var urle2 = getUrl()+ "services/BasicManageService";   
//----------move from 30.1 begin-----------

										                  // totleinum = 4 
	var layoutcar2taskForms =[{//???????????¡À??????colSpantoggle
					onBeforeRow: onBeforeRow,
					 cells: [
                      [
						//{ name: 'choise', width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },
						{ name: i18nStr.detail, width: 3, get: getCheckTaskForm, styles: 'text-align: center;' },
							{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
						  				  {name: i18nStr.setDateTime,field:2, width: 8}
						  							  			,   {name: i18nStr.formState,field:3, width: 10}
						  							  			,   {name: i18nStr.remark,field:4, width: 10}
						  							 

	//
							//
							 ,   {name: i18nStr.car,field: 6,get:function(inRowIndex){ var str='';var strid;if(querydatacar2taskForms[inRowIndex]!=undefined && querydatacar2taskForms[inRowIndex][6]!=undefined && querydatacar2taskForms[inRowIndex][6][1]!=undefined){str=querydatacar2taskForms[inRowIndex][6][2];strid=querydatacar2taskForms[inRowIndex][6][1];} return str;} ,width: 10 }
								],[
				{ name: '\u8be6\u7ec6', colSpan: 6 ,styles: 'padding: 0; margin: 0;', get: getDetailTaskForm }//value: '<div style="height:0px; background-color: white;"></div>'
			  ]
		  ]

		}];	 




var detailRowsTaskForm=[];

function onBeforeRow(inDataIndex, inRow) {	if (inRow[1]!=undefined)inRow[1].hidden = !detailRowsTaskForm[inDataIndex];}	

function toggleTaskForm(inIndex, inShow) {
        			//if (!inShow) destroySubGridIdGeneral('',querydatacar2taskForms[inIndex][1],"TaskFormMainDetail");
					if (!inShow) destroySubGridIdGeneral('',querydatacar2taskForms[inIndex][1],"TaskFormChild");
				    detailRowsTaskForm[inIndex] = inShow;
				    dijit.byId("gridcar2taskForms").updateRow(inIndex); 
				    
    } 

function getCheckTaskForm(inRowIndex) {
	var image = (detailRowsTaskForm[inRowIndex] ? 'open.gif' : 'closed.gif');
	var show = (detailRowsTaskForm[inRowIndex] ? 'false' : 'true');
	return '<img src="../image/' + image + '" onclick="toggleTaskForm(' + inRowIndex + ', ' + show + ')" height="11" width="11">';
}

function getDetailTaskForm(inRowIndex){
	if(detailRowsTaskForm[inRowIndex]){
		var cell = this;
		setTimeout(function() { buildSubgridcar2taskForms(inRowIndex, cell); }, 0);  }
		var h =0;
		if(detailRowsTaskForm[inRowIndex]&&querydatacar2taskForms[inRowIndex][5].length>0){
							h=65+25*querydatacar2taskForms[inRowIndex][5].length;  		}
	return '<div style="height:'+h+'px; background-color: white;"></div>';
}

//function makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString) {return parentRowIndex+"_"+idString+"_" + inRowIndex;		}

//function destroySubGridIdGeneral(parentRowIndex,inRowIndex,idString) {	var subGrid = dijit.byId(makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString));	if (subGrid) subGrid.destroy();	}
var childRow= 5;
var layoutInRowIndex;	  
function buildSubgridcar2taskForms(inRowIndex, inCell) {  //makeSubgridIdMainDetail(id)?idmainDetailGridid
	if(inCell!=undefined && inCell.getNode(inRowIndex)!=undefined){
		var child = inCell.getNode(inRowIndex).firstChild;
		//var child = inCell.getNode(inRowIndex).lastChild;
		//var idmainDetail = makeSubGridIdGeneral('',querydatacar2taskForms[inRowIndex][1],"TaskFormMainDetail");//makeSubgridIdMainDetail(querydatacar2taskForms[inRowIndex][1]);//taskmakeSubgridId(taskRowSubdata[inRowIndex][1]);
		var idchild = makeSubGridIdGeneral('',querydatacar2taskForms[inRowIndex][1],"TaskFormChild");
		//var subGridMainDetail = dijit.byId(idmainDetail);
		var subGridChild = dijit.byId(idchild);
		var dataChild=querydatacar2taskForms[inRowIndex][5];
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
				subGridChild = new dojox.Grid(childProps, child);//grid?????DIV?¡ì?
			}
			if (subGridChild) {
				subGridChild.render();
				subGridChild.cacheHeight = subGridChild.domNode.offsetHeight;
			}	      				
		//}
		
		/*var detailDate=[];
		detailDate[0]=querydatacar2taskForms[inRowIndex];  
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
var getVOcar2taskForms=function(queryvo){

	var pu = new SOAPClientParameters2();
	pu.add('TaskFormVO',queryvo) ;
	pu.add('pageNumber',pagenumbercar2taskForms) ;
	pu.add('pageSize',pagesizecar2taskForms) ;
	pu.add('orderBy',orderBycar2taskForms) ;
	SOAPClient.invoke(urlcar2taskForms,"getTaskForm", pu, false,  function GetEnu_callBack(ul, soapResponse){     
//????¡À?¡À¨ª??????¡Á?¡À¨ª,?¡À????¡À¨ª???¨¤??¡À¨ª??¡Á?¡À¨ª?¡À?????????????¨ª?¨®??	
	querydatacar2taskForms=dojoTaskForm.TaskFormVOtoArray_fun(ul,false);
	totalCountcar2taskForms=ul[ul.length-1]["ns:id"]; 
	}); 
	var totalpage=Math.ceil(new Number(totalCountcar2taskForms)/pagesizecar2taskForms);
	
	if(totalpage>1){
		if(pagenumbercar2taskForms==1){
			dijit.byId("but6car2taskForms").setDisabled(true);
			dijit.byId("but7car2taskForms").setDisabled(false);
		}else if(pagenumbercar2taskForms==totalpage){
			dijit.byId("but6car2taskForms").setDisabled(false);
			dijit.byId("but7car2taskForms").setDisabled(true);
		}else{
			dijit.byId("but6car2taskForms").setDisabled(false);
			dijit.byId("but7car2taskForms").setDisabled(false);
		}
	}else{
		dijit.byId("but6car2taskForms").setDisabled(true);
		dijit.byId("but7car2taskForms").setDisabled(true);
	
	}
	if(pagesizecar2taskForms==0){
		totalpage=1;
		dijit.byId("but6car2taskForms").setDisabled(true);
		dijit.byId("but7car2taskForms").setDisabled(true);
	}
	if(totalpage==1)pagenumbercar2taskForms=1;
	
	 document.getElementById("rowCountcar2taskForms").innerHTML=i18nStr.di+" "+pagenumbercar2taskForms+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountcar2taskForms+" "+i18nStr.rowSize; 	

	querydatacar2taskForms.splice(querydatacar2taskForms.length-1,1);
	modelcar2taskForms.setData(querydatacar2taskForms);
}

var buildcar2taskForms=function(){
	if(NUcar2taskForms && mainID!=undefined && mainID!=''){
		var queryFloatcar=new Object();
		queryFloatcar.id=mainID;
		queryvocar2taskForms.car=queryFloatcar;
		getVOcar2taskForms(queryvocar2taskForms);
		if(dijit.byId("gridcar2taskForms")==undefined){
			  gridcar2taskForms = new dojox.Grid({
						title: "",
						id: "gridcar2taskForms",
						jsId: "gridcar2taskForms",
						structure: layoutcar2taskForms,
						rowCount:querydatacar2taskForms.length,
						model:modelcar2taskForms
					}, dojo.byId("gridcar2taskForms"));
				gridcar2taskForms.resize({ h: dijit.byId("bottomPane").domNode.clientHeight-90});
				
		}else{
			gridcar2taskForms.updateRowCount(querydatacar2taskForms.length); 
		}
		NUcar2taskForms=false;
	}

}


	
//??????¡À¨ª???¨ª????????
	//??????¡À¨ª???¨ª????????
									   
/*var addRowcar2taskForms = function(){
var addrow=[];
														addrow.push('');
					addrow.push('');
																					addrow.push('');
																					addrow.push('');
																							addrow.push('');
												addrow.push([false,mainID,mainName]);
						addrow.splice(0,0,false,0);
	gridcar2taskForms.addRow(addrow,gridcar2taskForms.model.getRowCount());
} 						


function removecar2taskForms(){
       var s= new Array();
       var sall=gridcar2taskForms.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
          s.push(i);
          var thisCell=sall[i];
          if(thisCell[1]!=0){//the row which will be deleted
            deletedatacar2taskForms.splice(deletedatacar2taskForms.length,0,thisCell[1]);
       }}}
       gridcar2taskForms.model.remove(s);//grid.removeSelectedRows();
 }

function call_funUpdcar2taskForms() {
       var sall=gridcar2taskForms.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
         var passAll=0;
         var thisCell=sall[i];
         var padd = new SOAPClientParameters2();
         var vobject=new Object();
         vobject.id=thisCell[1];
var  d=new DateTimeQuery();
             if(thisCell[2] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[2], gridcar2taskForms.getCell(gridcar2taskForms.model.fieldArray[2]).constraint);
             }else{gridcar2taskForms.getCell(gridcar2taskForms.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[3] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[3], gridcar2taskForms.getCell(gridcar2taskForms.model.fieldArray[3]).constraint);
             vobject.setDate=d;
             }else{gridcar2taskForms.getCell(gridcar2taskForms.model.fieldArray[3]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null
 

              if(dojox.validate.isText(thisCell[4], {minlength: 1})){vobject.formState=thisCell[4];
             }else{gridcar2taskForms.getCell(gridcar2taskForms.model.fieldArray[4]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;}//not null
 
               vobject.remark=thisCell[5];
 

										var manageable=new Object();
			 if(querydatacar2taskForms[i][7]!=''&&querydatacar2taskForms[i][7]!=undefined){
             manageable.id=querydatacar2taskForms[i][7][1];
             vobject.car=manageable;
			 }else{
			 gridcar2taskForms.getCell(gridcar2taskForms.model.fieldArray[7]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
			


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('TaskFormVO',vobject);
                SOAPClient.invoke(urlcar2taskForms, "createTaskForm", padd, false,  function GetEnu_callBack(ul, soapResponse){
                gridcar2taskForms.model.setDatum(ul,i,1);
				});
	         }else{//modify row
                padd.add('TaskFormVO',vobject);
                SOAPClient.invoke(urlcar2taskForms, "updateTaskForm", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
			 call_funUpdGridSub(i);
        } }}//for
//submit delete
          for(var i=0;i<deletedatacar2taskForms.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',deletedatacar2taskForms[i]);
               SOAPClient.invoke(urlcar2taskForms, "deleteTaskForm", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
	           });
          }
          deletedatacar2taskForms=new Array();
          //dojo.byId("rowCount").innerHTML = 'saved'; 
//submit delete end          
	
 } 
 */
/*	function selectTaskFun(rep){
		querydatacar2taskForms[dojoTaskForm.selectTaskInRow][dojoTaskForm.noTask]=rep;
		gridcar2taskForms.updateRow(dojoTaskForm.selectTaskInRow);	
			
	}
	function selectcarFun(rep){
		querydatacar2taskForms[dojoTaskForm.selectcarInRow][dojoTaskForm.nocar]=rep;
		gridcar2taskForms.updateRow(dojoTaskForm.selectcarInRow);	
			
	}
*/

function pageSizeChangecar2taskForms(mylabel){
	pagesizecar2taskForms=mylabel;
	getVOcar2taskForms(queryvocar2taskForms);
}

function allpagecar2taskForms(){
	pagesizecar2taskForms=0;
	getVOcar2taskForms(queryvocar2taskForms);
}

function upPagecar2taskForms(){
	pagenumbercar2taskForms--;
	getVOcar2taskForms(queryvocar2taskForms);
}
function downPagecar2taskForms(){
	pagenumbercar2taskForms++;
	getVOcar2taskForms(queryvocar2taskForms);
}

//move from 30.4 begin---------
/*var addRowSub = function(addindex){
	  var subGrid = dijit.byId(makeSubGridIdGeneral('',querydatacar2taskForms[addindex][1],"TaskFormChild"));
	  var addrow=[];
	  													addrow.push('');
																					addrow.push('');
																					addrow.push('');
																							addrow.push('');
						addrow.splice(0,0,false,0);
	
	  subGrid.addRow(addrow,subGrid.model.getRowCount());
}


var deleteSub= function(mainRow,subIndexRow,subId){
	var subGrid = dijit.byId(makeSubGridIdGeneral('',querydatacar2taskForms[mainRow][1],"TaskFormChild"));
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
 

																var mainTable=new Object();
			mainTable.id=querydatacar2taskForms[subGrid.dataRow][1];
            vobject.taskForm=mainTable;
			


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
			 //querydatacar2taskForms[document.getElementById('erowIndexTask').value][childRow]=querydataSub;//????????????????????????????????????????????????????????????????????????????/
        } }
		
function call_funUpdGridSub(mainRow,subIndexRow) {
var subGrid = dijit.byId(makeSubGridIdGeneral('',querydatacar2taskForms[mainRow][1],"TaskFormChild"));
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
*/
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
          
                 //?¨´??field???????????????????¨°????js????toArray¡Á??????¡§??????querydata????????
                       
 cells: [ [
			//{ name: '<img src="../image/addsmall.gif" onclick="addRowSub('+addRowIndex +');"   height="18" width="18" border="0">' ,get:function(inRowIndex) {return '<img src="../image/delsmall.gif" onclick="deleteSub('+addRowIndex +','+inRowIndex+','+(querydatacar2taskForms[addRowIndex][childRow]!=undefined ? 0:querydatacar2taskForms[addRowIndex][childRow][inRowIndex][1])+');"  height="18" width="18" border="0">&nbsp;&nbsp;&nbsp;<img src="../image/savesmall.gif" onclick="call_funUpdGridSub('+addRowIndex +','+inRowIndex+');"  height="18" width="18" border="0">';}, width: 6,styles: 'text-align: center;',headerStyles:mystyle},//
			//{ name: pre+i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool,headerStyles:mystyle },//
		    { name: pre+i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} ,headerStyles:mystyle},//
            {name: pre+i18nStr.num,field:2, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 },headerStyles:mystyle }
		             ,  {name: pre+i18nStr.volumne,field:3, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 },headerStyles:mystyle }
		        				    ,   {name: pre+i18nStr.remark, field: 4,width: 20, editor: dojox.grid.editors.Editor, editorToolbar: true  ,headerStyles:mystyle}
					      
//??????¡À¨ª???¨ª????????
				                                        ] ]
                           }];  
						   
			return myLayout;			   
}

/*		*/
//move from 30.4 end-----------
