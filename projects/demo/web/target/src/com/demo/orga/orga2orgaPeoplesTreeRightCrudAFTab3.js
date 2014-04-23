	  
//ÒÔÏÂÊÇ"ÒýÓÃ±í"ÊÇÆÕÍ¨±í
        //set (= orga2orgaPeoples)
//¶ÔÓÚ¿ÉÐÞ¸ÄµÄlayout£¬($member in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[orga], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[people]])²¢if(!${member.many})  µÄ×Ö¶ÎÓ¦µ¯³öFloatµÄÑ¡Ôñ´°¿Ú´ý²âÊÔ
								  var NUorga2orgaPeoples = false;//needUpdate
  var urlorga2orgaPeoples = getUrl()+ "services/OrgaPeoplesManageService";
  var deletedataorga2orgaPeoples =  new Array();
  var querydataorga2orgaPeoples =  new Array();
  var pagenumberorga2orgaPeoples=1;
  var totalCountorga2orgaPeoples=0;
  var pagesizeorga2orgaPeoples=10;
  var orderByorga2orgaPeoples='0';
  var queryvoorga2orgaPeoples=new Object();
  var oddstyle='';
  var modelorga2orgaPeoples = new dojox.grid.data.Table(null, querydataorga2orgaPeoples);
  var gridorga2orgaPeoples;
  var urle2 = getUrl()+ "services/BasicManageService";   

//have set function's manageableAssociationEnds
 
  
var getVOorga2orgaPeoples=function(queryvo){

	var pu = new SOAPClientParameters2();
	pu.add('OrgaPeoplesVO',queryvo) ;
	pu.add('pageNumber',pagenumberorga2orgaPeoples) ;
	pu.add('pageSize',pagesizeorga2orgaPeoples) ;
	pu.add('orderBy',orderByorga2orgaPeoples) ;
	SOAPClient.invoke(urlorga2orgaPeoples,"getOrgaPeoples", pu, false,  function GetEnu_callBack(ul, soapResponse){      
//ÅÐ¶Ï±¾±íÊÇ·ñÎª×Ó±í,µ±Ò»¸ö±íÊÇ¶à¸ö±íµÄ×Ó±íÊ±£¬´Ë´¦¿ÉÄÜÓÐ´íÎó¡£	
	querydataorga2orgaPeoples=dojoOrgaPeoples.OrgaPeoplesVOtoArray_fun(ul,true);
	totalCountorga2orgaPeoples=ul[ul.length-1]["ns:id"]; 
	}); 
	var totalpage=Math.ceil(new Number(totalCountorga2orgaPeoples)/pagesizeorga2orgaPeoples);
	
	if(totalpage>1){
		if(pagenumberorga2orgaPeoples==1){
			dijit.byId("but6orga2orgaPeoples").setDisabled(true);
			dijit.byId("but7orga2orgaPeoples").setDisabled(false);
		}else if(pagenumberorga2orgaPeoples==totalpage){
			dijit.byId("but6orga2orgaPeoples").setDisabled(false);
			dijit.byId("but7orga2orgaPeoples").setDisabled(true);
		}else{
			dijit.byId("but6orga2orgaPeoples").setDisabled(false);
			dijit.byId("but7orga2orgaPeoples").setDisabled(false);
		}
	}else{
		dijit.byId("but6orga2orgaPeoples").setDisabled(true);
		dijit.byId("but7orga2orgaPeoples").setDisabled(true);
	
	}
	if(pagesizeorga2orgaPeoples==0){
		totalpage=1;
		dijit.byId("but6orga2orgaPeoples").setDisabled(true);
		dijit.byId("but7orga2orgaPeoples").setDisabled(true);
	}
	if(totalpage==1)pagenumberorga2orgaPeoples=1;
	
	 document.getElementById("rowCountorga2orgaPeoples").innerHTML=i18nStr.di+" "+pagenumberorga2orgaPeoples+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountorga2orgaPeoples+" "+i18nStr.rowSize; 	

	querydataorga2orgaPeoples.splice(querydataorga2orgaPeoples.length-1,1);
	modelorga2orgaPeoples.setData(querydataorga2orgaPeoples);
}

