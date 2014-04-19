	  	  //---begin---------???????????¨¤???¨¤??????¡À¨ª
											//---begin---------?????????¡À????????tree?¨¢??¡À¨ªsno
						//?????????¡§¡À¨ª
//set (= principal2prods)
  //name =principal2prodsFloatAFTab.js  manageable.name=Prod
  											  var NUprincipal2prods = false;//needUpdate
  var urlprincipal2prods = getUrl()+ "services/ProdManageService";
 /* var deletedataprincipal2prods =  new Array();
  var querydataprincipal2prods =  new Array();
  var pagenumberprincipal2prods=1;
  var totalCountprincipal2prods=0;
  var pagesizeprincipal2prods=10;
  var orderByprincipal2prods='0';
  var queryvoprincipal2prods=new Object();
  var oddstyle='';
  var modelprincipal2prods = new dojox.grid.data.Table(null, querydataprincipal2prods);
  var gridprincipal2prods;*/
   
  
var getVOprincipal2prods=function(queryvo,id){

	var pu = new SOAPClientParameters2();
	pu.add('ProdVO',queryvo) ;
	pu.add('pageNumber',principal2prodsFloatArray[id].pagenumberprincipal2prods) ;
	pu.add('pageSize',principal2prodsFloatArray[id].pagesizeprincipal2prods) ;
	pu.add('orderBy',principal2prodsFloatArray[id].orderByprincipal2prods) ;
	SOAPClient.invoke(urlprincipal2prods,"getProd", pu, false,  function GetEnu_callBack(ul, soapResponse){      
		//????¡À?¡À¨ª??????¡Á?¡À¨ª,?¡À????¡À¨ª???¨¤??¡À¨ª??¡Á?¡À¨ª?¡À?????????????¨ª?¨®??	
	principal2prodsFloatArray[id].querydataprincipal2prods=dojoProd.ProdVOtoArray_fun(ul,false);

	principal2prodsFloatArray[id].totalCountprincipal2prods=ul[ul.length-1]["ns:id"]; 
	}); 
	var totalpage=Math.ceil(new Number(principal2prodsFloatArray[id].totalCountprincipal2prods)/principal2prodsFloatArray[id].pagesizeprincipal2prods);
	
	if(totalpage>1){
		if(principal2prodsFloatArray[id].pagenumberprincipal2prods==1){
			dijit.byId("but6principal2prods"+id).setDisabled(true);
			dijit.byId("but7principal2prods"+id).setDisabled(false);
		}else if(principal2prodsFloatArray[id].pagenumberprincipal2prods==totalpage){
			dijit.byId("but6principal2prods"+id).setDisabled(false);
			dijit.byId("but7principal2prods"+id).setDisabled(true);
		}else{
			dijit.byId("but6principal2prods"+id).setDisabled(false);
			dijit.byId("but7principal2prods"+id).setDisabled(false);
		}
	}else{
		dijit.byId("but6principal2prods"+id).setDisabled(true);
		dijit.byId("but7principal2prods"+id).setDisabled(true);
	
	}
	if(principal2prodsFloatArray[id].pagesizeprincipal2prods==0){
		totalpage=1;
		dijit.byId("but6principal2prods"+id).setDisabled(true);
		dijit.byId("but7principal2prods"+id).setDisabled(true);
	}
	if(totalpage==1)principal2prodsFloatArray[id].pagenumberprincipal2prods=1;
	
	 document.getElementById("rowCountprincipal2prods"+id).innerHTML=i18nStr.di+" "+principal2prodsFloatArray[id].pagenumberprincipal2prods+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+principal2prodsFloatArray[id].totalCountprincipal2prods+" "+i18nStr.rowSize; 	

	principal2prodsFloatArray[id].querydataprincipal2prods.splice(principal2prodsFloatArray[id].querydataprincipal2prods.length-1,1);
	principal2prodsFloatArray[id].modelprincipal2prods.setData(principal2prodsFloatArray[id].querydataprincipal2prods);
}

