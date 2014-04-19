		  
			//set (= customer2orderds)
	//name =customer2orderdsCrudAFTab.js  manageable.name=Orderd
									  var NUcustomer2orderds = false;//needUpdate
  var urlcustomer2orderds = getUrl()+ "services/OrderdManageService";
  var deletedatacustomer2orderds =  new Array();
  var querydatacustomer2orderds =  new Array();
  var pagenumbercustomer2orderds=1;
  var totalCountcustomer2orderds=0;
  var pagesizecustomer2orderds=10;
  var orderBycustomer2orderds='0';
  var queryvocustomer2orderds=new Object();
  var oddstyle='';
  var modelcustomer2orderds = new dojox.grid.data.Table(null, querydatacustomer2orderds);
  var gridcustomer2orderds;
  var urle2 = getUrl()+ "services/BasicManageService";   
//----------move from 30.1 begin-----------

																																																																		                  // totleinum = 18 
 //		(18 >= 12)
	  //rowinum=10
			var layoutcustomer2orderds =[{//?????????colSpantoggle
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
			    					,   {name: i18nStr.conveyanceEnum, field: 4,width: 10 , editor: mydojo.FilteringSelect ,options:dojoOrderd.itemconveyanceEnumOption,required:true ,invalidMessage:'can not be empty'}
												  			//--------------  if (5 == 11)
						//---------------------------------------------------------------------//rowinum=11   inum=5
					  			  ////////////////////////////////////////
			    					,   {name: i18nStr.carryTypeEnum, field: 5,width: 10 , editor: mydojo.FilteringSelect ,options:dojoOrderd.itemcarryTypeEnumOption,required:false ,invalidMessage:'can not be empty'}
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
			    					,   {name: i18nStr.levelEnum, field: 8,width: 10 , editor: mydojo.FilteringSelect ,options:dojoOrderd.itemlevelEnumOption,required:false ,invalidMessage:'can not be empty'}
												  			//--------------  if (9 == 11)
						//---------------------------------------------------------------------//rowinum=11   inum=9
		//
												  					    							,   {name: i18nStr.customerTypeEnum, field: 9,width: 10 , editor: mydojo.FilteringSelect ,options:dojoOrderd.itemcustomerTypeEnumOption,required:false ,invalidMessage:'can not be empty'}
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
								 ,   {name: i18nStr.customer,field: 20,get:function(inRowIndex){ var str='';var strid;if(querydatacustomer2orderds[inRowIndex]!=undefined && querydatacustomer2orderds[inRowIndex][20]!=undefined && querydatacustomer2orderds[inRowIndex][20][1]!=undefined){str=querydatacustomer2orderds[inRowIndex][20][2];strid=querydatacustomer2orderds[inRowIndex][20][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" class="imgSelectStyle"onclick="dojoOrderd.selectCustomer('+strid+','+inRowIndex+',20,0,event);"   >';} ,width: 10 }
															,   {name: ' ',colSpan: 1 ,value:' ' ,width: 10 }
			
	
],[
				{ name: '\u8be6\u7ec6', colSpan: 11 ,styles: 'padding: 0; margin: 0;', get: getDetailOrderd }//value: '<div style="height:0px; background-color: white;"></div>'
			  ]
		  ]

		}];	 




var detailRowsOrderd=[];

function onBeforeRow(inDataIndex, inRow) {	if (inRow[2]!=undefined)inRow[2].hidden = !detailRowsOrderd[inDataIndex];}	

function toggleOrderd(inIndex, inShow) {
        			//if (!inShow) destroySubGridIdGeneral('',querydatacustomer2orderds[inIndex][1],"OrderdMainDetail");
					if (!inShow) destroySubGridIdGeneral('',querydatacustomer2orderds[inIndex][1],"OrderdChild");
				    detailRowsOrderd[inIndex] = inShow;
				    dijit.byId("gridcustomer2orderds").updateRow(inIndex); 
				    
    } 

function getCheckOrderd(inRowIndex) {
	var image = (detailRowsOrderd[inRowIndex] ? 'open.gif' : 'closed.gif');
	var show = (detailRowsOrderd[inRowIndex] ? 'false' : 'true');
	return '<img src="../image/' + image + '" onclick="toggleOrderd(' + inRowIndex + ', ' + show + ')" height="11" width="11">';
}

function getDetailOrderd(inRowIndex){
	if(detailRowsOrderd[inRowIndex]){
		var cell = this;
		setTimeout(function() { buildSubgridcustomer2orderds(inRowIndex, cell); }, 0);  }
		var h =0;
		if(detailRowsOrderd[inRowIndex]&&querydatacustomer2orderds[inRowIndex][19].length>0){
							h=65+25*querydatacustomer2orderds[inRowIndex][19].length;  		}
	return '<div style="height:'+h+'px; background-color: white;"></div>';
}

//function makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString) {return parentRowIndex+"_"+idString+"_" + inRowIndex;		}

//function destroySubGridIdGeneral(parentRowIndex,inRowIndex,idString) {	var subGrid = dijit.byId(makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString));	if (subGrid) subGrid.destroy();	}
var childRow= 19;
var layoutInRowIndex;	  
function buildSubgridcustomer2orderds(inRowIndex, inCell) {  //makeSubgridIdMainDetail(id)?idmainDetailGridid
	if(inCell!=undefined && inCell.getNode(inRowIndex)!=undefined){
		var child = inCell.getNode(inRowIndex).firstChild;
		//var child = inCell.getNode(inRowIndex).lastChild;
		//var idmainDetail = makeSubGridIdGeneral('',querydatacustomer2orderds[inRowIndex][1],"OrderdMainDetail");//makeSubgridIdMainDetail(querydatacustomer2orderds[inRowIndex][1]);//taskmakeSubgridId(taskRowSubdata[inRowIndex][1]);
		var idchild = makeSubGridIdGeneral('',querydatacustomer2orderds[inRowIndex][1],"OrderdChild");
		//var subGridMainDetail = dijit.byId(idmainDetail);
		var subGridChild = dijit.byId(idchild);
		var dataChild=querydatacustomer2orderds[inRowIndex][19];
		//if(dataChild.length!=0){
			if (subGridChild){
				subGridChild.model.setData(dataChild);
				child.appendChild(subGridChild.domNode);
			}else{
				modelOrderdChild=new dojox.grid.data.Table(null, dataChild);
				var childProps= {
								autoHeight: true, 
								autoRender: false,
								rowCount:dataChild.length,
								model:modelOrderdChild						};
				childProps.dataRow = inRowIndex;
				childProps.id = idchild;
				if(Math.ceil(inRowIndex/2)>inRowIndex/2){
					childLayoutOdd=buildChildLayout(pre,headerstyleodd,inRowIndex);	
					childProps.structure=childLayoutOdd;
				}else{
					childLayout=buildChildLayout(pre,headerstyle,inRowIndex);
					childProps.structure=childLayout;
				}
				subGridChild = new dojox.Grid(childProps, child);//grid?????DIV?
			}
			if (subGridChild) {
				subGridChild.render();
				subGridChild.cacheHeight = subGridChild.domNode.offsetHeight;
			}	      				
		//}
		
		/*var detailDate=[];
		detailDate[0]=querydatacustomer2orderds[inRowIndex];  
	    modelOrderdDetail=new dojox.grid.data.Table(null, detailDate);
		if (subGridMainDetail) {
			subGridMainDetail.model.setData(detailDate);
			mainDetail.appendChild(subGridMainDetail.domNode);
		} else {
			var mainDetailProps = {
				rowCount: 1, 
				autoHeight: true, 
				autoRender: false,
				model:modelOrderdDetail
				};
				mainDetailProps.dataRow = inRowIndex;
				mainDetailProps.id = idmainDetail;//	tasksubGridProps.widgetId = id;
				if(Math.ceil(inRowIndex/2)>inRowIndex/2){
					mainDetailProps.structure=mainDetailLayoutOdd;
				}else{
					mainDetailProps.structure=mainDetailLayout;
				}
				subGridMainDetail = new dojox.Grid(mainDetailProps, mainDetail );
		}
			
		if (subGridMainDetail) {
				subGridMainDetail.render();
				subGridMainDetail.cacheHeight = subGridMainDetail.domNode.offsetHeight;
			}*/	
		inCell.grid.rowHeightChanged(inRowIndex);
    }   
}


  
//-----------move from 30.1 end------------  
var getVOcustomer2orderds=function(queryvo){

	var pu = new SOAPClientParameters2();
	pu.add('OrderdVO',queryvo) ;
	pu.add('pageNumber',pagenumbercustomer2orderds) ;
	pu.add('pageSize',pagesizecustomer2orderds) ;
	pu.add('orderBy',orderBycustomer2orderds) ;
	SOAPClient.invoke(urlcustomer2orderds,"getOrderd", pu, false,  function GetEnu_callBack(ul, soapResponse){     
//???¡À?????¡À,?????¡À?¡À????	
	querydatacustomer2orderds=dojoOrderd.OrderdVOtoArray_fun(ul,true);
	totalCountcustomer2orderds=ul[ul.length-1]["ns:id"]; 
	}); 
	var totalpage=Math.ceil(new Number(totalCountcustomer2orderds)/pagesizecustomer2orderds);
	
	if(totalpage>1){
		if(pagenumbercustomer2orderds==1){
			dijit.byId("but6customer2orderds").setDisabled(true);
			dijit.byId("but7customer2orderds").setDisabled(false);
		}else if(pagenumbercustomer2orderds==totalpage){
			dijit.byId("but6customer2orderds").setDisabled(false);
			dijit.byId("but7customer2orderds").setDisabled(true);
		}else{
			dijit.byId("but6customer2orderds").setDisabled(false);
			dijit.byId("but7customer2orderds").setDisabled(false);
		}
	}else{
		dijit.byId("but6customer2orderds").setDisabled(true);
		dijit.byId("but7customer2orderds").setDisabled(true);
	
	}
	if(pagesizecustomer2orderds==0){
		totalpage=1;
		dijit.byId("but6customer2orderds").setDisabled(true);
		dijit.byId("but7customer2orderds").setDisabled(true);
	}
	if(totalpage==1)pagenumbercustomer2orderds=1;
	
	 document.getElementById("rowCountcustomer2orderds").innerHTML=i18nStr.di+" "+pagenumbercustomer2orderds+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountcustomer2orderds+" "+i18nStr.rowSize; 	

	querydatacustomer2orderds.splice(querydatacustomer2orderds.length-1,1);
	modelcustomer2orderds.setData(querydatacustomer2orderds);
}

var buildcustomer2orderds=function(){
	if(NUcustomer2orderds && mainID!=undefined && mainID!=''){
		var queryFloatCustomer=new Object();
		queryFloatCustomer.id=mainID;
		queryvocustomer2orderds.customer=queryFloatCustomer;
		getVOcustomer2orderds(queryvocustomer2orderds);
		if(dijit.byId("gridcustomer2orderds")==undefined){
			  gridcustomer2orderds = new dojox.Grid({
						title: "",
						id: "gridcustomer2orderds",
						jsId: "gridcustomer2orderds",
						structure: layoutcustomer2orderds,
						rowCount:querydatacustomer2orderds.length,
						model:modelcustomer2orderds
					}, dojo.byId("gridcustomer2orderds"));
				gridcustomer2orderds.resize({ h: dijit.byId("bottomPane").domNode.clientHeight-90});
				
		}else{
			gridcustomer2orderds.updateRowCount(querydatacustomer2orderds.length); 
		}
		NUcustomer2orderds=false;
	}

}

																																																																
//??¨ª????
	//??¨ª????
									   
var addRowcustomer2orderds = function(){
var addrow=[];
														addrow.push('');
																					addrow.push('');
																					addrow.push('');
																					addrow.push('');
																					addrow.push('');
																					addrow.push('');
																					addrow.push('');
																					addrow.push('');
																					addrow.push('');
					addrow.push('');
																					addrow.push('');
																					addrow.push('');
																					addrow.push('');
					addrow.push('');
																					addrow.push('');
					addrow.push('');
																					addrow.push('');
																							addrow.push('');
												addrow.push([false,mainID,mainName]);
						addrow.splice(0,0,false,0);
	gridcustomer2orderds.addRow(addrow,gridcustomer2orderds.model.getRowCount());
} 						   


function removecustomer2orderds(){
       var s= new Array();
       var sall=gridcustomer2orderds.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
          s.push(i);
          var thisCell=sall[i];
          if(thisCell[1]!=0){//the row which will be deleted
            deletedatacustomer2orderds.splice(deletedatacustomer2orderds.length,0,thisCell[1]);
       }}}
       gridcustomer2orderds.model.remove(s);//grid.removeSelectedRows();
 }

