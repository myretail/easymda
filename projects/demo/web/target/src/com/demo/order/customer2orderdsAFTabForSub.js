		
//---begin---------ÅÐ¶ÏÊÇ·ñÎª¶à¶Ô¶àµÄ¹ØÏµ±í
																													//---begin---------ÅÐ¶ÏÊÇ·ñÖ±½Ó¹ØÁªÁËtree½á¹¹±ísno
															//ÒÔÏÂÊÇÆÕÍ¨±í
//set (= customer2orderds)
//¶ÔÓÚ¿ÉÐÞ¸ÄµÄlayout£¬($member in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[orderRow], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[customer]])²¢if(!${member.many})  µÄ×Ö¶ÎÓ¦µ¯³öFloatµÄÑ¡Ôñ´°¿Ú´ý²âÊÔ
  //name =customer2orderdsAFTab.js  manageable.name=Orderd
  		  				    var NUcustomer2orderds = false;//needUpdate
  var urlcustomer2orderds = getUrl()+ "services/OrderdManageService";
  var deletedatacustomer2orderds =  new Array();
  var querydatacustomer2orderds =  new Array();
  var pagenumbercustomer2orderds=1;
  var totalCountcustomer2orderds=0;
  var pagesizecustomer2orderds=10;
  var orderBycustomer2orderds='0';
  var queryvocustomer2orderds=new Object();
  var oddstyle='';
  var modelcustomer2orderds = new dojox.grid.data.Table(null, querydatacustomer2orderds);
  var gridcustomer2orderds;
  var urle2 = getUrl()+ "services/BasicManageService";    
						var pOrderdconveyanceEnum = new SOAPClientParameters();
			pOrderdconveyanceEnum.add('eType','OrderdconveyanceEnum');
			var itemOrderdconveyanceEnum = new Array();
			var itemOrderdconveyanceEnumOption = new Array();
				SOAPClient.invoke(urle2, "getEnumerationByType", pOrderdconveyanceEnum, false,  function GetEnu_callBack(ul, soapResponse){   
				for(var i = 0; i < ul.length; i++){		
				  var ulo=ul[i];
				  itemOrderdconveyanceEnum.push({name: ulo["ns:fieldName"], value:ulo["ns:fieldName"]});
				  itemOrderdconveyanceEnumOption.push(ulo["ns:fieldName"]);
				}                
			});       
			if(itemOrderdconveyanceEnum.length==0)itemOrderdconveyanceEnum.push({name:'' , value:''});
			var OrderdconveyanceEnumStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemOrderdconveyanceEnum}}); 
					var pOrderdcarryTypeEnum = new SOAPClientParameters();
			pOrderdcarryTypeEnum.add('eType','OrderdcarryTypeEnum');
			var itemOrderdcarryTypeEnum = new Array();
			var itemOrderdcarryTypeEnumOption = new Array();
				SOAPClient.invoke(urle2, "getEnumerationByType", pOrderdcarryTypeEnum, false,  function GetEnu_callBack(ul, soapResponse){   
				for(var i = 0; i < ul.length; i++){		
				  var ulo=ul[i];
				  itemOrderdcarryTypeEnum.push({name: ulo["ns:fieldName"], value:ulo["ns:fieldName"]});
				  itemOrderdcarryTypeEnumOption.push(ulo["ns:fieldName"]);
				}                
			});       
			if(itemOrderdcarryTypeEnum.length==0)itemOrderdcarryTypeEnum.push({name:'' , value:''});
			var OrderdcarryTypeEnumStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemOrderdcarryTypeEnum}}); 
							var pOrderdlevelEnum = new SOAPClientParameters();
			pOrderdlevelEnum.add('eType','OrderdlevelEnum');
			var itemOrderdlevelEnum = new Array();
			var itemOrderdlevelEnumOption = new Array();
				SOAPClient.invoke(urle2, "getEnumerationByType", pOrderdlevelEnum, false,  function GetEnu_callBack(ul, soapResponse){   
				for(var i = 0; i < ul.length; i++){		
				  var ulo=ul[i];
				  itemOrderdlevelEnum.push({name: ulo["ns:fieldName"], value:ulo["ns:fieldName"]});
				  itemOrderdlevelEnumOption.push(ulo["ns:fieldName"]);
				}                
			});       
			if(itemOrderdlevelEnum.length==0)itemOrderdlevelEnum.push({name:'' , value:''});
			var OrderdlevelEnumStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemOrderdlevelEnum}}); 
					var pOrderdcustomerTypeEnum = new SOAPClientParameters();
			pOrderdcustomerTypeEnum.add('eType','OrderdcustomerTypeEnum');
			var itemOrderdcustomerTypeEnum = new Array();
			var itemOrderdcustomerTypeEnumOption = new Array();
				SOAPClient.invoke(urle2, "getEnumerationByType", pOrderdcustomerTypeEnum, false,  function GetEnu_callBack(ul, soapResponse){   
				for(var i = 0; i < ul.length; i++){		
				  var ulo=ul[i];
				  itemOrderdcustomerTypeEnum.push({name: ulo["ns:fieldName"], value:ulo["ns:fieldName"]});
				  itemOrderdcustomerTypeEnumOption.push(ulo["ns:fieldName"]);
				}                
			});       
			if(itemOrderdcustomerTypeEnum.length==0)itemOrderdcustomerTypeEnum.push({name:'' , value:''});
			var OrderdcustomerTypeEnumStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemOrderdcustomerTypeEnum}}); 
								
 
  
