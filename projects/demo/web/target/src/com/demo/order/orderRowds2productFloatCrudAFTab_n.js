	  	  //---begin---------ÅÐ¶ÏÊÇ·ñÎª¶à¶Ô¶àµÄ¹ØÏµ±í
																					//---begin---------ÅÐ¶ÏÊÇ·ñÖ±½Ó¹ØÁªÁËtree½á¹¹±ísno
											//ÒÔÏÂÊÇÆÕÍ¨±í
//set (= orderRowds2product)
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
  var gridorderRowds2product;
  var urle2 = getUrl()+ "services/BasicManageService";   */
  
 
  
var getVOorderRowds2product=function(queryvo,id){

	var pu = new SOAPClientParameters2();
	pu.add('OrderRowdVO',queryvo) ;
	pu.add('pageNumber',orderRowds2productFloatArray[id].pagenumberorderRowds2product) ;
	pu.add('pageSize',orderRowds2productFloatArray[id].pagesizeorderRowds2product) ;
	pu.add('orderBy',orderRowds2productFloatArray[id].orderByorderRowds2product) ;
	SOAPClient.invoke(urlorderRowds2product,"getOrderRowd", pu, false,  function GetEnu_callBack(ul, soapResponse){      
	//ÅÐ¶Ï±¾±íÊÇ·ñÎª×Ó±í,µ±Ò»¸ö±íÊÇ¶à¸ö±íµÄ×Ó±íÊ±£¬´Ë´¦¿ÉÄÜÓÐ´íÎó¡£	
					     //Orderd-----Prod
			orderRowds2productFloatArray[id].querydataorderRowds2product=dojoOrderRowd.OrderRowdVOtoArray_fun(ul,true);
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
	if( mainID!=undefined && mainID!=''){//NUorderRowds2product &&
	    var openFloat=dijit.byId("gridorderRowds2product"+mainID);
		if(openFloat==undefined){
			orderRowds2productFloatArray[mainID] = new orderRowds2productFloatPara(mainID);
			var newTab = dijit.byId("orderRowds2product"+mainID);
			newTab.setContent("<table   style=\"width:80%; position:absolute;top:0px;\"><tr height=\"25px\" width=\"100%\">	<td align=\"left\" style=\"background:transparent\"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   orderRowds2product List&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td><td align=\"right\" ><span ></span>&nbsp;&nbsp;	<div > </div><div > </div><div > </div>	<div > </div><div > </div>	</td></tr></table><div style=\"{width:500px;height:500px; position:absolute;top:30px;}\" ><div > </div></div>");
			var openContainerTable=newTab.containerNode.children[0].children[0].children[0].children[1].childNodes;
	
		openContainerTable[0].innerHTML="<span id=\"rowCountorderRowds2product"+mainID+"\"></span>";
var but1 = new dijit.form.myButton({label:"pageup",id:"but6orderRowds2product"+mainID,disabled:"true",onclick:"upPageorderRowds2product("+mainID+");",iconClass:"upPageIcon"},openContainerTable[1]);
var but2= new dijit.form.myButton({label:"pagedown",id:"but7orderRowds2product"+mainID,disabled:"true",onclick:"downPageorderRowds2product("+mainID+");",iconClass:"downPageIcon"},openContainerTable[2]);
	var but3 = new dijit.form.Button({label:"add",iconClass:"addIcon"},openContainerTable[3]);
	var but4 = new dijit.form.Button({label:"delete",iconClass:"delIcon"},openContainerTable[4]);       //,onClick:"removeorderRowds2product("+mainID+")"
	var but5 = new dijit.form.Button({label:"save",iconClass:"saveIcon",id:"but3orderRowds2product"+mainID },openContainerTable[5]);//,onclick:but3orderRowds2product(mainID)
		dojo.connect(but3, "onClick", function(e){  addRoworderRowds2product(""+mainID); });
		dojo.connect(but4, "onClick", function(e){  removeorderRowds2product(""+mainID); });
		dojo.connect(but5, "onClick", function(e){  call_funUpdorderRowds2product(""+mainID); });
		var openContainerGrid=newTab.domNode.children[1].children[0];
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
				orderRowds2productFloatArray[mainID].gridorderRowds2product.resize({w:999,h:500});
		}else{
			getVOorderRowds2product(orderRowds2productFloatArray[mainID].queryvoorderRowds2product,mainID);
			orderRowds2productFloatArray[mainID].gridorderRowds2product.modelAllChange();

		}}
}

																																									//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
																				var dojoOrderdSelect;
						//¶ÔÓÚµ¥±í²»ÐíÆäËûÅÐ¶Ï
											
var buildLayoutorderRowds2product = function(floatMainID){		
	var layoutorderRowds2product=[{
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
																	//,   {name: i18nStr.product,field: 13,get:function(inRowIndex){ var str='';var strid;if(querydataorderRowds2product[inRowIndex]!=undefined && querydataorderRowds2product[inRowIndex][13]!=undefined && querydataorderRowds2product[inRowIndex][13][2]!=undefined){str=querydataorderRowds2product[inRowIndex][13][2];strid=querydataorderRowds2product[inRowIndex][13][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" class="imgSelectStyle" onclick="selectProd('+strid+','+inRowIndex+',13,0,event);"   >';} ,width: 10 }
						                                        ] ]
                           }]; 
return layoutorderRowds2product;
}

