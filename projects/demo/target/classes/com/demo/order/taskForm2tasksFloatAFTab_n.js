	  //---begin---------???????????¨¤???¨¤??????¡À¨ª
							//---begin---------?????????¡À????????tree?¨¢??¡À¨ªsno
				//?????????¡§¡À¨ª
//set (= taskForm2tasks)
  //name =taskForm2tasksFloatAFTab.js  manageable.name=Task
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
  var gridtaskForm2tasks;*/
   
  
var getVOtaskForm2tasks=function(queryvo,id){

	var pu = new SOAPClientParameters2();
	pu.add('TaskVO',queryvo) ;
	pu.add('pageNumber',taskForm2tasksFloatArray[id].pagenumbertaskForm2tasks) ;
	pu.add('pageSize',taskForm2tasksFloatArray[id].pagesizetaskForm2tasks) ;
	pu.add('orderBy',taskForm2tasksFloatArray[id].orderBytaskForm2tasks) ;
	SOAPClient.invoke(urltaskForm2tasks,"getTask", pu, false,  function GetEnu_callBack(ul, soapResponse){      
		//????¡À?¡À¨ª??????¡Á?¡À¨ª,?¡À????¡À¨ª???¨¤??¡À¨ª??¡Á?¡À¨ª?¡À?????????????¨ª?¨®??	
						//TaskForm-----TaskForm
			taskForm2tasksFloatArray[id].querydatataskForm2tasks=dojoTaskForm.TaskVOtoArray_fun(ul,false);
			
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
	if( mainID!=undefined && mainID!=''){
		var openFloat=dijit.byId("gridtaskForm2tasks"+mainID);
		if(openFloat==undefined){
		
		taskForm2tasksFloatArray[mainID] = new taskForm2tasksFloatPara(mainID);
				var newTab = dijit.byId("taskForm2tasks"+mainID);
			newTab.setContent("<table   style=\"width:80%; position:absolute;top:0px;\"><tr height=\"25px\" width=\"100%\">	<td align=\"left\" style=\"background:transparent\"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   taskForm2tasks&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td><td align=\"right\" ><span ></span>&nbsp;&nbsp;	<div > </div><div > </div><div > </div>	<div > </div><div > </div>	</td></tr></table><div style=\"{width:500px;height:500px; position:absolute;top:30px;}\" ><div > </div></div>");
			var openContainerTable=newTab.containerNode.children[0].children[0].children[0].children[1].childNodes;

		openContainerTable[0].innerHTML="<span id=\"rowCounttaskForm2tasks"+mainID+"\"></span>";
var but1 = new dijit.form.myButton({label:"pageup",id:"but6taskForm2tasks"+mainID,disabled:"true",onclick:"upPagetaskForm2tasks("+mainID+");",iconClass:"upPageIcon"},openContainerTable[1]);
var but2= new dijit.form.myButton({label:"pagedown",id:"but7taskForm2tasks"+mainID,disabled:"true",onclick:"downPagetaskForm2tasks("+mainID+");",iconClass:"downPageIcon"},openContainerTable[2]);
	//var but3 = new dijit.form.Button({label:"add",iconClass:"addIcon"},openContainerTable[3]);
	//var but4 = new dijit.form.Button({label:"delete",iconClass:"delIcon"},openContainerTable[4]);//,onClick:"removetaskForm2tasks("+mainID+")"
	//var but5 = new dijit.form.Button({label:"save",iconClass:"saveIcon",id:"but3taskForm2tasks"+mainID },openContainerTable[5]);//,onclick:but3taskForm2tasks(mainID)
		//dojo.connect(but3, "onClick", function(e){  addRowtaskForm2tasks(""+mainID); });
		//dojo.connect(but4, "onClick", function(e){  removetaskForm2tasks(""+mainID); });
		//dojo.connect(but5, "onClick", function(e){  call_funUpdtaskForm2tasks(""+mainID); });
				var openContainerGrid=newTab.domNode.children[1].children[0];


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
				taskForm2tasksFloatArray[mainID].gridtaskForm2tasks.resize({w:999,h:500});

		}else{
			getVOtaskForm2tasks(taskForm2tasksFloatArray[mainID].queryvotaskForm2tasks,mainID);
			taskForm2tasksFloatArray[mainID].gridtaskForm2tasks.modelAllChange();

		}}

}

													var buildLayouttaskForm2tasks = function(floatMainID){		

	var layouttaskForm2tasks=[{
           //?¨´??field???????????????????¨°????js????toArray¡Á??????¡§??????querydate????????
   
			 cells: [ [
					   //{ name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
					   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
            {name: i18nStr.num,field:2, width: 8}
		             ,  {name: i18nStr.volumne,field:3, width: 8}
		    		,   {name: i18nStr.remark, field: 4,width: 10}
		  
//??????¡À¨ª???¨ª????????
																                                        ] ]
                           }]; 

return layouttaskForm2tasks;
}


