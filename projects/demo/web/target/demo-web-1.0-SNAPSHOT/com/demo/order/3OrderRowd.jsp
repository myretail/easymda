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
			dojo.require("projectDojo.OrderRowd");

			//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
				//Orderd==OrderRowTask---false
							//Prod==OrderRowTask---false
																	dojo.require("projectDojo.OrderRowTask");
							//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
				//Orderd==Payment---false
							//Prod==Payment---false
																	dojo.require("projectDojo.Payment");
						

     </script>
		        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 
 	 	 			<script type="text/javascript" src="../order/orderRow2orderRowTasksAFTab.js"></script><!--org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityLogicImpl[OrderRowTask]-->
	 			<script type="text/javascript" src="../order/payment2paymentsAFTab.js"></script><!--org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityLogicImpl[Payment]-->
	  

 
 			<script type="text/javascript" >
	  var dojoOrderRowd= new  projectDojo.OrderRowd();
	  dojoOrderRowd.initOrderRowd();
			//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
				//Orderd==OrderRowTask---false
							//Prod==OrderRowTask---false
										
							 var dojoOrderRowTask= new  projectDojo.OrderRowTask();
				dojoOrderRowTask.initOrderRowTask();
							//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
				//Orderd==Payment---false
							//Prod==Payment---false
										
							 var dojoPayment= new  projectDojo.Payment();
				dojoPayment.initPayment();
							  
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
	  //var urle = getUrl()+ "services/BasicManageService";    
//begin-----Ð¶Ç·Ó±í£¨Ç·Îªí£©-------------------------------------------------------------------------------------------	  

//end-----Ð¶Ç·Ó±í£¨Ç·Îª)-------------------------------------------------------------------------------------------

