		//±¾Ä£°åµÄÔª±íÊÇ4.1µÄÔª±í£¬---begin---------ÅÐ¶Ï"¼ýÎ²±í/ÒýÓÃ±í"£¨"Ôª±í"Îª"¼ýÍ·±í"/"±»ÒýÓÃ±í"£©ÊÇ·ñÎª¶à¶Ô¶àµÄ¹ØÏµ±í
											//---begin---------ÅÐ¶ÏÊÇ·ñÖ±½Ó¹ØÁªÁËtree½á¹¹±ísno,¼´"ÒýÓÃ±í"ÎªÊ÷±í
						//ÅÐ¶Ï"ÒýÓÃ±í"ÊÇ·ñÊÇÖ÷±íbegin
		//ÅÐ¶Ï"ÒýÓÃ±í"ÊÇ·ñÊÇ×Ó±íbegin
//ÅÐ¶Ï"ÒýÓÃ±í"ÊÇ·ñÊÇ×Ó±íend
//ÒÔÏÂÊÇ"ÒýÓÃ±í"ÊÇÆÕÍ¨±í
//set (= principal2prods)
//¶ÔÓÚ¿ÉÐÞ¸ÄµÄlayout£¬($member in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[prodCust], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[principal]])²¢if(!${member.many})  µÄ×Ö¶ÎÓ¦µ¯³öFloatµÄÑ¡Ôñ´°¿Ú´ý²âÊÔ
  //name =principal2prodsRightAFTab.js  manageable.name=Prod
  		  				  		    var NUprincipal2prods = false;//needUpdate
  var urlprincipal2prods = getUrl()+ "services/ProdManageService";
  var deletedataprincipal2prods =  new Array();
  var querydataprincipal2prods =  new Array();
  var pagenumberprincipal2prods=1;
  var totalCountprincipal2prods=0;
  var pagesizeprincipal2prods=10;
  var orderByprincipal2prods='0';
  var queryvoprincipal2prods=new Object();
  var oddstyle='';
  var modelprincipal2prods = new dojox.grid.data.Table(null, querydataprincipal2prods);
  var gridprincipal2prods;
  var urle2 = getUrl()+ "services/BasicManageService";    
/*						  */

 
  
var getVOprincipal2prods=function(queryvo){

	var pu = new SOAPClientParameters2();
	pu.add('ProdVO',queryvo) ;
	pu.add('pageNumber',pagenumberprincipal2prods) ;
	pu.add('pageSize',pagesizeprincipal2prods) ;
	pu.add('orderBy',orderByprincipal2prods) ;
	SOAPClient.invoke(urlprincipal2prods,"getProd", pu, false,  function GetEnu_callBack(ul, soapResponse){   
//ÅÐ¶Ï±¾±íÊÇ·ñÎª×Ó±í,µ±Ò»¸ö±íÊÇ¶à¸ö±íµÄ×Ó±íÊ±£¬´Ë´¦¿ÉÄÜÓÐ´íÎó¡£	
	querydataprincipal2prods=dojoProd.ProdVOtoArray_fun(ul,false);
	totalCountprincipal2prods=ul[ul.length-1]["ns:id"]; 
	}); 
	var totalpage=Math.ceil(new Number(totalCountprincipal2prods)/pagesizeprincipal2prods);
	
	if(totalpage>1){
		if(pagenumberprincipal2prods==1){
			dijit.byId("but6principal2prods").setDisabled(true);
			dijit.byId("but7principal2prods").setDisabled(false);
		}else if(pagenumberprincipal2prods==totalpage){
			dijit.byId("but6principal2prods").setDisabled(false);
			dijit.byId("but7principal2prods").setDisabled(true);
		}else{
			dijit.byId("but6principal2prods").setDisabled(false);
			dijit.byId("but7principal2prods").setDisabled(false);
		}
	}else{
		dijit.byId("but6principal2prods").setDisabled(true);
		dijit.byId("but7principal2prods").setDisabled(true);
	
	}
	if(pagesizeprincipal2prods==0){
		totalpage=1;
		dijit.byId("but6principal2prods").setDisabled(true);
		dijit.byId("but7principal2prods").setDisabled(true);
	}
	if(totalpage==1)pagenumberprincipal2prods=1;
	
	 document.getElementById("rowCountprincipal2prods").innerHTML=i18nStr.di+" "+pagenumberprincipal2prods+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountprincipal2prods+" "+i18nStr.rowSize; 	

	querydataprincipal2prods.splice(querydataprincipal2prods.length-1,1);
	modelprincipal2prods.setData(querydataprincipal2prods);
}

