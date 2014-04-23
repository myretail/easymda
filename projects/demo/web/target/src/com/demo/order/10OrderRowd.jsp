<%
String peopleId = request.getParameter("peopleId");
%>
<html>
<!--Ò»Ô¶à£¬Ö»Ò»Ò»Ó±í£¬Ã»Ð¿Ò»Ô¶Ó±var dataChild=querydataOrderRowd[inRowIndex]-->
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
     <style type="text/css">
            @import "../dojo/dojo-release-1.0.0/dijit/themes/tundra/tundra.css";
            @import "../dojo/dojo-release-1.0.0/dojo/resources/dojo.css";
            @import "../dojo/dojo-release-1.0.0/dojox/grid/_grid/tundraGrid.css";
            @import "../dojo/dojo-release-1.0.0/dojox/grid/_grid/Grid.css";
            @import "../js/dijitTests.css";
            @import "../js/wlProject.css";
			@import "../dojo/dojo-release-1.0.0/dojox/layout/resources/FloatingPane.css"; 
		    @import "../dojo/dojo-release-1.0.0/dojox/layout/resources/ResizeHandle.css"; 
      </style>
      <script type="text/javascript" src="../dojo/dojo-release-1.0.0/dojo/dojo.js"  
                djConfig="parseOnLoad: true, isDebug: true,locale: 'zh-cn', extraLocale: ['zh-TW', 'fr']"></script>
      <script>
    
            dojo.require("dojo.data.ItemFileWriteStore");
            dojo.require("dojo.parser");
            dojo.require("dijit.form.Button");
            dojo.require("dijit.Menu");
			dojo.require("dijit.Tree");
            dojo.require("dojox.grid.Grid");
            dojo.require("dojox.validate._base");
            dojo.require("dojox.grid._data.model");
            dojo.require("dijit.form.ValidationTextBox");
            dojo.require("dijit.form.TextBox");
            dojo.require("dijit.form.FilteringSelect");
            dojo.require("dijit.form.ComboBox");
            dojo.require("dijit.form.Textarea");
            dojo.require("dojox.grid._data.dijitEditors");
            dojo.require("dojox.layout.FloatingPane");
			dojo.require("dijit.Dialog");
            dojo.registerModulePath("mydojo", "../../../js/mydojo");
            dojo.require("mydojo.FilteringSelect");
            dojo.require("mydojo.ValidationTextBox");
            dojo.require("mydojo.NumberTextBox");
			dojo.registerModulePath("projectDojo", "../../../dojo/projectDojo");
			dojo.require("projectDojo.OrderRowd");
     </script>
        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 	<script type="text/javascript" >
		var dojoOrderRowd= new  projectDojo.OrderRowd();
	    dojoOrderRowd.initOrderRowd();
			//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
																	 var dojoOrderRowTask= new  projectDojo.OrderRowTask();
			dojoOrderRowTask.initOrderRowTask();
				//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
																	 var dojoPayment= new  projectDojo.Payment();
			dojoPayment.initPayment();
			</script>

	 	 							 
	<script type="text/javascript" >
	  var urlOrderRowd = getUrl()+ "services/OrderRowdManageService";
	  var deletedataOrderRowd =  new Array();
	  var querydataOrderRowd =  new Array();
	  var pagenumberOrderRowd=1;
	  var totalCountOrderRowd=0;
	  var pagesizeOrderRowd=10;
	  var orderByOrderRowd='0';
	  var queryvoOrderRowd=new Object();
	  var oddstyle='';
	  var modelOrderRowd = new dojox.grid.data.Table(null, querydataOrderRowd);
	  var urle = getUrl()+ "services/BasicManageService";
	  var modelOrderRowdDetail;
	  var modelOrderRowdChild;
	  
	function orderSet(id,value){
        	/*var itemselect=orderStore._getItemByIdentity(value);
				if(itemselect!='undefined'&& itemselect!=null){
				}*/
	}
	function productSet(id,value){
        	/*var itemselect=productStore._getItemByIdentity(value);
				if(itemselect!='undefined'&& itemselect!=null){
				}*/
	}


																									 //rowint======12====  7


