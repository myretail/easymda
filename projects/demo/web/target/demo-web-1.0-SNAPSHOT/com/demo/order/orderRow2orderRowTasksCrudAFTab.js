	  //¡À???¡ã?????¡À¨ª??4.1????¡À¨ª??---begin---------????"????¡À¨ª/????¡À¨ª"?¡§"??¡À¨ª"??"????¡À¨ª"/"¡À?????¡À¨ª"?????????¨¤???¨¤??????¡À¨ª
	   //true??"????¡À¨ª/????¡À¨ª"?¡§"??¡À¨ª"??"????¡À¨ª"/"¡À?????¡À¨ª"?????¨¤???¨¤????¡À¨ª
//---end---------????"????¡À¨ª/????¡À¨ª"?¡§"??¡À¨ª"??"????¡À¨ª"/"¡À?????¡À¨ª"?????????¨¤???¨¤??????¡À¨ª
																																								//set (= orderRow2orderRowTasks)
	//----------lastMenber = org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[orderRow]   firstMenber=org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[task]
	//orderRow2orderRowTasksAFTab.js	

	//---begin---------????"????¡À¨ª" ?? "????¡À¨ª"??????tree?¨¢??¡À¨ªsno('????¡À¨ª'???¨¤???¨¤????¡À¨ª)
																																																    //---end---------????"????¡À¨ª" ?? "????¡À¨ª"??????tree?¨¢??¡À¨ªsno
//begin--????"????¡À¨ª" ?? "????¡À¨ª"???????¡Â¡À¨ª('????¡À¨ª'???¨¤???¨¤????¡À¨ª)
	//begin--????"????¡À¨ª" ?? "????¡À¨ª"??????¡Á?¡À¨ª('????¡À¨ª'???¨¤???¨¤????¡À¨ª)
