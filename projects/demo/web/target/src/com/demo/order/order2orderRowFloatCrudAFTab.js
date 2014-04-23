	  //---begin---------ÅÐ¶ÏÊÇ·ñÎª¶à¶Ô¶àµÄ¹ØÏµ±í
																					//---begin---------ÅÐ¶ÏÊÇ·ñÖ±½Ó¹ØÁªÁËtree½á¹¹±ísno
											//ÒÔÏÂÊÇÆÕÍ¨±í
//set (= order2orderRow)
														  var NUorder2orderRow = false;//needUpdate
  var urlorder2orderRow = getUrl()+ "services/OrderRowdManageService";
 /* var deletedataorder2orderRow =  new Array();
  var querydataorder2orderRow =  new Array();
  var pagenumberorder2orderRow=1;
  var totalCountorder2orderRow=0;
  var pagesizeorder2orderRow=10;
  var orderByorder2orderRow='0';
  var queryvoorder2orderRow=new Object();
  var oddstyle='';
  var modelorder2orderRow = new dojox.grid.data.Table(null, querydataorder2orderRow);
  var gridorder2orderRow;
  var urle2 = getUrl()+ "services/BasicManageService";   */
  
 
  
var getVOorder2orderRow=function(queryvo,id){

	var pu = new SOAPClientParameters2();
	pu.add('OrderRowdVO',queryvo) ;
	pu.add('pageNumber',order2orderRowFloatArray[id].pagenumberorder2orderRow) ;
	pu.add('pageSize',order2orderRowFloatArray[id].pagesizeorder2orderRow) ;
	pu.add('orderBy',order2orderRowFloatArray[id].orderByorder2orderRow) ;
	SOAPClient.invoke(urlorder2orderRow,"getOrderRowd", pu, false,  function GetEnu_callBack(ul, soapResponse){      
	//ÅÐ¶Ï±¾±íÊÇ·ñÎª×Ó±í,µ±Ò»¸ö±íÊÇ¶à¸ö±íµÄ×Ó±íÊ±£¬´Ë´¦¿ÉÄÜÓÐ´íÎó¡£	
						//Orderd-----Orderd
			order2orderRowFloatArray[id].querydataorder2orderRow=dojoOrderd.OrderRowdVOtoArray_fun(ul,true);
				order2orderRowFloatArray[id].totalCountorder2orderRow=ul[ul.length-1]["ns:id"]; 
	}); 
	var totalpage=Math.ceil(new Number(order2orderRowFloatArray[id].totalCountorder2orderRow)/order2orderRowFloatArray[id].pagesizeorder2orderRow);
	
	if(totalpage>1){
		if(order2orderRowFloatArray[id].pagenumberorder2orderRow==1){
			dijit.byId("but6order2orderRow"+id).setDisabled(true);
			dijit.byId("but7order2orderRow"+id).setDisabled(false);
		}else if(order2orderRowFloatArray[id].pagenumberorder2orderRow==totalpage){
			dijit.byId("but6order2orderRow"+id).setDisabled(false);
			dijit.byId("but7order2orderRow"+id).setDisabled(true);
		}else{
			dijit.byId("but6order2orderRow"+id).setDisabled(false);
			dijit.byId("but7order2orderRow"+id).setDisabled(false);
		}
	}else{
		dijit.byId("but6order2orderRow"+id).setDisabled(true);
		dijit.byId("but7order2orderRow"+id).setDisabled(true);
	
	}
	if(order2orderRowFloatArray[id].pagesizeorder2orderRow==0){
		totalpage=1;
		dijit.byId("but6order2orderRow"+id).setDisabled(true);
		dijit.byId("but7order2orderRow"+id).setDisabled(true);
	}
	if(totalpage==1)order2orderRowFloatArray[id].pagenumberorder2orderRow=1;
	
	 document.getElementById("rowCountorder2orderRow"+id).innerHTML=i18nStr.di+" "+order2orderRowFloatArray[id].pagenumberorder2orderRow+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+order2orderRowFloatArray[id].totalCountorder2orderRow+" "+i18nStr.rowSize; 	

	order2orderRowFloatArray[id].querydataorder2orderRow.splice(order2orderRowFloatArray[id].querydataorder2orderRow.length-1,1);
	order2orderRowFloatArray[id].modelorder2orderRow.setData(order2orderRowFloatArray[id].querydataorder2orderRow);
}

