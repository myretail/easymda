<%
String peopleId = request.getParameter("peopleId");
%>
<html>
<!--Ò»Ô¶à£¬Ö»Ò»Ò»Ó±í£¬Ã»Ð¿Ò»Ô¶Ó±var dataChild=querydataProd[inRowIndex]-->
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
			dojo.require("dijit.Tree");
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
			dojo.require("projectDojo.Prod");
     </script>
        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 			<script type="text/javascript" src="../basic/ProdGridStyle2.js"></script>
	 <script type="text/javascript" >
		var dojoProd= new  projectDojo.Prod();
	    dojoProd.initProd();
			//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
																	 var dojoOrderRowd= new  projectDojo.OrderRowd();
			dojoOrderRowd.initOrderRowd();
			</script>
	 	 							 
	<script type="text/javascript" >
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
	  var modelProdDetail;
	  var modelProdChild;
	  

//have set function's manageableAssociationEnds
	function prodCustSet(id,value){
        	/*var itemselect=prodCustStore._getItemByIdentity(value);
				if(itemselect!='undefined'&& itemselect!=null){
				}*/
	}
	function principalSet(id,value){
        	/*var itemselect=principalStore._getItemByIdentity(value);
				if(itemselect!='undefined'&& itemselect!=null){
				}*/
	}

															//begin buildLayout
