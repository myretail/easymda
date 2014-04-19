if(!dojo._hasResource["projectDojo.Prod"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["projectDojo.Prod"] = true;
dojo.provide("projectDojo.Prod");

dojo.require("projectDojo.Customer");
dojo.require("projectDojo.Peoples");
dojo.declare("projectDojo.Prod",
[
				 projectDojo.Customer
							, projectDojo.Peoples
			],
{
	noProd:'',
	selectProdIDs:'',
	oldFloatProd:'',
	selectProdInRow:'',
	ifMultProd:0,
	mainRowIndexProd:'',
	oldDetailFloatProd:'',
	detailFloatProdData:'',
	prodCustStore:''	,
	principalStore:''	,


selectProd:function (myID,inrow,ProdColNo,ifMultProd,e,mainRowIndex){
	var floath=e.screenY-window.screen.availHeight+document.body.clientHeight+30;
	if(floath+255>document.body.clientHeight)floath=floath-255;
	var floatw=e.screenX;
	if(e.screenX+505>document.body.clientWidth)floatw=floatw-500;
		this.selectProdInRow=inrow;
		this.noProd=ProdColNo;
		this.selectProdIDs=myID;
		//ifMult=ifMults;
		this.mainRowIndexProd=mainRowIndex;
		this.oldFloatProd = dijit.byId("selectProdFloat_1");
		dojoProdSelect=this;
		if(this.oldFloatProd==undefined){
			var div = dojo.doc.createElement('div');
			dojo.body().appendChild(div);
			var fp = new dojox.layout.FloatingPane({id:"selectProdFloat_1",title:"selectFloat",//title:i18nStr.selectProd,
				maxable: true,closable: true,resizable: true ,dockable:true,
				href:"../common/selectProdFloat.html"},div);
			dojo.style(fp.domNode,{
				width:"500px",height:"300px",top:floath, left:floatw,position:"absolute",zIndex:"980"});//255
			this.oldFloatProd=fp;
			fp.startup();
			fp.show();
			
		}else{
			dojo.style(this.oldFloatProd.domNode,{width:"500px",height:"300px",//255
				top:floath, left:floatw,
				position:"absolute",zIndex:"980"});
			this.oldFloatProd.show();
			dijit.byId("gridIncProd").model.setData(querydataIncProd); 
		}
},
															
 //rowinum=2
detailProd:function (myID,inrow,ProdColNo,ifMultProd,e,mainRowIndex){
	var floath=e.screenY-window.screen.availHeight+document.body.clientHeight+30;
	if(floath+255>document.body.clientHeight)floath=floath-255;
	var floatw=e.screenX;
	if(e.screenX+505>document.body.clientWidth)floatw=floatw-500;
		//this.selectProdInRow=inrow;
		//this.noProd=ProdColNo;
		//this.selectProdIDs=myID;
		//ifMult=ifMults;
		//this.mainRowIndexProd=mainRowIndex;
		this.oldDetailFloatProd = dijit.byId("detailProdFloat_1");
		//dojoProddetail=this;
		if(this.oldDetailFloatProd==undefined){
			var div = dojo.doc.createElement('div');
			dojo.body().appendChild(div);
			var fp = new dojox.layout.FloatingPane({id:"detailProdFloat_1",title:"detailFloat",//title:i18nStr.selectProd,
				maxable: true,closable: true,resizable: true ,dockable:true,
				href:"../common/detailProdFloat.html"},div);
			dojo.style(fp.domNode,{
				width:"600px",height:"105px",top:floath, left:floatw,position:"absolute",zIndex:"980"});//255
			this.oldDetailFloatProd=fp;
			fp.startup();
			fp.show();
			
		}else{
			dojo.style(this.oldDetailFloatProd.domNode,{width:"600px",height:"105px",//255
				top:floath, left:floatw,
				position:"absolute",zIndex:"980"});
			this.oldDetailFloatProd.show();
			//dijit.byId("gridIncProd").model.setData(querydataIncProd); 
		}
	
	//var querydataProdDetail= setDetailFloatFun(inrow,ProdColNo);	
	var thisObj=this;
	setTimeout(function(){
													dojo.byId("detailprodName").value=thisObj.detailFloatProdData[2];
						 									dojo.byId("detailcode").value=thisObj.detailFloatProdData[3];
						 									dojo.byId("detailprice").value=thisObj.detailFloatProdData[4];
						 									 dojo.byId("detaildatef").value=dojo.date.locale.parse(thisObj.detailFloatProdData[5],{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" });
						 									dojo.byId("detailprodType").value=thisObj.detailFloatProdData[6];
						 			 
								dojo.byId("detailprodCust").value=thisObj.detailFloatProdData[7][2];
											dojo.byId("detailprincipal").value=thisObj.detailFloatProdData[8][2];
							
		
	},300);

},

ProdVOtoArray_fun:function(ulvo,edit){
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
                        
                        items[2] = ulo["ns:prodName"];//
                        items[3] = ulo["ns:code"];//
                        t=ulo["ns:price"];if(t!=null&&t!=undefined){items[4] =  isNaN(t['ns:upNumber'])?'':t['ns:upNumber'];}
                        t=ulo["ns:datef"];if(t!=null&&t!=undefined){items[5] = t['ns:upDate'];}
                        items[6] = ulo["ns:prodType"];//
                         items[7] = this.CustomerVOtoArray_fun(ulo["ns:prodCust"],edit);
                         items[8] = this.PeoplesVOtoArray_fun(ulo["ns:principal"],edit);
items[9] = ulo["ns:selected"];
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
                        
                        items[2] = ulo["ns:prodName"];//
                        items[3] = ulo["ns:code"];//
                        t=ulo["ns:price"];if(t!=null&&t!=undefined){items[4] =  isNaN(t['ns:upNumber'])?0:t['ns:upNumber'];}
                        t=ulo["ns:datef"];if(t!=null&&t!=undefined){
                        d=dojo.date.locale.parse(new String( t['ns:upDate']),{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" });}
                        items[5] = d;
                        items[6] = d;                        
                        items[7] = ulo["ns:prodType"];//
                         items[8] = this.CustomerVOtoArray_fun(ulo["ns:prodCust"],edit);
                         items[9] = this.PeoplesVOtoArray_fun(ulo["ns:principal"],edit);
				items[10] = ulo["ns:selected"];
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
		

initProd:function (){ 
	var thisObj=this;
	var urle = getUrl()+ "services/BasicManageService"; 
				thisObj.initCustomer();
					thisObj.initPeoples();
	if(this.prodCustStore==''){
	var pprodCust = new SOAPClientParameters();
	var itemsprodCust = new Array();  
		pprodCust.add('CustomerVO',new Object()) ;
		pprodCust.add('pageNumber',0) ;
		pprodCust.add('pageSize',0) ;
	    pprodCust.add('orderBy','0') ;
	SOAPClient.invoke(getUrl()+ "services/"+"CustomerManageService","getCustomer", pprodCust, false,  function GetEnu_callBack(ul, soapResponse){      
				var tempData=thisObj.CustomerVOtoArray_fun(ul,false);
				for(var i = 0; i < tempData.length-1; i++){		
				  itemsprodCust.push({name: tempData[i][2], value:tempData[i][1]});
				}                
	});       
	if(itemsprodCust.length==0)itemsprodCust.push({name:'' , value:''});
	this.prodCustStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemsprodCust }});
}

if(this.principalStore==''){
	var pprincipal = new SOAPClientParameters();
	var itemsprincipal = new Array();  
		pprincipal.add('PeoplesVO',new Object()) ;
		pprincipal.add('pageNumber',0) ;
		pprincipal.add('pageSize',0) ;
	    pprincipal.add('orderBy','0') ;
	SOAPClient.invoke(getUrl()+ "services/"+"PeoplesManageService","getPeoples", pprincipal, false,  function GetEnu_callBack(ul, soapResponse){      
				var tempData=thisObj.PeoplesVOtoArray_fun(ul,false);
				for(var i = 0; i < tempData.length-1; i++){		
				  itemsprincipal.push({name: tempData[i][2], value:tempData[i][1]});
				}                
	});       
	if(itemsprincipal.length==0)itemsprincipal.push({name:'' , value:''});
	this.principalStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemsprincipal }});
}


						}
});
}

