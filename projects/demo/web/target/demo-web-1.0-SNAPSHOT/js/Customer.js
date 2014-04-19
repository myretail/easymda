if(!dojo._hasResource["projectDojo.Customer"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["projectDojo.Customer"] = true;
dojo.provide("projectDojo.Customer");

dojo.declare("projectDojo.Customer",
null,
{
	noCustomer:'',
	selectCustomerIDs:'',
	oldFloatCustomer:'',
	selectCustomerInRow:'',
	ifMultCustomer:0,
	mainRowIndexCustomer:'',
	oldDetailFloatCustomer:'',
	detailFloatCustomerData:'',

	custEnumStore:''	,
	itemcustEnumOption:'' ,

selectCustomer:function (myID,inrow,CustomerColNo,ifMultCustomer,e,mainRowIndex){
	var floath=e.screenY-window.screen.availHeight+document.body.clientHeight+30;
	if(floath+255>document.body.clientHeight)floath=floath-255;
	var floatw=e.screenX;
	if(e.screenX+505>document.body.clientWidth)floatw=floatw-500;
		this.selectCustomerInRow=inrow;
		this.noCustomer=CustomerColNo;
		this.selectCustomerIDs=myID;
		//ifMult=ifMults;
		this.mainRowIndexCustomer=mainRowIndex;
		this.oldFloatCustomer = dijit.byId("selectCustomerFloat_1");
		dojoCustomerSelect=this;
		if(this.oldFloatCustomer==undefined){
			var div = dojo.doc.createElement('div');
			dojo.body().appendChild(div);
			var fp = new dojox.layout.FloatingPane({id:"selectCustomerFloat_1",title:"selectFloat",//title:i18nStr.selectCustomer,
				maxable: true,closable: true,resizable: true ,dockable:true,
				href:"../common/selectCustomerFloat.html"},div);
			dojo.style(fp.domNode,{
				width:"500px",height:"300px",top:floath, left:floatw,position:"absolute",zIndex:"980"});//255
			this.oldFloatCustomer=fp;
			fp.startup();
			fp.show();
			
		}else{
			dojo.style(this.oldFloatCustomer.domNode,{width:"500px",height:"300px",//255
				top:floath, left:floatw,
				position:"absolute",zIndex:"980"});
			this.oldFloatCustomer.show();
			dijit.byId("gridIncCustomer").model.setData(querydataIncCustomer); 
		}
},
					
 //rowinum=0
detailCustomer:function (myID,inrow,CustomerColNo,ifMultCustomer,e,mainRowIndex){
	var floath=e.screenY-window.screen.availHeight+document.body.clientHeight+30;
	if(floath+255>document.body.clientHeight)floath=floath-255;
	var floatw=e.screenX;
	if(e.screenX+505>document.body.clientWidth)floatw=floatw-500;
		//this.selectCustomerInRow=inrow;
		//this.noCustomer=CustomerColNo;
		//this.selectCustomerIDs=myID;
		//ifMult=ifMults;
		//this.mainRowIndexCustomer=mainRowIndex;
		this.oldDetailFloatCustomer = dijit.byId("detailCustomerFloat_1");
		//dojoCustomerdetail=this;
		if(this.oldDetailFloatCustomer==undefined){
			var div = dojo.doc.createElement('div');
			dojo.body().appendChild(div);
			var fp = new dojox.layout.FloatingPane({id:"detailCustomerFloat_1",title:"detailFloat",//title:i18nStr.selectCustomer,
				maxable: true,closable: true,resizable: true ,dockable:true,
				href:"../common/detailCustomerFloat.html"},div);
			dojo.style(fp.domNode,{
				width:"600px",height:"55px",top:floath, left:floatw,position:"absolute",zIndex:"980"});//255
			this.oldDetailFloatCustomer=fp;
			fp.startup();
			fp.show();
			
		}else{
			dojo.style(this.oldDetailFloatCustomer.domNode,{width:"600px",height:"55px",//255
				top:floath, left:floatw,
				position:"absolute",zIndex:"980"});
			this.oldDetailFloatCustomer.show();
			//dijit.byId("gridIncCustomer").model.setData(querydataIncCustomer); 
		}
	
	//var querydataCustomerDetail= setDetailFloatFun(inrow,CustomerColNo);	
	var thisObj=this;
	setTimeout(function(){
													dojo.byId("detailcustomerName").value=thisObj.detailFloatCustomerData[2];
						 									dojo.byId("detailcustEnum").value=thisObj.detailFloatCustomerData[3];
						 			 
				
		
	},300);

},

CustomerVOtoArray_fun:function(ulvo,edit){
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
                        
                        items[2] = ulo["ns:customerName"];//
                        items[3] = ulo["ns:custEnum"];//
items[4] = ulo["ns:selected"];
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
                        
                        items[2] = ulo["ns:customerName"];//
                        items[3] = ulo["ns:custEnum"];//
				items[4] = ulo["ns:selected"];
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
		

initCustomer:function (){ 
	var thisObj=this;
	var urle = getUrl()+ "services/BasicManageService"; 

					var pcustEnum = new SOAPClientParameters();
			pcustEnum.add('eType','custEnum');
			var itemcustEnum = new Array();
			this.itemcustEnumOption = new Array();
				SOAPClient.invoke(urle, "getEnumerationByType", pcustEnum, false,  function GetEnu_callBack(ul, soapResponse){   
				for(var i = 0; i < ul.length; i++){		
				  var ulo=ul[i];
				  itemcustEnum.push({name: ulo["ns:fieldName"], value:ulo["ns:fieldName"]});
				  thisObj.itemcustEnumOption.push(ulo["ns:fieldName"]);
				}                
			});       
			if(itemcustEnum.length==0)itemcustEnum.push({name:'' , value:''});
			this.custEnumStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemcustEnum}}); 
		}
});
}