//"????¡À¨ª" ?? "????¡À¨ª"??¡Á?¡À¨ª(4OrderRowd.jsp)
//???????¡ì?????????¨²???¨²??????4.6.js.vsl?¨²??????????¡À?4.2.js.vsl?¨¤??(?4-n.js.vsl)
		  var NUorderRow2orderRowTasks = false;//needUpdate
		  var urlorderRowTasks2task = getUrl()+ "services/OrderRowTaskManageService";
		  var deletedataorderRowTasks2task =   ",";
		  var adddataorderRowTasks2task =    ",";
		  var querydataorderRowTasks2taskTask =  new Array();
		  var pagenumberorderRowTasks2task=1;
		  var totalCountorderRowTasks2task=0;
		  var pagesizeorderRowTasks2task=10;
		  var orderByorderRowTasks2task='0';
		  var queryvoorderRowTasks2task=new Object();
		  var oddstyle='';
		  var modelorderRow2orderRowTasks = new dojox.grid.data.Table(null, querydataorderRowTasks2taskTask);
		  var gridorderRow2orderRowTasks;

		var getVOorderRowTasks2taskTask=function(id){

			var pu = new SOAPClientParameters2();
			pu.add('id',id) ;
			SOAPClient.invoke(urlorderRowTasks2task,"getTaskFormByOrderRowdId", pu, false,  function GetEnu_callBack(ul, soapResponse){  
			//querydataorderRowTasks2taskTask=dojoTaskForm.TaskFormVOtoArray_fun(ul,true);
			querydataorderRowTasks2taskTask=dojoOrderRowTask.TaskFormVOtoArray_fun(ul,true);
			totalCountorderRowTasks2task=ul[ul.length-1]["ns:id"]; 
			querydataorderRowTasks2taskTask.splice(querydataorderRowTasks2taskTask.length-1,1);
			//querydataorderRowTasks2taskTask=selected_fun(querydataorderRowTasks2taskTask);
				for(var i = 0; i < querydataorderRowTasks2taskTask.length; i++){	
				//var dataTask = new Array();
				var dataTask=querydataorderRowTasks2taskTask[i][childRow];
				dataTask=selected_fun(dataTask);
				querydataorderRowTasks2taskTask[i][childRow]=dataTask;
			}
			}); 
			modelorderRow2orderRowTasks.setData(querydataorderRowTasks2taskTask);
			var totalpage=Math.ceil(new Number(totalCountorderRowTasks2task)/pagesizeorderRowTasks2task);
		
		if(totalpage>1){
			if(pagenumberorderRowTasks2task==1){
				dijit.byId("but6orderRow2orderRowTasks").setDisabled(true);
				dijit.byId("but7orderRow2orderRowTasks").setDisabled(false);
			}else if(pagenumberorderRow2orderRowTasks==totalpage){
				dijit.byId("but6orderRow2orderRowTasks").setDisabled(false);
				dijit.byId("but7orderRow2orderRowTasks").setDisabled(true);
			}else{
				dijit.byId("but6orderRow2orderRowTasks").setDisabled(false);
				dijit.byId("but7orderRow2orderRowTasks").setDisabled(false);
			}
		}else{
			dijit.byId("but6orderRow2orderRowTasks").setDisabled(true);
			dijit.byId("but7orderRow2orderRowTasks").setDisabled(true);
		
		}
		if(pagesizeorderRowTasks2task==0){
			totalpage=1;
			dijit.byId("but6orderRow2orderRowTasks").setDisabled(true);
			dijit.byId("but7orderRow2orderRowTasks").setDisabled(true);
		}
		if(totalpage==1)pagenumberorderRowTasks2task=1;
		
		 document.getElementById("rowCountorderRow2orderRowTasks").innerHTML=i18nStr.di+" "+pagenumberorderRowTasks2task+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountorderRowTasks2task+" "+i18nStr.rowSize; 	

	}
	  
	function selected_fun(transData){
			 for(var i = 0; i < transData.length; i++){		
                        var row = transData[i];
                        if(row[row.length-1]==undefined||row[row.length-1]==''){
							row[0] = false;
						}else{
							row[0] = true;
						}
						transData[i]=row;
						}
				return 		transData;
		  }
	
	function saveorderRow2orderRowTasks(){
		var delArray=deletedataorderRowTasks2task.split(",");
		for(var i=1;i<delArray.length-1;i++){
			var pdel = new SOAPClientParameters();  
			pdel.add('id',delArray[i]);
				SOAPClient.invoke(urlorderRowTasks2task, "deleteOrderRowTask", pdel, false,  function GetEnu_callBack(ul, soapResponse){
			});
		}
		deletedataorderRowTasks2task=",";
		
		var addArray=adddataorderRowTasks2task.split(",");
					  
		for(var i=1;i<addArray.length-1;i++){
			var vobject=new Object();
			var OrderRowdvo=new Object();
			OrderRowdvo.id=mainID;
			vobject.orderRow=OrderRowdvo;
			var Taskvo=new Object();
			Taskvo.id=addArray[i];
			vobject.task=Taskvo;
			var padd = new SOAPClientParameters2(); 
			padd.add('OrderRowTaskVO',vobject);
			SOAPClient.invoke(urlorderRowTasks2task, "createOrderRowTask", padd, false,  function GetEnu_callBack(ul, soapResponse){
				for(var ii=0;ii<querydataorderRowTasks2taskTask.length;ii++){
					var subdata=querydataorderRowTasks2taskTask[ii][childRow];

					for(var j=0;j<subdata.length;j++){
						if(subdata[j][1]==addArray[i]){
							subdata[j][subdata[j].length-1]=ul;
							querydataorderRowTasks2taskTask[ii][childRow]=subdata;//need?
							break;
							}
					}
				}	
			});
		}
		
		adddataorderRowTasks2task=",";
		
	}
	
	
	var queryvotask=new Object();
	var buildorderRow2orderRowTasks=function(){
		if(NUorderRow2orderRowTasks && mainID!=undefined && mainID!=''){
			getVOorderRowTasks2taskTask(mainID);
			if(dijit.byId("gridorderRow2orderRowTasks")==undefined){
				gridorderRow2orderRowTasks = new dojox.Grid({
							title: "",
							id: "gridorderRow2orderRowTasks",
							jsId: "gridorderRow2orderRowTasks",
							structure: layoutorderRow2orderRowTasks,
							rowCount:querydataorderRowTasks2taskTask.length,
							model:modelorderRow2orderRowTasks
						}, dojo.byId("gridorderRow2orderRowTasks"));
						
				gridorderRow2orderRowTasks.resize({ h: dijit.byId("bottomPane").domNode.clientHeight-90});
			}else{
				gridorderRow2orderRowTasks.updateRowCount(querydataorderRowTasks2taskTask.length); 
			}
			
			NUorderRow2orderRowTasks=false;
		}

	}
	
	/*function pageSizeChangeorderRow2orderRowTasks(mylabel){
			pagesizeorderRow2orderRowTasks=mylabel;
			getVOorderRow2orderRowTasksOrderRowTask(queryvoorderRow2orderRowTasksOrderRowTask);
		}

		function allpageorderRow2orderRowTasks(){
			pagesizeorderRow2orderRowTasks=0;
			getVOorderRow2orderRowTasksOrderRowTask(queryvoorderRow2orderRowTasksOrderRowTask);
		}*/

		function upPageorderRow2orderRowTasks(){
			pagenumberorderRow2orderRowTasks--;
			getVOorderRow2orderRowTasksOrderRowTask(queryvoorderRow2orderRowTasksOrderRowTask);
		}
		function downPageorderRow2orderRowTasks(){
			pagenumberorderRow2orderRowTasks++;
			getVOorderRow2orderRowTasksOrderRowTask(queryvoorderRow2orderRowTasksOrderRowTask);
		}
	

	                    //associatedClass==manageable
		
        //????????????layout??($member in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[orderRow], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[task]])??if(!${member.many})  ??¡Á?????????Float???????¡ã????????
	                                     
              //begin from 41.4
		var querydataorderRowTasks2taskTask =  new Array();
		
		
		
		
		
		var getChoiseorderRowTasks2task= function(parentInRowIndex,inRowIndex) {
			var subdata=querydataorderRowTasks2taskTask[parentInRowIndex][childRow];
			if(true==subdata[inRowIndex][0]){//'+querydataorderRowTasks2taskTask[inRowIndex][1]+'
				 return  '<input class="dojoxGrid-input"  name="selectorderRowTasks2task" id="" checked="true" type="checkbox" onClick="clickorderRowTasks2task('+parentInRowIndex+','+inRowIndex+')" />';
			 }else{
				 return  '<input class="dojoxGrid-input"  name="selectorderRowTasks2task" id=""  type="checkbox" onClick="clickorderRowTasks2task('+parentInRowIndex+','+inRowIndex+')" />';
			 }
		}

