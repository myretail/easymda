<%
String peopleId = request.getParameter("peopleId");
%>
<html>
<!--Ò»Ô¶à£¬Ö»Ò»Ò»Ó±í£¬Ã»Ð¿Ò»Ô¶Ó±var dataChild=querydataOrderd[inRowIndex]-->
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
			dojo.require("projectDojo.Orderd");
     </script>
        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 			<script type="text/javascript" src="../order/OrderdGridStyle2.js"></script>
	 <script type="text/javascript" >
		var dojoOrderd= new  projectDojo.Orderd();
	    dojoOrderd.initOrderd();
	//å¤æ­æ¯å¦æ¯ä¸»è¡¨		
																			</script>
	 	 					<script type="text/javascript" src="../order/OrderRowdSubQuery.js"></script>
			
			<!--sub Table script    eg:taskRow.js    Ð¶Ç·Îªí£¬Ò³Ê¼Ó±childRow=0-->
							 
	<script type="text/javascript" >
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
	  var modelOrderdDetail;
	  var modelOrderdChild;
	  

//have set function's manageableAssociationEnds
	function orderRowSet(id,value){
        	/*var itemselect=orderRowStore._getItemByIdentity(value);
				if(itemselect!='undefined'&& itemselect!=null){
				}*/
	}
	function customerSet(id,value){
        	/*var itemselect=customerStore._getItemByIdentity(value);
				if(itemselect!='undefined'&& itemselect!=null){
				}*/
	}

																																 //rowint======15====  8



