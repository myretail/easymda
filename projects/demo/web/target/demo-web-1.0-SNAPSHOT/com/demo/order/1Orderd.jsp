<%
String peopleId = request.getParameter("peopleId");
%>
<html>
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
			dojo.require("dijit.Dialog");
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
            dojo.registerModulePath("mydojo", "../../../js/mydojo");
            dojo.require("mydojo.FilteringSelect");
            dojo.require("mydojo.ValidationTextBox");
            dojo.require("mydojo.NumberTextBox");
			dojo.registerModulePath("projectDojo", "../../../dojo/projectDojo");
			dojo.require("projectDojo.Orderd");
     </script>
		        
     <script type="text/javascript" src="../js/soapclient.js"></script>
	 <script type="text/javascript" >
	//manageablePackageName=com.demo.entity.order.crud
	//packageName=com.demo.entity.order
	  
	  </script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 <script type="text/javascript" >
	  var url = getUrl()+ "services/OrderdManageService";
	  var dojoOrderd= new  projectDojo.Orderd();
	  dojoOrderd.initOrderd();
	  var deletedata =  new Array();
	  var querydata =  new Array();
	  var pagenumber=1;
	  var pagesize=10;
	  var totalCount=0;
	  var queryvo=new Object();
	  var oddstyle='';
	  var model = new dojox.grid.data.Table(null, querydata);
	  var urle = getUrl()+ "services/BasicManageService"; 

 
//Ð¶Ï±Ö¶Ç·1212ÉµlayoutÛµlayoutstructure
//enumeration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
																																
/*//Úµð¾°¶
		//Úµð¾°¶
					function setCustomerDetailFun(inrow,CustomerColNo){
					return querydata[inrow][CustomerColNo];
				}
			*/
/*function setDetailFloatFun(inrow,ColNo){
	return querydata[inrow][ColNo];
}	*/

var layoutSingleRow=[{
          
 //fieldÖµÄ¬ÏµË³ò£¬´jsÐµtoArray×ªØµquerydateÈ¡
	   
				 cells: [ [
							//{name: 'Ñ¡', width: 3, get:getChoise},
						   { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
						   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
      				  {name: i18nStr.customerOrderNo, field: 2,width: 8}
					       				,   {name: i18nStr.contractNo, field: 3,width: 8}
					       				,   {name: i18nStr.conveyanceEnum, field: 4,width: 8}
					       				,   {name: i18nStr.carryTypeEnum, field: 5,width: 8}
					       				,   {name: i18nStr.shipperRemark, field: 6,width: 8}
					       				,   {name: i18nStr.carrierRemark, field: 7,width: 8}
					       				,   {name: i18nStr.levelEnum, field: 8,width: 8}
					       				,   {name: i18nStr.customerTypeEnum, field: 9,width: 8}
					   		,   {name: i18nStr.referTime,field:10, width: 8}
		        				,   {name: i18nStr.linkMan, field: 11,width: 8}
					       				,   {name: i18nStr.tel, field: 12,width: 8}
					   		,   {name: i18nStr.bookTime,field:13, width: 8}
		    		,   {name: i18nStr.completeTime,field:14, width: 8}
		        			    ,   {name: i18nStr.remark, field: 15,width: 10 }
					 
//Úµí²»Ð¶
		//Úµí²»Ð¶
					 ,   {name: i18nStr.customer,field: 17,get:function(inRowIndex){ var str='';var strid;if(querydata[inRowIndex]!=undefined && querydata[inRowIndex][17]!=undefined && querydata[inRowIndex][17][2]){str=querydata[inRowIndex][17][2];strid=querydata[inRowIndex][17][1];} return str+'<img src="../image/detailFloat.jpg" height="16" width="16" style="vertical-align:middle;margin-top:0px;margin-left:8px;" onclick="dojoOrderd.detailFloatCustomerData=querydata['+inRowIndex+'][17];dojoOrderd.detailCustomer('+querydata[inRowIndex][17][1]+','+inRowIndex+',17,0,event,0);"   >';} ,width: 10 }
			                                        ] ]
                           }]; 
						   
var layoutNoscroll=[ {
			noscroll: true,
			cells: [[
				 { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
				   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} }
		]]},{
          
 //fieldÖµÄ¬ÏµË³ò£¬´jsÐµtoArray×ªØµquerydateÈ¡
	   
				 cells: [ [
							//{name: 'Ñ¡', width: 3, get:getChoise},
						  // { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
						  // { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
      				  {name: i18nStr.customerOrderNo, field: 2,width: 8}
					       				,   {name: i18nStr.contractNo, field: 3,width: 8}
					       				,   {name: i18nStr.conveyanceEnum, field: 4,width: 8}
					       				,   {name: i18nStr.carryTypeEnum, field: 5,width: 8}
					       				,   {name: i18nStr.shipperRemark, field: 6,width: 8}
					       				,   {name: i18nStr.carrierRemark, field: 7,width: 8}
					       				,   {name: i18nStr.levelEnum, field: 8,width: 8}
					       				,   {name: i18nStr.customerTypeEnum, field: 9,width: 8}
					   		,   {name: i18nStr.referTime,field:10, width: 8}
		        				,   {name: i18nStr.linkMan, field: 11,width: 8}
					       				,   {name: i18nStr.tel, field: 12,width: 8}
					   		,   {name: i18nStr.bookTime,field:13, width: 8}
		    		,   {name: i18nStr.completeTime,field:14, width: 8}
		        			    ,   {name: i18nStr.remark, field: 15,width: 10 }
					 
//Úµð¾°¶
		//Úµð¾°¶
					 ,   {name: i18nStr.customer,field: 17,get:function(inRowIndex){ var str='';var strid;if(querydata[inRowIndex]!=undefined && querydata[inRowIndex][17]!=undefined && querydata[inRowIndex][17][2]){str=querydata[inRowIndex][17][2];strid=querydata[inRowIndex][17][1];} return str+'<img src="../image/detailFloat.jpg" height="16" width="16" style="vertical-align:middle;margin-top:0px;margin-left:8px;" onclick="dojoOrderd.detailFloatCustomerData=querydata['+inRowIndex+'][17];dojoOrderd.detailCustomer('+querydata[inRowIndex][17][1]+','+inRowIndex+',17,0,event,0);"   >';} ,width: 10 }
			                                        ] ]
                           }]; 
