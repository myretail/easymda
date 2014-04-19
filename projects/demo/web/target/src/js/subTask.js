
if(!dojo._hasResource["projectDojo.subTask"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["projectDojo.subTask"] = true;
dojo.provide("projectDojo.subTask");

dojo.declare("projectDojo.subTask",
[
							]
,

{
	noTask:'',
	selectTaskIDs:'',
	oldFloatTask:'',
	selectTaskInRow:'',
	ifMultTask:0,
	mainRowIndexTask:'',
	oldDetailFloatTask:'',
	detailFloatTaskData:'',
	taskFormStore:''	,


selectTask:function (myID,inrow,TaskColNo,ifMultTask,e,mainRowIndex){
	var floath=e.screenY-window.screen.availHeight+document.body.clientHeight+30;
	if(floath+255>document.body.clientHeight)floath=floath-255;
	var floatw=e.screenX;
	if(e.screenX+505>document.body.clientWidth)floatw=floatw-500;
		this.selectTaskInRow=inrow;
		this.noTask=TaskColNo;
		this.selectTaskIDs=myID;
		//ifMult=ifMults;
		this.mainRowIndexTask=mainRowIndex;
		this.oldFloatTask = dijit.byId("selectTaskFloat_1");
		dojoTaskSelect=this;
		if(this.oldFloatTask==undefined){
			var div = dojo.doc.createElement('div');
			dojo.body().appendChild(div);
			var fp = new dojox.layout.FloatingPane({id:"selectTaskFloat_1",title:"selectFloat",//title:i18nStr.selectTask,
				maxable: true,closable: true,resizable: true ,dockable:true,
				href:"../common/selectTaskFloat.html"},div);
			dojo.style(fp.domNode,{
				width:"500px",height:"300px",top:floath, left:floatw,position:"absolute",zIndex:"980"});//255
			this.oldFloatTask=fp;
			fp.startup();
			fp.show();
			
		}else{
			dojo.style(this.oldFloatTask.domNode,{width:"500px",height:"300px",//255
				top:floath, left:floatw,
				position:"absolute",zIndex:"980"});
			this.oldFloatTask.show();
			dijit.byId("gridIncTask").model.setData(querydataIncTask); 
		}
},
									
 //rowinum=1
detailTask:function (myID,inrow,TaskColNo,ifMultTask,e,mainRowIndex){
	var floath=e.screenY-window.screen.availHeight+document.body.clientHeight+30;
	if(floath+255>document.body.clientHeight)floath=floath-255;
	var floatw=e.screenX;
	if(e.screenX+505>document.body.clientWidth)floatw=floatw-500;
		//this.selectTaskInRow=inrow;
		//this.noTask=TaskColNo;
		//this.selectTaskIDs=myID;
		//ifMult=ifMults;
		//this.mainRowIndexTask=mainRowIndex;
		this.oldDetailFloatTask = dijit.byId("detailTaskFloat_1");
		//dojoTaskdetail=this;
		if(this.oldDetailFloatTask==undefined){
			var div = dojo.doc.createElement('div');
			dojo.body().appendChild(div);
			var fp = new dojox.layout.FloatingPane({id:"detailTaskFloat_1",title:"detailFloat",//title:i18nStr.selectTask,
				maxable: true,closable: true,resizable: true ,dockable:true,
				href:"../common/detailTaskFloat.html"},div);
			dojo.style(fp.domNode,{
				width:"600px",height:"80px",top:floath, left:floatw,position:"absolute",zIndex:"980"});//255
			this.oldDetailFloatTask=fp;
			fp.startup();
			fp.show();
			
		}else{
			dojo.style(this.oldDetailFloatTask.domNode,{width:"600px",height:"80px",//255
				top:floath, left:floatw,
				position:"absolute",zIndex:"980"});
			this.oldDetailFloatTask.show();
			//dijit.byId("gridIncTask").model.setData(querydataIncTask); 
		}
	
	//var querydataTaskDetail= setDetailFloatFun(inrow,TaskColNo);	
	var thisObj=this;
	setTimeout(function(){
													dojo.byId("detailnum").value=thisObj.detailFloatTaskData[2];
						 									dojo.byId("detailvolumne").value=thisObj.detailFloatTaskData[3];
						 									dojo.byId("detailremark").value=thisObj.detailFloatTaskData[4];
						 			 
								dojo.byId("detailtaskForm").value=thisObj.detailFloatTaskData[5][2];
							
		
	},300);

},
TaskVOtoArray_fun:function(ulvo,edit){
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
                        
                        t=ulo["ns:num"];if(t!=null&&t!=undefined){items[2] =  isNaN(t['ns:upNumber'])?'':t['ns:upNumber'];}
                        t=ulo["ns:volumne"];if(t!=null&&t!=undefined){items[3] =  isNaN(t['ns:upNumber'])?'':t['ns:upNumber'];}
                        items[4] = ulo["ns:remark"];//
                         items[5] = this.TaskFormVOtoArray_fun(ulo["ns:taskForm"],edit);
				items[6] = ulo["ns:selected"];
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
                        
                        t=ulo["ns:num"];if(t!=null&&t!=undefined){items[2] =  isNaN(t['ns:upNumber'])?0:t['ns:upNumber'];}
                        t=ulo["ns:volumne"];if(t!=null&&t!=undefined){items[3] =  isNaN(t['ns:upNumber'])?0:t['ns:upNumber'];}
                        items[4] = ulo["ns:remark"];//
                         items[5] = this.TaskFormVOtoArray_fun(ulo["ns:taskForm"],edit);
					items[6] = ulo["ns:selected"];
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
		

initTask:function (){ 
	var thisObj=this;
	var urle = getUrl()+ "services/BasicManageService"; 
							if(this.taskFormStore==''){
	var ptaskForm = new SOAPClientParameters();
	var itemstaskForm = new Array();  
		ptaskForm.add('TaskFormVO',new Object()) ;
		ptaskForm.add('pageNumber',0) ;
		ptaskForm.add('pageSize',0) ;
	    ptaskForm.add('orderBy','0') ;
	SOAPClient.invoke(getUrl()+ "services/"+"TaskFormManageService","getTaskForm", ptaskForm, false,  function GetEnu_callBack(ul, soapResponse){      
				var tempData=thisObj.TaskFormVOtoArray_fun(ul,false);
				for(var i = 0; i < tempData.length-1; i++){		
				  itemstaskForm.push({name: tempData[i][2], value:tempData[i][1]});
				}                
	});       
	if(itemstaskForm.length==0)itemstaskForm.push({name:'' , value:''});
	this.taskFormStore = new dojo.data.ItemFileWriteStore({data: {identifier:"value", items: itemstaskForm }});
}


				}


});
}
