	  //---begin---------???????????¨¤???¨¤??????¡À¨ª
							//---begin---------?????????¡À????????tree?¨¢??¡À¨ªsno
				//?????????¡§¡À¨ª
//set (= taskForm2tasks)
								  var NUtaskForm2tasks = false;//needUpdate
  var urltaskForm2tasks = getUrl()+ "services/TaskManageService";
 /* var deletedatataskForm2tasks =  new Array();
  var querydatataskForm2tasks =  new Array();
  var pagenumbertaskForm2tasks=1;
  var totalCounttaskForm2tasks=0;
  var pagesizetaskForm2tasks=10;
  var orderBytaskForm2tasks='0';
  var queryvotaskForm2tasks=new Object();
  var oddstyle='';
  var modeltaskForm2tasks = new dojox.grid.data.Table(null, querydatataskForm2tasks);
  var gridtaskForm2tasks;
  var urle2 = getUrl()+ "services/BasicManageService";   */
  
 
  
var getVOtaskForm2tasks=function(queryvo,id){

	var pu = new SOAPClientParameters2();
	pu.add('TaskVO',queryvo) ;
	pu.add('pageNumber',taskForm2tasksFloatArray[id].pagenumbertaskForm2tasks) ;
	pu.add('pageSize',taskForm2tasksFloatArray[id].pagesizetaskForm2tasks) ;
	pu.add('orderBy',taskForm2tasksFloatArray[id].orderBytaskForm2tasks) ;
	SOAPClient.invoke(urltaskForm2tasks,"getTask", pu, false,  function GetEnu_callBack(ul, soapResponse){      
	//????¡À?¡À¨ª??????¡Á?¡À¨ª,?¡À????¡À¨ª???¨¤??¡À¨ª??¡Á?¡À¨ª?¡À?????????????¨ª?¨®??	
						//TaskForm-----TaskForm
			taskForm2tasksFloatArray[id].querydatataskForm2tasks=dojoTaskForm.TaskVOtoArray_fun(ul,true);
				taskForm2tasksFloatArray[id].totalCounttaskForm2tasks=ul[ul.length-1]["ns:id"]; 
	}); 
	var totalpage=Math.ceil(new Number(taskForm2tasksFloatArray[id].totalCounttaskForm2tasks)/taskForm2tasksFloatArray[id].pagesizetaskForm2tasks);
	
	if(totalpage>1){
		if(taskForm2tasksFloatArray[id].pagenumbertaskForm2tasks==1){
			dijit.byId("but6taskForm2tasks"+id).setDisabled(true);
			dijit.byId("but7taskForm2tasks"+id).setDisabled(false);
		}else if(taskForm2tasksFloatArray[id].pagenumbertaskForm2tasks==totalpage){
			dijit.byId("but6taskForm2tasks"+id).setDisabled(false);
			dijit.byId("but7taskForm2tasks"+id).setDisabled(true);
		}else{
			dijit.byId("but6taskForm2tasks"+id).setDisabled(false);
			dijit.byId("but7taskForm2tasks"+id).setDisabled(false);
		}
	}else{
		dijit.byId("but6taskForm2tasks"+id).setDisabled(true);
		dijit.byId("but7taskForm2tasks"+id).setDisabled(true);
	
	}
	if(taskForm2tasksFloatArray[id].pagesizetaskForm2tasks==0){
		totalpage=1;
		dijit.byId("but6taskForm2tasks"+id).setDisabled(true);
		dijit.byId("but7taskForm2tasks"+id).setDisabled(true);
	}
	if(totalpage==1)taskForm2tasksFloatArray[id].pagenumbertaskForm2tasks=1;
	
	 document.getElementById("rowCounttaskForm2tasks"+id).innerHTML=i18nStr.di+" "+taskForm2tasksFloatArray[id].pagenumbertaskForm2tasks+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+taskForm2tasksFloatArray[id].totalCounttaskForm2tasks+" "+i18nStr.rowSize; 	

	taskForm2tasksFloatArray[id].querydatataskForm2tasks.splice(taskForm2tasksFloatArray[id].querydatataskForm2tasks.length-1,1);
	taskForm2tasksFloatArray[id].modeltaskForm2tasks.setData(taskForm2tasksFloatArray[id].querydatataskForm2tasks);
}

