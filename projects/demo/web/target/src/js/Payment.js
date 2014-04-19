if(!dojo._hasResource["projectDojo.Payment"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["projectDojo.Payment"] = true;
dojo.provide("projectDojo.Payment");

dojo.require("projectDojo.OrderRowd");
dojo.declare("projectDojo.Payment",
[
				 projectDojo.OrderRowd
			],
{
	noPayment:'',
	selectPaymentIDs:'',
	oldFloatPayment:'',
	selectPaymentInRow:'',
	ifMultPayment:0,
	mainRowIndexPayment:'',
	oldDetailFloatPayment:'',
	detailFloatPaymentData:'',
	paymentStore:''	,


selectPayment:function (myID,inrow,PaymentColNo,ifMultPayment,e,mainRowIndex){
	var floath=e.screenY-window.screen.availHeight+document.body.clientHeight+30;
	if(floath+255>document.body.clientHeight)floath=floath-255;
	var floatw=e.screenX;
	if(e.screenX+505>document.body.clientWidth)floatw=floatw-500;
		this.selectPaymentInRow=inrow;
		this.noPayment=PaymentColNo;
		this.selectPaymentIDs=myID;
		//ifMult=ifMults;
		this.mainRowIndexPayment=mainRowIndex;
		this.oldFloatPayment = dijit.byId("selectPaymentFloat_1");
		dojoPaymentSelect=this;
		if(this.oldFloatPayment==undefined){
			var div = dojo.doc.createElement('div');
			dojo.body().appendChild(div);
			var fp = new dojox.layout.FloatingPane({id:"selectPaymentFloat_1",title:"selectFloat",//title:i18nStr.selectPayment,
				maxable: true,closable: true,resizable: true ,dockable:true,
				href:"../common/selectPaymentFloat.html"},div);
			dojo.style(fp.domNode,{
				width:"500px",height:"300px",top:floath, left:floatw,position:"absolute",zIndex:"980"});//255
			this.oldFloatPayment=fp;
			fp.startup();
			fp.show();
			
		}else{
			dojo.style(this.oldFloatPayment.domNode,{width:"500px",height:"300px",//255
				top:floath, left:floatw,
				position:"absolute",zIndex:"980"});
			this.oldFloatPayment.show();
			dijit.byId("gridIncPayment").model.setData(querydataIncPayment); 
		}
},
							
 //rowinum=1
detailPayment:function (myID,inrow,PaymentColNo,ifMultPayment,e,mainRowIndex){
	var floath=e.screenY-window.screen.availHeight+document.body.clientHeight+30;
	if(floath+255>document.body.clientHeight)floath=floath-255;
	var floatw=e.screenX;
	if(e.screenX+505>document.body.clientWidth)floatw=floatw-500;
		//this.selectPaymentInRow=inrow;
		//this.noPayment=PaymentColNo;
		//this.selectPaymentIDs=myID;
		//ifMult=ifMults;
		//this.mainRowIndexPayment=mainRowIndex;
		this.oldDetailFloatPayment = dijit.byId("detailPaymentFloat_1");
		//dojoPaymentdetail=this;
		if(this.oldDetailFloatPayment==undefined){
			var div = dojo.doc.createElement('div');
			dojo.body().appendChild(div);
			var fp = new dojox.layout.FloatingPane({id:"detailPaymentFloat_1",title:"detailFloat",//title:i18nStr.selectPayment,
				maxable: true,closable: true,resizable: true ,dockable:true,
				href:"../common/detailPaymentFloat.html"},div);
			dojo.style(fp.domNode,{
				width:"600px",height:"55px",top:floath, left:floatw,position:"absolute",zIndex:"980"});//255
			this.oldDetailFloatPayment=fp;
			fp.startup();
			fp.show();
			
		}else{
			dojo.style(this.oldDetailFloatPayment.domNode,{width:"600px",height:"55px",//255
				top:floath, left:floatw,
				position:"absolute",zIndex:"980"});
			this.oldDetailFloatPayment.show();
			//dijit.byId("gridIncPayment").model.setData(querydataIncPayment); 
		}
	
	//var querydataPaymentDetail= setDetailFloatFun(inrow,PaymentColNo);	
	var thisObj=this;
	setTimeout(function(){
													dojo.byId("detailnewAttr1").value=thisObj.detailFloatPaymentData[2];
						 									dojo.byId("detailnewAttr2").value=thisObj.detailFloatPaymentData[3];
						 			 
								dojo.byId("detailpayment").value=thisObj.detailFloatPaymentData[4][2];
							
		
	},300);

},

PaymentVOtoArray_fun:function(ulvo,edit){
            var querydata=new Array();
            var items = new Array();
            var ul=new Array();
            var ulo="";
            var le="";
            var d="",t;
            var arraytag="0";//isArray
            if(ulvo!=null){
              if(ulvo.length==undefined){
                 ul[0]=ulvo;
                 arraytag="1";
                 le=1;
              }else{
                 ul=ulvo;
                 le=ul.length;
              }        
              if(edit==false){
                    for(var i = 0; i < le; i++){		
                        items = new Array();
                        ulo=ul[i];
                        items[0] = false;
                        items[1] = ulo["ns:id"];
                        
                        items[2] = ulo["ns:newAttr1"];//
                        items[3] = ulo["ns:newAttr2"];//
                         items[4] = this.OrderRowdVOtoArray_fun(ulo["ns:payment"],edit);
items[5] = ulo["ns:selected"];
                      if(arraytag=="0"){
                        querydata[i]=items;
                      }else{
                        querydata=items;
                      }
                    }
                  }else{//edit==true
                    for(var i = 0; i < le; i++){		
                        items = new Array();
                        ulo=ul[i];
                        items[0] = false;
                        items[1] = ulo["ns:id"];
                        
                        items[2] = ulo["ns:newAttr1"];//
                        items[3] = ulo["ns:newAttr2"];//
                         items[4] = this.OrderRowdVOtoArray_fun(ulo["ns:payment"],edit);
				items[5] = ulo["ns:selected"];
                      if(arraytag=="0"){
                        querydata[i]=items;
                      }else{
                        querydata=items;
                      }
                    }
                  } 
            }//!=null                     
            return querydata;
},
		

initPayment:function (){ 
	var thisObj=this;
	var urle = getUrl()+ "services/BasicManageService"; 
				thisObj.initOrderRowd();
	if(this.paymentStore==''){
	var ppayment = new SOAPClientParameters();
	var itemspayment = new Array();  
		ppayment.add('OrderRowdVO',new Object()) ;
		ppayment.add('pageNumber',0) ;
		ppayment.add('pageSize',0) ;
	    ppayment.add('orderBy','0') ;
	SOAPClient.invoke(getUrl()+ "services/"+"OrderRowdManageService","getOrderRowd", ppayment, false,  function GetEnu_callBack(ul, soapResponse){      
				var tempData=thisObj.OrderRowdVOtoArray_fun(ul,false);
				for(var i = 0; i < tempData.length-1; i++){		
				  itemspayment.push({name: tempData[i][2], value:tempData[i][1]});
				}                
	});       
	if(itemspayment.length==0)itemspayment.push({name:'' , value:''});
	this.paymentStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemspayment }});
}


			}
});
}