var mainLayout =[{//?????????colSpantoggle
					onBeforeRow: onBeforeRow,
					 cells: [
                      [
						{ name: i18nStr.detail, width: 3, get: getCheckOrderRowd, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
					  				  {name: i18nStr.productNum,field:2, width: 8}
						  								  				 ,  {name: i18nStr.unitNum,field:3, width: 8}
						  								  				 ,  {name: i18nStr.goodsSuttle,field:4, width: 8}
						  								  				 ,  {name: i18nStr.goodsWeight,field:5, width: 8}
						  								  				 ,  {name: i18nStr.goodsVolume,field:6, width: 8}
						  								  				,  {name: i18nStr.label, field: 7,width: 10}
						  								
//
	//
						],[
							{ name: '\u8be6\u7ec6', colSpan: 11,styles: 'padding: 0; margin: 0;', get: getDetailOrderRowd }//value: '<div style="height:0px; background-color: white;"></div>'
						  ]
				  ]
	  
				}];	 

var subInt=	$childRow;	
function buildMainDetailLayout(pre,mystyle){
var myLayout=[{noscroll: true,
					 cells: [
                      [
					  							  			  
							  							  			  
							  							  			  
							  							  			  
							  							  			  
							  							  			  
							  									  {name: pre+i18nStr.carriage,field:8, width: 8,headerStyles:mystyle}
					 							  			  
							  									
					,   {name: pre+i18nStr.especial, field: 9,width: 10,headerStyles:mystyle}
												  			  
							  									
					,   {name: pre+i18nStr.goodsState, field: 10,width: 10,headerStyles:mystyle}
												  			  
							  									
					,   {name: pre+i18nStr.remark, field: 11,width: 10,headerStyles:mystyle}
												  			  
				
//

									,   {name: i18nStr.order,field: 12,get:function(inRowIndex){ var str='';if(querydataOrderRowd[inRowIndex]!=undefined && querydataOrderRowd[inRowIndex][12]!=undefined){str=querydataOrderRowd[inRowIndex][12][2];} return str;} ,width: 10,headerStyles:mystyle }
									//

									,   {name: i18nStr.product,field: 13,get:function(inRowIndex){ var str='';if(querydataOrderRowd[inRowIndex]!=undefined && querydataOrderRowd[inRowIndex][13]!=undefined){str=querydataOrderRowd[inRowIndex][13][2];} return str;} ,width: 10,headerStyles:mystyle }
														]]}];	 
	return  myLayout;
}

var mainDetailLayout;
var mainDetailLayoutOdd;
mainDetailLayout= buildMainDetailLayout(pre,headerstyle);
mainDetailLayoutOdd=buildMainDetailLayout(pre,headerstyleodd);

function getDetailOrderRowd(inRowIndex){
		var cell = this;
		setTimeout(function() { buildSubgridOrderRowd(inRowIndex, cell); }, 0);
		var h =0;
		if(detailRowsOrderRowd[inRowIndex]&&querydataOrderRowd[inRowIndex][$childRow].length>0){
							h=65+25*querydataOrderRowd[inRowIndex][$childRow].length;  		}
	return '<div style="height:45px; background-color: white;"></div><div style="height:'+h+'px; background-color: white;"></div>';
}

//end buildLayout

var detailRowsOrderRowd=[];

function onBeforeRow(inDataIndex, inRow) {	if (inRow[1]!=undefined)inRow[1].hidden = !detailRowsOrderRowd[inDataIndex];}	

function toggleOrderRowd(inIndex, inShow) {
        			if (!inShow) destroySubGridIdGeneral('',querydataOrderRowd[inIndex][1],"OrderRowdMainDetail");
					if (!inShow) destroySubGridIdGeneral('',querydataOrderRowd[inIndex][1],"OrderRowdChild");
				    detailRowsOrderRowd[inIndex] = inShow;
				    dijit.byId("gridOrderRowd").updateRow(inIndex); 
				    
    } 

function getCheckOrderRowd(inRowIndex) {
	var image = (detailRowsOrderRowd[inRowIndex] ? 'open.gif' : 'closed.gif');
	var show = (detailRowsOrderRowd[inRowIndex] ? 'false' : 'true');
	return '<img src="../image/' + image + '" onclick="toggleOrderRowd(' + inRowIndex + ', ' + show + ')" height="11" width="11">';
}





//function makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString) {return parentRowIndex+"_"+idString+"_" + inRowIndex;		}

//function destroySubGridIdGeneral(parentRowIndex,inRowIndex,idString) {	var subGrid = dijit.byId(makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString));	if (subGrid) subGrid.destroy();	}

	  
function buildSubgridOrderRowd(inRowIndex, inCell) {  //makeSubgridIdMainDetail(id)Ç¸idmainDetailGridid
	if(inCell!=undefined && inCell.getNode(inRowIndex)!=undefined){
		var mainDetail = inCell.getNode(inRowIndex).firstChild;
		var child = inCell.getNode(inRowIndex).lastChild;
		var idmainDetail = makeSubGridIdGeneral('',querydataOrderRowd[inRowIndex][1],"OrderRowdMainDetail");//makeSubgridIdMainDetail(querydataOrderRowd[inRowIndex][1]);//taskmakeSubgridId(taskRowSubdata[inRowIndex][1]);
		var idchild = makeSubGridIdGeneral('',querydataOrderRowd[inRowIndex][1],"OrderRowdChild");
		var subGridMainDetail = dijit.byId(idmainDetail);
		var subGridChild = dijit.byId(idchild);
		var dataChild=querydataOrderRowd[inRowIndex][$childRow];
		if(dataChild.length!=0){
			if (subGridChild){
				subGridChild.model.setData(dataChild);
				child.appendChild(subGridChild.domNode);
			}else{
				modelOrderRowdChild=new dojox.grid.data.Table(null, dataChild);
				var childProps= {
								autoHeight: true, 
								autoRender: false,
								rowCount:dataChild.length,
								model:modelOrderRowdChild,							};
				childProps.dataRow = inRowIndex;
				childProps.id = idchild;
				if(Math.ceil(inRowIndex/2)>inRowIndex/2){
					childProps.structure=childLayoutOdd;
				}else{
					childProps.structure=childLayout;
				}
				subGridChild = new dojox.Grid(childProps, child);//gridÎªÇ¶×±Ê±Ô¶DIVÄ´Ð¡
			}
			if (subGridChild) {
				subGridChild.render();
				subGridChild.cacheHeight = subGridChild.domNode.offsetHeight;
			}	      				
		}
		var detailDate=[];
		detailDate[0]=querydataOrderRowd[inRowIndex];  
	    modelOrderRowdDetail=new dojox.grid.data.Table(null, detailDate);
		if (subGridMainDetail) {
			subGridMainDetail.model.setData(detailDate);
			mainDetail.appendChild(subGridMainDetail.domNode);
		} else {
			var mainDetailProps = {
				rowCount: 1, 
				autoHeight: true, 
				autoRender: false,
				model:modelOrderRowdDetail
				};
				mainDetailProps.dataRow = inRowIndex;
				mainDetailProps.id = idmainDetail;//	tasksubGridProps.widgetId = id;
				if(Math.ceil(inRowIndex/2)>inRowIndex/2){
					mainDetailProps.structure=mainDetailLayoutOdd;
				}else{
					mainDetailProps.structure=mainDetailLayout;
				}
				subGridMainDetail = new dojox.Grid(mainDetailProps, mainDetail );
		}
			
		if (subGridMainDetail) {
				subGridMainDetail.render();
				subGridMainDetail.cacheHeight = subGridMainDetail.domNode.offsetHeight;
			}	
		inCell.grid.rowHeightChanged(inRowIndex);
    }   
}
//var childLayout=//???????????????????????????????/ Ö±É£jshtml

function querybuttonOrderRowd(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvo.id=0 ;
              queryvoOrderRowd=new Object();
              n=queryNumber_fun("OrderRowdproductNum");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvoOrderRowd.productNum=n;}  
              n=queryNumber_fun("OrderRowdunitNum");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvoOrderRowd.unitNum=n;}  
              n=queryNumber_fun("OrderRowdgoodsSuttle");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvoOrderRowd.goodsSuttle=n;}  
              n=queryNumber_fun("OrderRowdgoodsWeight");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvoOrderRowd.goodsWeight=n;}  
              n=queryNumber_fun("OrderRowdgoodsVolume");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvoOrderRowd.goodsVolume=n;}  
	          if(queryOrderRowdlabel.getDisplayedValue()!="")queryvoOrderRowd.label=queryOrderRowdlabel.getDisplayedValue();//
              n=queryNumber_fun("OrderRowdcarriage");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvoOrderRowd.carriage=n;}  
	          if(queryOrderRowdespecial.getDisplayedValue()!="")queryvoOrderRowd.especial=queryOrderRowdespecial.getDisplayedValue();//
	          if(queryOrderRowdgoodsState.getDisplayedValue()!="")queryvoOrderRowd.goodsState=queryOrderRowdgoodsState.getDisplayedValue();//
	          if(queryOrderRowdremark.getDisplayedValue()!="")queryvoOrderRowd.remark=queryOrderRowdremark.getDisplayedValue();//
			
	if(queryOrderRowdorder.getDisplayedValue()!=""){
				var orderQuery= new Object();
				//orderQuery.OrderRowdName=queryOrderRowdorder.getDisplayedValue();
				orderQuery.id=queryOrderRowdorder.getValue();
				queryvoOrderRowd.order=orderQuery;
			  }
	if(queryOrderRowdproduct.getDisplayedValue()!=""){
				var productQuery= new Object();
				//productQuery.OrderRowdName=queryOrderRowdproduct.getDisplayedValue();
				productQuery.id=queryOrderRowdproduct.getValue();
				queryvoOrderRowd.product=productQuery;
			  }

			if(validstate==0){
              pagenumberOrderRowd=1;
              getOrderRowdVO(queryvoOrderRowd); 
             }      
       }

