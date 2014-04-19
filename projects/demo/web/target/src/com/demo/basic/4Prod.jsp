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
			dojo.require("projectDojo.Prod");

			//??¡è???????????????¨¨?¡§		
				//Customer==OrderRowd---false
							//Peoples==OrderRowd---false
																				dojo.require("projectDojo.Orderd");
						

     </script>
		        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 
 	 	 			<script type="text/javascript" src="../order/orderRowds2productCrudAFTab.js"></script>
	  

 
 			<script type="text/javascript" >
	  var dojoProd= new  projectDojo.Prod();
	  dojoProd.initProd();
			//??¡è???????????????¨¨?¡§		
				//Customer==OrderRowd---false
							//Peoples==OrderRowd---false
										
							
				 var dojoOrderd= new  projectDojo.Orderd();
				dojoOrderd.initOrderd();
							  
	  var urlProd = getUrl()+ "services/ProdManageService";
	  var deletedataProd =  new Array();
	  var querydataProd =  new Array();
	  var pagenumberProd=1;
	  var totalCountProd=0;
	  var pagesizeProd=10;
	  var orderByProd='0';
	  var queryvoProd=new Object();
	  var oddstyle='';
	  var modelProd = new dojox.grid.data.Table(null, querydataProd);
	  var urle = getUrl()+ "services/BasicManageService";    

//begin-----?????¡À¨ª?¡§????¨ª??-------------------------------------------------------------------------------------------	  

//end-----?????¡À¨ª?¡§????)-------------------------------------------------------------------------------------------

//begin-------?????¡À¨ª????,??float????------------------------------------------------------------------------------------
 //???¡À????1212??layout??layoutstructure  (????layoutenumeration???????¨ª??!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
															 
	var layoutSingleRowQuery=[{
		//field????????¨ª??¨ª??js??toArray¡Á???querydate??
	    cells: [ [

                { name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
				  				  {name: i18nStr.prodName, field: 2,width: 10}
						  						  				,   {name: i18nStr.code, field: 3,width: 10}
						  						  				 ,  {name: i18nStr.price,field:4, width: 8}
						  						  				,   {name: i18nStr.datef,field:5, width: 8}
						  						  				,   {name: i18nStr.prodType, field: 6,width: 10}
						  				
//??????layout(org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[prodCust] in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[prodCust], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[principal]])if(!false)  ????Float??¨ª??¨ª¡ã???
				 ,   {name: i18nStr.prodCust,field: 7,get:function(inRowIndex){ var str='';if(querydataProd[inRowIndex]!=undefined && querydataProd[inRowIndex][7]!=undefined){str=querydataProd[inRowIndex][7][2];} return str;} ,width: 10 }
				//??????layout(org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[principal] in [org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[prodCust], org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityAssociationEndLogicImpl[principal]])if(!false)  ????Float??¨ª??¨ª¡ã???
				 ,   {name: i18nStr.principal,field: 8,get:function(inRowIndex){ var str='';if(querydataProd[inRowIndex]!=undefined && querydataProd[inRowIndex][8]!=undefined){str=querydataProd[inRowIndex][8][2];} return str;} ,width: 10 }
									]]}];	 

					
						   
					
					
					
//end-------?????¡À¨ª????,??float????------------------------------------------------------------------------------------

/*	dojo.connect(dijit.byId("ProdAFTab"), "selectChild", function(e){
					if (dijit.byId("ProdAFTab").selectedChildWidget.id=="orderRowds2product"){
			buildorderRowds2product();
				}
		}); */
function myOnLoad(){
	clickRowTab();
}	

function resetNU(trueTab){
												NUorderRowds2product=true;
			}
function clickRowTab(){
													buildorderRowds2product();
			}
				
var mainID;
var mainName;



function getVOProd(queryvo){
	var totalCount=0;
      var pu = new SOAPClientParameters2();
      pu.add('ProdVO',queryvo) ;
      pu.add('pageNumber',pagenumberProd) ;
	    pu.add('pageSize',pagesizeProd) ;
	    pu.add('orderBy',orderByProd) ;
      SOAPClient.invoke(urlProd,"getProd", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydataProd=new Array();
		   querydataProd=dojoProd.ProdVOtoArray_fun(ul,false);
           totalCountProd=ul[ul.length-1]["ns:id"]; 
      }); 
      querydataProd.splice(querydataProd.length-1,1);
      modelProd.setData(querydataProd);
      var totalpage=Math.ceil(new Number(totalCountProd)/pagesizeProd);
	  
	if(totalpage>1){
		if(pagenumberProd==1){
			dijit.byId("but6Prod").setDisabled(true);
			dijit.byId("but7Prod").setDisabled(false);
		}else if(pagenumberProd==totalpage){
			dijit.byId("but6Prod").setDisabled(false);
			dijit.byId("but7Prod").setDisabled(true);
		}else{
			dijit.byId("but6Prod").setDisabled(false);
			dijit.byId("but7Prod").setDisabled(false);
		}
	}else{
		dijit.byId("but6Prod").setDisabled(true);
		dijit.byId("but7Prod").setDisabled(true);
	
	}
	if(pagesizeProd==0){
		totalpage=1;
		dijit.byId("but6Prod").setDisabled(true);
		dijit.byId("but7Prod").setDisabled(true);
	}
	if(totalpage==1)pagenumberProd=1;
	
	 document.getElementById("rowCountProd").innerHTML=i18nStr.di+" "+pagenumberProd+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountProd+" "+i18nStr.rowSize; 	
	  
	  
 }