var getVOcustomer2orderds=function(queryvo){

	var pu = new SOAPClientParameters2();
	pu.add('OrderdVO',queryvo) ;
	pu.add('pageNumber',pagenumbercustomer2orderds) ;
	pu.add('pageSize',pagesizecustomer2orderds) ;
	pu.add('orderBy',orderBycustomer2orderds) ;
	SOAPClient.invoke(urlcustomer2orderds,"getOrderd", pu, false,  function GetEnu_callBack(ul, soapResponse){   
//ÅÐ¶Ï±¾±íÊÇ·ñÎª×Ó±í,µ±Ò»¸ö±íÊÇ¶à¸ö±íµÄ×Ó±íÊ±£¬´Ë´¦¿ÉÄÜÓÐ´íÎó¡£	
	querydatacustomer2orderds=dojoOrderd.OrderdVOtoArray_fun(ul,false);
	totalCountcustomer2orderds=ul[ul.length-1]["ns:id"]; 
	}); 
	var totalpage=Math.ceil(new Number(totalCountcustomer2orderds)/pagesizecustomer2orderds);
	
	if(totalpage>1){
		if(pagenumbercustomer2orderds==1){
			dijit.byId("but6customer2orderds").setDisabled(true);
			dijit.byId("but7customer2orderds").setDisabled(false);
		}else if(pagenumbercustomer2orderds==totalpage){
			dijit.byId("but6customer2orderds").setDisabled(false);
			dijit.byId("but7customer2orderds").setDisabled(true);
		}else{
			dijit.byId("but6customer2orderds").setDisabled(false);
			dijit.byId("but7customer2orderds").setDisabled(false);
		}
	}else{
		dijit.byId("but6customer2orderds").setDisabled(true);
		dijit.byId("but7customer2orderds").setDisabled(true);
	
	}
	if(pagesizecustomer2orderds==0){
		totalpage=1;
		dijit.byId("but6customer2orderds").setDisabled(true);
		dijit.byId("but7customer2orderds").setDisabled(true);
	}
	if(totalpage==1)pagenumbercustomer2orderds=1;
	
	 document.getElementById("rowCountcustomer2orderds").innerHTML=i18nStr.di+" "+pagenumbercustomer2orderds+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountcustomer2orderds+" "+i18nStr.rowSize; 	

	querydatacustomer2orderds.splice(querydatacustomer2orderds.length-1,1);
	modelcustomer2orderds.setData(querydatacustomer2orderds);
}

