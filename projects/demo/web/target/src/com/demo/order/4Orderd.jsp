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
			@import "../dojo/dojo-release-1.0.0/dojox/layout/resources/ExpandoPane.css"; 
      </style>
      <script type="text/javascript" src="../dojo/dojo-release-1.0.0/dojo/dojo.js"  
                djConfig="parseOnLoad: true, isDebug: true,locale: 'zh-cn', extraLocale: ['zh-TW', 'fr']"></script>
      <script>
    
            dojo.require("dojo.data.ItemFileWriteStore");
            dojo.require("dojo.parser");
            dojo.require("dijit.form.Button");
			dojo.require("dijit.Tree");
			dojo.require("dojox.layout.FloatingPane");
			dojo.require("dijit.layout.TabContainer");
			dojo.require("dijit.layout.BorderContainer");
			dojo.require("dijit.layout.ContentPane");
			dojo.require("dojox.layout.ExpandoPane");
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
			dojo.require("dijit.Dialog");
            dojo.registerModulePath("mydojo", "../../../js/mydojo");
            dojo.require("mydojo.FilteringSelect");
            dojo.require("mydojo.ValidationTextBox");
            dojo.require("mydojo.NumberTextBox");
			dojo.registerModulePath("projectDojo", "../../../dojo/projectDojo");
			dojo.require("projectDojo.Orderd");

	//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
				//OrderRowd==OrderRowd---false
										//Customer==OrderRowd---false
									

     </script>
		        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 
 			<script type="text/javascript" src="../order/order2orderRowCrudAFTab.js"></script>
	 	  

 
 			<script type="text/javascript" src="orderRow.js"></script><!--sub Table script    eg:taskRow.js    Ð¶Ç·Îªí£¬Ò³Ê¼Ó±childRow=0-->
			<script type="text/javascript" >
	  var dojoOrderd= new  projectDojo.Orderd();
	  dojoOrderd.initOrderd();
	//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
				//OrderRowd==OrderRowd---false
										//Customer==OrderRowd---false
										  
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

//begin-----Ð¶Ç·Ó±í£¨Ç·Îªí£©-------------------------------------------------------------------------------------------	  

//end-----Ð¶Ç·Ó±í£¨Ç·Îª)-------------------------------------------------------------------------------------------

//begin-------Ê¾Ñ¯Ð±í£¬Í·,Ó´floatÚµÍ¼------------------------------------------------------------------------------------
 //Ð¶Ï±Ö¶Ç·1212ÉµlayoutÛµlayoutstructure  (Ú²Ñ¯layoutenumerationÖ¶Î²â´¦í£©!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
																																 
	var layoutSingleRowQuery=[{
		//fieldÖµÄ¬ÏµË³í©í¼´jsÐµtoArray×ªØµquerydateÈ¡
	    cells: [ [

                { name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
				  				  {name: i18nStr.customerOrderNo, field: 2,width: 10}
						  						  				,   {name: i18nStr.contractNo, field: 3,width: 10}
						  						  				,   {name: i18nStr.conveyanceEnum, field: 4,width: 10}
						  						  				,   {name: i18nStr.carryTypeEnum, field: 5,width: 10}
						  						  				,   {name: i18nStr.shipperRemark, field: 6,width: 10}
						  						  				,   {name: i18nStr.carrierRemark, field: 7,width: 10}
						  						  				,   {name: i18nStr.levelEnum, field: 8,width: 10}
						  						  				,   {name: i18nStr.customerTypeEnum, field: 9,width: 10}
						  						  				,   {name: i18nStr.referTime,field:10, width: 8}
						  						  				,   {name: i18nStr.linkMan, field: 11,width: 10}
						  						  				,   {name: i18nStr.tel, field: 12,width: 10}
						  						  				,   {name: i18nStr.bookTime,field:13, width: 8}
						  						  				,   {name: i18nStr.completeTime,field:14, width: 8}
						  						  				,   {name: i18nStr.remark, field: 15,width: 10}
						  				
//Ú¿Þ¸Äµlayout(org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[orderRow] in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[orderRow], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[customer]])if(!true)  Ö¶Ó¦FloatÑ¡í¦í°¿Ú´
		//Ú¿Þ¸Äµlayout(org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[customer] in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[orderRow], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[customer]])if(!false)  Ö¶Ó¦FloatÑ¡í¦í°¿Ú´
				 ,   {name: i18nStr.customer,field: 17,get:function(inRowIndex){ var str='';if(querydataOrderd[inRowIndex]!=undefined && querydataOrderd[inRowIndex][17]!=undefined){str=querydataOrderd[inRowIndex][17][2];} return str;} ,width: 10 }
									]]}];	 

					
var layoutNoscroll=[ {
			noscroll: true,
			cells: [[
				// { name: i18nStr.chose, width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },//
				   { name: i18nStr.no, width: 3, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} }
		]]},{
          
 //field??????jsÐµtoArray??querydate?
	   
				 cells: [ [
							//{name: '?', width: 3, get:getChoise},
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
					 
//???
		//???
					 ,   {name: i18nStr.customer,field: 17,get:function(inRowIndex){ var str='';var strid;if(querydataOrderd[inRowIndex]!=undefined && querydataOrderd[inRowIndex][17]!=undefined && querydataOrderd[inRowIndex][17][2]){str=querydataOrderd[inRowIndex][17][2];strid=querydataOrderd[inRowIndex][17][1];} return str;} ,width: 10 }
			                                        ] ]
                           }]; 