function pageStyle(style){//nomarl,col,noscroll
	grid.scrollToRow(0);
	if(style=="nomarl"){
		grid.setStructure(layoutSingleRow);
	}else if(style=="col"){
		grid.setStructure(layoutTwoRow);
	}else if(style=="noscroll"){
		grid.setStructure(layoutNoscroll);
	}
}						   
						   

//totleinum=15
  //rowinum=8
function getCheckOrderd(){}

var layoutTwoRow=[{
          
 //fieldÖµÄ¬ÏµË³ò£¬´jsÐµtoArray×ªØµquerydateÈ¡
	   
				 cells: [
                      [
						{ name: 'choise', width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },
						//{ name: i18nStr.detail, width: 3, get: getCheckOrderd, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
										  											  {name: i18nStr.customerOrderNo, field: 2 , width: 8 }
														  			//--------------  if (3 == 8)
														  											,   {name: i18nStr.contractNo, field: 3 , width: 8 }
														  			//--------------  if (4 == 8)
														  											,   {name: i18nStr.conveyanceEnum, field: 4 , width: 8 }
														  			//--------------  if (5 == 8)
														  											,   {name: i18nStr.carryTypeEnum, field: 5 , width: 8 }
														  			//--------------  if (6 == 8)
														  											,   {name: i18nStr.shipperRemark, field: 6 , width: 8 }
														  			//--------------  if (7 == 8)
														  											,   {name: i18nStr.carrierRemark, field: 7 , width: 8 }
														  			//--------------  if (8 == 8)
								//
												  																	,   {name: i18nStr.levelEnum, field: 8,width: 8}
																						  								]
												                     //----------------(inum:9)  (rowinum: 8)
									                     //----------------(inum:9)  (rowinum: 8)
									                     //----------------(inum:9)  (rowinum: 8)
									                     //----------------(inum:9)  (rowinum: 8)
									                     //----------------(inum:9)  (rowinum: 8)
									                     //----------------(inum:9)  (rowinum: 8)
									                     //----------------(inum:9)  (rowinum: 8)
									                     //----------------(inum:9)  (rowinum: 8)
								
	//
		  //(9 > 8)
						//
		  //(9 > 8)
							,[
	 //  22222222222inum= 2   inum2=9
																																												  													  {name: i18nStr.customerTypeEnum, field: 9,width: 8 }
																  														  					,   {name: i18nStr.referTime,field:10, width: 8}
								  														  													,   {name: i18nStr.linkMan, field: 11,width: 8 }
																  														  													,   {name: i18nStr.tel, field: 12,width: 8 }
																  														  					,   {name: i18nStr.bookTime,field:13, width: 8}
								  														  					,   {name: i18nStr.completeTime,field:14, width: 8}
								  														  													,   {name: i18nStr.remark, field: 15,width: 10 }
																  														
	//
											//
									 ,   {name: i18nStr.customer,field: 17,get:function(inRowIndex){ var str='';var strid;if(querydata[inRowIndex]!=undefined && querydata[inRowIndex][17]!=undefined && querydata[inRowIndex][17][1]!=undefined){str=querydata[inRowIndex][17][2];strid=querydata[inRowIndex][17][1];} return str+'<img src="../image/detailFloat.jpg" height="16" width="16" style="vertical-align:middle;margin-top:0px;margin-left:8px;" onclick="dojoOrderd.detailFloatCustomerData=querydata['+inRowIndex+'][17];dojoOrderd.detailCustomer('+querydata[inRowIndex][17][1]+','+inRowIndex+',17,0,event,0);"   >';} ,width: 10 }
										 	
			,   {name: ' ',value:' ' ,width: 10 }
		]]
                           }]; 						   
						   
						   

	 
function querybutton(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvo.id=0 ;
              queryvo=new Object();
	          if(querycustomerOrderNo.getDisplayedValue()!="")queryvo.customerOrderNo=querycustomerOrderNo.getDisplayedValue();//
	          if(querycontractNo.getDisplayedValue()!="")queryvo.contractNo=querycontractNo.getDisplayedValue();//
	          if(queryconveyanceEnum.getDisplayedValue()!="")queryvo.conveyanceEnum=queryconveyanceEnum.getDisplayedValue();//
	          if(querycarryTypeEnum.getDisplayedValue()!="")queryvo.carryTypeEnum=querycarryTypeEnum.getDisplayedValue();//
	          if(queryshipperRemark.getDisplayedValue()!="")queryvo.shipperRemark=queryshipperRemark.getDisplayedValue();//
	          if(querycarrierRemark.getDisplayedValue()!="")queryvo.carrierRemark=querycarrierRemark.getDisplayedValue();//
	          if(querylevelEnum.getDisplayedValue()!="")queryvo.levelEnum=querylevelEnum.getDisplayedValue();//
	          if(querycustomerTypeEnum.getDisplayedValue()!="")queryvo.customerTypeEnum=querycustomerTypeEnum.getDisplayedValue();//
              d=queryDate_fun("referTime");
              if(d==null){validstate=1;}else if(d.upSign!="%"){queryvo.referTime=d;}
	          if(querylinkMan.getDisplayedValue()!="")queryvo.linkMan=querylinkMan.getDisplayedValue();//
	          if(querytel.getDisplayedValue()!="")queryvo.tel=querytel.getDisplayedValue();//
              d=queryDate_fun("bookTime");
              if(d==null){validstate=1;}else if(d.upSign!="%"){queryvo.bookTime=d;}
              d=queryDate_fun("completeTime");
              if(d==null){validstate=1;}else if(d.upSign!="%"){queryvo.completeTime=d;}
	          if(queryremark.getDisplayedValue()!="")queryvo.remark=queryremark.getDisplayedValue();//
			
	var orderRowQuery= new Object();
	if(dojo.byId("queryorderRowForOrderdDiv")!=undefined && getQueryCondorderRowForOrderd(orderRowQuery)){
		queryvo.orderRow=orderRowQuery;
	}else if(queryorderRow.getDisplayedValue()!=""){
		//var prodCustQuery= new Object();
		//prodCustQuery.ProdName=queryprodCust.getDisplayedValue();
		orderRowQuery.id=queryorderRow.getValue();
		queryvo.orderRow=prodorderRow;
	}
	var customerQuery= new Object();
	if(dojo.byId("querycustomerForOrderdDiv")!=undefined && getQueryCondcustomerForOrderd(customerQuery)){
		queryvo.customer=customerQuery;
	}else if(querycustomer.getDisplayedValue()!=""){
		//var prodCustQuery= new Object();
		//prodCustQuery.ProdName=queryprodCust.getDisplayedValue();
		customerQuery.id=querycustomer.getValue();
		queryvo.customer=prodcustomer;
	}

			if(validstate==0){
              pagenumber=1;
              getVO(queryvo,pagenumber,pagesize,'0'); 
              //if(totalpage>1){dijit.byId("but7").setDisabled(false);}else{dijit.byId("but7").setDisabled(true);} 
             }      
}
	 