function getOrderRowdVO(queryvo){
	var totalCount=0;
	deletedataOrderRowd =new Array();
      var pu = new SOAPClientParameters2();
      pu.add('OrderRowdVO',queryvo) ;
      pu.add('pageNumber',pagenumberOrderRowd) ;
	    pu.add('pageSize',pagesizeOrderRowd) ;
	    pu.add('orderBy',orderByOrderRowd) ;
      SOAPClient.invoke(urlOrderRowd,"getOrderRowd", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydataOrderRowd=new Array();
		   querydataOrderRowd=dojoOrderRowd.OrderRowdVOtoArray_fun(ul,false);
           totalCountOrderRowd=ul[ul.length-1]["ns:id"]; 
      }); 
      querydataOrderRowd.splice(querydataOrderRowd.length-1,1);
	  gridOrderRowd.selection.clear();
      modelOrderRowd.setData(querydataOrderRowd);
      //dijit.byId("grid").updateRowCount(querydataOrderRowd.length); 
	   var totalpage=Math.ceil(new Number(totalCountOrderRowd)/pagesizeOrderRowd);
	  
	if(totalpage>1){
		if(pagenumberOrderRowd==1){
			dijit.byId("but6OrderRowd").setDisabled(true);
			dijit.byId("but7OrderRowd").setDisabled(false);
		}else if(pagenumberOrderRowd==totalpage){
			dijit.byId("but6OrderRowd").setDisabled(false);
			dijit.byId("but7OrderRowd").setDisabled(true);
		}else{
			dijit.byId("but6OrderRowd").setDisabled(false);
			dijit.byId("but7OrderRowd").setDisabled(false);
		}
	}else{
		dijit.byId("but6OrderRowd").setDisabled(true);
		dijit.byId("but7OrderRowd").setDisabled(true);
	
	}
	if(pagesizeOrderRowd==0){
		totalpage=1;
		dijit.byId("but6OrderRowd").setDisabled(true);
		dijit.byId("but7OrderRowd").setDisabled(true);
	}
	if(totalpage==1)pagenumberOrderRowd=1;
	
	 document.getElementById("rowCountOrderRowd").innerHTML=i18nStr.di+" "+pagenumberOrderRowd+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountOrderRowd+" "+i18nStr.rowSize; 	
}

