	  	  //±¾Ä£°åµÄÔª±íÊÇ4.1µÄÔª±í£¬---begin---------ÅÐ¶Ï"¼ýÎ²±í/ÒýÓÃ±í"£¨"Ôª±í"Îª"¼ýÍ·±í"/"±»ÒýÓÃ±í"£©ÊÇ·ñÎª¶à¶Ô¶àµÄ¹ØÏµ±í
	   //true£º"¼ýÎ²±í/ÒýÓÃ±í"£¨"Ôª±í"Îª"¼ýÍ·±í"/"±»ÒýÓÃ±í"£©ÊÇ¶à¶Ô¶à¹ØÏµ±í
//---end---------ÅÐ¶Ï"¼ýÎ²±í/ÒýÓÃ±í"£¨"Ôª±í"Îª"¼ýÍ·±í"/"±»ÒýÓÃ±í"£©ÊÇ·ñÎª¶à¶Ô¶àµÄ¹ØÏµ±í
																																								//set (= orderRowTasks2task)
	//----------lastMenber = org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[task]   firstMenber=org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[orderRow]
	//orderRowTasks2taskAFTab.js	

	//---begin---------ÅÐ¶Ï"ÒýÓÃ±í" µÄ "ÒýÓÃ±í"ÊÇ·ñÎªtree½á¹¹±ísno('ÒýÓÃ±í'ÊÇ¶à¶Ô¶à¹ØÏµ±í)
																																																																																																															    //---end---------ÅÐ¶Ï"ÒýÓÃ±í" µÄ "ÒýÓÃ±í"ÊÇ·ñÎªtree½á¹¹±ísno
//begin--ÅÐ¶Ï"ÒýÓÃ±í" µÄ "ÒýÓÃ±í"ÊÇ·ñÎªÖ÷±í('ÒýÓÃ±í'ÊÇ¶à¶Ô¶à¹ØÏµ±í)
		//begin--ÅÐ¶Ï"ÒýÓÃ±í" µÄ "ÒýÓÃ±í"ÊÇ·ñÎª×Ó±í('ÒýÓÃ±í'ÊÇ¶à¶Ô¶à¹ØÏµ±í)
