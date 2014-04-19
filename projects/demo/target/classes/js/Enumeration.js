if(!dojo._hasResource["projectDojo.Enumeration"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["projectDojo.Enumeration"] = true;
dojo.provide("projectDojo.Enumeration");

dojo.declare("projectDojo.Enumeration",
null,
{
	noEnumeration:'',
	selectEnumerationIDs:'',
	oldFloatEnumeration:'',
	selectEnumerationInRow:'',
	ifMultEnumeration:0,
	mainRowIndexEnumeration:'',
	oldDetailFloatEnumeration:'',
	detailFloatEnumerationData:'',


selectEnumeration:function (myID,inrow,EnumerationColNo,ifMultEnumeration,e,mainRowIndex){
	var floath=e.screenY-window.screen.availHeight+document.body.clientHeight+30;
	if(floath+255>document.body.clientHeight)floath=floath-255;
	var floatw=e.screenX;
	if(e.screenX+505>document.body.clientWidth)floatw=floatw-500;
		this.selectEnumerationInRow=inrow;
		this.noEnumeration=EnumerationColNo;
		this.selectEnumerationIDs=myID;
		//ifMult=ifMults;
		this.mainRowIndexEnumeration=mainRowIndex;
		this.oldFloatEnumeration = dijit.byId("selectEnumerationFloat_1");
		dojoEnumerationSelect=this;
		if(this.oldFloatEnumeration==undefined){
			var div = dojo.doc.createElement('div');
			dojo.body().appendChild(div);
			var fp = new dojox.layout.FloatingPane({id:"selectEnumerationFloat_1",title:"selectFloat",//title:i18nStr.selectEnumeration,
				maxable: true,closable: true,resizable: true ,dockable:true,
				href:"../common/selectEnumerationFloat.html"},div);
			dojo.style(fp.domNode,{
				width:"500px",height:"300px",top:floath, left:floatw,position:"absolute",zIndex:"980"});//255
			this.oldFloatEnumeration=fp;
			fp.startup();
			fp.show();
			
		}else{
			dojo.style(this.oldFloatEnumeration.domNode,{width:"500px",height:"300px",//255
				top:floath, left:floatw,
				position:"absolute",zIndex:"980"});
			this.oldFloatEnumeration.show();
			dijit.byId("gridIncEnumeration").model.setData(querydataIncEnumeration); 
		}
},
					
 //rowinum=0
detailEnumeration:function (myID,inrow,EnumerationColNo,ifMultEnumeration,e,mainRowIndex){
	var floath=e.screenY-window.screen.availHeight+document.body.clientHeight+30;
	if(floath+255>document.body.clientHeight)floath=floath-255;
	var floatw=e.screenX;
	if(e.screenX+505>document.body.clientWidth)floatw=floatw-500;
		//this.selectEnumerationInRow=inrow;
		//this.noEnumeration=EnumerationColNo;
		//this.selectEnumerationIDs=myID;
		//ifMult=ifMults;
		//this.mainRowIndexEnumeration=mainRowIndex;
		this.oldDetailFloatEnumeration = dijit.byId("detailEnumerationFloat_1");
		//dojoEnumerationdetail=this;
		if(this.oldDetailFloatEnumeration==undefined){
			var div = dojo.doc.createElement('div');
			dojo.body().appendChild(div);
			var fp = new dojox.layout.FloatingPane({id:"detailEnumerationFloat_1",title:"detailFloat",//title:i18nStr.selectEnumeration,
				maxable: true,closable: true,resizable: true ,dockable:true,
				href:"../common/detailEnumerationFloat.html"},div);
			dojo.style(fp.domNode,{
				width:"600px",height:"55px",top:floath, left:floatw,position:"absolute",zIndex:"980"});//255
			this.oldDetailFloatEnumeration=fp;
			fp.startup();
			fp.show();
			
		}else{
			dojo.style(this.oldDetailFloatEnumeration.domNode,{width:"600px",height:"55px",//255
				top:floath, left:floatw,
				position:"absolute",zIndex:"980"});
			this.oldDetailFloatEnumeration.show();
			//dijit.byId("gridIncEnumeration").model.setData(querydataIncEnumeration); 
		}
	
	//var querydataEnumerationDetail= setDetailFloatFun(inrow,EnumerationColNo);	
	var thisObj=this;
	setTimeout(function(){
													dojo.byId("detailfieldName").value=thisObj.detailFloatEnumerationData[2];
						 									dojo.byId("detailenumerationType").value=thisObj.detailFloatEnumerationData[3];
						 			 
				
		
	},300);

},

EnumerationVOtoArray_fun:function(ulvo,edit){
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
                        
                        items[2] = ulo["ns:fieldName"];//
                        items[3] = ulo["ns:enumerationType"];//
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
                        
                        items[2] = ulo["ns:fieldName"];//
                        items[3] = ulo["ns:enumerationType"];//
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
		

initEnumeration:function (){ 
	var thisObj=this;
	var urle = getUrl()+ "services/BasicManageService"; 

			}
});
}

