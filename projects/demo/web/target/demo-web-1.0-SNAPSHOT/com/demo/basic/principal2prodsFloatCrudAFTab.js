	  	  //---begin---------ÅÐ¶ÏÊÇ·ñÎª¶à¶Ô¶àµÄ¹ØÏµ±í
											//---begin---------ÅÐ¶ÏÊÇ·ñÖ±½Ó¹ØÁªÁËtree½á¹¹±ísno
						//ÒÔÏÂÊÇÆÕÍ¨±í
//set (= principal2prods)
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
  var gridprincipal2prods;
  var urle2 = getUrl()+ "services/BasicManageService";   */
  
 
  
var getVOprincipal2prods=function(queryvo,id){

	var pu = new SOAPClientParameters2();
	pu.add('ProdVO',queryvo) ;
	pu.add('pageNumber',principal2prodsFloatArray[id].pagenumberprincipal2prods) ;
	pu.add('pageSize',principal2prodsFloatArray[id].pagesizeprincipal2prods) ;
	pu.add('orderBy',principal2prodsFloatArray[id].orderByprincipal2prods) ;
	SOAPClient.invoke(urlprincipal2prods,"getProd", pu, false,  function GetEnu_callBack(ul, soapResponse){      
	//ÅÐ¶Ï±¾±íÊÇ·ñÎª×Ó±í,µ±Ò»¸ö±íÊÇ¶à¸ö±íµÄ×Ó±íÊ±£¬´Ë´¦¿ÉÄÜÓÐ´íÎó¡£	
	principal2prodsFloatArray[id].querydataprincipal2prods=dojoProd.ProdVOtoArray_fun(ul,true);
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
	if( mainID!=undefined && mainID!=''){//NUprincipal2prods &&
	    var openFloat=dijit.byId("openFloat_"+mainID);
		var openGrid=dijit.byId("gridprincipal2prods"+mainID);
		if(openGrid==undefined){
		openFloat.setContent("<table style=\"width:80%; position:absolute;top:0px;\"><tr height=\"25px\" width=\"100%\"><td align=\"left\" style=\"background:transparent\"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   principal2prods List&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td><td align=\"right\" ><span ></span>&nbsp;&nbsp;<div ></div><div > </div><div ></div><div ></div><div ></div></td></tr></table><div style=\"{width:999px;height:500px; position:absolute;top:30px;}\" ><div ></div></div>");

	  	principal2prodsFloatArray[mainID] = new principal2prodsFloatPara(mainID);
		var openContainerTable=openFloat.containerNode.children[0].children[0].children[0].children[1].childNodes;
		openContainerTable[0].innerHTML="<span id=\"rowCountprincipal2prods"+mainID+"\"></span>";
var but1 = new dijit.form.myButton({label:"pageup",id:"but6principal2prods"+mainID,disabled:"true",onclick:"upPageprincipal2prods("+mainID+");",iconClass:"upPageIcon"},openContainerTable[1]);
var but2= new dijit.form.myButton({label:"pagedown",id:"but7principal2prods"+mainID,disabled:"true",onclick:"downPageprincipal2prods("+mainID+");",iconClass:"downPageIcon"},openContainerTable[2]);
	var but3 = new dijit.form.Button({label:"add",iconClass:"addIcon"},openContainerTable[3]);
	var but4 = new dijit.form.Button({label:"delete",iconClass:"delIcon"},openContainerTable[4]);//,onClick:"removeprincipal2prods("+mainID+")"
	var but5 = new dijit.form.Button({label:"save",iconClass:"saveIcon",id:"but3principal2prods"+mainID },openContainerTable[5]);//,onclick:but3principal2prods(mainID)
		dojo.connect(but3, "onClick", function(e){  addRowprincipal2prods(""+mainID); });
		dojo.connect(but4, "onClick", function(e){  removeprincipal2prods(""+mainID); });
		dojo.connect(but5, "onClick", function(e){  call_funUpdprincipal2prods(""+mainID); });
		var openContainerGrid=openFloat.containerNode.children[1].children[0];
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
				
		}else{
			principal2prodsFloatArray[mainID].gridprincipal2prods.updateRowCount(principal2prodsFloatArray[mainID].querydataprincipal2prods.length); 
		}}
}

																							//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
						//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
						var buildLayoutprincipal2prods = function(floatMainID){		
	var layoutprincipal2prods=[{
           //¸ù¾ÝfieldµÄÖµ£¬ÒÀ¾ÝÄ¬ÈÏµÄË³Ðò£¬´ÓjsÖÐµÄtoArray×ª»»·½·¨·µ»ØµÄquerydateÖÐÈ¡Êý¾Ý
   
			 cells: [ [
					   { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
					   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
      					  {name: i18nStr.prodName, field: 2,width: 10 , editor: mydojo.ValidationTextBox ,required:true ,maxLength:30}
					            					,   {name: i18nStr.code, field: 3,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					                 ,  {name: i18nStr.price,field:4, width: 8,editor: dojox.grid.editors.Dijit, editorClass: "mydojo.NumberTextBox", constraint: {min:0,max:9999999,places:4 } }
		    		,   {name: i18nStr.datef,field:5, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
				,   {name: i18nStr.datefTime,field:6, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
		        					,   {name: i18nStr.prodType, field: 7,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
					      
//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
												,   {name: i18nStr.prodCust,field: 8,get:function(inRowIndex){ var str='';var strid;if(principal2prodsFloatArray[floatMainID].querydataprincipal2prods[inRowIndex]!=undefined && principal2prodsFloatArray[floatMainID].querydataprincipal2prods[inRowIndex][8]!=undefined && principal2prodsFloatArray[floatMainID].querydataprincipal2prods[inRowIndex][8][2]!=undefined){str=principal2prodsFloatArray[floatMainID].querydataprincipal2prods[inRowIndex][8][2];strid=principal2prodsFloatArray[floatMainID].querydataprincipal2prods[inRowIndex][8][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" class="imgSelectStyle" onclick="dojoProd.selectCustomer('+strid+','+inRowIndex+',8,0,event,'+floatMainID+');"   >';} ,width: 10 }
						//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
												//,   {name: i18nStr.principal,field: 9,get:function(inRowIndex){ var str='';var strid;if(querydataprincipal2prods[inRowIndex]!=undefined && querydataprincipal2prods[inRowIndex][9]!=undefined && querydataprincipal2prods[inRowIndex][9][2]!=undefined){str=querydataprincipal2prods[inRowIndex][9][2];strid=querydataprincipal2prods[inRowIndex][9][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" class="imgSelectStyle" onclick="selectPeoples('+strid+','+inRowIndex+',9,0,event);"   >';} ,width: 10 }
						                                        ] ]
                           }]; 
return layoutprincipal2prods;
}
var addRowprincipal2prods = function(id){

	var addrow=[];
														addrow.push('');
																					addrow.push('');
																					addrow.push('');
																					addrow.push('');
					addrow.push('');
																					addrow.push('');
																												addrow.push([]);
																//{ass.otherEnd.name}=principal
					addrow.push([false,id]);
											addrow.splice(0,0,false,0);
	dijit.byId("gridprincipal2prods"+id).addRow(addrow,principal2prodsFloatArray[id].gridprincipal2prods.model.getRowCount());
} 

function removeprincipal2prods(id){
       var s= new Array();
       var sall=principal2prodsFloatArray[id].gridprincipal2prods.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
          s.push(i);
          var thisCell=sall[i];
          if(thisCell[1]!=0){//the row which will be deleted
            principal2prodsFloatArray[id].deletedataprincipal2prods.splice(principal2prodsFloatArray[id].deletedataprincipal2prods.length,0,thisCell[1]);
       }}}
       principal2prodsFloatArray[id].gridprincipal2prods.model.remove(s);//grid.removeSelectedRows();
 }
function call_funUpdprincipal2prods(id) {
       var sall=principal2prodsFloatArray[id].gridprincipal2prods.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
         var passAll=0;
         var thisCell=sall[i];
         var padd = new SOAPClientParameters2();
         var vobject=new Object();
         vobject.id=thisCell[1];
              if(dojox.validate.isText(thisCell[2], {minlength: 1})){vobject.prodName=thisCell[2];
             }else{principal2prodsFloatArray[id].gridprincipal2prods.getCell(principal2prodsFloatArray[id].gridprincipal2prods.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;}//not null
 
               vobject.code=thisCell[3];
 
             if(dojox.validate.isInRange(thisCell[4],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[4];vobject.price=n;
             }else{principal2prodsFloatArray[id].gridprincipal2prods.getCell(principal2prodsFloatArray[id].gridprincipal2prods.model.fieldArray[4]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

var  d=new DateTimeQuery();
             if(thisCell[5] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[5], principal2prodsFloatArray[id].gridprincipal2prods.getCell(principal2prodsFloatArray[id].gridprincipal2prods.model.fieldArray[5]).constraint);
             }else{principal2prodsFloatArray[id].gridprincipal2prods.getCell(principal2prodsFloatArray[id].gridprincipal2prods.model.fieldArray[5]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[6] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[6], principal2prodsFloatArray[id].gridprincipal2prods.getCell(principal2prodsFloatArray[id].gridprincipal2prods.model.fieldArray[6]).constraint);
             vobject.datef=d;
             }else{principal2prodsFloatArray[id].gridprincipal2prods.getCell(principal2prodsFloatArray[id].gridprincipal2prods.model.fieldArray[6]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null
 

               vobject.prodType=thisCell[7];
 

								var manageable=new Object();
			 if(principal2prodsFloatArray[id].querydataprincipal2prods[i][8]!=''&&principal2prodsFloatArray[id].querydataprincipal2prods[i][8]!=undefined){
             manageable.id=principal2prodsFloatArray[id].querydataprincipal2prods[i][8][1];
             vobject.prodCust=manageable;
			 }else{
			 principal2prodsFloatArray[id].gridprincipal2prods.getCell(principal2prodsFloatArray[id].gridprincipal2prods.model.fieldArray[8]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
														var manageable=new Object();
			 if(principal2prodsFloatArray[id].querydataprincipal2prods[i][9]!=''&&principal2prodsFloatArray[id].querydataprincipal2prods[i][9]!=undefined){
             manageable.id=principal2prodsFloatArray[id].querydataprincipal2prods[i][9][1];
             vobject.principal=manageable;
			 }else{
			 principal2prodsFloatArray[id].gridprincipal2prods.getCell(principal2prodsFloatArray[id].gridprincipal2prods.model.fieldArray[9]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
						


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('ProdVO',vobject);
                SOAPClient.invoke(urlprincipal2prods, "createProd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                principal2prodsFloatArray[id].gridprincipal2prods.model.setDatum(ul,i,1);
				});
	         }else{//modify row
                padd.add('ProdVO',vobject);
                SOAPClient.invoke(urlprincipal2prods, "updateProd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
        } }}//for
//submit delete
          for(var i=0;i<principal2prodsFloatArray[id].deletedataprincipal2prods.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',principal2prodsFloatArray[id].deletedataprincipal2prods[i]);
               SOAPClient.invoke(urlprincipal2prods, "deleteProd", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
	           });
          }
          principal2prodsFloatArray[id].deletedataprincipal2prods=new Array();
          //dojo.byId("rowCount").innerHTML = 'saved'; 
//submit delete end          
 } 
 
	function selectCustomerFun(rep){
		principal2prodsFloatArray[dojoProd.mainRowIndexCustomer].querydataprincipal2prods[dojoProd.selectCustomerInRow][dojoProd.noCustomer]=rep;
		principal2prodsFloatArray[dojoProd.mainRowIndexCustomer].gridprincipal2prods.updateRow(dojoProd.selectCustomerInRow);	
			
	}
	function selectPeoplesFun(rep){
		principal2prodsFloatArray[dojoProd.mainRowIndexPeoples].querydataprincipal2prods[dojoProd.selectPeoplesInRow][dojoProd.noPeoples]=rep;
		principal2prodsFloatArray[dojoProd.mainRowIndexPeoples].gridprincipal2prods.updateRow(dojoProd.selectPeoplesInRow);	
			
	}

function pageSizeChangeprincipal2prods(mylabel){
	principal2prodsFloatArray[id].pagesizeprincipal2prods=mylabel;
	getVOprincipal2prods(principal2prodsFloatArray[id].queryvoprincipal2prods,mainID);
}

function allpageprincipal2prods(id){
	principal2prodsFloatArray[id].pagesizeprincipal2prods=0;
	getVOprincipal2prods(principal2prodsFloatArray[id].queryvoprincipal2prods,mainID);
}

function upPageprincipal2prods(id){
	pagenumberprincipal2prods--;
	getVOprincipal2prods(principal2prodsFloatArray[id].queryvoprincipal2prods,mainID);
}
function downPageprincipal2prods(id){
	pagenumberprincipal2prods++;
	getVOprincipal2prods(principal2prodsFloatArray[id].queryvoprincipal2prods,mainID);
}


