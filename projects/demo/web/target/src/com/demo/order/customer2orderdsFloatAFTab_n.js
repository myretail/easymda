		  //---begin---------ÅÐ¶ÏÊÇ·ñÎª¶à¶Ô¶àµÄ¹ØÏµ±í
																													//---begin---------ÅÐ¶ÏÊÇ·ñÖ±½Ó¹ØÁªÁËtree½á¹¹±ísno
															//ÒÔÏÂÊÇÆÕÍ¨±í
//set (= customer2orderds)
  //name =customer2orderdsFloatAFTab.js  manageable.name=Orderd
  								  var NUcustomer2orderds = false;//needUpdate
  var urlcustomer2orderds = getUrl()+ "services/OrderdManageService";
 /* var deletedatacustomer2orderds =  new Array();
  var querydatacustomer2orderds =  new Array();
  var pagenumbercustomer2orderds=1;
  var totalCountcustomer2orderds=0;
  var pagesizecustomer2orderds=10;
  var orderBycustomer2orderds='0';
  var queryvocustomer2orderds=new Object();
  var oddstyle='';
  var modelcustomer2orderds = new dojox.grid.data.Table(null, querydatacustomer2orderds);
  var gridcustomer2orderds;*/
   
  
var getVOcustomer2orderds=function(queryvo,id){

	var pu = new SOAPClientParameters2();
	pu.add('OrderdVO',queryvo) ;
	pu.add('pageNumber',customer2orderdsFloatArray[id].pagenumbercustomer2orderds) ;
	pu.add('pageSize',customer2orderdsFloatArray[id].pagesizecustomer2orderds) ;
	pu.add('orderBy',customer2orderdsFloatArray[id].orderBycustomer2orderds) ;
	SOAPClient.invoke(urlcustomer2orderds,"getOrderd", pu, false,  function GetEnu_callBack(ul, soapResponse){      
		//ÅÐ¶Ï±¾±íÊÇ·ñÎª×Ó±í,µ±Ò»¸ö±íÊÇ¶à¸ö±íµÄ×Ó±íÊ±£¬´Ë´¦¿ÉÄÜÓÐ´íÎó¡£	
	customer2orderdsFloatArray[id].querydatacustomer2orderds=dojoOrderd.OrderdVOtoArray_fun(ul,false);

	customer2orderdsFloatArray[id].totalCountcustomer2orderds=ul[ul.length-1]["ns:id"]; 
	}); 
	var totalpage=Math.ceil(new Number(customer2orderdsFloatArray[id].totalCountcustomer2orderds)/customer2orderdsFloatArray[id].pagesizecustomer2orderds);
	
	if(totalpage>1){
		if(customer2orderdsFloatArray[id].pagenumbercustomer2orderds==1){
			dijit.byId("but6customer2orderds"+id).setDisabled(true);
			dijit.byId("but7customer2orderds"+id).setDisabled(false);
		}else if(customer2orderdsFloatArray[id].pagenumbercustomer2orderds==totalpage){
			dijit.byId("but6customer2orderds"+id).setDisabled(false);
			dijit.byId("but7customer2orderds"+id).setDisabled(true);
		}else{
			dijit.byId("but6customer2orderds"+id).setDisabled(false);
			dijit.byId("but7customer2orderds"+id).setDisabled(false);
		}
	}else{
		dijit.byId("but6customer2orderds"+id).setDisabled(true);
		dijit.byId("but7customer2orderds"+id).setDisabled(true);
	
	}
	if(customer2orderdsFloatArray[id].pagesizecustomer2orderds==0){
		totalpage=1;
		dijit.byId("but6customer2orderds"+id).setDisabled(true);
		dijit.byId("but7customer2orderds"+id).setDisabled(true);
	}
	if(totalpage==1)customer2orderdsFloatArray[id].pagenumbercustomer2orderds=1;
	
	 document.getElementById("rowCountcustomer2orderds"+id).innerHTML=i18nStr.di+" "+customer2orderdsFloatArray[id].pagenumbercustomer2orderds+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+customer2orderdsFloatArray[id].totalCountcustomer2orderds+" "+i18nStr.rowSize; 	

	customer2orderdsFloatArray[id].querydatacustomer2orderds.splice(customer2orderdsFloatArray[id].querydatacustomer2orderds.length-1,1);
	customer2orderdsFloatArray[id].modelcustomer2orderds.setData(customer2orderdsFloatArray[id].querydatacustomer2orderds);
}