function call_funUpdcustomer2orderds() {
       var sall=gridcustomer2orderds.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
         var passAll=0;
         var thisCell=sall[i];
         var padd = new SOAPClientParameters2();
         var vobject=new Object();
         vobject.id=thisCell[1];
               vobject.customerOrderNo=thisCell[2];
 
               vobject.contractNo=thisCell[3];
 
              if(dojox.validate.isText(thisCell[4], {minlength: 1})){vobject.conveyanceEnum=thisCell[4];
             }else{gridcustomer2orderds.getCell(gridcustomer2orderds.model.fieldArray[4]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;}//not null
 
               vobject.carryTypeEnum=thisCell[5];
 
               vobject.shipperRemark=thisCell[6];
 
               vobject.carrierRemark=thisCell[7];
 
               vobject.levelEnum=thisCell[8];
 
               vobject.customerTypeEnum=thisCell[9];
 
var  d=new DateTimeQuery();
             if(thisCell[10] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[10], gridcustomer2orderds.getCell(gridcustomer2orderds.model.fieldArray[10]).constraint);
             }else{gridcustomer2orderds.getCell(gridcustomer2orderds.model.fieldArray[10]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[11] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[11], gridcustomer2orderds.getCell(gridcustomer2orderds.model.fieldArray[11]).constraint);
             vobject.referTime=d;
             }else{gridcustomer2orderds.getCell(gridcustomer2orderds.model.fieldArray[11]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null
 

               vobject.linkMan=thisCell[12];
 
               vobject.tel=thisCell[13];
 
var  d=new DateTimeQuery();
             if(thisCell[14] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[14], gridcustomer2orderds.getCell(gridcustomer2orderds.model.fieldArray[14]).constraint);
             }else{gridcustomer2orderds.getCell(gridcustomer2orderds.model.fieldArray[14]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[15] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[15], gridcustomer2orderds.getCell(gridcustomer2orderds.model.fieldArray[15]).constraint);
             vobject.bookTime=d;
             }else{gridcustomer2orderds.getCell(gridcustomer2orderds.model.fieldArray[15]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null
 

var  d=new DateTimeQuery();
             if(thisCell[16] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[16], gridcustomer2orderds.getCell(gridcustomer2orderds.model.fieldArray[16]).constraint);
             }else{gridcustomer2orderds.getCell(gridcustomer2orderds.model.fieldArray[16]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[17] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[17], gridcustomer2orderds.getCell(gridcustomer2orderds.model.fieldArray[17]).constraint);
             vobject.completeTime=d;
             }else{gridcustomer2orderds.getCell(gridcustomer2orderds.model.fieldArray[17]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null
 

               vobject.remark=thisCell[18];
 

										var manageable=new Object();
			 if(querydatacustomer2orderds[i][20]!=''&&querydatacustomer2orderds[i][20]!=undefined){
             manageable.id=querydatacustomer2orderds[i][20][1];
             vobject.customer=manageable;
			 }else{
			 gridcustomer2orderds.getCell(gridcustomer2orderds.model.fieldArray[20]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
			


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('OrderdVO',vobject);
                SOAPClient.invoke(urlcustomer2orderds, "createOrderd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                gridcustomer2orderds.model.setDatum(ul,i,1);
				});
	         }else{//modify row
                padd.add('OrderdVO',vobject);
                SOAPClient.invoke(urlcustomer2orderds, "updateOrderd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
			 call_funUpdGridSub(i);
        } }}//for
//submit delete
          for(var i=0;i<deletedatacustomer2orderds.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',deletedatacustomer2orderds[i]);
               SOAPClient.invoke(urlcustomer2orderds, "deleteOrderd", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
	           });
          }
          deletedatacustomer2orderds=new Array();
          //dojo.byId("rowCount").innerHTML = 'saved'; 
//submit delete end          
	
 } 
 
	function selectOrderRowdFun(rep){
		querydatacustomer2orderds[dojoOrderd.selectOrderRowdInRow][dojoOrderd.noOrderRowd]=rep;
		gridcustomer2orderds.updateRow(dojoOrderd.selectOrderRowdInRow);	
			
	}
	function selectCustomerFun(rep){
		querydatacustomer2orderds[dojoOrderd.selectCustomerInRow][dojoOrderd.noCustomer]=rep;
		gridcustomer2orderds.updateRow(dojoOrderd.selectCustomerInRow);	
			
	}

function pageSizeChangecustomer2orderds(mylabel){
	pagesizecustomer2orderds=mylabel;
	getVOcustomer2orderds(queryvocustomer2orderds);
}

function allpagecustomer2orderds(){
	pagesizecustomer2orderds=0;
	getVOcustomer2orderds(queryvocustomer2orderds);
}

function upPagecustomer2orderds(){
	pagenumbercustomer2orderds--;
	getVOcustomer2orderds(queryvocustomer2orderds);
}
function downPagecustomer2orderds(){
	pagenumbercustomer2orderds++;
	getVOcustomer2orderds(queryvocustomer2orderds);
}

//move from 30.4 begin---------
var addRowSub = function(addindex){
	  var subGrid = dijit.byId(makeSubGridIdGeneral('',querydatacustomer2orderds[addindex][1],"OrderdChild"));
	  var addrow=[];
	  													addrow.push('');
																					addrow.push('');
																					addrow.push('');
																					addrow.push('');
																					addrow.push('');
																					addrow.push('');
																					addrow.push('');
																					addrow.push('');
																					addrow.push('');
																					addrow.push('');
																							addrow.push('');
												addrow.push([]);
						addrow.splice(0,0,false,0);
	
	  subGrid.addRow(addrow,subGrid.model.getRowCount());
}


var deleteSub= function(mainRow,subIndexRow,subId){
	var subGrid = dijit.byId(makeSubGridIdGeneral('',querydatacustomer2orderds[mainRow][1],"OrderdChild"));
	var s= new Array();
	s[0]=subIndexRow;
	if(subId!=0){
		var pdel = new SOAPClientParameters();      
	    pdel.add('id',subId);
	    SOAPClient.invoke(urlOrderd, "deleteOrderRowd", pdel, false,  function GetEnu_callBack(ul, soapResponse){
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
			mainTable.id=querydatacustomer2orderds[subGrid.dataRow][1];
            vobject.order=mainTable;
																var manageable=new Object();
			 if(querydatacustomer2orderds[subGrid.dataRow][childRow][i]!=''&&querydatacustomer2orderds[subGrid.dataRow][childRow][i][13]!=undefined){
				manageable.id=querydatacustomer2orderds[subGrid.dataRow][childRow][i][13][1];
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
			 //querydatacustomer2orderds[document.getElementById('erowIndexOrderRowd').value][childRow]=querydataSub;//????????????????????????????????????????????????????????????????????????????/
        } }
		
function call_funUpdGridSub(mainRow,subIndexRow) {
var subGrid = dijit.byId(makeSubGridIdGeneral('',querydatacustomer2orderds[mainRow][1],"OrderdChild"));
	if(subGrid){
	
	var sall=subGrid.model.data;
	if(subIndexRow==undefined && subIndexRow==''){
		for(var i=0;i<sall.length;i++){
         var thisCell=sall[i];
         saveSubRow(subGrid,thisCell,i);
		}//for
	}else{
		 var thisCell=sall[subIndexRow];
		saveSubRow(subGrid,thisCell,subIndexRow);
	}}
}		  

var urlOrderRowd = getUrl()+ "services/OrderRowdManageService";
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
          
                 //field????????¨ª??¨ª??js??toArray¡Á???querydata??
                       
 cells: [ [
			{ name: '<img src="../image/addsmall.gif" onclick="addRowSub('+addRowIndex +');"   height="18" width="18" border="0">' ,get:function(inRowIndex) {return '<img src="../image/delsmall.gif" onclick="deleteSub('+addRowIndex +','+inRowIndex+','+(querydatacustomer2orderds[addRowIndex][childRow]!=undefined ? 0:querydatacustomer2orderds[addRowIndex][childRow][inRowIndex][1])+');"  height="18" width="18" border="0">&nbsp;&nbsp;&nbsp;<img src="../image/savesmall.gif" onclick="call_funUpdGridSub('+addRowIndex +','+inRowIndex+');"  height="18" width="18" border="0">';}, width: 6,styles: 'text-align: center;',headerStyles:mystyle},//
			{ name: pre+i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool,headerStyles:mystyle },//
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
					      
//??¨ª????
				//??¨ª????
							 ,   {name: pre+i18nStr.product,field: 13,get:function(inRowIndex){ var str='';var strid;if(querydatacustomer2orderds[addRowIndex][childRow][inRowIndex]!=undefined && querydatacustomer2orderds[addRowIndex][childRow][inRowIndex][13]!=undefined&& querydatacustomer2orderds[addRowIndex][childRow][inRowIndex][13][1]!=undefined){str=querydatacustomer2orderds[addRowIndex][childRow][inRowIndex][13][2];strid=querydatacustomer2orderds[addRowIndex][childRow][inRowIndex][13][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" style="vertical-align:middle;margin-top:0px;margin-left:8px;" onclick="dojoOrderd.selectProd('+strid+','+inRowIndex+',13,0,event,'+addRowIndex+');"   >';} ,width: 10 ,headerStyles:mystyle}
			                                        ] ]
                           }];  
						   
			return myLayout;			   
}

				function selectProdFun(rep){
			querydatacustomer2orderds[dojoOrderd.mainRowIndexProd][childRow][dojoOrderd.selectProdInRow][dojoOrderd.noProd]=rep;
			var subGrid = dijit.byId(makeSubGridIdGeneral('',querydatacustomer2orderds[dojoOrderd.mainRowIndexProd][1],"OrderdChild"));
			subGrid.model.setDatum(rep,dojoOrderd.selectProdInRow,dojoOrderd.noProd);	
		}
	//move from 30.4 end-----------
