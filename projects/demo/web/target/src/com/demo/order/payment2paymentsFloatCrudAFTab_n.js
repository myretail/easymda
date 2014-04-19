	  //---begin---------???????????¨¤???¨¤??????¡À¨ª
					//---begin---------?????????¡À????????tree?¨¢??¡À¨ªsno
			//?????????¡§¡À¨ª
//set (= payment2payments)
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
  var gridpayment2payments;
  var urle2 = getUrl()+ "services/BasicManageService";   */
  
 
  
var getVOpayment2payments=function(queryvo,id){

	var pu = new SOAPClientParameters2();
	pu.add('PaymentVO',queryvo) ;
	pu.add('pageNumber',payment2paymentsFloatArray[id].pagenumberpayment2payments) ;
	pu.add('pageSize',payment2paymentsFloatArray[id].pagesizepayment2payments) ;
	pu.add('orderBy',payment2paymentsFloatArray[id].orderBypayment2payments) ;
	SOAPClient.invoke(urlpayment2payments,"getPayment", pu, false,  function GetEnu_callBack(ul, soapResponse){      
	//????¡À?¡À¨ª??????¡Á?¡À¨ª,?¡À????¡À¨ª???¨¤??¡À¨ª??¡Á?¡À¨ª?¡À?????????????¨ª?¨®??	
	payment2paymentsFloatArray[id].querydatapayment2payments=dojoPayment.PaymentVOtoArray_fun(ul,true);
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
	if( mainID!=undefined && mainID!=''){//NUpayment2payments &&
	    var openFloat=dijit.byId("gridpayment2payments"+mainID);
		if(openFloat==undefined){
			payment2paymentsFloatArray[mainID] = new payment2paymentsFloatPara(mainID);
			var newTab = dijit.byId("payment2payments"+mainID);
			newTab.setContent("<table   style=\"width:80%; position:absolute;top:0px;\"><tr height=\"25px\" width=\"100%\">	<td align=\"left\" style=\"background:transparent\"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   payment2payments List&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td><td align=\"right\" ><span ></span>&nbsp;&nbsp;	<div > </div><div > </div><div > </div>	<div > </div><div > </div>	</td></tr></table><div style=\"{width:500px;height:500px; position:absolute;top:30px;}\" ><div > </div></div>");
			var openContainerTable=newTab.containerNode.children[0].children[0].children[0].children[1].childNodes;
	
		openContainerTable[0].innerHTML="<span id=\"rowCountpayment2payments"+mainID+"\"></span>";
var but1 = new dijit.form.myButton({label:"pageup",id:"but6payment2payments"+mainID,disabled:"true",onclick:"upPagepayment2payments("+mainID+");",iconClass:"upPageIcon"},openContainerTable[1]);
var but2= new dijit.form.myButton({label:"pagedown",id:"but7payment2payments"+mainID,disabled:"true",onclick:"downPagepayment2payments("+mainID+");",iconClass:"downPageIcon"},openContainerTable[2]);
	var but3 = new dijit.form.Button({label:"add",iconClass:"addIcon"},openContainerTable[3]);
	var but4 = new dijit.form.Button({label:"delete",iconClass:"delIcon"},openContainerTable[4]);       //,onClick:"removepayment2payments("+mainID+")"
	var but5 = new dijit.form.Button({label:"save",iconClass:"saveIcon",id:"but3payment2payments"+mainID },openContainerTable[5]);//,onclick:but3payment2payments(mainID)
		dojo.connect(but3, "onClick", function(e){  addRowpayment2payments(""+mainID); });
		dojo.connect(but4, "onClick", function(e){  removepayment2payments(""+mainID); });
		dojo.connect(but5, "onClick", function(e){  call_funUpdpayment2payments(""+mainID); });
		var openContainerGrid=newTab.domNode.children[1].children[0];
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
				payment2paymentsFloatArray[mainID].gridpayment2payments.resize({w:999,h:500});
		}else{
			getVOpayment2payments(payment2paymentsFloatArray[mainID].queryvopayment2payments,mainID);
			payment2paymentsFloatArray[mainID].gridpayment2payments.modelAllChange();

		}}
}

									//??????¡À¨ª???¨ª????????
						
var buildLayoutpayment2payments = function(floatMainID){		
	var layoutpayment2payments=[{
           //?¨´??field???????????????????¨°????js????toArray¡Á??????¡§??????querydate????????
   
			 cells: [ [
					   { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
					   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
      					  {name: i18nStr.newAttr1, field: 2,width: 10 , editor: mydojo.ValidationTextBox ,required:true ,maxLength:30}
					            					,   {name: i18nStr.newAttr2, field: 3,width: 10 , editor: mydojo.ValidationTextBox ,required:true ,maxLength:30}
					      
//??????¡À¨ª???¨ª????????
												//,   {name: i18nStr.payment,field: 4,get:function(inRowIndex){ var str='';var strid;if(querydatapayment2payments[inRowIndex]!=undefined && querydatapayment2payments[inRowIndex][4]!=undefined && querydatapayment2payments[inRowIndex][4][2]!=undefined){str=querydatapayment2payments[inRowIndex][4][2];strid=querydatapayment2payments[inRowIndex][4][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" class="imgSelectStyle" onclick="selectOrderRowd('+strid+','+inRowIndex+',4,0,event);"   >';} ,width: 10 }
						                                        ] ]
                           }]; 
return layoutpayment2payments;
}

var addRowpayment2payments = function(id){

	var addrow=[];
														addrow.push('');
																					addrow.push('');
																							//{ass.otherEnd.name}=payment
					addrow.push([false,id]);
											addrow.splice(0,0,false,0);
	dijit.byId("gridpayment2payments"+id).addRow(addrow,payment2paymentsFloatArray[id].gridpayment2payments.model.getRowCount());
} 

function removepayment2payments(id){
       var s= new Array();
       var sall=payment2paymentsFloatArray[id].gridpayment2payments.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
          s.push(i);
          var thisCell=sall[i];
          if(thisCell[1]!=0){//the row which will be deleted
            payment2paymentsFloatArray[id].deletedatapayment2payments.splice(payment2paymentsFloatArray[id].deletedatapayment2payments.length,0,thisCell[1]);
       }}}
       payment2paymentsFloatArray[id].gridpayment2payments.model.remove(s);//grid.removeSelectedRows();
 }
function call_funUpdpayment2payments(id) {
       var sall=payment2paymentsFloatArray[id].gridpayment2payments.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
         var passAll=0;
         var thisCell=sall[i];
         var padd = new SOAPClientParameters2();
         var vobject=new Object();
         vobject.id=thisCell[1];
              if(dojox.validate.isText(thisCell[2], {minlength: 1})){vobject.newAttr1=thisCell[2];
             }else{payment2paymentsFloatArray[id].gridpayment2payments.getCell(payment2paymentsFloatArray[id].gridpayment2payments.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;}//not null
 
              if(dojox.validate.isText(thisCell[3], {minlength: 1})){vobject.newAttr2=thisCell[3];
             }else{payment2paymentsFloatArray[id].gridpayment2payments.getCell(payment2paymentsFloatArray[id].gridpayment2payments.model.fieldArray[3]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;}//not null
 

								var manageable=new Object();
			 if(payment2paymentsFloatArray[id].querydatapayment2payments[i][4]!=''&&payment2paymentsFloatArray[id].querydatapayment2payments[i][4]!=undefined){
             manageable.id=payment2paymentsFloatArray[id].querydatapayment2payments[i][4][1];
             vobject.payment=manageable;
			 }else{
			 payment2paymentsFloatArray[id].gridpayment2payments.getCell(payment2paymentsFloatArray[id].gridpayment2payments.model.fieldArray[4]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
						


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('PaymentVO',vobject);
                SOAPClient.invoke(urlpayment2payments, "createPayment", padd, false,  function GetEnu_callBack(ul, soapResponse){
                payment2paymentsFloatArray[id].gridpayment2payments.model.setDatum(ul,i,1);
				});
	         }else{//modify row
                padd.add('PaymentVO',vobject);
                SOAPClient.invoke(urlpayment2payments, "updatePayment", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
        } }}//for
//submit delete
          for(var i=0;i<payment2paymentsFloatArray[id].deletedatapayment2payments.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',payment2paymentsFloatArray[id].deletedatapayment2payments[i]);
               SOAPClient.invoke(urlpayment2payments, "deletePayment", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
	           });
          }
          payment2paymentsFloatArray[id].deletedatapayment2payments=new Array();
          //dojo.byId("rowCount").innerHTML = 'saved'; 
//submit delete end          
 } 
 
		function selectOrderRowdFun(rep){
		payment2paymentsFloatArray[dojoPayment.mainRowIndexOrderRowd].querydatapayment2payments[dojoPayment.selectOrderRowdInRow][dojoPayment.noOrderRowd]=rep;
		payment2paymentsFloatArray[dojoPayment.mainRowIndexOrderRowd].gridpayment2payments.updateRow(dojoPayment.selectOrderRowdInRow);	
			
	}

function pageSizeChangepayment2payments(mylabel){
	payment2paymentsFloatArray[id].pagesizepayment2payments=mylabel;
	getVOpayment2payments(payment2paymentsFloatArray[id].queryvopayment2payments,mainID);
}

function allpagepayment2payments(id){
	payment2paymentsFloatArray[id].pagesizepayment2payments=0;
	getVOpayment2payments(payment2paymentsFloatArray[id].queryvopayment2payments,mainID);
}

function upPagepayment2payments(id){
	pagenumberpayment2payments--;
	getVOpayment2payments(payment2paymentsFloatArray[id].queryvopayment2payments,mainID);
}
function downPagepayment2payments(id){
	pagenumberpayment2payments++;
	getVOpayment2payments(payment2paymentsFloatArray[id].queryvopayment2payments,mainID);
}