//"ÒýÓÃ±í" µÄ "ÒýÓÃ±í"ÊÇ×Ó±í(4OrderRowd.jsp)
//Õâ¸ö·ÖÖ§²»ÔÚÕâÀïÉú³É´úÂë£¬ÓÉ4.6.js.vslÉú³É£¬Ãû³ÆÓë±¾4.2.js.vslÏàÍ¬(?4-n.js.vsl)
		  var NUorderRowTasks2task = false;//needUpdate
		  var urlorderRow2orderRowTasks = getUrl()+ "services/OrderRowTaskManageService";
		  var deletedataorderRow2orderRowTasks =   ",";
		  var adddataorderRow2orderRowTasks =    ",";
		  var querydataorderRow2orderRowTasksOrderRowd =  new Array();
		  var pagenumberorderRow2orderRowTasks=1;
		  var totalCountorderRow2orderRowTasks=0;
		  var pagesizeorderRow2orderRowTasks=10;
		  var orderByorderRow2orderRowTasks='0';
		  var queryvoorderRow2orderRowTasks=new Object();
		  var oddstyle='';
		  var modelorderRowTasks2task = new dojox.grid.data.Table(null, querydataorderRow2orderRowTasksOrderRowd);
		  var gridorderRowTasks2task;

		var getVOorderRow2orderRowTasksOrderRowd=function(id){

			var pu = new SOAPClientParameters2();
			pu.add('id',id) ;
			SOAPClient.invoke(urlorderRow2orderRowTasks,"getOrderdByTaskId", pu, false,  function GetEnu_callBack(ul, soapResponse){  
			//querydataorderRow2orderRowTasksOrderRowd=dojoOrderd.OrderdVOtoArray_fun(ul,true);
			querydataorderRow2orderRowTasksOrderRowd=dojoOrderRowTask.OrderdVOtoArray_fun(ul,true);
			totalCountorderRow2orderRowTasks=ul[ul.length-1]["ns:id"]; 
			querydataorderRow2orderRowTasksOrderRowd.splice(querydataorderRow2orderRowTasksOrderRowd.length-1,1);
			//querydataorderRow2orderRowTasksOrderRowd=selected_fun(querydataorderRow2orderRowTasksOrderRowd);
				for(var i = 0; i < querydataorderRow2orderRowTasksOrderRowd.length; i++){	
				//var dataOrderRowd = new Array();
				var dataOrderRowd=querydataorderRow2orderRowTasksOrderRowd[i][childRow];
				dataOrderRowd=selected_fun(dataOrderRowd);
				querydataorderRow2orderRowTasksOrderRowd[i][childRow]=dataOrderRowd;
			}
			}); 
			modelorderRowTasks2task.setData(querydataorderRow2orderRowTasksOrderRowd);
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
                        if(row[row.length-1]==undefined||row[row.length-1]==''){
							row[0] = false;
						}else{
							row[0] = true;
						}
						transData[i]=row;
						}
				return 		transData;
		  }
	
	function saveorderRowTasks2task(){
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
				for(var ii=0;ii<querydataorderRow2orderRowTasksOrderRowd.length;ii++){
					var subdata=querydataorderRow2orderRowTasksOrderRowd[ii][childRow];

					for(var j=0;j<subdata.length;j++){
						if(subdata[j][1]==addArray[i]){
							subdata[j][subdata[j].length-1]=ul;
							querydataorderRow2orderRowTasksOrderRowd[ii][childRow]=subdata;//need?
							break;
							}
					}
				}	
			});
		}
		
		adddataorderRow2orderRowTasks=",";
		
	}
	
	
	var queryvoorderRow=new Object();
	var buildorderRowTasks2task=function(){
		if(NUorderRowTasks2task && mainID!=undefined && mainID!=''){
			getVOorderRow2orderRowTasksOrderRowd(mainID);
			if(dijit.byId("gridorderRowTasks2task")==undefined){
				gridorderRowTasks2task = new dojox.Grid({
							title: "",
							id: "gridorderRowTasks2task",
							jsId: "gridorderRowTasks2task",
							structure: layoutorderRowTasks2task,
							rowCount:querydataorderRow2orderRowTasksOrderRowd.length,
							model:modelorderRowTasks2task
						}, dojo.byId("gridorderRowTasks2task"));
						
				gridorderRowTasks2task.resize({ h: dijit.byId("bottomPane").domNode.clientHeight-90});
			}else{
				gridorderRowTasks2task.updateRowCount(querydataorderRow2orderRowTasksOrderRowd.length); 
			}
			
			NUorderRowTasks2task=false;
		}

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
		
        //¶ÔÓÚ¿ÉÐÞ¸ÄµÄlayout£¬($member in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[orderRow], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[task]])²¢if(!${member.many})  µÄ×Ö¶ÎÓ¦µ¯³öFloatµÄÑ¡Ôñ´°¿Ú´ý²âÊÔ
	                 //¶ÔÓÚ¿ÉÐÞ¸ÄµÄlayout£¬($member in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[orderRow], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[task]])²¢if(!${member.many})  µÄ×Ö¶ÎÓ¦µ¯³öFloatµÄÑ¡Ôñ´°¿Ú´ý²âÊÔ
	                 //¶ÔÓÚ¿ÉÐÞ¸ÄµÄlayout£¬($member in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[orderRow], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[task]])²¢if(!${member.many})  µÄ×Ö¶ÎÓ¦µ¯³öFloatµÄÑ¡Ôñ´°¿Ú´ý²âÊÔ
	                                     
              //begin from 41.4
		var querydataorderRow2orderRowTasksOrderRowd =  new Array();
		
		
		
		
		
		var getChoiseorderRow2orderRowTasks= function(parentInRowIndex,inRowIndex) {
			var subdata=querydataorderRow2orderRowTasksOrderRowd[parentInRowIndex][childRow];
			if(true==subdata[inRowIndex][0]){//'+querydataorderRow2orderRowTasksOrderRowd[inRowIndex][1]+'
				 return  '<input class="dojoxGrid-input"  name="selectorderRow2orderRowTasks" id="" checked="true" type="checkbox" onClick="clickorderRow2orderRowTasks('+parentInRowIndex+','+inRowIndex+')" />';
			 }else{
				 return  '<input class="dojoxGrid-input"  name="selectorderRow2orderRowTasks" id=""  type="checkbox" onClick="clickorderRow2orderRowTasks('+parentInRowIndex+','+inRowIndex+')" />';
			 }
		}

function clickorderRow2orderRowTasks(parentInRowIndex,inRowIndex){//  
	var subdata=querydataorderRow2orderRowTasksOrderRowd[parentInRowIndex][childRow];
	var len=subdata[inRowIndex].length;		
	if(subdata[inRowIndex][len-1]==undefined||subdata[inRowIndex][len-1]==''){
				var idStr=","+subdata[inRowIndex][1]+",";
			
				if(adddataorderRow2orderRowTasks.indexOf(idStr)==-1){
					adddataorderRow2orderRowTasks=adddataorderRow2orderRowTasks+subdata[inRowIndex][1]+",";
				}else{
					
					adddataorderRow2orderRowTasks=adddataorderRow2orderRowTasks.substring(0,adddataorderRow2orderRowTasks.indexOf(idStr))+adddataorderRow2orderRowTasks.substring(adddataorderRow2orderRowTasks.indexOf(idStr)+idStr.length-1);
				}
			
			}else{
				
				var idStr=","+subdata[inRowIndex][len-1]+",";
				
				if(deletedataorderRow2orderRowTasks.indexOf(idStr)==-1){
					deletedataorderRow2orderRowTasks=deletedataorderRow2orderRowTasks+subdata[inRowIndex][len-1]+",";
				}else{
					deletedataorderRow2orderRowTasks=deletedataorderRow2orderRowTasks.substring(0,deletedataorderRow2orderRowTasks.indexOf(idStr))+deletedataorderRow2orderRowTasks.substring(deletedataorderRow2orderRowTasks.indexOf(idStr)+idStr.length-1);
				}
			}
	}		


	var dojoOrderdSelect;			
	var dojoProdSelect;			

//from 20.1 begin
																																																																		                  // totleinum = 18 
 //		(18 >= 12)
	  //rowinum=10
			var layoutorderRowTasks2task =[{//?????????colSpantoggle
					onBeforeRow: onBeforeRow,
					 cells: [
                      [
						{ name: 'choise', width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },
						{ name: i18nStr.detail, width: 3, get: getCheckOrderd, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
				//---------------------------------------------------------------------//rowinum=11   inum=2
					  			  ////////////////////////////////////////
			    											  {name: i18nStr.customerOrderNo, field: 2,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																		  			//--------------  if (3 == 11)
						//---------------------------------------------------------------------//rowinum=11   inum=3
					  			  ////////////////////////////////////////
			    											,   {name: i18nStr.contractNo, field: 3,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																		  			//--------------  if (4 == 11)
						//---------------------------------------------------------------------//rowinum=11   inum=4
					  			  ////////////////////////////////////////
			    					,   {name: i18nStr.conveyanceEnum, field: 4,width: 10 , editor: mydojo.FilteringSelect ,options:dojoOrderRowTask.itemconveyanceEnumOption,required:true ,invalidMessage:'can not be empty'}
												  			//--------------  if (5 == 11)
						//---------------------------------------------------------------------//rowinum=11   inum=5
					  			  ////////////////////////////////////////
			    					,   {name: i18nStr.carryTypeEnum, field: 5,width: 10 , editor: mydojo.FilteringSelect ,options:dojoOrderRowTask.itemcarryTypeEnumOption,required:false ,invalidMessage:'can not be empty'}
												  			//--------------  if (6 == 11)
						//---------------------------------------------------------------------//rowinum=11   inum=6
					  			  ////////////////////////////////////////
			    											,   {name: i18nStr.shipperRemark, field: 6,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																		  			//--------------  if (7 == 11)
						//---------------------------------------------------------------------//rowinum=11   inum=7
					  			  ////////////////////////////////////////
			    											,   {name: i18nStr.carrierRemark, field: 7,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																		  			//--------------  if (8 == 11)
						//---------------------------------------------------------------------//rowinum=11   inum=8
					  			  ////////////////////////////////////////
			    					,   {name: i18nStr.levelEnum, field: 8,width: 10 , editor: mydojo.FilteringSelect ,options:dojoOrderRowTask.itemlevelEnumOption,required:false ,invalidMessage:'can not be empty'}
												  			//--------------  if (9 == 11)
						//---------------------------------------------------------------------//rowinum=11   inum=9
		//
												  					    							,   {name: i18nStr.customerTypeEnum, field: 9,width: 10 , editor: mydojo.FilteringSelect ,options:dojoOrderRowTask.itemcustomerTypeEnumOption,required:false ,invalidMessage:'can not be empty'}
																		  								],[
													//---------------------------------------------------------------------//rowinum=11   inum=10
		                     //----------------(inum:10)  (rowinum: 11)
			//delete1
			 					  {name: i18nStr.referTime,field:10, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
										,   {name: i18nStr.referTimeTime,field:11, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
					 			  						//---------------------------------------------------------------------//rowinum=11   inum=12
		                     //----------------(inum:12)  (rowinum: 11)
			//delete1
			 			  ////////////////////////////////////////
			    											,   {name: i18nStr.linkMan, field: 12,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																		  						//---------------------------------------------------------------------//rowinum=11   inum=13
		                     //----------------(inum:13)  (rowinum: 11)
			//delete1
			 			  ////////////////////////////////////////
			    											,   {name: i18nStr.tel, field: 13,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																		  						//---------------------------------------------------------------------//rowinum=11   inum=14
		                     //----------------(inum:14)  (rowinum: 11)
			//delete1
			 					,   {name: i18nStr.bookTime,field:14, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
										,   {name: i18nStr.bookTimeTime,field:15, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
					 			  						//---------------------------------------------------------------------//rowinum=11   inum=16
		                     //----------------(inum:16)  (rowinum: 11)
			//delete1
			 					,   {name: i18nStr.completeTime,field:16, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
										,   {name: i18nStr.completeTimeTime,field:17, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
					 			  						//---------------------------------------------------------------------//rowinum=11   inum=18
		                     //----------------(inum:18)  (rowinum: 11)
			//delete1
			 			  ////////////////////////////////////////
			    											,   {name: i18nStr.remark, field: 18,width: 10, editor: dojox.grid.editors.Editor,required:false, editorToolbar: true  }
																		  							
	//
		  //(18 > 11)
			//delete2
										//
		  //(18 > 11)
			//delete2
								 ,   {name: i18nStr.customer,field: 20,get:function(inRowIndex){ var str='';var strid;if(querydataorderRow2orderRowTasksOrderRowd[inRowIndex]!=undefined && querydataorderRow2orderRowTasksOrderRowd[inRowIndex][20]!=undefined && querydataorderRow2orderRowTasksOrderRowd[inRowIndex][20][1]!=undefined){str=querydataorderRow2orderRowTasksOrderRowd[inRowIndex][20][2];strid=querydataorderRow2orderRowTasksOrderRowd[inRowIndex][20][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" class="imgSelectStyle" onclick="dojoOrderRowTask.selectCustomer('+strid+','+inRowIndex+',20,0,event);"   >';} ,width: 10 }
															,   {name: ' ',colSpan: 1 ,value:' ' ,width: 10 }
			
	
],[
				{ name: '\u8be6\u7ec6', colSpan: 11 ,styles: 'padding: 0; margin: 0;', get: getDetailOrderd }//value: '<div style="height:0px; background-color: white;"></div>'
			  ]
		  ]

		}];	 
		

/*	function selectOrderRowdFun(rep){
		querydataorderRow2orderRowTasksOrderRowd[dojoOrderd.selectOrderRowdInRow][dojoOrderd.noOrderRowd]=rep;
		gridorderRowTasks2task.updateRow(dojoOrderd.selectOrderRowdInRow);		
	}
	function selectCustomerFun(rep){
		querydataorderRow2orderRowTasksOrderRowd[dojoOrderd.selectCustomerInRow][dojoOrderd.noCustomer]=rep;
		gridorderRowTasks2task.updateRow(dojoOrderd.selectCustomerInRow);		
	}
*/
		
var detailRowsOrderd=[];
function onBeforeRow(inDataIndex, inRow) {	if (inRow[2]!=undefined)inRow[2].hidden = !detailRowsOrderd[inDataIndex];}	
function toggleOrderd(inIndex, inShow) {
        			//if (!inShow) destroySubGridIdGeneral('',querydataorderRow2orderRowTasksOrderRowd[inIndex][1],"OrderdMainDetail");
					if (!inShow) destroySubGridIdGeneral('',querydataorderRow2orderRowTasksOrderRowd[inIndex][1],"OrderdChild");
				    detailRowsOrderd[inIndex] = inShow;
				    dijit.byId("gridorderRowTasks2task").updateRow(inIndex); 
				    
    } 

function getCheckOrderd(inRowIndex) {
	var image = (detailRowsOrderd[inRowIndex] ? 'open.gif' : 'closed.gif');
	var show = (detailRowsOrderd[inRowIndex] ? 'false' : 'true');
	return '<img src="../image/' + image + '" onclick="toggleOrderd(' + inRowIndex + ', ' + show + ')" height="11" width="11">';
}

function getDetailOrderd(inRowIndex){
	if(detailRowsOrderd[inRowIndex]){
		var cell = this;
		setTimeout(function() { buildSubgridOrderd(inRowIndex, cell); }, 0);  }
		var h =0;
		if(detailRowsOrderd[inRowIndex]&&querydataorderRow2orderRowTasksOrderRowd[inRowIndex][19]!=undefined &&querydataorderRow2orderRowTasksOrderRowd[inRowIndex][19].length>0){
							h=65+25*querydataorderRow2orderRowTasksOrderRowd[inRowIndex][19].length;  		}
	return '<div style="height:'+h+'px; background-color: white;"></div>';
}

//function makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString) {return parentRowIndex+"_"+idString+"_" + inRowIndex;		}

//function destroySubGridIdGeneral(parentRowIndex,inRowIndex,idString) {	var subGrid = dijit.byId(makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString));	if (subGrid) subGrid.destroy();	}
var childRow= 19;
var layoutInRowIndex;	  



/*var addrow=[];
				
addrow.splice(0,0,false,0);*/




function buildSubgridOrderd(inRowIndex, inCell) {  //makeSubgridIdMainDetail(id)?idmainDetailGridid
	if(inCell!=undefined && inCell.getNode(inRowIndex)!=undefined){
		var child = inCell.getNode(inRowIndex).firstChild;
		//var child = inCell.getNode(inRowIndex).lastChild;
		//var idmainDetail = makeSubGridIdGeneral('',querydataorderRow2orderRowTasksOrderRowd[inRowIndex][1],"OrderdMainDetail");//makeSubgridIdMainDetail(querydataorderRow2orderRowTasksOrderRowd[inRowIndex][1]);//taskmakeSubgridId(taskRowSubdata[inRowIndex][1]);
		var idchild = makeSubGridIdGeneral('',querydataorderRow2orderRowTasksOrderRowd[inRowIndex][1],"OrderdChild");
		//var subGridMainDetail = dijit.byId(idmainDetail);
		var subGridChild = dijit.byId(idchild);
		var dataChild=querydataorderRow2orderRowTasksOrderRowd[inRowIndex][19];
		if(dataChild!=undefined){
			if (subGridChild){
				subGridChild.model.setData(dataChild);
				child.appendChild(subGridChild.domNode);
			}else{
				modelOrderdChild=new dojox.grid.data.Table(null, dataChild);
				var childProps= {
								autoHeight: true, 
								autoRender: false,
								rowCount:dataChild.length,
								model:modelOrderdChild,							};
				childProps.dataRow = inRowIndex;
				childProps.id = idchild;
				if(Math.ceil(inRowIndex/2)>inRowIndex/2){
					childLayoutOdd=buildChildLayout(pre,headerstyleodd,inRowIndex);	
					childProps.structure=childLayoutOdd;
				}else{
					childLayout=buildChildLayout(pre,headerstyle,inRowIndex);
					childProps.structure=childLayout;
				}
				subGridChild = new dojox.Grid(childProps, child);//grid?????DIV?§³
			}
			if (subGridChild) {
				subGridChild.render();
				subGridChild.cacheHeight = subGridChild.domNode.offsetHeight;
			}	      				
		}
		
		
		inCell.grid.rowHeightChanged(inRowIndex);
    }   
}		
		
		
		
		
		
//from 20.1 end

//from 20.2 begin
//${member.type.name}SubCrudForSubGrid.js==OrderRowdSubCrudForSubGrid.js
//»ñµÃÖ÷±íÀàÐÍvar mainTable=new VO();

var addRowSub = function(addindex){
	  var subGrid = dijit.byId(makeSubGridIdGeneral('',querydataorderRow2orderRowTasksOrderRowd[addindex][1],"OrderdChild"));
	  subGrid.addRow([false,0,"","","","","","","","","","","","","","","","","",""],subGrid.model.getRowCount());
}


var deleteSub= function(mainRow,subIndexRow,subId){
	var subGrid = dijit.byId(makeSubGridIdGeneral('',querydataorderRow2orderRowTasksOrderRowd[mainRow][1],"OrderdChild"));
	var s= new Array();
	s[0]=subIndexRow;
	if(subId!=0){
		var pdel = new SOAPClientParameters();      
	    pdel.add('id',subId);
	    SOAPClient.invoke(urlOrderRowd, "deleteOrderRowd", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	});}
	subGrid.model.remove(s);
 }

function saveSubRow(subGrid,thisCell,i){		 
         var vobject=new Object();
		 var passAll=0;
         var padd = new SOAPClientParameters2();
	     vobject.id=thisCell[1];
             if(dojox.validate.isInRange(thisCell[2],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[2];vobject.productNum=n;
             }else{subGrid.getCell(subGrid.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[3],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[3];vobject.unitNum=n;
             }else{subGrid.getCell(subGrid.model.fieldArray[3]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[4],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[4];vobject.goodsSuttle=n;
             }else{subGrid.getCell(subGrid.model.fieldArray[4]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[5],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[5];vobject.goodsWeight=n;
             }else{subGrid.getCell(subGrid.model.fieldArray[5]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[6],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[6];vobject.goodsVolume=n;
             }else{subGrid.getCell(subGrid.model.fieldArray[6]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

               vobject.label=thisCell[7];
 
             if(dojox.validate.isInRange(thisCell[8],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[8];vobject.carriage=n;
             }else{subGrid.getCell(subGrid.model.fieldArray[8]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

               vobject.especial=thisCell[9];
 
               vobject.goodsState=thisCell[10];
 
               vobject.remark=thisCell[11];
 

																var mainTable=new Object();
			mainTable.id=querydataorderRow2orderRowTasksOrderRowd[subGrid.dataRow][1];
            vobject.order=mainTable;
																var manageable=new Object();
			 if(querydataorderRow2orderRowTasksOrderRowd[subGrid.dataRow][childRow][i]!=''&&querydataorderRow2orderRowTasksOrderRowd[subGrid.dataRow][childRow][i][13]!=undefined){
				manageable.id=querydataorderRow2orderRowTasksOrderRowd[subGrid.dataRow][childRow][i][13][1];
				vobject.product=manageable;
			 }else{
			 subGrid.getCell(subGrid.model.fieldArray[13]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
			


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('OrderRowdVO',vobject);
                SOAPClient.invoke(urlOrderRowd, "createOrderRowd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                subGrid.model.setDatum(ul,i,1);
				
                });
	         }else{//modify row
                padd.add('OrderRowdVO',vobject);
                SOAPClient.invoke(urlOrderRowd, "updateOrderRowd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
			 //querydataorderRow2orderRowTasksOrderRowd[document.getElementById('erowIndexOrderRowd').value][childRow]=querydataSub;//????????????????????????????????????????????????????????????????????????????/
        } }
		
function call_funUpdGridSub(mainRow,subIndexRow) {
var subGrid = dijit.byId(makeSubGridIdGeneral('',querydataorderRow2orderRowTasksOrderRowd[mainRow][1],"OrderdChild"));
	
	if(subGrid){
	var sall=subGrid.model.data;
	if(subIndexRow==undefined || subIndexRow==''){
		for(var i=0;i<sall.length;i++){
         var thisCell=sall[i];
         saveSubRow(subGrid,thisCell,i);
		}//for
	}else{
		 var thisCell=sall[subIndexRow];
		saveSubRow(subGrid,thisCell,subIndexRow);
	}}
}		  

var urlOrderRowd = getUrl()+ "services/OrderdManageService";
//var deletedataOrderRowd =  new Array();
//var querydataOrderRowd =  new Array();
var deletedataSub =  new Array();
//var querydataSub=  new Array();
var pagenumberOrderRowd=1;
var pagesizeOrderRowd=10;
var orderByOrderRowd='0';
var queryvoOrderRowd=new Object();
var oddstyle='';
//var modelChildAdd = new dojox.grid.data.Table(null, querydataSub);
var childLayout;
var childLayoutOdd;

function buildChildLayout(pre,mystyle,addRowIndex){
	var myLayout=[{
          
                 //¸ù¾ÝfieldµÄÖµ£¬ÒÀ¾ÝÄ¬ÈÏµÄË³Ðò£¬´ÓjsÖÐµÄtoArray×ª»»·½·¨·µ»ØµÄquerydataÖÐÈ¡Êý¾Ý
                       
 cells: [ [
			//{ name: '<img src="../image/addsmall.gif" onclick="addRowSub('+addRowIndex +');"   height="18" width="18" border="0">' ,get:function(inRowIndex) {return '<img src="../image/delsmall.gif" onclick="deleteSub('+addRowIndex +','+inRowIndex+','+(querydataorderRow2orderRowTasksOrderRowd[addRowIndex][childRow]!=undefined ? 0:querydataorderRow2orderRowTasksOrderRowd[addRowIndex][childRow][inRowIndex][1])+');"  height="18" width="18" border="0">&nbsp;&nbsp;&nbsp;<img src="../image/savesmall.gif" onclick="call_funUpdGridSub('+addRowIndex +','+inRowIndex+');"  height="18" width="18" border="0">';}, width: 6,styles: 'text-align: center;',headerStyles:mystyle},//
			{ name: pre+i18nStr.chose, width: 3, styles: 'text-align: center;', headerStyles:mystyle , get:function(inRowIndex){return getChoiseorderRow2orderRowTasks(addRowIndex,inRowIndex);}},//
		    { name: pre+i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} ,headerStyles:mystyle},//
            {name: pre+i18nStr.productNum,field:2, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 },headerStyles:mystyle }
		             ,  {name: pre+i18nStr.unitNum,field:3, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 },headerStyles:mystyle }
		             ,  {name: pre+i18nStr.goodsSuttle,field:4, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 },headerStyles:mystyle }
		             ,  {name: pre+i18nStr.goodsWeight,field:5, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 },headerStyles:mystyle }
		             ,  {name: pre+i18nStr.goodsVolume,field:6, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 },headerStyles:mystyle }
		        					,   {name: pre+i18nStr.label, field: 7,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30,headerStyles:mystyle}
					                 ,  {name: pre+i18nStr.carriage,field:8, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 },headerStyles:mystyle }
		        					,   {name: pre+i18nStr.especial, field: 9,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30,headerStyles:mystyle}
					            					,   {name: pre+i18nStr.goodsState, field: 10,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30,headerStyles:mystyle}
					            				    ,   {name: pre+i18nStr.remark, field: 11,width: 20, editor: dojox.grid.editors.Editor, editorToolbar: true  ,headerStyles:mystyle}
					      
//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
				//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
							 ,   {name: pre+i18nStr.product,field: 13,get:function(inRowIndex){ var str='';var strid;if(querydataorderRow2orderRowTasksOrderRowd[addRowIndex][childRow]!=undefined && querydataorderRow2orderRowTasksOrderRowd[addRowIndex][childRow][inRowIndex]!=undefined && querydataorderRow2orderRowTasksOrderRowd[addRowIndex][childRow][inRowIndex][13]!=undefined&& querydataorderRow2orderRowTasksOrderRowd[addRowIndex][childRow][inRowIndex][13][2]!=undefined){str=querydataorderRow2orderRowTasksOrderRowd[addRowIndex][childRow][inRowIndex][13][2];strid=querydataorderRow2orderRowTasksOrderRowd[addRowIndex][childRow][inRowIndex][13][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" style="vertical-align:middle;margin-top:0px;margin-left:8px;" onclick=" dojoOrderRowTask.selectProd('+strid+','+inRowIndex+',13,0,event,'+addRowIndex+');"   >';} ,width: 10 ,headerStyles:mystyle}
					                                        ] ]
                           }];  
						   
			return myLayout;			   
}

				function selectProdFun(rep){
			querydataorderRow2orderRowTasksOrderRowd[dojoOrderRowTask.mainRowIndexProd][childRow][ dojoOrderRowTask.selectProdInRow][ dojoOrderRowTask.noProd]=rep;
			var subGrid = dijit.byId(makeSubGridIdGeneral('',querydataorderRow2orderRowTasksOrderRowd[dojoOrderRowTask.mainRowIndexProd][1],"OrderdChild"));
			subGrid.model.setDatum(rep, dojoOrderRowTask.selectProdInRow, dojoOrderRowTask.noProd);	
		}
	


//from 20.2 end




 

				                   //¶ÔÓÚ¿ÉÐÞ¸ÄµÄlayout£¬($member in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[orderRow], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[task]])²¢if(!${member.many})  µÄ×Ö¶ÎÓ¦µ¯³öFloatµÄÑ¡Ôñ´°¿Ú´ý²âÊÔ
	                                          	              	