var buildcustomer2orderds=function(mainID){
	if( mainID!=undefined && mainID!=''){
		var openFloat=dijit.byId("gridcustomer2orderds"+mainID);
		if(openFloat==undefined){
		
		customer2orderdsFloatArray[mainID] = new customer2orderdsFloatPara(mainID);
				var newTab = dijit.byId("customer2orderds"+mainID);
			newTab.setContent("<table   style=\"width:80%; position:absolute;top:0px;\"><tr height=\"25px\" width=\"100%\">	<td align=\"left\" style=\"background:transparent\"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   customer2orderds&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td><td align=\"right\" ><span ></span>&nbsp;&nbsp;	<div > </div><div > </div><div > </div>	<div > </div><div > </div>	</td></tr></table><div style=\"{width:500px;height:500px; position:absolute;top:30px;}\" ><div > </div></div>");
			var openContainerTable=newTab.containerNode.children[0].children[0].children[0].children[1].childNodes;

		openContainerTable[0].innerHTML="<span id=\"rowCountcustomer2orderds"+mainID+"\"></span>";
var but1 = new dijit.form.myButton({label:"pageup",id:"but6customer2orderds"+mainID,disabled:"true",onclick:"upPagecustomer2orderds("+mainID+");",iconClass:"upPageIcon"},openContainerTable[1]);
var but2= new dijit.form.myButton({label:"pagedown",id:"but7customer2orderds"+mainID,disabled:"true",onclick:"downPagecustomer2orderds("+mainID+");",iconClass:"downPageIcon"},openContainerTable[2]);
	//var but3 = new dijit.form.Button({label:"add",iconClass:"addIcon"},openContainerTable[3]);
	//var but4 = new dijit.form.Button({label:"delete",iconClass:"delIcon"},openContainerTable[4]);//,onClick:"removecustomer2orderds("+mainID+")"
	//var but5 = new dijit.form.Button({label:"save",iconClass:"saveIcon",id:"but3customer2orderds"+mainID },openContainerTable[5]);//,onclick:but3customer2orderds(mainID)
		//dojo.connect(but3, "onClick", function(e){  addRowcustomer2orderds(""+mainID); });
		//dojo.connect(but4, "onClick", function(e){  removecustomer2orderds(""+mainID); });
		//dojo.connect(but5, "onClick", function(e){  call_funUpdcustomer2orderds(""+mainID); });
				var openContainerGrid=newTab.domNode.children[1].children[0];


				var queryFloatCustomer=new Object();
		queryFloatCustomer.id=mainID;
		customer2orderdsFloatArray[mainID].queryvocustomer2orderds.customer=queryFloatCustomer;
		getVOcustomer2orderds(customer2orderdsFloatArray[mainID].queryvocustomer2orderds,mainID);
		//if(customer2orderdsFloatArray[mainID].gridcustomer2orderds==""){
			  customer2orderdsFloatArray[mainID].gridcustomer2orderds = new dojox.Grid({
					title: "",
					id: "gridcustomer2orderds"+mainID,
					jsId: "gridcustomer2orderds"+mainID,
					structure: buildLayoutcustomer2orderds(mainID),
					rowCount:customer2orderdsFloatArray[mainID].querydatacustomer2orderds.length,
					model:customer2orderdsFloatArray[mainID].modelcustomer2orderds
				},openContainerGrid);
				//gridcustomer2orderds.resize({w: dijit.byId("rightPane").domNode.clientWidth-16,h:dijit.byId("rightPane").domNode.clientHeight-100});
				customer2orderdsFloatArray[mainID].gridcustomer2orderds.resize({w:999,h:500});

		}else{
			getVOcustomer2orderds(customer2orderdsFloatArray[mainID].queryvocustomer2orderds,mainID);
			customer2orderdsFloatArray[mainID].gridcustomer2orderds.modelAllChange();

		}}

}

																																																															var buildLayoutcustomer2orderds = function(floatMainID){		

	var layoutcustomer2orderds=[{
           //¸ù¾ÝfieldµÄÖµ£¬ÒÀ¾ÝÄ¬ÈÏµÄË³Ðò£¬´ÓjsÖÐµÄtoArray×ª»»·½·¨·µ»ØµÄquerydateÖÐÈ¡Êý¾Ý
   
			 cells: [ [
					   //{ name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
					   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
  		  {name: i18nStr.customerOrderNo, field: 2,width: 10}
		    		,   {name: i18nStr.contractNo, field: 3,width: 10}
		    		,   {name: i18nStr.conveyanceEnum, field: 4,width: 10}
		    		,   {name: i18nStr.carryTypeEnum, field: 5,width: 10}
		    		,   {name: i18nStr.shipperRemark, field: 6,width: 10}
		    		,   {name: i18nStr.carrierRemark, field: 7,width: 10}
		    		,   {name: i18nStr.levelEnum, field: 8,width: 10}
		    		,   {name: i18nStr.customerTypeEnum, field: 9,width: 10}
		    		,   {name: i18nStr.referTime,field:10, width: 8}
		    		,   {name: i18nStr.linkMan, field: 11,width: 10}
		    		,   {name: i18nStr.tel, field: 12,width: 10}
		    		,   {name: i18nStr.bookTime,field:13, width: 8}
		    		,   {name: i18nStr.completeTime,field:14, width: 8}
		    		,   {name: i18nStr.remark, field: 15,width: 10}
		  
//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
		//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
												//,   {name: i18nStr.customer,field: 17,get:function(inRowIndex){ var str='';var strid;if(customer2orderdsFloatArray[floatMainID].querydatacustomer2orderds[inRowIndex]!=undefined && customer2orderdsFloatArray[floatMainID].querydatacustomer2orderds[inRowIndex][17]!=undefined && customer2orderdsFloatArray[floatMainID].querydatacustomer2orderds[inRowIndex][17][2]!=undefined){str=customer2orderdsFloatArray[floatMainID].querydatacustomer2orderds[inRowIndex][17][2];strid=customer2orderdsFloatArray[floatMainID].querydatacustomer2orderds[inRowIndex][17][1];} return str;} ,width: 10 }
						                                        ] ]
                           }]; 

return layoutcustomer2orderds;
}


