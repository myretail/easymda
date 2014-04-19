if(!dojo._hasResource["projectDojo.Orderd"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["projectDojo.Orderd"] = true;
dojo.provide("projectDojo.Orderd");

dojo.require("projectDojo.subOrderRowd");
dojo.require("projectDojo.Customer");
dojo.declare("projectDojo.Orderd",
[
	 projectDojo.subOrderRowd
					, projectDojo.Customer
			],
{
	noOrderd:'',
	selectOrderdIDs:'',
	oldFloatOrderd:'',
	selectOrderdInRow:'',
	ifMultOrderd:0,
	mainRowIndexOrderd:'',
	oldDetailFloatOrderd:'',
	detailFloatOrderdData:'',
	orderRowStore:''	,
	customerStore:''	,

	conveyanceEnumStore:''	,
	itemconveyanceEnumOption:'' ,
	carryTypeEnumStore:''	,
	itemcarryTypeEnumOption:'' ,
	levelEnumStore:''	,
	itemlevelEnumOption:'' ,
	customerTypeEnumStore:''	,
	itemcustomerTypeEnumOption:'' ,

selectOrderd:function (myID,inrow,OrderdColNo,ifMultOrderd,e,mainRowIndex){
	var floath=e.screenY-window.screen.availHeight+document.body.clientHeight+30;
	if(floath+255>document.body.clientHeight)floath=floath-255;
	var floatw=e.screenX;
	if(e.screenX+505>document.body.clientWidth)floatw=floatw-500;
		this.selectOrderdInRow=inrow;
		this.noOrderd=OrderdColNo;
		this.selectOrderdIDs=myID;
		//ifMult=ifMults;
		this.mainRowIndexOrderd=mainRowIndex;
		this.oldFloatOrderd = dijit.byId("selectOrderdFloat_1");
		dojoOrderdSelect=this;
		if(this.oldFloatOrderd==undefined){
			var div = dojo.doc.createElement('div');
			dojo.body().appendChild(div);
			var fp = new dojox.layout.FloatingPane({id:"selectOrderdFloat_1",title:"selectFloat",//title:i18nStr.selectOrderd,
				maxable: true,closable: true,resizable: true ,dockable:true,
				href:"../common/selectOrderdFloat.html"},div);
			dojo.style(fp.domNode,{
				width:"500px",height:"300px",top:floath, left:floatw,position:"absolute",zIndex:"980"});//255
			this.oldFloatOrderd=fp;
			fp.startup();
			fp.show();
			
		}else{
			dojo.style(this.oldFloatOrderd.domNode,{width:"500px",height:"300px",//255
				top:floath, left:floatw,
				position:"absolute",zIndex:"980"});
			this.oldFloatOrderd.show();
			dijit.byId("gridIncOrderd").model.setData(querydataIncOrderd); 
		}
},
																																
 //rowinum=5
detailOrderd:function (myID,inrow,OrderdColNo,ifMultOrderd,e,mainRowIndex){
	var floath=e.screenY-window.screen.availHeight+document.body.clientHeight+30;
	if(floath+255>document.body.clientHeight)floath=floath-255;
	var floatw=e.screenX;
	if(e.screenX+505>document.body.clientWidth)floatw=floatw-500;
		//this.selectOrderdInRow=inrow;
		//this.noOrderd=OrderdColNo;
		//this.selectOrderdIDs=myID;
		//ifMult=ifMults;
		//this.mainRowIndexOrderd=mainRowIndex;
		this.oldDetailFloatOrderd = dijit.byId("detailOrderdFloat_1");
		//dojoOrderddetail=this;
		if(this.oldDetailFloatOrderd==undefined){
			var div = dojo.doc.createElement('div');
			dojo.body().appendChild(div);
			var fp = new dojox.layout.FloatingPane({id:"detailOrderdFloat_1",title:"detailFloat",//title:i18nStr.selectOrderd,
				maxable: true,closable: true,resizable: true ,dockable:true,
				href:"../common/detailOrderdFloat.html"},div);
			dojo.style(fp.domNode,{
				width:"600px",height:"155px",top:floath, left:floatw,position:"absolute",zIndex:"980"});//255
			this.oldDetailFloatOrderd=fp;
			fp.startup();
			fp.show();
			
		}else{
			dojo.style(this.oldDetailFloatOrderd.domNode,{width:"600px",height:"155px",//255
				top:floath, left:floatw,
				position:"absolute",zIndex:"980"});
			this.oldDetailFloatOrderd.show();
			//dijit.byId("gridIncOrderd").model.setData(querydataIncOrderd); 
		}
	
	//var querydataOrderdDetail= setDetailFloatFun(inrow,OrderdColNo);	
	var thisObj=this;
	setTimeout(function(){
													dojo.byId("detailcustomerOrderNo").value=thisObj.detailFloatOrderdData[2];
						 									dojo.byId("detailcontractNo").value=thisObj.detailFloatOrderdData[3];
						 									dojo.byId("detailconveyanceEnum").value=thisObj.detailFloatOrderdData[4];
						 									dojo.byId("detailcarryTypeEnum").value=thisObj.detailFloatOrderdData[5];
						 									dojo.byId("detailshipperRemark").value=thisObj.detailFloatOrderdData[6];
						 									dojo.byId("detailcarrierRemark").value=thisObj.detailFloatOrderdData[7];
						 									dojo.byId("detaillevelEnum").value=thisObj.detailFloatOrderdData[8];
						 									dojo.byId("detailcustomerTypeEnum").value=thisObj.detailFloatOrderdData[9];
						 									 dojo.byId("detailreferTime").value=dojo.date.locale.parse(thisObj.detailFloatOrderdData[10],{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" });
						 									dojo.byId("detaillinkMan").value=thisObj.detailFloatOrderdData[11];
						 									dojo.byId("detailtel").value=thisObj.detailFloatOrderdData[12];
						 									 dojo.byId("detailbookTime").value=dojo.date.locale.parse(thisObj.detailFloatOrderdData[13],{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" });
						 									 dojo.byId("detailcompleteTime").value=dojo.date.locale.parse(thisObj.detailFloatOrderdData[14],{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" });
						 									dojo.byId("detailremark").value=thisObj.detailFloatOrderdData[15];
						 			 
													dojo.byId("detailcustomer").value=thisObj.detailFloatOrderdData[17][2];
							
		
	},300);

},

OrderdVOtoArray_fun:function(ulvo,edit){
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
                        
                        items[2] = ulo["ns:customerOrderNo"];//
                        items[3] = ulo["ns:contractNo"];//
                        items[4] = ulo["ns:conveyanceEnum"];//
                        items[5] = ulo["ns:carryTypeEnum"];//
                        items[6] = ulo["ns:shipperRemark"];//
                        items[7] = ulo["ns:carrierRemark"];//
                        items[8] = ulo["ns:levelEnum"];//
                        items[9] = ulo["ns:customerTypeEnum"];//
                        t=ulo["ns:referTime"];if(t!=null&&t!=undefined){items[10] = t['ns:upDate'];}
                        items[11] = ulo["ns:linkMan"];//
                        items[12] = ulo["ns:tel"];//
                        t=ulo["ns:bookTime"];if(t!=null&&t!=undefined){items[13] = t['ns:upDate'];}
                        t=ulo["ns:completeTime"];if(t!=null&&t!=undefined){items[14] = t['ns:upDate'];}
                        items[15] = ulo["ns:remark"];//
                         items[16] = this.OrderRowdVOtoArray_fun(ulo["ns:orderRow"],edit);
                         items[17] = this.CustomerVOtoArray_fun(ulo["ns:customer"],edit);
items[18] = ulo["ns:selected"];
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
                        
                        items[2] = ulo["ns:customerOrderNo"];//
                        items[3] = ulo["ns:contractNo"];//
                        items[4] = ulo["ns:conveyanceEnum"];//
                        items[5] = ulo["ns:carryTypeEnum"];//
                        items[6] = ulo["ns:shipperRemark"];//
                        items[7] = ulo["ns:carrierRemark"];//
                        items[8] = ulo["ns:levelEnum"];//
                        items[9] = ulo["ns:customerTypeEnum"];//
                        t=ulo["ns:referTime"];if(t!=null&&t!=undefined){
                        d=dojo.date.locale.parse(new String( t['ns:upDate']),{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" });}
                        items[10] = d;
                        items[11] = d;                        
                        items[12] = ulo["ns:linkMan"];//
                        items[13] = ulo["ns:tel"];//
                        t=ulo["ns:bookTime"];if(t!=null&&t!=undefined){
                        d=dojo.date.locale.parse(new String( t['ns:upDate']),{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" });}
                        items[14] = d;
                        items[15] = d;                        
                        t=ulo["ns:completeTime"];if(t!=null&&t!=undefined){
                        d=dojo.date.locale.parse(new String( t['ns:upDate']),{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" });}
                        items[16] = d;
                        items[17] = d;                        
                        items[18] = ulo["ns:remark"];//
                         items[19] = this.OrderRowdVOtoArray_fun(ulo["ns:orderRow"],edit);
                         items[20] = this.CustomerVOtoArray_fun(ulo["ns:customer"],edit);
				items[21] = ulo["ns:selected"];
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
		

initOrderd:function (){ 
	var thisObj=this;
	var urle = getUrl()+ "services/BasicManageService"; 
	thisObj.initOrderRowd();
				thisObj.initCustomer();
	if(this.orderRowStore==''){
	var porderRow = new SOAPClientParameters();
	var itemsorderRow = new Array();  
		porderRow.add('OrderRowdVO',new Object()) ;
		porderRow.add('pageNumber',0) ;
		porderRow.add('pageSize',0) ;
	    porderRow.add('orderBy','0') ;
	SOAPClient.invoke(getUrl()+ "services/"+"OrderRowdManageService","getOrderRowd", porderRow, false,  function GetEnu_callBack(ul, soapResponse){      
				var tempData=thisObj.OrderRowdVOtoArray_fun(ul,false);
				for(var i = 0; i < tempData.length-1; i++){		
				  itemsorderRow.push({name: tempData[i][2], value:tempData[i][1]});
				}                
	});       
	if(itemsorderRow.length==0)itemsorderRow.push({name:'' , value:''});
	this.orderRowStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemsorderRow }});
}

if(this.customerStore==''){
	var pcustomer = new SOAPClientParameters();
	var itemscustomer = new Array();  
		pcustomer.add('CustomerVO',new Object()) ;
		pcustomer.add('pageNumber',0) ;
		pcustomer.add('pageSize',0) ;
	    pcustomer.add('orderBy','0') ;
	SOAPClient.invoke(getUrl()+ "services/"+"CustomerManageService","getCustomer", pcustomer, false,  function GetEnu_callBack(ul, soapResponse){      
				var tempData=thisObj.CustomerVOtoArray_fun(ul,false);
				for(var i = 0; i < tempData.length-1; i++){		
				  itemscustomer.push({name: tempData[i][2], value:tempData[i][1]});
				}                
	});       
	if(itemscustomer.length==0)itemscustomer.push({name:'' , value:''});
	this.customerStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemscustomer }});
}


						var pconveyanceEnum = new SOAPClientParameters();
			pconveyanceEnum.add('eType','conveyanceEnum');
			var itemconveyanceEnum = new Array();
			this.itemconveyanceEnumOption = new Array();
				SOAPClient.invoke(urle, "getEnumerationByType", pconveyanceEnum, false,  function GetEnu_callBack(ul, soapResponse){   
				for(var i = 0; i < ul.length; i++){		
				  var ulo=ul[i];
				  itemconveyanceEnum.push({name: ulo["ns:fieldName"], value:ulo["ns:fieldName"]});
				  thisObj.itemconveyanceEnumOption.push(ulo["ns:fieldName"]);
				}                
			});       
			if(itemconveyanceEnum.length==0)itemconveyanceEnum.push({name:'' , value:''});
			this.conveyanceEnumStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemconveyanceEnum}}); 
					var pcarryTypeEnum = new SOAPClientParameters();
			pcarryTypeEnum.add('eType','carryTypeEnum');
			var itemcarryTypeEnum = new Array();
			this.itemcarryTypeEnumOption = new Array();
				SOAPClient.invoke(urle, "getEnumerationByType", pcarryTypeEnum, false,  function GetEnu_callBack(ul, soapResponse){   
				for(var i = 0; i < ul.length; i++){		
				  var ulo=ul[i];
				  itemcarryTypeEnum.push({name: ulo["ns:fieldName"], value:ulo["ns:fieldName"]});
				  thisObj.itemcarryTypeEnumOption.push(ulo["ns:fieldName"]);
				}                
			});       
			if(itemcarryTypeEnum.length==0)itemcarryTypeEnum.push({name:'' , value:''});
			this.carryTypeEnumStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemcarryTypeEnum}}); 
							var plevelEnum = new SOAPClientParameters();
			plevelEnum.add('eType','levelEnum');
			var itemlevelEnum = new Array();
			this.itemlevelEnumOption = new Array();
				SOAPClient.invoke(urle, "getEnumerationByType", plevelEnum, false,  function GetEnu_callBack(ul, soapResponse){   
				for(var i = 0; i < ul.length; i++){		
				  var ulo=ul[i];
				  itemlevelEnum.push({name: ulo["ns:fieldName"], value:ulo["ns:fieldName"]});
				  thisObj.itemlevelEnumOption.push(ulo["ns:fieldName"]);
				}                
			});       
			if(itemlevelEnum.length==0)itemlevelEnum.push({name:'' , value:''});
			this.levelEnumStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemlevelEnum}}); 
					var pcustomerTypeEnum = new SOAPClientParameters();
			pcustomerTypeEnum.add('eType','customerTypeEnum');
			var itemcustomerTypeEnum = new Array();
			this.itemcustomerTypeEnumOption = new Array();
				SOAPClient.invoke(urle, "getEnumerationByType", pcustomerTypeEnum, false,  function GetEnu_callBack(ul, soapResponse){   
				for(var i = 0; i < ul.length; i++){		
				  var ulo=ul[i];
				  itemcustomerTypeEnum.push({name: ulo["ns:fieldName"], value:ulo["ns:fieldName"]});
				  thisObj.itemcustomerTypeEnumOption.push(ulo["ns:fieldName"]);
				}                
			});       
			if(itemcustomerTypeEnum.length==0)itemcustomerTypeEnum.push({name:'' , value:''});
			this.customerTypeEnumStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemcustomerTypeEnum}}); 
								}
});
}

