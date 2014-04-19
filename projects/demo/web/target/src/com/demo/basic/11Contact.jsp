<%
String peopleId = request.getParameter("peopleId");
%>
<html>
<!--????¨¤?????????¡À¨ª???????????¡Àvar dataChild=querydataContact[inRowIndex]-->
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
			dojo.require("projectDojo.Contact");
     </script>
        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 			<script type="text/javascript" src="../basic/ContactGridStyle2.js"></script>
	 <script type="text/javascript" >
		var dojoContact= new  projectDojo.Contact();
	    dojoContact.initContact();
	</script>
	 	 				 
	<script type="text/javascript" >
	  var urlContact = getUrl()+ "services/ContactManageService";
	  var deletedataContact =  new Array();
	  var querydataContact =  new Array();
	  var pagenumberContact=1;
	  var totalCountContact=0;
	  var pagesizeContact=10;
	  var orderByContact='0';
	  var queryvoContact=new Object();
	  var oddstyle='';
	  var modelContact = new dojox.grid.data.Table(null, querydataContact);
	  var urle = getUrl()+ "services/BasicManageService";
	  var modelContactDetail;
	  var modelContactChild;
	  

//have set function's manageableAssociationEnds
	function customerSet(id,value){
        	/*var itemselect=customerStore._getItemByIdentity(value);
				if(itemselect!='undefined'&& itemselect!=null){
				}*/
	}

					//begin buildLayout
