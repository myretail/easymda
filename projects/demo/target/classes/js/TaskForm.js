if(!dojo._hasResource["projectDojo.TaskForm"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["projectDojo.TaskForm"] = true;
dojo.provide("projectDojo.TaskForm");

dojo.require("projectDojo.subTask");
dojo.require("projectDojo.car");
dojo.declare("projectDojo.TaskForm",
[
	 projectDojo.subTask
					, projectDojo.car
			],
{
	noTaskForm:'',
	selectTaskFormIDs:'',
	oldFloatTaskForm:'',
	selectTaskFormInRow:'',
	ifMultTaskForm:0,
	mainRowIndexTaskForm:'',
	oldDetailFloatTaskForm:'',
	detailFloatTaskFormData:'',
	tasksStore:''	,
	carStore:''	,


selectTaskForm:function (myID,inrow,TaskFormColNo,ifMultTaskForm,e,mainRowIndex){
	var floath=e.screenY-window.screen.availHeight+document.body.clientHeight+30;
	if(floath+255>document.body.clientHeight)floath=floath-255;
	var floatw=e.screenX;
	if(e.screenX+505>document.body.clientWidth)floatw=floatw-500;
		this.selectTaskFormInRow=inrow;
		this.noTaskForm=TaskFormColNo;
		this.selectTaskFormIDs=myID;
		//ifMult=ifMults;
		this.mainRowIndexTaskForm=mainRowIndex;
		this.oldFloatTaskForm = dijit.byId("selectTaskFormFloat_1");
		dojoTaskFormSelect=this;
		if(this.oldFloatTaskForm==undefined){
			var div = dojo.doc.createElement('div');
			dojo.body().appendChild(div);
			var fp = new dojox.layout.FloatingPane({id:"selectTaskFormFloat_1",title:"selectFloat",//title:i18nStr.selectTaskForm,
				maxable: true,closable: true,resizable: true ,dockable:true,
				href:"../common/selectTaskFormFloat.html"},div);
			dojo.style(fp.domNode,{
				width:"500px",height:"300px",top:floath, left:floatw,position:"absolute",zIndex:"980"});//255
			this.oldFloatTaskForm=fp;
			fp.startup();
			fp.show();
			
		}else{
			dojo.style(this.oldFloatTaskForm.domNode,{width:"500px",height:"300px",//255
				top:floath, left:floatw,
				position:"absolute",zIndex:"980"});
			this.oldFloatTaskForm.show();
			dijit.byId("gridIncTaskForm").model.setData(querydataIncTaskForm); 
		}
},
										
 //rowinum=1
detailTaskForm:function (myID,inrow,TaskFormColNo,ifMultTaskForm,e,mainRowIndex){
	var floath=e.screenY-window.screen.availHeight+document.body.clientHeight+30;
	if(floath+255>document.body.clientHeight)floath=floath-255;
	var floatw=e.screenX;
	if(e.screenX+505>document.body.clientWidth)floatw=floatw-500;
		//this.selectTaskFormInRow=inrow;
		//this.noTaskForm=TaskFormColNo;
		//this.selectTaskFormIDs=myID;
		//ifMult=ifMults;
		//this.mainRowIndexTaskForm=mainRowIndex;
		this.oldDetailFloatTaskForm = dijit.byId("detailTaskFormFloat_1");
		//dojoTaskFormdetail=this;
		if(this.oldDetailFloatTaskForm==undefined){
			var div = dojo.doc.createElement('div');
			dojo.body().appendChild(div);
			var fp = new dojox.layout.FloatingPane({id:"detailTaskFormFloat_1",title:"detailFloat",//title:i18nStr.selectTaskForm,
				maxable: true,closable: true,resizable: true ,dockable:true,
				href:"../common/detailTaskFormFloat.html"},div);
			dojo.style(fp.domNode,{
				width:"600px",height:"80px",top:floath, left:floatw,position:"absolute",zIndex:"980"});//255
			this.oldDetailFloatTaskForm=fp;
			fp.startup();
			fp.show();
			
		}else{
			dojo.style(this.oldDetailFloatTaskForm.domNode,{width:"600px",height:"80px",//255
				top:floath, left:floatw,
				position:"absolute",zIndex:"980"});
			this.oldDetailFloatTaskForm.show();
			//dijit.byId("gridIncTaskForm").model.setData(querydataIncTaskForm); 
		}
	
	//var querydataTaskFormDetail= setDetailFloatFun(inrow,TaskFormColNo);	
	var thisObj=this;
	setTimeout(function(){
													 dojo.byId("detailsetDate").value=dojo.date.locale.parse(thisObj.detailFloatTaskFormData[2],{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" });
						 									dojo.byId("detailformState").value=thisObj.detailFloatTaskFormData[3];
						 									dojo.byId("detailremark").value=thisObj.detailFloatTaskFormData[4];
						 			 
													dojo.byId("detailcar").value=thisObj.detailFloatTaskFormData[6][2];
							
		
	},300);

},

TaskFormVOtoArray_fun:function(ulvo,edit){
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
                        
                        t=ulo["ns:setDate"];if(t!=null&&t!=undefined){items[2] = t['ns:upDate'];}
                        items[3] = ulo["ns:formState"];//
                        items[4] = ulo["ns:remark"];//
                         items[5] = this.TaskVOtoArray_fun(ulo["ns:tasks"],edit);
                         items[6] = this.carVOtoArray_fun(ulo["ns:car"],edit);
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
                        
                        t=ulo["ns:setDate"];if(t!=null&&t!=undefined){
                        d=dojo.date.locale.parse(new String( t['ns:upDate']),{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" });}
                        items[2] = d;
                        items[3] = d;                        
                        items[4] = ulo["ns:formState"];//
                        items[5] = ulo["ns:remark"];//
                         items[6] = this.TaskVOtoArray_fun(ulo["ns:tasks"],edit);
                         items[7] = this.carVOtoArray_fun(ulo["ns:car"],edit);
				items[8] = ulo["ns:selected"];
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
		

initTaskForm:function (){ 
	var thisObj=this;
	var urle = getUrl()+ "services/BasicManageService"; 
	thisObj.initTask();
				thisObj.initcar();
	if(this.tasksStore==''){
	var ptasks = new SOAPClientParameters();
	var itemstasks = new Array();  
		ptasks.add('TaskVO',new Object()) ;
		ptasks.add('pageNumber',0) ;
		ptasks.add('pageSize',0) ;
	    ptasks.add('orderBy','0') ;
	SOAPClient.invoke(getUrl()+ "services/"+"TaskManageService","getTask", ptasks, false,  function GetEnu_callBack(ul, soapResponse){      
				var tempData=thisObj.TaskVOtoArray_fun(ul,false);
				for(var i = 0; i < tempData.length-1; i++){		
				  itemstasks.push({name: tempData[i][2], value:tempData[i][1]});
				}                
	});       
	if(itemstasks.length==0)itemstasks.push({name:'' , value:''});
	this.tasksStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemstasks }});
}

if(this.carStore==''){
	var pcar = new SOAPClientParameters();
	var itemscar = new Array();  
		pcar.add('carVO',new Object()) ;
		pcar.add('pageNumber',0) ;
		pcar.add('pageSize',0) ;
	    pcar.add('orderBy','0') ;
	SOAPClient.invoke(getUrl()+ "services/"+"carManageService","getcar", pcar, false,  function GetEnu_callBack(ul, soapResponse){      
				var tempData=thisObj.carVOtoArray_fun(ul,false);
				for(var i = 0; i < tempData.length-1; i++){		
				  itemscar.push({name: tempData[i][2], value:tempData[i][1]});
				}                
	});       
	if(itemscar.length==0)itemscar.push({name:'' , value:''});
	this.carStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemscar }});
}


				}
});
}

