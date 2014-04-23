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
			dojo.require("dojox.layout.FloatingPane");
			dojo.require("dijit.layout.TabContainer");
			dojo.require("dijit.layout.ContentPane");
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
            dojo.registerModulePath("mydojo", "../../../js/mydojo");
            dojo.require("mydojo.FilteringSelect");
            dojo.require("mydojo.ValidationTextBox");
            dojo.require("mydojo.NumberTextBox");
			dojo.require("dijit.Dialog");
			dojo.registerModulePath("projectDojo", "../../../dojo/projectDojo");
			dojo.require("projectDojo.OrderRowd");
			//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
																	dojo.require("projectDojo.OrderRowTask");
				//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
																	dojo.require("projectDojo.Payment");
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
			
				 function orderRow2orderRowTasksFloatPara(id){
		  //this.ID=id;
		  this.deletedataorderRow2orderRowTasks=new Array();
		  this.querydataorderRow2orderRowTasks=new Array();
		  this.pagenumberorderRow2orderRowTasks=1;
		  this.totalCountorderRow2orderRowTasks=0;
		  this.pagesizeorderRow2orderRowTasks=10;
		  this.orderByorderRow2orderRowTasks='0';
		  this.queryvoorderRow2orderRowTasks=new Object();
		  //this.oddstyle='';
		  this.modelorderRow2orderRowTasks = new dojox.grid.data.Table(null, this.querydataorderRow2orderRowTasks);
		  this.gridorderRow2orderRowTasks=''
	 }
	 
	 var orderRow2orderRowTasksFloatArray=new Array();
			 function payment2paymentsFloatPara(id){
		  //this.ID=id;
		  this.deletedatapayment2payments=new Array();
		  this.querydatapayment2payments=new Array();
		  this.pagenumberpayment2payments=1;
		  this.totalCountpayment2payments=0;
		  this.pagesizepayment2payments=10;
		  this.orderBypayment2payments='0';
		  this.queryvopayment2payments=new Object();
		  //this.oddstyle='';
		  this.modelpayment2payments = new dojox.grid.data.Table(null, this.querydatapayment2payments);
		  this.gridpayment2payments=''
	 }
	 
	 var payment2paymentsFloatArray=new Array();
	</script>	
 	 	 					<script type="text/javascript" src="../order/orderRow2orderRowTasksFloatCrudAFTab_n.js"></script>
			 					<script type="text/javascript" src="../order/payment2paymentsFloatCrudAFTab_n.js"></script>
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
	  
//begin-----Ð¶Ç·Ó±í£¨Ç·Îªí£©-------------------------------------------------------------------------------------------	  

//end-----Ð¶Ç·Ó±í£¨Ç·Îª)-------------------------------------------------------------------------------------------
//begin-----Ã¶Ö¶Enumeration storeÄ»Ã·-------------------------------------------------------------------------------------------

//end-----Ã¶Ö¶Enumeration storeÄ»Ã·------------------------------------------------------------------------------------------- 

//begin-----Î²ÃµÄ± storeÄ»Ã·  	have set function's manageableAssociationEnds-------------------------------------------------------------------------------------------

//end-----Î²ÃµÄ± storeÄ»Ã·  	have set function's manageableAssociationEnds-------------------------------------------------------------------------------------------
 
//begin-------Ê¾Ñ¯Ð±í£¬Í·,Ó´floatÚµÍ¼------------------------------------------------------------------------------------
 //Ð¶Ï±Ö¶Ç·1212ÉµlayoutÛµlayoutstructure  (Ú²Ñ¯layoutenumerationÖ¶Î²â´¦í£©!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
																									
 var layoutSingleRowQuery=[{
		//fieldÖµÄ¬ÏµË³ò£¬´jsÐµtoArray×ªØµquerydateÈ¡
	    cells: [ [
										{name: 'openFloat', styles: 'text-align: center;', width: 3, get:function(inRowIndex){return '<img src="../image/EmbedLink.gif" style="cursor:pointer" onclick="openFloat('+inRowIndex+',event);"  height="16" width="16" >';}},
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
						  				
//Ú¿Þ¸Äµlayout(org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[order] in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[order], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[product]])if(!false)  Ö¶Ó¦FloatÑ¡ñ´°¿Ú´
					 ,   {name: i18nStr.order,field: 12,get:function(inRowIndex){ var str='';if(querydataOrderRowd[inRowIndex]!=undefined && querydataOrderRowd[inRowIndex][12]!=undefined){str=querydataOrderRowd[inRowIndex][12][2];} return str;} ,width: 10 }
					//Ú¿Þ¸Äµlayout(org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[product] in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[order], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[product]])if(!false)  Ö¶Ó¦FloatÑ¡ñ´°¿Ú´
					 ,   {name: i18nStr.product,field: 13,get:function(inRowIndex){ var str='';if(querydataOrderRowd[inRowIndex]!=undefined && querydataOrderRowd[inRowIndex][13]!=undefined){str=querydataOrderRowd[inRowIndex][13][2];} return str;} ,width: 10 }
										]]}];	 
					