var buildtaskForm2tasks=function(mainID){
	if( mainID!=undefined && mainID!=''){//NUtaskForm2tasks &&
	    var openFloat=dijit.byId("openFloat_"+mainID);
		var openGrid=dijit.byId("gridtaskForm2tasks"+mainID);
		if(openGrid==undefined){
		openFloat.setContent("<table style=\"width:80%; position:absolute;top:0px;\"><tr height=\"25px\" width=\"100%\"><td align=\"left\" style=\"background:transparent\"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   taskForm2tasks List&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td><td align=\"right\" ><span ></span>&nbsp;&nbsp;<div ></div><div > </div><div ></div><div ></div><div ></div></td></tr></table><div style=\"{width:999px;height:500px; position:absolute;top:30px;}\" ><div ></div></div>");

	  	taskForm2tasksFloatArray[mainID] = new taskForm2tasksFloatPara(mainID);
		var openContainerTable=openFloat.containerNode.children[0].children[0].children[0].children[1].childNodes;
		openContainerTable[0].innerHTML="<span id=\"rowCounttaskForm2tasks"+mainID+"\"></span>";
var but1 = new dijit.form.myButton({label:"pageup",id:"but6taskForm2tasks"+mainID,disabled:"true",onclick:"upPagetaskForm2tasks("+mainID+");",iconClass:"upPageIcon"},openContainerTable[1]);
var but2= new dijit.form.myButton({label:"pagedown",id:"but7taskForm2tasks"+mainID,disabled:"true",onclick:"downPagetaskForm2tasks("+mainID+");",iconClass:"downPageIcon"},openContainerTable[2]);
	var but3 = new dijit.form.Button({label:"add",iconClass:"addIcon"},openContainerTable[3]);
	var but4 = new dijit.form.Button({label:"delete",iconClass:"delIcon"},openContainerTable[4]);//,onClick:"removetaskForm2tasks("+mainID+")"
	var but5 = new dijit.form.Button({label:"save",iconClass:"saveIcon",id:"but3taskForm2tasks"+mainID },openContainerTable[5]);//,onclick:but3taskForm2tasks(mainID)
		dojo.connect(but3, "onClick", function(e){  addRowtaskForm2tasks(""+mainID); });
		dojo.connect(but4, "onClick", function(e){  removetaskForm2tasks(""+mainID); });
		dojo.connect(but5, "onClick", function(e){  call_funUpdtaskForm2tasks(""+mainID); });
		var openContainerGrid=openFloat.containerNode.children[1].children[0];
		var queryFloatTaskForm=new Object();
		queryFloatTaskForm.id=mainID;
		taskForm2tasksFloatArray[mainID].queryvotaskForm2tasks.taskForm=queryFloatTaskForm;
		getVOtaskForm2tasks(taskForm2tasksFloatArray[mainID].queryvotaskForm2tasks,mainID);
		//if(taskForm2tasksFloatArray[mainID].gridtaskForm2tasks==""){
			  taskForm2tasksFloatArray[mainID].gridtaskForm2tasks = new dojox.Grid({
					title: "",
					id: "gridtaskForm2tasks"+mainID,
					jsId: "gridtaskForm2tasks"+mainID,
					structure: buildLayouttaskForm2tasks(mainID),
					rowCount:taskForm2tasksFloatArray[mainID].querydatataskForm2tasks.length,
					model:taskForm2tasksFloatArray[mainID].modeltaskForm2tasks
				},openContainerGrid);
				//gridtaskForm2tasks.resize({w: dijit.byId("rightPane").domNode.clientWidth-16,h:dijit.byId("rightPane").domNode.clientHeight-100});
				
		}else{
			taskForm2tasksFloatArray[mainID].gridtaskForm2tasks.updateRowCount(taskForm2tasksFloatArray[mainID].querydatataskForm2tasks.length); 
		}}
}

													//??????¡À¨ª???¨ª????????
																			var buildLayouttaskForm2tasks = function(floatMainID){		
	var layouttaskForm2tasks=[{
           //?¨´??field???????????????????¨°????js????toArray¡Á??????¡§??????querydate????????
   
			 cells: [ [
					   { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
					   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
            {name: i18nStr.num,field:2, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
		             ,  {name: i18nStr.volumne,field:3, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
		        				    ,   {name: i18nStr.remark, field: 4,width: 10, editor: dojox.grid.editors.Editor,required:false, editorToolbar: true  }
					      
//??????¡À¨ª???¨ª????????
																                                        ] ]
                           }]; 
return layouttaskForm2tasks;
}
var addRowtaskForm2tasks = function(id){

	var addrow=[];
														addrow.push('');
																					addrow.push('');
																					addrow.push('');
																							//{ass.otherEnd.name}=taskForm
					addrow.push([false,id]);
											addrow.splice(0,0,false,0);
	dijit.byId("gridtaskForm2tasks"+id).addRow(addrow,taskForm2tasksFloatArray[id].gridtaskForm2tasks.model.getRowCount());
} 

function removetaskForm2tasks(id){
       var s= new Array();
       var sall=taskForm2tasksFloatArray[id].gridtaskForm2tasks.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
          s.push(i);
          var thisCell=sall[i];
          if(thisCell[1]!=0){//the row which will be deleted
            taskForm2tasksFloatArray[id].deletedatataskForm2tasks.splice(taskForm2tasksFloatArray[id].deletedatataskForm2tasks.length,0,thisCell[1]);
       }}}
       taskForm2tasksFloatArray[id].gridtaskForm2tasks.model.remove(s);//grid.removeSelectedRows();
 }
function call_funUpdtaskForm2tasks(id) {
       var sall=taskForm2tasksFloatArray[id].gridtaskForm2tasks.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
         var passAll=0;
         var thisCell=sall[i];
         var padd = new SOAPClientParameters2();
         var vobject=new Object();
         vobject.id=thisCell[1];
             if(dojox.validate.isInRange(thisCell[2],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[2];vobject.num=n;
             }else{taskForm2tasksFloatArray[id].gridtaskForm2tasks.getCell(taskForm2tasksFloatArray[id].gridtaskForm2tasks.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[3],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[3];vobject.volumne=n;
             }else{taskForm2tasksFloatArray[id].gridtaskForm2tasks.getCell(taskForm2tasksFloatArray[id].gridtaskForm2tasks.model.fieldArray[3]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

               vobject.remark=thisCell[4];
 

																var manageable=new Object();
			 manageable.id=mainID;
             vobject.taskForm=manageable;
			 			


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('TaskVO',vobject);
                SOAPClient.invoke(urltaskForm2tasks, "createTask", padd, false,  function GetEnu_callBack(ul, soapResponse){
                taskForm2tasksFloatArray[id].gridtaskForm2tasks.model.setDatum(ul,i,1);
				});
	         }else{//modify row
                padd.add('TaskVO',vobject);
                SOAPClient.invoke(urltaskForm2tasks, "updateTask", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
        } }}//for
//submit delete
          for(var i=0;i<taskForm2tasksFloatArray[id].deletedatataskForm2tasks.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',taskForm2tasksFloatArray[id].deletedatataskForm2tasks[i]);
               SOAPClient.invoke(urltaskForm2tasks, "deleteTask", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
	           });
          }
          taskForm2tasksFloatArray[id].deletedatataskForm2tasks=new Array();
          //dojo.byId("rowCount").innerHTML = 'saved'; 
//submit delete end          
 } 
 
	function selectTaskFormFun(rep){
						taskForm2tasksFloatArray[dojoTaskForm.mainRowIndexTaskForm].querydatataskForm2tasks[dojoTaskForm.selectTaskFormInRow][dojoTaskForm.noTaskForm]=rep;
		taskForm2tasksFloatArray[dojoTaskForm.mainRowIndexTaskForm].gridtaskForm2tasks.updateRow(dojoTaskForm.selectTaskFormInRow);	
		
			
	}

function pageSizeChangetaskForm2tasks(mylabel){
	taskForm2tasksFloatArray[id].pagesizetaskForm2tasks=mylabel;
	getVOtaskForm2tasks(taskForm2tasksFloatArray[id].queryvotaskForm2tasks,mainID);
}

function allpagetaskForm2tasks(id){
	taskForm2tasksFloatArray[id].pagesizetaskForm2tasks=0;
	getVOtaskForm2tasks(taskForm2tasksFloatArray[id].queryvotaskForm2tasks,mainID);
}

function upPagetaskForm2tasks(id){
	pagenumbertaskForm2tasks--;
	getVOtaskForm2tasks(taskForm2tasksFloatArray[id].queryvotaskForm2tasks,mainID);
}
function downPagetaskForm2tasks(id){
	pagenumbertaskForm2tasks++;
	getVOtaskForm2tasks(taskForm2tasksFloatArray[id].queryvotaskForm2tasks,mainID);
}


