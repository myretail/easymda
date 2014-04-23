<%
String peopleId = request.getParameter("peopleId");
%>
<html>
<!--Ò»Ô¶à£¬Ö»Ò»Ò»Ó±í£¬Ã»Ð¿Ò»Ô¶Ó±var dataChild=querydataCustomer[inRowIndex]-->
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
			dojo.require("projectDojo.Customer");
     </script>
        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 			<script type="text/javascript" src="../basic/CustomerGridStyle2.js"></script>
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
			</script>
	 	 	 
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
	  var modelCustomerDetail;
	  var modelCustomerChild;
	  

//have set function's manageableAssociationEnds

					//begin buildLayout
var mainLayout =[{//Þ¸Ä¸ÒªÏ¢Ö¶Ê±ÒªÞ¸Ó¦colSpantoggle
					onBeforeRow: onBeforeRow,
					 cells: [
                      [
						{ name: i18nStr.detail, width: 3, get: getCheckCustomer, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
				  				  {name: i18nStr.customerName, field: 2,width: 10}
						  						  				,   {name: i18nStr.custEnum, field: 3,width: 10}
						  				
					],[
							
							{ name: '\u8be6\u7ec6', colSpan: 4 ,styles: 'padding: 0; margin: 0;', get: getSubCustomer }//value: '<div style="height:0px; background-color: white;"></div>'
						  ]
				  ]
	  
				}];	 
				
function getSubCustomer(inRowIndex){
		var cell = this;
		setTimeout(function() { buildSubgridCustomer(inRowIndex, cell); }, 0);
		var h =0;
		if(detailRowsCustomer[inRowIndex]&&querydataCustomer[inRowIndex][$childRow].length>0){
							h=65+25*querydataCustomer[inRowIndex][$childRow].length;  		}
	return '<div style="height:'+h+'px; background-color: white;"></div>';
}				

//end buildLayout

var detailRowsCustomer=[];

function onBeforeRow(inDataIndex, inRow) {	if (inRow[1]!=undefined)inRow[1].hidden = !detailRowsCustomer[inDataIndex];}	

function toggleCustomer(inIndex, inShow) {
        			if (!inShow) destroySubGridIdGeneral('',querydataCustomer[inIndex][1],"CustomerMainDetail");
					if (!inShow) destroySubGridIdGeneral('',querydataCustomer[inIndex][1],"CustomerChild");
				    detailRowsCustomer[inIndex] = inShow;
				    dijit.byId("gridCustomer").updateRow(inIndex); 
				    
    } 

function getCheckCustomer(inRowIndex) {
	var image = (detailRowsCustomer[inRowIndex] ? 'open.gif' : 'closed.gif');
	var show = (detailRowsCustomer[inRowIndex] ? 'false' : 'true');
	return '<img src="../image/' + image + '" onclick="toggleCustomer(' + inRowIndex + ', ' + show + ')" height="11" width="11">';
}



//function makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString) {return parentRowIndex+"_"+idString+"_" + inRowIndex;		}

//function destroySubGridIdGeneral(parentRowIndex,inRowIndex,idString) {	var subGrid = dijit.byId(makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString));	if (subGrid) subGrid.destroy();	}

	  
function buildSubgridCustomer(inRowIndex, inCell) {  //makeSubgridIdMainDetail(id)Ç¸idmainDetailGridid
	if(inCell!=undefined && inCell.getNode(inRowIndex)!=undefined){
		var child = inCell.getNode(inRowIndex).firstChild;
		var idmainDetail = makeSubGridIdGeneral('',querydataCustomer[inRowIndex][1],"CustomerMainDetail");//makeSubgridIdMainDetail(querydataCustomer[inRowIndex][1]);//taskmakeSubgridId(taskRowSubdata[inRowIndex][1]);
		var idchild = makeSubGridIdGeneral('',querydataCustomer[inRowIndex][1],"CustomerChild");
		var subGridMainDetail = dijit.byId(idmainDetail);
		var subGridChild = dijit.byId(idchild);
		var dataChild=querydataCustomer[inRowIndex][$childRow];
		if(dataChild.length!=0){
			if (subGridChild){
				subGridChild.model.setData(dataChild);
				child.appendChild(subGridChild.domNode);
			}else{
				modelCustomerChild=new dojox.grid.data.Table(null, dataChild);
				var childProps= {
								autoHeight: true, 
								autoRender: false,
								rowCount:dataChild.length,
								model:modelCustomerChild,							};
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

function querybuttonCustomer(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvo.id=0 ;
              queryvoCustomer=new Object();
	          if(queryCustomercustomerName.getDisplayedValue()!="")queryvoCustomer.customerName=queryCustomercustomerName.getDisplayedValue();//
	          if(queryCustomercustEnum.getDisplayedValue()!="")queryvoCustomer.custEnum=queryCustomercustEnum.getDisplayedValue();//
			

			if(validstate==0){
              pagenumberCustomer=1;
              getCustomerVO(queryvoCustomer); 
             }      
       }

function getCustomerVO(queryvo){
	var totalCount=0;
	deletedataCustomer =new Array();
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
	  gridCustomer.selection.clear();
      modelCustomer.setData(querydataCustomer);
      //dijit.byId("grid").updateRowCount(querydataCustomer.length); 
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

function init(){
	
 	gridCustomer.onStyleRow=OnStyleRowClassBlue();
	getCustomerVO(queryvoCustomer);
}

 dojo.addOnLoad(init);   



function allopen(){
		if(styleSign==0){
          for(var i =0;i<querydataCustomer.length;i++){
            toggleCustomer(i,true);
          }
	    }else{
			for(var i =0;i<querydataCustomer.length;i++){
            toggleCustomer2(i,true);
          }
		}
 }  

function allclose(){
		if(styleSign==0){
          for(var i =0;i<querydataCustomer.length;i++){
            toggleCustomer(i,false);
          }
		}else{
			for(var i =0;i<querydataCustomer.length;i++){
            toggleCustomer2(i,false);
          }
		}
}

function pageSizeChangeCustomer(mylabel){
	pagesizeCustomer=mylabel;
	pagenumberCustomer=1;
	getCustomerVO(queryvoCustomer);
}

function allpageCustomer(){
	pagesizeCustomer=0;
	getCustomerVO(queryvoCustomer);
}

function upPageCustomer(){
	pagenumberCustomer--;
	getCustomerVO(queryvoCustomer);
}
function downPageCustomer(){
	pagenumberCustomer++;
	getCustomerVO(queryvoCustomer);
}

function pageStyleCustomer(style){//nomarl,col,noscroll
	gridCustomer.scrollToRow(0);
	if(style=="simply"){
		gridCustomer.setStructure(mainLayout);
		styleSign=0;
	}else if(style=="whole"){
		gridCustomer.setStructure(mainLayout2);
		styleSign=2;
	/*}else if(style=="noscroll"){
		gridOrderd.setStructure(layoutNoscroll);*/
	}
}


</script>
</head>	 
<body class="tundra">
 <!--rowinum=$rowinum-->

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
	<button dojoType="dijit.form.Button" onclick="querydisplay('queryDivCustomer');" iconClass="queryIcon"  i18n="openQuery" >query</button>
	<span id="rowCountCustomer"></span>
		<button dojoType="dijit.form.myButton" onclick="upPageCustomer();"  id="but6Customer" disabled='true' jsId="but6Customer" iconClass="upPageIcon" ></button><!--span dojoType="dijit.Tooltip" connectId="but6">pageup</span-->
		<button dojoType="dijit.form.myButton" onclick="downPageCustomer();" id="but7Customer" disabled='true' jsId="but7Customer" iconClass="downPageIcon" ></button><!--span dojoType="dijit.Tooltip" connectId="but7">pagedown</span-->
		<div  dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
			  <div dojoType="dijit.Menu">
				  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChangeCustomer(this.label);"></div>
				  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChangeCustomer(this.label);"></div>
			  <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChangeCustomer(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChangeCustomer(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpageCustomer();"></div>
			  </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
		</div>
		<button dojoType="dijit.form.myButton" onclick="allopen();"  iconClass="allopenIcon" ></button>
		<button dojoType="dijit.form.myButton" onclick="allclose();" iconClass="allcloseIcon"  ></button>
		</td>
	</tr>
</table>	    

<div id="gridCustomer"  dojoType="dojox.Grid"  autoWidth="false" style="{width:100%;height:85%}" 	jsId="gridCustomer"	model="modelCustomer" structure="mainLayout"  ></div>
</body>
<script type="text/javascript">trans18tag();</script>
</html>					 





















					
