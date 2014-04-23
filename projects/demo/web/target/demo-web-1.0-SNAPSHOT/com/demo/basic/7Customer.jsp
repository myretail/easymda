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
			dojo.require("projectDojo.Customer");
	//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
							dojo.require("projectDojo.Prod");
				//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
							dojo.require("projectDojo.Contact");
				//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
							dojo.require("projectDojo.Orderd");
			     </script>
		        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	<script type="text/javascript" >
		var dojoCustomer= new  projectDojo.Customer();
	    dojoCustomer.initCustomer();
	//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
							 var dojoProd= new  projectDojo.Prod();
			dojoProd.initProd();
				//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
							 var dojoContact= new  projectDojo.Contact();
			dojoContact.initContact();
				//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
							 var dojoOrderd= new  projectDojo.Orderd();
			dojoOrderd.initOrderd();
			
		 function prodCust2prodsFloatPara(id){
		  //this.ID=id;
		  this.deletedataprodCust2prods=new Array();
		  this.querydataprodCust2prods=new Array();
		  this.pagenumberprodCust2prods=1;
		  this.totalCountprodCust2prods=0;
		  this.pagesizeprodCust2prods=10;
		  this.orderByprodCust2prods='0';
		  this.queryvoprodCust2prods=new Object();
		  //this.oddstyle='';
		  this.modelprodCust2prods = new dojox.grid.data.Table(null, this.querydataprodCust2prods);
		  this.gridprodCust2prods=''
	 }
	 
	 var prodCust2prodsFloatArray=new Array();
			 function contacts2customerFloatPara(id){
		  //this.ID=id;
		  this.deletedatacontacts2customer=new Array();
		  this.querydatacontacts2customer=new Array();
		  this.pagenumbercontacts2customer=1;
		  this.totalCountcontacts2customer=0;
		  this.pagesizecontacts2customer=10;
		  this.orderBycontacts2customer='0';
		  this.queryvocontacts2customer=new Object();
		  //this.oddstyle='';
		  this.modelcontacts2customer = new dojox.grid.data.Table(null, this.querydatacontacts2customer);
		  this.gridcontacts2customer=''
	 }
	 
	 var contacts2customerFloatArray=new Array();
			 function customer2orderdsFloatPara(id){
		  //this.ID=id;
		  this.deletedatacustomer2orderds=new Array();
		  this.querydatacustomer2orderds=new Array();
		  this.pagenumbercustomer2orderds=1;
		  this.totalCountcustomer2orderds=0;
		  this.pagesizecustomer2orderds=10;
		  this.orderBycustomer2orderds='0';
		  this.queryvocustomer2orderds=new Object();
		  //this.oddstyle='';
		  this.modelcustomer2orderds = new dojox.grid.data.Table(null, this.querydatacustomer2orderds);
		  this.gridcustomer2orderds=''
	 }
	 
	 var customer2orderdsFloatArray=new Array();
	</script>	
 					<script type="text/javascript" src="../basic/prodCust2prodsFloatCrudAFTab_n.js"></script>
			 					<script type="text/javascript" src="../basic/contacts2customerFloatCrudAFTab_n.js"></script>
			 					<script type="text/javascript" src="../order/customer2orderdsFloatCrudAFTab_n.js"></script>
			  	<script type="text/javascript" >
	  var urlCustomer = getUrl()+ "services/CustomerManageService";
	  var deletedataCustomer =  new Array();
	  var querydataCustomer =  new Array();
	  var pagenumberCustomer=1;
	  var totalCountCustomer=0;
	  var pagesizeCustomer=10;
	  var orderByCustomer='0';
	  var queryvoCustomer=new Object();
	  var oddstyle='';
	  var modelCustomer = new dojox.grid.data.Table(null, querydataCustomer);
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
				  				  {name: i18nStr.customerName, field: 2,width: 10}
						  						  				,   {name: i18nStr.custEnum, field: 3,width: 10}
						  				
					]]}];	 
					
					
					
					
					
					
//end-------Ê¾Ñ¯Ð±í£¬Í·,Ó´floatÚµÍ¼------------------------------------------------------------------------------------
var onloadmy=function(){
		dojo.connect(dijit.byId("CustomerAFFloat"), "selectChild", function(e){
			if (dijit.byId("CustomerAFFloat").selectedChildWidget.id=="prodCust2prods"){
			buildprodCust2prods();
						}else if (dijit.byId("CustomerAFFloat").selectedChildWidget.id=="contacts2customer"){
			buildcontacts2customer();
						}else if (dijit.byId("CustomerAFFloat").selectedChildWidget.id=="customer2orderds"){
			buildcustomer2orderds();
				}
		}); 
						dijit.byId("CustomerAFFloat").selectChild(dijit.byId("prodCust2prods"));
								
	}					