function clickorderRowTasks2task(parentInRowIndex,inRowIndex){//  
	var subdata=querydataorderRowTasks2taskTask[parentInRowIndex][childRow];
	var len=subdata[inRowIndex].length;		
	if(subdata[inRowIndex][len-1]==undefined||subdata[inRowIndex][len-1]==''){
				var idStr=","+subdata[inRowIndex][1]+",";
			
				if(adddataorderRowTasks2task.indexOf(idStr)==-1){
					adddataorderRowTasks2task=adddataorderRowTasks2task+subdata[inRowIndex][1]+",";
				}else{
					
					adddataorderRowTasks2task=adddataorderRowTasks2task.substring(0,adddataorderRowTasks2task.indexOf(idStr))+adddataorderRowTasks2task.substring(adddataorderRowTasks2task.indexOf(idStr)+idStr.length-1);
				}
			
			}else{
				
				var idStr=","+subdata[inRowIndex][len-1]+",";
				
				if(deletedataorderRowTasks2task.indexOf(idStr)==-1){
					deletedataorderRowTasks2task=deletedataorderRowTasks2task+subdata[inRowIndex][len-1]+",";
				}else{
					deletedataorderRowTasks2task=deletedataorderRowTasks2task.substring(0,deletedataorderRowTasks2task.indexOf(idStr))+deletedataorderRowTasks2task.substring(deletedataorderRowTasks2task.indexOf(idStr)+idStr.length-1);
				}
			}
	}		


	var dojoTaskFormSelect;			

