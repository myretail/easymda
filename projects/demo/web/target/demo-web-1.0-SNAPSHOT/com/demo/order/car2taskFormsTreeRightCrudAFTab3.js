		  
//ÒÔÏÂÊÇ"ÒýÓÃ±í"ÊÇÆÕÍ¨±í
        //set (= car2taskForms)
//¶ÔÓÚ¿ÉÐÞ¸ÄµÄlayout£¬($member in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[tasks], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[car]])²¢if(!${member.many})  µÄ×Ö¶ÎÓ¦µ¯³öFloatµÄÑ¡Ôñ´°¿Ú´ý²âÊÔ
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

//have set function's manageableAssociationEnds
 
  
var getVOcar2taskForms=function(queryvo){

	var pu = new SOAPClientParameters2();
	pu.add('TaskFormVO',queryvo) ;
	pu.add('pageNumber',pagenumbercar2taskForms) ;
	pu.add('pageSize',pagesizecar2taskForms) ;
	pu.add('orderBy',orderBycar2taskForms) ;
	SOAPClient.invoke(urlcar2taskForms,"getTaskForm", pu, false,  function GetEnu_callBack(ul, soapResponse){      
//ÅÐ¶Ï±¾±íÊÇ·ñÎª×Ó±í,µ±Ò»¸ö±íÊÇ¶à¸ö±íµÄ×Ó±íÊ±£¬´Ë´¦¿ÉÄÜÓÐ´íÎó¡£	
	querydatacar2taskForms=dojoTaskForm.TaskFormVOtoArray_fun(ul,true);
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
		queryFloatcar.id=mainID+'';
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
				gridcar2taskForms.resize({w: dijit.byId("rightPane").domNode.clientWidth-16,h:dijit.byId("rightPane").domNode.clientHeight-100});
				
		}else{
			gridcar2taskForms.updateRowCount(querydatacar2taskForms.length); 
		}
		NUcar2taskForms=false;
	}

}

															
	var layoutcar2taskForms=[{
           //¸ù¾ÝfieldµÄÖµ£¬ÒÀ¾ÝÄ¬ÈÏµÄË³Ðò£¬´ÓjsÖÐµÄtoArray×ª»»·½·¨·µ»ØµÄquerydateÖÐÈ¡Êý¾Ý
   
			 cells: [ [
					   { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
					   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
  		  {name: i18nStr.setDate,field:2, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
				  {name: i18nStr.setDateTime,field:3, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
		        					,   {name: i18nStr.formState, field: 4,width: 10 , editor: mydojo.ValidationTextBox ,required:true ,maxLength:30}
					            				    ,   {name: i18nStr.remark, field: 5,width: 10, editor: dojox.grid.editors.Editor,required:false, editorToolbar: true  }
					      
//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
		//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
												//,   {name: i18nStr.car,field: 7,get:function(inRowIndex){ var str='';var strid;if(querydatacar2taskForms[inRowIndex]!=undefined && querydatacar2taskForms[inRowIndex][7]!=undefined && querydatacar2taskForms[inRowIndex][7][2]!=undefined){str=querydatacar2taskForms[inRowIndex][7][2];strid=querydatacar2taskForms[inRowIndex][7][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" style="vertical-align:middle;margin-top:0px;margin-left:8px;" onclick="dojoTaskForm.selectcar('+strid+','+inRowIndex+',7,0,event);"   >';} ,width: 10 }
						                                        ] ]
                           }]; 


var addRowcar2taskForms = function(){

	var addrow=[];
														addrow.push('');
					addrow.push('');
																					addrow.push('');
																					addrow.push('');
																								addrow.push([]);
												//{ass.otherEnd.name}=car
					addrow.push([false,mainID]);
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
         vobject.id=thisCell[1]+'';
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
             manageable.id=querydatacar2taskForms[i][7][1] +'';
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
 
	function selectTaskFun(rep){
		querydatacar2taskForms[dojoTaskForm.selectTaskInRow][dojoTaskForm.noTask]=rep;
		gridcar2taskForms.updateRow(dojoTaskForm.selectTaskInRow);		
	}
	function selectcarFun(rep){
		querydatacar2taskForms[dojoTaskForm.selectcarInRow][dojoTaskForm.nocar]=rep;
		gridcar2taskForms.updateRow(dojoTaskForm.selectcarInRow);		
	}

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

	//buildcar2taskForms();
