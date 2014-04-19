if(!dojo._hasResource["projectDojo.Orga"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["projectDojo.Orga"] = true;
dojo.provide("projectDojo.Orga");

dojo.declare("projectDojo.Orga",
null,
{
	noOrga:'',
	selectOrgaIDs:'',
	oldFloatOrga:'',
	selectOrgaInRow:'',
	ifMultOrga:0,
	mainRowIndexOrga:'',
	oldDetailFloatOrga:'',
	detailFloatOrgaData:'',


selectOrga:function (myID,inrow,OrgaColNo,ifMultOrga,e,mainRowIndex){
	var floath=e.screenY-window.screen.availHeight+document.body.clientHeight+30;
	if(floath+255>document.body.clientHeight)floath=floath-255;
	var floatw=e.screenX;
	if(e.screenX+505>document.body.clientWidth)floatw=floatw-500;
		this.selectOrgaInRow=inrow;
		this.noOrga=OrgaColNo;
		this.selectOrgaIDs=myID;
		//ifMult=ifMults;
		this.mainRowIndexOrga=mainRowIndex;
		this.oldFloatOrga = dijit.byId("selectOrgaFloat_1");
		dojoOrgaSelect=this;
		if(this.oldFloatOrga==undefined){
			var div = dojo.doc.createElement('div');
			dojo.body().appendChild(div);
			var fp = new dojox.layout.FloatingPane({id:"selectOrgaFloat_1",title:"selectFloat",//title:i18nStr.selectOrga,
				maxable: true,closable: true,resizable: true ,dockable:true,
				href:"../common/selectOrgaFloat.html"},div);
			dojo.style(fp.domNode,{
				width:"500px",height:"300px",top:floath, left:floatw,position:"absolute",zIndex:"980"});//255
			this.oldFloatOrga=fp;
			fp.startup();
			fp.show();
			
		}else{
			dojo.style(this.oldFloatOrga.domNode,{width:"500px",height:"300px",//255
				top:floath, left:floatw,
				position:"absolute",zIndex:"980"});
			this.oldFloatOrga.show();
			dijit.byId("gridIncOrga").model.setData(querydataIncOrga); 
		}
},
											
 //rowinum=1
detailOrga:function (myID,inrow,OrgaColNo,ifMultOrga,e,mainRowIndex){
	var floath=e.screenY-window.screen.availHeight+document.body.clientHeight+30;
	if(floath+255>document.body.clientHeight)floath=floath-255;
	var floatw=e.screenX;
	if(e.screenX+505>document.body.clientWidth)floatw=floatw-500;
		//this.selectOrgaInRow=inrow;
		//this.noOrga=OrgaColNo;
		//this.selectOrgaIDs=myID;
		//ifMult=ifMults;
		//this.mainRowIndexOrga=mainRowIndex;
		this.oldDetailFloatOrga = dijit.byId("detailOrgaFloat_1");
		//dojoOrgadetail=this;
		if(this.oldDetailFloatOrga==undefined){
			var div = dojo.doc.createElement('div');
			dojo.body().appendChild(div);
			var fp = new dojox.layout.FloatingPane({id:"detailOrgaFloat_1",title:"detailFloat",//title:i18nStr.selectOrga,
				maxable: true,closable: true,resizable: true ,dockable:true,
				href:"../common/detailOrgaFloat.html"},div);
			dojo.style(fp.domNode,{
				width:"600px",height:"80px",top:floath, left:floatw,position:"absolute",zIndex:"980"});//255
			this.oldDetailFloatOrga=fp;
			fp.startup();
			fp.show();
			
		}else{
			dojo.style(this.oldDetailFloatOrga.domNode,{width:"600px",height:"80px",//255
				top:floath, left:floatw,
				position:"absolute",zIndex:"980"});
			this.oldDetailFloatOrga.show();
			//dijit.byId("gridIncOrga").model.setData(querydataIncOrga); 
		}
	
	//var querydataOrgaDetail= setDetailFloatFun(inrow,OrgaColNo);	
	var thisObj=this;
	setTimeout(function(){
													dojo.byId("detailorgaName").value=thisObj.detailFloatOrgaData[2];
						 									dojo.byId("detailorgaCode").value=thisObj.detailFloatOrgaData[3];
						 									dojo.byId("detailsno").value=thisObj.detailFloatOrgaData[4];
						 									dojo.byId("detailremark").value=thisObj.detailFloatOrgaData[5];
						 									dojo.byId("detailparentId").value=thisObj.detailFloatOrgaData[6];
						 			 
				
		
	},300);

},

OrgaVOtoArray_fun:function(ulvo,edit){
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
                        
                        items[2] = ulo["ns:orgaName"];//
                        items[3] = ulo["ns:orgaCode"];//
                        items[4] = ulo["ns:sno"];//
                        items[5] = ulo["ns:remark"];//
                        t=ulo["ns:parentId"];if(t!=null&&t!=undefined){items[6] =  isNaN(t['ns:upNumber'])?'':t['ns:upNumber'];}
items[7] = ulo["ns:selected"];
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
                        
                        items[2] = ulo["ns:orgaName"];//
                        items[3] = ulo["ns:orgaCode"];//
                        items[4] = ulo["ns:sno"];//
                        items[5] = ulo["ns:remark"];//
                        t=ulo["ns:parentId"];if(t!=null&&t!=undefined){items[6] =  isNaN(t['ns:upNumber'])?0:t['ns:upNumber'];}
				items[7] = ulo["ns:selected"];
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
		

initOrga:function (){ 
	var thisObj=this;
	var urle = getUrl()+ "services/BasicManageService"; 

						}
});
}

