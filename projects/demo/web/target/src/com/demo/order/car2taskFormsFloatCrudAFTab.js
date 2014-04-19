		  //---begin---------???????????¨¤???¨¤??????¡À¨ª
							//---begin---------?????????¡À????????tree?¨¢??¡À¨ªsno
				//?????????¡§¡À¨ª
//set (= car2taskForms)
								  var NUcar2taskForms = false;//needUpdate
  var urlcar2taskForms = getUrl()+ "services/TaskFormManageService";
 /* var deletedatacar2taskForms =  new Array();
  var querydatacar2taskForms =  new Array();
  var pagenumbercar2taskForms=1;
  var totalCountcar2taskForms=0;
  var pagesizecar2taskForms=10;
  var orderBycar2taskForms='0';
  var queryvocar2taskForms=new Object();
  var oddstyle='';
  var modelcar2taskForms = new dojox.grid.data.Table(null, querydatacar2taskForms);
  var gridcar2taskForms;
  var urle2 = getUrl()+ "services/BasicManageService";   */
  
 
  
var getVOcar2taskForms=function(queryvo,id){

	var pu = new SOAPClientParameters2();
	pu.add('TaskFormVO',queryvo) ;
	pu.add('pageNumber',car2taskFormsFloatArray[id].pagenumbercar2taskForms) ;
	pu.add('pageSize',car2taskFormsFloatArray[id].pagesizecar2taskForms) ;
	pu.add('orderBy',car2taskFormsFloatArray[id].orderBycar2taskForms) ;
	SOAPClient.invoke(urlcar2taskForms,"getTaskForm", pu, false,  function GetEnu_callBack(ul, soapResponse){      
	//????¡À?¡À¨ª??????¡Á?¡À¨ª,?¡À????¡À¨ª???¨¤??¡À¨ª??¡Á?¡À¨ª?¡À?????????????¨ª?¨®??	
	car2taskFormsFloatArray[id].querydatacar2taskForms=dojoTaskForm.TaskFormVOtoArray_fun(ul,true);
	car2taskFormsFloatArray[id].totalCountcar2taskForms=ul[ul.length-1]["ns:id"]; 
	}); 
	var totalpage=Math.ceil(new Number(car2taskFormsFloatArray[id].totalCountcar2taskForms)/car2taskFormsFloatArray[id].pagesizecar2taskForms);
	
	if(totalpage>1){
		if(car2taskFormsFloatArray[id].pagenumbercar2taskForms==1){
			dijit.byId("but6car2taskForms"+id).setDisabled(true);
			dijit.byId("but7car2taskForms"+id).setDisabled(false);
		}else if(car2taskFormsFloatArray[id].pagenumbercar2taskForms==totalpage){
			dijit.byId("but6car2taskForms"+id).setDisabled(false);
			dijit.byId("but7car2taskForms"+id).setDisabled(true);
		}else{
			dijit.byId("but6car2taskForms"+id).setDisabled(false);
			dijit.byId("but7car2taskForms"+id).setDisabled(false);
		}
	}else{
		dijit.byId("but6car2taskForms"+id).setDisabled(true);
		dijit.byId("but7car2taskForms"+id).setDisabled(true);
	
	}
	if(car2taskFormsFloatArray[id].pagesizecar2taskForms==0){
		totalpage=1;
		dijit.byId("but6car2taskForms"+id).setDisabled(true);
		dijit.byId("but7car2taskForms"+id).setDisabled(true);
	}
	if(totalpage==1)car2taskFormsFloatArray[id].pagenumbercar2taskForms=1;
	
	 document.getElementById("rowCountcar2taskForms"+id).innerHTML=i18nStr.di+" "+car2taskFormsFloatArray[id].pagenumbercar2taskForms+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+car2taskFormsFloatArray[id].totalCountcar2taskForms+" "+i18nStr.rowSize; 	

	car2taskFormsFloatArray[id].querydatacar2taskForms.splice(car2taskFormsFloatArray[id].querydatacar2taskForms.length-1,1);
	car2taskFormsFloatArray[id].modelcar2taskForms.setData(car2taskFormsFloatArray[id].querydatacar2taskForms);
}

