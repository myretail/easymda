	  //---begin---------???????????¨¤???¨¤??????¡À¨ª
											//---begin---------?????????¡À????????tree?¨¢??¡À¨ªsno
						//?????????¡§¡À¨ª
//set (= prodCust2prods)
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
  var gridprodCust2prods;
  var urle2 = getUrl()+ "services/BasicManageService";   */
  
 
  
var getVOprodCust2prods=function(queryvo,id){

	var pu = new SOAPClientParameters2();
	pu.add('ProdVO',queryvo) ;
	pu.add('pageNumber',prodCust2prodsFloatArray[id].pagenumberprodCust2prods) ;
	pu.add('pageSize',prodCust2prodsFloatArray[id].pagesizeprodCust2prods) ;
	pu.add('orderBy',prodCust2prodsFloatArray[id].orderByprodCust2prods) ;
	SOAPClient.invoke(urlprodCust2prods,"getProd", pu, false,  function GetEnu_callBack(ul, soapResponse){      
	//????¡À?¡À¨ª??????¡Á?¡À¨ª,?¡À????¡À¨ª???¨¤??¡À¨ª??¡Á?¡À¨ª?¡À?????????????¨ª?¨®??	
	prodCust2prodsFloatArray[id].querydataprodCust2prods=dojoProd.ProdVOtoArray_fun(ul,true);
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
	if( mainID!=undefined && mainID!=''){//NUprodCust2prods &&
	    var openFloat=dijit.byId("openFloat_"+mainID);
		var openGrid=dijit.byId("gridprodCust2prods"+mainID);
		if(openGrid==undefined){
		openFloat.setContent("<table style=\"width:80%; position:absolute;top:0px;\"><tr height=\"25px\" width=\"100%\"><td align=\"left\" style=\"background:transparent\"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   prodCust2prods List&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td><td align=\"right\" ><span ></span>&nbsp;&nbsp;<div ></div><div > </div><div ></div><div ></div><div ></div></td></tr></table><div style=\"{width:999px;height:500px; position:absolute;top:30px;}\" ><div ></div></div>");

	  	prodCust2prodsFloatArray[mainID] = new prodCust2prodsFloatPara(mainID);
		var openContainerTable=openFloat.containerNode.children[0].children[0].children[0].children[1].childNodes;
		openContainerTable[0].innerHTML="<span id=\"rowCountprodCust2prods"+mainID+"\"></span>";
var but1 = new dijit.form.myButton({label:"pageup",id:"but6prodCust2prods"+mainID,disabled:"true",onclick:"upPageprodCust2prods("+mainID+");",iconClass:"upPageIcon"},openContainerTable[1]);
var but2= new dijit.form.myButton({label:"pagedown",id:"but7prodCust2prods"+mainID,disabled:"true",onclick:"downPageprodCust2prods("+mainID+");",iconClass:"downPageIcon"},openContainerTable[2]);
	var but3 = new dijit.form.Button({label:"add",iconClass:"addIcon"},openContainerTable[3]);
	var but4 = new dijit.form.Button({label:"delete",iconClass:"delIcon"},openContainerTable[4]);//,onClick:"removeprodCust2prods("+mainID+")"
	var but5 = new dijit.form.Button({label:"save",iconClass:"saveIcon",id:"but3prodCust2prods"+mainID },openContainerTable[5]);//,onclick:but3prodCust2prods(mainID)
		dojo.connect(but3, "onClick", function(e){  addRowprodCust2prods(""+mainID); });
		dojo.connect(but4, "onClick", function(e){  removeprodCust2prods(""+mainID); });
		dojo.connect(but5, "onClick", function(e){  call_funUpdprodCust2prods(""+mainID); });
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

																							//??????¡À¨ª???¨ª????????
						//??????¡À¨ª???¨ª????????
						var buildLayoutprodCust2prods = function(floatMainID){		
	var layoutprodCust2prods=[{
           //?¨´??field???????????????????¨°????js????toArray¡Á??????¡§??????querydate????????
   
			 cells: [ [
					   { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
					   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
      					  {name: i18nStr.prodName, field: 2,width: 10 , editor: mydojo.ValidationTextBox ,required:true ,maxLength:30}
					            					,   {name: i18nStr.code, field: 3,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					                 ,  {name: i18nStr.price,field:4, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
		    		,   {name: i18nStr.datef,field:5, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
				,   {name: i18nStr.datefTime,field:6, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
		        					,   {name: i18nStr.prodType, field: 7,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					      
//??????¡À¨ª???¨ª????????
												//,   {name: i18nStr.prodCust,field: 8,get:function(inRowIndex){ var str='';var strid;if(querydataprodCust2prods[inRowIndex]!=undefined && querydataprodCust2prods[inRowIndex][8]!=undefined && querydataprodCust2prods[inRowIndex][8][2]!=undefined){str=querydataprodCust2prods[inRowIndex][8][2];strid=querydataprodCust2prods[inRowIndex][8][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" class="imgSelectStyle" onclick="selectCustomer('+strid+','+inRowIndex+',8,0,event);"   >';} ,width: 10 }
						//??????¡À¨ª???¨ª????????
												,   {name: i18nStr.principal,field: 9,get:function(inRowIndex){ var str='';var strid;if(prodCust2prodsFloatArray[floatMainID].querydataprodCust2prods[inRowIndex]!=undefined && prodCust2prodsFloatArray[floatMainID].querydataprodCust2prods[inRowIndex][9]!=undefined && prodCust2prodsFloatArray[floatMainID].querydataprodCust2prods[inRowIndex][9][2]!=undefined){str=prodCust2prodsFloatArray[floatMainID].querydataprodCust2prods[inRowIndex][9][2];strid=prodCust2prodsFloatArray[floatMainID].querydataprodCust2prods[inRowIndex][9][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" class="imgSelectStyle" onclick="dojoProd.selectPeoples('+strid+','+inRowIndex+',9,0,event,'+floatMainID+');"   >';} ,width: 10 }
						                                        ] ]
                           }]; 
return layoutprodCust2prods;
}
var addRowprodCust2prods = function(id){

	var addrow=[];
														addrow.push('');
																					addrow.push('');
																					addrow.push('');
																					addrow.push('');
					addrow.push('');
																					addrow.push('');
																							//{ass.otherEnd.name}=prodCust
					addrow.push([false,id]);
																					addrow.push([]);
											addrow.splice(0,0,false,0);
	dijit.byId("gridprodCust2prods"+id).addRow(addrow,prodCust2prodsFloatArray[id].gridprodCust2prods.model.getRowCount());
} 

function removeprodCust2prods(id){
       var s= new Array();
       var sall=prodCust2prodsFloatArray[id].gridprodCust2prods.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
          s.push(i);
          var thisCell=sall[i];
          if(thisCell[1]!=0){//the row which will be deleted
            prodCust2prodsFloatArray[id].deletedataprodCust2prods.splice(prodCust2prodsFloatArray[id].deletedataprodCust2prods.length,0,thisCell[1]);
       }}}
       prodCust2prodsFloatArray[id].gridprodCust2prods.model.remove(s);//grid.removeSelectedRows();
 }
function call_funUpdprodCust2prods(id) {
       var sall=prodCust2prodsFloatArray[id].gridprodCust2prods.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
         var passAll=0;
         var thisCell=sall[i];
         var padd = new SOAPClientParameters2();
         var vobject=new Object();
         vobject.id=thisCell[1];
              if(dojox.validate.isText(thisCell[2], {minlength: 1})){vobject.prodName=thisCell[2];
             }else{prodCust2prodsFloatArray[id].gridprodCust2prods.getCell(prodCust2prodsFloatArray[id].gridprodCust2prods.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;}//not null
 
               vobject.code=thisCell[3];
 
             if(dojox.validate.isInRange(thisCell[4],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[4];vobject.price=n;
             }else{prodCust2prodsFloatArray[id].gridprodCust2prods.getCell(prodCust2prodsFloatArray[id].gridprodCust2prods.model.fieldArray[4]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

var  d=new DateTimeQuery();
             if(thisCell[5] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[5], prodCust2prodsFloatArray[id].gridprodCust2prods.getCell(prodCust2prodsFloatArray[id].gridprodCust2prods.model.fieldArray[5]).constraint);
             }else{prodCust2prodsFloatArray[id].gridprodCust2prods.getCell(prodCust2prodsFloatArray[id].gridprodCust2prods.model.fieldArray[5]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[6] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[6], prodCust2prodsFloatArray[id].gridprodCust2prods.getCell(prodCust2prodsFloatArray[id].gridprodCust2prods.model.fieldArray[6]).constraint);
             vobject.datef=d;
             }else{prodCust2prodsFloatArray[id].gridprodCust2prods.getCell(prodCust2prodsFloatArray[id].gridprodCust2prods.model.fieldArray[6]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null
 

               vobject.prodType=thisCell[7];
 

								var manageable=new Object();
			 if(prodCust2prodsFloatArray[id].querydataprodCust2prods[i][8]!=''&&prodCust2prodsFloatArray[id].querydataprodCust2prods[i][8]!=undefined){
             manageable.id=prodCust2prodsFloatArray[id].querydataprodCust2prods[i][8][1];
             vobject.prodCust=manageable;
			 }else{
			 prodCust2prodsFloatArray[id].gridprodCust2prods.getCell(prodCust2prodsFloatArray[id].gridprodCust2prods.model.fieldArray[8]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
														var manageable=new Object();
			 if(prodCust2prodsFloatArray[id].querydataprodCust2prods[i][9]!=''&&prodCust2prodsFloatArray[id].querydataprodCust2prods[i][9]!=undefined){
             manageable.id=prodCust2prodsFloatArray[id].querydataprodCust2prods[i][9][1];
             vobject.principal=manageable;
			 }else{
			 prodCust2prodsFloatArray[id].gridprodCust2prods.getCell(prodCust2prodsFloatArray[id].gridprodCust2prods.model.fieldArray[9]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
						


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('ProdVO',vobject);
                SOAPClient.invoke(urlprodCust2prods, "createProd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                prodCust2prodsFloatArray[id].gridprodCust2prods.model.setDatum(ul,i,1);
				});
	         }else{//modify row
                padd.add('ProdVO',vobject);
                SOAPClient.invoke(urlprodCust2prods, "updateProd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
        } }}//for
//submit delete
          for(var i=0;i<prodCust2prodsFloatArray[id].deletedataprodCust2prods.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',prodCust2prodsFloatArray[id].deletedataprodCust2prods[i]);
               SOAPClient.invoke(urlprodCust2prods, "deleteProd", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
	           });
          }
          prodCust2prodsFloatArray[id].deletedataprodCust2prods=new Array();
          //dojo.byId("rowCount").innerHTML = 'saved'; 
//submit delete end          
 } 
 
	function selectCustomerFun(rep){
		prodCust2prodsFloatArray[dojoProd.mainRowIndexCustomer].querydataprodCust2prods[dojoProd.selectCustomerInRow][dojoProd.noCustomer]=rep;
		prodCust2prodsFloatArray[dojoProd.mainRowIndexCustomer].gridprodCust2prods.updateRow(dojoProd.selectCustomerInRow);	
			
	}
	function selectPeoplesFun(rep){
		prodCust2prodsFloatArray[dojoProd.mainRowIndexPeoples].querydataprodCust2prods[dojoProd.selectPeoplesInRow][dojoProd.noPeoples]=rep;
		prodCust2prodsFloatArray[dojoProd.mainRowIndexPeoples].gridprodCust2prods.updateRow(dojoProd.selectPeoplesInRow);	
			
	}

function pageSizeChangeprodCust2prods(mylabel){
	prodCust2prodsFloatArray[id].pagesizeprodCust2prods=mylabel;
	getVOprodCust2prods(prodCust2prodsFloatArray[id].queryvoprodCust2prods,mainID);
}

function allpageprodCust2prods(id){
	prodCust2prodsFloatArray[id].pagesizeprodCust2prods=0;
	getVOprodCust2prods(prodCust2prodsFloatArray[id].queryvoprodCust2prods,mainID);
}

function upPageprodCust2prods(id){
	pagenumberprodCust2prods--;
	getVOprodCust2prods(prodCust2prodsFloatArray[id].queryvoprodCust2prods,mainID);
}
function downPageprodCust2prods(id){
	pagenumberprodCust2prods++;
	getVOprodCust2prods(prodCust2prodsFloatArray[id].queryvoprodCust2prods,mainID);
}


	  