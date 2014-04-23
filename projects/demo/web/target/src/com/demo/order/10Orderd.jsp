<%
String peopleId = request.getParameter("peopleId");
%>
<html>
<!--Ò»Ô¶à£¬Ö»Ò»Ò»Ó±í£¬Ã»Ð¿Ò»Ô¶Ó±var dataChild=querydataOrderd[inRowIndex]-->
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
			dojo.require("projectDojo.Orderd");
     </script>
        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 	<script type="text/javascript" >
		var dojoOrderd= new  projectDojo.Orderd();
	    dojoOrderd.initOrderd();
	//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
																			</script>

	 	 					<script type="text/javascript" src="../order/OrderRowdSubCrud.js"></script>
			<!--sub Table script    eg:taskRow.js    Ð¶Ç·Îªí£¬Ò³Ê¼Ó±childRow=0-->
							 
	<script type="text/javascript" >
	  var urlOrderd = getUrl()+ "services/OrderdManageService";
	  var deletedataOrderd =  new Array();
	  var querydataOrderd =  new Array();
	  var pagenumberOrderd=1;
	  var totalCountOrderd=0;
	  var pagesizeOrderd=10;
	  var orderByOrderd='0';
	  var queryvoOrderd=new Object();
	  var oddstyle='';
	  var modelOrderd = new dojox.grid.data.Table(null, querydataOrderd);
	  var urle = getUrl()+ "services/BasicManageService";
	  var modelOrderdDetail;
	  var modelOrderdChild;
	  
	function orderRowSet(id,value){
        	/*var itemselect=orderRowStore._getItemByIdentity(value);
				if(itemselect!='undefined'&& itemselect!=null){
				}*/
	}
	function customerSet(id,value){
        	/*var itemselect=customerStore._getItemByIdentity(value);
				if(itemselect!='undefined'&& itemselect!=null){
				}*/
	}


																																 //rowint======15====  8


