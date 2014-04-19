	  	  									
//set (= orderRowds2product)
	//name =orderRowds2productAFTab.js  manageable.name=Orderd
															  var NUorderRowds2product = false;//needUpdate
  var urlorderRowds2product = getUrl()+ "services/OrderdManageService";
  var deletedataorderRowds2product =  new Array();
  var querydataorderRowds2product =  new Array();
  var pagenumberorderRowds2product=1;
  var totalCountorderRowds2product=0;
  var pagesizeorderRowds2product=10;
  var orderByorderRowds2product='0';
  var queryvoorderRowds2product=new Object();
  var oddstyle='';
  var modelorderRowds2product = new dojox.grid.data.Table(null, querydataorderRowds2product);
  var gridorderRowds2product;
  var urle2 = getUrl()+ "services/BasicManageService";   
//----------move from 30.1 begin-----------

																																                  // totleinum = 15 
  //rowinum=8
			var layoutorderRowds2product =[{//?????????colSpantoggle
					onBeforeRow: onBeforeRow,
					 cells: [
                      [
						//{ name: 'choise', width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },
						{ name: i18nStr.detail, width: 3, get: getCheckOrderd, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
				//---------------------------------------------------------------------//rowinum=9   inum=2
					  					  {name: i18nStr.customerOrderNo,field:2, width: 10}
								  			//--------------  if (3 == 9)
						//---------------------------------------------------------------------//rowinum=9   inum=3
					  					,   {name: i18nStr.contractNo,field:3, width: 10}
								  			//--------------  if (4 == 9)
						//---------------------------------------------------------------------//rowinum=9   inum=4
					  					,   {name: i18nStr.conveyanceEnum,field:4, width: 10}
								  			//--------------  if (5 == 9)
						//---------------------------------------------------------------------//rowinum=9   inum=5
					  					,   {name: i18nStr.carryTypeEnum,field:5, width: 10}
								  			//--------------  if (6 == 9)
						//---------------------------------------------------------------------//rowinum=9   inum=6
					  					,   {name: i18nStr.shipperRemark,field:6, width: 10}
								  			//--------------  if (7 == 9)
						//---------------------------------------------------------------------//rowinum=9   inum=7
					  					,   {name: i18nStr.carrierRemark,field:7, width: 10}
								  			//--------------  if (8 == 9)
						//---------------------------------------------------------------------//rowinum=9   inum=8
		//
												  					     ,  {name: i18nStr.levelEnum,field:8, width: 10 }
												  								],[
													//---------------------------------------------------------------------//rowinum=9   inum=9
		                     //----------------(inum:9)  (rowinum: 9)
			//delete1
			 				 {name: i18nStr.customerTypeEnum,field:9, width: 10 }
										  						//---------------------------------------------------------------------//rowinum=9   inum=10
		                     //----------------(inum:10)  (rowinum: 9)
			//delete1
			 					 ,  {name: i18nStr.referTime,field:10, width: 8 }
										  						//---------------------------------------------------------------------//rowinum=9   inum=11
		                     //----------------(inum:11)  (rowinum: 9)
			//delete1
			 				,  {name: i18nStr.linkMan,field:11, width: 10 }
										  						//---------------------------------------------------------------------//rowinum=9   inum=12
		                     //----------------(inum:12)  (rowinum: 9)
			//delete1
			 				,  {name: i18nStr.tel,field:12, width: 10 }
										  						//---------------------------------------------------------------------//rowinum=9   inum=13
		                     //----------------(inum:13)  (rowinum: 9)
			//delete1
			 					 ,  {name: i18nStr.bookTime,field:13, width: 8 }
										  						//---------------------------------------------------------------------//rowinum=9   inum=14
		                     //----------------(inum:14)  (rowinum: 9)
			//delete1
			 					 ,  {name: i18nStr.completeTime,field:14, width: 8 }
										  						//---------------------------------------------------------------------//rowinum=9   inum=15
		                     //----------------(inum:15)  (rowinum: 9)
			//delete1
			 				,  {name: i18nStr.remark,field:15, width: 10 }
										  							
	//
		  //(17 > 9)
			//delete2
										//
		  //(17 > 9)
			//delete2
								 ,   {name: i18nStr.customer,field: 17,get:function(inRowIndex){ var str='';var strid;if(querydataorderRowds2product[inRowIndex]!=undefined && querydataorderRowds2product[inRowIndex][17]!=undefined && querydataorderRowds2product[inRowIndex][17][1]!=undefined){str=querydataorderRowds2product[inRowIndex][17][2];strid=querydataorderRowds2product[inRowIndex][17][1];} return str;} ,width: 10 }
															,   {name: ' ',colSpan: 1 ,value:' ' ,width: 10 }
			
	
],[
				{ name: '\u8be6\u7ec6', colSpan: 9 ,styles: 'padding: 0; margin: 0;', get: getDetailOrderd }//value: '<div style="height:0px; background-color: white;"></div>'
			  ]
		  ]

		}];	 




var detailRowsOrderd=[];

function onBeforeRow(inDataIndex, inRow) {	if (inRow[2]!=undefined)inRow[2].hidden = !detailRowsOrderd[inDataIndex];}	

function toggleOrderd(inIndex, inShow) {
        			//if (!inShow) destroySubGridIdGeneral('',querydataorderRowds2product[inIndex][1],"OrderdMainDetail");
					if (!inShow) destroySubGridIdGeneral('',querydataorderRowds2product[inIndex][1],"OrderdChild");
				    detailRowsOrderd[inIndex] = inShow;
				    dijit.byId("gridorderRowds2product").updateRow(inIndex); 
				    
    } 

function getCheckOrderd(inRowIndex) {
	var image = (detailRowsOrderd[inRowIndex] ? 'open.gif' : 'closed.gif');
	var show = (detailRowsOrderd[inRowIndex] ? 'false' : 'true');
	return '<img src="../image/' + image + '" onclick="toggleOrderd(' + inRowIndex + ', ' + show + ')" height="11" width="11">';
}

function getDetailOrderd(inRowIndex){
	if(detailRowsOrderd[inRowIndex]){
		var cell = this;
		setTimeout(function() { buildSubgridorderRowds2product(inRowIndex, cell); }, 0);  }
		var h =0;
		if(detailRowsOrderd[inRowIndex]&&querydataorderRowds2product[inRowIndex][16].length>0){
							h=65+25*querydataorderRowds2product[inRowIndex][16].length;  		}
	return '<div style="height:'+h+'px; background-color: white;"></div>';
}

//function makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString) {return parentRowIndex+"_"+idString+"_" + inRowIndex;		}

//function destroySubGridIdGeneral(parentRowIndex,inRowIndex,idString) {	var subGrid = dijit.byId(makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString));	if (subGrid) subGrid.destroy();	}
var childRow= 16;
var layoutInRowIndex;	  
function buildSubgridorderRowds2product(inRowIndex, inCell) {  //makeSubgridIdMainDetail(id)?idmainDetailGridid
	if(inCell!=undefined && inCell.getNode(inRowIndex)!=undefined){
		var child = inCell.getNode(inRowIndex).firstChild;
		//var child = inCell.getNode(inRowIndex).lastChild;
		//var idmainDetail = makeSubGridIdGeneral('',querydataorderRowds2product[inRowIndex][1],"OrderdMainDetail");//makeSubgridIdMainDetail(querydataorderRowds2product[inRowIndex][1]);//taskmakeSubgridId(taskRowSubdata[inRowIndex][1]);
		var idchild = makeSubGridIdGeneral('',querydataorderRowds2product[inRowIndex][1],"OrderdChild");
		//var subGridMainDetail = dijit.byId(idmainDetail);
		var subGridChild = dijit.byId(idchild);
		var dataChild=querydataorderRowds2product[inRowIndex][16];
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
				subGridChild = new dojox.Grid(childProps, child);//grid?????DIV?¡ì?
			}
			if (subGridChild) {
				subGridChild.render();
				subGridChild.cacheHeight = subGridChild.domNode.offsetHeight;
			}	      				
		//}
		
		/*var detailDate=[];
		detailDate[0]=querydataorderRowds2product[inRowIndex];  
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
var getVOorderRowds2product=function(queryvo){

	var pu = new SOAPClientParameters2();
	pu.add('OrderdVO',queryvo) ;
	pu.add('pageNumber',pagenumberorderRowds2product) ;
	pu.add('pageSize',pagesizeorderRowds2product) ;
	pu.add('orderBy',orderByorderRowds2product) ;
	SOAPClient.invoke(urlorderRowds2product,"getOrderd", pu, false,  function GetEnu_callBack(ul, soapResponse){     
//????¡À?¡À¨ª??????¡Á?¡À¨ª,?¡À????¡À¨ª???¨¤??¡À¨ª??¡Á?¡À¨ª?¡À?????????????¨ª?¨®??	
	querydataorderRowds2product=dojoOrderd.OrderdVOtoArray_fun(ul,false);
	totalCountorderRowds2product=ul[ul.length-1]["ns:id"]; 
	}); 
	var totalpage=Math.ceil(new Number(totalCountorderRowds2product)/pagesizeorderRowds2product);
	
	if(totalpage>1){
		if(pagenumberorderRowds2product==1){
			dijit.byId("but6orderRowds2product").setDisabled(true);
			dijit.byId("but7orderRowds2product").setDisabled(false);
		}else if(pagenumberorderRowds2product==totalpage){
			dijit.byId("but6orderRowds2product").setDisabled(false);
			dijit.byId("but7orderRowds2product").setDisabled(true);
		}else{
			dijit.byId("but6orderRowds2product").setDisabled(false);
			dijit.byId("but7orderRowds2product").setDisabled(false);
		}
	}else{
		dijit.byId("but6orderRowds2product").setDisabled(true);
		dijit.byId("but7orderRowds2product").setDisabled(true);
	
	}
	if(pagesizeorderRowds2product==0){
		totalpage=1;
		dijit.byId("but6orderRowds2product").setDisabled(true);
		dijit.byId("but7orderRowds2product").setDisabled(true);
	}
	if(totalpage==1)pagenumberorderRowds2product=1;
	
	 document.getElementById("rowCountorderRowds2product").innerHTML=i18nStr.di+" "+pagenumberorderRowds2product+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountorderRowds2product+" "+i18nStr.rowSize; 	

	querydataorderRowds2product.splice(querydataorderRowds2product.length-1,1);
	modelorderRowds2product.setData(querydataorderRowds2product);
}

var buildorderRowds2product=function(mainID){
	if(NUorderRowds2product && mainID!=undefined && mainID!=''){
		var queryFloatProd=new Object();
		queryFloatProd.id=mainID;
		var queryFloatOrderRowd=new Object();
		queryFloatOrderRowd.product=queryFloatProd;
		queryvoorderRowds2product.orderRow =[queryFloatOrderRowd];

		queryvoorderRowds2product.product=queryFloatProd;
		getVOorderRowds2product(queryvoorderRowds2product);
		if(dijit.byId("gridorderRowds2product")==undefined){
			  gridorderRowds2product = new dojox.Grid({
						title: "",
						id: "gridorderRowds2product",
						jsId: "gridorderRowds2product",
						structure: layoutorderRowds2product,
						rowCount:querydataorderRowds2product.length,
						model:modelorderRowds2product
					}, dojo.byId("gridorderRowds2product"));
				gridorderRowds2product.resize({ h: dijit.byId("bottomPane").domNode.clientHeight-90});
				
		}else{
			gridorderRowds2product.updateRowCount(querydataorderRowds2product.length); 
		}
		NUorderRowds2product=false;
	}

}


	
//??????¡À¨ª???¨ª????????
	//??????¡À¨ª???¨ª????????
									   
/*var addRoworderRowds2product = function(){
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
	gridorderRowds2product.addRow(addrow,gridorderRowds2product.model.getRowCount());
} 						


function removeorderRowds2product(){
       var s= new Array();
       var sall=gridorderRowds2product.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
          s.push(i);
          var thisCell=sall[i];
          if(thisCell[1]!=0){//the row which will be deleted
            deletedataorderRowds2product.splice(deletedataorderRowds2product.length,0,thisCell[1]);
       }}}
       gridorderRowds2product.model.remove(s);//grid.removeSelectedRows();
 }

function call_funUpdorderRowds2product() {
       var sall=gridorderRowds2product.model.data;
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
             }else{gridorderRowds2product.getCell(gridorderRowds2product.model.fieldArray[4]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;}//not null
 
               vobject.carryTypeEnum=thisCell[5];
 
               vobject.shipperRemark=thisCell[6];
 
               vobject.carrierRemark=thisCell[7];
 
               vobject.levelEnum=thisCell[8];
 
               vobject.customerTypeEnum=thisCell[9];
 
var  d=new DateTimeQuery();
             if(thisCell[10] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[10], gridorderRowds2product.getCell(gridorderRowds2product.model.fieldArray[10]).constraint);
             }else{gridorderRowds2product.getCell(gridorderRowds2product.model.fieldArray[10]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[11] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[11], gridorderRowds2product.getCell(gridorderRowds2product.model.fieldArray[11]).constraint);
             vobject.referTime=d;
             }else{gridorderRowds2product.getCell(gridorderRowds2product.model.fieldArray[11]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null
 

               vobject.linkMan=thisCell[12];
 
               vobject.tel=thisCell[13];
 
var  d=new DateTimeQuery();
             if(thisCell[14] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[14], gridorderRowds2product.getCell(gridorderRowds2product.model.fieldArray[14]).constraint);
             }else{gridorderRowds2product.getCell(gridorderRowds2product.model.fieldArray[14]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[15] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[15], gridorderRowds2product.getCell(gridorderRowds2product.model.fieldArray[15]).constraint);
             vobject.bookTime=d;
             }else{gridorderRowds2product.getCell(gridorderRowds2product.model.fieldArray[15]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null
 

var  d=new DateTimeQuery();
             if(thisCell[16] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[16], gridorderRowds2product.getCell(gridorderRowds2product.model.fieldArray[16]).constraint);
             }else{gridorderRowds2product.getCell(gridorderRowds2product.model.fieldArray[16]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[17] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[17], gridorderRowds2product.getCell(gridorderRowds2product.model.fieldArray[17]).constraint);
             vobject.completeTime=d;
             }else{gridorderRowds2product.getCell(gridorderRowds2product.model.fieldArray[17]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null
 

               vobject.remark=thisCell[18];
 

										var manageable=new Object();
			 if(querydataorderRowds2product[i][20]!=''&&querydataorderRowds2product[i][20]!=undefined){
             manageable.id=querydataorderRowds2product[i][20][1];
             vobject.customer=manageable;
			 }else{
			 gridorderRowds2product.getCell(gridorderRowds2product.model.fieldArray[20]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
			


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('OrderdVO',vobject);
                SOAPClient.invoke(urlorderRowds2product, "createOrderd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                gridorderRowds2product.model.setDatum(ul,i,1);
				});
	         }else{//modify row
                padd.add('OrderdVO',vobject);
                SOAPClient.invoke(urlorderRowds2product, "updateOrderd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
			 call_funUpdGridSub(i);
        } }}//for
//submit delete
          for(var i=0;i<deletedataorderRowds2product.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',deletedataorderRowds2product[i]);
               SOAPClient.invoke(urlorderRowds2product, "deleteOrderd", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
	           });
          }
          deletedataorderRowds2product=new Array();
          //dojo.byId("rowCount").innerHTML = 'saved'; 
//submit delete end          
	
 } 
 */
/*	function selectOrderRowdFun(rep){
		querydataorderRowds2product[dojoOrderd.selectOrderRowdInRow][dojoOrderd.noOrderRowd]=rep;
		gridorderRowds2product.updateRow(dojoOrderd.selectOrderRowdInRow);	
			
	}
	function selectCustomerFun(rep){
		querydataorderRowds2product[dojoOrderd.selectCustomerInRow][dojoOrderd.noCustomer]=rep;
		gridorderRowds2product.updateRow(dojoOrderd.selectCustomerInRow);	
			
	}
*/

function pageSizeChangeorderRowds2product(mylabel){
	pagesizeorderRowds2product=mylabel;
	getVOorderRowds2product(queryvoorderRowds2product);
}

function allpageorderRowds2product(){
	pagesizeorderRowds2product=0;
	getVOorderRowds2product(queryvoorderRowds2product);
}

function upPageorderRowds2product(){
	pagenumberorderRowds2product--;
	getVOorderRowds2product(queryvoorderRowds2product);
}
function downPageorderRowds2product(){
	pagenumberorderRowds2product++;
	getVOorderRowds2product(queryvoorderRowds2product);
}

//move from 30.4 begin---------
/*var addRowSub = function(addindex){
	  var subGrid = dijit.byId(makeSubGridIdGeneral('',querydataorderRowds2product[addindex][1],"OrderdChild"));
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
	var subGrid = dijit.byId(makeSubGridIdGeneral('',querydataorderRowds2product[mainRow][1],"OrderdChild"));
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
			mainTable.id=querydataorderRowds2product[subGrid.dataRow][1];
            vobject.order=mainTable;
																var manageable=new Object();
			 if(querydataorderRowds2product[subGrid.dataRow][childRow][i]!=''&&querydataorderRowds2product[subGrid.dataRow][childRow][i][13]!=undefined){
				manageable.id=querydataorderRowds2product[subGrid.dataRow][childRow][i][13][1];
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
			 //querydataorderRowds2product[document.getElementById('erowIndexOrderRowd').value][childRow]=querydataSub;//????????????????????????????????????????????????????????????????????????????/
        } }
		
function call_funUpdGridSub(mainRow,subIndexRow) {
var subGrid = dijit.byId(makeSubGridIdGeneral('',querydataorderRowds2product[mainRow][1],"OrderdChild"));
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
*/
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
          
                 //?¨´??field???????????????????¨°????js????toArray¡Á??????¡§??????querydata????????
                       
 cells: [ [
			//{ name: '<img src="../image/addsmall.gif" onclick="addRowSub('+addRowIndex +');"   height="18" width="18" border="0">' ,get:function(inRowIndex) {return '<img src="../image/delsmall.gif" onclick="deleteSub('+addRowIndex +','+inRowIndex+','+(querydataorderRowds2product[addRowIndex][childRow]!=undefined ? 0:querydataorderRowds2product[addRowIndex][childRow][inRowIndex][1])+');"  height="18" width="18" border="0">&nbsp;&nbsp;&nbsp;<img src="../image/savesmall.gif" onclick="call_funUpdGridSub('+addRowIndex +','+inRowIndex+');"  height="18" width="18" border="0">';}, width: 6,styles: 'text-align: center;',headerStyles:mystyle},//
			//{ name: pre+i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool,headerStyles:mystyle },//
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
					      
//??????¡À¨ª???¨ª????????
				//??????¡À¨ª???¨ª????????
							 ,   {name: pre+i18nStr.product,field: 13,get:function(inRowIndex){ var str='';var strid;if(querydataorderRowds2product[addRowIndex][childRow][inRowIndex]!=undefined && querydataorderRowds2product[addRowIndex][childRow][inRowIndex][13]!=undefined&& querydataorderRowds2product[addRowIndex][childRow][inRowIndex][13][1]!=undefined){str=querydataorderRowds2product[addRowIndex][childRow][inRowIndex][13][2];strid=querydataorderRowds2product[addRowIndex][childRow][inRowIndex][13][1];} return str;} ,width: 10 ,headerStyles:mystyle}
			                                        ] ]
                           }];  
						   
			return myLayout;			   
}

/*				function selectProdFun(rep){
			querydataorderRowds2product[dojoOrderd.mainRowIndexProd][childRow][dojoOrderd.selectProdInRow][dojoOrderd.noProd]=rep;
			var subGrid = dijit.byId(makeSubGridIdGeneral('',querydataorderRowds2product[dojoOrderd.mainRowIndexProd][1],"OrderdChild"));
			subGrid.model.setDatum(rep,dojoOrderd.selectProdInRow,dojoOrderd.noProd);	
		}
		*/
//move from 30.4 end-----------