var mainLayout =[{//???????????¡À??????colSpantoggle
					onBeforeRow: onBeforeRow,
					 cells: [
                      [
						{ name: i18nStr.detail, width: 3, get: getCheckContact, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
				  				  {name: i18nStr.codeContact, field: 2,width: 10}
						  				
//
					 ,   {name: i18nStr.customer,field: 3,get:function(inRowIndex){ var str='';if(querydataContact[inRowIndex]!=undefined && querydataContact[inRowIndex][3]!=undefined){str=querydataContact[inRowIndex][3][2];} return str;} ,width: 10 }
										],[
							
							{ name: '\u8be6\u7ec6', colSpan: 4 ,styles: 'padding: 0; margin: 0;', get: getSubContact }//value: '<div style="height:0px; background-color: white;"></div>'
						  ]
				  ]
	  
				}];	 
				
function getSubContact(inRowIndex){
		var cell = this;
		setTimeout(function() { buildSubgridContact(inRowIndex, cell); }, 0);
		var h =0;
		if(detailRowsContact[inRowIndex]&&querydataContact[inRowIndex][$childRow].length>0){
							h=65+25*querydataContact[inRowIndex][$childRow].length;  		}
	return '<div style="height:'+h+'px; background-color: white;"></div>';
}				

//end buildLayout

var detailRowsContact=[];

function onBeforeRow(inDataIndex, inRow) {	if (inRow[1]!=undefined)inRow[1].hidden = !detailRowsContact[inDataIndex];}	

function toggleContact(inIndex, inShow) {
        			if (!inShow) destroySubGridIdGeneral('',querydataContact[inIndex][1],"ContactMainDetail");
					if (!inShow) destroySubGridIdGeneral('',querydataContact[inIndex][1],"ContactChild");
				    detailRowsContact[inIndex] = inShow;
				    dijit.byId("gridContact").updateRow(inIndex); 
				    
    } 

function getCheckContact(inRowIndex) {
	var image = (detailRowsContact[inRowIndex] ? 'open.gif' : 'closed.gif');
	var show = (detailRowsContact[inRowIndex] ? 'false' : 'true');
	return '<img src="../image/' + image + '" onclick="toggleContact(' + inRowIndex + ', ' + show + ')" height="11" width="11">';
}



//function makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString) {return parentRowIndex+"_"+idString+"_" + inRowIndex;		}

//function destroySubGridIdGeneral(parentRowIndex,inRowIndex,idString) {	var subGrid = dijit.byId(makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString));	if (subGrid) subGrid.destroy();	}

	  
function buildSubgridContact(inRowIndex, inCell) {  //makeSubgridIdMainDetail(id)??idmainDetailGridid
	if(inCell!=undefined && inCell.getNode(inRowIndex)!=undefined){
		var child = inCell.getNode(inRowIndex).firstChild;
		var idmainDetail = makeSubGridIdGeneral('',querydataContact[inRowIndex][1],"ContactMainDetail");//makeSubgridIdMainDetail(querydataContact[inRowIndex][1]);//taskmakeSubgridId(taskRowSubdata[inRowIndex][1]);
		var idchild = makeSubGridIdGeneral('',querydataContact[inRowIndex][1],"ContactChild");
		var subGridMainDetail = dijit.byId(idmainDetail);
		var subGridChild = dijit.byId(idchild);
		var dataChild=querydataContact[inRowIndex][$childRow];
		if(dataChild.length!=0){
			if (subGridChild){
				subGridChild.model.setData(dataChild);
				child.appendChild(subGridChild.domNode);
			}else{
				modelContactChild=new dojox.grid.data.Table(null, dataChild);
				var childProps= {
								autoHeight: true, 
								autoRender: false,
								rowCount:dataChild.length,
								model:modelContactChild,							};
				childProps.dataRow = inRowIndex;
				childProps.id = idchild;
				if(Math.ceil(inRowIndex/2)>inRowIndex/2){
					childProps.structure=childLayoutOdd;
				}else{
					childProps.structure=childLayout;
				}
				subGridChild = new dojox.Grid(childProps, child);//grid????¡Á¡À?¡À??DIV????
			}
			if (subGridChild) {
				subGridChild.render();
				subGridChild.cacheHeight = subGridChild.domNode.offsetHeight;
			}	      				
		}
		inCell.grid.rowHeightChanged(inRowIndex);
    }   
}
//var childLayout=//???????????????????????????????/ ?¡À??jshtml

function querybuttonContact(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvo.id=0 ;
              queryvoContact=new Object();
	          if(queryContactcodeContact.getDisplayedValue()!="")queryvoContact.codeContact=queryContactcodeContact.getDisplayedValue();//
			
	if(queryContactcustomer.getDisplayedValue()!=""){
				var customerQuery= new Object();
				//customerQuery.ContactName=queryContactcustomer.getDisplayedValue();
				customerQuery.id=queryContactcustomer.getValue();
				queryvoContact.customer=customerQuery;
			  }

			if(validstate==0){
              pagenumberContact=1;
              getContactVO(queryvoContact); 
             }      
       }

function getContactVO(queryvo){
	var totalCount=0;
	deletedataContact =new Array();
      var pu = new SOAPClientParameters2();
      pu.add('ContactVO',queryvo) ;
      pu.add('pageNumber',pagenumberContact) ;
	    pu.add('pageSize',pagesizeContact) ;
	    pu.add('orderBy',orderByContact) ;
      SOAPClient.invoke(urlContact,"getContact", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydataContact=new Array();
		   querydataContact=dojoContact.ContactVOtoArray_fun(ul,false);
           totalCountContact=ul[ul.length-1]["ns:id"]; 
      }); 
      querydataContact.splice(querydataContact.length-1,1);
	  gridContact.selection.clear();
      modelContact.setData(querydataContact);
      //dijit.byId("grid").updateRowCount(querydataContact.length); 
	   var totalpage=Math.ceil(new Number(totalCountContact)/pagesizeContact);
	  
	if(totalpage>1){
		if(pagenumberContact==1){
			dijit.byId("but6Contact").setDisabled(true);
			dijit.byId("but7Contact").setDisabled(false);
		}else if(pagenumberContact==totalpage){
			dijit.byId("but6Contact").setDisabled(false);
			dijit.byId("but7Contact").setDisabled(true);
		}else{
			dijit.byId("but6Contact").setDisabled(false);
			dijit.byId("but7Contact").setDisabled(false);
		}
	}else{
		dijit.byId("but6Contact").setDisabled(true);
		dijit.byId("but7Contact").setDisabled(true);
	
	}
	if(pagesizeContact==0){
		totalpage=1;
		dijit.byId("but6Contact").setDisabled(true);
		dijit.byId("but7Contact").setDisabled(true);
	}
	if(totalpage==1)pagenumberContact=1;
	
	 document.getElementById("rowCountContact").innerHTML=i18nStr.di+" "+pagenumberContact+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountContact+" "+i18nStr.rowSize; 	
}

