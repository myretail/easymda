<%
String peopleId = request.getParameter("peopleId");
%>
<html>
<!--????¨¤?????????¡À¨ª???????????¡Àvar dataChild=querydataOrga[inRowIndex]-->
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
			dojo.require("projectDojo.Orga");
     </script>
        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 			<script type="text/javascript" src="../orga/OrgaGridStyle2.js"></script>
	 <script type="text/javascript" >
		var dojoOrga= new  projectDojo.Orga();
	    dojoOrga.initOrga();
	//??¡è???????????????¨¨?¡§		
							 var dojoOrgaPeoples= new  projectDojo.OrgaPeoples();
			dojoOrgaPeoples.initOrgaPeoples();
			</script>
	 	 	 
	<script type="text/javascript" >
	  var urlOrga = getUrl()+ "services/OrgaManageService";
	  var deletedataOrga =  new Array();
	  var querydataOrga =  new Array();
	  var pagenumberOrga=1;
	  var totalCountOrga=0;
	  var pagesizeOrga=10;
	  var orderByOrga='0';
	  var queryvoOrga=new Object();
	  var oddstyle='';
	  var modelOrga = new dojox.grid.data.Table(null, querydataOrga);
	  var urle = getUrl()+ "services/BasicManageService";
	  var modelOrgaDetail;
	  var modelOrgaChild;
	  

//have set function's manageableAssociationEnds

											//begin buildLayout