querydis = function(){
               querydisplay("queryDiv");
            }
 
 


function getVO(queryvo,pagenumber,pagesize,orderBy){
	
      var pu = new SOAPClientParameters2();
      pu.add('OrderdVO',queryvo) ;
      pu.add('pageNumber',pagenumber) ;
	    pu.add('pageSize',pagesize) ;
	    pu.add('orderBy',orderBy) ;
      SOAPClient.invoke(url,"getOrderd", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydata=new Array();
		   querydata=dojoOrderd.OrderdVOtoArray_fun(ul,false);
           totalCount=ul[ul.length-1]["ns:id"]; 
           //totalpage=Math.ceil(new Number(totalCount)/pagesize);
           //document.getElementById("rowCount").innerHTML=" "+pagenumber+" / "+totalpage+" / "+totalCount+" " ;
      }); 
      querydata.splice(querydata.length-1,1);
      model.setData(querydata);
      //dijit.byId("grid").updateRowCount(querydata.length); 
	   var totalpage=Math.ceil(new Number(totalCount)/pagesize);
	  
	if(totalpage>1){
		if(pagenumber==1){
			dijit.byId("but6").setDisabled(true);
			dijit.byId("but7").setDisabled(false);
		}else if(pagenumber==totalpage){
			dijit.byId("but6").setDisabled(false);
			dijit.byId("but7").setDisabled(true);
		}else{
			dijit.byId("but6").setDisabled(false);
			dijit.byId("but7").setDisabled(false);
		}
	}else{
		dijit.byId("but6").setDisabled(true);
		dijit.byId("but7").setDisabled(true);
	
	}
	if(pagesize==0){
		totalpage=1;
		dijit.byId("but6").setDisabled(true);
		dijit.byId("but7").setDisabled(true);
	}
	if(totalpage==1)pagenumber=1;
	
	 document.getElementById("rowCount").innerHTML=i18nStr.di+" "+pagenumber+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCount+" "+i18nStr.rowSize; 	
	  
	  
 }
 