var buildcar2taskForms=function(mainID){
	if( mainID!=undefined && mainID!=''){//NUcar2taskForms &&
	    var openFloat=dijit.byId("openFloat_"+mainID);
		var openGrid=dijit.byId("gridcar2taskForms"+mainID);
		if(openGrid==undefined){
		openFloat.setContent("<table style=\"width:80%; position:absolute;top:0px;\"><tr height=\"25px\" width=\"100%\"><td align=\"left\" style=\"background:transparent\"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   car2taskForms List&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td><td align=\"right\" ><span ></span>&nbsp;&nbsp;<div ></div><div > </div><div ></div><div ></div><div ></div></td></tr></table><div style=\"{width:999px;height:500px; position:absolute;top:30px;}\" ><div ></div></div>");

	  	car2taskFormsFloatArray[mainID] = new car2taskFormsFloatPara(mainID);
		var openContainerTable=openFloat.containerNode.children[0].children[0].children[0].children[1].childNodes;
		openContainerTable[0].innerHTML="<span id=\"rowCountcar2taskForms"+mainID+"\"></span>";
var but1 = new dijit.form.myButton({label:"pageup",id:"but6car2taskForms"+mainID,disabled:"true",onclick:"upPagecar2taskForms("+mainID+");",iconClass:"upPageIcon"},openContainerTable[1]);
var but2= new dijit.form.myButton({label:"pagedown",id:"but7car2taskForms"+mainID,disabled:"true",onclick:"downPagecar2taskForms("+mainID+");",iconClass:"downPageIcon"},openContainerTable[2]);
	var but3 = new dijit.form.Button({label:"add",iconClass:"addIcon"},openContainerTable[3]);
	var but4 = new dijit.form.Button({label:"delete",iconClass:"delIcon"},openContainerTable[4]);//,onClick:"removecar2taskForms("+mainID+")"
	var but5 = new dijit.form.Button({label:"save",iconClass:"saveIcon",id:"but3car2taskForms"+mainID },openContainerTable[5]);//,onclick:but3car2taskForms(mainID)
		dojo.connect(but3, "onClick", function(e){  addRowcar2taskForms(""+mainID); });
		dojo.connect(but4, "onClick", function(e){  removecar2taskForms(""+mainID); });
		dojo.connect(but5, "onClick", function(e){  call_funUpdcar2taskForms(""+mainID); });
		var openContainerGrid=openFloat.containerNode.children[1].children[0];
		var queryFloatcar=new Object();
		queryFloatcar.id=mainID;
		car2taskFormsFloatArray[mainID].queryvocar2taskForms.car=queryFloatcar;
		getVOcar2taskForms(car2taskFormsFloatArray[mainID].queryvocar2taskForms,mainID);
		//if(car2taskFormsFloatArray[mainID].gridcar2taskForms==""){
			  car2taskFormsFloatArray[mainID].gridcar2taskForms = new dojox.Grid({
					title: "",
					id: "gridcar2taskForms"+mainID,
					jsId: "gridcar2taskForms"+mainID,
					structure: buildLayoutcar2taskForms(mainID),
					rowCount:car2taskFormsFloatArray[mainID].querydatacar2taskForms.length,
					model:car2taskFormsFloatArray[mainID].modelcar2taskForms
				},openContainerGrid);
				//gridcar2taskForms.resize({w: dijit.byId("rightPane").domNode.clientWidth-16,h:dijit.byId("rightPane").domNode.clientHeight-100});
				
		}else{
			car2taskFormsFloatArray[mainID].gridcar2taskForms.updateRowCount(car2taskFormsFloatArray[mainID].querydatacar2taskForms.length); 
		}}
}

															//??????¡À¨ª???¨ª????????
	//??????¡À¨ª???¨ª????????
						var buildLayoutcar2taskForms = function(floatMainID){		
	var layoutcar2taskForms=[{
           //?¨´??field???????????????????¨°????js????toArray¡Á??????¡§??????querydate????????
   
			 cells: [ [
					   { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
					   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
  		  {name: i18nStr.setDate,field:2, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
				,   {name: i18nStr.setDateTime,field:3, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
		        					,   {name: i18nStr.formState, field: 4,width: 10 , editor: mydojo.ValidationTextBox ,required:true ,maxLength:30}
					            				    ,   {name: i18nStr.remark, field: 5,width: 10, editor: dojox.grid.editors.Editor,required:false, editorToolbar: true  }
					      
//??????¡À¨ª???¨ª????????
		//??????¡À¨ª???¨ª????????
												//,   {name: i18nStr.car,field: 7,get:function(inRowIndex){ var str='';var strid;if(querydatacar2taskForms[inRowIndex]!=undefined && querydatacar2taskForms[inRowIndex][7]!=undefined && querydatacar2taskForms[inRowIndex][7][2]!=undefined){str=querydatacar2taskForms[inRowIndex][7][2];strid=querydatacar2taskForms[inRowIndex][7][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" class="imgSelectStyle" onclick="selectcar('+strid+','+inRowIndex+',7,0,event);"   >';} ,width: 10 }
						                                        ] ]
                           }]; 
return layoutcar2taskForms;
}
var addRowcar2taskForms = function(id){

	var addrow=[];
														addrow.push('');
					addrow.push('');
																					addrow.push('');
																					addrow.push('');
																								addrow.push([]);
												//{ass.otherEnd.name}=car
					addrow.push([false,id]);
											addrow.splice(0,0,false,0);
	dijit.byId("gridcar2taskForms"+id).addRow(addrow,car2taskFormsFloatArray[id].gridcar2taskForms.model.getRowCount());
} 

function removecar2taskForms(id){
       var s= new Array();
       var sall=car2taskFormsFloatArray[id].gridcar2taskForms.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
          s.push(i);
          var thisCell=sall[i];
          if(thisCell[1]!=0){//the row which will be deleted
            car2taskFormsFloatArray[id].deletedatacar2taskForms.splice(car2taskFormsFloatArray[id].deletedatacar2taskForms.length,0,thisCell[1]);
       }}}
       car2taskFormsFloatArray[id].gridcar2taskForms.model.remove(s);//grid.removeSelectedRows();
 }
function call_funUpdcar2taskForms(id) {
       var sall=car2taskFormsFloatArray[id].gridcar2taskForms.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
         var passAll=0;
         var thisCell=sall[i];
         var padd = new SOAPClientParameters2();
         var vobject=new Object();
         vobject.id=thisCell[1];
var  d=new DateTimeQuery();
             if(thisCell[2] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[2], car2taskFormsFloatArray[id].gridcar2taskForms.getCell(car2taskFormsFloatArray[id].gridcar2taskForms.model.fieldArray[2]).constraint);
             }else{car2taskFormsFloatArray[id].gridcar2taskForms.getCell(car2taskFormsFloatArray[id].gridcar2taskForms.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[3] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[3], car2taskFormsFloatArray[id].gridcar2taskForms.getCell(car2taskFormsFloatArray[id].gridcar2taskForms.model.fieldArray[3]).constraint);
             vobject.setDate=d;
             }else{car2taskFormsFloatArray[id].gridcar2taskForms.getCell(car2taskFormsFloatArray[id].gridcar2taskForms.model.fieldArray[3]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null
 

              if(dojox.validate.isText(thisCell[4], {minlength: 1})){vobject.formState=thisCell[4];
             }else{car2taskFormsFloatArray[id].gridcar2taskForms.getCell(car2taskFormsFloatArray[id].gridcar2taskForms.model.fieldArray[4]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;}//not null
 
               vobject.remark=thisCell[5];
 

										var manageable=new Object();
			 if(car2taskFormsFloatArray[id].querydatacar2taskForms[i][7]!=''&&car2taskFormsFloatArray[id].querydatacar2taskForms[i][7]!=undefined){
             manageable.id=car2taskFormsFloatArray[id].querydatacar2taskForms[i][7][1];
             vobject.car=manageable;
			 }else{
			 car2taskFormsFloatArray[id].gridcar2taskForms.getCell(car2taskFormsFloatArray[id].gridcar2taskForms.model.fieldArray[7]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
						


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('TaskFormVO',vobject);
                SOAPClient.invoke(urlcar2taskForms, "createTaskForm", padd, false,  function GetEnu_callBack(ul, soapResponse){
                car2taskFormsFloatArray[id].gridcar2taskForms.model.setDatum(ul,i,1);
				});
	         }else{//modify row
                padd.add('TaskFormVO',vobject);
                SOAPClient.invoke(urlcar2taskForms, "updateTaskForm", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
        } }}//for
//submit delete
          for(var i=0;i<car2taskFormsFloatArray[id].deletedatacar2taskForms.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',car2taskFormsFloatArray[id].deletedatacar2taskForms[i]);
               SOAPClient.invoke(urlcar2taskForms, "deleteTaskForm", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
	           });
          }
          car2taskFormsFloatArray[id].deletedatacar2taskForms=new Array();
          //dojo.byId("rowCount").innerHTML = 'saved'; 
//submit delete end          
 } 
 
	function selectTaskFun(rep){
		car2taskFormsFloatArray[dojoTaskForm.mainRowIndexTask].querydatacar2taskForms[dojoTaskForm.selectTaskInRow][dojoTaskForm.noTask]=rep;
		car2taskFormsFloatArray[dojoTaskForm.mainRowIndexTask].gridcar2taskForms.updateRow(dojoTaskForm.selectTaskInRow);	
			
	}
	function selectcarFun(rep){
		car2taskFormsFloatArray[dojoTaskForm.mainRowIndexcar].querydatacar2taskForms[dojoTaskForm.selectcarInRow][dojoTaskForm.nocar]=rep;
		car2taskFormsFloatArray[dojoTaskForm.mainRowIndexcar].gridcar2taskForms.updateRow(dojoTaskForm.selectcarInRow);	
			
	}

function pageSizeChangecar2taskForms(mylabel){
	car2taskFormsFloatArray[id].pagesizecar2taskForms=mylabel;
	getVOcar2taskForms(car2taskFormsFloatArray[id].queryvocar2taskForms,mainID);
}

function allpagecar2taskForms(id){
	car2taskFormsFloatArray[id].pagesizecar2taskForms=0;
	getVOcar2taskForms(car2taskFormsFloatArray[id].queryvocar2taskForms,mainID);
}

function upPagecar2taskForms(id){
	pagenumbercar2taskForms--;
	getVOcar2taskForms(car2taskFormsFloatArray[id].queryvocar2taskForms,mainID);
}
function downPagecar2taskForms(id){
	pagenumbercar2taskForms++;
	getVOcar2taskForms(car2taskFormsFloatArray[id].queryvocar2taskForms,mainID);
}


