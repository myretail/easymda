	  
//ÒÔÏÂÊÇ"ÒýÓÃ±í"ÊÇÆÕÍ¨±í
        //set (= orderRow2orderRowTasks)
//¶ÔÓÚ¿ÉÐÞ¸ÄµÄlayout£¬($member in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[orderRow], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[task]])²¢if(!${member.many})  µÄ×Ö¶ÎÓ¦µ¯³öFloatµÄÑ¡Ôñ´°¿Ú´ý²âÊÔ
								  var NUorderRow2orderRowTasks = false;//needUpdate
  var urlorderRow2orderRowTasks = getUrl()+ "services/OrderRowTaskManageService";
  var deletedataorderRow2orderRowTasks =  new Array();
  var querydataorderRow2orderRowTasks =  new Array();
  var pagenumberorderRow2orderRowTasks=1;
  var totalCountorderRow2orderRowTasks=0;
  var pagesizeorderRow2orderRowTasks=10;
  var orderByorderRow2orderRowTasks='0';
  var queryvoorderRow2orderRowTasks=new Object();
  var oddstyle='';
  var modelorderRow2orderRowTasks = new dojox.grid.data.Table(null, querydataorderRow2orderRowTasks);
  var gridorderRow2orderRowTasks;
  var urle2 = getUrl()+ "services/BasicManageService";   