var buildorder2orderRow=function(mainID){
	if( mainID!=undefined && mainID!=''){//NUorder2orderRow &&
	    var openFloat=dijit.byId("openFloat_"+mainID);
		var openGrid=dijit.byId("gridorder2orderRow"+mainID);
		if(openGrid==undefined){
		openFloat.setContent("<table style=\"width:80%; position:absolute;top:0px;\"><tr height=\"25px\" width=\"100%\"><td align=\"left\" style=\"background:transparent\"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   order2orderRow List&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td><td align=\"right\" ><span ></span>&nbsp;&nbsp;<div ></div><div > </div><div ></div><div ></div><div ></div></td></tr></table><div style=\"{width:999px;height:500px; position:absolute;top:30px;}\" ><div ></div></div>");

	  	order2orderRowFloatArray[mainID] = new order2orderRowFloatPara(mainID);
		var openContainerTable=openFloat.containerNode.children[0].children[0].children[0].children[1].childNodes;
		openContainerTable[0].innerHTML="<span id=\"rowCountorder2orderRow"+mainID+"\"></span>";
var but1 = new dijit.form.myButton({label:"pageup",id:"but6order2orderRow"+mainID,disabled:"true",onclick:"upPageorder2orderRow("+mainID+");",iconClass:"upPageIcon"},openContainerTable[1]);
var but2= new dijit.form.myButton({label:"pagedown",id:"but7order2orderRow"+mainID,disabled:"true",onclick:"downPageorder2orderRow("+mainID+");",iconClass:"downPageIcon"},openContainerTable[2]);
	var but3 = new dijit.form.Button({label:"add",iconClass:"addIcon"},openContainerTable[3]);
	var but4 = new dijit.form.Button({label:"delete",iconClass:"delIcon"},openContainerTable[4]);//,onClick:"removeorder2orderRow("+mainID+")"
	var but5 = new dijit.form.Button({label:"save",iconClass:"saveIcon",id:"but3order2orderRow"+mainID },openContainerTable[5]);//,onclick:but3order2orderRow(mainID)
		dojo.connect(but3, "onClick", function(e){  addRoworder2orderRow(""+mainID); });
		dojo.connect(but4, "onClick", function(e){  removeorder2orderRow(""+mainID); });
		dojo.connect(but5, "onClick", function(e){  call_funUpdorder2orderRow(""+mainID); });
		var openContainerGrid=openFloat.containerNode.children[1].children[0];
		var queryFloatOrderd=new Object();
		queryFloatOrderd.id=mainID;
		order2orderRowFloatArray[mainID].queryvoorder2orderRow.order=queryFloatOrderd;
		getVOorder2orderRow(order2orderRowFloatArray[mainID].queryvoorder2orderRow,mainID);
		//if(order2orderRowFloatArray[mainID].gridorder2orderRow==""){
			  order2orderRowFloatArray[mainID].gridorder2orderRow = new dojox.Grid({
					title: "",
					id: "gridorder2orderRow"+mainID,
					jsId: "gridorder2orderRow"+mainID,
					structure: buildLayoutorder2orderRow(mainID),
					rowCount:order2orderRowFloatArray[mainID].querydataorder2orderRow.length,
					model:order2orderRowFloatArray[mainID].modelorder2orderRow
				},openContainerGrid);
				//gridorder2orderRow.resize({w: dijit.byId("rightPane").domNode.clientWidth-16,h:dijit.byId("rightPane").domNode.clientHeight-100});
				
		}else{
			order2orderRowFloatArray[mainID].gridorder2orderRow.updateRowCount(order2orderRowFloatArray[mainID].querydataorder2orderRow.length); 
		}}
}

																																									//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
																			//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
											var buildLayoutorder2orderRow = function(floatMainID){		
	var layoutorder2orderRow=[{
           //¸ù¾ÝfieldµÄÖµ£¬ÒÀ¾ÝÄ¬ÈÏµÄË³Ðò£¬´ÓjsÖÐµÄtoArray×ª»»·½·¨·µ»ØµÄquerydateÖÐÈ¡Êý¾Ý
   
			 cells: [ [
					   { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
					   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
            {name: i18nStr.productNum,field:2, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
		             ,  {name: i18nStr.unitNum,field:3, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
		             ,  {name: i18nStr.goodsSuttle,field:4, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
		             ,  {name: i18nStr.goodsWeight,field:5, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
		             ,  {name: i18nStr.goodsVolume,field:6, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
		        					,   {name: i18nStr.label, field: 7,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					                 ,  {name: i18nStr.carriage,field:8, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
		        					,   {name: i18nStr.especial, field: 9,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					            					,   {name: i18nStr.goodsState, field: 10,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					            				    ,   {name: i18nStr.remark, field: 11,width: 10, editor: dojox.grid.editors.Editor,required:false, editorToolbar: true  }
					      
//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
																//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
																			,   {name: i18nStr.product,field: 13,get:function(inRowIndex){ var str='';var strid;if(order2orderRowFloatArray[floatMainID].querydataorder2orderRow[inRowIndex]!=undefined && order2orderRowFloatArray[floatMainID].querydataorder2orderRow[inRowIndex][13]!=undefined && order2orderRowFloatArray[floatMainID].querydataorder2orderRow[inRowIndex][13][2]!=undefined){str=order2orderRowFloatArray[floatMainID].querydataorder2orderRow[inRowIndex][13][2];strid=order2orderRowFloatArray[floatMainID].querydataorder2orderRow[inRowIndex][13][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" class="imgSelectStyle" onclick="dojoOrderd.selectProd('+strid+','+inRowIndex+',13,0,event,'+floatMainID+');"   >';} ,width: 10 }
		
						                                        ] ]
                           }]; 
return layoutorder2orderRow;
}
var addRoworder2orderRow = function(id){

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
																							//{ass.otherEnd.name}=order
					addrow.push([false,id]);
																					addrow.push([]);
											addrow.splice(0,0,false,0);
	dijit.byId("gridorder2orderRow"+id).addRow(addrow,order2orderRowFloatArray[id].gridorder2orderRow.model.getRowCount());
} 

function removeorder2orderRow(id){
       var s= new Array();
       var sall=order2orderRowFloatArray[id].gridorder2orderRow.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
          s.push(i);
          var thisCell=sall[i];
          if(thisCell[1]!=0){//the row which will be deleted
            order2orderRowFloatArray[id].deletedataorder2orderRow.splice(order2orderRowFloatArray[id].deletedataorder2orderRow.length,0,thisCell[1]);
       }}}
       order2orderRowFloatArray[id].gridorder2orderRow.model.remove(s);//grid.removeSelectedRows();
 }
function call_funUpdorder2orderRow(id) {
       var sall=order2orderRowFloatArray[id].gridorder2orderRow.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
         var passAll=0;
         var thisCell=sall[i];
         var padd = new SOAPClientParameters2();
         var vobject=new Object();
         vobject.id=thisCell[1];
             if(dojox.validate.isInRange(thisCell[2],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[2];vobject.productNum=n;
             }else{order2orderRowFloatArray[id].gridorder2orderRow.getCell(order2orderRowFloatArray[id].gridorder2orderRow.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[3],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[3];vobject.unitNum=n;
             }else{order2orderRowFloatArray[id].gridorder2orderRow.getCell(order2orderRowFloatArray[id].gridorder2orderRow.model.fieldArray[3]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[4],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[4];vobject.goodsSuttle=n;
             }else{order2orderRowFloatArray[id].gridorder2orderRow.getCell(order2orderRowFloatArray[id].gridorder2orderRow.model.fieldArray[4]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[5],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[5];vobject.goodsWeight=n;
             }else{order2orderRowFloatArray[id].gridorder2orderRow.getCell(order2orderRowFloatArray[id].gridorder2orderRow.model.fieldArray[5]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[6],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[6];vobject.goodsVolume=n;
             }else{order2orderRowFloatArray[id].gridorder2orderRow.getCell(order2orderRowFloatArray[id].gridorder2orderRow.model.fieldArray[6]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

               vobject.label=thisCell[7];
 
             if(dojox.validate.isInRange(thisCell[8],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[8];vobject.carriage=n;
             }else{order2orderRowFloatArray[id].gridorder2orderRow.getCell(order2orderRowFloatArray[id].gridorder2orderRow.model.fieldArray[8]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

               vobject.especial=thisCell[9];
 
               vobject.goodsState=thisCell[10];
 
               vobject.remark=thisCell[11];
 

																var manageable=new Object();
			 manageable.id=mainID;
             vobject.order=manageable;
			 																var manageable=new Object();
			 if(order2orderRowFloatArray[id].querydataorder2orderRow[i][13]!=''&&order2orderRowFloatArray[id].querydataorder2orderRow[i][13]!=undefined){
             manageable.id=order2orderRowFloatArray[id].querydataorder2orderRow[i][13][1];
             vobject.product=manageable;
			 }else{
			 order2orderRowFloatArray[id].gridorder2orderRow.getCell(order2orderRowFloatArray[id].gridorder2orderRow.model.fieldArray[13]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
						


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('OrderRowdVO',vobject);
                SOAPClient.invoke(urlorder2orderRow, "createOrderRowd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                order2orderRowFloatArray[id].gridorder2orderRow.model.setDatum(ul,i,1);
				});
	         }else{//modify row
                padd.add('OrderRowdVO',vobject);
                SOAPClient.invoke(urlorder2orderRow, "updateOrderRowd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
        } }}//for
//submit delete
          for(var i=0;i<order2orderRowFloatArray[id].deletedataorder2orderRow.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',order2orderRowFloatArray[id].deletedataorder2orderRow[i]);
               SOAPClient.invoke(urlorder2orderRow, "deleteOrderRowd", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
	           });
          }
          order2orderRowFloatArray[id].deletedataorder2orderRow=new Array();
          //dojo.byId("rowCount").innerHTML = 'saved'; 
//submit delete end          
 } 
 
	function selectOrderdFun(rep){
						order2orderRowFloatArray[dojoOrderd.mainRowIndexOrderd].querydataorder2orderRow[dojoOrderd.selectOrderdInRow][dojoOrderd.noOrderd]=rep;
		order2orderRowFloatArray[dojoOrderd.mainRowIndexOrderd].gridorder2orderRow.updateRow(dojoOrderd.selectOrderdInRow);	
		
			
	}
	function selectProdFun(rep){
						order2orderRowFloatArray[dojoOrderd.mainRowIndexProd].querydataorder2orderRow[dojoOrderd.selectProdInRow][dojoOrderd.noProd]=rep;
		order2orderRowFloatArray[dojoOrderd.mainRowIndexProd].gridorder2orderRow.updateRow(dojoOrderd.selectProdInRow);	
		
			
	}

function pageSizeChangeorder2orderRow(mylabel){
	order2orderRowFloatArray[id].pagesizeorder2orderRow=mylabel;
	getVOorder2orderRow(order2orderRowFloatArray[id].queryvoorder2orderRow,mainID);
}

function allpageorder2orderRow(id){
	order2orderRowFloatArray[id].pagesizeorder2orderRow=0;
	getVOorder2orderRow(order2orderRowFloatArray[id].queryvoorder2orderRow,mainID);
}

function upPageorder2orderRow(id){
	pagenumberorder2orderRow--;
	getVOorder2orderRow(order2orderRowFloatArray[id].queryvoorder2orderRow,mainID);
}
function downPageorder2orderRow(id){
	pagenumberorder2orderRow++;
	getVOorder2orderRow(order2orderRowFloatArray[id].queryvoorder2orderRow,mainID);
}


	  