function init(){
	
 	dojo.connect(dijit.byId("gridOrderRowd"), "dodblclick", function(e){
	   if(document.getElementById('queryDivOrderRowd').style.display=='')document.getElementById('queryDivOrderRowd').style.display='none';
	   if(document.getElementById('addDivOrderRowd').style.display=='none')document.getElementById('addDivOrderRowd').style.display='';
		 document.getElementById('erowIndexOrderRowd').value=e.rowIndex;
		 document.getElementById('OrderRowdId').value=querydataOrderRowd[e.rowIndex][1];
		 	 									dijit.byId("addOrderRowdproductNum").setValue(querydataOrderRowd[e.rowIndex][2]);
						 									dijit.byId("addOrderRowdunitNum").setValue(querydataOrderRowd[e.rowIndex][3]);
						 									dijit.byId("addOrderRowdgoodsSuttle").setValue(querydataOrderRowd[e.rowIndex][4]);
						 									dijit.byId("addOrderRowdgoodsWeight").setValue(querydataOrderRowd[e.rowIndex][5]);
						 									dijit.byId("addOrderRowdgoodsVolume").setValue(querydataOrderRowd[e.rowIndex][6]);
						 									dijit.byId("addOrderRowdlabel").setValue(querydataOrderRowd[e.rowIndex][7]);
						 									dijit.byId("addOrderRowdcarriage").setValue(querydataOrderRowd[e.rowIndex][8]);
						 									dijit.byId("addOrderRowdespecial").setValue(querydataOrderRowd[e.rowIndex][9]);
						 									dijit.byId("addOrderRowdgoodsState").setValue(querydataOrderRowd[e.rowIndex][10]);
						 									dijit.byId("addOrderRowdremark").setValue(querydataOrderRowd[e.rowIndex][11]);
						 			 
									dijit.byId("addOrderRowdorder").setValue(querydataOrderRowd[e.rowIndex][12][1]);
												dijit.byId("addOrderRowdproduct").setValue(querydataOrderRowd[e.rowIndex][13][1]);
								   
	});  
	gridOrderRowd.onStyleRow=OnStyleRowClassBlue();
	getOrderRowdVO(queryvoOrderRowd);
}

 dojo.addOnLoad(init);   

	function selectOrderdFun(rep){
		querydataOrderRowd[dojoOrderRowd.selectOrderdInRow][dojoOrderRowd.noOrderd]=rep;
		gridOrderRowd.updateRow(dojoOrderRowd.selectOrderdInRow);		
	}
	function selectProdFun(rep){
		querydataOrderRowd[dojoOrderRowd.selectProdInRow][dojoOrderRowd.noProd]=rep;
		gridOrderRowd.updateRow(dojoOrderRowd.selectProdInRow);		
	}


 
