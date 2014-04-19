if(!dojo._hasResource["projectDojo.OrderRowTask"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["projectDojo.OrderRowTask"] = true;
dojo.provide("projectDojo.OrderRowTask");

dojo.require("projectDojo.OrderRowd");
dojo.require("projectDojo.Task");
dojo.declare("projectDojo.OrderRowTask",
[
				 projectDojo.OrderRowd
							, projectDojo.Task
			],
{
	noOrderRowTask:'',
	selectOrderRowTaskIDs:'',
	oldFloatOrderRowTask:'',
	selectOrderRowTaskInRow:'',
	ifMultOrderRowTask:0,
	mainRowIndexOrderRowTask:'',
	oldDetailFloatOrderRowTask:'',
	detailFloatOrderRowTaskData:'',
	orderRowStore:''	,
	taskStore:''	,


selectOrderRowTask:function (myID,inrow,OrderRowTaskColNo,ifMultOrderRowTask,e,mainRowIndex){
	var floath=e.screenY-window.screen.availHeight+document.body.clientHeight+30;
	if(floath+255>document.body.clientHeight)floath=floath-255;
	var floatw=e.screenX;
	if(e.screenX+505>document.body.clientWidth)floatw=floatw-500;
		this.selectOrderRowTaskInRow=inrow;
		this.noOrderRowTask=OrderRowTaskColNo;
		this.selectOrderRowTaskIDs=myID;
		//ifMult=ifMults;
		this.mainRowIndexOrderRowTask=mainRowIndex;
		this.oldFloatOrderRowTask = dijit.byId("selectOrderRowTaskFloat_1");
		dojoOrderRowTaskSelect=this;
		if(this.oldFloatOrderRowTask==undefined){
			var div = dojo.doc.createElement('div');
			dojo.body().appendChild(div);
			var fp = new dojox.layout.FloatingPane({id:"selectOrderRowTaskFloat_1",title:"selectFloat",//title:i18nStr.selectOrderRowTask,
				maxable: true,closable: true,resizable: true ,dockable:true,
				href:"../common/selectOrderRowTaskFloat.html"},div);
			dojo.style(fp.domNode,{
				width:"500px",height:"300px",top:floath, left:floatw,position:"absolute",zIndex:"980"});//255
			this.oldFloatOrderRowTask=fp;
			fp.startup();
			fp.show();
			
		}else{
			dojo.style(this.oldFloatOrderRowTask.domNode,{width:"500px",height:"300px",//255
				top:floath, left:floatw,
				position:"absolute",zIndex:"980"});
			this.oldFloatOrderRowTask.show();
			dijit.byId("gridIncOrderRowTask").model.setData(querydataIncOrderRowTask); 
		}
},
					
 //rowinum=0
detailOrderRowTask:function (myID,inrow,OrderRowTaskColNo,ifMultOrderRowTask,e,mainRowIndex){
	var floath=e.screenY-window.screen.availHeight+document.body.clientHeight+30;
	if(floath+255>document.body.clientHeight)floath=floath-255;
	var floatw=e.screenX;
	if(e.screenX+505>document.body.clientWidth)floatw=floatw-500;
		//this.selectOrderRowTaskInRow=inrow;
		//this.noOrderRowTask=OrderRowTaskColNo;
		//this.selectOrderRowTaskIDs=myID;
		//ifMult=ifMults;
		//this.mainRowIndexOrderRowTask=mainRowIndex;
		this.oldDetailFloatOrderRowTask = dijit.byId("detailOrderRowTaskFloat_1");
		//dojoOrderRowTaskdetail=this;
		if(this.oldDetailFloatOrderRowTask==undefined){
			var div = dojo.doc.createElement('div');
			dojo.body().appendChild(div);
			var fp = new dojox.layout.FloatingPane({id:"detailOrderRowTaskFloat_1",title:"detailFloat",//title:i18nStr.selectOrderRowTask,
				maxable: true,closable: true,resizable: true ,dockable:true,
				href:"../common/detailOrderRowTaskFloat.html"},div);
			dojo.style(fp.domNode,{
				width:"600px",height:"55px",top:floath, left:floatw,position:"absolute",zIndex:"980"});//255
			this.oldDetailFloatOrderRowTask=fp;
			fp.startup();
			fp.show();
			
		}else{
			dojo.style(this.oldDetailFloatOrderRowTask.domNode,{width:"600px",height:"55px",//255
				top:floath, left:floatw,
				position:"absolute",zIndex:"980"});
			this.oldDetailFloatOrderRowTask.show();
			//dijit.byId("gridIncOrderRowTask").model.setData(querydataIncOrderRowTask); 
		}
	
	//var querydataOrderRowTaskDetail= setDetailFloatFun(inrow,OrderRowTaskColNo);	
	var thisObj=this;
	setTimeout(function(){
							 
								dojo.byId("detailorderRow").value=thisObj.detailFloatOrderRowTaskData[2][2];
											dojo.byId("detailtask").value=thisObj.detailFloatOrderRowTaskData[3][2];
							
		
	},300);

},

OrderRowTaskVOtoArray_fun:function(ulvo,edit){
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
                        
                         items[2] = this.OrderRowdVOtoArray_fun(ulo["ns:orderRow"],edit);
                         items[3] = this.TaskVOtoArray_fun(ulo["ns:task"],edit);
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
                        
                         items[2] = this.OrderRowdVOtoArray_fun(ulo["ns:orderRow"],edit);
                         items[3] = this.TaskVOtoArray_fun(ulo["ns:task"],edit);
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
		

initOrderRowTask:function (){ 
	var thisObj=this;
	var urle = getUrl()+ "services/BasicManageService"; 
				thisObj.initOrderRowd();
					thisObj.initTask();
	if(this.orderRowStore==''){
	var porderRow = new SOAPClientParameters();
	var itemsorderRow = new Array();  
		porderRow.add('OrderRowdVO',new Object()) ;
		porderRow.add('pageNumber',0) ;
		porderRow.add('pageSize',0) ;
	    porderRow.add('orderBy','0') ;
	SOAPClient.invoke(getUrl()+ "services/"+"OrderRowdManageService","getOrderRowd", porderRow, false,  function GetEnu_callBack(ul, soapResponse){      
				var tempData=thisObj.OrderRowdVOtoArray_fun(ul,false);
				for(var i = 0; i < tempData.length-1; i++){		
				  itemsorderRow.push({name: tempData[i][2], value:tempData[i][1]});
				}                
	});       
	if(itemsorderRow.length==0)itemsorderRow.push({name:'' , value:''});
	this.orderRowStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemsorderRow }});
}

if(this.taskStore==''){
	var ptask = new SOAPClientParameters();
	var itemstask = new Array();  
		ptask.add('TaskVO',new Object()) ;
		ptask.add('pageNumber',0) ;
		ptask.add('pageSize',0) ;
	    ptask.add('orderBy','0') ;
	SOAPClient.invoke(getUrl()+ "services/"+"TaskManageService","getTask", ptask, false,  function GetEnu_callBack(ul, soapResponse){      
				var tempData=thisObj.TaskVOtoArray_fun(ul,false);
				for(var i = 0; i < tempData.length-1; i++){		
				  itemstask.push({name: tempData[i][2], value:tempData[i][1]});
				}                
	});       
	if(itemstask.length==0)itemstask.push({name:'' , value:''});
	this.taskStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemstask }});
}


	}
});
}