//begin-------Ê¾Ñ¯Ð±í£¬Í·,Ó´floatÚµÍ¼------------------------------------------------------------------------------------
 //Ð¶Ï±Ö¶Ç·1212ÉµlayoutÛµlayoutstructure  (Ú²Ñ¯layoutenumerationÖ¶Î²â´¦í£©!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
																									 
	var layoutSingleRowQuery=[{
		//fieldÖµÄ¬ÏµË³í©í¼´jsÐµtoArray×ªØµquerydateÈ¡
	    cells: [ [

                { name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
				  				  {name: i18nStr.productNum,field:2, width: 8}
						  						  				 ,  {name: i18nStr.unitNum,field:3, width: 8}
						  						  				 ,  {name: i18nStr.goodsSuttle,field:4, width: 8}
						  						  				 ,  {name: i18nStr.goodsWeight,field:5, width: 8}
						  						  				 ,  {name: i18nStr.goodsVolume,field:6, width: 8}
						  						  				,   {name: i18nStr.label, field: 7,width: 10}
						  						  				 ,  {name: i18nStr.carriage,field:8, width: 8}
						  						  				,   {name: i18nStr.especial, field: 9,width: 10}
						  						  				,   {name: i18nStr.goodsState, field: 10,width: 10}
						  						  				,   {name: i18nStr.remark, field: 11,width: 10}
						  				
//Ú¿Þ¸Äµlayout(org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[order] in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[order], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[product]])if(!false)  Ö¶Ó¦FloatÑ¡í¦í°¿Ú´
				 ,   {name: i18nStr.order,field: 12,get:function(inRowIndex){ var str='';if(querydataOrderRowd[inRowIndex]!=undefined && querydataOrderRowd[inRowIndex][12]!=undefined){str=querydataOrderRowd[inRowIndex][12][2];} return str;} ,width: 10 }
				//Ú¿Þ¸Äµlayout(org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[product] in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[order], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[product]])if(!false)  Ö¶Ó¦FloatÑ¡í¦í°¿Ú´
				 ,   {name: i18nStr.product,field: 13,get:function(inRowIndex){ var str='';if(querydataOrderRowd[inRowIndex]!=undefined && querydataOrderRowd[inRowIndex][13]!=undefined){str=querydataOrderRowd[inRowIndex][13][2];} return str;} ,width: 10 }
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
            {name: i18nStr.productNum,field:2, width: 8 }
		             ,  {name: i18nStr.unitNum,field:3, width: 8 }
		             ,  {name: i18nStr.goodsSuttle,field:4, width: 8 }
		             ,  {name: i18nStr.goodsWeight,field:5, width: 8 }
		             ,  {name: i18nStr.goodsVolume,field:6, width: 8 }
		        				,   {name: i18nStr.label, field: 7,width: 8}
					            ,  {name: i18nStr.carriage,field:8, width: 8 }
		        				,   {name: i18nStr.especial, field: 9,width: 8}
					       				,   {name: i18nStr.goodsState, field: 10,width: 8}
					       			    ,   {name: i18nStr.remark, field: 11,width: 10 }
					 
//???
					 ,   {name: i18nStr.order,field: 12,get:function(inRowIndex){ var str='';var strid;if(querydataOrderRowd[inRowIndex]!=undefined && querydataOrderRowd[inRowIndex][12]!=undefined && querydataOrderRowd[inRowIndex][12][2]){str=querydataOrderRowd[inRowIndex][12][2];strid=querydataOrderRowd[inRowIndex][12][1];} return str;} ,width: 10 }
			//???
					 ,   {name: i18nStr.product,field: 13,get:function(inRowIndex){ var str='';var strid;if(querydataOrderRowd[inRowIndex]!=undefined && querydataOrderRowd[inRowIndex][13]!=undefined && querydataOrderRowd[inRowIndex][13][2]){str=querydataOrderRowd[inRowIndex][13][2];strid=querydataOrderRowd[inRowIndex][13][1];} return str;} ,width: 10 }
			                                        ] ]
                           }]; 
function pageStyleOrderRowd(style){//nomarl,col,noscroll
	gridOrderRowd.scrollToRow(0);
	if(style=="nomarl"){
		gridOrderRowd.setStructure(layoutSingleRowQuery);
	}else if(style=="col"){
		gridOrderRowd.setStructure(layoutTwoRow);
	}else if(style=="noscroll"){
		gridOrderRowd.setStructure(layoutNoscroll);
	}
}						   
						   

//totleinum=12
  //rowinum=6
function getCheckOrderRowd(){}

var layoutTwoRow=[{
          
 //field??????jsÐµtoArray??querydate?
	   
				 cells: [
                      [
						//{ name: 'choise', width: 3,field:0, styles: 'text-align: center;', editor: dojox.grid.editors.Bool },
						//{ name: i18nStr.detail, width: 3, get: getCheckOrderRowd, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
										  					  {name: i18nStr.productNum,field:2, width: 8 }
								  			//--------------  if (3 == 7)
														  					 ,  {name: i18nStr.unitNum,field:3, width: 8 }
								  			//--------------  if (4 == 7)
														  					 ,  {name: i18nStr.goodsSuttle,field:4, width: 8 }
								  			//--------------  if (5 == 7)
														  					 ,  {name: i18nStr.goodsWeight,field:5, width: 8 }
								  			//--------------  if (6 == 7)
														  					 ,  {name: i18nStr.goodsVolume,field:6, width: 8 }
								  			//--------------  if (7 == 7)
								//
												  																	,   {name: i18nStr.label, field: 7,width: 8}
																						  								]
												                     //----------------(inum:8)  (rowinum: 7)
									                     //----------------(inum:8)  (rowinum: 7)
									                     //----------------(inum:8)  (rowinum: 7)
									                     //----------------(inum:8)  (rowinum: 7)
									                     //----------------(inum:8)  (rowinum: 7)
								
	//
		  //(8 > 7)
						//
		  //(8 > 7)
							,[
	 //  22222222222inum= 2   inum2=8
																																							  					  {name: i18nStr.carriage,field:8, width: 8}
								  														  													,   {name: i18nStr.especial, field: 9,width: 8 }
																  														  													,   {name: i18nStr.goodsState, field: 10,width: 8 }
																  														  													,   {name: i18nStr.remark, field: 11,width: 10 }
																  														
	//
									 ,   {name: i18nStr.order,field: 12,get:function(inRowIndex){ var str='';var strid;if(querydataOrderRowd[inRowIndex]!=undefined && querydataOrderRowd[inRowIndex][12]!=undefined && querydataOrderRowd[inRowIndex][12][1]!=undefined){str=querydataOrderRowd[inRowIndex][12][2];strid=querydataOrderRowd[inRowIndex][12][1];} return str;} ,width: 10 }
										//
									 ,   {name: i18nStr.product,field: 13,get:function(inRowIndex){ var str='';var strid;if(querydataOrderRowd[inRowIndex]!=undefined && querydataOrderRowd[inRowIndex][13]!=undefined && querydataOrderRowd[inRowIndex][13][1]!=undefined){str=querydataOrderRowd[inRowIndex][13][2];strid=querydataOrderRowd[inRowIndex][13][1];} return str;} ,width: 10 }
										 	
			,   {name: ' ',value:' ' ,width: 10 }
		]]
                           }]; 						   
						   
						   
					
					
					
//end-------Ê¾Ñ¯Ð±í£¬Í·,Ó´floatÚµÍ¼------------------------------------------------------------------------------------

/*	dojo.connect(dijit.byId("OrderRowdAFTab"), "selectChild", function(e){
					if (dijit.byId("OrderRowdAFTab").selectedChildWidget.id=="orderRow2orderRowTasks"){
			buildorderRow2orderRowTasks();
						}else if (dijit.byId("OrderRowdAFTab").selectedChildWidget.id=="payment2payments"){
			buildpayment2payments();
				}
		}); */

function resetNU(trueTab){
												NUorderRow2orderRowTasks=true;
								NUpayment2payments=true;
			}
function clickRowTab(){
																			if (dijit.byId("OrderRowdAFTab").selectedChildWidget.id=="orderRow2orderRowTasks"){
					buildorderRow2orderRowTasks();
																}else if (dijit.byId("OrderRowdAFTab").selectedChildWidget.id=="payment2payments"){
					buildpayment2payments();
													}
		}
				
var mainID;
function getVOOrderRowd(queryvo){
	var totalCount=0;
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
      modelOrderRowd.setData(querydataOrderRowd);
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
var connecthandle=0 ;
var handle ;
function gridResize(){
OrderRowdAFTab.resize({t:8,h: dijit.byId("bottomPane").domNode.clientHeight-40});
	 	 			if(gridorderRow2orderRowTasks!=undefined)gridorderRow2orderRowTasks.resize({h: dijit.byId("bottomPane").domNode.clientHeight-90});
	 			if(gridpayment2payments!=undefined)gridpayment2payments.resize({h: dijit.byId("bottomPane").domNode.clientHeight-90});
	 		gridOrderRowd.resize({h:document.body.clientHeight-dijit.byId("bottomPane").domNode.clientHeight-36});
}		
function init(){
  getVOOrderRowd(queryvoOrderRowd);
  var m = dijit.byId("bottomPane"); 
  if(m._showing)m.toggle();
  
setTimeout(function(){
	gridOrderRowd.resize({h: document.body.clientHeight-86});
		dojo.connect(dijit.byId("OrderRowdAFTab"), "selectChild", function(e){
				dojo.byId("orderRow2orderRowTasksTable").style.visibility="hidden";
			dojo.byId("payment2paymentsTable").style.visibility="hidden";
	dojo.byId(dijit.byId("OrderRowdAFTab").selectedChildWidget.id+"Table").style.visibility="visible";
	clickRowTab();
	}); 
		dojo.connect(dijit.byId("bottomPane"), "_showEnd", function(e){
		if(connecthandle==0){
			handle=dojo.connect(dijit.byId("gridOrderRowd"), "doclick", function(e){
				mainID=querydataOrderRowd[e.rowIndex][1];
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
function querybuttonOrderRowd(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvoOrderRowd.id=0 ;
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
				var OrderRowdorderQuery= new Object();
				//orderQuery.OrderRowdName=queryorder.getDisplayedValue();
				OrderRowdorderQuery.id=queryOrderRowdorder.getValue();
				queryvoOrderRowd.order=OrderRowdorderQuery;
			  }
	if(queryOrderRowdproduct.getDisplayedValue()!=""){
				var OrderRowdproductQuery= new Object();
				//productQuery.OrderRowdName=queryproduct.getDisplayedValue();
				OrderRowdproductQuery.id=queryOrderRowdproduct.getValue();
				queryvoOrderRowd.product=OrderRowdproductQuery;
			  }

			if(validstate==0){
              pagenumber=1;
			  getVOOrderRowd(queryvoOrderRowd);
              //getVO(queryvoOrderRowd,pagenumber,pagesize,'0'); 
              //if(totalpage>1){dijit.byId("but7").setDisabled(false);}else{dijit.byId("but7").setDisabled(true);} 
             }      
       }

function pageSizeChangeOrderRowd(mylabel){
	pagesizeOrderRowd=mylabel;
	pagenumberOrderRowd=1;
	getVOOrderRowd(queryvoOrderRowd);
}

function allpageOrderRowd(){
	pagesizeOrderRowd=0;
	getVOOrderRowd(queryvoOrderRowd);
}

function upPageOrderRowd(){
	pagenumberOrderRowd--;
	getVOOrderRowd(queryvoOrderRowd);
}
function downPageOrderRowd(){
	pagenumberOrderRowd++;
	getVOOrderRowd(queryvoOrderRowd);
}
//totleinum=12
 //rowinum=4


</script>
</head>
<body class="tundra">
<div id="bc" style="width:100%; height:100%;" dojoType="dijit.layout.BorderContainer">
<div dojoType="dijit.layout.ContentPane"  title="" region="center" id="topPane" 	 >
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

				<button dojoType="dijit.form.Button" onclick="querydisplay('queryDivOrderRowd');" iconClass="openQueryIcon"  i18n="openQuery" >query</button>
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
						<div dojoType="dijit.form.myDropDownButton" iconClass="pageStyleIcon"><span>pageStyle</span>
						   <div dojoType="dijit.Menu">
							 <div dojoType="dijit.MenuItem"  iconClass="rowIcon"		label="normal"	onClick="pageStyleOrderRowd(this.label);"></div>
							 <div dojoType="dijit.MenuItem"  iconClass="colIcon"		label="col"	onClick="pageStyleOrderRowd(this.label);"></div>
							 <div dojoType="dijit.MenuItem"  iconClass="colIcon"		label="noscroll"	onClick="pageStyleOrderRowd(this.label);"></div>
						</div></div>
		</td>
	</tr>
</table>	       	
       <div id="gridOrderRowd"  dojoType="dojox.Grid" autoWidth="false"  jsId="gridOrderRowd"	model="modelOrderRowd"  structure="layoutSingleRowQuery"  ></div>
    </div>  
	<div dojoType="dojox.layout.ExpandoPane" splitter="true" duration="125" region="bottom" title="relative data" style="height:375px;" id="bottomPane" jsId="bottomPane" >
														<table id="orderRow2orderRowTasksTable"  style=" position:absolute;top:0px;left:500px; width:50%; visibility:visible;z-index:9000 ">
				<tr height="25px" width="100%">
	<!--td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   orderRow2orderRowTasks List</b></td-->
		<td align="right" >
					<span id="rowCountorderRow2orderRowTasks"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button dojoType="dijit.form.myButton" onclick="upPageorderRow2orderRowTasks();"  id="but6orderRow2orderRowTasks" disabled='true' jsId="but6orderRow2orderRowTasks" iconClass="upPageIcon" >pageup</button>
					<button dojoType="dijit.form.myButton" onclick="downPageorderRow2orderRowTasks();" id="but7orderRow2orderRowTasks" disabled='true' jsId="but7orderRow2orderRowTasks" iconClass="downPageIcon" >pagedown</button>
	</td></tr></table>
									<table id="payment2paymentsTable"  style=" position:absolute;top:0px;left:500px; width:50%; visibility:hidden ;z-index:9000">		
				<tr height="25px" width="100%">
	<!--td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   payment2payments List</b></td-->
		<td align="right" >
					<span id="rowCountpayment2payments"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button dojoType="dijit.form.myButton" onclick="upPagepayment2payments();"  id="but6payment2payments" disabled='true' jsId="but6payment2payments" iconClass="upPageIcon" >pageup</button>
					<button dojoType="dijit.form.myButton" onclick="downPagepayment2payments();" id="but7payment2payments" disabled='true' jsId="but7payment2payments" iconClass="downPageIcon" >pagedown</button>
	</td></tr></table>
				<div dojoType="dijit.layout.TabContainer" style="height:100%;width:99%; position:absolute;top:8px;"   id="OrderRowdAFTab" jsId="OrderRowdAFTab"  >
												<div dojoType="dijit.layout.ContentPane" title="orderRow2orderRowTasks"  id="orderRow2orderRowTasks" jsId="orderRow2orderRowTasks" >
				<div id="gridorderRow2orderRowTasks" dojoType="dojox.Grid" autoWidth="false"  jsId="gridorderRow2orderRowTasks"	model="modelorderRow2orderRowTasks"  structure="layoutorderRow2orderRowTasks"  ></div>
			</div>
								<div dojoType="dijit.layout.ContentPane" title="payment2payments"  id="payment2payments" jsId="payment2payments" >
				<div id="gridpayment2payments" dojoType="dojox.Grid" autoWidth="false"  jsId="gridpayment2payments"	model="modelpayment2payments"  structure="layoutpayment2payments"  ></div>
			</div>
				</div> 
</div>	
</body>
<script type="text/javascript">trans18tag();</script>
</html>
 