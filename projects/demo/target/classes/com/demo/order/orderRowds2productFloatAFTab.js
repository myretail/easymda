	  	  //---begin---------???????????¨¤???¨¤??????¡À¨ª
																					//---begin---------?????????¡À????????tree?¨¢??¡À¨ªsno
											//?????????¡§¡À¨ª
//set (= orderRowds2product)
  //name =orderRowds2productFloatAFTab.js  manageable.name=OrderRowd
  														  var NUorderRowds2product = false;//needUpdate
  var urlorderRowds2product = getUrl()+ "services/OrderRowdManageService";
 /* var deletedataorderRowds2product =  new Array();
  var querydataorderRowds2product =  new Array();
  var pagenumberorderRowds2product=1;
  var totalCountorderRowds2product=0;
  var pagesizeorderRowds2product=10;
  var orderByorderRowds2product='0';
  var queryvoorderRowds2product=new Object();
  var oddstyle='';
  var modelorderRowds2product = new dojox.grid.data.Table(null, querydataorderRowds2product);
  var gridorderRowds2product;*/
   
  
var getVOorderRowds2product=function(queryvo,id){

	var pu = new SOAPClientParameters2();
	pu.add('OrderRowdVO',queryvo) ;
	pu.add('pageNumber',orderRowds2productFloatArray[id].pagenumberorderRowds2product) ;
	pu.add('pageSize',orderRowds2productFloatArray[id].pagesizeorderRowds2product) ;
	pu.add('orderBy',orderRowds2productFloatArray[id].orderByorderRowds2product) ;
	SOAPClient.invoke(urlorderRowds2product,"getOrderRowd", pu, false,  function GetEnu_callBack(ul, soapResponse){      
		//????¡À?¡À¨ª??????¡Á?¡À¨ª,?¡À????¡À¨ª???¨¤??¡À¨ª??¡Á?¡À¨ª?¡À?????????????¨ª?¨®??	
					     //Orderd-----Prod
			orderRowds2productFloatArray[id].querydataorderRowds2product=dojoOrderRowd.OrderRowdVOtoArray_fun(ul,false);
			
	orderRowds2productFloatArray[id].totalCountorderRowds2product=ul[ul.length-1]["ns:id"]; 
	}); 
	var totalpage=Math.ceil(new Number(orderRowds2productFloatArray[id].totalCountorderRowds2product)/orderRowds2productFloatArray[id].pagesizeorderRowds2product);
	
	if(totalpage>1){
		if(orderRowds2productFloatArray[id].pagenumberorderRowds2product==1){
			dijit.byId("but6orderRowds2product"+id).setDisabled(true);
			dijit.byId("but7orderRowds2product"+id).setDisabled(false);
		}else if(orderRowds2productFloatArray[id].pagenumberorderRowds2product==totalpage){
			dijit.byId("but6orderRowds2product"+id).setDisabled(false);
			dijit.byId("but7orderRowds2product"+id).setDisabled(true);
		}else{
			dijit.byId("but6orderRowds2product"+id).setDisabled(false);
			dijit.byId("but7orderRowds2product"+id).setDisabled(false);
		}
	}else{
		dijit.byId("but6orderRowds2product"+id).setDisabled(true);
		dijit.byId("but7orderRowds2product"+id).setDisabled(true);
	
	}
	if(orderRowds2productFloatArray[id].pagesizeorderRowds2product==0){
		totalpage=1;
		dijit.byId("but6orderRowds2product"+id).setDisabled(true);
		dijit.byId("but7orderRowds2product"+id).setDisabled(true);
	}
	if(totalpage==1)orderRowds2productFloatArray[id].pagenumberorderRowds2product=1;
	
	 document.getElementById("rowCountorderRowds2product"+id).innerHTML=i18nStr.di+" "+orderRowds2productFloatArray[id].pagenumberorderRowds2product+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+orderRowds2productFloatArray[id].totalCountorderRowds2product+" "+i18nStr.rowSize; 	

	orderRowds2productFloatArray[id].querydataorderRowds2product.splice(orderRowds2productFloatArray[id].querydataorderRowds2product.length-1,1);
	orderRowds2productFloatArray[id].modelorderRowds2product.setData(orderRowds2productFloatArray[id].querydataorderRowds2product);
}

