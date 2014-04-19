	  
//??????"????¡À¨ª"?????¡§¡À¨ª
        //set (= taskForm2tasks)
//????????????layout??($member in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[taskForm]])??if(!${member.many})  ??¡Á?????????Float???????¡ã????????
								  var NUtaskForm2tasks = false;//needUpdate
  var urltaskForm2tasks = getUrl()+ "services/TaskManageService";
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

//have set function's manageableAssociationEnds
 
  
var getVOtaskForm2tasks=function(queryvo){

	var pu = new SOAPClientParameters2();
	pu.add('TaskVO',queryvo) ;
	pu.add('pageNumber',pagenumbertaskForm2tasks) ;
	pu.add('pageSize',pagesizetaskForm2tasks) ;
	pu.add('orderBy',orderBytaskForm2tasks) ;
	SOAPClient.invoke(urltaskForm2tasks,"getTask", pu, false,  function GetEnu_callBack(ul, soapResponse){      
//????¡À?¡À¨ª??????¡Á?¡À¨ª,?¡À????¡À¨ª???¨¤??¡À¨ª??¡Á?¡À¨ª?¡À?????????????¨ª?¨®??	
						//TaskForm-----TaskForm
			querydatataskForm2tasks=dojoTaskForm.TaskVOtoArray_fun(ul,true);
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

var buildtaskForm2tasks=function(){
	if(NUtaskForm2tasks && mainID!=undefined && mainID!=''){
		var queryFloatTaskForm=new Object();
		queryFloatTaskForm.id=mainID+'';
		queryvotaskForm2tasks.taskForm=queryFloatTaskForm;
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
				gridtaskForm2tasks.resize({w: dijit.byId("rightPane").domNode.clientWidth-16,h:dijit.byId("rightPane").domNode.clientHeight-100});
				
		}else{
			gridtaskForm2tasks.updateRowCount(querydatataskForm2tasks.length); 
		}
		NUtaskForm2tasks=false;
	}

}

													
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


var addRowtaskForm2tasks = function(){

	var addrow=[];
														addrow.push('');
																					addrow.push('');
																					addrow.push('');
																							//{ass.otherEnd.name}=taskForm
					addrow.push([false,mainID]);
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
         vobject.id=thisCell[1]+'';
             if(dojox.validate.isInRange(thisCell[2],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[2];vobject.num=n;
             }else{gridtaskForm2tasks.getCell(gridtaskForm2tasks.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[3],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[3];vobject.volumne=n;
             }else{gridtaskForm2tasks.getCell(gridtaskForm2tasks.model.fieldArray[3]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

               vobject.remark=thisCell[4];
 

																var manageable=new Object();
			 manageable.id=mainID+'';
             vobject.taskForm=manageable;
			 			


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('TaskVO',vobject);
                SOAPClient.invoke(urltaskForm2tasks, "createTask", padd, false,  function GetEnu_callBack(ul, soapResponse){
                gridtaskForm2tasks.model.setDatum(ul,i,1);
				});
	         }else{//modify row
                padd.add('TaskVO',vobject);
                SOAPClient.invoke(urltaskForm2tasks, "updateTask", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
        } }}//for
//submit delete
          for(var i=0;i<deletedatataskForm2tasks.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',deletedatataskForm2tasks[i]);
               SOAPClient.invoke(urltaskForm2tasks, "deleteTask", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
	           });
          }
          deletedatataskForm2tasks=new Array();
          //dojo.byId("rowCount").innerHTML = 'saved'; 
//submit delete end          
 } 
 
	function selectTaskFormFun(rep){
		querydatataskForm2tasks[dojoTask.selectTaskFormInRow][dojoTask.noTaskForm]=rep;
		gridtaskForm2tasks.updateRow(dojoTask.selectTaskFormInRow);		
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

	//buildtaskForm2tasks();
