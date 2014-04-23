		
//---begin---------ÅÐ¶ÏÊÇ·ñÎª¶à¶Ô¶àµÄ¹ØÏµ±í
							//---begin---------ÅÐ¶ÏÊÇ·ñÖ±½Ó¹ØÁªÁËtree½á¹¹±ísno
				//ÒÔÏÂÊÇÆÕÍ¨±í
//set (= car2taskForms)
//¶ÔÓÚ¿ÉÐÞ¸ÄµÄlayout£¬($member in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[tasks], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[car]])²¢if(!${member.many})  µÄ×Ö¶ÎÓ¦µ¯³öFloatµÄÑ¡Ôñ´°¿Ú´ý²âÊÔ
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
				
 
  
var getVOcar2taskForms=function(queryvo){

	var pu = new SOAPClientParameters2();
	pu.add('TaskFormVO',queryvo) ;
	pu.add('pageNumber',pagenumbercar2taskForms) ;
	pu.add('pageSize',pagesizecar2taskForms) ;
	pu.add('orderBy',orderBycar2taskForms) ;
	SOAPClient.invoke(urlcar2taskForms,"getTaskForm", pu, false,  function GetEnu_callBack(ul, soapResponse){   
//ÅÐ¶Ï±¾±íÊÇ·ñÎª×Ó±í,µ±Ò»¸ö±íÊÇ¶à¸ö±íµÄ×Ó±íÊ±£¬´Ë´¦¿ÉÄÜÓÐ´íÎó¡£	
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

var buildcar2taskForms=function(FKID){

	if(NUcar2taskForms && FKID!=undefined && FKID!=''){
		var queryFloatcar=new Object();
		queryFloatcar.id=FKID;
		queryvocar2taskForms.car=queryFloatcar;
		getVOcar2taskForms(queryvocar2taskForms);
		if(gridcar2taskForms==undefined){
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
							
	var layoutcar2taskForms=[{
           //¸ù¾ÝfieldµÄÖµ£¬ÒÀ¾ÝÄ¬ÈÏµÄË³Ðò£¬´ÓjsÖÐµÄtoArray×ª»»·½·¨·µ»ØµÄquerydateÖÐÈ¡Êý¾Ý
   
			 cells: [ [
					   //{ name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
					   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
  		  {name: i18nStr.setDate,field:2, width: 8}
		            ,   {name: i18nStr.formState, field: 3,width: 10 }
			            ,   {name: i18nStr.remark, field: 4,width: 10 }
			  
//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
			,   {name: i18nStr.tasks,field: 5,get:function(inRowIndex){ var str='';var strid;if(querydatacar2taskForms[inRowIndex]!=undefined && querydatacar2taskForms[inRowIndex][5]!=undefined && querydatacar2taskForms[inRowIndex][5][1]!=undefined){str=querydatacar2taskForms[inRowIndex][5][2];strid=querydatacar2taskForms[inRowIndex][5][1];} return str;} ,width: 10 }
		 	//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
			//,   {name: i18nStr.car,field: 6,get:function(inRowIndex){ var str='';var strid;if(querydatacar2taskForms[inRowIndex]!=undefined && querydatacar2taskForms[inRowIndex][6]!=undefined && querydatacar2taskForms[inRowIndex][6][1]!=undefined){str=querydatacar2taskForms[inRowIndex][6][2];strid=querydatacar2taskForms[inRowIndex][6][1];} return str;} ,width: 10 }
	       ] ]
                           }]; 

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

