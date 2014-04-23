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
									
		 function order2orderRowFloatPara(id){
		  //this.ID=id;
		  this.deletedataorder2orderRow=new Array();
		  this.querydataorder2orderRow=new Array();
		  this.pagenumberorder2orderRow=1;
		  this.totalCountorder2orderRow=0;
		  this.pagesizeorder2orderRow=10;
		  this.orderByorder2orderRow='0';
		  this.queryvoorder2orderRow=new Object();
		  //this.oddstyle='';
		  this.modelorder2orderRow = new dojox.grid.data.Table(null, this.querydataorder2orderRow);
		  this.gridorder2orderRow=''
	 }
	 
	 var order2orderRowFloatArray=new Array();
		
     </script>
		        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>

 					<script type="text/javascript" src="../order/order2orderRowFloatAFTab.js"></script>
		
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
		//fieldÖµÄ¬ÏµË³ò£¬´jsÐµtoArray×ªØµquerydateÈ¡
	    cells: [ [
							{name: 'openFloat', styles: 'text-align: center;', width: 3, get:function(inRowIndex){return '<img src="../image/EmbedLink.gif" style="cursor:pointer"  onclick="openFloat('+inRowIndex+',event);"  height="16" width="16" >';}},
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
						  				
//Ú¿Þ¸Äµlayout(org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[orderRow] in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[orderRow], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[customer]])if(!true)  Ö¶Ó¦FloatÑ¡ñ´°¿Ú´
				//Ú¿Þ¸Äµlayout(org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[customer] in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[orderRow], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[customer]])if(!false)  Ö¶Ó¦FloatÑ¡ñ´°¿Ú´
					 ,   {name: i18nStr.customer,field: 17,get:function(inRowIndex){ var str='';if(querydataOrderd[inRowIndex]!=undefined && querydataOrderd[inRowIndex][17]!=undefined){str=querydataOrderd[inRowIndex][17][2];} return str;} ,width: 10 }
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
						{name: 'openFloat', styles: 'text-align: center;', width: 3, get:function(inRowIndex){return '<img src="../image/EmbedLink.gif" style="cursor:pointer" onclick="openFloat('+inRowIndex+',event);"  height="16" width="16" >';}},
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
var onloadmy=function(){
										buildorder2orderRow(mainID);
											}					
var mainID;
var floatIndex=0;
var flag=0;//0,1

function openFloat(indexRow,e){
	mainID=querydataOrderd[indexRow][1];
	var FloatID ="openFloat_"+mainID;//É´ò¿ª¶floatÎ´Êµ
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
			title:"float",
			maxable: true,
			closable: true,
			resizable: true ,
			dockable:true//,
			//onLoad:onloadmy,
			//href:"OrderdQueryAFFloat.html"
		},div);
		dojo.style(fp.domNode,{
			width:"1000px",
			height:"600px",
			top:80+30*floatIndex, left:120+30*floatIndex,
			position:"absolute",
			zIndex:"980"
		});
		openFloat=fp;
											buildorder2orderRow(mainID);
											fp.startup();
	fp.show();


dojo.connect(openFloat, "resize", function(e){
	var innerID=""+openFloat.id.replace("Orderd","");
			order2orderRowFloatArray[""+innerID].gridorder2orderRow.resize({w: openFloat.domNode.clientWidth-16,h:openFloat.domNode.clientHeight-100});
			
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
		var signHeight = dijit.byId("gridOrderd").domNode.clientHeight/allFloatArray.length;
		var tt=0;
		for (var i=0; i<allFloatArray.length;i++){
			dojo.style(allFloatArray[i].domNode,{
			width:dijit.byId("gridOrderd").domNode.clientWidth,
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
		var signWidth = dijit.byId("gridOrderd").domNode.clientWidth/allFloatArray.length;
		var tt=0;
		for (var i=0; i<allFloatArray.length;i++){
			//allFloatArray[i].resize({t:tt ,l : 0,w:dijit.byId("gridOrderd").domNode.clientWidth,h:signHeight});
			dojo.style(allFloatArray[i].domNode,{
			width:signWidth,
			height:dijit.byId("gridOrderd").domNode.clientHeight,
			top:0, left:tt,
			position:"absolute",
			zIndex:"980"
		});
			allFloatArray[i].show();
			tt=tt+signWidth;
		}
	}
}




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
 
function init(){
  getVOOrderd(queryvoOrderd);
}

 dojo.addOnLoad(init);   
function querybutton(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvoOrderd.id=0 ;
              queryvoOrderd=new Object();
								  if(querycustomerOrderNo.getDisplayedValue()!="")queryvoOrderd.customerOrderNo=querycustomerOrderNo.getDisplayedValue();//
											  if(querycontractNo.getDisplayedValue()!="")queryvoOrderd.contractNo=querycontractNo.getDisplayedValue();//
											  if(queryconveyanceEnum.getDisplayedValue()!="")queryvoOrderd.conveyanceEnum=queryconveyanceEnum.getDisplayedValue();//
											  if(querycarryTypeEnum.getDisplayedValue()!="")queryvoOrderd.carryTypeEnum=querycarryTypeEnum.getDisplayedValue();//
											  if(queryshipperRemark.getDisplayedValue()!="")queryvoOrderd.shipperRemark=queryshipperRemark.getDisplayedValue();//
											  if(querycarrierRemark.getDisplayedValue()!="")queryvoOrderd.carrierRemark=querycarrierRemark.getDisplayedValue();//
											  if(querylevelEnum.getDisplayedValue()!="")queryvoOrderd.levelEnum=querylevelEnum.getDisplayedValue();//
											  if(querycustomerTypeEnum.getDisplayedValue()!="")queryvoOrderd.customerTypeEnum=querycustomerTypeEnum.getDisplayedValue();//
											  d=queryDate_fun("referTime");
					  if(d==null){validstate=1;}else if(d.upSign!="%"){queryvoOrderd.referTime=d;}
											  if(querylinkMan.getDisplayedValue()!="")queryvoOrderd.linkMan=querylinkMan.getDisplayedValue();//
											  if(querytel.getDisplayedValue()!="")queryvoOrderd.tel=querytel.getDisplayedValue();//
											  d=queryDate_fun("bookTime");
					  if(d==null){validstate=1;}else if(d.upSign!="%"){queryvoOrderd.bookTime=d;}
											  d=queryDate_fun("completeTime");
					  if(d==null){validstate=1;}else if(d.upSign!="%"){queryvoOrderd.completeTime=d;}
											  if(queryremark.getDisplayedValue()!="")queryvoOrderd.remark=queryremark.getDisplayedValue();//
							
	if(queryorderRow.getDisplayedValue()!=""){
				var orderRowQuery= new Object();
				//orderRowQuery.Name=queryorderRow.getDisplayedValue();
				orderRowQuery.id=queryorderRow.getValue();
				queryvoOrderd.orderRow=orderRowQuery;
			  }
	if(querycustomer.getDisplayedValue()!=""){
				var customerQuery= new Object();
				//customerQuery.Name=querycustomer.getDisplayedValue();
				customerQuery.id=querycustomer.getValue();
				queryvoOrderd.customer=customerQuery;
			  }

			if(validstate==0){
              pagenumber=1;
			  getVOOrderd(queryvoOrderd);
              //getVO(queryvoOrderd,pagenumber,pagesize,'0'); 
              //if(totalpage>1){dijit.byId("but7").setDisabled(false);}else{dijit.byId("but7").setDisabled(true);} 
             }      
       }
//totleinum=15
 //rowinum=5

</script>
</head>
<body class="tundra">

<div id="queryDiv" style="margin-right: 0px;  height: 160px; display:none;" >
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
						<td align="left"  colspan="3"><span id="queryreferTimeImg0"  ><input class="editerDate"   jsId="queryreferTime" id="queryreferTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTime" jsId="queryreferTimeTime" id="queryreferTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
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
						<td align="left"   colspan="5"><span id="querybookTimeImg0"  ><input class="editerDate"   jsId="querybookTime" id="querybookTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTime" jsId="querybookTimeTime" id="querybookTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
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
						<td align="left"  colspan="3"><span id="querycompleteTimeImg0"  ><input class="editerDate"   jsId="querycompleteTime" id="querycompleteTime"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTime" jsId="querycompleteTimeTime" id="querycompleteTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
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
					
			
					<tr><td align="right"  i18n="orderRow"  ></td>
					<td align="left" ><input  id="queryorderRow"  jsId="queryorderRow" class="selectInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrderd.orderRowStore"  /><div dojoType="dijit.form.myDropDownButton" iconClass="dialogIcon"  ><div dojoType="dijit.TooltipDialog"  href="../common/queryOrderRowdFloat.html"title="detail" execute="" ></div></div></td>  
					
				
					<td align="right"  i18n="customer"  ></td>
					<td align="left" colspan="3"  ><!----><input  id="querycustomer"  jsId="querycustomer" class="selectInput" dojoType="dijit.form.myFilteringSelect" store="dojoOrderd.customerStore"  /><div dojoType="dijit.form.myDropDownButton" iconClass="dialogIcon"  ><div dojoType="dijit.TooltipDialog"  href="../common/queryCustomerFloat.html"title="detail" execute="" ></div></div></td>  
					
	    <td align="right"    ></td><td align="right"    ></td></tr>

         <tr align="center"><td></td>
           <td colspan="1"> <button dojoType="dijit.form.Button" onclick="querybutton();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="1"><button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="3"></td></tr>
         </table>
	    </div>	
 <table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   Orderd List</b></td>
		<td align="right" >
				<button dojoType="dijit.form.Button" onclick="querydisplay('queryDiv');" iconClass="openQueryIcon"  i18n="openQuery" >query</button>
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
						<div dojoType="dijit.form.myDropDownButton" iconClass="pageStyleIcon"><span>pageStyle</span>
						   <div dojoType="dijit.Menu">
							 <div dojoType="dijit.MenuItem"  iconClass="rowIcon"		label="normal"	onClick="pageStyleOrderd(this.label);"></div>
							 <div dojoType="dijit.MenuItem"  iconClass="colIcon"		label="col"	onClick="pageStyleOrderd(this.label);"></div>
							 <div dojoType="dijit.MenuItem"  iconClass="colIcon"		label="noscroll"	onClick="pageStyleOrderd(this.label);"></div>
						</div></div>
			</div>    
	    <div style="{height:90%;width:100%}"  >
	         <div id="gridOrderd"  dojoType="dojox.Grid" autoWidth="false"  jsId="gridOrderd"	model="modelOrderd"  structure="layoutSingleRowQuery" singleClickEdit="true" ></div>
		</td>
	</tr>
</table>    
      
</body>
<script type="text/javascript">trans18tag();</script>
</html>
