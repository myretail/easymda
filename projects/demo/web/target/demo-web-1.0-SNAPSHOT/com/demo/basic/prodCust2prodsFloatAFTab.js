	  //---begin---------???????????¨¤???¨¤??????¡À¨ª
											//---begin---------?????????¡À????????tree?¨¢??¡À¨ªsno
						//?????????¡§¡À¨ª
//set (= prodCust2prods)
  //name =prodCust2prodsFloatAFTab.js  manageable.name=Prod
  											  var NUprodCust2prods = false;//needUpdate
  var urlprodCust2prods = getUrl()+ "services/ProdManageService";
 /* var deletedataprodCust2prods =  new Array();
  var querydataprodCust2prods =  new Array();
  var pagenumberprodCust2prods=1;
  var totalCountprodCust2prods=0;
  var pagesizeprodCust2prods=10;
  var orderByprodCust2prods='0';
  var queryvoprodCust2prods=new Object();
  var oddstyle='';
  var modelprodCust2prods = new dojox.grid.data.Table(null, querydataprodCust2prods);
  var gridprodCust2prods;*/
   
  
var getVOprodCust2prods=function(queryvo,id){

	var pu = new SOAPClientParameters2();
	pu.add('ProdVO',queryvo) ;
	pu.add('pageNumber',prodCust2prodsFloatArray[id].pagenumberprodCust2prods) ;
	pu.add('pageSize',prodCust2prodsFloatArray[id].pagesizeprodCust2prods) ;
	pu.add('orderBy',prodCust2prodsFloatArray[id].orderByprodCust2prods) ;
	SOAPClient.invoke(urlprodCust2prods,"getProd", pu, false,  function GetEnu_callBack(ul, soapResponse){      
		//????¡À?¡À¨ª??????¡Á?¡À¨ª,?¡À????¡À¨ª???¨¤??¡À¨ª??¡Á?¡À¨ª?¡À?????????????¨ª?¨®??	
	prodCust2prodsFloatArray[id].querydataprodCust2prods=dojoProd.ProdVOtoArray_fun(ul,false);

	prodCust2prodsFloatArray[id].totalCountprodCust2prods=ul[ul.length-1]["ns:id"]; 
	}); 
	var totalpage=Math.ceil(new Number(prodCust2prodsFloatArray[id].totalCountprodCust2prods)/prodCust2prodsFloatArray[id].pagesizeprodCust2prods);
	
	if(totalpage>1){
		if(prodCust2prodsFloatArray[id].pagenumberprodCust2prods==1){
			dijit.byId("but6prodCust2prods"+id).setDisabled(true);
			dijit.byId("but7prodCust2prods"+id).setDisabled(false);
		}else if(prodCust2prodsFloatArray[id].pagenumberprodCust2prods==totalpage){
			dijit.byId("but6prodCust2prods"+id).setDisabled(false);
			dijit.byId("but7prodCust2prods"+id).setDisabled(true);
		}else{
			dijit.byId("but6prodCust2prods"+id).setDisabled(false);
			dijit.byId("but7prodCust2prods"+id).setDisabled(false);
		}
	}else{
		dijit.byId("but6prodCust2prods"+id).setDisabled(true);
		dijit.byId("but7prodCust2prods"+id).setDisabled(true);
	
	}
	if(prodCust2prodsFloatArray[id].pagesizeprodCust2prods==0){
		totalpage=1;
		dijit.byId("but6prodCust2prods"+id).setDisabled(true);
		dijit.byId("but7prodCust2prods"+id).setDisabled(true);
	}
	if(totalpage==1)prodCust2prodsFloatArray[id].pagenumberprodCust2prods=1;
	
	 document.getElementById("rowCountprodCust2prods"+id).innerHTML=i18nStr.di+" "+prodCust2prodsFloatArray[id].pagenumberprodCust2prods+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+prodCust2prodsFloatArray[id].totalCountprodCust2prods+" "+i18nStr.rowSize; 	

	prodCust2prodsFloatArray[id].querydataprodCust2prods.splice(prodCust2prodsFloatArray[id].querydataprodCust2prods.length-1,1);
	prodCust2prodsFloatArray[id].modelprodCust2prods.setData(prodCust2prodsFloatArray[id].querydataprodCust2prods);
}

