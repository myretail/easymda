	//±¾Ä£°åµÄÔª±íÊÇ4.1µÄÔª±í£¬---begin---------ÅÐ¶Ï"¼ýÎ²±í/ÒýÓÃ±í"£¨"Ôª±í"Îª"¼ýÍ·±í"/"±»ÒýÓÃ±í"£©ÊÇ·ñÎª¶à¶Ô¶àµÄ¹ØÏµ±í
											//---begin---------ÅÐ¶ÏÊÇ·ñÖ±½Ó¹ØÁªÁËtree½á¹¹±ísno,¼´"ÒýÓÃ±í"ÎªÊ÷±í
						//ÅÐ¶Ï"ÒýÓÃ±í"ÊÇ·ñÊÇÖ÷±íbegin
		//ÅÐ¶Ï"ÒýÓÃ±í"ÊÇ·ñÊÇ×Ó±íbegin
//ÅÐ¶Ï"ÒýÓÃ±í"ÊÇ·ñÊÇ×Ó±íend
//ÒÔÏÂÊÇ"ÒýÓÃ±í"ÊÇÆÕÍ¨±í
//set (= prodCust2prods)
//¶ÔÓÚ¿ÉÐÞ¸ÄµÄlayout£¬($member in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[prodCust], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[principal]])²¢if(!${member.many})  µÄ×Ö¶ÎÓ¦µ¯³öFloatµÄÑ¡Ôñ´°¿Ú´ý²âÊÔ
  //name =prodCust2prodsAFTab.js  manageable.name=Prod
  				  		  		    var NUprodCust2prods = false;//needUpdate
  var urlprodCust2prods = getUrl()+ "services/ProdManageService";
  var deletedataprodCust2prods =  new Array();
  var querydataprodCust2prods =  new Array();
  var pagenumberprodCust2prods=1;
  var totalCountprodCust2prods=0;
  var pagesizeprodCust2prods=10;
  var orderByprodCust2prods='0';
  var queryvoprodCust2prods=new Object();
  var oddstyle='';
  var modelprodCust2prods = new dojox.grid.data.Table(null, querydataprodCust2prods);
  var gridprodCust2prods;
  var urle2 = getUrl()+ "services/BasicManageService";    
/*						  */

 
  
var getVOprodCust2prods=function(queryvo){

	var pu = new SOAPClientParameters2();
	pu.add('ProdVO',queryvo) ;
	pu.add('pageNumber',pagenumberprodCust2prods) ;
	pu.add('pageSize',pagesizeprodCust2prods) ;
	pu.add('orderBy',orderByprodCust2prods) ;
	SOAPClient.invoke(urlprodCust2prods,"getProd", pu, false,  function GetEnu_callBack(ul, soapResponse){   
//ÅÐ¶Ï±¾±íÊÇ·ñÎª×Ó±í,µ±Ò»¸ö±íÊÇ¶à¸ö±íµÄ×Ó±íÊ±£¬´Ë´¦¿ÉÄÜÓÐ´íÎó¡£	
	querydataprodCust2prods=dojoProd.ProdVOtoArray_fun(ul,false);
	totalCountprodCust2prods=ul[ul.length-1]["ns:id"]; 
	}); 
	var totalpage=Math.ceil(new Number(totalCountprodCust2prods)/pagesizeprodCust2prods);
	
	if(totalpage>1){
		if(pagenumberprodCust2prods==1){
			dijit.byId("but6prodCust2prods").setDisabled(true);
			dijit.byId("but7prodCust2prods").setDisabled(false);
		}else if(pagenumberprodCust2prods==totalpage){
			dijit.byId("but6prodCust2prods").setDisabled(false);
			dijit.byId("but7prodCust2prods").setDisabled(true);
		}else{
			dijit.byId("but6prodCust2prods").setDisabled(false);
			dijit.byId("but7prodCust2prods").setDisabled(false);
		}
	}else{
		dijit.byId("but6prodCust2prods").setDisabled(true);
		dijit.byId("but7prodCust2prods").setDisabled(true);
	
	}
	if(pagesizeprodCust2prods==0){
		totalpage=1;
		dijit.byId("but6prodCust2prods").setDisabled(true);
		dijit.byId("but7prodCust2prods").setDisabled(true);
	}
	if(totalpage==1)pagenumberprodCust2prods=1;
	
	 document.getElementById("rowCountprodCust2prods").innerHTML=i18nStr.di+" "+pagenumberprodCust2prods+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountprodCust2prods+" "+i18nStr.rowSize; 	

	querydataprodCust2prods.splice(querydataprodCust2prods.length-1,1);
	modelprodCust2prods.setData(querydataprodCust2prods);
}

var buildprodCust2prods=function(FKID){
	if(FKID!=undefined) mainID = FKID;
	if(NUprodCust2prods && mainID!=undefined && mainID!=''){
		var queryFloatCustomer=new Object();
		queryFloatCustomer.id=mainID;
		queryvoprodCust2prods.prodCust=queryFloatCustomer;
		getVOprodCust2prods(queryvoprodCust2prods);
		if(dijit.byId("gridprodCust2prods")==undefined){
			  gridprodCust2prods = new dojox.Grid({
						title: "",
						id: "gridprodCust2prods",
						jsId: "gridprodCust2prods",
						structure: layoutprodCust2prods,
						rowCount:querydataprodCust2prods.length,
						model:modelprodCust2prods
					}, dojo.byId("gridprodCust2prods"));
				gridprodCust2prods.resize({ h: dijit.byId("bottomPane").domNode.clientHeight-90});
				
		}else{
			gridprodCust2prods.updateRowCount(querydataprodCust2prods.length); 
		}
		NUprodCust2prods=false;
	}

}
											
	var layoutprodCust2prods=[{
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
			//,   {name: i18nStr.prodCust,field: 7,get:function(inRowIndex){ var str='';var strid;if(querydataprodCust2prods[inRowIndex]!=undefined && querydataprodCust2prods[inRowIndex][7]!=undefined && querydataprodCust2prods[inRowIndex][7][1]!=undefined){str=querydataprodCust2prods[inRowIndex][7][2];strid=querydataprodCust2prods[inRowIndex][7][1];} return str;} ,width: 10 }
	//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
			,   {name: i18nStr.principal,field: 8,get:function(inRowIndex){ var str='';var strid;if(querydataprodCust2prods[inRowIndex]!=undefined && querydataprodCust2prods[inRowIndex][8]!=undefined && querydataprodCust2prods[inRowIndex][8][1]!=undefined){str=querydataprodCust2prods[inRowIndex][8][2];strid=querydataprodCust2prods[inRowIndex][8][1];} return str;} ,width: 10 }
		 	       ] ]
                           }]; 

function pageSizeChangeprodCust2prods(mylabel){
	pagesizeprodCust2prods=mylabel;
	getVOprodCust2prods(queryvoprodCust2prods);
}

function allpageprodCust2prods(){
	pagesizeprodCust2prods=0;
	getVOprodCust2prods(queryvoprodCust2prods);
}

function upPageprodCust2prods(){
	pagenumberprodCust2prods--;
	getVOprodCust2prods(queryvoprodCust2prods);
}

function downPageprodCust2prods(){
	pagenumberprodCust2prods++;
	getVOprodCust2prods(queryvoprodCust2prods);
}

	