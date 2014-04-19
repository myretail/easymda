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
			dojo.require("dojox.layout.FloatingPane");
			dojo.require("dijit.layout.TabContainer");
			dojo.require("dijit.layout.BorderContainer");
			dojo.require("dijit.layout.ContentPane");
			dojo.require("dojox.layout.ExpandoPane");
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
            dojo.registerModulePath("mydojo", "../../../js/mydojo");
            dojo.require("mydojo.FilteringSelect");
            dojo.require("mydojo.ValidationTextBox");
            dojo.require("mydojo.NumberTextBox");
			dojo.require("dijit.Dialog");
			dojo.registerModulePath("projectDojo", "../../../dojo/projectDojo");
			dojo.require("projectDojo.Customer");
	//??¡è???????????????¨¨?¡§		
							dojo.require("projectDojo.Prod");
				//??¡è???????????????¨¨?¡§		
							dojo.require("projectDojo.Contact");
				//??¡è???????????????¨¨?¡§		
							dojo.require("projectDojo.Orderd");
			     </script>
		        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	<script type="text/javascript" >
		var dojoCustomer= new  projectDojo.Customer();
	    dojoCustomer.initCustomer();
	//??¡è???????????????¨¨?¡§		
							 var dojoProd= new  projectDojo.Prod();
			dojoProd.initProd();
				//??¡è???????????????¨¨?¡§		
							 var dojoContact= new  projectDojo.Contact();
			dojoContact.initContact();
				//??¡è???????????????¨¨?¡§		
							 var dojoOrderd= new  projectDojo.Orderd();
			dojoOrderd.initOrderd();
			</script>
 			<script type="text/javascript" src="../basic/prodCust2prodsRightCrudAFTab.js"></script>
	 			<script type="text/javascript" src="../basic/contacts2customerRightCrudAFTab.js"></script>
	 			<script type="text/javascript" src="../order/customer2orderdsRightCrudAFTab.js"></script>
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
//begin-----?????¡À¨ª?¡§????¨ª??-------------------------------------------------------------------------------------------	  

//end-----?????¡À¨ª?¡§????)-------------------------------------------------------------------------------------------
//begin-----????Enumeration store????-------------------------------------------------------------------------------------------

//end-----????Enumeration store????------------------------------------------------------------------------------------------- 

//begin-----?????¡À store????  	have set function's manageableAssociationEnds-------------------------------------------------------------------------------------------

//end-----?????¡À store????  	have set function's manageableAssociationEnds-------------------------------------------------------------------------------------------
 