var mainLayout =[{//?????????colSpantoggle
					onBeforeRow: onBeforeRow,
					 cells: [
                      [
						{ name: i18nStr.detail, width: 3, get: getCheckOrderd, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
					  				 {name: i18nStr.customerOrderNo, field: 2,width: 10}
						  								  				,  {name: i18nStr.contractNo, field: 3,width: 10}
						  								  				,  {name: i18nStr.conveyanceEnum, field: 4,width: 10}
						  								  				,  {name: i18nStr.carryTypeEnum, field: 5,width: 10}
						  								  				,  {name: i18nStr.shipperRemark, field: 6,width: 10}
						  								  				,  {name: i18nStr.carrierRemark, field: 7,width: 10}
						  								  				,  {name: i18nStr.levelEnum, field: 8,width: 10}
						  											
//
	//
						],[
							{ name: '\u8be6\u7ec6', colSpan: 11,styles: 'padding: 0; margin: 0;', get: getDetailOrderd }//value: '<div style="height:0px; background-color: white;"></div>'
						  ]
				  ]
	  
				}];	 

var subInt=	0;	
function buildMainDetailLayout(pre,mystyle){
var myLayout=[{noscroll: true,
					 cells: [
                      [
					  							  			  
							  							  			  
							  							  			  
							  							  			  
							  							  			  
							  							  			  
							  							  			  
							  									
					  {name: pre+i18nStr.customerTypeEnum, field: 9,width: 10,headerStyles:mystyle}
												  			  
							  									
					,   {name: pre+i18nStr.referTime,field:10, width: 8,headerStyles:mystyle}
												  			  
							  									
					,   {name: pre+i18nStr.linkMan, field: 11,width: 10,headerStyles:mystyle}
												  			  
							  									
					,   {name: pre+i18nStr.tel, field: 12,width: 10,headerStyles:mystyle}
												  			  
							  									
					,   {name: pre+i18nStr.bookTime,field:13, width: 8,headerStyles:mystyle}
												  			  
							  									
					,   {name: pre+i18nStr.completeTime,field:14, width: 8,headerStyles:mystyle}
												  			  
							  									
					,   {name: pre+i18nStr.remark, field: 15,width: 10,headerStyles:mystyle}
												  			  
				
//

				//

									,   {name: i18nStr.customer,field: 17,get:function(inRowIndex){ var str='';if(querydataOrderd[inRowIndex]!=undefined && querydataOrderd[inRowIndex][17]!=undefined){str=querydataOrderd[inRowIndex][17][2];} return str;} ,width: 10,headerStyles:mystyle }
														]]}];	 
	return  myLayout;
}

var mainDetailLayout;
var mainDetailLayoutOdd;
mainDetailLayout= buildMainDetailLayout(pre,headerstyle);
mainDetailLayoutOdd=buildMainDetailLayout(pre,headerstyleodd);

function getDetailOrderd(inRowIndex){
		var cell = this;
		setTimeout(function() { buildSubgridOrderd(inRowIndex, cell); }, 0);
		var h =0;
		if(detailRowsOrderd[inRowIndex]&&querydataOrderd[inRowIndex][16].length>0){
							h=65+25*querydataOrderd[inRowIndex][16].length;  		}
	return '<div style="height:45px; background-color: white;"></div><div style="height:'+h+'px; background-color: white;"></div>';
}

//end buildLayout

var detailRowsOrderd=[];

function onBeforeRow(inDataIndex, inRow) {	if (inRow[1]!=undefined)inRow[1].hidden = !detailRowsOrderd[inDataIndex];}	

function toggleOrderd(inIndex, inShow) {
        			if (!inShow) destroySubGridIdGeneral('',querydataOrderd[inIndex][1],"OrderdMainDetail");
					if (!inShow) destroySubGridIdGeneral('',querydataOrderd[inIndex][1],"OrderdChild");
				    detailRowsOrderd[inIndex] = inShow;
				    dijit.byId("gridOrderd").updateRow(inIndex); 
				    
    } 

function getCheckOrderd(inRowIndex) {
	var image = (detailRowsOrderd[inRowIndex] ? 'open.gif' : 'closed.gif');
	var show = (detailRowsOrderd[inRowIndex] ? 'false' : 'true');
	return '<img src="../image/' + image + '" onclick="toggleOrderd(' + inRowIndex + ', ' + show + ')" height="11" width="11">';
}





//function makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString) {return parentRowIndex+"_"+idString+"_" + inRowIndex;		}

//function destroySubGridIdGeneral(parentRowIndex,inRowIndex,idString) {	var subGrid = dijit.byId(makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString));	if (subGrid) subGrid.destroy();	}

	  
function buildSubgridOrderd(inRowIndex, inCell) {  //makeSubgridIdMainDetail(id)Ç¸idmainDetailGridid
	if(inCell!=undefined && inCell.getNode(inRowIndex)!=undefined){
		var mainDetail = inCell.getNode(inRowIndex).firstChild;
		var child = inCell.getNode(inRowIndex).lastChild;
		var idmainDetail = makeSubGridIdGeneral('',querydataOrderd[inRowIndex][1],"OrderdMainDetail");//makeSubgridIdMainDetail(querydataOrderd[inRowIndex][1]);//taskmakeSubgridId(taskRowSubdata[inRowIndex][1]);
		var idchild = makeSubGridIdGeneral('',querydataOrderd[inRowIndex][1],"OrderdChild");
		var subGridMainDetail = dijit.byId(idmainDetail);
		var subGridChild = dijit.byId(idchild);
		var dataChild=querydataOrderd[inRowIndex][16];
		if(dataChild.length!=0){
			if (subGridChild){
				subGridChild.model.setData(dataChild);
				child.appendChild(subGridChild.domNode);
			}else{
				modelOrderdChild=new dojox.grid.data.Table(null, dataChild);
				var childProps= {
								autoHeight: true, 
								autoRender: false,
								rowCount:dataChild.length,
								model:modelOrderdChild,							};
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
		detailDate[0]=querydataOrderd[inRowIndex];  
	    modelOrderdDetail=new dojox.grid.data.Table(null, detailDate);
		if (subGridMainDetail) {
			subGridMainDetail.model.setData(detailDate);
			mainDetail.appendChild(subGridMainDetail.domNode);
		} else {
			var mainDetailProps = {
				rowCount: 1, 
				autoHeight: true, 
				autoRender: false,
				model:modelOrderdDetail
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

function querybuttonOrderd(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvo.id=0 ;
              queryvoOrderd=new Object();
	          if(queryOrderdcustomerOrderNo.getDisplayedValue()!="")queryvoOrderd.customerOrderNo=queryOrderdcustomerOrderNo.getDisplayedValue();//
	          if(queryOrderdcontractNo.getDisplayedValue()!="")queryvoOrderd.contractNo=queryOrderdcontractNo.getDisplayedValue();//
	          if(queryOrderdconveyanceEnum.getDisplayedValue()!="")queryvoOrderd.conveyanceEnum=queryOrderdconveyanceEnum.getDisplayedValue();//
	          if(queryOrderdcarryTypeEnum.getDisplayedValue()!="")queryvoOrderd.carryTypeEnum=queryOrderdcarryTypeEnum.getDisplayedValue();//
	          if(queryOrderdshipperRemark.getDisplayedValue()!="")queryvoOrderd.shipperRemark=queryOrderdshipperRemark.getDisplayedValue();//
	          if(queryOrderdcarrierRemark.getDisplayedValue()!="")queryvoOrderd.carrierRemark=queryOrderdcarrierRemark.getDisplayedValue();//
	          if(queryOrderdlevelEnum.getDisplayedValue()!="")queryvoOrderd.levelEnum=queryOrderdlevelEnum.getDisplayedValue();//
	          if(queryOrderdcustomerTypeEnum.getDisplayedValue()!="")queryvoOrderd.customerTypeEnum=queryOrderdcustomerTypeEnum.getDisplayedValue();//
              d=queryDate_fun("OrderdreferTime");
              if(d==null){validstate=1;}else if(d.upSign!="%"){queryvoOrderd.referTime=d;}
	          if(queryOrderdlinkMan.getDisplayedValue()!="")queryvoOrderd.linkMan=queryOrderdlinkMan.getDisplayedValue();//
	          if(queryOrderdtel.getDisplayedValue()!="")queryvoOrderd.tel=queryOrderdtel.getDisplayedValue();//
              d=queryDate_fun("OrderdbookTime");
              if(d==null){validstate=1;}else if(d.upSign!="%"){queryvoOrderd.bookTime=d;}
              d=queryDate_fun("OrderdcompleteTime");
              if(d==null){validstate=1;}else if(d.upSign!="%"){queryvoOrderd.completeTime=d;}
	          if(queryOrderdremark.getDisplayedValue()!="")queryvoOrderd.remark=queryOrderdremark.getDisplayedValue();//
			
	if(queryOrderdorderRow.getDisplayedValue()!=""){
				var orderRowQuery= new Object();
				//orderRowQuery.OrderdName=queryOrderdorderRow.getDisplayedValue();
				orderRowQuery.id=queryOrderdorderRow.getValue();
				queryvoOrderd.orderRow=orderRowQuery;
			  }
	if(queryOrderdcustomer.getDisplayedValue()!=""){
				var customerQuery= new Object();
				//customerQuery.OrderdName=queryOrderdcustomer.getDisplayedValue();
				customerQuery.id=queryOrderdcustomer.getValue();
				queryvoOrderd.customer=customerQuery;
			  }

			if(validstate==0){
              pagenumberOrderd=1;
              getOrderdVO(queryvoOrderd); 
             }      
       }

function getOrderdVO(queryvo){
	var totalCount=0;
	deletedataOrderd =new Array();
      var pu = new SOAPClientParameters2();
      pu.add('OrderdVO',queryvo) ;
      pu.add('pageNumber',pagenumberOrderd) ;
	    pu.add('pageSize',pagesizeOrderd) ;
	    pu.add('orderBy',orderByOrderd) ;
      SOAPClient.invoke(urlOrderd,"getOrderd", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydataOrderd=new Array();
		   querydataOrderd=dojoOrderd.OrderdVOtoArray_fun(ul,false);
           totalCountOrderd=ul[ul.length-1]["ns:id"]; 
      }); 
      querydataOrderd.splice(querydataOrderd.length-1,1);
	  gridOrderd.selection.clear();
      modelOrderd.setData(querydataOrderd);
      //dijit.byId("grid").updateRowCount(querydataOrderd.length); 
	   var totalpage=Math.ceil(new Number(totalCountOrderd)/pagesizeOrderd);
	  
	if(totalpage>1){
		if(pagenumberOrderd==1){
			dijit.byId("but6Orderd").setDisabled(true);
			dijit.byId("but7Orderd").setDisabled(false);
		}else if(pagenumberOrderd==totalpage){
			dijit.byId("but6Orderd").setDisabled(false);
			dijit.byId("but7Orderd").setDisabled(true);
		}else{
			dijit.byId("but6Orderd").setDisabled(false);
			dijit.byId("but7Orderd").setDisabled(false);
		}
	}else{
		dijit.byId("but6Orderd").setDisabled(true);
		dijit.byId("but7Orderd").setDisabled(true);
	
	}
	if(pagesizeOrderd==0){
		totalpage=1;
		dijit.byId("but6Orderd").setDisabled(true);
		dijit.byId("but7Orderd").setDisabled(true);
	}
	if(totalpage==1)pagenumberOrderd=1;
	
	 document.getElementById("rowCountOrderd").innerHTML=i18nStr.di+" "+pagenumberOrderd+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountOrderd+" "+i18nStr.rowSize; 	
}

function init(){
	
 	dojo.connect(dijit.byId("gridOrderd"), "dodblclick", function(e){
	   if(document.getElementById('queryDivOrderd').style.display=='')document.getElementById('queryDivOrderd').style.display='none';
	   if(document.getElementById('addDivOrderd').style.display=='none')document.getElementById('addDivOrderd').style.display='';
		 document.getElementById('erowIndexOrderd').value=e.rowIndex;
		 document.getElementById('OrderdId').value=querydataOrderd[e.rowIndex][1];
		 	 									dijit.byId("addOrderdcustomerOrderNo").setValue(querydataOrderd[e.rowIndex][2]);
						 									dijit.byId("addOrderdcontractNo").setValue(querydataOrderd[e.rowIndex][3]);
						 									dijit.byId("addOrderdconveyanceEnum").setValue(querydataOrderd[e.rowIndex][4]);
						 									dijit.byId("addOrderdcarryTypeEnum").setValue(querydataOrderd[e.rowIndex][5]);
						 									dijit.byId("addOrderdshipperRemark").setValue(querydataOrderd[e.rowIndex][6]);
						 									dijit.byId("addOrderdcarrierRemark").setValue(querydataOrderd[e.rowIndex][7]);
						 									dijit.byId("addOrderdlevelEnum").setValue(querydataOrderd[e.rowIndex][8]);
						 									dijit.byId("addOrderdcustomerTypeEnum").setValue(querydataOrderd[e.rowIndex][9]);
						 									  dijit.byId("addOrderdreferTime").setValue(dojo.date.locale.parse(new String(querydataOrderd[e.rowIndex][10]),{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
				  dijit.byId("addOrderdreferTimeTime").setValue(dojo.date.locale.parse(new String(querydataOrderd[e.rowIndex][10]),{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
						 									dijit.byId("addOrderdlinkMan").setValue(querydataOrderd[e.rowIndex][11]);
						 									dijit.byId("addOrderdtel").setValue(querydataOrderd[e.rowIndex][12]);
						 									  dijit.byId("addOrderdbookTime").setValue(dojo.date.locale.parse(new String(querydataOrderd[e.rowIndex][13]),{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
				  dijit.byId("addOrderdbookTimeTime").setValue(dojo.date.locale.parse(new String(querydataOrderd[e.rowIndex][13]),{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
						 									  dijit.byId("addOrderdcompleteTime").setValue(dojo.date.locale.parse(new String(querydataOrderd[e.rowIndex][14]),{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
				  dijit.byId("addOrderdcompleteTimeTime").setValue(dojo.date.locale.parse(new String(querydataOrderd[e.rowIndex][14]),{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
						 									dijit.byId("addOrderdremark").setValue(querydataOrderd[e.rowIndex][15]);
						 			 
									gridSub.selection.clear();
				gridSub.refresh();
				querydataSub=[];
				querydataSub=querydataOrderd[e.rowIndex][16];
				gridSub.model.setData(querydataSub);
				gridSub.updateRowCount(querydataSub.length);
												dijit.byId("addOrderdcustomer").setValue(querydataOrderd[e.rowIndex][17][1]);
								   
	});  
	gridOrderd.onStyleRow=OnStyleRowClassBlue();
	getOrderdVO(queryvoOrderd);
}

 dojo.addOnLoad(init);   

	function selectOrderRowdFun(rep){
		querydataOrderd[dojoOrderd.selectOrderRowdInRow][dojoOrderd.noOrderRowd]=rep;
		gridOrderd.updateRow(dojoOrderd.selectOrderRowdInRow);		
	}
	function selectCustomerFun(rep){
		querydataOrderd[dojoOrderd.selectCustomerInRow][dojoOrderd.noCustomer]=rep;
		gridOrderd.updateRow(dojoOrderd.selectCustomerInRow);		
	}


 
//addDiv---------------begin-------------------------------------
var addDivAdd = function(){
	 //if(document.getElementById('queryDivOrderd').style.display=='')document.getElementById('queryDivOrderd').style.display='none';
	 //if(document.getElementById('addDivOrderd').style.display=='none')document.getElementById('addDivOrderd').style.display='';
	  document.getElementById('gridSub').style.height='60px';
	 //add
															dijit.byId("addOrderdcustomerOrderNo").setValue('');
																								dijit.byId("addOrderdcontractNo").setValue('');
																								//dijit.byId("addOrderdconveyanceEnum").setValue('');
																								//dijit.byId("addOrderdcarryTypeEnum").setValue('');
																								dijit.byId("addOrderdshipperRemark").setValue('');
																								dijit.byId("addOrderdcarrierRemark").setValue('');
																								//dijit.byId("addOrderdlevelEnum").setValue('');
																								//dijit.byId("addOrderdcustomerTypeEnum").setValue('');
																			dijit.byId("addOrderdreferTime").setValue('');
				dijit.byId("addOrderdreferTimeTime").setValue('');
																				dijit.byId("addOrderdlinkMan").setValue('');
																								dijit.byId("addOrderdtel").setValue('');
																			dijit.byId("addOrderdbookTime").setValue('');
				dijit.byId("addOrderdbookTimeTime").setValue('');
															dijit.byId("addOrderdcompleteTime").setValue('');
				dijit.byId("addOrderdcompleteTimeTime").setValue('');
																				dijit.byId("addOrderdremark").setValue('');
														
						gridSub.selection.clear();
			gridSub.refresh();	
			querydataSub=new Array();
			gridSub.model.setData(querydataSub);
			//gridSub.model.setData([]);
			//gridSub.updateRowCount(0);
			//querydataSub=new Array();
								dijit.byId("addOrderdcustomer").setValue('');
			dijit.byId("addOrderdcustomer").setDisplayedValue('');
				
	document.getElementById('OrderdId').value='0';
	
} 
function addDivSave(){
	var padd = new SOAPClientParameters2();
	var vobject=new Object();
    vobject.id=document.getElementById('OrderdId').value;
	var passAll=0;
										if(dijit.byId("addOrderdcustomerOrderNo").isValid(true)){
					vobject.customerOrderNo=dijit.byId("addOrderdcustomerOrderNo").getValue();
				}else{
					passAll=1;
				}
															if(dijit.byId("addOrderdcontractNo").isValid(true)){
					vobject.contractNo=dijit.byId("addOrderdcontractNo").getValue();
				}else{
					passAll=1;
				}
															if(dijit.byId("addOrderdconveyanceEnum").isValid(true)){
					vobject.conveyanceEnum=dijit.byId("addOrderdconveyanceEnum").getValue();
				}else{
					passAll=1;
				}
															if(dijit.byId("addOrderdcarryTypeEnum").isValid(true)){
					vobject.carryTypeEnum=dijit.byId("addOrderdcarryTypeEnum").getValue();
				}else{
					passAll=1;
				}
															if(dijit.byId("addOrderdshipperRemark").isValid(true)){
					vobject.shipperRemark=dijit.byId("addOrderdshipperRemark").getValue();
				}else{
					passAll=1;
				}
															if(dijit.byId("addOrderdcarrierRemark").isValid(true)){
					vobject.carrierRemark=dijit.byId("addOrderdcarrierRemark").getValue();
				}else{
					passAll=1;
				}
															if(dijit.byId("addOrderdlevelEnum").isValid(true)){
					vobject.levelEnum=dijit.byId("addOrderdlevelEnum").getValue();
				}else{
					passAll=1;
				}
															if(dijit.byId("addOrderdcustomerTypeEnum").isValid(true)){
					vobject.customerTypeEnum=dijit.byId("addOrderdcustomerTypeEnum").getValue();
				}else{
					passAll=1;
				}
															if(dijit.byId("addOrderdreferTime").getValue() instanceof Date){ 
					if(dijit.byId("addOrderdreferTimeTime").getValue() instanceof Date){
						var dreferTime=new DateTimeQuery();
						dreferTime.upDate=dojo.date.locale.format(dijit.byId("addOrderdreferTime").getValue(), dijit.byId("addOrderdreferTime").constraints)+" "+dojo.date.locale.format(dijit.byId("addOrderdreferTimeTime").getValue(), dijit.byId("addOrderdreferTimeTime").constraints);
						vobject.referTime=dreferTime;
					}else if(dijit.byId("addOrderdreferTimeTime").getValue()==undefined){
						var dreferTime=new DateTimeQuery();
						dreferTime.upDate=dojo.date.locale.format(dijit.byId("addOrderdreferTime").getValue(), dijit.byId("addOrderdreferTime").constraints)+" 00:00";
						vobject.referTime=dreferTime;
					}else{passAll=1;}
				}else{
					passAll=1;}
															if(dijit.byId("addOrderdlinkMan").isValid(true)){
					vobject.linkMan=dijit.byId("addOrderdlinkMan").getValue();
				}else{
					passAll=1;
				}
															if(dijit.byId("addOrderdtel").isValid(true)){
					vobject.tel=dijit.byId("addOrderdtel").getValue();
				}else{
					passAll=1;
				}
															if(dijit.byId("addOrderdbookTime").getValue() instanceof Date){ 
					if(dijit.byId("addOrderdbookTimeTime").getValue() instanceof Date){
						var dbookTime=new DateTimeQuery();
						dbookTime.upDate=dojo.date.locale.format(dijit.byId("addOrderdbookTime").getValue(), dijit.byId("addOrderdbookTime").constraints)+" "+dojo.date.locale.format(dijit.byId("addOrderdbookTimeTime").getValue(), dijit.byId("addOrderdbookTimeTime").constraints);
						vobject.bookTime=dbookTime;
					}else if(dijit.byId("addOrderdbookTimeTime").getValue()==undefined){
						var dbookTime=new DateTimeQuery();
						dbookTime.upDate=dojo.date.locale.format(dijit.byId("addOrderdbookTime").getValue(), dijit.byId("addOrderdbookTime").constraints)+" 00:00";
						vobject.bookTime=dbookTime;
					}else{passAll=1;}
				}else{
					passAll=1;}
															if(dijit.byId("addOrderdcompleteTime").getValue() instanceof Date){ 
					if(dijit.byId("addOrderdcompleteTimeTime").getValue() instanceof Date){
						var dcompleteTime=new DateTimeQuery();
						dcompleteTime.upDate=dojo.date.locale.format(dijit.byId("addOrderdcompleteTime").getValue(), dijit.byId("addOrderdcompleteTime").constraints)+" "+dojo.date.locale.format(dijit.byId("addOrderdcompleteTimeTime").getValue(), dijit.byId("addOrderdcompleteTimeTime").constraints);
						vobject.completeTime=dcompleteTime;
					}else if(dijit.byId("addOrderdcompleteTimeTime").getValue()==undefined){
						var dcompleteTime=new DateTimeQuery();
						dcompleteTime.upDate=dojo.date.locale.format(dijit.byId("addOrderdcompleteTime").getValue(), dijit.byId("addOrderdcompleteTime").constraints)+" 00:00";
						vobject.completeTime=dcompleteTime;
					}else{passAll=1;}
				}else{
					passAll=1;}
															if(dijit.byId("addOrderdremark").isValid(true)){
					vobject.remark=dijit.byId("addOrderdremark").getValue();
				}else{
					passAll=1;
				}
										
				if(dijit.byId("addOrderdcustomer").isValid(true)){
			//vobject.customer=dijit.byId("addcustomer").getValue();
			var manageable=new Object();
			manageable.id=dijit.byId("addOrderdcustomer").getValue();
			vobject.customer=manageable;
		}else{
			passAll=1;
		}
		
if(passAll==0){
		var addrow=[];
														addrow.push(vobject.customerOrderNo);
																					addrow.push(vobject.contractNo);
																					addrow.push(vobject.conveyanceEnum);
																					addrow.push(vobject.carryTypeEnum);
																					addrow.push(vobject.shipperRemark);
																					addrow.push(vobject.carrierRemark);
																					addrow.push(vobject.levelEnum);
																					addrow.push(vobject.customerTypeEnum);
																					addrow.push(vobject.referTime.upDate);
																					addrow.push(vobject.linkMan);
																					addrow.push(vobject.tel);
																					addrow.push(vobject.bookTime.upDate);
																					addrow.push(vobject.completeTime.upDate);
																					addrow.push(vobject.remark);
																							if(vobject.id==0){
					addrow.push([]);
				}else{
					addrow.push(querydataOrderd[document.getElementById('erowIndexOrderd').value][16]);
				}
												addrow.push([false,addOrderdcustomer.getValue(),addOrderdcustomer.getDisplayedValue()]);
						 if(vobject.id==0){//create new row
		padd.add('OrderdVO',vobject);
		SOAPClient.invoke(urlOrderd, "createOrderd", padd, false,  function GetEnu_callBack(ul, soapResponse){
			addrow.splice(0,0,false,ul);
			querydataOrderd[querydataOrderd.length]=addrow;
			document.getElementById('erowIndexOrderd').value=querydataOrderd.length-1;
			gridOrderd.updateRowCount(querydataOrderd.length);
			document.getElementById('OrderdId').value=ul;
			});
	 }else{//modify row
		padd.add('OrderdVO',vobject);
		SOAPClient.invoke(urlOrderd, "updateOrderd", padd, false,  function GetEnu_callBack(ul, soapResponse){
		});
		addrow.splice(0,0,false,vobject.id);
		querydataOrderd[document.getElementById('erowIndexOrderd').value]=addrow;
	 }
	}   call_funUpdGridSub();
	gridOrderd.updateRow(document.getElementById('erowIndexOrderd').value); 
}

 function addDivRemove(){
     if(window.confirm(i18nStr.deleteConfirm)){
       var s = dijit.byId("gridOrderd").rowCount;
		console.log("sss:"+s);
        	  var delrowIndex=document.getElementById('erowIndexOrderd').value;
              var sId=document.getElementById('OrderdId').value;
              var pdel = new SOAPClientParameters();      
               pdel.add('id',sId);
               SOAPClient.invoke(urlOrderd, "deleteOrderd", pdel, false,  function GetEnu_callBack(ul, soapResponse){
               if(s-1!=delrowIndex){
					var e =document.createEvent("HTMLEvents");
					e.rowIndex=delrowIndex;
					dijit.byId("gridOrderd").dodblclick(e);
			   }else{if(document.getElementById('addDivOrderd').style.display=='')document.getElementById('addDivOrderd').style.display='none';}
			   dijit.byId("gridOrderd").model.remove(delrowIndex);
			   totalCountOrderd--;
			   var totalpage=Math.ceil(new Number(new Number(totalCountOrderd))/pagesizeOrderd);
			   document.getElementById("rowCountOrderd").innerHTML=i18nStr.di+" "+pagenumberOrderd+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountOrderd+" "+i18nStr.rowSize; 
               
	        });   
      }
 }    
 
 function adddis(){
	
	querydisplay("addDivOrderd");
	if(document.getElementById('addDivOrderd').style.display!='none')addDivAdd();
} 
//addDiv---------------end---------------------------------------	 
function allopen(){
          for(var i =0;i<querydataOrderd.length;i++){
            toggleOrderd(i,true);
          }
 }  

function allclose(){
          for(var i =0;i<querydataOrderd.length;i++){
            toggleOrderd(i,false);
          }
}

function pageSizeChangeOrderd(mylabel){
	pagesizeOrderd=mylabel;
	pagenumberOrderd=1;
	getOrderdVO(queryvoOrderd);
}

function allpageOrderd(){
	pagesizeOrderd=0;
	getOrderdVO(queryvoOrderd);
}

function upPageOrderd(){
	pagenumberOrderd--;
	getOrderdVO(queryvoOrderd);
}
function downPageOrderd(){
	pagenumberOrderd++;
	getOrderdVO(queryvoOrderd);
}

</script>
</head>	 
<body class="tundra">
 <!--rowinum=$rowinum-->
 <!--addHeight=$addHeight-->
<div id="addDivOrderd" style="margin-right: 0px;  height: 360px; display:none;" >
              <table align="center" width="100%" id="0" class="editorTable"  >
                <tr >
				<td align="center" style="{width:11%}" i18n="addNote" ></td>
                <td style="{width:22%}" ><input id="OrderdId" style="{display:none}"  type="text"  /></td>
                <td style="{width:11%}"><input id="erowIndexOrderd" style="{display:none}"  type="text"  /></td>
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
				<td align="right" i18n="customerOrderNo" >customerOrderNo:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addOrderdcustomerOrderNo"  jsId="addOrderdcustomerOrderNo"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
					<td align="right" i18n="contractNo" >contractNo:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addOrderdcontractNo"  jsId="addOrderdcontractNo"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
					<td align="right" i18n="conveyanceEnum" >conveyanceEnum:</td>
			<td align="left"  >
									<input  id="addOrderdconveyanceEnum"  jsId="addOrderdconveyanceEnum" class="editerInput"  dojoType="dijit.form.myFilteringSelect" store="dojoOrderd.conveyanceEnumStore"  />
							</td>
		</tr>	
                <tr>
				<td align="right" i18n="carryTypeEnum" >carryTypeEnum:</td>
			<td align="left"  >
									<input  id="addOrderdcarryTypeEnum"  jsId="addOrderdcarryTypeEnum" class="editerInput"  dojoType="dijit.form.myFilteringSelect" store="dojoOrderd.carryTypeEnumStore"  />
							</td>
					<td align="right" i18n="shipperRemark" >shipperRemark:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addOrderdshipperRemark"  jsId="addOrderdshipperRemark"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
					<td align="right" i18n="carrierRemark" >carrierRemark:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addOrderdcarrierRemark"  jsId="addOrderdcarrierRemark"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
		</tr>	
                <tr>
				<td align="right" i18n="levelEnum" >levelEnum:</td>
			<td align="left"  >
									<input  id="addOrderdlevelEnum"  jsId="addOrderdlevelEnum" class="editerInput"  dojoType="dijit.form.myFilteringSelect" store="dojoOrderd.levelEnumStore"  />
							</td>
					<td align="right" i18n="customerTypeEnum" >customerTypeEnum:</td>
			<td align="left"  >
									<input  id="addOrderdcustomerTypeEnum"  jsId="addOrderdcustomerTypeEnum" class="editerInput"  dojoType="dijit.form.myFilteringSelect" store="dojoOrderd.customerTypeEnumStore"  />
							</td>
					<td align="right" i18n="referTime"  >referTime:</td> 
			<td align="left" >
				<input class="editerDate"   jsId="addOrderdreferTime" id="addOrderdreferTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
				<input class="editerTime" jsId="addOrderdreferTimeTime" id="addOrderdreferTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours.">
			</td>
		</tr>	
                <tr>
				<td align="right" i18n="linkMan" >linkMan:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addOrderdlinkMan"  jsId="addOrderdlinkMan"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
					<td align="right" i18n="tel" >tel:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addOrderdtel"  jsId="addOrderdtel"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
					<td align="right" i18n="bookTime"  >bookTime:</td> 
			<td align="left" >
				<input class="editerDate"   jsId="addOrderdbookTime" id="addOrderdbookTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
				<input class="editerTime" jsId="addOrderdbookTimeTime" id="addOrderdbookTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours.">
			</td>
		</tr>	
                <tr>
				<td align="right" i18n="completeTime"  >completeTime:</td> 
			<td align="left" >
				<input class="editerDate"   jsId="addOrderdcompleteTime" id="addOrderdcompleteTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
				<input class="editerTime" jsId="addOrderdcompleteTimeTime" id="addOrderdcompleteTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours.">
			</td>
					<td align="right" i18n="remark" >remark:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addOrderdremark"  jsId="addOrderdremark"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
	
												<td align="right"  i18n="customer"  ></td>
					<td align="left" ><input  id="addOrderdcustomer"  jsId="addOrderdcustomer" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrderd.customerStore" onchange="customerSet(0,arguments[0]);" /></td>
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

<div id="queryDivOrderd" style="margin-right: 0px;  height: 160px; display:none;" >
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
							<td align="right" i18n="customerOrderNo" >customerOrderNo:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="queryOrderdcustomerOrderNo"  jsId="queryOrderdcustomerOrderNo"   dojoType="dijit.form.TextBox"  />
													</td>
														<td align="right"  i18n="contractNo" >contractNo:</td>
						<td align="left"  colspan="3" >
													<input type="text" class="editerInput"  id="queryOrderdcontractNo"  jsId="queryOrderdcontractNo"   dojoType="dijit.form.TextBox"  />
												</td>  
													<td align="right"  i18n="conveyanceEnum" >conveyanceEnum:</td>
						<td align="left"  >
													<input  id="queryOrderdconveyanceEnum" jsId="queryOrderdconveyanceEnum" class="editerInput"  dojoType="dijit.form.FilteringSelect" store="dojoOrderd.conveyanceEnumStore" />
												</td>  
										  </tr>
			                <tr>
							<td align="right" i18n="carryTypeEnum" >carryTypeEnum:</td>
						<td align="left"  >
						
														<input  id="queryOrderdcarryTypeEnum"  jsId="queryOrderdcarryTypeEnum" class="editerInput"  dojoType="dijit.form.FilteringSelect" store="dojoOrderd.carryTypeEnumStore" />
													</td>
														<td align="right"  i18n="shipperRemark" >shipperRemark:</td>
						<td align="left"  colspan="3" >
													<input type="text" class="editerInput"  id="queryOrderdshipperRemark"  jsId="queryOrderdshipperRemark"   dojoType="dijit.form.TextBox"  />
												</td>  
													<td align="right"  i18n="carrierRemark" >carrierRemark:</td>
						<td align="left"  >
													<input type="text" class="editerInput"  id="queryOrderdcarrierRemark"  jsId="queryOrderdcarrierRemark"   dojoType="dijit.form.TextBox"  />
												</td>  
										  </tr>
			                <tr>
							<td align="right" i18n="levelEnum" >levelEnum:</td>
						<td align="left"  >
						
														<input  id="queryOrderdlevelEnum"  jsId="queryOrderdlevelEnum" class="editerInput"  dojoType="dijit.form.FilteringSelect" store="dojoOrderd.levelEnumStore" />
													</td>
														<td align="right"  i18n="customerTypeEnum" >customerTypeEnum:</td>
						<td align="left"  colspan="3" >
												<input  id="queryOrderdcustomerTypeEnum" jsId="queryOrderdcustomerTypeEnum" class="editerInput"  dojoType="dijit.form.FilteringSelect" store="dojoOrderd.customerTypeEnumStore" />
												</td>  
											<td align="right"  > </td>
						<td align="right"  ></td>
					</tr><tr >
						<td align="right"  i18n="referTime" >referTime:</td>
						<td align="left"  colspan="3"><span id="queryOrderdreferTimeImg0"  ><input class="editerDate"   jsId="queryOrderdreferTime" id="queryOrderdreferTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTime" jsId="queryOrderdreferTimeTime" id="queryOrderdreferTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span id="queryOrderdreferTimeImg1" style="{display:none}" ><input class="editerDateSmaller"   jsId="query1OrderdreferTime" id="query1OrderdreferTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query1OrderdreferTimeTime" id="query1OrderdreferTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryOrderdreferTimeImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryOrderdreferTimeImgdown" >></span>
							<span id="queryOrderdreferTimeImg2div" style="{display:none}"><input class="editerDateSmaller"   jsId="query2OrderdreferTime" id="query2OrderdreferTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query2OrderdreferTimeTime" id="query2OrderdreferTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="queryOrderdreferTimeImg" class="imgStyle">
							
						</td>
															<td align="right" colspan="2" ></td>
						<td align="right"  i18n="linkMan" >linkMan:</td>
						<td align="left"  >
							 								<input type="text" class="editerInput"  id="queryOrderdlinkMan"  jsId="queryOrderdlinkMan"   dojoType="dijit.form.TextBox"  />  
													</td></tr>
					                <tr>
							<td align="right" i18n="tel" >tel:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="queryOrderdtel"  jsId="queryOrderdtel"   dojoType="dijit.form.TextBox"  />
													</td>
																<td align="right"  i18n="bookTime" >bookTime:</td>
						<td align="left"   colspan="5"><span id="queryOrderdbookTimeImg0"  ><input class="editerDate"   jsId="queryOrderdbookTime" id="queryOrderdbookTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTime" jsId="queryOrderdbookTimeTime" id="queryOrderdbookTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span id="queryOrderdbookTimeImg1" style="{display:none}" ><input class="editerDateSmall"   jsId="query1OrderdbookTime" id="query1OrderdbookTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmall" jsId="query1OrderdbookTimeTime" id="query1OrderdbookTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryOrderdbookTimeImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryOrderdbookTimeImgdown" >></span>
							<span id="queryOrderdbookTimeImg2div" style="{display:none}"><input class="editerDateSmall"   jsId="query2OrderdbookTime" id="query2OrderdbookTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmall" jsId="query2OrderdbookTimeTime" id="query2OrderdbookTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="queryOrderdbookTimeImg" class="imgStyle">
						</td></tr>
			                <tr>
							<td align="right" i18n="completeTime"  >completeTime:</td> 
						<td align="left"  colspan="3"><span id="queryOrderdcompleteTimeImg0"  ><input class="editerDate"   jsId="queryOrderdcompleteTime" id="queryOrderdcompleteTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTime" jsId="queryOrderdcompleteTimeTime" id="queryOrderdcompleteTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span id="queryOrderdcompleteTimeImg1" style="{display:none}" ><input class="editerDateSmaller"   jsId="query1OrderdcompleteTime" id="query1OrderdcompleteTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query1OrderdcompleteTimeTime" id="query1OrderdcompleteTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryOrderdcompleteTimeImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryOrderdcompleteTimeImgdown" >></span>
							<span id="queryOrderdcompleteTimeImg2div" style="{display:none}"><input class="editerDateSmaller"   jsId="query2OrderdcompleteTime" id="query2OrderdcompleteTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query2OrderdcompleteTimeTime" id="query2OrderdcompleteTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="queryOrderdcompleteTimeImg" class="imgStyle">
						</td>
													<td align="right" colspan="2" ></td>
						<td align="right"  i18n="remark" >remark:</td>
						<td align="left"  >
							 								<input type="text" class="editerInput"  id="queryOrderdremark"  jsId="queryOrderdremark"   dojoType="dijit.form.TextBox"  />  
													</td></tr>
					
			
					<tr><td align="right"  i18n="orderRow"  ></td>
					<td align="left" ><input  id="queryOrderdorderRow"  jsId="queryOrderdorderRow" class="selectInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrderd.orderRowStore"  /><div dojoType="dijit.form.myDropDownButton" iconClass="dialogIcon"  ><div dojoType="dijit.TooltipDialog"  href="../common/queryOrderRowdFloat.html"title="detail" execute="" ></div></div></td>  
					
				
					<td align="right"  i18n="customer"  ></td>
					<td align="left" colspan="3"  ><!----><input  id="queryOrderdcustomer"  jsId="queryOrderdcustomer" class="selectInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrderd.customerStore"  /><div dojoType="dijit.form.myDropDownButton" iconClass="dialogIcon"  ><div dojoType="dijit.TooltipDialog"  href="../common/queryCustomerFloat.html"title="detail" execute="" ></div></div></td>  
					
	    <td align="right"    ></td><td align="right"    ></td></tr>

         <tr align="center"><td></td>
           <td colspan="1"> <button dojoType="dijit.form.Button" onclick="querybuttonOrderd();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="1"><button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="3"></td></tr>
         </table>
	    </div>	

<table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   Orderd List</b></td>
		<td align="right" >
	<!--button dojoType="dijit.form.Button" onclick="addRowOrderd();" iconClass="addIcon" i18n="add"  >add</button>
	<button dojoType="dijit.form.Button" onclick="removeSelectedRowsOrderd();" iconClass="delIcon" i18n="delete" >delete</button>
	<button dojoType="dijit.form.Button"  onclick="call_funUpdOrderd();" i18n="save" iconClass="saveIcon">save</button>
	<button dojoType="dijit.form.Button" onclick="addDivAdd();" iconClass="addIcon"  >add</button-->
	<button dojoType="dijit.form.Button" onclick="adddis();" iconClass="openDivIcon"  i18n="edit" >openAdd</button>
	<button dojoType="dijit.form.Button" onclick="querydisplay('queryDivOrderd');" iconClass="queryIcon"  i18n="openQuery" >query</button>
	<span id="rowCountOrderd"></span>
		<button dojoType="dijit.form.myButton" onclick="upPageOrderd();"  id="but6Orderd" disabled='true' jsId="but6Orderd" iconClass="upPageIcon" >pageup</button><!--span dojoType="dijit.Tooltip" connectId="but6">pageup</span-->
		<button dojoType="dijit.form.myButton" onclick="downPageOrderd();" id="but7Orderd" disabled='true' jsId="but7Orderd" iconClass="downPageIcon" >pagedown</button><!--span dojoType="dijit.Tooltip" connectId="but7">pagedown</span-->
		<div  dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
			  <div dojoType="dijit.Menu">
				  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChangeOrderd(this.label);"></div>
				  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChangeOrderd(this.label);"></div>
			  <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChangeOrderd(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChangeOrderd(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpageOrderd();"></div>
			  </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
		</div>
		<button dojoType="dijit.form.myButton" onclick="allopen();"  iconClass="allopenIcon" i18n="allopen" >allopen</button>
		<button dojoType="dijit.form.myButton" onclick="allclose();" iconClass="allcloseIcon" i18n="allclose"  >allclose</button>
		</td>
	</tr>
</table>	   

<div id="gridOrderd"  dojoType="dojox.Grid"  autoWidth="false" style="{width:100%;height:85%}" 	jsId="gridOrderd"	model="modelOrderd" structure="mainLayout"  ></div>
</body>
<script type="text/javascript">trans18tag();</script>
</html>					 





















					