var mainLayout =[{//Þ¸Ä¸ÒªÏ¢Ö¶Ê±ÒªÞ¸Ó¦colSpantoggle
					onBeforeRow: onBeforeRow,
					 cells: [
                      [
						{ name: i18nStr.detail, width: 3, get: getCheckProd, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
				  				  {name: i18nStr.prodName, field: 2,width: 10}
						  						  				,   {name: i18nStr.code, field: 3,width: 10}
						  						  				 ,  {name: i18nStr.price,field:4, width: 8}
						  						  				,   {name: i18nStr.datef,field:5, width: 8}
						  						  				,   {name: i18nStr.prodType, field: 6,width: 10}
						  				
//
					 ,   {name: i18nStr.prodCust,field: 7,get:function(inRowIndex){ var str='';if(querydataProd[inRowIndex]!=undefined && querydataProd[inRowIndex][7]!=undefined){str=querydataProd[inRowIndex][7][2];} return str;} ,width: 10 }
					//
					 ,   {name: i18nStr.principal,field: 8,get:function(inRowIndex){ var str='';if(querydataProd[inRowIndex]!=undefined && querydataProd[inRowIndex][8]!=undefined){str=querydataProd[inRowIndex][8][2];} return str;} ,width: 10 }
										],[
							
							{ name: '\u8be6\u7ec6', colSpan: 9 ,styles: 'padding: 0; margin: 0;', get: getSubProd }//value: '<div style="height:0px; background-color: white;"></div>'
						  ]
				  ]
	  
				}];	 
				
function getSubProd(inRowIndex){
		var cell = this;
		setTimeout(function() { buildSubgridProd(inRowIndex, cell); }, 0);
		var h =0;
		if(detailRowsProd[inRowIndex]&&querydataProd[inRowIndex][$childRow].length>0){
							h=65+25*querydataProd[inRowIndex][$childRow].length;  		}
	return '<div style="height:'+h+'px; background-color: white;"></div>';
}				

//end buildLayout

var detailRowsProd=[];

function onBeforeRow(inDataIndex, inRow) {	if (inRow[1]!=undefined)inRow[1].hidden = !detailRowsProd[inDataIndex];}	

function toggleProd(inIndex, inShow) {
        			if (!inShow) destroySubGridIdGeneral('',querydataProd[inIndex][1],"ProdMainDetail");
					if (!inShow) destroySubGridIdGeneral('',querydataProd[inIndex][1],"ProdChild");
				    detailRowsProd[inIndex] = inShow;
				    dijit.byId("gridProd").updateRow(inIndex); 
				    
    } 

function getCheckProd(inRowIndex) {
	var image = (detailRowsProd[inRowIndex] ? 'open.gif' : 'closed.gif');
	var show = (detailRowsProd[inRowIndex] ? 'false' : 'true');
	return '<img src="../image/' + image + '" onclick="toggleProd(' + inRowIndex + ', ' + show + ')" height="11" width="11">';
}



//function makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString) {return parentRowIndex+"_"+idString+"_" + inRowIndex;		}

//function destroySubGridIdGeneral(parentRowIndex,inRowIndex,idString) {	var subGrid = dijit.byId(makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString));	if (subGrid) subGrid.destroy();	}

	  
function buildSubgridProd(inRowIndex, inCell) {  //makeSubgridIdMainDetail(id)Ç¸idmainDetailGridid
	if(inCell!=undefined && inCell.getNode(inRowIndex)!=undefined){
		var child = inCell.getNode(inRowIndex).firstChild;
		var idmainDetail = makeSubGridIdGeneral('',querydataProd[inRowIndex][1],"ProdMainDetail");//makeSubgridIdMainDetail(querydataProd[inRowIndex][1]);//taskmakeSubgridId(taskRowSubdata[inRowIndex][1]);
		var idchild = makeSubGridIdGeneral('',querydataProd[inRowIndex][1],"ProdChild");
		var subGridMainDetail = dijit.byId(idmainDetail);
		var subGridChild = dijit.byId(idchild);
		var dataChild=querydataProd[inRowIndex][$childRow];
		if(dataChild.length!=0){
			if (subGridChild){
				subGridChild.model.setData(dataChild);
				child.appendChild(subGridChild.domNode);
			}else{
				modelProdChild=new dojox.grid.data.Table(null, dataChild);
				var childProps= {
								autoHeight: true, 
								autoRender: false,
								rowCount:dataChild.length,
								model:modelProdChild,							};
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
		inCell.grid.rowHeightChanged(inRowIndex);
    }   
}
//var childLayout=//???????????????????????????????/ Ö±É£jshtml

function querybuttonProd(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvo.id=0 ;
              queryvoProd=new Object();
	          if(queryProdprodName.getDisplayedValue()!="")queryvoProd.prodName=queryProdprodName.getDisplayedValue();//
	          if(queryProdcode.getDisplayedValue()!="")queryvoProd.code=queryProdcode.getDisplayedValue();//
              n=queryNumber_fun("Prodprice");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvoProd.price=n;}  
              d=queryDate_fun("Proddatef");
              if(d==null){validstate=1;}else if(d.upSign!="%"){queryvoProd.datef=d;}
	          if(queryProdprodType.getDisplayedValue()!="")queryvoProd.prodType=queryProdprodType.getDisplayedValue();//
			
	if(queryProdprodCust.getDisplayedValue()!=""){
				var prodCustQuery= new Object();
				//prodCustQuery.ProdName=queryProdprodCust.getDisplayedValue();
				prodCustQuery.id=queryProdprodCust.getValue();
				queryvoProd.prodCust=prodCustQuery;
			  }
	if(queryProdprincipal.getDisplayedValue()!=""){
				var principalQuery= new Object();
				//principalQuery.ProdName=queryProdprincipal.getDisplayedValue();
				principalQuery.id=queryProdprincipal.getValue();
				queryvoProd.principal=principalQuery;
			  }

			if(validstate==0){
              pagenumberProd=1;
              getProdVO(queryvoProd); 
             }      
       }

function getProdVO(queryvo){
	var totalCount=0;
	deletedataProd =new Array();
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
	  gridProd.selection.clear();
      modelProd.setData(querydataProd);
      //dijit.byId("grid").updateRowCount(querydataProd.length); 
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

function init(){
	
 	gridProd.onStyleRow=OnStyleRowClassBlue();
	getProdVO(queryvoProd);
}

 dojo.addOnLoad(init);   

	function selectCustomerFun(rep){
		querydataProd[dojoProd.selectCustomerInRow][dojoProd.noCustomer]=rep;
		gridProd.updateRow(dojoProd.selectCustomerInRow);		
	}
	function selectPeoplesFun(rep){
		querydataProd[dojoProd.selectPeoplesInRow][dojoProd.noPeoples]=rep;
		gridProd.updateRow(dojoProd.selectPeoplesInRow);		
	}


function allopen(){
		if(styleSign==0){
          for(var i =0;i<querydataProd.length;i++){
            toggleProd(i,true);
          }
	    }else{
			for(var i =0;i<querydataProd.length;i++){
            toggleProd2(i,true);
          }
		}
 }  

function allclose(){
		if(styleSign==0){
          for(var i =0;i<querydataProd.length;i++){
            toggleProd(i,false);
          }
		}else{
			for(var i =0;i<querydataProd.length;i++){
            toggleProd2(i,false);
          }
		}
}

function pageSizeChangeProd(mylabel){
	pagesizeProd=mylabel;
	pagenumberProd=1;
	getProdVO(queryvoProd);
}

function allpageProd(){
	pagesizeProd=0;
	getProdVO(queryvoProd);
}

function upPageProd(){
	pagenumberProd--;
	getProdVO(queryvoProd);
}
function downPageProd(){
	pagenumberProd++;
	getProdVO(queryvoProd);
}

function pageStyleProd(style){//nomarl,col,noscroll
	gridProd.scrollToRow(0);
	if(style=="simply"){
		gridProd.setStructure(mainLayout);
		styleSign=0;
	}else if(style=="whole"){
		gridProd.setStructure(mainLayout2);
		styleSign=2;
	/*}else if(style=="noscroll"){
		gridOrderd.setStructure(layoutNoscroll);*/
	}
}


</script>
</head>	 
<body class="tundra">
 <!--rowinum=$rowinum-->

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
							<span id="queryProdpriceImg1"  style="{display:none}" ><input type="text" class="editerNumberSmall" jsid="queryProdprice1"  id="queryProdprice1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryProdpriceImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryProdpriceImgdown" >></span>
							<span id="queryProdpriceImg2div" style="{display:none}"> <input type="text" class="editerNumberSmall"  jsid="queryProdprice2"  id="queryProdprice2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/start.gif" onclick="queryType(this);" id="queryProdpriceImg" class="imgStyle">
							
						</td>  
								  </tr>
			                <tr>
							<td align="right" i18n="datef"  >datef:</td> 
						<td align="left"  colspan="3"><span id="queryProddatefImg0"  ><input class="editerDate"   jsId="queryProddatef" id="queryProddatef"  constraints="{datePattern:'yyyy-MM-dd'}" dojoType="dijit.form.DateTextBox"  />
							<input class="editerTime" jsid="queryProddatefTime" id="queryProddatefTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
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
	<button dojoType="dijit.form.Button" onclick="querydisplay('queryDivProd');" iconClass="queryIcon"  i18n="openQuery" >query</button>
	<span id="rowCountProd"></span>
		<button dojoType="dijit.form.myButton" onclick="upPageProd();"  id="but6Prod" disabled='true' jsId="but6Prod" iconClass="upPageIcon" ></button><!--span dojoType="dijit.Tooltip" connectId="but6">pageup</span-->
		<button dojoType="dijit.form.myButton" onclick="downPageProd();" id="but7Prod" disabled='true' jsId="but7Prod" iconClass="downPageIcon" ></button><!--span dojoType="dijit.Tooltip" connectId="but7">pagedown</span-->
		<div  dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
			  <div dojoType="dijit.Menu">
				  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChangeProd(this.label);"></div>
				  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChangeProd(this.label);"></div>
			  <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChangeProd(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChangeProd(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpageProd();"></div>
			  </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
		</div>
		<button dojoType="dijit.form.myButton" onclick="allopen();"  iconClass="allopenIcon" ></button>
		<button dojoType="dijit.form.myButton" onclick="allclose();" iconClass="allcloseIcon"  ></button>
		</td>
	</tr>
</table>	    

<div id="gridProd"  dojoType="dojox.Grid"  autoWidth="false" style="{width:100%;height:85%}" 	jsId="gridProd"	model="modelProd" structure="mainLayout"  ></div>
</body>
<script type="text/javascript">trans18tag();</script>
</html>					 





















					
