if(!dojo._hasResource["projectDojo.Contact"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["projectDojo.Contact"] = true;
dojo.provide("projectDojo.Contact");

dojo.require("projectDojo.Customer");
dojo.declare("projectDojo.Contact",
[
				 projectDojo.Customer
			],
{
	noContact:'',
	selectContactIDs:'',
	oldFloatContact:'',
	selectContactInRow:'',
	ifMultContact:0,
	mainRowIndexContact:'',
	oldDetailFloatContact:'',
	detailFloatContactData:'',
	customerStore:''	,


selectContact:function (myID,inrow,ContactColNo,ifMultContact,e,mainRowIndex){
	var floath=e.screenY-window.screen.availHeight+document.body.clientHeight+30;
	if(floath+255>document.body.clientHeight)floath=floath-255;
	var floatw=e.screenX;
	if(e.screenX+505>document.body.clientWidth)floatw=floatw-500;
		this.selectContactInRow=inrow;
		this.noContact=ContactColNo;
		this.selectContactIDs=myID;
		//ifMult=ifMults;
		this.mainRowIndexContact=mainRowIndex;
		this.oldFloatContact = dijit.byId("selectContactFloat_1");
		dojoContactSelect=this;
		if(this.oldFloatContact==undefined){
			var div = dojo.doc.createElement('div');
			dojo.body().appendChild(div);
			var fp = new dojox.layout.FloatingPane({id:"selectContactFloat_1",title:"selectFloat",//title:i18nStr.selectContact,
				maxable: true,closable: true,resizable: true ,dockable:true,
				href:"../common/selectContactFloat.html"},div);
			dojo.style(fp.domNode,{
				width:"500px",height:"300px",top:floath, left:floatw,position:"absolute",zIndex:"980"});//255
			this.oldFloatContact=fp;
			fp.startup();
			fp.show();
			
		}else{
			dojo.style(this.oldFloatContact.domNode,{width:"500px",height:"300px",//255
				top:floath, left:floatw,
				position:"absolute",zIndex:"980"});
			this.oldFloatContact.show();
			dijit.byId("gridIncContact").model.setData(querydataIncContact); 
		}
},
					
 //rowinum=0
detailContact:function (myID,inrow,ContactColNo,ifMultContact,e,mainRowIndex){
	var floath=e.screenY-window.screen.availHeight+document.body.clientHeight+30;
	if(floath+255>document.body.clientHeight)floath=floath-255;
	var floatw=e.screenX;
	if(e.screenX+505>document.body.clientWidth)floatw=floatw-500;
		//this.selectContactInRow=inrow;
		//this.noContact=ContactColNo;
		//this.selectContactIDs=myID;
		//ifMult=ifMults;
		//this.mainRowIndexContact=mainRowIndex;
		this.oldDetailFloatContact = dijit.byId("detailContactFloat_1");
		//dojoContactdetail=this;
		if(this.oldDetailFloatContact==undefined){
			var div = dojo.doc.createElement('div');
			dojo.body().appendChild(div);
			var fp = new dojox.layout.FloatingPane({id:"detailContactFloat_1",title:"detailFloat",//title:i18nStr.selectContact,
				maxable: true,closable: true,resizable: true ,dockable:true,
				href:"../common/detailContactFloat.html"},div);
			dojo.style(fp.domNode,{
				width:"600px",height:"55px",top:floath, left:floatw,position:"absolute",zIndex:"980"});//255
			this.oldDetailFloatContact=fp;
			fp.startup();
			fp.show();
			
		}else{
			dojo.style(this.oldDetailFloatContact.domNode,{width:"600px",height:"55px",//255
				top:floath, left:floatw,
				position:"absolute",zIndex:"980"});
			this.oldDetailFloatContact.show();
			//dijit.byId("gridIncContact").model.setData(querydataIncContact); 
		}
	
	//var querydataContactDetail= setDetailFloatFun(inrow,ContactColNo);	
	var thisObj=this;
	setTimeout(function(){
													dojo.byId("detailcodeContact").value=thisObj.detailFloatContactData[2];
						 			 
								dojo.byId("detailcustomer").value=thisObj.detailFloatContactData[3][2];
							
		
	},300);

},

ContactVOtoArray_fun:function(ulvo,edit){
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
                        
                        items[2] = ulo["ns:codeContact"];//
                         items[3] = this.CustomerVOtoArray_fun(ulo["ns:customer"],edit);
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
                        
                        items[2] = ulo["ns:codeContact"];//
                         items[3] = this.CustomerVOtoArray_fun(ulo["ns:customer"],edit);
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
		

initContact:function (){ 
	var thisObj=this;
	var urle = getUrl()+ "services/BasicManageService"; 
				thisObj.initCustomer();
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


		}
});
}