var buildorga2orgaPeoples=function(){
	if(NUorga2orgaPeoples && mainID!=undefined && mainID!=''){
		var queryFloatOrga=new Object();
		queryFloatOrga.id=mainID+'';
		queryvoorga2orgaPeoples.orga=queryFloatOrga;
		getVOorga2orgaPeoples(queryvoorga2orgaPeoples);
		if(dijit.byId("gridorga2orgaPeoples")==undefined){
			  gridorga2orgaPeoples = new dojox.Grid({
						title: "",
						id: "gridorga2orgaPeoples",
						jsId: "gridorga2orgaPeoples",
						structure: layoutorga2orgaPeoples,
						rowCount:querydataorga2orgaPeoples.length,
						model:modelorga2orgaPeoples
					}, dojo.byId("gridorga2orgaPeoples"));
				gridorga2orgaPeoples.resize({w: dijit.byId("rightPane").domNode.clientWidth-16,h:dijit.byId("rightPane").domNode.clientHeight-100});
				
		}else{
			gridorga2orgaPeoples.updateRowCount(querydataorga2orgaPeoples.length); 
		}
		NUorga2orgaPeoples=false;
	}

}

	
	var layoutorga2orgaPeoples=[{
           //¸ù¾ÝfieldµÄÖµ£¬ÒÀ¾ÝÄ¬ÈÏµÄË³Ðò£¬´ÓjsÖÐµÄtoArray×ª»»·½·¨·µ»ØµÄquerydateÖÐÈ¡Êý¾Ý
   
			 cells: [ [
					   { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
					   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//

//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
												//  {name: i18nStr.orga,field: 2,get:function(inRowIndex){ var str='';var strid;if(querydataorga2orgaPeoples[inRowIndex]!=undefined && querydataorga2orgaPeoples[inRowIndex][2]!=undefined && querydataorga2orgaPeoples[inRowIndex][2][2]!=undefined){str=querydataorga2orgaPeoples[inRowIndex][2][2];strid=querydataorga2orgaPeoples[inRowIndex][2][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" style="vertical-align:middle;margin-top:0px;margin-left:8px;" onclick="dojoOrgaPeoples.selectOrga('+strid+','+inRowIndex+',2,0,event);"   >';} ,width: 10 }
						//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
												  {name: i18nStr.people,field: 3,get:function(inRowIndex){ var str='';var strid;if(querydataorga2orgaPeoples[inRowIndex]!=undefined && querydataorga2orgaPeoples[inRowIndex][3]!=undefined && querydataorga2orgaPeoples[inRowIndex][3][2]!=undefined){str=querydataorga2orgaPeoples[inRowIndex][3][2];strid=querydataorga2orgaPeoples[inRowIndex][3][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" style="vertical-align:middle;margin-top:0px;margin-left:8px;" onclick="dojoOrgaPeoples.selectPeoples('+strid+','+inRowIndex+',3,0,event);"   >';} ,width: 10 }
										                                        ] ]
                           }]; 


var addRoworga2orgaPeoples = function(){

	var addrow=[];
																//{ass.otherEnd.name}=orga
					addrow.push([false,mainID]);
																					addrow.push([]);
											addrow.splice(0,0,false,0);
	gridorga2orgaPeoples.addRow(addrow,gridorga2orgaPeoples.model.getRowCount());
} 

function removeorga2orgaPeoples(){
       var s= new Array();
       var sall=gridorga2orgaPeoples.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
          s.push(i);
          var thisCell=sall[i];
          if(thisCell[1]!=0){//the row which will be deleted
            deletedataorga2orgaPeoples.splice(deletedataorga2orgaPeoples.length,0,thisCell[1]);
       }}}
       gridorga2orgaPeoples.model.remove(s);//grid.removeSelectedRows();
 }
function call_funUpdorga2orgaPeoples() {
       var sall=gridorga2orgaPeoples.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
         var passAll=0;
         var thisCell=sall[i];
         var padd = new SOAPClientParameters2();
         var vobject=new Object();
         vobject.id=thisCell[1]+'';

								var manageable=new Object();
			 if(querydataorga2orgaPeoples[i][2]!=''&&querydataorga2orgaPeoples[i][2]!=undefined){
             manageable.id=querydataorga2orgaPeoples[i][2][1] +'';
             vobject.orga=manageable;
			 }else{
			 gridorga2orgaPeoples.getCell(gridorga2orgaPeoples.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
														var manageable=new Object();
			 if(querydataorga2orgaPeoples[i][3]!=''&&querydataorga2orgaPeoples[i][3]!=undefined){
             manageable.id=querydataorga2orgaPeoples[i][3][1] +'';
             vobject.people=manageable;
			 }else{
			 gridorga2orgaPeoples.getCell(gridorga2orgaPeoples.model.fieldArray[3]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
						


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('OrgaPeoplesVO',vobject);
                SOAPClient.invoke(urlorga2orgaPeoples, "createOrgaPeoples", padd, false,  function GetEnu_callBack(ul, soapResponse){
                gridorga2orgaPeoples.model.setDatum(ul,i,1);
				});
	         }else{//modify row
                padd.add('OrgaPeoplesVO',vobject);
                SOAPClient.invoke(urlorga2orgaPeoples, "updateOrgaPeoples", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
        } }}//for
//submit delete
          for(var i=0;i<deletedataorga2orgaPeoples.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',deletedataorga2orgaPeoples[i]);
               SOAPClient.invoke(urlorga2orgaPeoples, "deleteOrgaPeoples", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
	           });
          }
          deletedataorga2orgaPeoples=new Array();
          //dojo.byId("rowCount").innerHTML = 'saved'; 
//submit delete end          
 } 
 
	function selectOrgaFun(rep){
		querydataorga2orgaPeoples[dojoOrgaPeoples.selectOrgaInRow][dojoOrgaPeoples.noOrga]=rep;
		gridorga2orgaPeoples.updateRow(dojoOrgaPeoples.selectOrgaInRow);		
	}
	function selectPeoplesFun(rep){
		querydataorga2orgaPeoples[dojoOrgaPeoples.selectPeoplesInRow][dojoOrgaPeoples.noPeoples]=rep;
		gridorga2orgaPeoples.updateRow(dojoOrgaPeoples.selectPeoplesInRow);		
	}

function pageSizeChangeorga2orgaPeoples(mylabel){
	pagesizeorga2orgaPeoples=mylabel;
	getVOorga2orgaPeoples(queryvoorga2orgaPeoples);
}

function allpageorga2orgaPeoples(){
	pagesizeorga2orgaPeoples=0;
	getVOorga2orgaPeoples(queryvoorga2orgaPeoples);
}

function upPageorga2orgaPeoples(){
	pagenumberorga2orgaPeoples--;
	getVOorga2orgaPeoples(queryvoorga2orgaPeoples);
}
function downPageorga2orgaPeoples(){
	pagenumberorga2orgaPeoples++;
	getVOorga2orgaPeoples(queryvoorga2orgaPeoples);
}

	//buildorga2orgaPeoples();
	  	//buildorgaPeoples2people();