var buildorderRowds2product=function(mainID){
	if( mainID!=undefined && mainID!=''){
		    var openFloat=dijit.byId("openFloat_"+mainID);
		var openGrid=dijit.byId("gridorderRowds2product"+mainID);
		if(openGrid==undefined){
		openFloat.setContent("<table style=\"width:80%; position:absolute;top:0px;\"><tr height=\"25px\" width=\"100%\"><td align=\"left\" style=\"background:transparent\"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   orderRowds2product List&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td><td align=\"right\" ><span ></span>&nbsp;&nbsp;<div ></div><div > </div><div ></div><div ></div><div ></div></td></tr></table><div style=\"{width:999px;height:500px; position:absolute;top:30px;}\" ><div ></div></div>");

	  	orderRowds2productFloatArray[mainID] = new orderRowds2productFloatPara(mainID);
		var openContainerTable=openFloat.containerNode.children[0].children[0].children[0].children[1].childNodes;
		openContainerTable[0].innerHTML="<span id=\"rowCountorderRowds2product"+mainID+"\"></span>";
var but1 = new dijit.form.myButton({label:"pageup",id:"but6orderRowds2product"+mainID,disabled:"true",onclick:"upPageorderRowds2product("+mainID+");",iconClass:"upPageIcon"},openContainerTable[1]);
var but2= new dijit.form.myButton({label:"pagedown",id:"but7orderRowds2product"+mainID,disabled:"true",onclick:"downPageorderRowds2product("+mainID+");",iconClass:"downPageIcon"},openContainerTable[2]);
	//var but3 = new dijit.form.Button({label:"add",iconClass:"addIcon"},openContainerTable[3]);
	//var but4 = new dijit.form.Button({label:"delete",iconClass:"delIcon"},openContainerTable[4]);//,onClick:"removeorderRowds2product("+mainID+")"
	//var but5 = new dijit.form.Button({label:"save",iconClass:"saveIcon",id:"but3orderRowds2product"+mainID },openContainerTable[5]);//,onclick:but3orderRowds2product(mainID)
		//dojo.connect(but3, "onClick", function(e){  addRoworderRowds2product(""+mainID); });
		//dojo.connect(but4, "onClick", function(e){  removeorderRowds2product(""+mainID); });
		//dojo.connect(but5, "onClick", function(e){  call_funUpdorderRowds2product(""+mainID); });
		var openContainerGrid=openFloat.containerNode.children[1].children[0];

				var queryFloatProd=new Object();
		queryFloatProd.id=mainID;
		orderRowds2productFloatArray[mainID].queryvoorderRowds2product.product=queryFloatProd;
		getVOorderRowds2product(orderRowds2productFloatArray[mainID].queryvoorderRowds2product,mainID);
		//if(orderRowds2productFloatArray[mainID].gridorderRowds2product==""){
			  orderRowds2productFloatArray[mainID].gridorderRowds2product = new dojox.Grid({
					title: "",
					id: "gridorderRowds2product"+mainID,
					jsId: "gridorderRowds2product"+mainID,
					structure: buildLayoutorderRowds2product(mainID),
					rowCount:orderRowds2productFloatArray[mainID].querydataorderRowds2product.length,
					model:orderRowds2productFloatArray[mainID].modelorderRowds2product
				},openContainerGrid);
				//gridorderRowds2product.resize({w: dijit.byId("rightPane").domNode.clientWidth-16,h:dijit.byId("rightPane").domNode.clientHeight-100});
				
		}else{
			orderRowds2productFloatArray[mainID].gridorderRowds2product.updateRowCount(orderRowds2productFloatArray[mainID].querydataorderRowds2product.length); 
		}}

}

																																									var buildLayoutorderRowds2product = function(floatMainID){		

	var layoutorderRowds2product=[{
           //?¨´??field???????????????????¨°????js????toArray¡Á??????¡§??????querydate????????
   
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
		  
//??????¡À¨ª???¨ª????????
																//??????¡À¨ª???¨ª????????
																	//,   {name: i18nStr.product,field: 13,get:function(inRowIndex){ var str='';var strid;if(orderRowds2productFloatArray[floatMainID].querydataorderRowds2product[inRowIndex]!=undefined && orderRowds2productFloatArray[floatMainID].querydataorderRowds2product[inRowIndex][13]!=undefined && orderRowds2productFloatArray[floatMainID].querydataorderRowds2product[inRowIndex][13][2]!=undefined){str=orderRowds2productFloatArray[floatMainID].querydataorderRowds2product[inRowIndex][13][2];strid=orderRowds2productFloatArray[floatMainID].querydataorderRowds2product[inRowIndex][13][1];} return str;} ,width: 10 }
						                                        ] ]
                           }]; 

return layoutorderRowds2product;
}