var buildprincipal2prods=function(mainID){
	if( mainID!=undefined && mainID!=''){
		var openFloat=dijit.byId("gridprincipal2prods"+mainID);
		if(openFloat==undefined){
		
		principal2prodsFloatArray[mainID] = new principal2prodsFloatPara(mainID);
				var newTab = dijit.byId("principal2prods"+mainID);
			newTab.setContent("<table   style=\"width:80%; position:absolute;top:0px;\"><tr height=\"25px\" width=\"100%\">	<td align=\"left\" style=\"background:transparent\"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   principal2prods&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td><td align=\"right\" ><span ></span>&nbsp;&nbsp;	<div > </div><div > </div><div > </div>	<div > </div><div > </div>	</td></tr></table><div style=\"{width:500px;height:500px; position:absolute;top:30px;}\" ><div > </div></div>");
			var openContainerTable=newTab.containerNode.children[0].children[0].children[0].children[1].childNodes;

		openContainerTable[0].innerHTML="<span id=\"rowCountprincipal2prods"+mainID+"\"></span>";
var but1 = new dijit.form.myButton({label:"pageup",id:"but6principal2prods"+mainID,disabled:"true",onclick:"upPageprincipal2prods("+mainID+");",iconClass:"upPageIcon"},openContainerTable[1]);
var but2= new dijit.form.myButton({label:"pagedown",id:"but7principal2prods"+mainID,disabled:"true",onclick:"downPageprincipal2prods("+mainID+");",iconClass:"downPageIcon"},openContainerTable[2]);
	//var but3 = new dijit.form.Button({label:"add",iconClass:"addIcon"},openContainerTable[3]);
	//var but4 = new dijit.form.Button({label:"delete",iconClass:"delIcon"},openContainerTable[4]);//,onClick:"removeprincipal2prods("+mainID+")"
	//var but5 = new dijit.form.Button({label:"save",iconClass:"saveIcon",id:"but3principal2prods"+mainID },openContainerTable[5]);//,onclick:but3principal2prods(mainID)
		//dojo.connect(but3, "onClick", function(e){  addRowprincipal2prods(""+mainID); });
		//dojo.connect(but4, "onClick", function(e){  removeprincipal2prods(""+mainID); });
		//dojo.connect(but5, "onClick", function(e){  call_funUpdprincipal2prods(""+mainID); });
				var openContainerGrid=newTab.domNode.children[1].children[0];


				var queryFloatPeoples=new Object();
		queryFloatPeoples.id=mainID;
		principal2prodsFloatArray[mainID].queryvoprincipal2prods.principal=queryFloatPeoples;
		getVOprincipal2prods(principal2prodsFloatArray[mainID].queryvoprincipal2prods,mainID);
		//if(principal2prodsFloatArray[mainID].gridprincipal2prods==""){
			  principal2prodsFloatArray[mainID].gridprincipal2prods = new dojox.Grid({
					title: "",
					id: "gridprincipal2prods"+mainID,
					jsId: "gridprincipal2prods"+mainID,
					structure: buildLayoutprincipal2prods(mainID),
					rowCount:principal2prodsFloatArray[mainID].querydataprincipal2prods.length,
					model:principal2prodsFloatArray[mainID].modelprincipal2prods
				},openContainerGrid);
				//gridprincipal2prods.resize({w: dijit.byId("rightPane").domNode.clientWidth-16,h:dijit.byId("rightPane").domNode.clientHeight-100});
				principal2prodsFloatArray[mainID].gridprincipal2prods.resize({w:999,h:500});

		}else{
			getVOprincipal2prods(principal2prodsFloatArray[mainID].queryvoprincipal2prods,mainID);
			principal2prodsFloatArray[mainID].gridprincipal2prods.modelAllChange();

		}}

}

																							var buildLayoutprincipal2prods = function(floatMainID){		

	var layoutprincipal2prods=[{
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
												,   {name: i18nStr.prodCust,field: 7,get:function(inRowIndex){ var str='';var strid;if(principal2prodsFloatArray[floatMainID].querydataprincipal2prods[inRowIndex]!=undefined && principal2prodsFloatArray[floatMainID].querydataprincipal2prods[inRowIndex][7]!=undefined && principal2prodsFloatArray[floatMainID].querydataprincipal2prods[inRowIndex][7][2]!=undefined){str=principal2prodsFloatArray[floatMainID].querydataprincipal2prods[inRowIndex][7][2];strid=principal2prodsFloatArray[floatMainID].querydataprincipal2prods[inRowIndex][7][1];} return str;} ,width: 10 }
										//??????¡À¨ª???¨ª????????
												//,   {name: i18nStr.principal,field: 8,get:function(inRowIndex){ var str='';var strid;if(principal2prodsFloatArray[floatMainID].querydataprincipal2prods[inRowIndex]!=undefined && principal2prodsFloatArray[floatMainID].querydataprincipal2prods[inRowIndex][8]!=undefined && principal2prodsFloatArray[floatMainID].querydataprincipal2prods[inRowIndex][8][2]!=undefined){str=principal2prodsFloatArray[floatMainID].querydataprincipal2prods[inRowIndex][8][2];strid=principal2prodsFloatArray[floatMainID].querydataprincipal2prods[inRowIndex][8][1];} return str;} ,width: 10 }
						                                        ] ]
                           }]; 

return layoutprincipal2prods;
}


