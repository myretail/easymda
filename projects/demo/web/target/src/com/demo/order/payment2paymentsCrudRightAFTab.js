	  //¡À???¡ã?????¡À¨ª??4.1????¡À¨ª??---begin---------????"????¡À¨ª/????¡À¨ª"?¡§"??¡À¨ª"??"????¡À¨ª"/"¡À?????¡À¨ª"?????????¨¤???¨¤??????¡À¨ª
					//---begin---------?????????¡À????????tree?¨¢??¡À¨ªsno,??"????¡À¨ª"???¡Â¡À¨ª
			//????"????¡À¨ª"???????¡Â¡À¨ªbegin
	//????"????¡À¨ª"??????¡Á?¡À¨ªbegin
//????"????¡À¨ª"??????¡Á?¡À¨ªend
//??????"????¡À¨ª"?????¡§¡À¨ª
//set (= payment2payments)
	//name =payment2paymentsCrudRightAFTab.js  manageable.name=Payment
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

/*			  */


  
  
var getVOpayment2payments=function(queryvo){

	var pu = new SOAPClientParameters2();
	pu.add('PaymentVO',queryvo) ;
	pu.add('pageNumber',pagenumberpayment2payments) ;
	pu.add('pageSize',pagesizepayment2payments) ;
	pu.add('orderBy',orderBypayment2payments) ;
	SOAPClient.invoke(urlpayment2payments,"getPayment", pu, false,  function GetEnu_callBack(ul, soapResponse){     
//????¡À?¡À¨ª??????¡Á?¡À¨ª,?¡À????¡À¨ª???¨¤??¡À¨ª??¡Á?¡À¨ª?¡À?????????????¨ª?¨®??	
	querydatapayment2payments=dojoPayment.PaymentVOtoArray_fun(ul,true);
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

var buildpayment2payments=function(){
	if(NUpayment2payments && mainID!=undefined && mainID!=''){
		var queryFloatOrderRowd=new Object();
		queryFloatOrderRowd.id=mainID;
		queryvopayment2payments.payment=queryFloatOrderRowd;
		getVOpayment2payments(queryvopayment2payments);
		if(dijit.byId("gridpayment2payments")==undefined){
			  gridpayment2payments = new dojox.Grid({
						title: "",
						id: "gridpayment2payments",
						jsId: "gridpayment2payments",
						structure: layoutpayment2payments,
						rowCount:querydatapayment2payments.length,
						model:modelpayment2payments
					}, dojo.byId("gridpayment2payments"));
				gridpayment2payments.resize({w: dijit.byId("rightPane").domNode.clientWidth-16,h:dijit.byId("rightPane").domNode.clientHeight-100}); 
				
		}else{
			gridpayment2payments.updateRowCount(querydatapayment2payments.length); 
		}
		NUpayment2payments=false;
	}

}

										var layoutpayment2payments=[{
           //?¨´??field???????????????????¨°????js????toArray¡Á??????¡§??????querydate????????
   
			 cells: [ [
					   { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
					   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
     					  {name: i18nStr.newAttr1, field: 2,width: 10 , editor: mydojo.ValidationTextBox ,required:true ,maxLength:30}
					           					,   {name: i18nStr.newAttr2, field: 3,width: 10 , editor: mydojo.ValidationTextBox ,required:true ,maxLength:30}
					      


//??????¡À¨ª???¨ª????????
												//,   {name: i18nStr.payment,field: 4,get:function(inRowIndex){ var str='';var strid;if(querydatapayment2payments[inRowIndex]!=undefined && querydatapayment2payments[inRowIndex][4]!=undefined && querydatapayment2payments[inRowIndex][4][2]!=undefined){str=querydatapayment2payments[inRowIndex][4][2];strid=querydatapayment2payments[inRowIndex][4][1];} return str;} ,width: 10 }
						                                        ] ]
                           }]; 

//??????¡À¨ª???¨ª????????
						
			   
						   
var addRowpayment2payments = function(){

	var addrow=[];
														addrow.push('');
																					addrow.push('');
																							//{ass.otherEnd.name}=payment
					addrow.push([false,mainID]);
											addrow.splice(0,0,false,0);
	gridpayment2payments.addRow(addrow,gridpayment2payments.model.getRowCount());
} 

function removepayment2payments(){
       var s= new Array();
       var sall=gridpayment2payments.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
          s.push(i);
          var thisCell=sall[i];
          if(thisCell[1]!=0){//the row which will be deleted
            deletedatapayment2payments.splice(deletedatapayment2payments.length,0,thisCell[1]);
       }}}
       gridpayment2payments.model.remove(s);//grid.removeSelectedRows();
 }
function call_funUpdpayment2payments() {
       var sall=gridpayment2payments.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
         var passAll=0;
         var thisCell=sall[i];
         var padd = new SOAPClientParameters2();
         var vobject=new Object();
         vobject.id=thisCell[1];
              if(dojox.validate.isText(thisCell[2], {minlength: 1})){vobject.newAttr1=thisCell[2];
             }else{gridpayment2payments.getCell(gridpayment2payments.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;}//not null
 
              if(dojox.validate.isText(thisCell[3], {minlength: 1})){vobject.newAttr2=thisCell[3];
             }else{gridpayment2payments.getCell(gridpayment2payments.model.fieldArray[3]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;}//not null
 

								var manageable=new Object();
			 if(querydatapayment2payments[i][4]!=''&&querydatapayment2payments[i][4]!=undefined){
             manageable.id=querydatapayment2payments[i][4][1];
             vobject.payment=manageable;
			 }else{
			 gridpayment2payments.getCell(gridpayment2payments.model.fieldArray[4]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
						


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('PaymentVO',vobject);
                SOAPClient.invoke(urlpayment2payments, "createPayment", padd, false,  function GetEnu_callBack(ul, soapResponse){
                gridpayment2payments.model.setDatum(ul,i,1);
				});
	         }else{//modify row
                padd.add('PaymentVO',vobject);
                SOAPClient.invoke(urlpayment2payments, "updatePayment", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
        } }}//for
//submit delete
          for(var i=0;i<deletedatapayment2payments.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',deletedatapayment2payments[i]);
               SOAPClient.invoke(urlpayment2payments, "deletePayment", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
	           });
          }
          deletedatapayment2payments=new Array();
          //dojo.byId("rowCount").innerHTML = 'saved'; 
//submit delete end          
 } 
 
	function selectOrderRowdFun(rep){
		querydatapayment2payments[dojoPayment.selectOrderRowdInRow][dojoPayment.noOrderRowd]=rep;
		gridpayment2payments.updateRow(dojoPayment.selectOrderRowdInRow);	
			
	}

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

