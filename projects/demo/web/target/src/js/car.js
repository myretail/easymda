if(!dojo._hasResource["projectDojo.car"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["projectDojo.car"] = true;
dojo.provide("projectDojo.car");

dojo.declare("projectDojo.car",
null,
{
	nocar:'',
	selectcarIDs:'',
	oldFloatcar:'',
	selectcarInRow:'',
	ifMultcar:0,
	mainRowIndexcar:'',
	oldDetailFloatcar:'',
	detailFloatcarData:'',


selectcar:function (myID,inrow,carColNo,ifMultcar,e,mainRowIndex){
	var floath=e.screenY-window.screen.availHeight+document.body.clientHeight+30;
	if(floath+255>document.body.clientHeight)floath=floath-255;
	var floatw=e.screenX;
	if(e.screenX+505>document.body.clientWidth)floatw=floatw-500;
		this.selectcarInRow=inrow;
		this.nocar=carColNo;
		this.selectcarIDs=myID;
		//ifMult=ifMults;
		this.mainRowIndexcar=mainRowIndex;
		this.oldFloatcar = dijit.byId("selectcarFloat_1");
		dojocarSelect=this;
		if(this.oldFloatcar==undefined){
			var div = dojo.doc.createElement('div');
			dojo.body().appendChild(div);
			var fp = new dojox.layout.FloatingPane({id:"selectcarFloat_1",title:"selectFloat",//title:i18nStr.selectcar,
				maxable: true,closable: true,resizable: true ,dockable:true,
				href:"../common/selectcarFloat.html"},div);
			dojo.style(fp.domNode,{
				width:"500px",height:"300px",top:floath, left:floatw,position:"absolute",zIndex:"980"});//255
			this.oldFloatcar=fp;
			fp.startup();
			fp.show();
			
		}else{
			dojo.style(this.oldFloatcar.domNode,{width:"500px",height:"300px",//255
				top:floath, left:floatw,
				position:"absolute",zIndex:"980"});
			this.oldFloatcar.show();
			dijit.byId("gridInccar").model.setData(querydataInccar); 
		}
},
			
 //rowinum=0
detailcar:function (myID,inrow,carColNo,ifMultcar,e,mainRowIndex){
	var floath=e.screenY-window.screen.availHeight+document.body.clientHeight+30;
	if(floath+255>document.body.clientHeight)floath=floath-255;
	var floatw=e.screenX;
	if(e.screenX+505>document.body.clientWidth)floatw=floatw-500;
		//this.selectcarInRow=inrow;
		//this.nocar=carColNo;
		//this.selectcarIDs=myID;
		//ifMult=ifMults;
		//this.mainRowIndexcar=mainRowIndex;
		this.oldDetailFloatcar = dijit.byId("detailcarFloat_1");
		//dojocardetail=this;
		if(this.oldDetailFloatcar==undefined){
			var div = dojo.doc.createElement('div');
			dojo.body().appendChild(div);
			var fp = new dojox.layout.FloatingPane({id:"detailcarFloat_1",title:"detailFloat",//title:i18nStr.selectcar,
				maxable: true,closable: true,resizable: true ,dockable:true,
				href:"../common/detailcarFloat.html"},div);
			dojo.style(fp.domNode,{
				width:"600px",height:"55px",top:floath, left:floatw,position:"absolute",zIndex:"980"});//255
			this.oldDetailFloatcar=fp;
			fp.startup();
			fp.show();
			
		}else{
			dojo.style(this.oldDetailFloatcar.domNode,{width:"600px",height:"55px",//255
				top:floath, left:floatw,
				position:"absolute",zIndex:"980"});
			this.oldDetailFloatcar.show();
			//dijit.byId("gridInccar").model.setData(querydataInccar); 
		}
	
	//var querydatacarDetail= setDetailFloatFun(inrow,carColNo);	
	var thisObj=this;
	setTimeout(function(){
													dojo.byId("detailload").value=thisObj.detailFloatcarData[2];
						 			 
				
		
	},300);

},

carVOtoArray_fun:function(ulvo,edit){
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
                        
                        t=ulo["ns:load"];if(t!=null&&t!=undefined){items[2] =  isNaN(t['ns:upNumber'])?'':t['ns:upNumber'];}
items[3] = ulo["ns:selected"];
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
                        
                        t=ulo["ns:load"];if(t!=null&&t!=undefined){items[2] =  isNaN(t['ns:upNumber'])?0:t['ns:upNumber'];}
				items[3] = ulo["ns:selected"];
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
		

initcar:function (){ 
	var thisObj=this;
	var urle = getUrl()+ "services/BasicManageService"; 

		}
});
}