//addDiv---------------begin-------------------------------------
var addDivAdd = function(){
	 //if(document.getElementById('queryDivOrderRowd').style.display=='')document.getElementById('queryDivOrderRowd').style.display='none';
	 //if(document.getElementById('addDivOrderRowd').style.display=='none')document.getElementById('addDivOrderRowd').style.display='';
	  document.getElementById('gridSub').style.height='60px';
	 //add
															dijit.byId("addOrderRowdproductNum").setValue('');
																								dijit.byId("addOrderRowdunitNum").setValue('');
																								dijit.byId("addOrderRowdgoodsSuttle").setValue('');
																								dijit.byId("addOrderRowdgoodsWeight").setValue('');
																								dijit.byId("addOrderRowdgoodsVolume").setValue('');
																								dijit.byId("addOrderRowdlabel").setValue('');
																								dijit.byId("addOrderRowdcarriage").setValue('');
																								dijit.byId("addOrderRowdespecial").setValue('');
																								dijit.byId("addOrderRowdgoodsState").setValue('');
																								dijit.byId("addOrderRowdremark").setValue('');
														
						dijit.byId("addOrderRowdorder").setValue('');
			dijit.byId("addOrderRowdorder").setDisplayedValue('');
								dijit.byId("addOrderRowdproduct").setValue('');
			dijit.byId("addOrderRowdproduct").setDisplayedValue('');
				
	document.getElementById('OrderRowdId').value='0';
	
} 
function addDivSave(){
	var padd = new SOAPClientParameters2();
	var vobject=new Object();
    vobject.id=document.getElementById('OrderRowdId').value;
	var passAll=0;
										if(dijit.byId("addOrderRowdproductNum").isValid(true)){
					var nproductNum=new NumberQuery();
					nproductNum.upNumber=dijit.byId("addOrderRowdproductNum").getValue();
					vobject.productNum=nproductNum;
				}else{
					passAll=1;
				}
															if(dijit.byId("addOrderRowdunitNum").isValid(true)){
					var nunitNum=new NumberQuery();
					nunitNum.upNumber=dijit.byId("addOrderRowdunitNum").getValue();
					vobject.unitNum=nunitNum;
				}else{
					passAll=1;
				}
															if(dijit.byId("addOrderRowdgoodsSuttle").isValid(true)){
					var ngoodsSuttle=new NumberQuery();
					ngoodsSuttle.upNumber=dijit.byId("addOrderRowdgoodsSuttle").getValue();
					vobject.goodsSuttle=ngoodsSuttle;
				}else{
					passAll=1;
				}
															if(dijit.byId("addOrderRowdgoodsWeight").isValid(true)){
					var ngoodsWeight=new NumberQuery();
					ngoodsWeight.upNumber=dijit.byId("addOrderRowdgoodsWeight").getValue();
					vobject.goodsWeight=ngoodsWeight;
				}else{
					passAll=1;
				}
															if(dijit.byId("addOrderRowdgoodsVolume").isValid(true)){
					var ngoodsVolume=new NumberQuery();
					ngoodsVolume.upNumber=dijit.byId("addOrderRowdgoodsVolume").getValue();
					vobject.goodsVolume=ngoodsVolume;
				}else{
					passAll=1;
				}
															if(dijit.byId("addOrderRowdlabel").isValid(true)){
					vobject.label=dijit.byId("addOrderRowdlabel").getValue();
				}else{
					passAll=1;
				}
															if(dijit.byId("addOrderRowdcarriage").isValid(true)){
					var ncarriage=new NumberQuery();
					ncarriage.upNumber=dijit.byId("addOrderRowdcarriage").getValue();
					vobject.carriage=ncarriage;
				}else{
					passAll=1;
				}
															if(dijit.byId("addOrderRowdespecial").isValid(true)){
					vobject.especial=dijit.byId("addOrderRowdespecial").getValue();
				}else{
					passAll=1;
				}
															if(dijit.byId("addOrderRowdgoodsState").isValid(true)){
					vobject.goodsState=dijit.byId("addOrderRowdgoodsState").getValue();
				}else{
					passAll=1;
				}
															if(dijit.byId("addOrderRowdremark").isValid(true)){
					vobject.remark=dijit.byId("addOrderRowdremark").getValue();
				}else{
					passAll=1;
				}
										
			if(dijit.byId("addOrderRowdorder").isValid(true)){
			//vobject.order=dijit.byId("addorder").getValue();
			var manageable=new Object();
			manageable.id=dijit.byId("addOrderRowdorder").getValue();
			vobject.order=manageable;
		}else{
			passAll=1;
		}
				if(dijit.byId("addOrderRowdproduct").isValid(true)){
			//vobject.product=dijit.byId("addproduct").getValue();
			var manageable=new Object();
			manageable.id=dijit.byId("addOrderRowdproduct").getValue();
			vobject.product=manageable;
		}else{
			passAll=1;
		}
		
if(passAll==0){
		var addrow=[];
														addrow.push(vobject.productNum.upNumber);
																					addrow.push(vobject.unitNum.upNumber);
																					addrow.push(vobject.goodsSuttle.upNumber);
																					addrow.push(vobject.goodsWeight.upNumber);
																					addrow.push(vobject.goodsVolume.upNumber);
																					addrow.push(vobject.label);
																					addrow.push(vobject.carriage.upNumber);
																					addrow.push(vobject.especial);
																					addrow.push(vobject.goodsState);
																					addrow.push(vobject.remark);
																							addrow.push([false,addOrderRowdorder.getValue(),addOrderRowdorder.getDisplayedValue()]);
												addrow.push([false,addOrderRowdproduct.getValue(),addOrderRowdproduct.getDisplayedValue()]);
						 if(vobject.id==0){//create new row
		padd.add('OrderRowdVO',vobject);
		SOAPClient.invoke(urlOrderRowd, "createOrderRowd", padd, false,  function GetEnu_callBack(ul, soapResponse){
			addrow.splice(0,0,false,ul);
			querydataOrderRowd[querydataOrderRowd.length]=addrow;
			document.getElementById('erowIndexOrderRowd').value=querydataOrderRowd.length-1;
			gridOrderRowd.updateRowCount(querydataOrderRowd.length);
			document.getElementById('OrderRowdId').value=ul;
			});
	 }else{//modify row
		padd.add('OrderRowdVO',vobject);
		SOAPClient.invoke(urlOrderRowd, "updateOrderRowd", padd, false,  function GetEnu_callBack(ul, soapResponse){
		});
		addrow.splice(0,0,false,vobject.id);
		querydataOrderRowd[document.getElementById('erowIndexOrderRowd').value]=addrow;
	 }
	}   call_funUpdGridSub();
	gridOrderRowd.updateRow(document.getElementById('erowIndexOrderRowd').value); 
}

 function addDivRemove(){
     if(window.confirm(i18nStr.deleteConfirm)){
       var s = dijit.byId("gridOrderRowd").rowCount;
		console.log("sss:"+s);
        	  var delrowIndex=document.getElementById('erowIndexOrderRowd').value;
              var sId=document.getElementById('OrderRowdId').value;
              var pdel = new SOAPClientParameters();      
               pdel.add('id',sId);
               SOAPClient.invoke(urlOrderRowd, "deleteOrderRowd", pdel, false,  function GetEnu_callBack(ul, soapResponse){
               if(s-1!=delrowIndex){
					var e =document.createEvent("HTMLEvents");
					e.rowIndex=delrowIndex;
					dijit.byId("gridOrderRowd").dodblclick(e);
			   }else{if(document.getElementById('addDivOrderRowd').style.display=='')document.getElementById('addDivOrderRowd').style.display='none';}
			   dijit.byId("gridOrderRowd").model.remove(delrowIndex);
			   totalCountOrderRowd--;
			   var totalpage=Math.ceil(new Number(new Number(totalCountOrderRowd))/pagesizeOrderRowd);
			   document.getElementById("rowCountOrderRowd").innerHTML=i18nStr.di+" "+pagenumberOrderRowd+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountOrderRowd+" "+i18nStr.rowSize; 
               
	        });   
      }
 }    
 
 function adddis(){
	
	querydisplay("addDivOrderRowd");
	if(document.getElementById('addDivOrderRowd').style.display!='none')addDivAdd();
} 
//addDiv---------------end---------------------------------------	 
function allopen(){
          for(var i =0;i<querydataOrderRowd.length;i++){
            toggleOrderRowd(i,true);
          }
 }  

function allclose(){
          for(var i =0;i<querydataOrderRowd.length;i++){
            toggleOrderRowd(i,false);
          }
}

function pageSizeChangeOrderRowd(mylabel){
	pagesizeOrderRowd=mylabel;
	pagenumberOrderRowd=1;
	getOrderRowdVO(queryvoOrderRowd);
}

function allpageOrderRowd(){
	pagesizeOrderRowd=0;
	getOrderRowdVO(queryvoOrderRowd);
}

function upPageOrderRowd(){
	pagenumberOrderRowd--;
	getOrderRowdVO(queryvoOrderRowd);
}
function downPageOrderRowd(){
	pagenumberOrderRowd++;
	getOrderRowdVO(queryvoOrderRowd);
}

</script>
</head>	 
<body class="tundra">
 <!--rowinum=$rowinum-->
 <!--addHeight=$addHeight-->