var mainLayout =[{//???????????¡À??????colSpantoggle
					onBeforeRow: onBeforeRow,
					 cells: [
                      [
						{ name: i18nStr.detail, width: 3, get: getCheckOrga, styles: 'text-align: center;' },
						{ name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
				  				  {name: i18nStr.orgaName, field: 2,width: 10}
						  						  				,   {name: i18nStr.orgaCode, field: 3,width: 10}
						  						  				,   {name: i18nStr.sno, field: 4,width: 10}
						  						  				,   {name: i18nStr.remark, field: 5,width: 10}
						  						  				 ,  {name: i18nStr.parentId,field:6, width: 8}
						  				
					],[
							
							{ name: '\u8be6\u7ec6', colSpan: 7 ,styles: 'padding: 0; margin: 0;', get: getSubOrga }//value: '<div style="height:0px; background-color: white;"></div>'
						  ]
				  ]
	  
				}];	 
				
function getSubOrga(inRowIndex){
		var cell = this;
		setTimeout(function() { buildSubgridOrga(inRowIndex, cell); }, 0);
		var h =0;
		if(detailRowsOrga[inRowIndex]&&querydataOrga[inRowIndex][$childRow].length>0){
							h=65+25*querydataOrga[inRowIndex][$childRow].length;  		}
	return '<div style="height:'+h+'px; background-color: white;"></div>';
}				

//end buildLayout

var detailRowsOrga=[];

function onBeforeRow(inDataIndex, inRow) {	if (inRow[1]!=undefined)inRow[1].hidden = !detailRowsOrga[inDataIndex];}	

function toggleOrga(inIndex, inShow) {
        			if (!inShow) destroySubGridIdGeneral('',querydataOrga[inIndex][1],"OrgaMainDetail");
					if (!inShow) destroySubGridIdGeneral('',querydataOrga[inIndex][1],"OrgaChild");
				    detailRowsOrga[inIndex] = inShow;
				    dijit.byId("gridOrga").updateRow(inIndex); 
				    
    } 

function getCheckOrga(inRowIndex) {
	var image = (detailRowsOrga[inRowIndex] ? 'open.gif' : 'closed.gif');
	var show = (detailRowsOrga[inRowIndex] ? 'false' : 'true');
	return '<img src="../image/' + image + '" onclick="toggleOrga(' + inRowIndex + ', ' + show + ')" height="11" width="11">';
}



//function makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString) {return parentRowIndex+"_"+idString+"_" + inRowIndex;		}

//function destroySubGridIdGeneral(parentRowIndex,inRowIndex,idString) {	var subGrid = dijit.byId(makeSubGridIdGeneral(parentRowIndex,inRowIndex,idString));	if (subGrid) subGrid.destroy();	}

	  
function buildSubgridOrga(inRowIndex, inCell) {  //makeSubgridIdMainDetail(id)??idmainDetailGridid
	if(inCell!=undefined && inCell.getNode(inRowIndex)!=undefined){
		var child = inCell.getNode(inRowIndex).firstChild;
		var idmainDetail = makeSubGridIdGeneral('',querydataOrga[inRowIndex][1],"OrgaMainDetail");//makeSubgridIdMainDetail(querydataOrga[inRowIndex][1]);//taskmakeSubgridId(taskRowSubdata[inRowIndex][1]);
		var idchild = makeSubGridIdGeneral('',querydataOrga[inRowIndex][1],"OrgaChild");
		var subGridMainDetail = dijit.byId(idmainDetail);
		var subGridChild = dijit.byId(idchild);
		var dataChild=querydataOrga[inRowIndex][$childRow];
		if(dataChild.length!=0){
			if (subGridChild){
				subGridChild.model.setData(dataChild);
				child.appendChild(subGridChild.domNode);
			}else{
				modelOrgaChild=new dojox.grid.data.Table(null, dataChild);
				var childProps= {
								autoHeight: true, 
								autoRender: false,
								rowCount:dataChild.length,
								model:modelOrgaChild,							};
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

function querybuttonOrga(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvo.id=0 ;
              queryvoOrga=new Object();
	          if(queryOrgaorgaName.getDisplayedValue()!="")queryvoOrga.orgaName=queryOrgaorgaName.getDisplayedValue();//
	          if(queryOrgaorgaCode.getDisplayedValue()!="")queryvoOrga.orgaCode=queryOrgaorgaCode.getDisplayedValue();//
	          if(queryOrgasno.getDisplayedValue()!="")queryvoOrga.sno=queryOrgasno.getDisplayedValue();//
	          if(queryOrgaremark.getDisplayedValue()!="")queryvoOrga.remark=queryOrgaremark.getDisplayedValue();//
              n=queryNumber_fun("OrgaparentId");
              if(n==null){validstate=1;}else if(n.upSign!="%"){queryvoOrga.parentId=n;}  
			

			if(validstate==0){
              pagenumberOrga=1;
              getOrgaVO(queryvoOrga); 
             }      
       }

function getOrgaVO(queryvo){
	var totalCount=0;
	deletedataOrga =new Array();
      var pu = new SOAPClientParameters2();
      pu.add('OrgaVO',queryvo) ;
      pu.add('pageNumber',pagenumberOrga) ;
	    pu.add('pageSize',pagesizeOrga) ;
	    pu.add('orderBy',orderByOrga) ;
      SOAPClient.invoke(urlOrga,"getOrga", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydataOrga=new Array();
		   querydataOrga=dojoOrga.OrgaVOtoArray_fun(ul,false);
           totalCountOrga=ul[ul.length-1]["ns:id"]; 
      }); 
      querydataOrga.splice(querydataOrga.length-1,1);
	  gridOrga.selection.clear();
      modelOrga.setData(querydataOrga);
      //dijit.byId("grid").updateRowCount(querydataOrga.length); 
	   var totalpage=Math.ceil(new Number(totalCountOrga)/pagesizeOrga);
	  
	if(totalpage>1){
		if(pagenumberOrga==1){
			dijit.byId("but6Orga").setDisabled(true);
			dijit.byId("but7Orga").setDisabled(false);
		}else if(pagenumberOrga==totalpage){
			dijit.byId("but6Orga").setDisabled(false);
			dijit.byId("but7Orga").setDisabled(true);
		}else{
			dijit.byId("but6Orga").setDisabled(false);
			dijit.byId("but7Orga").setDisabled(false);
		}
	}else{
		dijit.byId("but6Orga").setDisabled(true);
		dijit.byId("but7Orga").setDisabled(true);
	
	}
	if(pagesizeOrga==0){
		totalpage=1;
		dijit.byId("but6Orga").setDisabled(true);
		dijit.byId("but7Orga").setDisabled(true);
	}
	if(totalpage==1)pagenumberOrga=1;
	
	 document.getElementById("rowCountOrga").innerHTML=i18nStr.di+" "+pagenumberOrga+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountOrga+" "+i18nStr.rowSize; 	
}

function init(){
	
 	gridOrga.onStyleRow=OnStyleRowClassBlue();
	getOrgaVO(queryvoOrga);
}

 dojo.addOnLoad(init);   



function allopen(){
		if(styleSign==0){
          for(var i =0;i<querydataOrga.length;i++){
            toggleOrga(i,true);
          }
	    }else{
			for(var i =0;i<querydataOrga.length;i++){
            toggleOrga2(i,true);
          }
		}
 }  

function allclose(){
		if(styleSign==0){
          for(var i =0;i<querydataOrga.length;i++){
            toggleOrga(i,false);
          }
		}else{
			for(var i =0;i<querydataOrga.length;i++){
            toggleOrga2(i,false);
          }
		}
}

function pageSizeChangeOrga(mylabel){
	pagesizeOrga=mylabel;
	pagenumberOrga=1;
	getOrgaVO(queryvoOrga);
}

function allpageOrga(){
	pagesizeOrga=0;
	getOrgaVO(queryvoOrga);
}

function upPageOrga(){
	pagenumberOrga--;
	getOrgaVO(queryvoOrga);
}
function downPageOrga(){
	pagenumberOrga++;
	getOrgaVO(queryvoOrga);
}

function pageStyleOrga(style){//nomarl,col,noscroll
	gridOrga.scrollToRow(0);
	if(style=="simply"){
		gridOrga.setStructure(mainLayout);
		styleSign=0;
	}else if(style=="whole"){
		gridOrga.setStructure(mainLayout2);
		styleSign=2;
	/*}else if(style=="noscroll"){
		gridOrderd.setStructure(layoutNoscroll);*/
	}
}


</script>
</head>	 
<body class="tundra">
 <!--rowinum=$rowinum-->

<div id="queryDivOrga" style="margin-right: 0px;  height: 100px; display:none;" >
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
							<td align="right" i18n="orgaName" >orgaName:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="queryOrgaorgaName"  jsId="queryOrgaorgaName"   dojoType="dijit.form.TextBox"  />
													</td>
														<td align="right"  i18n="orgaCode" >orgaCode:</td>
						<td align="left"  colspan="3" >
													<input type="text" class="editerInput"  id="queryOrgaorgaCode"  jsId="queryOrgaorgaCode"   dojoType="dijit.form.TextBox"  />
												</td>  
													<td align="right"  i18n="sno" >sno:</td>
						<td align="left"  >
													<input type="text" class="editerInput"  id="queryOrgasno"  jsId="queryOrgasno"   dojoType="dijit.form.TextBox"  />
												</td>  
										  </tr>
			                <tr>
							<td align="right" i18n="remark" >remark:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="queryOrgaremark"  jsId="queryOrgaremark"   dojoType="dijit.form.TextBox"  />
													</td>
																		<td align="right"  i18n="parentId" >parentId:</td>
							<td align="left" colspan="3" >
								<span id="queryOrgaparentIdImg0"  ><input type="text" class="editerNumber" jsId="queryOrgaparentId"  id="queryOrgaparentId"  dojoType="mydojo.NumberTextBox"  /></span>
								<span id="queryOrgaparentIdImg1"  style="{display:none}" ><input type="text" class="editerNumberSmall" jsid="queryOrgaparentId1"  id="queryOrgaparentId1"  dojoType="mydojo.NumberTextBox"  /></span>
								<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryOrgaparentIdImgup">></span>
								<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryOrgaparentIdImgdown" >></span>
								<span id="queryOrgaparentIdImg2div" style="{display:none}"> <input type="text" class="editerNumberSmall"  jsId="queryOrgaparentId2"  id="queryOrgaparentId2"  dojoType="mydojo.NumberTextBox"  /></span>
								<img src="../image/nStart.gif" onclick="queryType(this);" id="queryOrgaparentIdImg" class="imgStyle">
							</td>  
							


    <td align="right"    ></td><td align="right"    ></td></tr>

         <tr align="center"><td></td>
           <td colspan="1"> <button dojoType="dijit.form.Button" onclick="querybuttonOrga();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="1"><button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="3"></td></tr>
         </table>
</div>	

<table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   Orga List</b></td>
		<td align="right" >
	<button dojoType="dijit.form.Button" onclick="querydisplay('queryDivOrga');" iconClass="queryIcon"  i18n="openQuery" >query</button>
	<span id="rowCountOrga"></span>
		<button dojoType="dijit.form.myButton" onclick="upPageOrga();"  id="but6Orga" disabled='true' jsId="but6Orga" iconClass="upPageIcon" ></button><!--span dojoType="dijit.Tooltip" connectId="but6">pageup</span-->
		<button dojoType="dijit.form.myButton" onclick="downPageOrga();" id="but7Orga" disabled='true' jsId="but7Orga" iconClass="downPageIcon" ></button><!--span dojoType="dijit.Tooltip" connectId="but7">pagedown</span-->
		<div  dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
			  <div dojoType="dijit.Menu">
				  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChangeOrga(this.label);"></div>
				  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChangeOrga(this.label);"></div>
			  <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChangeOrga(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChangeOrga(this.label);"></div>
					<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpageOrga();"></div>
			  </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
		</div>
		<button dojoType="dijit.form.myButton" onclick="allopen();"  iconClass="allopenIcon" ></button>
		<button dojoType="dijit.form.myButton" onclick="allclose();" iconClass="allcloseIcon"  ></button>
		</td>
	</tr>
</table>	    

<div id="gridOrga"  dojoType="dojox.Grid"  autoWidth="false" style="{width:100%;height:85%}" 	jsId="gridOrga"	model="modelOrga" structure="mainLayout"  ></div>
</body>
<script type="text/javascript">trans18tag();</script>
</html>					 





















					