var buildprincipal2prods=function(FKID){
	if(FKID!=undefined) mainID = FKID;
	if(NUprincipal2prods && mainID!=undefined && mainID!=''){
		var queryFloatPeoples=new Object();
		queryFloatPeoples.id=mainID;
		queryvoprincipal2prods.principal=queryFloatPeoples;
		getVOprincipal2prods(queryvoprincipal2prods);
		if(dijit.byId("gridprincipal2prods")==undefined){
			  gridprincipal2prods = new dojox.Grid({
						title: "",
						id: "gridprincipal2prods",
						jsId: "gridprincipal2prods",
						structure: layoutprincipal2prods,
						rowCount:querydataprincipal2prods.length,
						model:modelprincipal2prods
					}, dojo.byId("gridprincipal2prods"));
				gridprincipal2prods.resize({w: dijit.byId("rightPane").domNode.clientWidth-16,h:dijit.byId("rightPane").domNode.clientHeight-100});				
		}else{
			gridprincipal2prods.updateRowCount(querydataprincipal2prods.length); 
		}
		NUprincipal2prods=false;
	}

}
											
	var layoutprincipal2prods=[{
           //¸ù¾ÝfieldµÄÖµ£¬ÒÀ¾ÝÄ¬ÈÏµÄË³Ðò£¬´ÓjsÖÐµÄtoArray×ª»»·½·¨·µ»ØµÄquerydateÖÐÈ¡Êý¾Ý
   
			 cells: [ [
					   //{ name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
					   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
            {name: i18nStr.prodName, field: 2,width: 10 }
			            ,   {name: i18nStr.code, field: 3,width: 10 }
			             ,  {name: i18nStr.price,field:4, width: 8}
		    		,   {name: i18nStr.datef,field:5, width: 8}
		            ,   {name: i18nStr.prodType, field: 6,width: 10 }
			  
//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
			,   {name: i18nStr.prodCust,field: 7,get:function(inRowIndex){ var str='';var strid;if(querydataprincipal2prods[inRowIndex]!=undefined && querydataprincipal2prods[inRowIndex][7]!=undefined && querydataprincipal2prods[inRowIndex][7][1]!=undefined){str=querydataprincipal2prods[inRowIndex][7][2];strid=querydataprincipal2prods[inRowIndex][7][1];} return str;} ,width: 10 }
		 	//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
			//,   {name: i18nStr.principal,field: 8,get:function(inRowIndex){ var str='';var strid;if(querydataprincipal2prods[inRowIndex]!=undefined && querydataprincipal2prods[inRowIndex][8]!=undefined && querydataprincipal2prods[inRowIndex][8][1]!=undefined){str=querydataprincipal2prods[inRowIndex][8][2];strid=querydataprincipal2prods[inRowIndex][8][1];} return str;} ,width: 10 }
	       ] ]
                           }]; 

function pageSizeChangeprincipal2prods(mylabel){
	pagesizeprincipal2prods=mylabel;
	getVOprincipal2prods(queryvoprincipal2prods);
}

function allpageprincipal2prods(){
	pagesizeprincipal2prods=0;
	getVOprincipal2prods(queryvoprincipal2prods);
}

function upPageprincipal2prods(){
	pagenumberprincipal2prods--;
	getVOprincipal2prods(queryvoprincipal2prods);
}

function downPageprincipal2prods(){
	pagenumberprincipal2prods++;
	getVOprincipal2prods(queryvoprincipal2prods);
}

