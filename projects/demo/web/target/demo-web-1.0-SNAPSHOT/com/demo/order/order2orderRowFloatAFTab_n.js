	  //---begin---------ÅÐ¶ÏÊÇ·ñÎª¶à¶Ô¶àµÄ¹ØÏµ±í
																					//---begin---------ÅÐ¶ÏÊÇ·ñÖ±½Ó¹ØÁªÁËtree½á¹¹±ísno
											//ÒÔÏÂÊÇÆÕÍ¨±í
//set (= order2orderRow)
  //name =order2orderRowFloatAFTab.js  manageable.name=OrderRowd
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
  var gridorder2orderRow;*/
   
  
var getVOorder2orderRow=function(queryvo,id){

	var pu = new SOAPClientParameters2();
	pu.add('OrderRowdVO',queryvo) ;
	pu.add('pageNumber',order2orderRowFloatArray[id].pagenumberorder2orderRow) ;
	pu.add('pageSize',order2orderRowFloatArray[id].pagesizeorder2orderRow) ;
	pu.add('orderBy',order2orderRowFloatArray[id].orderByorder2orderRow) ;
	SOAPClient.invoke(urlorder2orderRow,"getOrderRowd", pu, false,  function GetEnu_callBack(ul, soapResponse){      
		//ÅÐ¶Ï±¾±íÊÇ·ñÎª×Ó±í,µ±Ò»¸ö±íÊÇ¶à¸ö±íµÄ×Ó±íÊ±£¬´Ë´¦¿ÉÄÜÓÐ´íÎó¡£	
						//Orderd-----Orderd
			order2orderRowFloatArray[id].querydataorder2orderRow=dojoOrderd.OrderRowdVOtoArray_fun(ul,false);
			
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
	if( mainID!=undefined && mainID!=''){
		var openFloat=dijit.byId("gridorder2orderRow"+mainID);
		if(openFloat==undefined){
		
		order2orderRowFloatArray[mainID] = new order2orderRowFloatPara(mainID);
				var newTab = dijit.byId("order2orderRow"+mainID);
			newTab.setContent("<table   style=\"width:80%; position:absolute;top:0px;\"><tr height=\"25px\" width=\"100%\">	<td align=\"left\" style=\"background:transparent\"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   order2orderRow&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td><td align=\"right\" ><span ></span>&nbsp;&nbsp;	<div > </div><div > </div><div > </div>	<div > </div><div > </div>	</td></tr></table><div style=\"{width:500px;height:500px; position:absolute;top:30px;}\" ><div > </div></div>");
			var openContainerTable=newTab.containerNode.children[0].children[0].children[0].children[1].childNodes;

		openContainerTable[0].innerHTML="<span id=\"rowCountorder2orderRow"+mainID+"\"></span>";
var but1 = new dijit.form.myButton({label:"pageup",id:"but6order2orderRow"+mainID,disabled:"true",onclick:"upPageorder2orderRow("+mainID+");",iconClass:"upPageIcon"},openContainerTable[1]);
var but2= new dijit.form.myButton({label:"pagedown",id:"but7order2orderRow"+mainID,disabled:"true",onclick:"downPageorder2orderRow("+mainID+");",iconClass:"downPageIcon"},openContainerTable[2]);
	//var but3 = new dijit.form.Button({label:"add",iconClass:"addIcon"},openContainerTable[3]);
	//var but4 = new dijit.form.Button({label:"delete",iconClass:"delIcon"},openContainerTable[4]);//,onClick:"removeorder2orderRow("+mainID+")"
	//var but5 = new dijit.form.Button({label:"save",iconClass:"saveIcon",id:"but3order2orderRow"+mainID },openContainerTable[5]);//,onclick:but3order2orderRow(mainID)
		//dojo.connect(but3, "onClick", function(e){  addRoworder2orderRow(""+mainID); });
		//dojo.connect(but4, "onClick", function(e){  removeorder2orderRow(""+mainID); });
		//dojo.connect(but5, "onClick", function(e){  call_funUpdorder2orderRow(""+mainID); });
				var openContainerGrid=newTab.domNode.children[1].children[0];


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
				order2orderRowFloatArray[mainID].gridorder2orderRow.resize({w:999,h:500});

		}else{
			getVOorder2orderRow(order2orderRowFloatArray[mainID].queryvoorder2orderRow,mainID);
			order2orderRowFloatArray[mainID].gridorder2orderRow.modelAllChange();

		}}

}

																																									var buildLayoutorder2orderRow = function(floatMainID){		

	var layoutorder2orderRow=[{
           //¸ù¾ÝfieldµÄÖµ£¬ÒÀ¾ÝÄ¬ÈÏµÄË³Ðò£¬´ÓjsÖÐµÄtoArray×ª»»·½·¨·µ»ØµÄquerydateÖÐÈ¡Êý¾Ý
   
			 cells: [ [
					   //{ name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
					   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
            {name: i18nStr.productNum,field:2, width: 8}
		             ,  {name: i18nStr.unitNum,field:3, width: 8}
		             ,  {name: i18nStr.goodsSuttle,field:4, width: 8}
		             ,  {name: i18nStr.goodsWeight,field:5, width: 8}
		             ,  {name: i18nStr.goodsVolume,field:6, width: 8}
		    		,   {name: i18nStr.label, field: 7,width: 10}
		             ,  {name: i18nStr.carriage,field:8, width: 8}
		    		,   {name: i18nStr.especial, field: 9,width: 10}
		    		,   {name: i18nStr.goodsState, field: 10,width: 10}
		    		,   {name: i18nStr.remark, field: 11,width: 10}
		  
//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
																//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
																	,   {name: i18nStr.product,field: 13,get:function(inRowIndex){ var str='';var strid;if(order2orderRowFloatArray[floatMainID].querydataorder2orderRow[inRowIndex]!=undefined && order2orderRowFloatArray[floatMainID].querydataorder2orderRow[inRowIndex][13]!=undefined && order2orderRowFloatArray[floatMainID].querydataorder2orderRow[inRowIndex][13][2]!=undefined){str=order2orderRowFloatArray[floatMainID].querydataorder2orderRow[inRowIndex][13][2];strid=order2orderRowFloatArray[floatMainID].querydataorder2orderRow[inRowIndex][13][1];} return str;} ,width: 10 }
										                                        ] ]
                           }]; 

return layoutorder2orderRow;
}


	  