//from 20.1 begin
																		                  // totleinum = 5 
	var layoutorderRow2orderRowTasks =[{//?????????colSpantoggle
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
							 ,   {name: i18nStr.car,field: 7,get:function(inRowIndex){ var str='';var strid;if(querydataorderRowTasks2taskTask[inRowIndex]!=undefined && querydataorderRowTasks2taskTask[inRowIndex][7]!=undefined && querydataorderRowTasks2taskTask[inRowIndex][7][1]!=undefined){str=querydataorderRowTasks2taskTask[inRowIndex][7][2];strid=querydataorderRowTasks2taskTask[inRowIndex][7][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" class="imgSelectStyle" onclick="dojoOrderRowTask.selectcar('+strid+','+inRowIndex+',7,0,event);"   >';} ,width: 10 }
								],[
				{ name: '\u8be6\u7ec6', colSpan: 8 ,styles: 'padding: 0; margin: 0;', get: getDetailTaskForm }//value: '<div style="height:0px; background-color: white;"></div>'
			  ]
		  ]

		}];	 
		

/*	function selectTaskFun(rep){
		querydataorderRowTasks2taskTask[dojoTaskForm.selectTaskInRow][dojoTaskForm.noTask]=rep;
		gridorderRow2orderRowTasks.updateRow(dojoTaskForm.selectTaskInRow);		
	}
	function selectcarFun(rep){
		querydataorderRowTasks2taskTask[dojoTaskForm.selectcarInRow][dojoTaskForm.nocar]=rep;
		gridorderRow2orderRowTasks.updateRow(dojoTaskForm.selectcarInRow);		
	}
*/
		
var detailRowsTaskForm=[];
function onBeforeRow(inDataIndex, inRow) {	if (inRow[1]!=undefined)inRow[1].hidden = !detailRowsTaskForm[inDataIndex];}	
function toggleTaskForm(inIndex, inShow) {
        			//if (!inShow) destroySubGridIdGeneral('',querydataorderRowTasks2taskTask[inIndex][1],"TaskFormMainDetail");
					if (!inShow) destroySubGridIdGeneral('',querydataorderRowTasks2taskTask[inIndex][1],"TaskFormChild");
				    detailRowsTaskForm[inIndex] = inShow;
				    dijit.byId("gridorderRow2orderRowTasks").updateRow(inIndex); 
				    
    } 

function getCheckTaskForm(inRowIndex) {
	var image = (detailRowsTaskForm[inRowIndex] ? 'open.gif' : 'closed.gif');
	var show = (detailRowsTaskForm[inRowIndex] ? 'false' : 'true');
	return '<img src="../image/' + image + '" onclick="toggleTaskForm(' + inRowIndex + ', ' + show + ')" height="11" width="11">';
}

function getDetailTaskForm(inRowIndex){
	if(detailRowsTaskForm[inRowIndex]){
		var cell = this;
		setTimeout(function() { buildSubgridTaskForm(inRowIndex, cell); }, 0);  }
		var h =0;
		if(detailRowsTaskForm[inRowIndex]&&querydataorderRowTasks2taskTask[inRowIndex][6]!=undefined &&querydataorderRowTasks2taskTask[inRowIndex][6].length>0){
							h=65+25*querydataorderRowTasks2taskTask[inRowIndex][6].length;  		}
	return '<div style="height:'+h+'px; background-color: white;"></div>';
}

//function makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString) {return parentRowIndex+"_"+idString+"_" + inRowIndex;		}

//function destroySubGridIdGeneral(parentRowIndex,inRowIndex,idString) {	var subGrid = dijit.byId(makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString));	if (subGrid) subGrid.destroy();	}
var childRow= 6;
var layoutInRowIndex;	  



/*var addrow=[];
				
addrow.splice(0,0,false,0);*/




function buildSubgridTaskForm(inRowIndex, inCell) {  //makeSubgridIdMainDetail(id)?idmainDetailGridid
	if(inCell!=undefined && inCell.getNode(inRowIndex)!=undefined){
		var child = inCell.getNode(inRowIndex).firstChild;
		//var child = inCell.getNode(inRowIndex).lastChild;
		//var idmainDetail = makeSubGridIdGeneral('',querydataorderRowTasks2taskTask[inRowIndex][1],"TaskFormMainDetail");//makeSubgridIdMainDetail(querydataorderRowTasks2taskTask[inRowIndex][1]);//taskmakeSubgridId(taskRowSubdata[inRowIndex][1]);
		var idchild = makeSubGridIdGeneral('',querydataorderRowTasks2taskTask[inRowIndex][1],"TaskFormChild");
		//var subGridMainDetail = dijit.byId(idmainDetail);
		var subGridChild = dijit.byId(idchild);
		var dataChild=querydataorderRowTasks2taskTask[inRowIndex][6];
		if(dataChild!=undefined){
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
				subGridChild = new dojox.Grid(childProps, child);//grid?????DIV?¡ì?
			}
			if (subGridChild) {
				subGridChild.render();
				subGridChild.cacheHeight = subGridChild.domNode.offsetHeight;
			}	      				
		}
		
		
		inCell.grid.rowHeightChanged(inRowIndex);
    }   
}		
		
		
		
		
		
//from 20.1 end

//from 20.2 begin
//${member.type.name}SubCrudForSubGrid.js==TaskSubCrudForSubGrid.js
//?????¡Â¡À¨ª?¨¤??var mainTable=new VO();

var addRowSub = function(addindex){
	  var subGrid = dijit.byId(makeSubGridIdGeneral('',querydataorderRowTasks2taskTask[addindex][1],"TaskFormChild"));
	  subGrid.addRow([false,0,"","","","","","","","","","","","","","","","","",""],subGrid.model.getRowCount());
}


var deleteSub= function(mainRow,subIndexRow,subId){
	var subGrid = dijit.byId(makeSubGridIdGeneral('',querydataorderRowTasks2taskTask[mainRow][1],"TaskFormChild"));
	var s= new Array();
	s[0]=subIndexRow;
	if(subId!=0){
		var pdel = new SOAPClientParameters();      
	    pdel.add('id',subId);
	    SOAPClient.invoke(urlTask, "deleteTask", pdel, false,  function GetEnu_callBack(ul, soapResponse){
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
			mainTable.id=querydataorderRowTasks2taskTask[subGrid.dataRow][1];
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
			 //querydataorderRowTasks2taskTask[document.getElementById('erowIndexTask').value][childRow]=querydataSub;//????????????????????????????????????????????????????????????????????????????/
        } }
		
function call_funUpdGridSub(mainRow,subIndexRow) {
var subGrid = dijit.byId(makeSubGridIdGeneral('',querydataorderRowTasks2taskTask[mainRow][1],"TaskFormChild"));
	
	if(subGrid){
	var sall=subGrid.model.data;
	if(subIndexRow==undefined || subIndexRow==''){
		for(var i=0;i<sall.length;i++){
         var thisCell=sall[i];
         saveSubRow(subGrid,thisCell,i);
		}//for
	}else{
		 var thisCell=sall[subIndexRow];
		saveSubRow(subGrid,thisCell,subIndexRow);
	}}
}		  

var urlTask = getUrl()+ "services/TaskFormManageService";
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
			//{ name: '<img src="../image/addsmall.gif" onclick="addRowSub('+addRowIndex +');"   height="18" width="18" border="0">' ,get:function(inRowIndex) {return '<img src="../image/delsmall.gif" onclick="deleteSub('+addRowIndex +','+inRowIndex+','+(querydataorderRowTasks2taskTask[addRowIndex][childRow]!=undefined ? 0:querydataorderRowTasks2taskTask[addRowIndex][childRow][inRowIndex][1])+');"  height="18" width="18" border="0">&nbsp;&nbsp;&nbsp;<img src="../image/savesmall.gif" onclick="call_funUpdGridSub('+addRowIndex +','+inRowIndex+');"  height="18" width="18" border="0">';}, width: 6,styles: 'text-align: center;',headerStyles:mystyle},//
			{ name: pre+i18nStr.chose, width: 3, styles: 'text-align: center;', headerStyles:mystyle , get:function(inRowIndex){return getChoiseorderRowTasks2task(addRowIndex,inRowIndex);}},//
		    { name: pre+i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} ,headerStyles:mystyle},//
            {name: pre+i18nStr.num,field:2, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 },headerStyles:mystyle }
		             ,  {name: pre+i18nStr.volumne,field:3, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 },headerStyles:mystyle }
		        				    ,   {name: pre+i18nStr.remark, field: 4,width: 20, editor: dojox.grid.editors.Editor, editorToolbar: true  ,headerStyles:mystyle}
					      
//??????¡À¨ª???¨ª????????
				                                        ] ]
                           }];  
						   
			return myLayout;			   
}

	


//from 20.2 end




 

				                   //????????????layout??($member in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[orderRow], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[task]])??if(!${member.many})  ??¡Á?????????Float???????¡ã????????
	                 	    	
	  