var mainID;
var floatIndex=0;
var flag=0;//0,1
function openFloat(indexRow,e){
	mainID=querydataCustomer[indexRow][1];
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
			//href:"CustomerAFFloat.html"
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
				id:"CustomerAFFloat"+mainID,
				jsId:"CustomerAFFloat"+mainID,
				title:""
			},divTap);
						var newTabprodCust2prods = new dijit.layout.ContentPane({
				title: "prodCust2prods",
				id:"prodCust2prods"+mainID,
				jsId:"prodCust2prods"+mainID,
				style: "height:100%;width:100%"
			},dojo.doc.createElement('div'));
			tab.addChild(newTabprodCust2prods);
								var newTabcontacts2customer = new dijit.layout.ContentPane({
				title: "contacts2customer",
				id:"contacts2customer"+mainID,
				jsId:"contacts2customer"+mainID,
				style: "height:100%;width:100%"
			},dojo.doc.createElement('div'));
			tab.addChild(newTabcontacts2customer);
								var newTabcustomer2orderds = new dijit.layout.ContentPane({
				title: "customer2orderds",
				id:"customer2orderds"+mainID,
				jsId:"customer2orderds"+mainID,
				style: "height:100%;width:100%"
			},dojo.doc.createElement('div'));
			tab.addChild(newTabcustomer2orderds);
				fp.startup();
	fp.show();
	var curfloat=dijit.byId("CustomerAFFloat"+mainID);
		dojo.connect(curfloat, "selectChild", function(e){
			var innerID=""+curfloat.id.replace("CustomerAFFloat","");
						if (dijit.byId("CustomerAFFloat"+innerID).selectedChildWidget.id=="prodCust2prods"+innerID){
			buildprodCust2prods(innerID);
						}else if (dijit.byId("CustomerAFFloat"+innerID).selectedChildWidget.id=="contacts2customer"+innerID){
			buildcontacts2customer(innerID);
						}else if (dijit.byId("CustomerAFFloat"+innerID).selectedChildWidget.id=="customer2orderds"+innerID){
			buildcustomer2orderds(innerID);
				}		
		}); 
						dijit.byId("CustomerAFFloat"+mainID).selectChild(dijit.byId("prodCust2prods"+mainID));
								
