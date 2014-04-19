	
//---begin---------???????????¨¤???¨¤??????¡À¨ª
	//---end---------???????????¨¤???¨¤??????¡À¨ª
																																								//set (= orderRow2orderRowTasks)

	//----------lastMenber = org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[orderRow]   firstMenber=org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[task]
	//orderRow2orderRowTasksAFTab.js	
	
	//---begin---------??????????tree?¨¢??¡À¨ªsno
																																																	//---end---------??????????tree?¨¢??¡À¨ªsno
	
			  var NUorderRow2orderRowTasks = false;//needUpdate
		  var urlorderRowTasks2task = getUrl()+ "services/OrderRowTaskManageService";
		  var deletedataorderRowTasks2task =   ",";
		  var adddataorderRowTasks2task =    ",";
		  var querydataorderRowTasks2task =  new Array();
		  var pagenumberorderRowTasks2task=1;
		  var totalCountorderRowTasks2task=0;
		  var pagesizeorderRowTasks2task=10;
		  var orderByorderRowTasks2task='0';
		  var queryvoorderRowTasks2task=new Object();
		  var oddstyle='';
		  var modelorderRowTasks2task = new dojox.grid.data.Table(null, querydataorderRowTasks2task);
		  var gridorderRow2orderRowTasks;

		var getVOorderRowTasks2taskTask=function(id){

			var pu = new SOAPClientParameters2();
			pu.add('id',id) ;
			SOAPClient.invoke(urlorderRowTasks2task,"getTaskByOrderRowdId", pu, false,  function GetEnu_callBack(ul, soapResponse){      
			querydataorderRowTasks2taskTask=dojoOrderRowTask.TaskVOtoArray_fun(ul,false);
			totalCountorderRowTasks2task=ul[ul.length-1]["ns:id"]; 
			querydataorderRowTasks2taskTask.splice(querydataorderRowTasks2taskTask.length-1,1);
			querydataorderRowTasks2taskTask=selected_fun(querydataorderRowTasks2taskTask);
			}); 
			modelorderRowTasks2task.setData(querydataorderRowTasks2taskTask);
			var totalpage=Math.ceil(new Number(totalCountorderRowTasks2task)/pagesizeorderRowTasks2task);
		
		if(totalpage>1){
			if(pagenumberorderRowTasks2task==1){
				dijit.byId("but6orderRow2orderRowTasks").setDisabled(true);
				dijit.byId("but7orderRow2orderRowTasks").setDisabled(false);
			}else if(pagenumberorderRow2orderRowTasks==totalpage){
				dijit.byId("but6orderRow2orderRowTasks").setDisabled(false);
				dijit.byId("but7orderRow2orderRowTasks").setDisabled(true);
			}else{
				dijit.byId("but6orderRow2orderRowTasks").setDisabled(false);
				dijit.byId("but7orderRow2orderRowTasks").setDisabled(false);
			}
		}else{
			dijit.byId("but6orderRow2orderRowTasks").setDisabled(true);
			dijit.byId("but7orderRow2orderRowTasks").setDisabled(true);
		
		}
		if(pagesizeorderRowTasks2task==0){
			totalpage=1;
			dijit.byId("but6orderRow2orderRowTasks").setDisabled(true);
			dijit.byId("but7orderRow2orderRowTasks").setDisabled(true);
		}
		if(totalpage==1)pagenumberorderRowTasks2task=1;
		
		 document.getElementById("rowCountorderRow2orderRowTasks").innerHTML=i18nStr.di+" "+pagenumberorderRowTasks2task+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountorderRowTasks2task+" "+i18nStr.rowSize; 	

	}
	  
	function selected_fun(transData){
			 for(var i = 0; i < transData.length; i++){		
                        var row = transData[i];
                        if(row[row.length-1]==undefined){
							row[0] = false;
						}else{
							row[0] = true;
						}
						transData[i]=row;
						}
				return 		transData;
		  }
	
	/*function saveorderRow2orderRowTasks(){
		var delArray=deletedataorderRowTasks2task.split(",");
		for(var i=1;i<delArray.length-1;i++){
			var pdel = new SOAPClientParameters();  
			pdel.add('id',delArray[i]);
				SOAPClient.invoke(urlorderRowTasks2task, "deleteOrderRowTask", pdel, false,  function GetEnu_callBack(ul, soapResponse){
			});
		}
		deletedataorderRowTasks2task=",";
		
		var addArray=adddataorderRowTasks2task.split(",");
					  
		for(var i=1;i<addArray.length-1;i++){
			var vobject=new Object();
			var OrderRowdvo=new Object();
			OrderRowdvo.id=mainID;
			vobject.orderRow=OrderRowdvo;
			var Taskvo=new Object();
			Taskvo.id=addArray[i];
			vobject.task=Taskvo;
			var padd = new SOAPClientParameters2(); 
			padd.add('OrderRowTaskVO',vobject);
			SOAPClient.invoke(urlorderRowTasks2task, "createOrderRowTask", padd, false,  function GetEnu_callBack(ul, soapResponse){
				for(var j=0;j<querydataorderRowTasks2taskTask.length;j++){
					if(querydataorderRowTasks2taskTask[j][1]==addArray[i]){
						querydataorderRowTasks2taskTask[j][querydataorderRowTasks2taskTask[j].length-1]=ul;
						break;
						}
				}
			});
		}
		
		adddataorderRowTasks2task=",";
		
	}*/
	
	
	var queryvotask=new Object();
	var buildorderRow2orderRowTasks=function(){
		if(NUorderRow2orderRowTasks && mainID!=undefined && mainID!=''){
			getVOorderRowTasks2taskTask(mainID);
			if(gridorderRow2orderRowTasks==undefined){
				gridorderRow2orderRowTasks = new dojox.Grid({
							title: "",
							id: "gridorderRow2orderRowTasks",
							jsId: "gridorderRow2orderRowTasks",
							structure: layoutorderRowTasks2task,
							rowCount:querydataorderRowTasks2taskTask.length,
							model:modelorderRowTasks2task
						}, dojo.byId("gridorderRow2orderRowTasks"));
						
				gridorderRow2orderRowTasks.resize({ h: dijit.byId("bottomPane").domNode.clientHeight-90});
			}else{
				gridorderRow2orderRowTasks.updateRowCount(querydataorderRowTasks2taskTask.length); 
			}
			
			NUorderRow2orderRowTasks=false;
		}

	}
	
	/*function pageSizeChangeorderRow2orderRowTasks(mylabel){
			pagesizeorderRow2orderRowTasks=mylabel;
			getVOorderRow2orderRowTasksOrderRowTask(queryvoorderRow2orderRowTasksOrderRowTask);
		}

		function allpageorderRow2orderRowTasks(){
			pagesizeorderRow2orderRowTasks=0;
			getVOorderRow2orderRowTasksOrderRowTask(queryvoorderRow2orderRowTasksOrderRowTask);
		}*/

		function upPageorderRow2orderRowTasks(){
			pagenumberorderRow2orderRowTasks--;
			getVOorderRow2orderRowTasksOrderRowTask(queryvoorderRow2orderRowTasksOrderRowTask);
		}
		function downPageorderRow2orderRowTasks(){
			pagenumberorderRow2orderRowTasks++;
			getVOorderRow2orderRowTasksOrderRowTask(queryvoorderRow2orderRowTasksOrderRowTask);
		}
	

	                    //associatedClass==manageable
		
        //????????????layout??($member in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[orderRow], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[task]])??if(!${member.many})  ??¡Á?????????Float???????¡ã????????
	                                     
              //begin from 41.4
		var querydataorderRowTasks2taskTask =  new Array();
		
		var getChoiseorderRowTasks2task= function(inRowIndex) {
			if(true==querydataorderRowTasks2taskTask[inRowIndex][0]){//'+querydataorderRowTasks2taskTask[inRowIndex][1]+'
				 return  '<input class="dojoxGrid-input"  name="selectorderRowTasks2task" id="" checked="true" type="checkbox" />';
			 }else{
				 return  '<input class="dojoxGrid-input"  name="selectorderRowTasks2task" id=""  type="checkbox"  />';
			 }
		}

