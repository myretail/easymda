	  	  //---begin---------???????????¨¤???¨¤??????¡À¨ª
	//---end---------???????????¨¤???¨¤??????¡À¨ª
																																								//set (= orderRowTasks2task)

	//----------lastMenber = org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[task]   firstMenber=org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[orderRow]
	//orderRowTasks2taskAFTab.js	
	
	//---begin---------??????????tree?¨¢??¡À¨ªsno
																																																																																																																	//---end---------??????????tree?¨¢??¡À¨ªsno
	
			/*  var NUorderRowTasks2task = false;//needUpdate
		  var urlorderRow2orderRowTasks = getUrl()+ "services/OrderRowTaskManageService";
		  var deletedataorderRow2orderRowTasks =   ",";
		  var adddataorderRow2orderRowTasks =    ",";
		  var querydataorderRow2orderRowTasks =  new Array();
		  var pagenumberorderRow2orderRowTasks=1;
		  var totalCountorderRow2orderRowTasks=0;
		  var pagesizeorderRow2orderRowTasks=10;
		  var orderByorderRow2orderRowTasks='0';
		  var queryvoorderRow2orderRowTasks=new Object();
		  var oddstyle='';
		  var modelorderRow2orderRowTasks = new dojox.grid.data.Table(null, querydataorderRow2orderRowTasks);
		  var gridorderRowTasks2task;*/

		var getVOorderRow2orderRowTasksOrderRowd=function(id){

			var pu = new SOAPClientParameters2();
			pu.add('id',id) ;
			SOAPClient.invoke(urlorderRow2orderRowTasks,"getOrderRowdByTaskId", pu, false,  function GetEnu_callBack(ul, soapResponse){      
			querydataorderRow2orderRowTasksOrderRowd=dojoOrderRowTask.OrderRowdVOtoArray_fun(ul,false);
			totalCountorderRow2orderRowTasks=ul[ul.length-1]["ns:id"]; 
			querydataorderRow2orderRowTasksOrderRowd.splice(querydataorderRow2orderRowTasksOrderRowd.length-1,1);
			querydataorderRow2orderRowTasksOrderRowd=selected_fun(querydataorderRow2orderRowTasksOrderRowd);
			}); 
			modelorderRow2orderRowTasks.setData(querydataorderRow2orderRowTasksOrderRowd);
			var totalpage=Math.ceil(new Number(totalCountorderRow2orderRowTasks)/pagesizeorderRow2orderRowTasks);
		
		if(totalpage>1){
			if(pagenumberorderRow2orderRowTasks==1){
				dijit.byId("but6orderRowTasks2task").setDisabled(true);
				dijit.byId("but7orderRowTasks2task").setDisabled(false);
			}else if(pagenumberorderRowTasks2task==totalpage){
				dijit.byId("but6orderRowTasks2task").setDisabled(false);
				dijit.byId("but7orderRowTasks2task").setDisabled(true);
			}else{
				dijit.byId("but6orderRowTasks2task").setDisabled(false);
				dijit.byId("but7orderRowTasks2task").setDisabled(false);
			}
		}else{
			dijit.byId("but6orderRowTasks2task").setDisabled(true);
			dijit.byId("but7orderRowTasks2task").setDisabled(true);
		
		}
		if(pagesizeorderRow2orderRowTasks==0){
			totalpage=1;
			dijit.byId("but6orderRowTasks2task").setDisabled(true);
			dijit.byId("but7orderRowTasks2task").setDisabled(true);
		}
		if(totalpage==1)pagenumberorderRow2orderRowTasks=1;
		
		 document.getElementById("rowCountorderRowTasks2task").innerHTML=i18nStr.di+" "+pagenumberorderRow2orderRowTasks+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountorderRow2orderRowTasks+" "+i18nStr.rowSize; 	

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
	
	/*function saveorderRowTasks2task(){
		var delArray=deletedataorderRow2orderRowTasks.split(",");
		for(var i=1;i<delArray.length-1;i++){
			var pdel = new SOAPClientParameters();  
			pdel.add('id',delArray[i]);
				SOAPClient.invoke(urlorderRow2orderRowTasks, "deleteOrderRowTask", pdel, false,  function GetEnu_callBack(ul, soapResponse){
			});
		}
		deletedataorderRow2orderRowTasks=",";
		
		var addArray=adddataorderRow2orderRowTasks.split(",");
					  
		for(var i=1;i<addArray.length-1;i++){
			var vobject=new Object();
			var Taskvo=new Object();
			Taskvo.id=mainID;
			vobject.task=Taskvo;
			var OrderRowdvo=new Object();
			OrderRowdvo.id=addArray[i];
			vobject.orderRow=OrderRowdvo;
			var padd = new SOAPClientParameters2(); 
			padd.add('OrderRowTaskVO',vobject);
			SOAPClient.invoke(urlorderRow2orderRowTasks, "createOrderRowTask", padd, false,  function GetEnu_callBack(ul, soapResponse){
				for(var j=0;j<querydataorderRow2orderRowTasksOrderRowd.length;j++){
					if(querydataorderRow2orderRowTasksOrderRowd[j][1]==addArray[i]){
						querydataorderRow2orderRowTasksOrderRowd[j][querydataorderRow2orderRowTasksOrderRowd[j].length-1]=ul;
						break;
						}
				}
			});
		}
		
		adddataorderRow2orderRowTasks=",";
		
	}*/
	
	
	var queryvoorderRow=new Object();
	var buildorderRowTasks2task=function(){
		if( mainID!=undefined && mainID!=''){
			getVOorderRow2orderRowTasksOrderRowd(mainID);
			if(gridorderRowTasks2task==undefined){
				gridorderRowTasks2task = new dojox.Grid({
							title: "",
							id: "gridorderRowTasks2task",
							jsId: "gridorderRowTasks2task",
							structure: layoutorderRow2orderRowTasks,
							rowCount:querydataorderRow2orderRowTasksOrderRowd.length,
							model:modelorderRow2orderRowTasks
						}, dojo.byId("gridorderRowTasks2task"));
						
				//gridorderRowTasks2task.resize({ h: dijit.byId("bottomPane").domNode.clientHeight-90});
			}else{
				gridorderRowTasks2task.updateRowCount(querydataorderRow2orderRowTasksOrderRowd.length); 
			}}

	}
	
	/*function pageSizeChangeorderRowTasks2task(mylabel){
			pagesizeorderRowTasks2task=mylabel;
			getVOorderRowTasks2taskOrderRowTask(queryvoorderRowTasks2taskOrderRowTask);
		}

		function allpageorderRowTasks2task(){
			pagesizeorderRowTasks2task=0;
			getVOorderRowTasks2taskOrderRowTask(queryvoorderRowTasks2taskOrderRowTask);
		}*/

		function upPageorderRowTasks2task(){
			pagenumberorderRowTasks2task--;
			getVOorderRowTasks2taskOrderRowTask(queryvoorderRowTasks2taskOrderRowTask);
		}
		function downPageorderRowTasks2task(){
			pagenumberorderRowTasks2task++;
			getVOorderRowTasks2taskOrderRowTask(queryvoorderRowTasks2taskOrderRowTask);
		}
	

	          //associatedClass==manageable
		
        //????????????layout??($member in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[orderRow], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[task]])??if(!${member.many})  ??¡Á?????????Float???????¡ã????????
	                 //????????????layout??($member in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[orderRow], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[task]])??if(!${member.many})  ??¡Á?????????Float???????¡ã????????
	                 //????????????layout??($member in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[orderRow], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[task]])??if(!${member.many})  ??¡Á?????????Float???????¡ã????????
	                                     
              //begin from 41.4
		var querydataorderRow2orderRowTasksOrderRowd =  new Array();
		
		var getChoiseorderRow2orderRowTasks= function(inRowIndex) {
			if(true==querydataorderRow2orderRowTasksOrderRowd[inRowIndex][0]){//'+querydataorderRow2orderRowTasksOrderRowd[inRowIndex][1]+'
				 return  '<input class="dojoxGrid-input"  name="selectorderRow2orderRowTasks" id="" checked="true" type="checkbox"  />';//onClick="clickorderRow2orderRowTasks('+inRowIndex+')"
			 }else{
				 return  '<input class="dojoxGrid-input"  name="selectorderRow2orderRowTasks" id=""  type="checkbox"  />';//onClick="clickorderRow2orderRowTasks('+inRowIndex+')"
			 }
		}

/*function clickorderRow2orderRowTasks(row){//  
			
			if(querydataorderRow2orderRowTasksOrderRowd[row][querydataorderRow2orderRowTasksOrderRowd[row].length-1]==undefined){
				var idStr=","+querydataorderRow2orderRowTasksOrderRowd[row][1]+",";
			
				if(adddataorderRow2orderRowTasks.indexOf(idStr)==-1){
					adddataorderRow2orderRowTasks=adddataorderRow2orderRowTasks+querydataorderRow2orderRowTasksOrderRowd[row][1]+",";
				}else{
					
					adddataorderRow2orderRowTasks=adddataorderRow2orderRowTasks.substring(0,adddataorderRow2orderRowTasks.indexOf(idStr))+adddataorderRow2orderRowTasks.substring(adddataorderRow2orderRowTasks.indexOf(idStr)+idStr.length-1);
				}
			
			}else{
				
				var idStr=","+querydataorderRow2orderRowTasksOrderRowd[row][querydataorderRow2orderRowTasksOrderRowd[row].length-1]+",";
				
				if(deletedataorderRow2orderRowTasks.indexOf(idStr)==-1){
					deletedataorderRow2orderRowTasks=deletedataorderRow2orderRowTasks+querydataorderRow2orderRowTasksOrderRowd[row][querydataorderRow2orderRowTasksOrderRowd[row].length-1]+",";
				}else{
					deletedataorderRow2orderRowTasks=deletedataorderRow2orderRowTasks.substring(0,deletedataorderRow2orderRowTasks.indexOf(idStr))+deletedataorderRow2orderRowTasks.substring(deletedataorderRow2orderRowTasks.indexOf(idStr)+idStr.length-1);
				}
			}
	}		*/
			var layoutorderRow2orderRowTasks=[{
				   //?¨´??field???????????????????¨°????js????toArray¡Á??????¡§??????querydate????????
		   
					 cells: [ [
							   //{ name: i18nStr.chose, width: 3, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
							   { name: i18nStr.chose, width: 3,styles: 'text-align: center;', get:getChoiseorderRow2orderRowTasks},
							   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
								  				  {name: i18nStr.productNum,field:2, width: 8}
						  								  				 ,  {name: i18nStr.unitNum,field:3, width: 8}
						  								  				 ,  {name: i18nStr.goodsSuttle,field:4, width: 8}
						  								  				 ,  {name: i18nStr.goodsWeight,field:5, width: 8}
						  								  				 ,  {name: i18nStr.goodsVolume,field:6, width: 8}
						  								  				,   {name: i18nStr.label, field: 7,width: 10 }
							  								  				 ,  {name: i18nStr.carriage,field:8, width: 8}
						  								  				,   {name: i18nStr.especial, field: 9,width: 10 }
							  								  				,   {name: i18nStr.goodsState, field: 10,width: 10 }
							  								  				,   {name: i18nStr.remark, field: 11,width: 10 }
							  								
		//??????¡À¨ª???¨ª????????
				,   {name: i18nStr.order,field: 12,get:function(inRowIndex){ var str='';var strid;if(querydataorderRow2orderRowTasksOrderRowd[inRowIndex]!=undefined && querydataorderRow2orderRowTasksOrderRowd[inRowIndex][12]!=undefined && querydataorderRow2orderRowTasksOrderRowd[inRowIndex][12][1]!=undefined){str=querydataorderRow2orderRowTasksOrderRowd[inRowIndex][12][2];strid=querydataorderRow2orderRowTasksOrderRowd[inRowIndex][12][1];} return str;} ,width: 10 }
						//??????¡À¨ª???¨ª????????
				,   {name: i18nStr.product,field: 13,get:function(inRowIndex){ var str='';var strid;if(querydataorderRow2orderRowTasksOrderRowd[inRowIndex]!=undefined && querydataorderRow2orderRowTasksOrderRowd[inRowIndex][13]!=undefined && querydataorderRow2orderRowTasksOrderRowd[inRowIndex][13][1]!=undefined){str=querydataorderRow2orderRowTasksOrderRowd[inRowIndex][13][2];strid=querydataorderRow2orderRowTasksOrderRowd[inRowIndex][13][1];} return str;} ,width: 10 }
									   ] ]
								   }]; 
								 //end from 41.4
                                 //????????????layout??($member in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[orderRow], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[task]])??if(!${member.many})  ??¡Á?????????Float???????¡ã????????
	                                          	              