var addRoworderRowds2product = function(id){

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
																												addrow.push([]);
																//{ass.otherEnd.name}=product
					addrow.push([false,id]);
											addrow.splice(0,0,false,0);
	dijit.byId("gridorderRowds2product"+id).addRow(addrow,orderRowds2productFloatArray[id].gridorderRowds2product.model.getRowCount());
} 

function removeorderRowds2product(id){
       var s= new Array();
       var sall=orderRowds2productFloatArray[id].gridorderRowds2product.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
          s.push(i);
          var thisCell=sall[i];
          if(thisCell[1]!=0){//the row which will be deleted
            orderRowds2productFloatArray[id].deletedataorderRowds2product.splice(orderRowds2productFloatArray[id].deletedataorderRowds2product.length,0,thisCell[1]);
       }}}
       orderRowds2productFloatArray[id].gridorderRowds2product.model.remove(s);//grid.removeSelectedRows();
 }
function call_funUpdorderRowds2product(id) {
       var sall=orderRowds2productFloatArray[id].gridorderRowds2product.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
         var passAll=0;
         var thisCell=sall[i];
         var padd = new SOAPClientParameters2();
         var vobject=new Object();
         vobject.id=thisCell[1];
             if(dojox.validate.isInRange(thisCell[2],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[2];vobject.productNum=n;
             }else{orderRowds2productFloatArray[id].gridorderRowds2product.getCell(orderRowds2productFloatArray[id].gridorderRowds2product.model.fieldArray[2]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[3],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[3];vobject.unitNum=n;
             }else{orderRowds2productFloatArray[id].gridorderRowds2product.getCell(orderRowds2productFloatArray[id].gridorderRowds2product.model.fieldArray[3]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[4],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[4];vobject.goodsSuttle=n;
             }else{orderRowds2productFloatArray[id].gridorderRowds2product.getCell(orderRowds2productFloatArray[id].gridorderRowds2product.model.fieldArray[4]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[5],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[5];vobject.goodsWeight=n;
             }else{orderRowds2productFloatArray[id].gridorderRowds2product.getCell(orderRowds2productFloatArray[id].gridorderRowds2product.model.fieldArray[5]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

             if(dojox.validate.isInRange(thisCell[6],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[6];vobject.goodsVolume=n;
             }else{orderRowds2productFloatArray[id].gridorderRowds2product.getCell(orderRowds2productFloatArray[id].gridorderRowds2product.model.fieldArray[6]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

               vobject.label=thisCell[7];
 
             if(dojox.validate.isInRange(thisCell[8],{max:9999999, min:0})){
              var  n=new NumberQuery(); n.upNumber=thisCell[8];vobject.carriage=n;
             }else{orderRowds2productFloatArray[id].gridorderRowds2product.getCell(orderRowds2productFloatArray[id].gridorderRowds2product.model.fieldArray[8]).getNode(i).innerHTML="<span style={color:red;line-height:16px}> not be double</span>";passAll=1;}//double

               vobject.especial=thisCell[9];
 
               vobject.goodsState=thisCell[10];
 
               vobject.remark=thisCell[11];
 

																var manageable=new Object();
			 manageable.id=mainID;
             vobject.order=manageable;
			 																var manageable=new Object();
			 if(orderRowds2productFloatArray[id].querydataorderRowds2product[i][13]!=''&&orderRowds2productFloatArray[id].querydataorderRowds2product[i][13]!=undefined){
             manageable.id=orderRowds2productFloatArray[id].querydataorderRowds2product[i][13][1];
             vobject.product=manageable;
			 }else{
			 orderRowds2productFloatArray[id].gridorderRowds2product.getCell(orderRowds2productFloatArray[id].gridorderRowds2product.model.fieldArray[13]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
						


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('OrderRowdVO',vobject);
                SOAPClient.invoke(urlorderRowds2product, "createOrderRowd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                orderRowds2productFloatArray[id].gridorderRowds2product.model.setDatum(ul,i,1);
				});
	         }else{//modify row
                padd.add('OrderRowdVO',vobject);
                SOAPClient.invoke(urlorderRowds2product, "updateOrderRowd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
        } }}//for
//submit delete
          for(var i=0;i<orderRowds2productFloatArray[id].deletedataorderRowds2product.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',orderRowds2productFloatArray[id].deletedataorderRowds2product[i]);
               SOAPClient.invoke(urlorderRowds2product, "deleteOrderRowd", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
	           });
          }
          orderRowds2productFloatArray[id].deletedataorderRowds2product=new Array();
          //dojo.byId("rowCount").innerHTML = 'saved'; 
//submit delete end          
 } 
 
		function selectOrderdFun(rep){
						orderRowds2productFloatArray[dojoOrderd.mainRowIndexOrderd].querydataorderRowds2product[dojoOrderd.selectOrderdInRow][dojoOrderd.noOrderd]=rep;
		orderRowds2productFloatArray[dojoOrderd.mainRowIndexOrderd].gridorderRowds2product.updateRow(dojoOrderd.selectOrderdInRow);	
		
			
	}
		function selectProdFun(rep){
						orderRowds2productFloatArray[dojoOrderd.mainRowIndexProd].querydataorderRowds2product[dojoOrderd.selectProdInRow][dojoOrderd.noProd]=rep;
		orderRowds2productFloatArray[dojoOrderd.mainRowIndexProd].gridorderRowds2product.updateRow(dojoOrderd.selectProdInRow);	
		
			
	}

function pageSizeChangeorderRowds2product(mylabel){
	orderRowds2productFloatArray[id].pagesizeorderRowds2product=mylabel;
	getVOorderRowds2product(orderRowds2productFloatArray[id].queryvoorderRowds2product,mainID);
}

function allpageorderRowds2product(id){
	orderRowds2productFloatArray[id].pagesizeorderRowds2product=0;
	getVOorderRowds2product(orderRowds2productFloatArray[id].queryvoorderRowds2product,mainID);
}

function upPageorderRowds2product(id){
	pagenumberorderRowds2product--;
	getVOorderRowds2product(orderRowds2productFloatArray[id].queryvoorderRowds2product,mainID);
}
function downPageorderRowds2product(id){
	pagenumberorderRowds2product++;
	getVOorderRowds2product(orderRowds2productFloatArray[id].queryvoorderRowds2product,mainID);
}


