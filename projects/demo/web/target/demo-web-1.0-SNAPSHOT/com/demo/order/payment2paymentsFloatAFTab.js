	  //---begin---------ÅÐ¶ÏÊÇ·ñÎª¶à¶Ô¶àµÄ¹ØÏµ±í
					//---begin---------ÅÐ¶ÏÊÇ·ñÖ±½Ó¹ØÁªÁËtree½á¹¹±ísno
			//ÒÔÏÂÊÇÆÕÍ¨±í
//set (= payment2payments)
  //name =payment2paymentsFloatAFTab.js  manageable.name=Payment
  					  var NUpayment2payments = false;//needUpdate
  var urlpayment2payments = getUrl()+ "services/PaymentManageService";
 /* var deletedatapayment2payments =  new Array();
  var querydatapayment2payments =  new Array();
  var pagenumberpayment2payments=1;
  var totalCountpayment2payments=0;
  var pagesizepayment2payments=10;
  var orderBypayment2payments='0';
  var queryvopayment2payments=new Object();
  var oddstyle='';
  var modelpayment2payments = new dojox.grid.data.Table(null, querydatapayment2payments);
  var gridpayment2payments;*/
   
  
var getVOpayment2payments=function(queryvo,id){

	var pu = new SOAPClientParameters2();
	pu.add('PaymentVO',queryvo) ;
	pu.add('pageNumber',payment2paymentsFloatArray[id].pagenumberpayment2payments) ;
	pu.add('pageSize',payment2paymentsFloatArray[id].pagesizepayment2payments) ;
	pu.add('orderBy',payment2paymentsFloatArray[id].orderBypayment2payments) ;
	SOAPClient.invoke(urlpayment2payments,"getPayment", pu, false,  function GetEnu_callBack(ul, soapResponse){      
		//ÅÐ¶Ï±¾±íÊÇ·ñÎª×Ó±í,µ±Ò»¸ö±íÊÇ¶à¸ö±íµÄ×Ó±íÊ±£¬´Ë´¦¿ÉÄÜÓÐ´íÎó¡£	
	payment2paymentsFloatArray[id].querydatapayment2payments=dojoPayment.PaymentVOtoArray_fun(ul,false);

	payment2paymentsFloatArray[id].totalCountpayment2payments=ul[ul.length-1]["ns:id"]; 
	}); 
	var totalpage=Math.ceil(new Number(payment2paymentsFloatArray[id].totalCountpayment2payments)/payment2paymentsFloatArray[id].pagesizepayment2payments);
	
	if(totalpage>1){
		if(payment2paymentsFloatArray[id].pagenumberpayment2payments==1){
			dijit.byId("but6payment2payments"+id).setDisabled(true);
			dijit.byId("but7payment2payments"+id).setDisabled(false);
		}else if(payment2paymentsFloatArray[id].pagenumberpayment2payments==totalpage){
			dijit.byId("but6payment2payments"+id).setDisabled(false);
			dijit.byId("but7payment2payments"+id).setDisabled(true);
		}else{
			dijit.byId("but6payment2payments"+id).setDisabled(false);
			dijit.byId("but7payment2payments"+id).setDisabled(false);
		}
	}else{
		dijit.byId("but6payment2payments"+id).setDisabled(true);
		dijit.byId("but7payment2payments"+id).setDisabled(true);
	
	}
	if(payment2paymentsFloatArray[id].pagesizepayment2payments==0){
		totalpage=1;
		dijit.byId("but6payment2payments"+id).setDisabled(true);
		dijit.byId("but7payment2payments"+id).setDisabled(true);
	}
	if(totalpage==1)payment2paymentsFloatArray[id].pagenumberpayment2payments=1;
	
	 document.getElementById("rowCountpayment2payments"+id).innerHTML=i18nStr.di+" "+payment2paymentsFloatArray[id].pagenumberpayment2payments+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+payment2paymentsFloatArray[id].totalCountpayment2payments+" "+i18nStr.rowSize; 	

	payment2paymentsFloatArray[id].querydatapayment2payments.splice(payment2paymentsFloatArray[id].querydatapayment2payments.length-1,1);
	payment2paymentsFloatArray[id].modelpayment2payments.setData(payment2paymentsFloatArray[id].querydatapayment2payments);
}

