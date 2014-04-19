		  //---begin---------???????????¨¤???¨¤??????¡À¨ª
							//---begin---------?????????¡À????????tree?¨¢??¡À¨ªsno
				//?????????¡§¡À¨ª
//set (= car2taskForms)
  //name =car2taskFormsFloatAFTab.js  manageable.name=TaskForm
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
  var gridcar2taskForms;*/
   
  
var getVOcar2taskForms=function(queryvo,id){

	var pu = new SOAPClientParameters2();
	pu.add('TaskFormVO',queryvo) ;
	pu.add('pageNumber',car2taskFormsFloatArray[id].pagenumbercar2taskForms) ;
	pu.add('pageSize',car2taskFormsFloatArray[id].pagesizecar2taskForms) ;
	pu.add('orderBy',car2taskFormsFloatArray[id].orderBycar2taskForms) ;
	SOAPClient.invoke(urlcar2taskForms,"getTaskForm", pu, false,  function GetEnu_callBack(ul, soapResponse){      
		//????¡À?¡À¨ª??????¡Á?¡À¨ª,?¡À????¡À¨ª???¨¤??¡À¨ª??¡Á?¡À¨ª?¡À?????????????¨ª?¨®??	
	car2taskFormsFloatArray[id].querydatacar2taskForms=dojoTaskForm.TaskFormVOtoArray_fun(ul,false);

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
	if( mainID!=undefined && mainID!=''){
		    var openFloat=dijit.byId("openFloat_"+mainID);
		var openGrid=dijit.byId("gridcar2taskForms"+mainID);
		if(openGrid==undefined){
		openFloat.setContent("<table style=\"width:80%; position:absolute;top:0px;\"><tr height=\"25px\" width=\"100%\"><td align=\"left\" style=\"background:transparent\"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   car2taskForms List&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td><td align=\"right\" ><span ></span>&nbsp;&nbsp;<div ></div><div > </div><div ></div><div ></div><div ></div></td></tr></table><div style=\"{width:999px;height:500px; position:absolute;top:30px;}\" ><div ></div></div>");

	  	car2taskFormsFloatArray[mainID] = new car2taskFormsFloatPara(mainID);
		var openContainerTable=openFloat.containerNode.children[0].children[0].children[0].children[1].childNodes;
		openContainerTable[0].innerHTML="<span id=\"rowCountcar2taskForms"+mainID+"\"></span>";
var but1 = new dijit.form.myButton({label:"pageup",id:"but6car2taskForms"+mainID,disabled:"true",onclick:"upPagecar2taskForms("+mainID+");",iconClass:"upPageIcon"},openContainerTable[1]);
var but2= new dijit.form.myButton({label:"pagedown",id:"but7car2taskForms"+mainID,disabled:"true",onclick:"downPagecar2taskForms("+mainID+");",iconClass:"downPageIcon"},openContainerTable[2]);
	//var but3 = new dijit.form.Button({label:"add",iconClass:"addIcon"},openContainerTable[3]);
	//var but4 = new dijit.form.Button({label:"delete",iconClass:"delIcon"},openContainerTable[4]);//,onClick:"removecar2taskForms("+mainID+")"
	//var but5 = new dijit.form.Button({label:"save",iconClass:"saveIcon",id:"but3car2taskForms"+mainID },openContainerTable[5]);//,onclick:but3car2taskForms(mainID)
		//dojo.connect(but3, "onClick", function(e){  addRowcar2taskForms(""+mainID); });
		//dojo.connect(but4, "onClick", function(e){  removecar2taskForms(""+mainID); });
		//dojo.connect(but5, "onClick", function(e){  call_funUpdcar2taskForms(""+mainID); });
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

															var buildLayoutcar2taskForms = function(floatMainID){		

	var layoutcar2taskForms=[{
           //?¨´??field???????????????????¨°????js????toArray¡Á??????¡§??????querydate????????
   
			 cells: [ [
					   //{ name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
					   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
  		  {name: i18nStr.setDate,field:2, width: 8}
		    		,   {name: i18nStr.formState, field: 3,width: 10}
		    		,   {name: i18nStr.remark, field: 4,width: 10}
		  
//??????¡À¨ª???¨ª????????
		//??????¡À¨ª???¨ª????????
												//,   {name: i18nStr.car,field: 6,get:function(inRowIndex){ var str='';var strid;if(car2taskFormsFloatArray[floatMainID].querydatacar2taskForms[inRowIndex]!=undefined && car2taskFormsFloatArray[floatMainID].querydatacar2taskForms[inRowIndex][6]!=undefined && car2taskFormsFloatArray[floatMainID].querydatacar2taskForms[inRowIndex][6][2]!=undefined){str=car2taskFormsFloatArray[floatMainID].querydatacar2taskForms[inRowIndex][6][2];strid=car2taskFormsFloatArray[floatMainID].querydatacar2taskForms[inRowIndex][6][1];} return str;} ,width: 10 }
						                                        ] ]
                           }]; 

return layoutcar2taskForms;
}