var buildcustomer2orderds=function(FKID){

	if(NUcustomer2orderds && FKID!=undefined && FKID!=''){
		var queryFloatCustomer=new Object();
		queryFloatCustomer.id=FKID;
		queryvocustomer2orderds.customer=queryFloatCustomer;
		getVOcustomer2orderds(queryvocustomer2orderds);
		if(gridcustomer2orderds==undefined){
			  gridcustomer2orderds = new dojox.Grid({
						title: "",
						id: "gridcustomer2orderds",
						jsId: "gridcustomer2orderds",
						structure: layoutcustomer2orderds,
						rowCount:querydatacustomer2orderds.length,
						model:modelcustomer2orderds
					}, dojo.byId("gridcustomer2orderds"));
				gridcustomer2orderds.resize({ h: dijit.byId("bottomPane").domNode.clientHeight-90});
				
		}else{
			gridcustomer2orderds.updateRowCount(querydatacustomer2orderds.length); 
		}
		NUcustomer2orderds=false;
	}

}
																													
	var layoutcustomer2orderds=[{
           //¸ù¾ÝfieldµÄÖµ£¬ÒÀ¾ÝÄ¬ÈÏµÄË³Ðò£¬´ÓjsÖÐµÄtoArray×ª»»·½·¨·µ»ØµÄquerydateÖÐÈ¡Êý¾Ý
   
			 cells: [ [
					   //{ name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
					   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
            {name: i18nStr.customerOrderNo, field: 2,width: 10 }
			            ,   {name: i18nStr.contractNo, field: 3,width: 10 }
			            ,   {name: i18nStr.conveyanceEnum, field: 4,width: 10 }
			            ,   {name: i18nStr.carryTypeEnum, field: 5,width: 10 }
			            ,   {name: i18nStr.shipperRemark, field: 6,width: 10 }
			            ,   {name: i18nStr.carrierRemark, field: 7,width: 10 }
			            ,   {name: i18nStr.levelEnum, field: 8,width: 10 }
			            ,   {name: i18nStr.customerTypeEnum, field: 9,width: 10 }
			    		,   {name: i18nStr.referTime,field:10, width: 8}
		            ,   {name: i18nStr.linkMan, field: 11,width: 10 }
			            ,   {name: i18nStr.tel, field: 12,width: 10 }
			    		,   {name: i18nStr.bookTime,field:13, width: 8}
		    		,   {name: i18nStr.completeTime,field:14, width: 8}
		            ,   {name: i18nStr.remark, field: 15,width: 10 }
			  
//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
			,   {name: i18nStr.orderRow,field: 16,get:function(inRowIndex){ var str='';var strid;if(querydatacustomer2orderds[inRowIndex]!=undefined && querydatacustomer2orderds[inRowIndex][16]!=undefined && querydatacustomer2orderds[inRowIndex][16][1]!=undefined){str=querydatacustomer2orderds[inRowIndex][16][2];strid=querydatacustomer2orderds[inRowIndex][16][1];} return str;} ,width: 10 }
		 	//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
			//,   {name: i18nStr.customer,field: 17,get:function(inRowIndex){ var str='';var strid;if(querydatacustomer2orderds[inRowIndex]!=undefined && querydatacustomer2orderds[inRowIndex][17]!=undefined && querydatacustomer2orderds[inRowIndex][17][1]!=undefined){str=querydatacustomer2orderds[inRowIndex][17][2];strid=querydatacustomer2orderds[inRowIndex][17][1];} return str;} ,width: 10 }
	       ] ]
                           }]; 

function pageSizeChangecustomer2orderds(mylabel){
	pagesizecustomer2orderds=mylabel;
	getVOcustomer2orderds(queryvocustomer2orderds);
}

function allpagecustomer2orderds(){
	pagesizecustomer2orderds=0;
	getVOcustomer2orderds(queryvocustomer2orderds);
}

function upPagecustomer2orderds(){
	pagenumbercustomer2orderds--;
	getVOcustomer2orderds(queryvocustomer2orderds);
}

function downPagecustomer2orderds(){
	pagenumbercustomer2orderds++;
	getVOcustomer2orderds(queryvocustomer2orderds);
}

