
if(!dojo._hasResource["projectDojo.subOrderRowd"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["projectDojo.subOrderRowd"] = true;
dojo.provide("projectDojo.subOrderRowd");

dojo.require("projectDojo.Prod");
dojo.declare("projectDojo.subOrderRowd",
[
														 projectDojo.Prod
			]
,

{
	noOrderRowd:'',
	selectOrderRowdIDs:'',
	oldFloatOrderRowd:'',
	selectOrderRowdInRow:'',
	ifMultOrderRowd:0,
	mainRowIndexOrderRowd:'',
	oldDetailFloatOrderRowd:'',
	detailFloatOrderRowdData:'',
	orderStore:''	,
	productStore:''	,


selectOrderRowd:function (myID,inrow,OrderRowdColNo,ifMultOrderRowd,e,mainRowIndex){
	var floath=e.screenY-window.screen.availHeight+document.body.clientHeight+30;
	if(floath+255>document.body.clientHeight)floath=floath-255;
	var floatw=e.screenX;
	if(e.screenX+505>document.body.clientWidth)floatw=floatw-500;
		this.selectOrderRowdInRow=inrow;
		this.noOrderRowd=OrderRowdColNo;
		this.selectOrderRowdIDs=myID;
		//ifMult=ifMults;
		this.mainRowIndexOrderRowd=mainRowIndex;
		this.oldFloatOrderRowd = dijit.byId("selectOrderRowdFloat_1");
		dojoOrderRowdSelect=this;
		if(this.oldFloatOrderRowd==undefined){
			var div = dojo.doc.createElement('div');
			dojo.body().appendChild(div);
			var fp = new dojox.layout.FloatingPane({id:"selectOrderRowdFloat_1",title:"selectFloat",//title:i18nStr.selectOrderRowd,
				maxable: true,closable: true,resizable: true ,dockable:true,
				href:"../common/selectOrderRowdFloat.html"},div);
			dojo.style(fp.domNode,{
				width:"500px",height:"300px",top:floath, left:floatw,position:"absolute",zIndex:"980"});//255
			this.oldFloatOrderRowd=fp;
			fp.startup();
			fp.show();
			
		}else{
			dojo.style(this.oldFloatOrderRowd.domNode,{width:"500px",height:"300px",//255
				top:floath, left:floatw,
				position:"absolute",zIndex:"980"});
			this.oldFloatOrderRowd.show();
			dijit.byId("gridIncOrderRowd").model.setData(querydataIncOrderRowd); 
		}
},
																									
 //rowinum=4
detailOrderRowd:function (myID,inrow,OrderRowdColNo,ifMultOrderRowd,e,mainRowIndex){
	var floath=e.screenY-window.screen.availHeight+document.body.clientHeight+30;
	if(floath+255>document.body.clientHeight)floath=floath-255;
	var floatw=e.screenX;
	if(e.screenX+505>document.body.clientWidth)floatw=floatw-500;
		//this.selectOrderRowdInRow=inrow;
		//this.noOrderRowd=OrderRowdColNo;
		//this.selectOrderRowdIDs=myID;
		//ifMult=ifMults;
		//this.mainRowIndexOrderRowd=mainRowIndex;
		this.oldDetailFloatOrderRowd = dijit.byId("detailOrderRowdFloat_1");
		//dojoOrderRowddetail=this;
		if(this.oldDetailFloatOrderRowd==undefined){
			var div = dojo.doc.createElement('div');
			dojo.body().appendChild(div);
			var fp = new dojox.layout.FloatingPane({id:"detailOrderRowdFloat_1",title:"detailFloat",//title:i18nStr.selectOrderRowd,
				maxable: true,closable: true,resizable: true ,dockable:true,
				href:"../common/detailOrderRowdFloat.html"},div);
			dojo.style(fp.domNode,{
				width:"600px",height:"130px",top:floath, left:floatw,position:"absolute",zIndex:"980"});//255
			this.oldDetailFloatOrderRowd=fp;
			fp.startup();
			fp.show();
			
		}else{
			dojo.style(this.oldDetailFloatOrderRowd.domNode,{width:"600px",height:"130px",//255
				top:floath, left:floatw,
				position:"absolute",zIndex:"980"});
			this.oldDetailFloatOrderRowd.show();
			//dijit.byId("gridIncOrderRowd").model.setData(querydataIncOrderRowd); 
		}
	
	//var querydataOrderRowdDetail= setDetailFloatFun(inrow,OrderRowdColNo);	
	var thisObj=this;
	setTimeout(function(){
													dojo.byId("detailproductNum").value=thisObj.detailFloatOrderRowdData[2];
						 									dojo.byId("detailunitNum").value=thisObj.detailFloatOrderRowdData[3];
						 									dojo.byId("detailgoodsSuttle").value=thisObj.detailFloatOrderRowdData[4];
						 									dojo.byId("detailgoodsWeight").value=thisObj.detailFloatOrderRowdData[5];
						 									dojo.byId("detailgoodsVolume").value=thisObj.detailFloatOrderRowdData[6];
						 									dojo.byId("detaillabel").value=thisObj.detailFloatOrderRowdData[7];
						 									dojo.byId("detailcarriage").value=thisObj.detailFloatOrderRowdData[8];
						 									dojo.byId("detailespecial").value=thisObj.detailFloatOrderRowdData[9];
						 									dojo.byId("detailgoodsState").value=thisObj.detailFloatOrderRowdData[10];
						 									dojo.byId("detailremark").value=thisObj.detailFloatOrderRowdData[11];
						 			 
								dojo.byId("detailorder").value=thisObj.detailFloatOrderRowdData[12][2];
											dojo.byId("detailproduct").value=thisObj.detailFloatOrderRowdData[13][2];
							
		
	},300);

},
OrderRowdVOtoArray_fun:function(ulvo,edit){
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
                        
                        t=ulo["ns:productNum"];if(t!=null&&t!=undefined){items[2] =  isNaN(t['ns:upNumber'])?'':t['ns:upNumber'];}
                        t=ulo["ns:unitNum"];if(t!=null&&t!=undefined){items[3] =  isNaN(t['ns:upNumber'])?'':t['ns:upNumber'];}
                        t=ulo["ns:goodsSuttle"];if(t!=null&&t!=undefined){items[4] =  isNaN(t['ns:upNumber'])?'':t['ns:upNumber'];}
                        t=ulo["ns:goodsWeight"];if(t!=null&&t!=undefined){items[5] =  isNaN(t['ns:upNumber'])?'':t['ns:upNumber'];}
                        t=ulo["ns:goodsVolume"];if(t!=null&&t!=undefined){items[6] =  isNaN(t['ns:upNumber'])?'':t['ns:upNumber'];}
                        items[7] = ulo["ns:label"];//
                        t=ulo["ns:carriage"];if(t!=null&&t!=undefined){items[8] =  isNaN(t['ns:upNumber'])?'':t['ns:upNumber'];}
                        items[9] = ulo["ns:especial"];//
                        items[10] = ulo["ns:goodsState"];//
                        items[11] = ulo["ns:remark"];//
                         items[12] = this.OrderdVOtoArray_fun(ulo["ns:order"],edit);
                         items[13] = this.ProdVOtoArray_fun(ulo["ns:product"],edit);
				items[14] = ulo["ns:selected"];
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
                        
                        t=ulo["ns:productNum"];if(t!=null&&t!=undefined){items[2] =  isNaN(t['ns:upNumber'])?0:t['ns:upNumber'];}
                        t=ulo["ns:unitNum"];if(t!=null&&t!=undefined){items[3] =  isNaN(t['ns:upNumber'])?0:t['ns:upNumber'];}
                        t=ulo["ns:goodsSuttle"];if(t!=null&&t!=undefined){items[4] =  isNaN(t['ns:upNumber'])?0:t['ns:upNumber'];}
                        t=ulo["ns:goodsWeight"];if(t!=null&&t!=undefined){items[5] =  isNaN(t['ns:upNumber'])?0:t['ns:upNumber'];}
                        t=ulo["ns:goodsVolume"];if(t!=null&&t!=undefined){items[6] =  isNaN(t['ns:upNumber'])?0:t['ns:upNumber'];}
                        items[7] = ulo["ns:label"];//
                        t=ulo["ns:carriage"];if(t!=null&&t!=undefined){items[8] =  isNaN(t['ns:upNumber'])?0:t['ns:upNumber'];}
                        items[9] = ulo["ns:especial"];//
                        items[10] = ulo["ns:goodsState"];//
                        items[11] = ulo["ns:remark"];//
                         items[12] = this.OrderdVOtoArray_fun(ulo["ns:order"],edit);
                         items[13] = this.ProdVOtoArray_fun(ulo["ns:product"],edit);
					items[14] = ulo["ns:selected"];
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
		

initOrderRowd:function (){ 
	var thisObj=this;
	var urle = getUrl()+ "services/BasicManageService"; 
														thisObj.initProd();
	if(this.orderStore==''){
	var porder = new SOAPClientParameters();
	var itemsorder = new Array();  
		porder.add('OrderdVO',new Object()) ;
		porder.add('pageNumber',0) ;
		porder.add('pageSize',0) ;
	    porder.add('orderBy','0') ;
	SOAPClient.invoke(getUrl()+ "services/"+"OrderdManageService","getOrderd", porder, false,  function GetEnu_callBack(ul, soapResponse){      
				var tempData=thisObj.OrderdVOtoArray_fun(ul,false);
				for(var i = 0; i < tempData.length-1; i++){		
				  itemsorder.push({name: tempData[i][2], value:tempData[i][1]});
				}                
	});       
	if(itemsorder.length==0)itemsorder.push({name:'' , value:''});
	this.orderStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemsorder }});
}

if(this.productStore==''){
	var pproduct = new SOAPClientParameters();
	var itemsproduct = new Array();  
		pproduct.add('ProdVO',new Object()) ;
		pproduct.add('pageNumber',0) ;
		pproduct.add('pageSize',0) ;
	    pproduct.add('orderBy','0') ;
	SOAPClient.invoke(getUrl()+ "services/"+"ProdManageService","getProd", pproduct, false,  function GetEnu_callBack(ul, soapResponse){      
				var tempData=thisObj.ProdVOtoArray_fun(ul,false);
				for(var i = 0; i < tempData.length-1; i++){		
				  itemsproduct.push({name: tempData[i][2], value:tempData[i][1]});
				}                
	});       
	if(itemsproduct.length==0)itemsproduct.push({name:'' , value:''});
	this.productStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemsproduct }});
}


											}


});
}