function pageStyleOrderd(style){//nomarl,col,noscroll
	gridOrderd.scrollToRow(0);
	if(style=="nomarl"){
		gridOrderd.setStructure(layoutSingleRowQuery);
	}else if(style=="col"){
		gridOrderd.setStructure(layoutTwoRow);
	}else if(style=="noscroll"){
		gridOrderd.setStructure(layoutNoscroll);
	}
}						   
						   

//totleinum=15
  //rowinum=8
function getCheckOrderd(){}

var layoutTwoRow=[{
          
 //field??????jsÐµtoArray??querydate?
	   
				 cells: [
                      [
						//{ name: 'choise', width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },
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
									 ,   {name: i18nStr.customer,field: 17,get:function(inRowIndex){ var str='';var strid;if(querydataOrderd[inRowIndex]!=undefined && querydataOrderd[inRowIndex][17]!=undefined && querydataOrderd[inRowIndex][17][1]!=undefined){str=querydataOrderd[inRowIndex][17][2];strid=querydataOrderd[inRowIndex][17][1];} return str;} ,width: 10 }
										 	
			,   {name: ' ',value:' ' ,width: 10 }
		]]
                           }]; 						   
						   
						   
					
					
					
//end-------Ê¾Ñ¯Ð±í£¬Í·,Ó´floatÚµÍ¼------------------------------------------------------------------------------------

/*	dojo.connect(dijit.byId("OrderdAFTab"), "selectChild", function(e){
			if (dijit.byId("OrderdAFTab").selectedChildWidget.id=="order2orderRow"){
			buildorder2orderRow();
					}
		}); */
function myOnLoad(){
	clickRowTab();
}	

function resetNU(trueTab){
						NUorder2orderRow=true;
						}
function clickRowTab(){
							buildorder2orderRow();
						}
				
var mainID;
var mainName;



function getVOOrderd(queryvo){
	var totalCount=0;
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
      modelOrderd.setData(querydataOrderd);
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
var connecthandle=0 ;
var handle ;
function gridResize(){
			if(gridorder2orderRow!=undefined)gridorder2orderRow.resize({h: dijit.byId("bottomPane").domNode.clientHeight-90});
	 	 		gridOrderd.resize({h:document.body.clientHeight-dijit.byId("bottomPane").domNode.clientHeight-36});
}		
function init(){
  getVOOrderd(queryvoOrderd);
  var m = dijit.byId("bottomPane"); 
  if(m._showing)m.toggle();
  
setTimeout(function(){
	gridOrderd.resize({h: document.body.clientHeight-86});
		dojo.connect(dijit.byId("bottomPane"), "_showEnd", function(e){
		if(connecthandle==0){
			handle=dojo.connect(dijit.byId("gridOrderd"), "doclick", function(e){
				mainID=querydataOrderd[e.rowIndex][1];
				mainName = querydataOrderd[e.rowIndex][2];
				resetNU();
				clickRowTab();		
			});
			connecthandle=1;
		}
		gridResize();
	  });
	  dojo.connect(dijit.byId("bottomPane"), "_hideEnd", function(e){
	  gridResize();
		if(connecthandle==1){
			dojo.disconnect(handle);
			connecthandle=0;
		}
	  });	
	  
	   dojo.connect(dijit.byId("bottomPane"), "_afterResize", function(e){
			gridResize();
	  }); 
	  
	},0);
  
}

 dojo.addOnLoad(init);   
function querybuttonOrderd(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvoOrderd.id=0 ;
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
				var OrderdorderRowQuery= new Object();
				//orderRowQuery.OrderdName=queryorderRow.getDisplayedValue();
				OrderdorderRowQuery.id=queryOrderdorderRow.getValue();
				queryvoOrderd.orderRow=OrderdorderRowQuery;
			  }
	if(queryOrderdcustomer.getDisplayedValue()!=""){
				var OrderdcustomerQuery= new Object();
				//customerQuery.OrderdName=querycustomer.getDisplayedValue();
				OrderdcustomerQuery.id=queryOrderdcustomer.getValue();
				queryvoOrderd.customer=OrderdcustomerQuery;
			  }

			if(validstate==0){
              pagenumber=1;
			  getVOOrderd(queryvoOrderd);
              //getVO(queryvoOrderd,pagenumber,pagesize,'0'); 
              //if(totalpage>1){dijit.byId("but7").setDisabled(false);}else{dijit.byId("but7").setDisabled(true);} 
             }      
       }

