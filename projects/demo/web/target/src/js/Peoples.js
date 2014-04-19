if(!dojo._hasResource["projectDojo.Peoples"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["projectDojo.Peoples"] = true;
dojo.provide("projectDojo.Peoples");

dojo.declare("projectDojo.Peoples",
null,
{
	noPeoples:'',
	selectPeoplesIDs:'',
	oldFloatPeoples:'',
	selectPeoplesInRow:'',
	ifMultPeoples:0,
	mainRowIndexPeoples:'',
	oldDetailFloatPeoples:'',
	detailFloatPeoplesData:'',

	gradeEnumStore:''	,
	itemgradeEnumOption:'' ,

selectPeoples:function (myID,inrow,PeoplesColNo,ifMultPeoples,e,mainRowIndex){
	var floath=e.screenY-window.screen.availHeight+document.body.clientHeight+30;
	if(floath+255>document.body.clientHeight)floath=floath-255;
	var floatw=e.screenX;
	if(e.screenX+505>document.body.clientWidth)floatw=floatw-500;
		this.selectPeoplesInRow=inrow;
		this.noPeoples=PeoplesColNo;
		this.selectPeoplesIDs=myID;
		//ifMult=ifMults;
		this.mainRowIndexPeoples=mainRowIndex;
		this.oldFloatPeoples = dijit.byId("selectPeoplesFloat_1");
		dojoPeoplesSelect=this;
		if(this.oldFloatPeoples==undefined){
			var div = dojo.doc.createElement('div');
			dojo.body().appendChild(div);
			var fp = new dojox.layout.FloatingPane({id:"selectPeoplesFloat_1",title:"selectFloat",//title:i18nStr.selectPeoples,
				maxable: true,closable: true,resizable: true ,dockable:true,
				href:"../common/selectPeoplesFloat.html"},div);
			dojo.style(fp.domNode,{
				width:"500px",height:"300px",top:floath, left:floatw,position:"absolute",zIndex:"980"});//255
			this.oldFloatPeoples=fp;
			fp.startup();
			fp.show();
			
		}else{
			dojo.style(this.oldFloatPeoples.domNode,{width:"500px",height:"300px",//255
				top:floath, left:floatw,
				position:"absolute",zIndex:"980"});
			this.oldFloatPeoples.show();
			dijit.byId("gridIncPeoples").model.setData(querydataIncPeoples); 
		}
},
																									
 //rowinum=4
detailPeoples:function (myID,inrow,PeoplesColNo,ifMultPeoples,e,mainRowIndex){
	var floath=e.screenY-window.screen.availHeight+document.body.clientHeight+30;
	if(floath+255>document.body.clientHeight)floath=floath-255;
	var floatw=e.screenX;
	if(e.screenX+505>document.body.clientWidth)floatw=floatw-500;
		//this.selectPeoplesInRow=inrow;
		//this.noPeoples=PeoplesColNo;
		//this.selectPeoplesIDs=myID;
		//ifMult=ifMults;
		//this.mainRowIndexPeoples=mainRowIndex;
		this.oldDetailFloatPeoples = dijit.byId("detailPeoplesFloat_1");
		//dojoPeoplesdetail=this;
		if(this.oldDetailFloatPeoples==undefined){
			var div = dojo.doc.createElement('div');
			dojo.body().appendChild(div);
			var fp = new dojox.layout.FloatingPane({id:"detailPeoplesFloat_1",title:"detailFloat",//title:i18nStr.selectPeoples,
				maxable: true,closable: true,resizable: true ,dockable:true,
				href:"../common/detailPeoplesFloat.html"},div);
			dojo.style(fp.domNode,{
				width:"600px",height:"130px",top:floath, left:floatw,position:"absolute",zIndex:"980"});//255
			this.oldDetailFloatPeoples=fp;
			fp.startup();
			fp.show();
			
		}else{
			dojo.style(this.oldDetailFloatPeoples.domNode,{width:"600px",height:"130px",//255
				top:floath, left:floatw,
				position:"absolute",zIndex:"980"});
			this.oldDetailFloatPeoples.show();
			//dijit.byId("gridIncPeoples").model.setData(querydataIncPeoples); 
		}
	
	//var querydataPeoplesDetail= setDetailFloatFun(inrow,PeoplesColNo);	
	var thisObj=this;
	setTimeout(function(){
													dojo.byId("detailpeopleName").value=thisObj.detailFloatPeoplesData[2];
						 									dojo.byId("detailpeoplePassword").value=thisObj.detailFloatPeoplesData[3];
						 									dojo.byId("detailpeopleStatus").value=thisObj.detailFloatPeoplesData[4];
						 									 dojo.byId("detailbirthDay").value=dojo.date.locale.parse(thisObj.detailFloatPeoplesData[5],{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" });
						 									dojo.byId("detailsex").value=thisObj.detailFloatPeoplesData[6];
						 									dojo.byId("detailbirthPlace").value=thisObj.detailFloatPeoplesData[7];
						 									dojo.byId("detailaddress").value=thisObj.detailFloatPeoplesData[8];
						 									dojo.byId("detailtel").value=thisObj.detailFloatPeoplesData[9];
						 									dojo.byId("detailengageMode").value=thisObj.detailFloatPeoplesData[10];
						 									 dojo.byId("detailengageDate").value=dojo.date.locale.parse(thisObj.detailFloatPeoplesData[11],{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" });
						 									dojo.byId("detailgradeEnum").value=thisObj.detailFloatPeoplesData[12];
						 									dojo.byId("detailremark").value=thisObj.detailFloatPeoplesData[13];
						 			 
				
		
	},300);

},

PeoplesVOtoArray_fun:function(ulvo,edit){
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
                        
                        items[2] = ulo["ns:peopleName"];//
                        items[3] = ulo["ns:peoplePassword"];//
                        items[4] = ulo["ns:peopleStatus"];//
                        t=ulo["ns:birthDay"];if(t!=null&&t!=undefined){items[5] = t['ns:upDate'];}
                        items[6] = ulo["ns:sex"];//
                        items[7] = ulo["ns:birthPlace"];//
                        items[8] = ulo["ns:address"];//
                        items[9] = ulo["ns:tel"];//
                        items[10] = ulo["ns:engageMode"];//
                        t=ulo["ns:engageDate"];if(t!=null&&t!=undefined){items[11] = t['ns:upDate'];}
                        items[12] = ulo["ns:gradeEnum"];//
                        items[13] = ulo["ns:remark"];//
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
                        
                        items[2] = ulo["ns:peopleName"];//
                        items[3] = ulo["ns:peoplePassword"];//
                        items[4] = ulo["ns:peopleStatus"];//
                        t=ulo["ns:birthDay"];if(t!=null&&t!=undefined){
                        d=dojo.date.locale.parse(new String( t['ns:upDate']),{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" });}
                        items[5] = d;
                        items[6] = d;                        
                        items[7] = ulo["ns:sex"];//
                        items[8] = ulo["ns:birthPlace"];//
                        items[9] = ulo["ns:address"];//
                        items[10] = ulo["ns:tel"];//
                        items[11] = ulo["ns:engageMode"];//
                        t=ulo["ns:engageDate"];if(t!=null&&t!=undefined){
                        d=dojo.date.locale.parse(new String( t['ns:upDate']),{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" });}
                        items[12] = d;
                        items[13] = d;                        
                        items[14] = ulo["ns:gradeEnum"];//
                        items[15] = ulo["ns:remark"];//
				items[16] = ulo["ns:selected"];
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
		

initPeoples:function (){ 
	var thisObj=this;
	var urle = getUrl()+ "services/BasicManageService"; 

														var pgradeEnum = new SOAPClientParameters();
			pgradeEnum.add('eType','gradeEnum');
			var itemgradeEnum = new Array();
			this.itemgradeEnumOption = new Array();
				SOAPClient.invoke(urle, "getEnumerationByType", pgradeEnum, false,  function GetEnu_callBack(ul, soapResponse){   
				for(var i = 0; i < ul.length; i++){		
				  var ulo=ul[i];
				  itemgradeEnum.push({name: ulo["ns:fieldName"], value:ulo["ns:fieldName"]});
				  thisObj.itemgradeEnumOption.push(ulo["ns:fieldName"]);
				}                
			});       
			if(itemgradeEnum.length==0)itemgradeEnum.push({name:'' , value:''});
			this.gradeEnumStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemgradeEnum}}); 
			}
});
}

