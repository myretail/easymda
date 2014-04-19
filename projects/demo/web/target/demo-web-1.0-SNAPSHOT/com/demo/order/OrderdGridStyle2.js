																																			//12???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
                  // totleinum = 15 
var querydataSub=[];	
function buildChildLayout2(pre,mystyle){
	var myLayout=[{  
				//noscroll: true,
				cells: [//?????¡À??????????????????????12????¡À???????
                      [
				  				  {name: pre+i18nStr.productNum,field:2, width: 8,headerStyles:mystyle}
						  						  				 ,  {name: pre+i18nStr.unitNum,field:3, width: 8,headerStyles:mystyle}
						  						  				 ,  {name: pre+i18nStr.goodsSuttle,field:4, width: 8,headerStyles:mystyle}
						  						  				 ,  {name: pre+i18nStr.goodsWeight,field:5, width: 8,headerStyles:mystyle}
						  						  				 ,  {name: pre+i18nStr.goodsVolume,field:6, width: 8,headerStyles:mystyle}
						  						  				,   {name: pre+i18nStr.label, field: 7,width: 10,headerStyles:mystyle}
						  						  				 ,  {name: pre+i18nStr.carriage,field:8, width: 8,headerStyles:mystyle}
						  						  				,   {name: pre+i18nStr.especial, field: 9,width: 10,headerStyles:mystyle}
						  						  				,   {name: pre+i18nStr.goodsState, field: 10,width: 10,headerStyles:mystyle}
						  						  				,   {name: pre+i18nStr.remark, field: 11,width: 10,headerStyles:mystyle}
						  				
//?????????????????????????????????????????????????/??manageableAssociationEnds????????false??true?????????¡Â¡À¨ª????????????????????????????????
					
				,   {name: pre+i18nStr.order,field: 12,get:function(inRowIndex){ var str='';if(querydataSub[inRowIndex]!=undefined && querydataSub[inRowIndex][12]!=undefined){str=querydataSub[inRowIndex][12][2];} return str;} ,width: 10,headerStyles:mystyle }
						//?????????????????????????????????????????????????/??manageableAssociationEnds????????false??true?????????¡Â¡À¨ª????????????????????????????????
					
				,   {name: pre+i18nStr.product,field: 13,get:function(inRowIndex){ var str='';if(querydataSub[inRowIndex]!=undefined && querydataSub[inRowIndex][13]!=undefined){str=querydataSub[inRowIndex][13][2];} return str;} ,width: 10,headerStyles:mystyle }
						     
					]]}];	 
					return myLayout; 
}
	
	
	  //rowinum=8
			var mainLayout2 =[{//?????????colSpantoggle
					onBeforeRow2: onBeforeRow2,
					 cells: [
                      [
						//{ name: 'choise', width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },
						{ name: i18nStr.detail, width: 3, get: getCheckOrderd2, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
				//---------------------------------------------------------------------//rowinum=9   inum=2
					  			  ////////////////////////////////////////
					  {name: i18nStr.customerOrderNo,field:2, width: 8}
								  			//--------------  if (3 == 9)
						//---------------------------------------------------------------------//rowinum=9   inum=3
					  			  ////////////////////////////////////////
					,   {name: i18nStr.contractNo,field:3, width: 8}
								  			//--------------  if (4 == 9)
						//---------------------------------------------------------------------//rowinum=9   inum=4
					  			  ////////////////////////////////////////
					,   {name: i18nStr.conveyanceEnum,field:4, width: 8}
								  			//--------------  if (5 == 9)
						//---------------------------------------------------------------------//rowinum=9   inum=5
					  			  ////////////////////////////////////////
					,   {name: i18nStr.carryTypeEnum,field:5, width: 8}
								  			//--------------  if (6 == 9)
						//---------------------------------------------------------------------//rowinum=9   inum=6
					  			  ////////////////////////////////////////
					,   {name: i18nStr.shipperRemark,field:6, width: 8}
								  			//--------------  if (7 == 9)
						//---------------------------------------------------------------------//rowinum=9   inum=7
					  			  ////////////////////////////////////////
					,   {name: i18nStr.carrierRemark,field:7, width: 8}
								  			//--------------  if (8 == 9)
						//---------------------------------------------------------------------//rowinum=9   inum=8
		//
												  							 ,  {name: i18nStr.levelEnum,field:8, width: 8}
												  								],[
													//---------------------------------------------------------------------//rowinum=9   inum=9
		                     //----------------(inum:9)  (rowinum: 9)
			//delete1
			 			  ////////////////////////////////////////
					  {name: i18nStr.customerTypeEnum,field:9, width: 8}
								  						//---------------------------------------------------------------------//rowinum=9   inum=10
		                     //----------------(inum:10)  (rowinum: 9)
			//delete1
			 					 ,  {name: i18nStr.referTime,field:10, width: 8}
								  						//---------------------------------------------------------------------//rowinum=9   inum=11
		                     //----------------(inum:11)  (rowinum: 9)
			//delete1
			 			  ////////////////////////////////////////
					 ,  {name: i18nStr.linkMan,field:11, width: 8}
								  						//---------------------------------------------------------------------//rowinum=9   inum=12
		                     //----------------(inum:12)  (rowinum: 9)
			//delete1
			 			  ////////////////////////////////////////
					 ,  {name: i18nStr.tel,field:12, width: 8}
								  						//---------------------------------------------------------------------//rowinum=9   inum=13
		                     //----------------(inum:13)  (rowinum: 9)
			//delete1
			 					 ,  {name: i18nStr.bookTime,field:13, width: 8}
								  						//---------------------------------------------------------------------//rowinum=9   inum=14
		                     //----------------(inum:14)  (rowinum: 9)
			//delete1
			 					 ,  {name: i18nStr.completeTime,field:14, width: 8}
								  						//---------------------------------------------------------------------//rowinum=9   inum=15
		                     //----------------(inum:15)  (rowinum: 9)
			//delete1
			 			  ////////////////////////////////////////
					 ,  {name: i18nStr.remark,field:15, width: 8}
								  							
	//
		  //(17 > 9)
			//delete2
										//
		  //(17 > 9)
			//delete2
								 ,   {name: i18nStr.customer,field: 17,get:function(inRowIndex){ var str='';if(querydataOrderd[inRowIndex]!=undefined && querydataOrderd[inRowIndex][17]!=undefined){str=querydataOrderd[inRowIndex][17][2];} return str;} ,width: 10 }
															,   {name: ' ',colSpan: 1 ,value:' ' ,width: 10 }
			
	

],[
				{ name: '\u8be6\u7ec6', colSpan: 9 ,styles: 'padding: 0; margin: 0;', get: getDetailOrderd2 }//value: '<div style="height:0px; background-color: white;"></div>'
			  ]
		  ]

		}];	 


var detailRowsOrderd2=[];

function onBeforeRow2(inDataIndex, inRow) {	if (inRow[2]!=undefined)inRow[2].hidden = !detailRowsOrderd2[inDataIndex];}	

function toggleOrderd2(inIndex, inShow) {
        			//if (!inShow) destroySubGridIdGeneral('',querydataOrderd[inIndex][1],"OrderdMainDetail");
					if (!inShow) destroySubGridIdGeneral('',querydataOrderd[inIndex][1],"OrderdChild");
				    detailRowsOrderd2[inIndex] = inShow;
				    dijit.byId("gridOrderd").updateRow(inIndex); 
				    
    } 

function getCheckOrderd2(inRowIndex) {
	var image = (detailRowsOrderd2[inRowIndex] ? 'open.gif' : 'closed.gif');
	var show = (detailRowsOrderd2[inRowIndex] ? 'false' : 'true');
	return '<img src="../image/' + image + '" onclick="toggleOrderd2(' + inRowIndex + ', ' + show + ')" height="11" width="11">';
}

function getDetailOrderd2(inRowIndex){
	if(detailRowsOrderd2[inRowIndex]){
		var cell = this;
		setTimeout(function() { buildSubgridOrderd2(inRowIndex, cell); }, 0);  }
		var h =0;
		if(detailRowsOrderd2[inRowIndex]&&querydataOrderd[inRowIndex][16]!=undefined &&querydataOrderd[inRowIndex][16].length>0){
							h=65+25*querydataOrderd[inRowIndex][16].length;  		}
	return '<div style="height:'+h+'px; background-color: white;"></div>';
}

//function makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString) {return parentRowIndex+"_"+idString+"_" + inRowIndex;		}

//function destroySubGridIdGeneral(parentRowIndex,inRowIndex,idString) {	var subGrid = dijit.byId(makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString));	if (subGrid) subGrid.destroy();	}
var childRow= 16;
var layoutInRowIndex;	  



var addrow=[];
				
addrow.splice(0,0,false,0);




function buildSubgridOrderd2(inRowIndex, inCell) {  //makeSubgridIdMainDetail(id)?idmainDetailGridid
	if(inCell!=undefined && inCell.getNode(inRowIndex)!=undefined){
		var child = inCell.getNode(inRowIndex).firstChild;
		//var child = inCell.getNode(inRowIndex).lastChild;
		//var idmainDetail = makeSubGridIdGeneral('',querydataOrderd[inRowIndex][1],"OrderdMainDetail");//makeSubgridIdMainDetail(querydataOrderd[inRowIndex][1]);//taskmakeSubgridId(taskRowSubdata[inRowIndex][1]);
		var idchild = makeSubGridIdGeneral('',querydataOrderd[inRowIndex][1],"OrderdChild");
		//var subGridMainDetail = dijit.byId(idmainDetail);
		var subGridChild = dijit.byId(idchild);
		querydataSub=querydataOrderd[inRowIndex][16];
		if(querydataSub!=undefined){
			if (subGridChild){
				subGridChild.model.setData(querydataSub);
				child.appendChild(subGridChild.domNode);
			}else{
				modelOrderdChild=new dojox.grid.data.Table(null, querydataSub);
				var childProps= {
								autoHeight: true, 
								autoRender: false,
								rowCount:querydataSub.length,
								model:modelOrderdChild,							};
				childProps.dataRow = inRowIndex;
				childProps.id = idchild;
				if(Math.ceil(inRowIndex/2)>inRowIndex/2){
					childLayoutOdd=buildChildLayout2(pre,headerstyleodd,inRowIndex);	
					childProps.structure=childLayoutOdd;
				}else{
					childLayout=buildChildLayout2(pre,headerstyle,inRowIndex);
					childProps.structure=childLayout;
				}
				subGridChild = new dojox.Grid(childProps, child);//grid?????DIV?¡ì?
			}
			if (subGridChild) {
				subGridChild.render();
				subGridChild.cacheHeight = subGridChild.domNode.offsetHeight;
			}	      				
		}
		

		inCell.grid.rowHeightChanged(inRowIndex);
    }   
}
var styleSign=0;