var mainLayout =[{//Þ¸Ä¸ÒªÏ¢Ö¶Ê±ÒªÞ¸Ó¦colSpantoggle
					onBeforeRow: onBeforeRow,
					 cells: [
                      [
						{ name: i18nStr.detail, width: 3, get: getCheckOrderd, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
					  				  {name: i18nStr.customerOrderNo, field: 2,width: 10}
						  								  				,   {name: i18nStr.contractNo, field: 3,width: 10}
						  								  				,   {name: i18nStr.conveyanceEnum, field: 4,width: 10}
						  								  				,   {name: i18nStr.carryTypeEnum, field: 5,width: 10}
						  								  				,   {name: i18nStr.shipperRemark, field: 6,width: 10}
						  								  				,   {name: i18nStr.carrierRemark, field: 7,width: 10}
						  								  				,   {name: i18nStr.levelEnum, field: 8,width: 10}
						  											
//
	//
						],[
							{ name: '\u8be6\u7ec6', colSpan: 12,styles: 'padding: 0; margin: 0;', get: getDetailOrderd }//value: '<div style="height:0px; background-color: white;"></div>'
						  ]
				  ]
	  
				}];	 


function buildMainDetailLayout(pre,mystyle){
var myLayout=[{noscroll: true,
					 cells: [
                      [
					  							  			  
							  							  			  
							  							  			  
							  							  			  
							  							  			  
							  							  			  
							  							  			  
							  									  {name: pre+i18nStr.customerTypeEnum, field: 9,width: 10,headerStyles:mystyle}
										
							  			  
							  									,   {name: pre+i18nStr.referTime,field:10, width: 8,headerStyles:mystyle}
										
							  			  
							  									,   {name: pre+i18nStr.linkMan, field: 11,width: 10,headerStyles:mystyle}
										
							  			  
							  									,   {name: pre+i18nStr.tel, field: 12,width: 10,headerStyles:mystyle}
										
							  			  
							  									,   {name: pre+i18nStr.bookTime,field:13, width: 8,headerStyles:mystyle}
										
							  			  
							  									,   {name: pre+i18nStr.completeTime,field:14, width: 8,headerStyles:mystyle}
										
							  			  
							  									,   {name: pre+i18nStr.remark, field: 15,width: 10,headerStyles:mystyle}
										
							  			  
				
//

				//

								 ,   {name: i18nStr.customer,field: 17,get:function(inRowIndex){ var str='';if(querydataOrderd[inRowIndex]!=undefined && querydataOrderd[inRowIndex][17]!=undefined){str=querydataOrderd[inRowIndex][17][2];} return str;} ,width: 10,headerStyles:mystyle }
			 										]]}];	 
	return  myLayout;
}

var mainDetailLayout;
var mainDetailLayoutOdd;
mainDetailLayout= buildMainDetailLayout(pre,headerstyle);
mainDetailLayoutOdd=buildMainDetailLayout(pre,headerstyleodd);

function getDetailOrderd(inRowIndex){
		var cell = this;
		setTimeout(function() { buildSubgridOrderd(inRowIndex, cell); }, 0);
		var h =0;
		if(detailRowsOrderd[inRowIndex]&&querydataOrderd[inRowIndex][16].length>0){
							h=65+25*querydataOrderd[inRowIndex][16].length;  		}
	return '<div style="height:45px; background-color: white;"></div><div style="height:'+h+'px; background-color: white;"></div>';
}

//end buildLayout

var detailRowsOrderd=[];

function onBeforeRow(inDataIndex, inRow) {	if (inRow[1]!=undefined)inRow[1].hidden = !detailRowsOrderd[inDataIndex];}	

function toggleOrderd(inIndex, inShow) {
        			if (!inShow) destroySubGridIdGeneral('',querydataOrderd[inIndex][1],"OrderdMainDetail");
					if (!inShow) destroySubGridIdGeneral('',querydataOrderd[inIndex][1],"OrderdChild");
				    detailRowsOrderd[inIndex] = inShow;
				    dijit.byId("gridOrderd").updateRow(inIndex); 
				    
    } 

function getCheckOrderd(inRowIndex) {
	var image = (detailRowsOrderd[inRowIndex] ? 'open.gif' : 'closed.gif');
	var show = (detailRowsOrderd[inRowIndex] ? 'false' : 'true');
	return '<img src="../image/' + image + '" onclick="toggleOrderd(' + inRowIndex + ', ' + show + ')" height="11" width="11">';
}



//function makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString) {return parentRowIndex+"_"+idString+"_" + inRowIndex;		}

//function destroySubGridIdGeneral(parentRowIndex,inRowIndex,idString) {	var subGrid = dijit.byId(makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString));	if (subGrid) subGrid.destroy();	}

	  
function buildSubgridOrderd(inRowIndex, inCell) {  //makeSubgridIdMainDetail(id)Ç¸idmainDetailGridid
	if(inCell!=undefined && inCell.getNode(inRowIndex)!=undefined){
		var mainDetail = inCell.getNode(inRowIndex).firstChild;
		var child = inCell.getNode(inRowIndex).lastChild;
		var idmainDetail = makeSubGridIdGeneral('',querydataOrderd[inRowIndex][1],"OrderdMainDetail");//makeSubgridIdMainDetail(querydataOrderd[inRowIndex][1]);//taskmakeSubgridId(taskRowSubdata[inRowIndex][1]);
		var idchild = makeSubGridIdGeneral('',querydataOrderd[inRowIndex][1],"OrderdChild");
		var subGridMainDetail = dijit.byId(idmainDetail);
		var subGridChild = dijit.byId(idchild);
		var dataChild=querydataOrderd[inRowIndex][16];
		if(dataChild.length!=0){
			if (subGridChild){
				subGridChild.model.setData(dataChild);
				child.appendChild(subGridChild.domNode);
			}else{
				modelOrderdChild=new dojox.grid.data.Table(null, dataChild);
				var childProps= {
								autoHeight: true, 
								autoRender: false,
								rowCount:dataChild.length,
								model:modelOrderdChild,							};
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
		var detailDate=[];
		detailDate[0]=querydataOrderd[inRowIndex];  
	    modelOrderdDetail=new dojox.grid.data.Table(null, detailDate);
		if (subGridMainDetail) {
			subGridMainDetail.model.setData(detailDate);
			mainDetail.appendChild(subGridMainDetail.domNode);
		} else {
			var mainDetailProps = {
				rowCount: 1, 
				autoHeight: true, 
				autoRender: false,
				model:modelOrderdDetail
				};
				mainDetailProps.dataRow = inRowIndex;
				mainDetailProps.id = idmainDetail;//	tasksubGridProps.widgetId = id;
				if(Math.ceil(inRowIndex/2)>inRowIndex/2){
					mainDetailProps.structure=mainDetailLayoutOdd;
				}else{
					mainDetailProps.structure=mainDetailLayout;
				}
				subGridMainDetail = new dojox.Grid(mainDetailProps, mainDetail );
		}
			
		if (subGridMainDetail) {
				subGridMainDetail.render();
				subGridMainDetail.cacheHeight = subGridMainDetail.domNode.offsetHeight;
			}	
		inCell.grid.rowHeightChanged(inRowIndex);
    }   
}
//var childLayout=//???????????????????????????????/ Ö±É£jshtml

function querybuttonOrderd(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvo.id=0 ;
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
				var orderRowQuery= new Object();
				//orderRowQuery.OrderdName=queryOrderdorderRow.getDisplayedValue();
				orderRowQuery.id=queryOrderdorderRow.getValue();
				queryvoOrderd.orderRow=orderRowQuery;
			  }
	if(queryOrderdcustomer.getDisplayedValue()!=""){
				var customerQuery= new Object();
				//customerQuery.OrderdName=queryOrderdcustomer.getDisplayedValue();
				customerQuery.id=queryOrderdcustomer.getValue();
				queryvoOrderd.customer=customerQuery;
			  }

			if(validstate==0){
              pagenumberOrderd=1;
              getOrderdVO(queryvoOrderd); 
             }      
       }

function getOrderdVO(queryvo){
	var totalCount=0;
	deletedataOrderd =new Array();
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
	  gridOrderd.selection.clear();
      modelOrderd.setData(querydataOrderd);
      //dijit.byId("grid").updateRowCount(querydataOrderd.length); 
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

function init(){
	
 	gridOrderd.onStyleRow=OnStyleRowClassBlue();
	getOrderdVO(queryvoOrderd);
}

 dojo.addOnLoad(init);   

	function selectOrderRowdFun(rep){
		querydataOrderd[dojoOrderd.selectOrderRowdInRow][dojoOrderd.noOrderRowd]=rep;
		gridOrderd.updateRow(dojoOrderd.selectOrderRowdInRow);		
	}
	function selectCustomerFun(rep){
		querydataOrderd[dojoOrderd.selectCustomerInRow][dojoOrderd.noCustomer]=rep;
		gridOrderd.updateRow(dojoOrderd.selectCustomerInRow);		
	}


function allopen(){
		if(styleSign==0){
          for(var i =0;i<querydataOrderd.length;i++){
            toggleOrderd(i,true);
          }
	    }else{
			for(var i =0;i<querydataOrderd.length;i++){
            toggleOrderd2(i,true);
          }
		}
 }  

function allclose(){
		if(styleSign==0){
          for(var i =0;i<querydataOrderd.length;i++){
            toggleOrderd(i,false);
          }
		}else{
			for(var i =0;i<querydataOrderd.length;i++){
            toggleOrderd2(i,false);
          }
		}
}

function pageSizeChangeOrderd(mylabel){
	pagesizeOrderd=mylabel;
	pagenumberOrderd=1;
	getOrderdVO(queryvoOrderd);
}

function allpageOrderd(){
	pagesizeOrderd=0;
	getOrderdVO(queryvoOrderd);
}

function upPageOrderd(){
	pagenumberOrderd--;
	getOrderdVO(queryvoOrderd);
}
function downPageOrderd(){
	pagenumberOrderd++;
	getOrderdVO(queryvoOrderd);
}

function pageStyleOrderd(style){//nomarl,col,noscroll
	gridOrderd.scrollToRow(0);
	if(style=="simply"){
		gridOrderd.setStructure(mainLayout);
		styleSign=0;
	}else if(style=="whole"){
		gridOrderd.setStructure(mainLayout2);
		styleSign=2;
	/*}else if(style=="noscroll"){
		gridOrderd.setStructure(layoutNoscroll);*/
	}
}


</script>
</head>	 
<body class="tundra">
 <!--rowinum=$rowinum-->

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
							<input class="editerTime" jsid="queryOrderdcompleteTimeTime" id="queryOrderdcompleteTimeTime" value="00:00" dojoType="dijit.form.TimeTextBox" constraints="{timePattern:'HH:mm'}"   invalidMessage="Invalid time. Use HH:mm where HH is 00 - 23 hours."></span>
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
	<button dojoType="dijit.form.Button" onclick="querydisplay('queryDivOrderd');" iconClass="queryIcon"  i18n="openQuery" >query</button>
	<span id="rowCountOrderd"></span>
		<button dojoType="dijit.form.myButton" onclick="upPageOrderd();"  id="but6Orderd" disabled='true' jsId="but6Orderd" iconClass="upPageIcon" ></button><!--span dojoType="dijit.Tooltip" connectId="but6">pageup</span-->
		<button dojoType="dijit.form.myButton" onclick="downPageOrderd();" id="but7Orderd" disabled='true' jsId="but7Orderd" iconClass="downPageIcon" ></button><!--span dojoType="dijit.Tooltip" connectId="but7">pagedown</span-->
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
							 <div dojoType="dijit.MenuItem"  iconClass="rowIcon"		label="simply"	onClick="pageStyleOrderd(this.label);"></div>
							 <div dojoType="dijit.MenuItem"  iconClass="colIcon"		label="whole"	onClick="pageStyleOrderd(this.label);"></div>
							
						</div></div>
		<button dojoType="dijit.form.myButton" onclick="allopen();"  iconClass="allopenIcon" ></button>
		<button dojoType="dijit.form.myButton" onclick="allclose();" iconClass="allcloseIcon"  ></button>
		</td>
	</tr>
</table>	    

<div id="gridOrderd"  dojoType="dojox.Grid"  autoWidth="false" style="{width:100%;height:85%}" 	jsId="gridOrderd"	model="modelOrderd" structure="mainLayout"  ></div>
</body>
<script type="text/javascript">trans18tag();</script>
</html>					 





















					