var buildprodCust2prods=function(mainID){
	if( mainID!=undefined && mainID!=''){
		    var openFloat=dijit.byId("openFloat_"+mainID);
		var openGrid=dijit.byId("gridprodCust2prods"+mainID);
		if(openGrid==undefined){
		openFloat.setContent("<table style=\"width:80%; position:absolute;top:0px;\"><tr height=\"25px\" width=\"100%\"><td align=\"left\" style=\"background:transparent\"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   prodCust2prods List&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td><td align=\"right\" ><span ></span>&nbsp;&nbsp;<div ></div><div > </div><div ></div><div ></div><div ></div></td></tr></table><div style=\"{width:999px;height:500px; position:absolute;top:30px;}\" ><div ></div></div>");

	  	prodCust2prodsFloatArray[mainID] = new prodCust2prodsFloatPara(mainID);
		var openContainerTable=openFloat.containerNode.children[0].children[0].children[0].children[1].childNodes;
		openContainerTable[0].innerHTML="<span id=\"rowCountprodCust2prods"+mainID+"\"></span>";
var but1 = new dijit.form.myButton({label:"pageup",id:"but6prodCust2prods"+mainID,disabled:"true",onclick:"upPageprodCust2prods("+mainID+");",iconClass:"upPageIcon"},openContainerTable[1]);
var but2= new dijit.form.myButton({label:"pagedown",id:"but7prodCust2prods"+mainID,disabled:"true",onclick:"downPageprodCust2prods("+mainID+");",iconClass:"downPageIcon"},openContainerTable[2]);
	//var but3 = new dijit.form.Button({label:"add",iconClass:"addIcon"},openContainerTable[3]);
	//var but4 = new dijit.form.Button({label:"delete",iconClass:"delIcon"},openContainerTable[4]);//,onClick:"removeprodCust2prods("+mainID+")"
	//var but5 = new dijit.form.Button({label:"save",iconClass:"saveIcon",id:"but3prodCust2prods"+mainID },openContainerTable[5]);//,onclick:but3prodCust2prods(mainID)
		//dojo.connect(but3, "onClick", function(e){  addRowprodCust2prods(""+mainID); });
		//dojo.connect(but4, "onClick", function(e){  removeprodCust2prods(""+mainID); });
		//dojo.connect(but5, "onClick", function(e){  call_funUpdprodCust2prods(""+mainID); });
		var openContainerGrid=openFloat.containerNode.children[1].children[0];

				var queryFloatCustomer=new Object();
		queryFloatCustomer.id=mainID;
		prodCust2prodsFloatArray[mainID].queryvoprodCust2prods.prodCust=queryFloatCustomer;
		getVOprodCust2prods(prodCust2prodsFloatArray[mainID].queryvoprodCust2prods,mainID);
		//if(prodCust2prodsFloatArray[mainID].gridprodCust2prods==""){
			  prodCust2prodsFloatArray[mainID].gridprodCust2prods = new dojox.Grid({
					title: "",
					id: "gridprodCust2prods"+mainID,
					jsId: "gridprodCust2prods"+mainID,
					structure: buildLayoutprodCust2prods(mainID),
					rowCount:prodCust2prodsFloatArray[mainID].querydataprodCust2prods.length,
					model:prodCust2prodsFloatArray[mainID].modelprodCust2prods
				},openContainerGrid);
				//gridprodCust2prods.resize({w: dijit.byId("rightPane").domNode.clientWidth-16,h:dijit.byId("rightPane").domNode.clientHeight-100});
				
		}else{
			prodCust2prodsFloatArray[mainID].gridprodCust2prods.updateRowCount(prodCust2prodsFloatArray[mainID].querydataprodCust2prods.length); 
		}}

}

																							var buildLayoutprodCust2prods = function(floatMainID){		

	var layoutprodCust2prods=[{
           //?¨´??field???????????????????¨°????js????toArray¡Á??????¡§??????querydate????????
   
			 cells: [ [
					   //{ name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
					   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
  		  {name: i18nStr.prodName, field: 2,width: 10}
		    		,   {name: i18nStr.code, field: 3,width: 10}
		             ,  {name: i18nStr.price,field:4, width: 8}
		    		,   {name: i18nStr.datef,field:5, width: 8}
		    		,   {name: i18nStr.prodType, field: 6,width: 10}
		  
//??????¡À¨ª???¨ª????????
												//,   {name: i18nStr.prodCust,field: 7,get:function(inRowIndex){ var str='';var strid;if(prodCust2prodsFloatArray[floatMainID].querydataprodCust2prods[inRowIndex]!=undefined && prodCust2prodsFloatArray[floatMainID].querydataprodCust2prods[inRowIndex][7]!=undefined && prodCust2prodsFloatArray[floatMainID].querydataprodCust2prods[inRowIndex][7][2]!=undefined){str=prodCust2prodsFloatArray[floatMainID].querydataprodCust2prods[inRowIndex][7][2];strid=prodCust2prodsFloatArray[floatMainID].querydataprodCust2prods[inRowIndex][7][1];} return str;} ,width: 10 }
						//??????¡À¨ª???¨ª????????
												,   {name: i18nStr.principal,field: 8,get:function(inRowIndex){ var str='';var strid;if(prodCust2prodsFloatArray[floatMainID].querydataprodCust2prods[inRowIndex]!=undefined && prodCust2prodsFloatArray[floatMainID].querydataprodCust2prods[inRowIndex][8]!=undefined && prodCust2prodsFloatArray[floatMainID].querydataprodCust2prods[inRowIndex][8][2]!=undefined){str=prodCust2prodsFloatArray[floatMainID].querydataprodCust2prods[inRowIndex][8][2];strid=prodCust2prodsFloatArray[floatMainID].querydataprodCust2prods[inRowIndex][8][1];} return str;} ,width: 10 }
										                                        ] ]
                           }]; 

return layoutprodCust2prods;
}


	  