function init(){
  getVO(queryvo,pagenumber,pagesize,'0');
  //if(totalpage>1)dijit.byId("but7").setDisabled(false);
  
 	dojo.connect(dijit.byId("grid"), "dodblclick", function(e){
	   if(document.getElementById('queryDiv').style.display=='')document.getElementById('queryDiv').style.display='none';
	   if(document.getElementById('addDiv').style.display=='none')document.getElementById('addDiv').style.display='';
		 document.getElementById('erowIndex').value=e.rowIndex;
		 document.getElementById('OrderdId').value=querydata[e.rowIndex][1];
		 	 									//enumeration Í¨StringÍ¬í£¿
				dijit.byId("addcustomerOrderNo").setValue(querydata[e.rowIndex][2]);
						 									//enumeration Í¨StringÍ¬í£¿
				dijit.byId("addcontractNo").setValue(querydata[e.rowIndex][3]);
						 									//enumeration Í¨StringÍ¬í£¿
				dijit.byId("addconveyanceEnum").setValue(querydata[e.rowIndex][4]);
						 									//enumeration Í¨StringÍ¬í£¿
				dijit.byId("addcarryTypeEnum").setValue(querydata[e.rowIndex][5]);
						 									//enumeration Í¨StringÍ¬í£¿
				dijit.byId("addshipperRemark").setValue(querydata[e.rowIndex][6]);
						 									//enumeration Í¨StringÍ¬í£¿
				dijit.byId("addcarrierRemark").setValue(querydata[e.rowIndex][7]);
						 									//enumeration Í¨StringÍ¬í£¿
				dijit.byId("addlevelEnum").setValue(querydata[e.rowIndex][8]);
						 									//enumeration Í¨StringÍ¬í£¿
				dijit.byId("addcustomerTypeEnum").setValue(querydata[e.rowIndex][9]);
						 									 dijit.byId("addreferTime").setValue(dojo.date.locale.parse(querydata[e.rowIndex][10],{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
				 dijit.byId("addreferTimeTime").setValue(dojo.date.locale.parse(querydata[e.rowIndex][10],{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
						 									//enumeration Í¨StringÍ¬í£¿
				dijit.byId("addlinkMan").setValue(querydata[e.rowIndex][11]);
						 									//enumeration Í¨StringÍ¬í£¿
				dijit.byId("addtel").setValue(querydata[e.rowIndex][12]);
						 									 dijit.byId("addbookTime").setValue(dojo.date.locale.parse(querydata[e.rowIndex][13],{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
				 dijit.byId("addbookTimeTime").setValue(dojo.date.locale.parse(querydata[e.rowIndex][13],{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
						 									 dijit.byId("addcompleteTime").setValue(dojo.date.locale.parse(querydata[e.rowIndex][14],{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
				 dijit.byId("addcompleteTimeTime").setValue(dojo.date.locale.parse(querydata[e.rowIndex][14],{datePattern: "yyyy-MM-dd",timePattern:"HH:mm" }));
						 									//enumeration Í¨StringÍ¬í£¿
				dijit.byId("addremark").setValue(querydata[e.rowIndex][15]);
						 			 
													dijit.byId("addcustomer").setValue(querydata[e.rowIndex][17][1]);
			//dijit.byId("addcustomer").setDisplayedValue('');
						});     
}

 dojo.addOnLoad(init);   

	function selectOrderRowdFun(rep){
		querydata[dojoOrderd.selectOrderRowdInRow][dojoOrderd.noOrderRowd]=rep;
		grid.updateRow(dojoOrderd.selectOrderRowdInRow);		
	}
	function selectCustomerFun(rep){
		querydata[dojoOrderd.selectCustomerInRow][dojoOrderd.noCustomer]=rep;
		grid.updateRow(dojoOrderd.selectCustomerInRow);		
	}
//addDiv---------------begin-------------------------------------
var addDivAdd = function(){
	 //if(document.getElementById('queryDiv').style.display=='')document.getElementById('queryDiv').style.display='none';
	 //if(document.getElementById('addDiv').style.display=='none')document.getElementById('addDiv').style.display='';
	 //add
										//enumeration Í¨StringÍ¬í£¿
				
									dijit.byId("addcustomerOrderNo").setValue('');
																			//enumeration Í¨StringÍ¬í£¿
				
									dijit.byId("addcontractNo").setValue('');
																			//enumeration Í¨StringÍ¬í£¿
				
									//dijit.byId("addconveyanceEnum").setValue('');
																			//enumeration Í¨StringÍ¬í£¿
				
									//dijit.byId("addcarryTypeEnum").setValue('');
																			//enumeration Í¨StringÍ¬í£¿
				
									dijit.byId("addshipperRemark").setValue('');
																			//enumeration Í¨StringÍ¬í£¿
				
									dijit.byId("addcarrierRemark").setValue('');
																			//enumeration Í¨StringÍ¬í£¿
				
									//dijit.byId("addlevelEnum").setValue('');
																			//enumeration Í¨StringÍ¬í£¿
				
									//dijit.byId("addcustomerTypeEnum").setValue('');
																			dijit.byId("addreferTime").setValue('');
				dijit.byId("addreferTimeTime").setValue('');
															//enumeration Í¨StringÍ¬í£¿
				
									dijit.byId("addlinkMan").setValue('');
																			//enumeration Í¨StringÍ¬í£¿
				
									dijit.byId("addtel").setValue('');
																			dijit.byId("addbookTime").setValue('');
				dijit.byId("addbookTimeTime").setValue('');
															dijit.byId("addcompleteTime").setValue('');
				dijit.byId("addcompleteTimeTime").setValue('');
															//enumeration Í¨StringÍ¬í£¿
				
									dijit.byId("addremark").setValue('');
														
								dijit.byId("addcustomer").setValue('');
	    dijit.byId("addcustomer").setDisplayedValue('');
				
	document.getElementById('OrderdId').value='0';
	//document.getElementById('referTimeAdd1').value=dojo.date.locale.format(new Date(),{ datePattern: "yyyy-MM-dd", selector: "date"});
	//document.getElementById('referTimeAdd2').value=dojo.date.locale.format(new Date(),{ timePattern: "HH:mm", selector: "time"});
} 
function addDivSave(){
	var padd = new SOAPClientParameters2();
	var vobject=new Object();
    vobject.id=document.getElementById('OrderdId').value;
	var passAll=0;
										//enumeration Í¨StringÍ¬í£¿
				if(dijit.byId("addcustomerOrderNo").validate(true)){
					vobject.customerOrderNo=dijit.byId("addcustomerOrderNo").getValue();
				}else{
					setErrorClass(dijit.byId("addcustomerOrderNo")); passAll=1;
				}
															//enumeration Í¨StringÍ¬í£¿
				if(dijit.byId("addcontractNo").validate(true)){
					vobject.contractNo=dijit.byId("addcontractNo").getValue();
				}else{
					setErrorClass(dijit.byId("addcontractNo")); passAll=1;
				}
															//enumeration Í¨StringÍ¬í£¿
				if(dijit.byId("addconveyanceEnum").validate(true)){
					vobject.conveyanceEnum=dijit.byId("addconveyanceEnum").getValue();
				}else{
					setErrorClass(dijit.byId("addconveyanceEnum")); passAll=1;
				}
															//enumeration Í¨StringÍ¬í£¿
				if(dijit.byId("addcarryTypeEnum").validate(true)){
					vobject.carryTypeEnum=dijit.byId("addcarryTypeEnum").getValue();
				}else{
					setErrorClass(dijit.byId("addcarryTypeEnum")); passAll=1;
				}
															//enumeration Í¨StringÍ¬í£¿
				if(dijit.byId("addshipperRemark").validate(true)){
					vobject.shipperRemark=dijit.byId("addshipperRemark").getValue();
				}else{
					setErrorClass(dijit.byId("addshipperRemark")); passAll=1;
				}
															//enumeration Í¨StringÍ¬í£¿
				if(dijit.byId("addcarrierRemark").validate(true)){
					vobject.carrierRemark=dijit.byId("addcarrierRemark").getValue();
				}else{
					setErrorClass(dijit.byId("addcarrierRemark")); passAll=1;
				}
															//enumeration Í¨StringÍ¬í£¿
				if(dijit.byId("addlevelEnum").validate(true)){
					vobject.levelEnum=dijit.byId("addlevelEnum").getValue();
				}else{
					setErrorClass(dijit.byId("addlevelEnum")); passAll=1;
				}
															//enumeration Í¨StringÍ¬í£¿
				if(dijit.byId("addcustomerTypeEnum").validate(true)){
					vobject.customerTypeEnum=dijit.byId("addcustomerTypeEnum").getValue();
				}else{
					setErrorClass(dijit.byId("addcustomerTypeEnum")); passAll=1;
				}
															if(dijit.byId("addreferTime").validate(true)){ 
					if(dijit.byId("addreferTime").getValue()!=''&&dijit.byId("addreferTime").getValue()!=undefined){	
					if(dijit.byId("addreferTimeTime").validate(true)){
						if(dijit.byId("addreferTimeTime").getValue()==''||dijit.byId("addreferTimeTime").getValue()==undefined)dijit.byId("addreferTimeTime").setValue(new Date(2000,1,1,0,0,0,0));
						var dreferTime=new DateTimeQuery();
						dreferTime.upDate=dojo.date.locale.format(dijit.byId("addreferTime").getValue(), dijit.byId("addreferTime").constraints)+" "+dojo.date.locale.format(dijit.byId("addreferTimeTime").getValue(), dijit.byId("addreferTimeTime").constraints);
						vobject.referTime=dreferTime;
					}else{setErrorClass(dijit.byId("addreferTimeTime")); passAll=1;}
				}}else{
					setErrorClass(dijit.byId("addreferTime")); passAll=1;}
															//enumeration Í¨StringÍ¬í£¿
				if(dijit.byId("addlinkMan").validate(true)){
					vobject.linkMan=dijit.byId("addlinkMan").getValue();
				}else{
					setErrorClass(dijit.byId("addlinkMan")); passAll=1;
				}
															//enumeration Í¨StringÍ¬í£¿
				if(dijit.byId("addtel").validate(true)){
					vobject.tel=dijit.byId("addtel").getValue();
				}else{
					setErrorClass(dijit.byId("addtel")); passAll=1;
				}
															if(dijit.byId("addbookTime").validate(true)){ 
					if(dijit.byId("addbookTime").getValue()!=''&&dijit.byId("addbookTime").getValue()!=undefined){	
					if(dijit.byId("addbookTimeTime").validate(true)){
						if(dijit.byId("addbookTimeTime").getValue()==''||dijit.byId("addbookTimeTime").getValue()==undefined)dijit.byId("addbookTimeTime").setValue(new Date(2000,1,1,0,0,0,0));
						var dbookTime=new DateTimeQuery();
						dbookTime.upDate=dojo.date.locale.format(dijit.byId("addbookTime").getValue(), dijit.byId("addbookTime").constraints)+" "+dojo.date.locale.format(dijit.byId("addbookTimeTime").getValue(), dijit.byId("addbookTimeTime").constraints);
						vobject.bookTime=dbookTime;
					}else{setErrorClass(dijit.byId("addbookTimeTime")); passAll=1;}
				}}else{
					setErrorClass(dijit.byId("addbookTime")); passAll=1;}
															if(dijit.byId("addcompleteTime").validate(true)){ 
					if(dijit.byId("addcompleteTime").getValue()!=''&&dijit.byId("addcompleteTime").getValue()!=undefined){	
					if(dijit.byId("addcompleteTimeTime").validate(true)){
						if(dijit.byId("addcompleteTimeTime").getValue()==''||dijit.byId("addcompleteTimeTime").getValue()==undefined)dijit.byId("addcompleteTimeTime").setValue(new Date(2000,1,1,0,0,0,0));
						var dcompleteTime=new DateTimeQuery();
						dcompleteTime.upDate=dojo.date.locale.format(dijit.byId("addcompleteTime").getValue(), dijit.byId("addcompleteTime").constraints)+" "+dojo.date.locale.format(dijit.byId("addcompleteTimeTime").getValue(), dijit.byId("addcompleteTimeTime").constraints);
						vobject.completeTime=dcompleteTime;
					}else{setErrorClass(dijit.byId("addcompleteTimeTime")); passAll=1;}
				}}else{
					setErrorClass(dijit.byId("addcompleteTime")); passAll=1;}
															//enumeration Í¨StringÍ¬í£¿
				if(dijit.byId("addremark").validate(true)){
					vobject.remark=dijit.byId("addremark").getValue();
				}else{
					setErrorClass(dijit.byId("addremark")); passAll=1;
				}
										
			if(dijit.byId("addcustomer").validate(true)){
		//vobject.customer=dijit.byId("addcustomer").getValue();
		var manageable=new Object();
		manageable.id=dijit.byId("addcustomer").getValue();
		vobject.customer=manageable;
	}else{
		setErrorClass(dijit.byId("addcustomer")); passAll=1;
	}
		
if(passAll==0){
		//var addrow='';
		var addrow=[];
														//addrow=addrow+","+vobject.customerOrderNo;
					addrow.push(vobject.customerOrderNo);
																					//addrow=addrow+","+vobject.contractNo;
					addrow.push(vobject.contractNo);
																					//addrow=addrow+","+vobject.conveyanceEnum;
					addrow.push(vobject.conveyanceEnum);
																					//addrow=addrow+","+vobject.carryTypeEnum;
					addrow.push(vobject.carryTypeEnum);
																					//addrow=addrow+","+vobject.shipperRemark;
					addrow.push(vobject.shipperRemark);
																					//addrow=addrow+","+vobject.carrierRemark;
					addrow.push(vobject.carrierRemark);
																					//addrow=addrow+","+vobject.levelEnum;
					addrow.push(vobject.levelEnum);
																					//addrow=addrow+","+vobject.customerTypeEnum;
					addrow.push(vobject.customerTypeEnum);
																					vobject.referTime?addrow.push(vobject.referTime.upDate):addrow.push('');
																					//addrow=addrow+","+vobject.linkMan;
					addrow.push(vobject.linkMan);
																					//addrow=addrow+","+vobject.tel;
					addrow.push(vobject.tel);
																					vobject.bookTime?addrow.push(vobject.bookTime.upDate):addrow.push('');
																					vobject.completeTime?addrow.push(vobject.completeTime.upDate):addrow.push('');
																					//addrow=addrow+","+vobject.remark;
					addrow.push(vobject.remark);
																						addrow.push([false,'','']);
											//addrow=addrow+","+CustomerVOtoArray_fun(vobject.customer,true);//addrow.push(CustomerVOtoArray_fun(vobject.customer,true));
			addrow.push([false,addcustomer.getValue(),addcustomer.getDisplayedValue()]);
						 if(vobject.id==0){//create new row
		padd.add('OrderdVO',vobject);
		SOAPClient.invoke(url, "createOrderd", padd, false,  function GetEnu_callBack(ul, soapResponse){
		//addrow='false,ul'+addrow;
		addrow.splice(0,0,false,ul);
				console.log("addrow.lenght:"+addrow.length);
				console.log("addrow:"+addrow);
		grid.addRow(addrow ,grid.model.getRowCount());//grid.addRow([addrow]);
		});
	 }else{//modify row
		padd.add('OrderdVO',vobject);
		SOAPClient.invoke(url, "updateOrderd", padd, false,  function GetEnu_callBack(ul, soapResponse){
		});
		//addrow='false,vobject.id'+addrow;
		addrow.splice(0,0,false,vobject.id);
		querydata[document.getElementById('erowIndex').value]=addrow;//[addrow];
		grid.updateRow(document.getElementById('erowIndex').value);
	 }
}   }

 function addDivRemove(){
     if(window.confirm(i18nStr.deleteConfirm)){
        //var s = dijit.byId("grid").selection.getSelected();
		var s = dijit.byId("grid").rowCount;
        //for(var i=0;i<s.length;i++){ 
              //var ii=s[i];
			  var ii=s.length;
              var si=document.getElementById('erowIndex').value;
              var pdel = new SOAPClientParameters();      
               //pdel.add('id',querydata[ii][1]);
			   pdel.add('id',si);
               SOAPClient.invoke(url, "deleteOrderd", pdel, false,  function GetEnu_callBack(ul, soapResponse){
               if(si>ii){
					if(si-1>=0){document.getElementById('erowIndex').value=si-1;}//else{document.getElementById('erowIndex').value='';}//????????????????????????????????//
               }
			   totalCount--;
               var totalpage=Math.ceil(new Number(totalCount)/pagesize);
               document.getElementById("rowCount").innerHTML = i18nStr.di+" "+pagenumber+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCount+" "+i18nStr.rowSize; 	
               if(si=ii){if(document.getElementById('addDiv').style.display=='')document.getElementById('addDiv').style.display='none';}
	        });   
          //}             
           dijit.byId("grid").removeSelectedRows();
      }
 }    
 
function adddis(){
	
	querydisplay("addDiv");
	if(document.getElementById('addDiv').style.display!='none')addDivAdd();
} 
//addDiv---------------end---------------------------------------	 
//totleinum=15
 //rowinum=5
 //addHeight=200
</script>
</head>	 
<body class="tundra">
	<div id="addDiv" style="margin:25px 0px 20px 0px;  height:200px; display:none;" >
		<div  class="titleDiv"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font i18n="addNote">add</font></div>
              <table align="center" width="100%" id="0" class="editorTable"  >
                <tr >
				<td align="center" style="{width:11%}">&nbsp;</td>
                <td style="{width:22%}" ><input id="OrderdId" style="{display:none}"  type="text"  /></td>
                <td style="{width:11%}"><input id="erowIndex" style="{display:none}"  type="text"  /></td>
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
										<input type="text" class="editerInput"  id="addcustomerOrderNo"  jsId="addcustomerOrderNo"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
					<td align="right" i18n="contractNo" >contractNo:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addcontractNo"  jsId="addcontractNo"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
					<td align="right" i18n="conveyanceEnum" >conveyanceEnum:</td>
			<td align="left"  >
									<input  id="addconveyanceEnum"  jsId="addconveyanceEnum" class="editerInput"  dojoType="dijit.form.myFilteringSelect" store="dojoOrderd.conveyanceEnumStore" required="true" />
							</td>
		</tr>	
                <tr>
				<td align="right" i18n="carryTypeEnum" >carryTypeEnum:</td>
			<td align="left"  >
									<input  id="addcarryTypeEnum"  jsId="addcarryTypeEnum" class="editerInput"  dojoType="dijit.form.myFilteringSelect" store="dojoOrderd.carryTypeEnumStore" required="false" />
							</td>
					<td align="right" i18n="shipperRemark" >shipperRemark:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addshipperRemark"  jsId="addshipperRemark"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
					<td align="right" i18n="carrierRemark" >carrierRemark:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addcarrierRemark"  jsId="addcarrierRemark"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
		</tr>	
                <tr>
				<td align="right" i18n="levelEnum" >levelEnum:</td>
			<td align="left"  >
									<input  id="addlevelEnum"  jsId="addlevelEnum" class="editerInput"  dojoType="dijit.form.myFilteringSelect" store="dojoOrderd.levelEnumStore" required="false" />
							</td>
					<td align="right" i18n="customerTypeEnum" >customerTypeEnum:</td>
			<td align="left"  >
									<input  id="addcustomerTypeEnum"  jsId="addcustomerTypeEnum" class="editerInput"  dojoType="dijit.form.myFilteringSelect" store="dojoOrderd.customerTypeEnumStore" required="false" />
							</td>
					<td align="right" i18n="referTime"  >referTime:</td> 
			<td align="left" >
				<input class="addDate"   jsId="addreferTime" id="addreferTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox" required="false" />
				<input class="addTime" jsId="addreferTimeTime" id="addreferTimeTime"  dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}" >
			</td>
		</tr>	
                <tr>
				<td align="right" i18n="linkMan" >linkMan:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addlinkMan"  jsId="addlinkMan"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
					<td align="right" i18n="tel" >tel:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addtel"  jsId="addtel"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
					<td align="right" i18n="bookTime"  >bookTime:</td> 
			<td align="left" >
				<input class="addDate"   jsId="addbookTime" id="addbookTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox" required="true" />
				<input class="addTime" jsId="addbookTimeTime" id="addbookTimeTime"  dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}" >
			</td>
		</tr>	
                <tr>
				<td align="right" i18n="completeTime"  >completeTime:</td> 
			<td align="left" >
				<input class="addDate"   jsId="addcompleteTime" id="addcompleteTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox" required="false" />
				<input class="addTime" jsId="addcompleteTimeTime" id="addcompleteTimeTime"  dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"  >
			</td>
					<td align="right" i18n="remark" >remark:</td>
			<td align="left"  >
										<input type="text" class="editerInput"  id="addremark"  jsId="addremark"   dojoType="dijit.form.ValidationTextBox" required="false" />
							</td>
	
 <!--//if (3==1)     
//   /tr
//end

//set ($inume =1) -->
												<td align="right"  i18n="customer"  ></td>
					<td align="left" ><input  id="addcustomer"  jsId="addcustomer" class="editerInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrderd.customerStore" onchange="customerSet(0,arguments[0]);" required="true" /></td>
					</tr>
						 <tr align="center"><td></td>
           <td colspan="5"><button dojoType="dijit.form.Button" onclick="addDivAdd();" iconClass="addIcon"  i18n="add" >add</button>
				<button dojoType="dijit.form.Button" onclick="addDivRemove();" iconClass="delIcon"  i18n="delete" >remove</button>
				<button dojoType="dijit.form.Button" onclick="addDivSave();" iconClass="saveIcon"   i18n="save">save</button></td>
           <td colspan="2"></td></tr>
</table></div>
<div id="queryDiv" style="margin:25px 0px 20px 0px; height: 200px; display:none;" >
 <div  class="titleDiv"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font i18n="queryNote"></font></div>
  <table align="center" width=100% class="queryTable"  >
	<tr >
	<td align="center" style="{width:11%}"  >&nbsp;</td>
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
						
															<input type="text" class="editerInput"  id="querycustomerOrderNo"  jsId="querycustomerOrderNo"   dojoType="dijit.form.TextBox"  />
													</td>
														<td align="right"  i18n="contractNo" >contractNo:</td>
						<td align="left"  colspan="3" >
													<input type="text" class="editerInput"  id="querycontractNo"  jsId="querycontractNo"   dojoType="dijit.form.TextBox"  />
												</td>  
													<td align="right"  i18n="conveyanceEnum" >conveyanceEnum:</td>
						<td align="left"  >
													<input  id="queryconveyanceEnum" jsId="queryconveyanceEnum" class="editerInput"  dojoType="dijit.form.FilteringSelect" store="dojoOrderd.conveyanceEnumStore" />
												</td>  
										  </tr>
			                <tr>
							<td align="right" i18n="carryTypeEnum" >carryTypeEnum:</td>
						<td align="left"  >
						
														<input  id="querycarryTypeEnum"  jsId="querycarryTypeEnum" class="editerInput"  dojoType="dijit.form.FilteringSelect" store="dojoOrderd.carryTypeEnumStore" />
													</td>
														<td align="right"  i18n="shipperRemark" >shipperRemark:</td>
						<td align="left"  colspan="3" >
													<input type="text" class="editerInput"  id="queryshipperRemark"  jsId="queryshipperRemark"   dojoType="dijit.form.TextBox"  />
												</td>  
													<td align="right"  i18n="carrierRemark" >carrierRemark:</td>
						<td align="left"  >
													<input type="text" class="editerInput"  id="querycarrierRemark"  jsId="querycarrierRemark"   dojoType="dijit.form.TextBox"  />
												</td>  
										  </tr>
			                <tr>
							<td align="right" i18n="levelEnum" >levelEnum:</td>
						<td align="left"  >
						
														<input  id="querylevelEnum"  jsId="querylevelEnum" class="editerInput"  dojoType="dijit.form.FilteringSelect" store="dojoOrderd.levelEnumStore" />
													</td>
														<td align="right"  i18n="customerTypeEnum" >customerTypeEnum:</td>
						<td align="left"  colspan="3" >
												<input  id="querycustomerTypeEnum" jsId="querycustomerTypeEnum" class="editerInput"  dojoType="dijit.form.FilteringSelect" store="dojoOrderd.customerTypeEnumStore" />
												</td>  
											<td align="right"  > </td>
						<td align="right"  ></td>
					</tr><tr >
						<td align="right"  i18n="referTime" >referTime:</td>
						<td align="left"  colspan="3"><span id="queryreferTimeImg0"  ><input class="addDate"   jsId="queryreferTime" id="queryreferTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="addTime" jsId="queryreferTimeTime" id="queryreferTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span id="queryreferTimeImg1" style="{display:none}" ><input class="editerDateSmaller"   jsId="query1referTime" id="query1referTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query1referTimeTime" id="query1referTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryreferTimeImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryreferTimeImgdown" >></span>
							<span id="queryreferTimeImg2div" style="{display:none}"><input class="editerDateSmaller"   jsId="query2referTime" id="query2referTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query2referTimeTime" id="query2referTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="queryreferTimeImg" class="imgStyle">
							
						</td>
															<td align="right" colspan="2" ></td>
						<td align="right"  i18n="linkMan" >linkMan:</td>
						<td align="left"  >
							 								<input type="text" class="editerInput"  id="querylinkMan"  jsId="querylinkMan"   dojoType="dijit.form.TextBox"  />  
													</td></tr>
					                <tr>
							<td align="right" i18n="tel" >tel:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="querytel"  jsId="querytel"   dojoType="dijit.form.TextBox"  />
													</td>
																<td align="right"  i18n="bookTime" >bookTime:</td>
						<td align="left"   colspan="5"><span id="querybookTimeImg0"  ><input class="addDate"   jsId="querybookTime" id="querybookTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="addTime" jsId="querybookTimeTime" id="querybookTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span id="querybookTimeImg1" style="{display:none}" ><input class="editerDateSmall"   jsId="query1bookTime" id="query1bookTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmall" jsId="query1bookTimeTime" id="query1bookTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="querybookTimeImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="querybookTimeImgdown" >></span>
							<span id="querybookTimeImg2div" style="{display:none}"><input class="editerDateSmall"   jsId="query2bookTime" id="query2bookTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmall" jsId="query2bookTimeTime" id="query2bookTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="querybookTimeImg" class="imgStyle">
						</td></tr>
			                <tr>
							<td align="right" i18n="completeTime"  >completeTime:</td> 
						<td align="left"  colspan="3"><span id="querycompleteTimeImg0"  ><input class="addDate"   jsId="querycompleteTime" id="querycompleteTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="addTime" jsId="querycompleteTimeTime" id="querycompleteTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span id="querycompleteTimeImg1" style="{display:none}" ><input class="editerDateSmaller"   jsId="query1completeTime" id="query1completeTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query1completeTimeTime" id="query1completeTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="querycompleteTimeImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="querycompleteTimeImgdown" >></span>
							<span id="querycompleteTimeImg2div" style="{display:none}"><input class="editerDateSmaller"   jsId="query2completeTime" id="query2completeTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query2completeTimeTime" id="query2completeTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="querycompleteTimeImg" class="imgStyle">
						</td>
													<td align="right" colspan="2" ></td>
						<td align="right"  i18n="remark" >remark:</td>
						<td align="left"  >
							 								<input type="text" class="editerInput"  id="queryremark"  jsId="queryremark"   dojoType="dijit.form.TextBox"  />  
													</td></tr>
					<!--
//if (!="over" && 1!=1)     
/tr
//end 
//set ($inume =1) -->
			
					<tr><td align="right"  i18n="orderRow"  ></td>
					<td align="left" ><table class="innerTable">
							<tr>
								<td><input  id="queryorderRow"  jsId="queryorderRow" class="selectInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrderd.orderRowStore"  /></td><td align="left" ><div dojoType="dijit.form.myDropDownButton" iconClass="dialogIcon" class="downButtonStyle"  ><div dojoType="dijit.TooltipDialog"  href="../common/queryorderRowForOrderdFloat.html"title="detail" execute="" ></div></div></td>
							</tr>
						</table></td>  
					
				
					<td align="right"  i18n="customer"  ></td>
					<td align="left" colspan="3"  ><!----><table class="innerTable">
							<tr>
								<td   ><input  id="querycustomer"  jsId="querycustomer" class="selectInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrderd.customerStore"  /></td><td align="left" ><div dojoType="dijit.form.myDropDownButton" iconClass="dialogIcon" class="downButtonStyle"  ><div dojoType="dijit.TooltipDialog"  href="../common/querycustomerForOrderdFloat.html"title="detail" execute="" ></div></div>
					</td>
							</tr>
						</table></td>  
					
	    <td align="right"    ></td><td align="right"    ></td></tr>

          <tr align="center"><td ></td>
           <td colspan="3"></td><td colspan="3" align="left"> <button dojoType="dijit.form.Button" onclick="querybutton();" iconClass="queryIcon"  i18n="query" >query</button>&nbsp;&nbsp;&nbsp;
           <button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="2"></td></tr>
         </table>
	     </div>
<table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   Orderd List</b></td>
		<td align="right" >
				<button dojoType="dijit.form.Button" onclick="adddis();" iconClass="openDivIcon"  i18n="edit" >openAdd</button>&nbsp;
				<button dojoType="dijit.form.Button" onclick="querydis();" iconClass="openQueryIcon"  i18n="openQuery" >query</button>
				<span id="rowCount"></span>
	  <button dojoType="dijit.form.myButton" onclick="upPage();"  id="but6" disabled='true' jsId="but6" iconClass="upPageIcon" ></button>
        <button dojoType="dijit.form.myButton" onclick="downPage();" id="but7" disabled='true' jsId="but7" iconClass="downPageIcon" ></button>
        <div id="668" dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
  			  <div dojoType="dijit.Menu">
				  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChange(this.label);"></div>
				  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChange(this.label);"></div>
		      <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChange(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChange(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpage();"></div>
		      </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
        </div>
				    <div id="669" dojoType="dijit.form.myDropDownButton" iconClass="pageStyleIcon"><span>pageStyle</span>
  			   <div dojoType="dijit.Menu">
  				 <div dojoType="dijit.MenuItem"  iconClass="rowIcon"		label="normal"	onClick="pageStyle(this.label);"></div>
  				 <div dojoType="dijit.MenuItem"  iconClass="colIcon"		label="col"	onClick="pageStyle(this.label);"></div>
				 <div dojoType="dijit.MenuItem"  iconClass="colIcon"		label="noscroll"	onClick="pageStyle(this.label);"></div>
		    </div></div>
			          	     <!--button dojoType="dijit.form.Button" onclick="addRow();" iconClass="addIcon" i18n="add" >add</button-->
					 <!--button dojoType="dijit.form.Button" onclick="addDivAdd();" iconClass="addIcon"  >add</button-->
	                 <!--button dojoType="dijit.form.Button" onclick="removeSelectedRowsGrid();" iconClass="delIcon" i18n="delete" >delete</button>
	                 <button dojoType="dijit.form.Button" id="but3" jsId="but3" onclick="call_funUpd();" i18n="save" iconClass="saveIcon">save</button-->
		</td>
	</tr>
</table>    
	    <div style="{height:90%;width:100%}"  >
	         <div id="grid"  dojoType="dojox.Grid" autoWidth="false"  jsId="grid"	model="model"  structure="layoutSingleRow" singleClickEdit="true" ></div>
      </div>      
    
			  
</body>
<script type="text/javascript">trans18tag();</script>
</html>		 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