dojo.connect(openFloat, "resize", function(e){
	var innerID=""+openFloat.id.replace("Customer","");
			prodCust2prodsFloatArray[""+innerID].gridprodCust2prods.resize({w: openFloat.domNode.clientWidth-16,h:openFloat.domNode.clientHeight-100});
				contacts2customerFloatArray[""+innerID].gridcontacts2customer.resize({w: openFloat.domNode.clientWidth-16,h:openFloat.domNode.clientHeight-100});
				customer2orderdsFloatArray[""+innerID].gridcustomer2orderds.resize({w: openFloat.domNode.clientWidth-16,h:openFloat.domNode.clientHeight-100});
		
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
		var signHeight = dijit.byId("gridCustomer").domNode.clientHeight/allFloatArray.length;
		var tt=0;
		for (var i=0; i<allFloatArray.length;i++){
			dojo.style(allFloatArray[i].domNode,{
			width:dijit.byId("gridCustomer").domNode.clientWidth,
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
		var signWidth = dijit.byId("gridCustomer").domNode.clientWidth/allFloatArray.length;
		var tt=0;
		for (var i=0; i<allFloatArray.length;i++){
			//allFloatArray[i].resize({t:tt ,l : 0,w:dijit.byId("gridCustomer").domNode.clientWidth,h:signHeight});
			dojo.style(allFloatArray[i].domNode,{
			width:signWidth,
			height:dijit.byId("gridCustomer").domNode.clientHeight,
			top:0, left:tt,
			position:"absolute",
			zIndex:"980"
		});
			allFloatArray[i].show();
			tt=tt+signWidth;
		}
	}
}



function getVOCustomer(queryvo){
	var totalCount=0;
      var pu = new SOAPClientParameters2();
      pu.add('CustomerVO',queryvo) ;
      pu.add('pageNumber',pagenumberCustomer) ;
	    pu.add('pageSize',pagesizeCustomer) ;
	    pu.add('orderBy',orderByCustomer) ;
      SOAPClient.invoke(urlCustomer,"getCustomer", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydataCustomer=new Array();
		   querydataCustomer=dojoCustomer.CustomerVOtoArray_fun(ul,false);
           totalCountCustomer=ul[ul.length-1]["ns:id"]; 
      }); 
      querydataCustomer.splice(querydataCustomer.length-1,1);
      modelCustomer.setData(querydataCustomer);
      var totalpage=Math.ceil(new Number(totalCountCustomer)/pagesizeCustomer);
	  
	if(totalpage>1){
		if(pagenumberCustomer==1){
			dijit.byId("but6Customer").setDisabled(true);
			dijit.byId("but7Customer").setDisabled(false);
		}else if(pagenumberCustomer==totalpage){
			dijit.byId("but6Customer").setDisabled(false);
			dijit.byId("but7Customer").setDisabled(true);
		}else{
			dijit.byId("but6Customer").setDisabled(false);
			dijit.byId("but7Customer").setDisabled(false);
		}
	}else{
		dijit.byId("but6Customer").setDisabled(true);
		dijit.byId("but7Customer").setDisabled(true);
	
	}
	if(pagesizeCustomer==0){
		totalpage=1;
		dijit.byId("but6Customer").setDisabled(true);
		dijit.byId("but7Customer").setDisabled(true);
	}
	if(totalpage==1)pagenumberCustomer=1;
	
	 document.getElementById("rowCountCustomer").innerHTML=i18nStr.di+" "+pagenumberCustomer+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountCustomer+" "+i18nStr.rowSize; 	
	  
	  
 }
 
 function pageSizeChangeCustomer(mylabel){
	pagesizeCustomer=mylabel;
	pagenumberCustomer=1;
	getVOCustomer(queryvoCustomer);
}

function allpageCustomer(){
	pagesizeCustomer=0;
	getVOCustomer(queryvoCustomer);
}

function upPageCustomer(){
	pagenumberCustomer--;
	getVOCustomer(queryvoCustomer);
}
function downPageCustomer(){
	pagenumberCustomer++;
	getVOCustomer(queryvoCustomer);
}
 
 
function init(){
  getVOCustomer(queryvoCustomer);
}

 dojo.addOnLoad(init);   
function querybuttonCustomer(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvoCustomer.id=0 ;
              queryvoCustomer=new Object();
								  if(queryCustomercustomerName.getDisplayedValue()!="")queryvoCustomer.customerName=queryCustomercustomerName.getDisplayedValue();//
											  if(queryCustomercustEnum.getDisplayedValue()!="")queryvoCustomer.custEnum=queryCustomercustEnum.getDisplayedValue();//
							

			if(validstate==0){
              pagenumber=1;
			  getVOCustomer(queryvoCustomer);
              //getVO(queryvoCustomer,pagenumber,pagesize,'0'); 
              //if(totalpage>1){dijit.byId("but7").setDisabled(false);}else{dijit.byId("but7").setDisabled(true);} 
             }      
       }
//totleinum=2
 //rowinum=0

</script>
</head>
<body class="tundra">

<div id="queryDivCustomer" style="margin-right: 0px;  height: 80px; display:none;" >
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
							<td align="right" i18n="customerName" >customerName:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="queryCustomercustomerName"  jsId="queryCustomercustomerName"   dojoType="dijit.form.TextBox"  />
													</td>
														<td align="right"  i18n="custEnum" >custEnum:</td>
						<td align="left"  colspan="3" >
												<input  id="queryCustomercustEnum" jsId="queryCustomercustEnum" class="editerInput"  dojoType="dijit.form.FilteringSelect" store="dojoCustomer.custEnumStore" />
												</td>  
				
    <td align="right"    ></td><td align="right"    ></td></tr>

         <tr align="center"><td></td>
           <td colspan="1"> <button dojoType="dijit.form.Button" onclick="querybuttonCustomer();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="1"><button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="3"></td></tr>
         </table>
	    </div>	
 <table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   Customer List</b></td>
		<td align="right" >
				<button dojoType="dijit.form.Button" onclick="querydisplay('queryDivCustomer');" iconClass="openQueryIcon"  i18n="openQuery" >query</button>
				<span id="rowCountCustomer"></span>
						<button dojoType="dijit.form.myButton" onclick="upPageCustomer();"  id="but6Customer" disabled='true' jsId="but6Customer" iconClass="upPageIcon" ></button>
						<button dojoType="dijit.form.myButton" onclick="downPageCustomer();" id="but7Customer" disabled='true' jsId="but7Customer" iconClass="downPageIcon" ></button>
						<div  dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
							  <div dojoType="dijit.Menu">
								  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChangeCustomer(this.label);"></div>
								  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChangeCustomer(this.label);"></div>
							  <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChangeCustomer(this.label);"></div>
									<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChangeCustomer(this.label);"></div>
									<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpageCustomer();"></div>
							  </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
						</div>
		</td>
	</tr>
</table>   
	    <div style="{height:90%;width:100%}"  >
	         <div id="gridCustomer"  dojoType="dojox.Grid" autoWidth="false"  jsId="gridCustomer"	model="modelCustomer"  structure="layoutSingleRowQuery" singleClickEdit="true" ></div>
      </div>      
      
</body>
<script type="text/javascript">trans18tag();</script>
</html>