var layoutNoscroll=[ {
			noscroll: true,
			cells: [[
				{name: 'openFloat', styles: 'text-align: center;', width: 3, get:function(inRowIndex){return '<img src="../image/EmbedLink.gif" style="cursor:pointer" onclick="openFloat('+inRowIndex+',event);"  height="16" width="16" >';}},
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
  //rowinum=7
function getCheckOrderRowd(){}

var layoutTwoRow=[{
          
 //field??????jsÐµtoArray??querydate?
	   
				 cells: [
                      [
						{name: 'openFloat', styles: 'text-align: center;', width: 3, get:function(inRowIndex){return '<img src="../image/EmbedLink.gif" style="cursor:pointer" onclick="openFloat('+inRowIndex+',event);"  height="16" width="16" >';}},
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
var onloadmy=function(){
		dojo.connect(dijit.byId("OrderRowdAFFloat"), "selectChild", function(e){
					if (dijit.byId("OrderRowdAFFloat").selectedChildWidget.id=="orderRow2orderRowTasks"){
			buildorderRow2orderRowTasks();
						}else if (dijit.byId("OrderRowdAFFloat").selectedChildWidget.id=="payment2payments"){
			buildpayment2payments();
				}
		}); 
														dijit.byId("OrderRowdAFFloat").selectChild(dijit.byId("orderRow2orderRowTasks"));
							
	}					
var mainID;
var floatIndex=0;
var flag=0;//0,1
function openFloat(indexRow,e){
	mainID=querydataOrderRowd[indexRow][1];
	var FloatID ="openFloat_"+mainID;
	var openFloat = dijit.byId(FloatID);
	if(openFloat==undefined){
		if(floatIndex==5){
			floatIndex=floatIndex-1;
			flag=0;
		}else if(floatIndex==0){
			floatIndex=floatIndex+1;
			flag=1;
		}else if(flag==0){
			floatIndex=floatIndex-1;
		}else if(flag==1){
			floatIndex=floatIndex+1;
		}

		var div = dojo.doc.createElement('div');
		dojo.body().appendChild(div);
		var fp = new dojox.layout.FloatingPane({
			id:FloatID,
			title:"",
			maxable: true,
			closable: true,
			resizable: true ,
			dockable:true//,
			//onLoad:onloadmy,
			//href:"OrderRowdAFFloat.html"
		},div);
		dojo.style(fp.domNode,{
			width:"1000px",
			height:"600px",
			top:80+30*floatIndex, left:120+30*floatIndex,
			position:"absolute",
			zIndex:"980"
		});
		openFloat=fp;
			var divTap = dojo.doc.createElement('div');
	openFloat.domNode.children[1].children[0].appendChild(divTap);
			var tab = new dijit.layout.TabContainer({
				id:"OrderRowdAFFloat"+mainID,
				jsId:"OrderRowdAFFloat"+mainID,
				title:""
			},divTap);
												var newTaborderRow2orderRowTasks = new dijit.layout.ContentPane({
				title: "orderRow2orderRowTasks",
				id:"orderRow2orderRowTasks"+mainID,
				jsId:"orderRow2orderRowTasks"+mainID,
				style: "height:100%;width:100%"
			},dojo.doc.createElement('div'));
			tab.addChild(newTaborderRow2orderRowTasks);
								var newTabpayment2payments = new dijit.layout.ContentPane({
				title: "payment2payments",
				id:"payment2payments"+mainID,
				jsId:"payment2payments"+mainID,
				style: "height:100%;width:100%"
			},dojo.doc.createElement('div'));
			tab.addChild(newTabpayment2payments);
				fp.startup();
	fp.show();
	var curfloat=dijit.byId("OrderRowdAFFloat"+mainID);
		dojo.connect(curfloat, "selectChild", function(e){
			var innerID=""+curfloat.id.replace("OrderRowdAFFloat","");
								if (dijit.byId("OrderRowdAFFloat"+innerID).selectedChildWidget.id=="orderRow2orderRowTasks"+innerID){
			buildorderRow2orderRowTasks(innerID);
						}else if (dijit.byId("OrderRowdAFFloat"+innerID).selectedChildWidget.id=="payment2payments"+innerID){
			buildpayment2payments(innerID);
				}		
		}); 
														dijit.byId("OrderRowdAFFloat"+mainID).selectChild(dijit.byId("orderRow2orderRowTasks"+mainID));
							
dojo.connect(openFloat, "resize", function(e){
	var innerID=""+openFloat.id.replace("OrderRowd","");
					orderRow2orderRowTasksFloatArray[""+innerID].gridorderRow2orderRowTasks.resize({w: openFloat.domNode.clientWidth-16,h:openFloat.domNode.clientHeight-100});
				payment2paymentsFloatArray[""+innerID].gridpayment2payments.resize({w: openFloat.domNode.clientWidth-16,h:openFloat.domNode.clientHeight-100});
		
}); 
	}else{
		openFloat.show();
		dojo.style(openFloat.domNode,{
			width:"1000px",
			height:"600px",
			//top:100, left:150,
			position:"absolute",
			zIndex:"980"});
	}
	
	
	if(dijit.byId("progMenu")==undefined){
		var pMenu = new dijit.Menu({contextMenuForWindow:true, id:"progMenu"});
		pMenu.addChild(new dijit.MenuItem({label:"width",iconClass:"dijitEditorIcon dijitEditorIconCut", onClick:heightFloat}));
		pMenu.addChild(new dijit.MenuItem({label:"height", iconClass:"dijitEditorIcon dijitEditorIconCut", onClick:widthFloat}));
		//pMenu.addChild(new dijit.MenuItem({label:"close all",  disabled:false , onClick:closeFloat}));
	}

}

function getAllOpenFloat(){
	var allFloatArray= [];
	for(var t in  $firstTabNameFloatArray){
		var tFloat=dijit.byId("openFloat_"+t);
		if(tFloat!=undefined){
			allFloatArray.push(tFloat);
		}
	}
	return allFloatArray;
}

function heightFloat(){
	var allFloatArray = getAllOpenFloat();
	if(allFloatArray.length!=0){
		var signHeight = dijit.byId("gridOrderRowd").domNode.clientHeight/allFloatArray.length;
		var tt=0;
		for (var i=0; i<allFloatArray.length;i++){
			dojo.style(allFloatArray[i].domNode,{
			width:dijit.byId("gridOrderRowd").domNode.clientWidth,
			height:signHeight,
			top:tt, left:0,
			position:"absolute",
			zIndex:"980"
		});
			allFloatArray[i].show();
			tt=tt+signHeight;
		}
	}
}

function widthFloat(){
	var allFloatArray = getAllOpenFloat();
	if(allFloatArray.length!=0){
		var signWidth = dijit.byId("gridOrderRowd").domNode.clientWidth/allFloatArray.length;
		var tt=0;
		for (var i=0; i<allFloatArray.length;i++){
			//allFloatArray[i].resize({t:tt ,l : 0,w:dijit.byId("gridOrderRowd").domNode.clientWidth,h:signHeight});
			dojo.style(allFloatArray[i].domNode,{
			width:signWidth,
			height:dijit.byId("gridOrderRowd").domNode.clientHeight,
			top:0, left:tt,
			position:"absolute",
			zIndex:"980"
		});
			allFloatArray[i].show();
			tt=tt+signWidth;
		}
	}
}



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
 
 
function init(){
  getVOOrderRowd(queryvoOrderRowd);
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
//totleinum=12
 //rowinum=4

</script>
</head>
<body class="tundra">

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
						<button dojoType="dijit.form.myButton" onclick="upPageOrderRowd();"  id="but6OrderRowd" disabled='true' jsId="but6OrderRowd" iconClass="upPageIcon" ></button>
						<button dojoType="dijit.form.myButton" onclick="downPageOrderRowd();" id="but7OrderRowd" disabled='true' jsId="but7OrderRowd" iconClass="downPageIcon" ></button>
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
	    <div style="{height:90%;width:100%}"  >
	         <div id="gridOrderRowd"  dojoType="dojox.Grid" autoWidth="false"  jsId="gridOrderRowd"	model="modelOrderRowd"  structure="layoutSingleRowQuery" singleClickEdit="true" ></div>
      </div>      
      
</body>
<script type="text/javascript">trans18tag();</script>
</html>