//have set function's manageableAssociationEnds
 
  
var getVOorderRow2orderRowTasks=function(queryvo){

	var pu = new SOAPClientParameters2();
	pu.add('OrderRowTaskVO',queryvo) ;
	pu.add('pageNumber',pagenumberorderRow2orderRowTasks) ;
	pu.add('pageSize',pagesizeorderRow2orderRowTasks) ;
	pu.add('orderBy',orderByorderRow2orderRowTasks) ;
	SOAPClient.invoke(urlorderRow2orderRowTasks,"getOrderRowTask", pu, false,  function GetEnu_callBack(ul, soapResponse){      
//ÅÐ¶Ï±¾±íÊÇ·ñÎª×Ó±í,µ±Ò»¸ö±íÊÇ¶à¸ö±íµÄ×Ó±íÊ±£¬´Ë´¦¿ÉÄÜÓÐ´íÎó¡£	
	querydataorderRow2orderRowTasks=dojoOrderRowTask.OrderRowTaskVOtoArray_fun(ul,true);
	totalCountorderRow2orderRowTasks=ul[ul.length-1]["ns:id"]; 
	}); 
	var totalpage=Math.ceil(new Number(totalCountorderRow2orderRowTasks)/pagesizeorderRow2orderRowTasks);
	
	if(totalpage>1){
		if(pagenumberorderRow2orderRowTasks==1){
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
	if(pagesizeorderRow2orderRowTasks==0){
		totalpage=1;
		dijit.byId("but6orderRow2orderRowTasks").setDisabled(true);
		dijit.byId("but7orderRow2orderRowTasks").setDisabled(true);
	}
	if(totalpage==1)pagenumberorderRow2orderRowTasks=1;
	
	 document.getElementById("rowCountorderRow2orderRowTasks").innerHTML=i18nStr.di+" "+pagenumberorderRow2orderRowTasks+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountorderRow2orderRowTasks+" "+i18nStr.rowSize; 	

	querydataorderRow2orderRowTasks.splice(querydataorderRow2orderRowTasks.length-1,1);
	modelorderRow2orderRowTasks.setData(querydataorderRow2orderRowTasks);
}

var buildorderRow2orderRowTasks=function(){
	if(NUorderRow2orderRowTasks && mainID!=undefined && mainID!=''){
		var queryFloatOrderRowd=new Object();
		queryFloatOrderRowd.id=mainID+'';
		queryvoorderRow2orderRowTasks.orderRow=queryFloatOrderRowd;
		getVOorderRow2orderRowTasks(queryvoorderRow2orderRowTasks);
		if(dijit.byId("gridorderRow2orderRowTasks")==undefined){
			  gridorderRow2orderRowTasks = new dojox.Grid({
						title: "",
						id: "gridorderRow2orderRowTasks",
						jsId: "gridorderRow2orderRowTasks",
						structure: layoutorderRow2orderRowTasks,
						rowCount:querydataorderRow2orderRowTasks.length,
						model:modelorderRow2orderRowTasks
					}, dojo.byId("gridorderRow2orderRowTasks"));
				gridorderRow2orderRowTasks.resize({w: dijit.byId("rightPane").domNode.clientWidth-16,h:dijit.byId("rightPane").domNode.clientHeight-100});
				
		}else{
			gridorderRow2orderRowTasks.updateRowCount(querydataorderRow2orderRowTasks.length); 
		}
		NUorderRow2orderRowTasks=false;
	}

}

	
	var layoutorderRow2orderRowTasks=[{
           //¸ù¾ÝfieldµÄÖµ£¬ÒÀ¾ÝÄ¬ÈÏµÄË³Ðò£¬´ÓjsÖÐµÄtoArray×ª»»·½·¨·µ»ØµÄquerydateÖÐÈ¡Êý¾Ý
   
			 cells: [ [
					   { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
					   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//

//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
												//  {name: i18nStr.orderRow,field: 2,get:function(inRowIndex){ var str='';var strid;if(querydataorderRow2orderRowTasks[inRowIndex]!=undefined && querydataorderRow2orderRowTasks[inRowIndex][2]!=undefined && querydataorderRow2orderRowTasks[inRowIndex][2][2]!=undefined){str=querydataorderRow2orderRowTasks[inRowIndex][2][2];strid=querydataorderRow2orderRowTasks[inRowIndex][2][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" style="vertical-align:middle;margin-top:0px;margin-left:8px;" onclick="dojoOrderRowTask.selectOrderRowd('+strid+','+inRowIndex+',2,0,event);"   >';} ,width: 10 }
						//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
												  {name: i18nStr.task,field: 3,get:function(inRowIndex){ var str='';var strid;if(querydataorderRow2orderRowTasks[inRowIndex]!=undefined && querydataorderRow2orderRowTasks[inRowIndex][3]!=undefined && querydataorderRow2orderRowTasks[inRowIndex][3][2]!=undefined){str=querydataorderRow2orderRowTasks[inRowIndex][3][2];strid=querydataorderRow2orderRowTasks[inRowIndex][3][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" style="vertical-align:middle;margin-top:0px;margin-left:8px;" onclick="dojoOrderRowTask.selectTask('+strid+','+inRowIndex+',3,0,event);"   >';} ,width: 10 }
										                                        ] ]
                           }]; 


var addRoworderRow2orderRowTasks = function(){

	var addrow=[];
																//{ass.otherEnd.name}=orderRow
					addrow.push([false,mainID]);
																					addrow.push([]);
											addrow.splice(0,0,false,0);
	gridorderRow2orderRowTasks.addRow(addrow,gridorderRow2orderRowTasks.model.getRowCount());
} 

function removeorderRow2orderRowTasks(){
       var s= new Array();
       var sall=gridorderRow2orderRowTasks.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
          s.push(i);
          var thisCell=sall[i];
          if(thisCell[1]!=0){//the row which will be deleted
            deletedataorderRow2orderRowTasks.splice(deletedataorderRow2orderRowTasks.length,0,thisCell[1]);
       }}}
       gridorderRow2orderRowTasks.model.remove(s);//grid.removeSelectedRows();
 }
function call_funUpdorderRow2orderRowTasks() {
       var sall=gridorderRow2orderRowTasks.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
         var passAll=0;
         var thisCell=sall[i];
         var padd = new SOAPClientParameters2();
         var vobject=new Object();
         vobject.id=thisCell[1]+'';

								var manageable=new Object();
			 if(querydataorderRow2orderRowTasks[i][2]!=''&&querydataorderRow2orderRowTasks[i][2]!=undefined){
             manageable.id=querydataorderRow2orderRowTasks[i][2][1] +'';
             vobject.orderRow=manageable;
			 }else{
			 gridorderRow2orderRowTasks.getCell(gridorderRow2orderRowTasks.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
														var manageable=new Object();
			 if(querydataorderRow2orderRowTasks[i][3]!=''&&querydataorderRow2orderRowTasks[i][3]!=undefined){
             manageable.id=querydataorderRow2orderRowTasks[i][3][1] +'';
             vobject.task=manageable;
			 }else{
			 gridorderRow2orderRowTasks.getCell(gridorderRow2orderRowTasks.model.fieldArray[3]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
						


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('OrderRowTaskVO',vobject);
                SOAPClient.invoke(urlorderRow2orderRowTasks, "createOrderRowTask", padd, false,  function GetEnu_callBack(ul, soapResponse){
                gridorderRow2orderRowTasks.model.setDatum(ul,i,1);
				});
	         }else{//modify row
                padd.add('OrderRowTaskVO',vobject);
                SOAPClient.invoke(urlorderRow2orderRowTasks, "updateOrderRowTask", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
        } }}//for
//submit delete
          for(var i=0;i<deletedataorderRow2orderRowTasks.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',deletedataorderRow2orderRowTasks[i]);
               SOAPClient.invoke(urlorderRow2orderRowTasks, "deleteOrderRowTask", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
	           });
          }
          deletedataorderRow2orderRowTasks=new Array();
          //dojo.byId("rowCount").innerHTML = 'saved'; 
//submit delete end          
 } 
 
	function selectOrderRowdFun(rep){
		querydataorderRow2orderRowTasks[dojoOrderRowTask.selectOrderRowdInRow][dojoOrderRowTask.noOrderRowd]=rep;
		gridorderRow2orderRowTasks.updateRow(dojoOrderRowTask.selectOrderRowdInRow);		
	}
	function selectTaskFun(rep){
		querydataorderRow2orderRowTasks[dojoOrderRowTask.selectTaskInRow][dojoOrderRowTask.noTask]=rep;
		gridorderRow2orderRowTasks.updateRow(dojoOrderRowTask.selectTaskInRow);		
	}

function pageSizeChangeorderRow2orderRowTasks(mylabel){
	pagesizeorderRow2orderRowTasks=mylabel;
	getVOorderRow2orderRowTasks(queryvoorderRow2orderRowTasks);
}

function allpageorderRow2orderRowTasks(){
	pagesizeorderRow2orderRowTasks=0;
	getVOorderRow2orderRowTasks(queryvoorderRow2orderRowTasks);
}

function upPageorderRow2orderRowTasks(){
	pagenumberorderRow2orderRowTasks--;
	getVOorderRow2orderRowTasks(queryvoorderRow2orderRowTasks);
}
function downPageorderRow2orderRowTasks(){
	pagenumberorderRow2orderRowTasks++;
	getVOorderRow2orderRowTasks(queryvoorderRow2orderRowTasks);
}

	//buildorderRow2orderRowTasks();
	  	//buildorderRowTasks2task();