<div id="addDivOrderRowd" style="margin-right: 0px;  height: 340px; display:none;" >
              <table align="center" width="100%" id="0" class="editorTable"  >
                <tr >
				<td align="center" style="{width:11%}" i18n="addNote" ></td>
                <td style="{width:22%}" ><input id="OrderRowdId" style="{display:none}"  type="text"  /></td>
                <td style="{width:11%}"><input id="erowIndexOrderRowd" style="{display:none}"  type="text"  /></td>
                <td style="{width:23%}" ></td>
                <td style="{width:11%}"></td>
                <td style="{width:22%}"></td>
				</tr> 
                <tr ><td align="center" style="{width:11%}"></td>
                <td style="{width:22%}" ></td>
                <td style="{width:11%}"></td>
				<td style="{width:23%}" ></td>
                <td style="{width:11%}"></td>
                <td style="{width:22%}"></td></tr>  
                <tr>
				<td align="right" i18n="productNum" >productNum:</td>
			<td align="left"  >
							<input type="text" class="editerNumber"   jsId="addOrderRowdproductNum"  id="addOrderRowdproductNum"  dojoType="mydojo.NumberTextBox" constraints="{min:0,max:9999999,places:4 }" />
			</td>
					<td align="right" i18n="unitNum" >unitNum:</td>
			<td align="left"  >
							<input type="text" class="editerNumber"   jsId="addOrderRowdunitNum"  id="addOrderRowdunitNum"  dojoType="mydojo.NumberTextBox" constraints="{min:0,max:9999999,places:4 }" />
			</td>
					<td align="right" i18n="goodsSuttle" >goodsSuttle:</td>
			<td align="left"  >
							<input type="text" class="editerNumber"   jsId="addOrderRowdgoodsSuttle"  id="addOrderRowdgoodsSuttle"  dojoType="mydojo.NumberTextBox" constraints="{min:0,max:9999999,places:4 }" />
			</td>
		</tr>	
                <tr>
				<td align="right" i18n="goodsWeight" >goodsWeight:</td>
			<td align="left"  >
							<input type="text" class="editerNumber"   jsId="addOrderRowdgoodsWeight"  id="addOrderRowdgoodsWeight"  dojoType="mydojo.NumberTextBox" constraints="{min:0,max:9999999,places:4 }" />
			</td>
					<td align="right" i18n="goodsVolume" >goodsVolume:</td>
			<td align="left"  >
							<input type="text" class="editerNumber"   jsId="addOrderRowdgoodsVolume"  id="addOrderRowdgoodsVolume"  dojoType="mydojo.NumberTextBox" constraints="{min:0,max:9999999,places:4 }" />
			</td>
					<td align="right" i18n="label" >label:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addOrderRowdlabel"  jsId="addOrderRowdlabel"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
		</tr>	
                <tr>
				<td align="right" i18n="carriage" >carriage:</td>
			<td align="left"  >
							<input type="text" class="editerNumber"   jsId="addOrderRowdcarriage"  id="addOrderRowdcarriage"  dojoType="mydojo.NumberTextBox" constraints="{min:0,max:9999999,places:4 }" />
			</td>
					<td align="right" i18n="especial" >especial:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addOrderRowdespecial"  jsId="addOrderRowdespecial"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
					<td align="right" i18n="goodsState" >goodsState:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addOrderRowdgoodsState"  jsId="addOrderRowdgoodsState"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
		</tr>	
                <tr>
				<td align="right" i18n="remark" >remark:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addOrderRowdremark"  jsId="addOrderRowdremark"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
	
								<td align="right"  i18n="order"  ></td>
					<td align="left" ><!--colspan="3" --><input  id="addOrderRowdorder"  jsId="addOrderRowdorder" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrderRowd.orderStore" onchange="orderSet(0,arguments[0]);" /></td>  
														<td align="right"  i18n="product"  ></td>
					<td align="left" ><input  id="addOrderRowdproduct"  jsId="addOrderRowdproduct" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrderRowd.productStore" onchange="productSet(0,arguments[0]);" /></td>
					</tr>
						
<tr><td align="right"> &nbsp;</td></tr>
	</table>
	<div style="{height:200px;}"  >
		<div id="gridSub"   dojoType="dojox.Grid" autoWidth="false" style="{width:1200px;height:200px;left:30px;}"  jsId="gridSub"	model="modelChildAdd"  structure="childAddLayout" singleClickEdit="true" ></div>
	 </div>
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button dojoType="dijit.form.Button" id="but1" jsId="but1" onclick="addRowSub();"  disabled='false' iconClass="addIcon" i18n="addRow" >addSub</button>
	 <button dojoType="dijit.form.Button" id="but2" jsId="but2" onclick="deleteSub();" disabled='false' iconClass="delIcon" i18n="delRow" >deleteSub</button>
	 <button dojoType="dijit.form.Button" onclick="addDivRemove();" iconClass="delIcon"  i18n="delete" >remove</button>
	 <button dojoType="dijit.form.Button" onclick="addDivSave();" iconClass="saveIcon"  i18n="save">save</button>
			 
</div>

 <!--rowinum=$rowinum-->