function pageSizeChangeOrderd(mylabel){
	pagesizeOrderd=mylabel;
	pagenumberOrderd=1;
	getVOOrderd(queryvoOrderd);
}

function allpageOrderd(){
	pagesizeOrderd=0;
	getVOOrderd(queryvoOrderd);
}

function upPageOrderd(){
	pagenumberOrderd--;
	getVOOrderd(queryvoOrderd);
}
function downPageOrderd(){
	pagenumberOrderd++;
	getVOOrderd(queryvoOrderd);
}
//totleinum=15
 //rowinum=5


</script>
</head>
<body class="tundra">
<div id="bc" style="width:100%; height:100%;" dojoType="dijit.layout.BorderContainer">
<div dojoType="dijit.layout.ContentPane"  title="" region="center" id="topPane" 	 >
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

				<button dojoType="dijit.form.Button" onclick="querydisplay('queryDivOrderd');" iconClass="openQueryIcon"  i18n="openQuery" >query</button>
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
						<div dojoType="dijit.form.myDropDownButton" iconClass="pageStyleIcon"><span>pageStyle</span>
						   <div dojoType="dijit.Menu">
							 <div dojoType="dijit.MenuItem"  iconClass="rowIcon"		label="normal"	onClick="pageStyleOrderd(this.label);"></div>
							 <div dojoType="dijit.MenuItem"  iconClass="colIcon"		label="col"	onClick="pageStyleOrderd(this.label);"></div>
							 <div dojoType="dijit.MenuItem"  iconClass="colIcon"		label="noscroll"	onClick="pageStyleOrderd(this.label);"></div>
						</div></div>
		</td>
	</tr>
</table>	       	
       <div id="gridOrderd"  dojoType="dojox.Grid" autoWidth="false"  jsId="gridOrderd"	model="modelOrderd"  structure="layoutSingleRowQuery"  ></div>
    </div>  
	<div dojoType="dojox.layout.ExpandoPane" splitter="true" duration="125" region="bottom" title="relative data" style="height:375px;" onLoad="myOnLoad" id="bottomPane" jsId="bottomPane" >
		<table   style=" position:absolute;top:0px; width:90%">
	<tr height="25px" width="100%">
		
							<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   order2orderRow List</b></td>
			<td align="right" >
						<span id="rowCountorder2orderRow"></span>&nbsp;&nbsp;
						<button dojoType="dijit.form.myButton" onclick="upPageorder2orderRow();"  id="but6order2orderRow" disabled='true' jsId="but6order2orderRow" iconClass="upPageIcon" >pageup</button>
						<button dojoType="dijit.form.myButton" onclick="downPageorder2orderRow();" id="but7order2orderRow" disabled='true' jsId="but7order2orderRow" iconClass="downPageIcon" >pagedown</button>
																																																																																																																																																																																																										<button dojoType="dijit.form.Button" onclick="addRoworder2orderRow();" iconClass="addIcon" >add</button>
					<button dojoType="dijit.form.Button" onclick="removeorder2orderRow();" iconClass="delIcon" >delete</button>
					<button dojoType="dijit.form.Button" id="but3order2orderRow" jsId="but3order2orderRow" onclick="call_funUpdorder2orderRow();"  iconClass="saveIcon">save</button>
								</td>
		</tr>
	</table>			
					<div id="gridorder2orderRow" dojoType="dojox.Grid" autoWidth="false"  jsId="gridorder2orderRow"	model="modelorder2orderRow"  structure="layoutorder2orderRow"  ></div>
				
								</div> 
</div>	
</body>
<script type="text/javascript">trans18tag();</script>
</html>
 