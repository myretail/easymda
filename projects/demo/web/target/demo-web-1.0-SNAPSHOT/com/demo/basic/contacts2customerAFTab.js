	//±¾Ä£°åµÄÔª±íÊÇ4.1µÄÔª±í£¬---begin---------ÅÐ¶Ï"¼ýÎ²±í/ÒýÓÃ±í"£¨"Ôª±í"Îª"¼ýÍ·±í"/"±»ÒýÓÃ±í"£©ÊÇ·ñÎª¶à¶Ô¶àµÄ¹ØÏµ±í
			//---begin---------ÅÐ¶ÏÊÇ·ñÖ±½Ó¹ØÁªÁËtree½á¹¹±ísno,¼´"ÒýÓÃ±í"ÎªÊ÷±í
		//ÅÐ¶Ï"ÒýÓÃ±í"ÊÇ·ñÊÇÖ÷±íbegin
	//ÅÐ¶Ï"ÒýÓÃ±í"ÊÇ·ñÊÇ×Ó±íbegin
//ÅÐ¶Ï"ÒýÓÃ±í"ÊÇ·ñÊÇ×Ó±íend
//ÒÔÏÂÊÇ"ÒýÓÃ±í"ÊÇÆÕÍ¨±í
//set (= contacts2customer)
//¶ÔÓÚ¿ÉÐÞ¸ÄµÄlayout£¬($member in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[customer]])²¢if(!${member.many})  µÄ×Ö¶ÎÓ¦µ¯³öFloatµÄÑ¡Ôñ´°¿Ú´ý²âÊÔ
  //name =contacts2customerAFTab.js  manageable.name=Contact
  				    var NUcontacts2customer = false;//needUpdate
  var urlcontacts2customer = getUrl()+ "services/ContactManageService";
  var deletedatacontacts2customer =  new Array();
  var querydatacontacts2customer =  new Array();
  var pagenumbercontacts2customer=1;
  var totalCountcontacts2customer=0;
  var pagesizecontacts2customer=10;
  var orderBycontacts2customer='0';
  var queryvocontacts2customer=new Object();
  var oddstyle='';
  var modelcontacts2customer = new dojox.grid.data.Table(null, querydatacontacts2customer);
  var gridcontacts2customer;
  var urle2 = getUrl()+ "services/BasicManageService";    
/*		  */

 
  
var getVOcontacts2customer=function(queryvo){

	var pu = new SOAPClientParameters2();
	pu.add('ContactVO',queryvo) ;
	pu.add('pageNumber',pagenumbercontacts2customer) ;
	pu.add('pageSize',pagesizecontacts2customer) ;
	pu.add('orderBy',orderBycontacts2customer) ;
	SOAPClient.invoke(urlcontacts2customer,"getContact", pu, false,  function GetEnu_callBack(ul, soapResponse){   
//ÅÐ¶Ï±¾±íÊÇ·ñÎª×Ó±í,µ±Ò»¸ö±íÊÇ¶à¸ö±íµÄ×Ó±íÊ±£¬´Ë´¦¿ÉÄÜÓÐ´íÎó¡£	
	querydatacontacts2customer=dojoContact.ContactVOtoArray_fun(ul,false);
	totalCountcontacts2customer=ul[ul.length-1]["ns:id"]; 
	}); 
	var totalpage=Math.ceil(new Number(totalCountcontacts2customer)/pagesizecontacts2customer);
	
	if(totalpage>1){
		if(pagenumbercontacts2customer==1){
			dijit.byId("but6contacts2customer").setDisabled(true);
			dijit.byId("but7contacts2customer").setDisabled(false);
		}else if(pagenumbercontacts2customer==totalpage){
			dijit.byId("but6contacts2customer").setDisabled(false);
			dijit.byId("but7contacts2customer").setDisabled(true);
		}else{
			dijit.byId("but6contacts2customer").setDisabled(false);
			dijit.byId("but7contacts2customer").setDisabled(false);
		}
	}else{
		dijit.byId("but6contacts2customer").setDisabled(true);
		dijit.byId("but7contacts2customer").setDisabled(true);
	
	}
	if(pagesizecontacts2customer==0){
		totalpage=1;
		dijit.byId("but6contacts2customer").setDisabled(true);
		dijit.byId("but7contacts2customer").setDisabled(true);
	}
	if(totalpage==1)pagenumbercontacts2customer=1;
	
	 document.getElementById("rowCountcontacts2customer").innerHTML=i18nStr.di+" "+pagenumbercontacts2customer+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountcontacts2customer+" "+i18nStr.rowSize; 	

	querydatacontacts2customer.splice(querydatacontacts2customer.length-1,1);
	modelcontacts2customer.setData(querydatacontacts2customer);
}

var buildcontacts2customer=function(FKID){
	if(FKID!=undefined) mainID = FKID;
	if(NUcontacts2customer && mainID!=undefined && mainID!=''){
		var queryFloatCustomer=new Object();
		queryFloatCustomer.id=mainID;
		queryvocontacts2customer.customer=queryFloatCustomer;
		getVOcontacts2customer(queryvocontacts2customer);
		if(dijit.byId("gridcontacts2customer")==undefined){
			  gridcontacts2customer = new dojox.Grid({
						title: "",
						id: "gridcontacts2customer",
						jsId: "gridcontacts2customer",
						structure: layoutcontacts2customer,
						rowCount:querydatacontacts2customer.length,
						model:modelcontacts2customer
					}, dojo.byId("gridcontacts2customer"));
				gridcontacts2customer.resize({ h: dijit.byId("bottomPane").domNode.clientHeight-90});
				
		}else{
			gridcontacts2customer.updateRowCount(querydatacontacts2customer.length); 
		}
		NUcontacts2customer=false;
	}

}
			
	var layoutcontacts2customer=[{
           //¸ù¾ÝfieldµÄÖµ£¬ÒÀ¾ÝÄ¬ÈÏµÄË³Ðò£¬´ÓjsÖÐµÄtoArray×ª»»·½·¨·µ»ØµÄquerydateÖÐÈ¡Êý¾Ý
   
			 cells: [ [
					   //{ name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
					   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
            {name: i18nStr.codeContact, field: 2,width: 10 }
			  
//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
			//,   {name: i18nStr.customer,field: 3,get:function(inRowIndex){ var str='';var strid;if(querydatacontacts2customer[inRowIndex]!=undefined && querydatacontacts2customer[inRowIndex][3]!=undefined && querydatacontacts2customer[inRowIndex][3][1]!=undefined){str=querydatacontacts2customer[inRowIndex][3][2];strid=querydatacontacts2customer[inRowIndex][3][1];} return str;} ,width: 10 }
	       ] ]
                           }]; 

function pageSizeChangecontacts2customer(mylabel){
	pagesizecontacts2customer=mylabel;
	getVOcontacts2customer(queryvocontacts2customer);
}

function allpagecontacts2customer(){
	pagesizecontacts2customer=0;
	getVOcontacts2customer(queryvocontacts2customer);
}

function upPagecontacts2customer(){
	pagenumbercontacts2customer--;
	getVOcontacts2customer(queryvocontacts2customer);
}

function downPagecontacts2customer(){
	pagenumbercontacts2customer++;
	getVOcontacts2customer(queryvocontacts2customer);
}