<div id="queryDivOrderRowd" style="margin-right: 0px;  height: 140px; display:none;" >
  <table align="center" width=100% class="queryTable"  >
	<tr >
	<td align="center" style="{width:11%}" i18n="queryNote" >Please input criterial:</td>
	<td style="{width:22%}" ></td>
	<td style="{width:11%}"></td>
	<td style="{width:6%}" ></td>
	<td style="{width:11%}" ></td>
	<td style="{width:6%}" ></td>
	<td style="{width:11%}"></td>
	<td style="{width:22%}"></td>
	</tr> 
	<tr ><td align="center" style="{width:11%}"></td>
	<td style="{width:22%}" ></td>
	<td style="{width:11%}"></td>
	<td style="{width:6%}" ></td>
	<td style="{width:11%}" ></td>
	<td style="{width:6%}" ></td>
	<td style="{width:11%}"></td>
	<td style="{width:22%}"></td></tr>  
                <tr>
				<td align="right" i18n="productNum" >productNum:</td>
			<td align="left"  >
							<span id="queryOrderRowdproductNumImg0"  ><input type="text" class="editerNumber"   jsId="queryOrderRowdproductNum"  id="queryOrderRowdproductNum"  dojoType="mydojo.NumberTextBox"  /></span>
							<span id="queryOrderRowdproductNumImg1" style="{display:none}" ><input type="text"  class="editerNumberSmall" jsId="queryOrderRowdproductNum1"  id="queryOrderRowdproductNum1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryOrderRowdproductNumImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryOrderRowdproductNumImgdown" >></span>
							<span id="queryOrderRowdproductNumImg2div" style="{display:none}"> <input type="text"  class="editerNumberSmall"  jsId="queryOrderRowdproductNum2"  id="queryOrderRowdproductNum2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/nStart.gif" onclick="queryType(this);" id="queryOrderRowdproductNumImg" class="imgStyle">
							
						</td>
														<td align="right" i18n="unitNum" >unitNum:</td>
							<td align="left" colspan="3" >
								<span id="queryOrderRowdunitNumImg0"  ><input type="text" class="editerNumber" jsId="queryOrderRowdunitNum"  id="queryOrderRowdunitNum"  dojoType="mydojo.NumberTextBox"  /></span>
								<span id="queryOrderRowdunitNumImg1"  style="{display:none}" ><input type="text" class="editerNumberSmall" jsId="queryOrderRowdunitNum1"  id="queryOrderRowdunitNum1"  dojoType="mydojo.NumberTextBox"  /></span>
								<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryOrderRowdunitNumImgup">></span>
								<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryOrderRowdunitNumImgdown" >></span>
								<span id="queryOrderRowdunitNumImg2div" style="{display:none}"> <input type="text" class="editerNumberSmall"  jsId="queryOrderRowdunitNum2"  id="queryOrderRowdunitNum2"  dojoType="mydojo.NumberTextBox"  /></span>
								<img src="../image/nStart.gif" onclick="queryType(this);" id="queryOrderRowdunitNumImg" class="imgStyle">
							</td>  
																		<td align="right"  i18n="goodsSuttle" >goodsSuttle:</td>
						<td align="left"  >
							<span id="queryOrderRowdgoodsSuttleImg0"  ><input type="text" class="editerNumber" jsId="queryOrderRowdgoodsSuttle"  id="queryOrderRowdgoodsSuttle"  dojoType="mydojo.NumberTextBox"  /></span>
							<span id="queryOrderRowdgoodsSuttleImg1"  style="{display:none}" ><input type="text" class="editerNumberSmall" jsId="queryOrderRowdgoodsSuttle1"  id="queryOrderRowdgoodsSuttle1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryOrderRowdgoodsSuttleImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryOrderRowdgoodsSuttleImgdown" >></span>
							<span id="queryOrderRowdgoodsSuttleImg2div" style="{display:none}"> <input type="text" class="editerNumberSmall"  jsId="queryOrderRowdgoodsSuttle2"  id="queryOrderRowdgoodsSuttle2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/nStart.gif" onclick="queryType(this);" id="queryOrderRowdgoodsSuttleImg" class="imgStyle">
							
						</td>  
								  </tr>
			                <tr>
				<td align="right" i18n="goodsWeight" >goodsWeight:</td>
			<td align="left"  >
							<span id="queryOrderRowdgoodsWeightImg0"  ><input type="text" class="editerNumber"   jsId="queryOrderRowdgoodsWeight"  id="queryOrderRowdgoodsWeight"  dojoType="mydojo.NumberTextBox"  /></span>
							<span id="queryOrderRowdgoodsWeightImg1" style="{display:none}" ><input type="text"  class="editerNumberSmall" jsId="queryOrderRowdgoodsWeight1"  id="queryOrderRowdgoodsWeight1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryOrderRowdgoodsWeightImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryOrderRowdgoodsWeightImgdown" >></span>
							<span id="queryOrderRowdgoodsWeightImg2div" style="{display:none}"> <input type="text"  class="editerNumberSmall"  jsId="queryOrderRowdgoodsWeight2"  id="queryOrderRowdgoodsWeight2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/nStart.gif" onclick="queryType(this);" id="queryOrderRowdgoodsWeightImg" class="imgStyle">
							
						</td>
														<td align="right" i18n="goodsVolume" >goodsVolume:</td>
							<td align="left" colspan="3" >
								<span id="queryOrderRowdgoodsVolumeImg0"  ><input type="text" class="editerNumber" jsId="queryOrderRowdgoodsVolume"  id="queryOrderRowdgoodsVolume"  dojoType="mydojo.NumberTextBox"  /></span>
								<span id="queryOrderRowdgoodsVolumeImg1"  style="{display:none}" ><input type="text" class="editerNumberSmall" jsId="queryOrderRowdgoodsVolume1"  id="queryOrderRowdgoodsVolume1"  dojoType="mydojo.NumberTextBox"  /></span>
								<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryOrderRowdgoodsVolumeImgup">></span>
								<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryOrderRowdgoodsVolumeImgdown" >></span>
								<span id="queryOrderRowdgoodsVolumeImg2div" style="{display:none}"> <input type="text" class="editerNumberSmall"  jsId="queryOrderRowdgoodsVolume2"  id="queryOrderRowdgoodsVolume2"  dojoType="mydojo.NumberTextBox"  /></span>
								<img src="../image/nStart.gif" onclick="queryType(this);" id="queryOrderRowdgoodsVolumeImg" class="imgStyle">
							</td>  
																				<td align="right"  i18n="label" >label:</td>
						<td align="left"  >
													<input type="text" class="editerInput"  id="queryOrderRowdlabel"  jsId="queryOrderRowdlabel"   dojoType="dijit.form.TextBox"  />
												</td>  
										  </tr>
			                <tr>
				<td align="right" i18n="carriage" >carriage:</td>
			<td align="left"  >
							<span id="queryOrderRowdcarriageImg0"  ><input type="text" class="editerNumber"   jsId="queryOrderRowdcarriage"  id="queryOrderRowdcarriage"  dojoType="mydojo.NumberTextBox"  /></span>
							<span id="queryOrderRowdcarriageImg1" style="{display:none}" ><input type="text"  class="editerNumberSmall" jsId="queryOrderRowdcarriage1"  id="queryOrderRowdcarriage1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryOrderRowdcarriageImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryOrderRowdcarriageImgdown" >></span>
							<span id="queryOrderRowdcarriageImg2div" style="{display:none}"> <input type="text"  class="editerNumberSmall"  jsId="queryOrderRowdcarriage2"  id="queryOrderRowdcarriage2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/nStart.gif" onclick="queryType(this);" id="queryOrderRowdcarriageImg" class="imgStyle">
							
						</td>
												<td align="right"  i18n="especial" >especial:</td>
						<td align="left" colspan="3" >
														<input type="text" class="editerInput"  id="queryOrderRowdespecial"  jsId="queryOrderRowdespecial"   dojoType="dijit.form.TextBox"  />
													</td>  
															<td align="right"  i18n="goodsState" >goodsState:</td>
						<td align="left"  >
													<input type="text" class="editerInput"  id="queryOrderRowdgoodsState"  jsId="queryOrderRowdgoodsState"   dojoType="dijit.form.TextBox"  />
												</td>  
										  </tr>
			                <tr>
							<td align="right" i18n="remark" >remark:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="queryOrderRowdremark"  jsId="queryOrderRowdremark"   dojoType="dijit.form.TextBox"  />
													</td>
				
			
					<td align="right"  i18n="order"  ></td>
					<td align="left" colspan="3"  ><!----><input  id="queryOrderRowdorder"  jsId="queryOrderRowdorder" class="selectInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrderRowd.orderStore"  /><div dojoType="dijit.form.myDropDownButton" iconClass="dialogIcon"  ><div dojoType="dijit.TooltipDialog"  href="../common/queryOrderdFloat.html"title="detail" execute="" ></div></div></td>  
					
				
					<td align="right"  i18n="product"  ></td>
					<td align="left" ><input  id="queryOrderRowdproduct"  jsId="queryOrderRowdproduct" class="selectInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrderRowd.productStore"  /><div dojoType="dijit.form.myDropDownButton" iconClass="dialogIcon"  ><div dojoType="dijit.TooltipDialog"  href="../common/queryProdFloat.html"title="detail" execute="" ></div></div></td>
					</tr>
					
	
         <tr align="center"><td></td>
           <td colspan="1"> <button dojoType="dijit.form.Button" onclick="querybuttonOrderRowd();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="1"><button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="3"></td></tr>
         </table>
	    </div>	

