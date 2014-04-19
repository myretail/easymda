if(!dojo._hasResource["projectDojo.OrgaPeoples"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["projectDojo.OrgaPeoples"] = true;
dojo.provide("projectDojo.OrgaPeoples");

dojo.require("projectDojo.Orga");
dojo.require("projectDojo.Peoples");
dojo.declare("projectDojo.OrgaPeoples",
[
				 projectDojo.Orga
							, projectDojo.Peoples
			],
{
	noOrgaPeoples:'',
	selectOrgaPeoplesIDs:'',
	oldFloatOrgaPeoples:'',
	selectOrgaPeoplesInRow:'',
	ifMultOrgaPeoples:0,
	mainRowIndexOrgaPeoples:'',
	oldDetailFloatOrgaPeoples:'',
	detailFloatOrgaPeoplesData:'',
	orgaStore:''	,
	peopleStore:''	,


selectOrgaPeoples:function (myID,inrow,OrgaPeoplesColNo,ifMultOrgaPeoples,e,mainRowIndex){
	var floath=e.screenY-window.screen.availHeight+document.body.clientHeight+30;
	if(floath+255>document.body.clientHeight)floath=floath-255;
	var floatw=e.screenX;
	if(e.screenX+505>document.body.clientWidth)floatw=floatw-500;
		this.selectOrgaPeoplesInRow=inrow;
		this.noOrgaPeoples=OrgaPeoplesColNo;
		this.selectOrgaPeoplesIDs=myID;
		//ifMult=ifMults;
		this.mainRowIndexOrgaPeoples=mainRowIndex;
		this.oldFloatOrgaPeoples = dijit.byId("selectOrgaPeoplesFloat_1");
		dojoOrgaPeoplesSelect=this;
		if(this.oldFloatOrgaPeoples==undefined){
			var div = dojo.doc.createElement('div');
			dojo.body().appendChild(div);
			var fp = new dojox.layout.FloatingPane({id:"selectOrgaPeoplesFloat_1",title:"selectFloat",//title:i18nStr.selectOrgaPeoples,
				maxable: true,closable: true,resizable: true ,dockable:true,
				href:"../common/selectOrgaPeoplesFloat.html"},div);
			dojo.style(fp.domNode,{
				width:"500px",height:"300px",top:floath, left:floatw,position:"absolute",zIndex:"980"});//255
			this.oldFloatOrgaPeoples=fp;
			fp.startup();
			fp.show();
			
		}else{
			dojo.style(this.oldFloatOrgaPeoples.domNode,{width:"500px",height:"300px",//255
				top:floath, left:floatw,
				position:"absolute",zIndex:"980"});
			this.oldFloatOrgaPeoples.show();
			dijit.byId("gridIncOrgaPeoples").model.setData(querydataIncOrgaPeoples); 
		}
},
					
 //rowinum=0
detailOrgaPeoples:function (myID,inrow,OrgaPeoplesColNo,ifMultOrgaPeoples,e,mainRowIndex){
	var floath=e.screenY-window.screen.availHeight+document.body.clientHeight+30;
	if(floath+255>document.body.clientHeight)floath=floath-255;
	var floatw=e.screenX;
	if(e.screenX+505>document.body.clientWidth)floatw=floatw-500;
		//this.selectOrgaPeoplesInRow=inrow;
		//this.noOrgaPeoples=OrgaPeoplesColNo;
		//this.selectOrgaPeoplesIDs=myID;
		//ifMult=ifMults;
		//this.mainRowIndexOrgaPeoples=mainRowIndex;
		this.oldDetailFloatOrgaPeoples = dijit.byId("detailOrgaPeoplesFloat_1");
		//dojoOrgaPeoplesdetail=this;
		if(this.oldDetailFloatOrgaPeoples==undefined){
			var div = dojo.doc.createElement('div');
			dojo.body().appendChild(div);
			var fp = new dojox.layout.FloatingPane({id:"detailOrgaPeoplesFloat_1",title:"detailFloat",//title:i18nStr.selectOrgaPeoples,
				maxable: true,closable: true,resizable: true ,dockable:true,
				href:"../common/detailOrgaPeoplesFloat.html"},div);
			dojo.style(fp.domNode,{
				width:"600px",height:"55px",top:floath, left:floatw,position:"absolute",zIndex:"980"});//255
			this.oldDetailFloatOrgaPeoples=fp;
			fp.startup();
			fp.show();
			
		}else{
			dojo.style(this.oldDetailFloatOrgaPeoples.domNode,{width:"600px",height:"55px",//255
				top:floath, left:floatw,
				position:"absolute",zIndex:"980"});
			this.oldDetailFloatOrgaPeoples.show();
			//dijit.byId("gridIncOrgaPeoples").model.setData(querydataIncOrgaPeoples); 
		}
	
	//var querydataOrgaPeoplesDetail= setDetailFloatFun(inrow,OrgaPeoplesColNo);	
	var thisObj=this;
	setTimeout(function(){
							 
								dojo.byId("detailorga").value=thisObj.detailFloatOrgaPeoplesData[2][2];
											dojo.byId("detailpeople").value=thisObj.detailFloatOrgaPeoplesData[3][2];
							
		
	},300);

},

OrgaPeoplesVOtoArray_fun:function(ulvo,edit){
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
                        
                         items[2] = this.OrgaVOtoArray_fun(ulo["ns:orga"],edit);
                         items[3] = this.PeoplesVOtoArray_fun(ulo["ns:people"],edit);
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
                        
                         items[2] = this.OrgaVOtoArray_fun(ulo["ns:orga"],edit);
                         items[3] = this.PeoplesVOtoArray_fun(ulo["ns:people"],edit);
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
		

initOrgaPeoples:function (){ 
	var thisObj=this;
	var urle = getUrl()+ "services/BasicManageService"; 
				thisObj.initOrga();
					thisObj.initPeoples();
	if(this.orgaStore==''){
	var porga = new SOAPClientParameters();
	var itemsorga = new Array();  
		porga.add('OrgaVO',new Object()) ;
		porga.add('pageNumber',0) ;
		porga.add('pageSize',0) ;
	    porga.add('orderBy','0') ;
	SOAPClient.invoke(getUrl()+ "services/"+"OrgaManageService","getOrga", porga, false,  function GetEnu_callBack(ul, soapResponse){      
				var tempData=thisObj.OrgaVOtoArray_fun(ul,false);
				for(var i = 0; i < tempData.length-1; i++){		
				  itemsorga.push({name: tempData[i][2], value:tempData[i][1]});
				}                
	});       
	if(itemsorga.length==0)itemsorga.push({name:'' , value:''});
	this.orgaStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemsorga }});
}

if(this.peopleStore==''){
	var ppeople = new SOAPClientParameters();
	var itemspeople = new Array();  
		ppeople.add('PeoplesVO',new Object()) ;
		ppeople.add('pageNumber',0) ;
		ppeople.add('pageSize',0) ;
	    ppeople.add('orderBy','0') ;
	SOAPClient.invoke(getUrl()+ "services/"+"PeoplesManageService","getPeoples", ppeople, false,  function GetEnu_callBack(ul, soapResponse){      
				var tempData=thisObj.PeoplesVOtoArray_fun(ul,false);
				for(var i = 0; i < tempData.length-1; i++){		
				  itemspeople.push({name: tempData[i][2], value:tempData[i][1]});
				}                
	});       
	if(itemspeople.length==0)itemspeople.push({name:'' , value:''});
	this.peopleStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemspeople }});
}


	}
});
}

