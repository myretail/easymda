	
//---begin---------???????????¨¤???¨¤??????¡À¨ª
					//---begin---------?????????¡À????????tree?¨¢??¡À¨ªsno
			//?????????¡§¡À¨ª
//set (= payment2payments)
//????????????layout??($member in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[payment]])??if(!${member.many})  ??¡Á?????????Float???????¡ã????????
  //name =payment2paymentsAFTab.js  manageable.name=Payment
  				    var NUpayment2payments = false;//needUpdate
  var urlpayment2payments = getUrl()+ "services/PaymentManageService";
  var deletedatapayment2payments =  new Array();
  var querydatapayment2payments =  new Array();
  var pagenumberpayment2payments=1;
  var totalCountpayment2payments=0;
  var pagesizepayment2payments=10;
  var orderBypayment2payments='0';
  var queryvopayment2payments=new Object();
  var oddstyle='';
  var modelpayment2payments = new dojox.grid.data.Table(null, querydatapayment2payments);
  var gridpayment2payments;
  var urle2 = getUrl()+ "services/BasicManageService";    
			
 
  
var getVOpayment2payments=function(queryvo){

	var pu = new SOAPClientParameters2();
	pu.add('PaymentVO',queryvo) ;
	pu.add('pageNumber',pagenumberpayment2payments) ;
	pu.add('pageSize',pagesizepayment2payments) ;
	pu.add('orderBy',orderBypayment2payments) ;
	SOAPClient.invoke(urlpayment2payments,"getPayment", pu, false,  function GetEnu_callBack(ul, soapResponse){   
//????¡À?¡À¨ª??????¡Á?¡À¨ª,?¡À????¡À¨ª???¨¤??¡À¨ª??¡Á?¡À¨ª?¡À?????????????¨ª?¨®??	
	querydatapayment2payments=dojoPayment.PaymentVOtoArray_fun(ul,false);
	totalCountpayment2payments=ul[ul.length-1]["ns:id"]; 
	}); 
	var totalpage=Math.ceil(new Number(totalCountpayment2payments)/pagesizepayment2payments);
	
	if(totalpage>1){
		if(pagenumberpayment2payments==1){
			dijit.byId("but6payment2payments").setDisabled(true);
			dijit.byId("but7payment2payments").setDisabled(false);
		}else if(pagenumberpayment2payments==totalpage){
			dijit.byId("but6payment2payments").setDisabled(false);
			dijit.byId("but7payment2payments").setDisabled(true);
		}else{
			dijit.byId("but6payment2payments").setDisabled(false);
			dijit.byId("but7payment2payments").setDisabled(false);
		}
	}else{
		dijit.byId("but6payment2payments").setDisabled(true);
		dijit.byId("but7payment2payments").setDisabled(true);
	
	}
	if(pagesizepayment2payments==0){
		totalpage=1;
		dijit.byId("but6payment2payments").setDisabled(true);
		dijit.byId("but7payment2payments").setDisabled(true);
	}
	if(totalpage==1)pagenumberpayment2payments=1;
	
	 document.getElementById("rowCountpayment2payments").innerHTML=i18nStr.di+" "+pagenumberpayment2payments+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountpayment2payments+" "+i18nStr.rowSize; 	

	querydatapayment2payments.splice(querydatapayment2payments.length-1,1);
	modelpayment2payments.setData(querydatapayment2payments);
}

var buildpayment2payments=function(FKID){

	if(NUpayment2payments && FKID!=undefined && FKID!=''){
		var queryFloatOrderRowd=new Object();
		queryFloatOrderRowd.id=FKID;
		queryvopayment2payments.payment=queryFloatOrderRowd;
		getVOpayment2payments(queryvopayment2payments);
		if(gridpayment2payments==undefined){
			  gridpayment2payments = new dojox.Grid({
						title: "",
						id: "gridpayment2payments",
						jsId: "gridpayment2payments",
						structure: layoutpayment2payments,
						rowCount:querydatapayment2payments.length,
						model:modelpayment2payments
					}, dojo.byId("gridpayment2payments"));
				gridpayment2payments.resize({ h: dijit.byId("bottomPane").domNode.clientHeight-90});
				
		}else{
			gridpayment2payments.updateRowCount(querydatapayment2payments.length); 
		}
		NUpayment2payments=false;
	}

}
					
	var layoutpayment2payments=[{
           //?¨´??field???????????????????¨°????js????toArray¡Á??????¡§??????querydate????????
   
			 cells: [ [
					   //{ name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
					   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
            {name: i18nStr.newAttr1, field: 2,width: 10 }
			            ,   {name: i18nStr.newAttr2, field: 3,width: 10 }
			  
//??????¡À¨ª???¨ª????????
			//,   {name: i18nStr.payment,field: 4,get:function(inRowIndex){ var str='';var strid;if(querydatapayment2payments[inRowIndex]!=undefined && querydatapayment2payments[inRowIndex][4]!=undefined && querydatapayment2payments[inRowIndex][4][1]!=undefined){str=querydatapayment2payments[inRowIndex][4][2];strid=querydatapayment2payments[inRowIndex][4][1];} return str;} ,width: 10 }
	       ] ]
                           }]; 

function pageSizeChangepayment2payments(mylabel){
	pagesizepayment2payments=mylabel;
	getVOpayment2payments(queryvopayment2payments);
}

function allpagepayment2payments(){
	pagesizepayment2payments=0;
	getVOpayment2payments(queryvopayment2payments);
}

function upPagepayment2payments(){
	pagenumberpayment2payments--;
	getVOpayment2payments(queryvopayment2payments);
}

function downPagepayment2payments(){
	pagenumberpayment2payments++;
	getVOpayment2payments(queryvopayment2payments);
}