<table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   OrderRowd List</b></td>
		<td align="right" >
	<!--button dojoType="dijit.form.Button" onclick="addRowOrderRowd();" iconClass="addIcon" i18n="add"  >add</button>
	<button dojoType="dijit.form.Button" onclick="removeSelectedRowsOrderRowd();" iconClass="delIcon" i18n="delete" >delete</button>
	<button dojoType="dijit.form.Button"  onclick="call_funUpdOrderRowd();" i18n="save" iconClass="saveIcon">save</button>
	<button dojoType="dijit.form.Button" onclick="addDivAdd();" iconClass="addIcon"  >add</button-->
	<button dojoType="dijit.form.Button" onclick="adddis();" iconClass="openDivIcon"  i18n="edit" >openAdd</button>
	<button dojoType="dijit.form.Button" onclick="querydisplay('queryDivOrderRowd');" iconClass="queryIcon"  i18n="openQuery" >query</button>
	<span id="rowCountOrderRowd"></span>
		<button dojoType="dijit.form.myButton" onclick="upPageOrderRowd();"  id="but6OrderRowd" disabled='true' jsId="but6OrderRowd" iconClass="upPageIcon" >pageup</button><!--span dojoType="dijit.Tooltip" connectId="but6">pageup</span-->
		<button dojoType="dijit.form.myButton" onclick="downPageOrderRowd();" id="but7OrderRowd" disabled='true' jsId="but7OrderRowd" iconClass="downPageIcon" >pagedown</button><!--span dojoType="dijit.Tooltip" connectId="but7">pagedown</span-->
		<div  dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
			  <div dojoType="dijit.Menu">
				  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChangeOrderRowd(this.label);"></div>
				  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChangeOrderRowd(this.label);"></div>
			  <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChangeOrderRowd(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChangeOrderRowd(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpageOrderRowd();"></div>
			  </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
		</div>
		<button dojoType="dijit.form.myButton" onclick="allopen();"  iconClass="allopenIcon" i18n="allopen" >allopen</button>
		<button dojoType="dijit.form.myButton" onclick="allclose();" iconClass="allcloseIcon" i18n="allclose"  >allclose</button>
		</td>
	</tr>
</table>	   

<div id="gridOrderRowd"  dojoType="dojox.Grid"  autoWidth="false" style="{width:100%;height:85%}" 	jsId="gridOrderRowd"	model="modelOrderRowd" structure="mainLayout"  ></div>
</body>
<script type="text/javascript">trans18tag();</script>
</html>					 





















					