var connecthandle=0 ;
var handle ;
function gridResize(){
	 	 			if(gridorderRowds2product!=undefined)gridorderRowds2product.resize({h: dijit.byId("bottomPane").domNode.clientHeight-90});
	 		gridProd.resize({h:document.body.clientHeight-dijit.byId("bottomPane").domNode.clientHeight-36});
}		
function init(){
  getVOProd(queryvoProd);
  var m = dijit.byId("bottomPane"); 
  if(m._showing)m.toggle();
  
setTimeout(function(){
	gridProd.resize({h: document.body.clientHeight-86});
		dojo.connect(dijit.byId("bottomPane"), "_showEnd", function(e){
		if(connecthandle==0){
			handle=dojo.connect(dijit.byId("gridProd"), "doclick", function(e){
				mainID=querydataProd[e.rowIndex][1];
				mainName = querydataProd[e.rowIndex][2];
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
function querybuttonProd(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvoProd.id=0 ;
              queryvoProd=new Object();
								  if(queryProdprodName.getDisplayedValue()!="")queryvoProd.prodName=queryProdprodName.getDisplayedValue();//
											  if(queryProdcode.getDisplayedValue()!="")queryvoProd.code=queryProdcode.getDisplayedValue();//
											  n=queryNumber_fun("Prodprice");
					  if(n==null){validstate=1;}else if(n.upSign!="%"){queryvoProd.price=n;}  
											  d=queryDate_fun("Proddatef");
					  if(d==null){validstate=1;}else if(d.upSign!="%"){queryvoProd.datef=d;}
											  if(queryProdprodType.getDisplayedValue()!="")queryvoProd.prodType=queryProdprodType.getDisplayedValue();//
							
	if(queryProdprodCust.getDisplayedValue()!=""){
				var ProdprodCustQuery= new Object();
				//prodCustQuery.ProdName=queryprodCust.getDisplayedValue();
				ProdprodCustQuery.id=queryProdprodCust.getValue();
				queryvoProd.prodCust=ProdprodCustQuery;
			  }
	if(queryProdprincipal.getDisplayedValue()!=""){
				var ProdprincipalQuery= new Object();
				//principalQuery.ProdName=queryprincipal.getDisplayedValue();
				ProdprincipalQuery.id=queryProdprincipal.getValue();
				queryvoProd.principal=ProdprincipalQuery;
			  }

			if(validstate==0){
              pagenumber=1;
			  getVOProd(queryvoProd);
              //getVO(queryvoProd,pagenumber,pagesize,'0'); 
              //if(totalpage>1){dijit.byId("but7").setDisabled(false);}else{dijit.byId("but7").setDisabled(true);} 
             }      
       }

function pageSizeChangeProd(mylabel){
	pagesizeProd=mylabel;
	pagenumberProd=1;
	getVOProd(queryvoProd);
}

function allpageProd(){
	pagesizeProd=0;
	getVOProd(queryvoProd);
}

function upPageProd(){
	pagenumberProd--;
	getVOProd(queryvoProd);
}
function downPageProd(){
	pagenumberProd++;
	getVOProd(queryvoProd);
}
//totleinum=7
 //rowinum=2


</script>
</head>
<body class="tundra">
<div id="bc" style="width:100%; height:100%;" dojoType="dijit.layout.BorderContainer">
<div dojoType="dijit.layout.ContentPane"  title="" region="center" id="topPane" 	 >
<div id="queryDivProd" style="margin-right: 0px;  height: 120px; display:none;" >
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
							<td align="right" i18n="prodName" >prodName:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="queryProdprodName"  jsId="queryProdprodName"   dojoType="dijit.form.TextBox"  />
													</td>
														<td align="right"  i18n="code" >code:</td>
						<td align="left"  colspan="3" >
													<input type="text" class="editerInput"  id="queryProdcode"  jsId="queryProdcode"   dojoType="dijit.form.TextBox"  />
												</td>  
											<td align="right"  i18n="price" >price:</td>
						<td align="left"  >
							<span id="queryProdpriceImg0"  ><input type="text" class="editerNumber" jsId="queryProdprice"  id="queryProdprice"  dojoType="mydojo.NumberTextBox"  /></span>
							<span id="queryProdpriceImg1"  style="{display:none}" ><input type="text" class="editerNumberSmall" jsId="queryProdprice1"  id="queryProdprice1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryProdpriceImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryProdpriceImgdown" >></span>
							<span id="queryProdpriceImg2div" style="{display:none}"> <input type="text" class="editerNumberSmall"  jsId="queryProdprice2"  id="queryProdprice2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/nStart.gif" onclick="queryType(this);" id="queryProdpriceImg" class="imgStyle">
							
						</td>  
								  </tr>
			                <tr>
							<td align="right" i18n="datef"  >datef:</td> 
						<td align="left"  colspan="3"><span id="queryProddatefImg0"  ><input class="editerDate"   jsId="queryProddatef" id="queryProddatef"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTime" jsId="queryProddatefTime" id="queryProddatefTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span id="queryProddatefImg1" style="{display:none}" ><input class="editerDateSmaller"   jsId="query1Proddatef" id="query1Proddatef"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query1ProddatefTime" id="query1ProddatefTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryProddatefImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryProddatefImgdown" >></span>
							<span id="queryProddatefImg2div" style="{display:none}"><input class="editerDateSmaller"   jsId="query2Proddatef" id="query2Proddatef"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTimeSmaller" jsId="query2ProddatefTime" id="query2ProddatefTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="queryProddatefImg" class="imgStyle">
						</td>
													<td align="right" colspan="2" ></td>
						<td align="right"  i18n="prodType" >prodType:</td>
						<td align="left"  >
							 								<input type="text" class="editerInput"  id="queryProdprodType"  jsId="queryProdprodType"   dojoType="dijit.form.TextBox"  />  
													</td></tr>
					
			
					<tr><td align="right"  i18n="prodCust"  ></td>
					<td align="left" ><input  id="queryProdprodCust"  jsId="queryProdprodCust" class="selectInput" dojoType="dijit.form.myFilteringSelect" store="dojoProd.prodCustStore"  /><div dojoType="dijit.form.myDropDownButton" iconClass="dialogIcon"  ><div dojoType="dijit.TooltipDialog"  href="../common/queryCustomerFloat.html"title="detail" execute="" ></div></div></td>  
					
				
					<td align="right"  i18n="principal"  ></td>
					<td align="left" colspan="3"  ><!----><input  id="queryProdprincipal"  jsId="queryProdprincipal" class="selectInput" dojoType="dijit.form.myFilteringSelect" store="dojoProd.principalStore"  /><div dojoType="dijit.form.myDropDownButton" iconClass="dialogIcon"  ><div dojoType="dijit.TooltipDialog"  href="../common/queryPeoplesFloat.html"title="detail" execute="" ></div></div></td>  
					
	    <td align="right"    ></td><td align="right"    ></td></tr>

         <tr align="center"><td></td>
           <td colspan="1"> <button dojoType="dijit.form.Button" onclick="querybuttonProd();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="1"><button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="3"></td></tr>
         </table>
	    </div>		
<table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   Prod List</b></td>
		<td align="right" >

				<button dojoType="dijit.form.Button" onclick="querydisplay('queryDivProd');" iconClass="openQueryIcon"  i18n="openQuery" >query</button>
				<span id="rowCountProd"></span>
						<button dojoType="dijit.form.myButton" onclick="upPageProd();"  id="but6Prod" disabled='true' jsId="but6Prod" iconClass="upPageIcon" >pageup</button><!--span dojoType="dijit.Tooltip" connectId="but6">pageup</span-->
						<button dojoType="dijit.form.myButton" onclick="downPageProd();" id="but7Prod" disabled='true' jsId="but7Prod" iconClass="downPageIcon" >pagedown</button><!--span dojoType="dijit.Tooltip" connectId="but7">pagedown</span-->
						<div  dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
							  <div dojoType="dijit.Menu">
								  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChangeProd(this.label);"></div>
								  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChangeProd(this.label);"></div>
							  <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChangeProd(this.label);"></div>
									<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChangeProd(this.label);"></div>
									<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpageProd();"></div>
							  </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
						</div>
		</td>
	</tr>
</table>	       	
       <div id="gridProd"  dojoType="dojox.Grid" autoWidth="false"  jsId="gridProd"	model="modelProd"  structure="layoutSingleRowQuery"  ></div>
    </div>  
	<div dojoType="dojox.layout.ExpandoPane" splitter="true" duration="125" region="bottom" title="relative data" style="height:375px;" onLoad="myOnLoad" id="bottomPane" jsId="bottomPane" >
		<table   style=" position:absolute;top:0px; width:90%">
	<tr height="25px" width="100%">
		
															<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   orderRowds2product List</b></td>
			<td align="right" >
						<span id="rowCountorderRowds2product"></span>&nbsp;&nbsp;
						<button dojoType="dijit.form.myButton" onclick="upPageorderRowds2product();"  id="but6orderRowds2product" disabled='true' jsId="but6orderRowds2product" iconClass="upPageIcon" >pageup</button>
						<button dojoType="dijit.form.myButton" onclick="downPageorderRowds2product();" id="but7orderRowds2product" disabled='true' jsId="but7orderRowds2product" iconClass="downPageIcon" >pagedown</button>
																																																																																																																																																																																																										<button dojoType="dijit.form.Button" onclick="addRoworderRowds2product();" iconClass="addIcon" >add</button>
					<button dojoType="dijit.form.Button" onclick="removeorderRowds2product();" iconClass="delIcon" >delete</button>
					<button dojoType="dijit.form.Button" id="but3orderRowds2product" jsId="but3orderRowds2product" onclick="call_funUpdorderRowds2product();"  iconClass="saveIcon">save</button>
								</td>
		</tr>
	</table>			
					<div id="gridorderRowds2product" dojoType="dojox.Grid" autoWidth="false"  jsId="gridorderRowds2product"	model="modelorderRowds2product"  structure="layoutorderRowds2product"  ></div>
				
				</div> 
</div>	
</body>
<script type="text/javascript">trans18tag();</script>
</html>
 