function init(){
	
 	gridContact.onStyleRow=OnStyleRowClassBlue();
	getContactVO(queryvoContact);
}

 dojo.addOnLoad(init);   

	function selectCustomerFun(rep){
		querydataContact[dojoContact.selectCustomerInRow][dojoContact.noCustomer]=rep;
		gridContact.updateRow(dojoContact.selectCustomerInRow);		
	}


function allopen(){
		if(styleSign==0){
          for(var i =0;i<querydataContact.length;i++){
            toggleContact(i,true);
          }
	    }else{
			for(var i =0;i<querydataContact.length;i++){
            toggleContact2(i,true);
          }
		}
 }  

function allclose(){
		if(styleSign==0){
          for(var i =0;i<querydataContact.length;i++){
            toggleContact(i,false);
          }
		}else{
			for(var i =0;i<querydataContact.length;i++){
            toggleContact2(i,false);
          }
		}
}

function pageSizeChangeContact(mylabel){
	pagesizeContact=mylabel;
	pagenumberContact=1;
	getContactVO(queryvoContact);
}

function allpageContact(){
	pagesizeContact=0;
	getContactVO(queryvoContact);
}

function upPageContact(){
	pagenumberContact--;
	getContactVO(queryvoContact);
}
function downPageContact(){
	pagenumberContact++;
	getContactVO(queryvoContact);
}

function pageStyleContact(style){//nomarl,col,noscroll
	gridContact.scrollToRow(0);
	if(style=="simply"){
		gridContact.setStructure(mainLayout);
		styleSign=0;
	}else if(style=="whole"){
		gridContact.setStructure(mainLayout2);
		styleSign=2;
	/*}else if(style=="noscroll"){
		gridOrderd.setStructure(layoutNoscroll);*/
	}
}


</script>
</head>	 
<body class="tundra">
 <!--rowinum=$rowinum-->

<div id="queryDivContact" style="margin-right: 0px;  height: 80px; display:none;" >
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
							<td align="right" i18n="codeContact" >codeContact:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="queryContactcodeContact"  jsId="queryContactcodeContact"   dojoType="dijit.form.TextBox"  />
													</td>
				


			
					<td align="right"  i18n="customer"  ></td>
					<td align="left" colspan="3"  ><!----><input  id="queryContactcustomer"  jsId="queryContactcustomer" class="selectInput" dojoType="dijit.form.myFilteringSelect" store="dojoContact.customerStore"  /><div dojoType="dijit.form.myDropDownButton" iconClass="dialogIcon"  ><div dojoType="dijit.TooltipDialog"  href="../common/queryCustomerFloat.html"title="detail" execute="" ></div></div></td>  
					
	    <td align="right"    ></td><td align="right"    ></td></tr>

         <tr align="center"><td></td>
           <td colspan="1"> <button dojoType="dijit.form.Button" onclick="querybuttonContact();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="1"><button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="3"></td></tr>
         </table>
</div>	

<table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   Contact List</b></td>
		<td align="right" >
	<button dojoType="dijit.form.Button" onclick="querydisplay('queryDivContact');" iconClass="queryIcon"  i18n="openQuery" >query</button>
	<span id="rowCountContact"></span>
		<button dojoType="dijit.form.myButton" onclick="upPageContact();"  id="but6Contact" disabled='true' jsId="but6Contact" iconClass="upPageIcon" ></button><!--span dojoType="dijit.Tooltip" connectId="but6">pageup</span-->
		<button dojoType="dijit.form.myButton" onclick="downPageContact();" id="but7Contact" disabled='true' jsId="but7Contact" iconClass="downPageIcon" ></button><!--span dojoType="dijit.Tooltip" connectId="but7">pagedown</span-->
		<div  dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
			  <div dojoType="dijit.Menu">
				  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChangeContact(this.label);"></div>
				  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChangeContact(this.label);"></div>
			  <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChangeContact(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChangeContact(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpageContact();"></div>
			  </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
		</div>
		<button dojoType="dijit.form.myButton" onclick="allopen();"  iconClass="allopenIcon" ></button>
		<button dojoType="dijit.form.myButton" onclick="allclose();" iconClass="allcloseIcon"  ></button>
		</td>
	</tr>
</table>	    

<div id="gridContact"  dojoType="dojox.Grid"  autoWidth="false" style="{width:100%;height:85%}" 	jsId="gridContact"	model="modelContact" structure="mainLayout"  ></div>
</body>
<script type="text/javascript">trans18tag();</script>
</html>					 





















					