//begin-------?????¡À¨ª????,??float????------------------------------------------------------------------------------------
 //???¡À????1212??layout??layoutstructure  (????layoutenumeration???????¨ª??!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
					
	var layoutSingleRowQuery=[{
		//field????????¨°???js??toArray¡Á???querydate??
	    cells: [ [

                { name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
				  				  {name: i18nStr.customerName, field: 2,width: 10}
						  						  				,   {name: i18nStr.custEnum, field: 3,width: 10}
						  				
					]]}];	 
					
					

//end-------?????¡À¨ª????,??float????------------------------------------------------------------------------------------

/*	dojo.connect(dijit.byId("CustomerAFTab"), "selectChild", function(e){
			if (dijit.byId("CustomerAFTab").selectedChildWidget.id=="prodCust2prods"){
			buildprodCust2prods();
						}else if (dijit.byId("CustomerAFTab").selectedChildWidget.id=="contacts2customer"){
			buildcontacts2customer();
						}else if (dijit.byId("CustomerAFTab").selectedChildWidget.id=="customer2orderds"){
			buildcustomer2orderds();
				}
		}); */

function resetNU(trueTab){
						NUprodCust2prods=true;
								NUcontacts2customer=true;
								NUcustomer2orderds=true;
			}
function clickRowTab(){

										if (dijit.byId("CustomerAFTab").selectedChildWidget.id=="prodCust2prods"){
					buildprodCust2prods();
																}else if (dijit.byId("CustomerAFTab").selectedChildWidget.id=="contacts2customer"){
					buildcontacts2customer();
																}else if (dijit.byId("CustomerAFTab").selectedChildWidget.id=="customer2orderds"){
					buildcustomer2orderds();
													}
		}
				
var mainID;
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
var connecthandle=0 ;
var handle ;
function gridResize(){
	CustomerAFTab.resize({w: dijit.byId("rightPane").domNode.clientWidth-10,h: document.body.clientHeight-40});
			if(gridprodCust2prods!=undefined)gridprodCust2prods.resize({w: dijit.byId("rightPane").domNode.clientWidth-16,h:dijit.byId("rightPane").domNode.clientHeight-100});
	 			if(gridcontacts2customer!=undefined)gridcontacts2customer.resize({w: dijit.byId("rightPane").domNode.clientWidth-16,h:dijit.byId("rightPane").domNode.clientHeight-100});
	 			if(gridcustomer2orderds!=undefined)gridcustomer2orderds.resize({w: dijit.byId("rightPane").domNode.clientWidth-16,h:dijit.byId("rightPane").domNode.clientHeight-100});
	 		gridCustomer.resize({w:document.body.clientWidth-dijit.byId("rightPane").domNode.clientWidth-36});
}
function init(){
  getVOCustomer(queryvoCustomer);
  var m = dijit.byId("rightPane"); 
  if(m._showing)m.toggle();
  
setTimeout(function(){
	gridCustomer.resize({w: document.body.clientWidth-60,h: document.body.clientHeight-40});
		dojo.connect(dijit.byId("CustomerAFTab"), "selectChild", function(e){
		dojo.byId("prodCust2prodsTable").style.visibility="hidden";
			dojo.byId("contacts2customerTable").style.visibility="hidden";
			dojo.byId("customer2orderdsTable").style.visibility="hidden";
	dojo.byId(dijit.byId("CustomerAFTab").selectedChildWidget.id+"Table").style.visibility="visible";
	clickRowTab();
	}); 
	
	dojo.connect(dijit.byId("rightPane"), "_showEnd", function(e){
	gridResize();
		if(connecthandle==0){
			handle=dojo.connect(dijit.byId("gridCustomer"), "doclick", function(e){
				mainID=querydataCustomer[e.rowIndex][1];
				resetNU();
				clickRowTab();		
			});
			connecthandle=1;
		}
	  });
	  dojo.connect(dijit.byId("rightPane"), "_hideEnd", function(e){
	  gridResize();
		if(connecthandle==1){
			dojo.disconnect(handle);
			connecthandle=0;
		}
	  });	
	  
	   dojo.connect(dijit.byId("rightPane"), "_afterResize", function(e){
			gridResize();
	  }); 
	  
	},0);
  
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

//totleinum=2
 //rowinum=0

</script>
</head>
<body class="tundra">
<div id="bc" style="width:100%; height:100%;" dojoType="dijit.layout.BorderContainer">
<div dojoType="dijit.layout.ContentPane"  title="" region="center" id="topPane" 	 >

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
						<button dojoType="dijit.form.myButton" onclick="upPageCustomer();"  id="but6Customer" disabled='true' jsId="but6Customer" iconClass="upPageIcon" >pageup</button><!--span dojoType="dijit.Tooltip" connectId="but6">pageup</span-->
						<button dojoType="dijit.form.myButton" onclick="downPageCustomer();" id="but7Customer" disabled='true' jsId="but7Customer" iconClass="downPageIcon" >pagedown</button><!--span dojoType="dijit.Tooltip" connectId="but7">pagedown</span-->
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
   
	         <div id="gridCustomer"  dojoType="dojox.Grid" autoWidth="false"  jsId="gridCustomer"	model="modelCustomer"  structure="layoutSingleRowQuery" singleClickEdit="true" ></div>
    </div>      

		<div dojoType="dojox.layout.ExpandoPane" splitter="true" duration="125" region="left" title="" style="width:400px;" id="rightPane" jsId="rightPane" >
								<table id="prodCust2prodsTable"  style=" position:absolute;top:30px; width:90%; visibility:visible ">
				<tr height="25px" width="100%">
		<td align="right" >
					<span id="rowCountprodCust2prods"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button dojoType="dijit.form.myButton" onclick="upPageprodCust2prods();"  id="but6prodCust2prods" disabled='true' jsId="but6prodCust2prods" iconClass="upPageIcon" >pageup</button>
					<button dojoType="dijit.form.myButton" onclick="downPageprodCust2prods();" id="but7prodCust2prods" disabled='true' jsId="but7prodCust2prods" iconClass="downPageIcon" >pagedown</button>
																																																																																																																				<button dojoType="dijit.form.Button" onclick="addRowprodCust2prods();" iconClass="addIcon" >add</button>
					<button dojoType="dijit.form.Button" onclick="removeprodCust2prods();" iconClass="delIcon" >delete</button>
					<button dojoType="dijit.form.Button" id="but3prodCust2prods" jsId="but3prodCust2prods" onclick="call_funUpdprodCust2prods();"  iconClass="saveIcon">save</button>
						</td></tr></table>
									<table id="contacts2customerTable"  style=" position:absolute;top:30px; width:90%; visibility:hidden ">		
				<tr height="25px" width="100%">
		<td align="right" >
					<span id="rowCountcontacts2customer"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button dojoType="dijit.form.myButton" onclick="upPagecontacts2customer();"  id="but6contacts2customer" disabled='true' jsId="but6contacts2customer" iconClass="upPageIcon" >pageup</button>
					<button dojoType="dijit.form.myButton" onclick="downPagecontacts2customer();" id="but7contacts2customer" disabled='true' jsId="but7contacts2customer" iconClass="downPageIcon" >pagedown</button>
																																																<button dojoType="dijit.form.Button" onclick="addRowcontacts2customer();" iconClass="addIcon" >add</button>
					<button dojoType="dijit.form.Button" onclick="removecontacts2customer();" iconClass="delIcon" >delete</button>
					<button dojoType="dijit.form.Button" id="but3contacts2customer" jsId="but3contacts2customer" onclick="call_funUpdcontacts2customer();"  iconClass="saveIcon">save</button>
						</td></tr></table>
									<table id="customer2orderdsTable"  style=" position:absolute;top:30px; width:90%; visibility:hidden ">		
				<tr height="25px" width="100%">
		<td align="right" >
					<span id="rowCountcustomer2orderds"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button dojoType="dijit.form.myButton" onclick="upPagecustomer2orderds();"  id="but6customer2orderds" disabled='true' jsId="but6customer2orderds" iconClass="upPageIcon" >pageup</button>
					<button dojoType="dijit.form.myButton" onclick="downPagecustomer2orderds();" id="but7customer2orderds" disabled='true' jsId="but7customer2orderds" iconClass="downPageIcon" >pagedown</button>
																																																																																																																																																																																																																																																																													<button dojoType="dijit.form.Button" onclick="addRowcustomer2orderds();" iconClass="addIcon" >add</button>
					<button dojoType="dijit.form.Button" onclick="removecustomer2orderds();" iconClass="delIcon" >delete</button>
					<button dojoType="dijit.form.Button" id="but3customer2orderds" jsId="but3customer2orderds" onclick="call_funUpdcustomer2orderds();"  iconClass="saveIcon">save</button>
						</td></tr></table>
				<div dojoType="dijit.layout.TabContainer" style="height:100%; width:100%;position:absolute;top:30px;"   id="CustomerAFTab" jsId="CustomerAFTab"  >
						<div dojoType="dijit.layout.ContentPane" title="prodCust2prods"  id="prodCust2prods" jsId="prodCust2prods" >
				<div id="gridprodCust2prods" dojoType="dojox.Grid" autoWidth="false"  jsId="gridprodCust2prods"	model="modelprodCust2prods"  structure="layoutprodCust2prods"  ></div>
			</div>
								<div dojoType="dijit.layout.ContentPane" title="contacts2customer"  id="contacts2customer" jsId="contacts2customer" >
				<div id="gridcontacts2customer" dojoType="dojox.Grid" autoWidth="false"  jsId="gridcontacts2customer"	model="modelcontacts2customer"  structure="layoutcontacts2customer"  ></div>
			</div>
								<div dojoType="dijit.layout.ContentPane" title="customer2orderds"  id="customer2orderds" jsId="customer2orderds" >
				<div id="gridcustomer2orderds" dojoType="dojox.Grid" autoWidth="false"  jsId="gridcustomer2orderds"	model="modelcustomer2orderds"  structure="layoutcustomer2orderds"  ></div>
			</div>
				</div> 

	</div> 
</div>	
</body>
<script type="text/javascript">trans18tag();</script>
</html>
