	//¡À???¡ã?????¡À¨ª??4.1????¡À¨ª??---begin---------????"????¡À¨ª/????¡À¨ª"?¡§"??¡À¨ª"??"????¡À¨ª"/"¡À?????¡À¨ª"?????????¨¤???¨¤??????¡À¨ª
			//---begin---------?????????¡À????????tree?¨¢??¡À¨ªsno,??"????¡À¨ª"???¡Â¡À¨ª
		//????"????¡À¨ª"???????¡Â¡À¨ªbegin
	//????"????¡À¨ª"??????¡Á?¡À¨ªbegin
//????"????¡À¨ª"??????¡Á?¡À¨ªend
//??????"????¡À¨ª"?????¡§¡À¨ª
//set (= contacts2customer)
//????????????layout??($member in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[customer]])??if(!${member.many})  ??¡Á?????????Float???????¡ã????????
  //name =contacts2customerRightAFTab.js  manageable.name=Contact
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
//????¡À?¡À¨ª??????¡Á?¡À¨ª,?¡À????¡À¨ª???¨¤??¡À¨ª??¡Á?¡À¨ª?¡À?????????????¨ª?¨®??	
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
				gridcontacts2customer.resize({w: dijit.byId("rightPane").domNode.clientWidth-16,h:dijit.byId("rightPane").domNode.clientHeight-100});				
		}else{
			gridcontacts2customer.updateRowCount(querydatacontacts2customer.length); 
		}
		NUcontacts2customer=false;
	}

}
			
	var layoutcontacts2customer=[{
           //?¨´??field???????????????????¨°????js????toArray¡Á??????¡§??????querydate????????
   
			 cells: [ [
					   //{ name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
					   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
            {name: i18nStr.codeContact, field: 2,width: 10 }
			  
//??????¡À¨ª???¨ª????????
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

