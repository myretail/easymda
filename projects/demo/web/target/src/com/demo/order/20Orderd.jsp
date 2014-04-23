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
	 	 					<script type="text/javascript" src="../order/OrderRowdSubCrudForSubGrid.js"></script>
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

																																																																		                  // totleinum = 18 
 //		(18 >= 12)
	  //rowinum=10
			var mainLayout =[{//?????????colSpantoggle
					onBeforeRow: onBeforeRow,
					 cells: [
                      [
						{ name: 'choise', width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },
						{ name: i18nStr.detail, width: 3, get: getCheckOrderd, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
				//---------------------------------------------------------------------//rowinum=11   inum=2
					  			  ////////////////////////////////////////
			    											  {name: i18nStr.customerOrderNo, field: 2,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																		  			//--------------  if (3 == 11)
						//---------------------------------------------------------------------//rowinum=11   inum=3
					  			  ////////////////////////////////////////
			    											,   {name: i18nStr.contractNo, field: 3,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																		  			//--------------  if (4 == 11)
						//---------------------------------------------------------------------//rowinum=11   inum=4
					  			  ////////////////////////////////////////
			    					,   {name: i18nStr.conveyanceEnum, field: 4,width: 10 , editor: mydojo.FilteringSelect ,options:dojoOrderd.itemconveyanceEnumOption,required:true ,invalidMessage:'can not be empty'}
												  			//--------------  if (5 == 11)
						//---------------------------------------------------------------------//rowinum=11   inum=5
					  			  ////////////////////////////////////////
			    					,   {name: i18nStr.carryTypeEnum, field: 5,width: 10 , editor: mydojo.FilteringSelect ,options:dojoOrderd.itemcarryTypeEnumOption,required:false ,invalidMessage:'can not be empty'}
												  			//--------------  if (6 == 11)
						//---------------------------------------------------------------------//rowinum=11   inum=6
					  			  ////////////////////////////////////////
			    											,   {name: i18nStr.shipperRemark, field: 6,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																		  			//--------------  if (7 == 11)
						//---------------------------------------------------------------------//rowinum=11   inum=7
					  			  ////////////////////////////////////////
			    											,   {name: i18nStr.carrierRemark, field: 7,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																		  			//--------------  if (8 == 11)
						//---------------------------------------------------------------------//rowinum=11   inum=8
					  			  ////////////////////////////////////////
			    					,   {name: i18nStr.levelEnum, field: 8,width: 10 , editor: mydojo.FilteringSelect ,options:dojoOrderd.itemlevelEnumOption,required:false ,invalidMessage:'can not be empty'}
												  			//--------------  if (9 == 11)
						//---------------------------------------------------------------------//rowinum=11   inum=9
		//
												  					    							,   {name: i18nStr.customerTypeEnum, field: 9,width: 10 , editor: mydojo.FilteringSelect ,options:dojoOrderd.itemcustomerTypeEnumOption,required:false ,invalidMessage:'can not be empty'}
																		  								],[
													//---------------------------------------------------------------------//rowinum=11   inum=10
		                     //----------------(inum:10)  (rowinum: 11)
			//delete1
			 					  {name: i18nStr.referTime,field:10, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
										,   {name: i18nStr.referTimeTime,field:11, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
					 			  						//---------------------------------------------------------------------//rowinum=11   inum=12
		                     //----------------(inum:12)  (rowinum: 11)
			//delete1
			 			  ////////////////////////////////////////
			    											,   {name: i18nStr.linkMan, field: 12,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																		  						//---------------------------------------------------------------------//rowinum=11   inum=13
		                     //----------------(inum:13)  (rowinum: 11)
			//delete1
			 			  ////////////////////////////////////////
			    											,   {name: i18nStr.tel, field: 13,width: 10 , editor: mydojo.ValidationTextBox ,required:false ,maxLength:30}
																		  						//---------------------------------------------------------------------//rowinum=11   inum=14
		                     //----------------(inum:14)  (rowinum: 11)
			//delete1
			 					,   {name: i18nStr.bookTime,field:14, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
										,   {name: i18nStr.bookTimeTime,field:15, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
					 			  						//---------------------------------------------------------------------//rowinum=11   inum=16
		                     //----------------(inum:16)  (rowinum: 11)
			//delete1
			 					,   {name: i18nStr.completeTime,field:16, width: 8,editor: dojox.grid.editors.DateTextBox,  formatter: formatDate,  constraint: { selector: "date",datePattern: "yyyy-MM-dd"}}
										,   {name: i18nStr.completeTimeTime,field:17, width: 8,editor: dojox.grid.editors.TimeTextBox, formatter: formatDate, constraint: {selector: "time" ,timePattern: "HH:mm"}}
					 			  						//---------------------------------------------------------------------//rowinum=11   inum=18
		                     //----------------(inum:18)  (rowinum: 11)
			//delete1
			 			  ////////////////////////////////////////
			    											,   {name: i18nStr.remark, field: 18,width: 10, editor: dojox.grid.editors.Editor,required:false, editorToolbar: true  }
																		  							
	//
		  //(18 > 11)
			//delete2
										//
		  //(18 > 11)
			//delete2
								 ,   {name: i18nStr.customer,field: 20,get:function(inRowIndex){ var str='';var strid;if(querydataOrderd[inRowIndex]!=undefined && querydataOrderd[inRowIndex][20]!=undefined && querydataOrderd[inRowIndex][20][1]!=undefined){str=querydataOrderd[inRowIndex][20][2];strid=querydataOrderd[inRowIndex][20][1];} return str+'<img src="../image/selectFloat.gif" height="16" width="16" class="imgSelectStyle" onclick="dojoOrderd.selectCustomer('+strid+','+inRowIndex+',20,0,event);"   >';} ,width: 10 }
															,   {name: ' ',colSpan: 1 ,value:' ' ,width: 10 }
			
	
],[
				{ name: '\u8be6\u7ec6', colSpan: 11 ,styles: 'padding: 0; margin: 0;', get: getDetailOrderd }//value: '<div style="height:0px; background-color: white;"></div>'
			  ]
		  ]

		}];	 


var detailRowsOrderd=[];
function onBeforeRow(inDataIndex, inRow) {	if (inRow[2]!=undefined)inRow[2].hidden = !detailRowsOrderd[inDataIndex];}	
function toggleOrderd(inIndex, inShow) {
        			//if (!inShow) destroySubGridIdGeneral('',querydataOrderd[inIndex][1],"OrderdMainDetail");
					if (!inShow) destroySubGridIdGeneral('',querydataOrderd[inIndex][1],"OrderdChild");
				    detailRowsOrderd[inIndex] = inShow;
				    dijit.byId("gridOrderd").updateRow(inIndex); 
				    
    } 

function getCheckOrderd(inRowIndex) {
	var image = (detailRowsOrderd[inRowIndex] ? 'open.gif' : 'closed.gif');
	var show = (detailRowsOrderd[inRowIndex] ? 'false' : 'true');
	return '<img src="../image/' + image + '" onclick="toggleOrderd(' + inRowIndex + ', ' + show + ')" height="11" width="11">';
}

function getDetailOrderd(inRowIndex){
	if(detailRowsOrderd[inRowIndex]){
		var cell = this;
		setTimeout(function() { buildSubgridOrderd(inRowIndex, cell); }, 0);  }
		var h =0;
		if(detailRowsOrderd[inRowIndex]&&querydataOrderd[inRowIndex][19]!=undefined &&querydataOrderd[inRowIndex][19].length>0){
							h=65+25*querydataOrderd[inRowIndex][19].length;  		}
	return '<div style="height:'+h+'px; background-color: white;"></div>';
}

//function makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString) {return parentRowIndex+"_"+idString+"_" + inRowIndex;		}

//function destroySubGridIdGeneral(parentRowIndex,inRowIndex,idString) {	var subGrid = dijit.byId(makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString));	if (subGrid) subGrid.destroy();	}
var childRow= 19;
var layoutInRowIndex;	  



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
												addrow.push([]);
					
addrow.splice(0,0,false,0);




function buildSubgridOrderd(inRowIndex, inCell) {  //makeSubgridIdMainDetail(id)Ç¸idmainDetailGridid
	if(inCell!=undefined && inCell.getNode(inRowIndex)!=undefined){
		var child = inCell.getNode(inRowIndex).firstChild;
		//var child = inCell.getNode(inRowIndex).lastChild;
		//var idmainDetail = makeSubGridIdGeneral('',querydataOrderd[inRowIndex][1],"OrderdMainDetail");//makeSubgridIdMainDetail(querydataOrderd[inRowIndex][1]);//taskmakeSubgridId(taskRowSubdata[inRowIndex][1]);
		var idchild = makeSubGridIdGeneral('',querydataOrderd[inRowIndex][1],"OrderdChild");
		//var subGridMainDetail = dijit.byId(idmainDetail);
		var subGridChild = dijit.byId(idchild);
		var dataChild=querydataOrderd[inRowIndex][19];
		if(dataChild!=undefined){
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
					childLayoutOdd=buildChildLayout(pre,headerstyleodd,inRowIndex);	
					childProps.structure=childLayoutOdd;
				}else{
					childLayout=buildChildLayout(pre,headerstyle,inRowIndex);
					childProps.structure=childLayout;
				}
				subGridChild = new dojox.Grid(childProps, child);//gridÎªÇ¶×±Ê±Ô¶DIVÄ´Ð¡
			}
			if (subGridChild) {
				subGridChild.render();
				subGridChild.cacheHeight = subGridChild.domNode.offsetHeight;
			}	      				
		}
		
		/*var detailDate=[];
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
			}*/	
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
		   querydataOrderd=dojoOrderd.OrderdVOtoArray_fun(ul,true);
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


var addRowOrderd = function(){
	gridOrderd.addRow([false,0,"","",""],gridOrderd.model.getRowCount());
} 

function removeOrderd(){
       var s= new Array();
       var sall=gridOrderd.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
          s.push(i);
          var thisCell=sall[i];
          if(thisCell[1]!=0){//the row which will be deleted
            deletedataOrderd.splice(deletedataOrderd.length,0,thisCell[1]);
       }}}
       gridOrderd.model.remove(s);//grid.removeSelectedRows();
 }
function call_funUpdOrderd() {
       var sall=gridOrderd.model.data;
       for(var i=0;i<sall.length;i++){
       if(sall[i][0]==true){
         var passAll=0;
         var thisCell=sall[i];
         var padd = new SOAPClientParameters2();
         var vobject=new Object();
         vobject.id=thisCell[1];
               vobject.customerOrderNo=thisCell[2];
 
               vobject.contractNo=thisCell[3];
 
              if(dojox.validate.isText(thisCell[4], {minlength: 1})){vobject.conveyanceEnum=thisCell[4];
             }else{gridOrderd.getCell(gridOrderd.model.fieldArray[4]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;}//not null
 
               vobject.carryTypeEnum=thisCell[5];
 
               vobject.shipperRemark=thisCell[6];
 
               vobject.carrierRemark=thisCell[7];
 
               vobject.levelEnum=thisCell[8];
 
               vobject.customerTypeEnum=thisCell[9];
 
var  d=new DateTimeQuery();
             if(thisCell[10] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[10], gridOrderd.getCell(gridOrderd.model.fieldArray[10]).constraint);
             }else{gridOrderd.getCell(gridOrderd.model.fieldArray[10]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[11] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[11], gridOrderd.getCell(gridOrderd.model.fieldArray[11]).constraint);
             vobject.referTime=d;
             }else{gridOrderd.getCell(gridOrderd.model.fieldArray[11]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null
 

               vobject.linkMan=thisCell[12];
 
               vobject.tel=thisCell[13];
 
var  d=new DateTimeQuery();
             if(thisCell[14] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[14], gridOrderd.getCell(gridOrderd.model.fieldArray[14]).constraint);
             }else{gridOrderd.getCell(gridOrderd.model.fieldArray[14]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[15] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[15], gridOrderd.getCell(gridOrderd.model.fieldArray[15]).constraint);
             vobject.bookTime=d;
             }else{gridOrderd.getCell(gridOrderd.model.fieldArray[15]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null
 

var  d=new DateTimeQuery();
             if(thisCell[16] instanceof Date){ d.upDate=dojo.date.locale.format(thisCell[16], gridOrderd.getCell(gridOrderd.model.fieldArray[16]).constraint);
             }else{gridOrderd.getCell(gridOrderd.model.fieldArray[16]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be date</span>"; passAll=1;}//not null
              if(thisCell[17] instanceof Date){
             d.upDate=d.upDate+" "+dojo.date.locale.format(thisCell[17], gridOrderd.getCell(gridOrderd.model.fieldArray[17]).constraint);
             vobject.completeTime=d;
             }else{gridOrderd.getCell(gridOrderd.model.fieldArray[17]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>must be time</span>"; passAll=1;}//not null
 

               vobject.remark=thisCell[18];
 

										var manageable=new Object();
			 if(querydataOrderd[i][20]!=''&&querydataOrderd[i][20]!=undefined){
             manageable.id=querydataOrderd[i][20][1];
             vobject.customer=manageable;
			 }else{
			 gridOrderd.getCell(gridOrderd.model.fieldArray[20]).getNode(i).innerHTML="<span style={color:red;line-height:16px}>can not be null</span>"; passAll=1;
			 }
			


       if(passAll==0){
             if(thisCell[1]==0){//create new row
                padd.add('OrderdVO',vobject);
                SOAPClient.invoke(urlOrderd, "createOrderd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                gridOrderd.model.setDatum(ul,i,1);
				querydataOrderd[i][19]=[addrow];
				});
	         }else{//modify row
                padd.add('OrderdVO',vobject);
                SOAPClient.invoke(urlOrderd, "updateOrderd", padd, false,  function GetEnu_callBack(ul, soapResponse){
                });
	         }
			 call_funUpdGridSub(i);
        } }}//for
//submit delete
          for(var i=0;i<deletedataOrderd.length;i++){
               var pdel = new SOAPClientParameters();      
               pdel.add('id',deletedataOrderd[i]);
               SOAPClient.invoke(urlOrderd, "deleteOrderd", pdel, false,  function GetEnu_callBack(ul, soapResponse){
	             
	           });
          }
          deletedataOrderd=new Array();
          //dojo.byId("rowCount").innerHTML = 'saved'; 
//submit delete end          
	
 } 

																																																															//totleinum=19
 //rowinum=6

 
</script>
</head>	 
<body class="tundra">
<div id="queryDivOrderd"  style="margin-right: 0px;  height: 200px; display:none;"  >
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
							<input class="editerTime" jsid="queryOrderdreferTimeTime" id="queryOrderdreferTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
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
							<input class="editerTime" jsid="queryOrderdbookTimeTime" id="queryOrderdbookTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
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
							<input class="editerTime" jsid="queryOrderdcompleteTimeTime" id="queryOrderdcompleteTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
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
	<button dojoType="dijit.form.Button" onclick="addRowOrderd();" iconClass="addIcon" i18n="add"  >add</button>
	<button dojoType="dijit.form.Button" onclick="removeOrderd();" iconClass="delIcon" i18n="delete" >delete</button>
	<button dojoType="dijit.form.Button"  onclick="call_funUpdOrderd();" i18n="save" iconClass="saveIcon">save</button>
	<button dojoType="dijit.form.Button" onclick="querydisplay('queryDivOrderd');" iconClass="queryIcon"  i18n="openQuery" >query</button>
	<span id="rowCountOrderd"></span>
		<button dojoType="dijit.form.myButton" onclick="upPageOrderd();"  id="but6Orderd" disabled='true' jsId="but6Orderd" iconClass="upPageIcon" ></button>
		<button dojoType="dijit.form.myButton" onclick="downPageOrderd();" id="but7Orderd" disabled='true' jsId="but7Orderd" iconClass="downPageIcon" ></button>
		<div  dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
			  <div dojoType="dijit.Menu">
				  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChangeOrderd(this.label);"></div>
				  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChangeOrderd(this.label);"></div>
			  <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChangeOrderd(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChangeOrderd(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpageOrderd();"></div>
			  </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
		</div>
		<button dojoType="dijit.form.myButton" onclick="allopen();"  iconClass="allopenIcon" i18n="allopen" ></button>
		<button dojoType="dijit.form.myButton" onclick="allclose();" iconClass="allcloseIcon" i18n="allclose"  ></button>
		</td>
	</tr>
</table>	   

<div id="gridOrderd"  dojoType="dojox.Grid"  autoWidth="false" style="{width:100%;height:85%}" 	jsId="gridOrderd"	model="modelOrderd" structure="mainLayout"  ></div>
</body>
<script type="text/javascript">trans18tag();</script>
</html>		