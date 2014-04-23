													//12???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
                  // totleinum = 4 
var querydataSub=[];	
function buildChildLayout2(pre,mystyle){
	var myLayout=[{  
				//noscroll: true,
				cells: [//ÓÅ»¯Ê±¿É¼ÓÈë£ºÈç¹ý¼ÇÂ¼Êý³¬¹ý12£¬¼´±äÎªÁ½ÐÐ
                      [
				  				  {name: pre+i18nStr.num,field:2, width: 8,headerStyles:mystyle}
						  						  				 ,  {name: pre+i18nStr.volumne,field:3, width: 8,headerStyles:mystyle}
						  						  				,   {name: pre+i18nStr.remark, field: 4,width: 10,headerStyles:mystyle}
						  				
//?????????????????????????????????????????????????/´ÓmanageableAssociationEndsÖÐÏÈÈ¥µôfalseÎªtrue£»ÔÙÈ¥³ýÖ÷±í£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡
					
				,   {name: pre+i18nStr.taskForm,field: 5,get:function(inRowIndex){ var str='';if(querydataSub[inRowIndex]!=undefined && querydataSub[inRowIndex][5]!=undefined){str=querydataSub[inRowIndex][5][2];} return str;} ,width: 10,headerStyles:mystyle }
						     
					]]}];	 
					return myLayout; 
}
	
	
	  //rowinum=3
			var mainLayout2 =[{//?????????colSpantoggle
					onBeforeRow2: onBeforeRow2,
					 cells: [
                      [
						//{ name: 'choise', width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },
						{ name: i18nStr.detail, width: 3, get: getCheckTaskForm2, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
				//---------------------------------------------------------------------//rowinum=3   inum=2
		//
												  							  {name: i18nStr.setDate,field:2, width: 8}
												  								],[
													//---------------------------------------------------------------------//rowinum=3   inum=3
		                     //----------------(inum:3)  (rowinum: 3)
			//delete1
			 			  ////////////////////////////////////////
					  {name: i18nStr.formState,field:3, width: 8}
								  						//---------------------------------------------------------------------//rowinum=3   inum=4
		                     //----------------(inum:4)  (rowinum: 3)
			//delete1
			 			  ////////////////////////////////////////
					 ,  {name: i18nStr.remark,field:4, width: 8}
								  							
	//
		  //(6 > 3)
			//delete2
										//
		  //(6 > 3)
			//delete2
								 ,   {name: i18nStr.car,field: 6,get:function(inRowIndex){ var str='';if(querydataTaskForm[inRowIndex]!=undefined && querydataTaskForm[inRowIndex][6]!=undefined){str=querydataTaskForm[inRowIndex][6][2];} return str;} ,width: 10 }
													
	

],[
				{ name: '\u8be6\u7ec6', colSpan: 3 ,styles: 'padding: 0; margin: 0;', get: getDetailTaskForm2 }//value: '<div style="height:0px; background-color: white;"></div>'
			  ]
		  ]

		}];	 


var detailRowsTaskForm2=[];

function onBeforeRow2(inDataIndex, inRow) {	if (inRow[2]!=undefined)inRow[2].hidden = !detailRowsTaskForm2[inDataIndex];}	

function toggleTaskForm2(inIndex, inShow) {
        			//if (!inShow) destroySubGridIdGeneral('',querydataTaskForm[inIndex][1],"TaskFormMainDetail");
					if (!inShow) destroySubGridIdGeneral('',querydataTaskForm[inIndex][1],"TaskFormChild");
				    detailRowsTaskForm2[inIndex] = inShow;
				    dijit.byId("gridTaskForm").updateRow(inIndex); 
				    
    } 

function getCheckTaskForm2(inRowIndex) {
	var image = (detailRowsTaskForm2[inRowIndex] ? 'open.gif' : 'closed.gif');
	var show = (detailRowsTaskForm2[inRowIndex] ? 'false' : 'true');
	return '<img src="../image/' + image + '" onclick="toggleTaskForm2(' + inRowIndex + ', ' + show + ')" height="11" width="11">';
}

function getDetailTaskForm2(inRowIndex){
	if(detailRowsTaskForm2[inRowIndex]){
		var cell = this;
		setTimeout(function() { buildSubgridTaskForm2(inRowIndex, cell); }, 0);  }
		var h =0;
		if(detailRowsTaskForm2[inRowIndex]&&querydataTaskForm[inRowIndex][5]!=undefined &&querydataTaskForm[inRowIndex][5].length>0){
							h=65+25*querydataTaskForm[inRowIndex][5].length;  		}
	return '<div style="height:'+h+'px; background-color: white;"></div>';
}

//function makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString) {return parentRowIndex+"_"+idString+"_" + inRowIndex;		}

//function destroySubGridIdGeneral(parentRowIndex,inRowIndex,idString) {	var subGrid = dijit.byId(makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString));	if (subGrid) subGrid.destroy();	}
var childRow= 5;
var layoutInRowIndex;	  



var addrow=[];
				
addrow.splice(0,0,false,0);



var subID='';
function buildSubgridTaskForm2(inRowIndex, inCell) {  //makeSubgridIdMainDetail(id)?idmainDetailGridid
	if(inCell!=undefined && inCell.getNode(inRowIndex)!=undefined){
		var child = inCell.getNode(inRowIndex).firstChild;
		//var child = inCell.getNode(inRowIndex).lastChild;
		//var idmainDetail = makeSubGridIdGeneral('',querydataTaskForm[inRowIndex][1],"TaskFormMainDetail");//makeSubgridIdMainDetail(querydataTaskForm[inRowIndex][1]);//taskmakeSubgridId(taskRowSubdata[inRowIndex][1]);
		var idchild = makeSubGridIdGeneral('',querydataTaskForm[inRowIndex][1],"TaskFormChild");
		//var subGridMainDetail = dijit.byId(idmainDetail);
		var subGridChild = dijit.byId(idchild);
		querydataSub=querydataTaskForm[inRowIndex][5];
		if(querydataSub!=undefined){
			if (subGridChild){
				subGridChild.model.setData(querydataSub);
				child.appendChild(subGridChild.domNode);
			}else{
				modelTaskFormChild=new dojox.grid.data.Table(null, querydataSub);
				var childProps= {
								autoHeight: true, 
								autoRender: false,
								rowCount:querydataSub.length,
								model:modelTaskFormChild,							};
				childProps.dataRow = inRowIndex;
				childProps.id = idchild;
				if(Math.ceil(inRowIndex/2)>inRowIndex/2){
					childLayoutOdd=buildChildLayout2(pre,headerstyleodd,inRowIndex);	
					childProps.structure=childLayoutOdd;
				}else{
					childLayout=buildChildLayout2(pre,headerstyle,inRowIndex);
					childProps.structure=childLayout;
				}
				subGridChild = new dojox.Grid(childProps, child);//grid?????DIV?§³
				dojo.connect(subGridChild, "doclick", function(e){
					if(connecthandle==1){
						//var curGrid=subGridChild;
						subID=querydataOrderd[subGridChild.dataRow][16][e.rowIndex][1];
						resetNU();
						clickRowTab();		
					}
				});
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