var buildpayment2payments=function(mainID){
	if( mainID!=undefined && mainID!=''){
		    var openFloat=dijit.byId("openFloat_"+mainID);
		var openGrid=dijit.byId("gridpayment2payments"+mainID);
		if(openGrid==undefined){
		openFloat.setContent("<table style=\"width:80%; position:absolute;top:0px;\"><tr height=\"25px\" width=\"100%\"><td align=\"left\" style=\"background:transparent\"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   payment2payments List&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td><td align=\"right\" ><span ></span>&nbsp;&nbsp;<div ></div><div > </div><div ></div><div ></div><div ></div></td></tr></table><div style=\"{width:999px;height:500px; position:absolute;top:30px;}\" ><div ></div></div>");

	  	payment2paymentsFloatArray[mainID] = new payment2paymentsFloatPara(mainID);
		var openContainerTable=openFloat.containerNode.children[0].children[0].children[0].children[1].childNodes;
		openContainerTable[0].innerHTML="<span id=\"rowCountpayment2payments"+mainID+"\"></span>";
var but1 = new dijit.form.myButton({label:"pageup",id:"but6payment2payments"+mainID,disabled:"true",onclick:"upPagepayment2payments("+mainID+");",iconClass:"upPageIcon"},openContainerTable[1]);
var but2= new dijit.form.myButton({label:"pagedown",id:"but7payment2payments"+mainID,disabled:"true",onclick:"downPagepayment2payments("+mainID+");",iconClass:"downPageIcon"},openContainerTable[2]);
	//var but3 = new dijit.form.Button({label:"add",iconClass:"addIcon"},openContainerTable[3]);
	//var but4 = new dijit.form.Button({label:"delete",iconClass:"delIcon"},openContainerTable[4]);//,onClick:"removepayment2payments("+mainID+")"
	//var but5 = new dijit.form.Button({label:"save",iconClass:"saveIcon",id:"but3payment2payments"+mainID },openContainerTable[5]);//,onclick:but3payment2payments(mainID)
		//dojo.connect(but3, "onClick", function(e){  addRowpayment2payments(""+mainID); });
		//dojo.connect(but4, "onClick", function(e){  removepayment2payments(""+mainID); });
		//dojo.connect(but5, "onClick", function(e){  call_funUpdpayment2payments(""+mainID); });
		var openContainerGrid=openFloat.containerNode.children[1].children[0];

				var queryFloatOrderRowd=new Object();
		queryFloatOrderRowd.id=mainID;
		payment2paymentsFloatArray[mainID].queryvopayment2payments.payment=queryFloatOrderRowd;
		getVOpayment2payments(payment2paymentsFloatArray[mainID].queryvopayment2payments,mainID);
		//if(payment2paymentsFloatArray[mainID].gridpayment2payments==""){
			  payment2paymentsFloatArray[mainID].gridpayment2payments = new dojox.Grid({
					title: "",
					id: "gridpayment2payments"+mainID,
					jsId: "gridpayment2payments"+mainID,
					structure: buildLayoutpayment2payments(mainID),
					rowCount:payment2paymentsFloatArray[mainID].querydatapayment2payments.length,
					model:payment2paymentsFloatArray[mainID].modelpayment2payments
				},openContainerGrid);
				//gridpayment2payments.resize({w: dijit.byId("rightPane").domNode.clientWidth-16,h:dijit.byId("rightPane").domNode.clientHeight-100});
				
		}else{
			payment2paymentsFloatArray[mainID].gridpayment2payments.updateRowCount(payment2paymentsFloatArray[mainID].querydatapayment2payments.length); 
		}}

}

									var buildLayoutpayment2payments = function(floatMainID){		

	var layoutpayment2payments=[{
           //¸ù¾ÝfieldµÄÖµ£¬ÒÀ¾ÝÄ¬ÈÏµÄË³Ðò£¬´ÓjsÖÐµÄtoArray×ª»»·½·¨·µ»ØµÄquerydateÖÐÈ¡Êý¾Ý
   
			 cells: [ [
					   //{ name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
					   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
  		  {name: i18nStr.newAttr1, field: 2,width: 10}
		    		,   {name: i18nStr.newAttr2, field: 3,width: 10}
		  
//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
												//,   {name: i18nStr.payment,field: 4,get:function(inRowIndex){ var str='';var strid;if(payment2paymentsFloatArray[floatMainID].querydatapayment2payments[inRowIndex]!=undefined && payment2paymentsFloatArray[floatMainID].querydatapayment2payments[inRowIndex][4]!=undefined && payment2paymentsFloatArray[floatMainID].querydatapayment2payments[inRowIndex][4][2]!=undefined){str=payment2paymentsFloatArray[floatMainID].querydatapayment2payments[inRowIndex][4][2];strid=payment2paymentsFloatArray[floatMainID].querydatapayment2payments[inRowIndex][4][1];} return str;} ,width: 10 }
						                                        ] ]
                           }]; 

return layoutpayment2payments;
}