/*function clickorderRowTasks2task(row){//  
			
			if(querydataorderRowTasks2taskTask[row][querydataorderRowTasks2taskTask[row].length-1]==undefined){
				var idStr=","+querydataorderRowTasks2taskTask[row][1]+",";
			
				if(adddataorderRowTasks2task.indexOf(idStr)==-1){
					adddataorderRowTasks2task=adddataorderRowTasks2task+querydataorderRowTasks2taskTask[row][1]+",";
				}else{
					
					adddataorderRowTasks2task=adddataorderRowTasks2task.substring(0,adddataorderRowTasks2task.indexOf(idStr))+adddataorderRowTasks2task.substring(adddataorderRowTasks2task.indexOf(idStr)+idStr.length-1);
				}
			
			}else{
				
				var idStr=","+querydataorderRowTasks2taskTask[row][querydataorderRowTasks2taskTask[row].length-1]+",";
				
				if(deletedataorderRowTasks2task.indexOf(idStr)==-1){
					deletedataorderRowTasks2task=deletedataorderRowTasks2task+querydataorderRowTasks2taskTask[row][querydataorderRowTasks2taskTask[row].length-1]+",";
				}else{
					deletedataorderRowTasks2task=deletedataorderRowTasks2task.substring(0,deletedataorderRowTasks2task.indexOf(idStr))+deletedataorderRowTasks2task.substring(deletedataorderRowTasks2task.indexOf(idStr)+idStr.length-1);
				}
			}
	}		*/
			var layoutorderRowTasks2task=[{
				   //?¨´??field???????????????????¨°????js????toArray¡Á??????¡§??????querydate????????
		   
					 cells: [ [
							   //{ name: i18nStr.chose, width: 3, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
							   { name: i18nStr.chose, width: 3,styles: 'text-align: center;', get:getChoiseorderRowTasks2task},
							   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
								  				  {name: i18nStr.num,field:2, width: 8}
						  								  				 ,  {name: i18nStr.volumne,field:3, width: 8}
						  								  				,   {name: i18nStr.remark, field: 4,width: 10 }
							  								
		//??????¡À¨ª???¨ª????????
				,   {name: i18nStr.taskForm,field: 5,get:function(inRowIndex){ var str='';var strid;if(querydataorderRowTasks2taskTask[inRowIndex]!=undefined && querydataorderRowTasks2taskTask[inRowIndex][5]!=undefined && querydataorderRowTasks2taskTask[inRowIndex][5][1]!=undefined){str=querydataorderRowTasks2taskTask[inRowIndex][5][2];strid=querydataorderRowTasks2taskTask[inRowIndex][5][1];} return str;} ,width: 10 }
									   ] ]
								   }]; 
								 //end from 41.4
                                 //????????????layout??($member in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[orderRow], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[task]])??if(!${member.many})  ??¡Á?????????Float???????¡ã????????
	                 	    	