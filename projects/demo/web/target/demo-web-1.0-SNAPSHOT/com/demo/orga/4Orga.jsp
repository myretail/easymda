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
			dojo.require("projectDojo.Orga");

	//??¡è???????????????¨¨?¡§		
														dojo.require("projectDojo.OrgaPeoples");
						

     </script>
		        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 
 			<script type="text/javascript" src="../orga/orga2orgaPeoplesCrudAFTab.js"></script>
	  

 
 	<script type="text/javascript" >
	  var dojoOrga= new  projectDojo.Orga();
	  dojoOrga.initOrga();
	//??¡è???????????????¨¨?¡§		
							
							 var dojoOrgaPeoples= new  projectDojo.OrgaPeoples();
				dojoOrgaPeoples.initOrgaPeoples();
							  
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

//begin-----?????¡À¨ª?¡§????¨ª??-------------------------------------------------------------------------------------------	  

//end-----?????¡À¨ª?¡§????)-------------------------------------------------------------------------------------------

//begin-------?????¡À¨ª????,??float????------------------------------------------------------------------------------------
 //???¡À????1212??layout??layoutstructure  (????layoutenumeration???????¨ª??!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
											 
	var layoutSingleRowQuery=[{
		//field????????¨ª??¨ª??js??toArray¡Á???querydate??
	    cells: [ [

                { name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
				  				  {name: i18nStr.orgaName, field: 2,width: 10}
						  						  				,   {name: i18nStr.orgaCode, field: 3,width: 10}
						  						  				,   {name: i18nStr.sno, field: 4,width: 10}
						  						  				,   {name: i18nStr.remark, field: 5,width: 10}
						  						  				 ,  {name: i18nStr.parentId,field:6, width: 8}
						  				
					]]}];	 

					
						   
					
					
					
//end-------?????¡À¨ª????,??float????------------------------------------------------------------------------------------

/*	dojo.connect(dijit.byId("OrgaAFTab"), "selectChild", function(e){
			if (dijit.byId("OrgaAFTab").selectedChildWidget.id=="orga2orgaPeoples"){
			buildorga2orgaPeoples();
				}
		}); */
function myOnLoad(){
	clickRowTab();
}	

function resetNU(trueTab){
						NUorga2orgaPeoples=true;
			}
function clickRowTab(){
							buildorga2orgaPeoples();
			}
				
var mainID;
var mainName;



function getVOOrga(queryvo){
	var totalCount=0;
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
      modelOrga.setData(querydataOrga);
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
var connecthandle=0 ;
var handle ;
function gridResize(){
			if(gridorga2orgaPeoples!=undefined)gridorga2orgaPeoples.resize({h: dijit.byId("bottomPane").domNode.clientHeight-90});
	 		gridOrga.resize({h:document.body.clientHeight-dijit.byId("bottomPane").domNode.clientHeight-36});
}		
function init(){
  getVOOrga(queryvoOrga);
  var m = dijit.byId("bottomPane"); 
  if(m._showing)m.toggle();
  
setTimeout(function(){
	gridOrga.resize({h: document.body.clientHeight-86});
		dojo.connect(dijit.byId("bottomPane"), "_showEnd", function(e){
		if(connecthandle==0){
			handle=dojo.connect(dijit.byId("gridOrga"), "doclick", function(e){
				mainID=querydataOrga[e.rowIndex][1];
				mainName = querydataOrga[e.rowIndex][2];
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
function querybuttonOrga(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvoOrga.id=0 ;
              queryvoOrga=new Object();
								  if(queryOrgaorgaName.getDisplayedValue()!="")queryvoOrga.orgaName=queryOrgaorgaName.getDisplayedValue();//
											  if(queryOrgaorgaCode.getDisplayedValue()!="")queryvoOrga.orgaCode=queryOrgaorgaCode.getDisplayedValue();//
											  if(queryOrgasno.getDisplayedValue()!="")queryvoOrga.sno=queryOrgasno.getDisplayedValue();//
											  if(queryOrgaremark.getDisplayedValue()!="")queryvoOrga.remark=queryOrgaremark.getDisplayedValue();//
											  n=queryNumber_fun("OrgaparentId");
					  if(n==null){validstate=1;}else if(n.upSign!="%"){queryvoOrga.parentId=n;}  
							

			if(validstate==0){
              pagenumber=1;
			  getVOOrga(queryvoOrga);
              //getVO(queryvoOrga,pagenumber,pagesize,'0'); 
              //if(totalpage>1){dijit.byId("but7").setDisabled(false);}else{dijit.byId("but7").setDisabled(true);} 
             }      
       }

function pageSizeChangeOrga(mylabel){
	pagesizeOrga=mylabel;
	pagenumberOrga=1;
	getVOOrga(queryvoOrga);
}

function allpageOrga(){
	pagesizeOrga=0;
	getVOOrga(queryvoOrga);
}

function upPageOrga(){
	pagenumberOrga--;
	getVOOrga(queryvoOrga);
}
function downPageOrga(){
	pagenumberOrga++;
	getVOOrga(queryvoOrga);
}
//totleinum=5
 //rowinum=1


</script>
</head>
<body class="tundra">
<div id="bc" style="width:100%; height:100%;" dojoType="dijit.layout.BorderContainer">
<div dojoType="dijit.layout.ContentPane"  title="" region="center" id="topPane" 	 >
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
								<span id="queryOrgaparentIdImg1"  style="{display:none}" ><input type="text" class="editerNumberSmall" jsId="queryOrgaparentId1"  id="queryOrgaparentId1"  dojoType="mydojo.NumberTextBox"  /></span>
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

				<button dojoType="dijit.form.Button" onclick="querydisplay('queryDivOrga');" iconClass="openQueryIcon"  i18n="openQuery" >query</button>
				<span id="rowCountOrga"></span>
						<button dojoType="dijit.form.myButton" onclick="upPageOrga();"  id="but6Orga" disabled='true' jsId="but6Orga" iconClass="upPageIcon" >pageup</button><!--span dojoType="dijit.Tooltip" connectId="but6">pageup</span-->
						<button dojoType="dijit.form.myButton" onclick="downPageOrga();" id="but7Orga" disabled='true' jsId="but7Orga" iconClass="downPageIcon" >pagedown</button><!--span dojoType="dijit.Tooltip" connectId="but7">pagedown</span-->
						<div  dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
							  <div dojoType="dijit.Menu">
								  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChangeOrga(this.label);"></div>
								  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChangeOrga(this.label);"></div>
							  <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChangeOrga(this.label);"></div>
									<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChangeOrga(this.label);"></div>
									<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpageOrga();"></div>
							  </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
						</div>
		</td>
	</tr>
</table>	       	
       <div id="gridOrga"  dojoType="dojox.Grid" autoWidth="false"  jsId="gridOrga"	model="modelOrga"  structure="layoutSingleRowQuery"  ></div>
    </div>  
	<div dojoType="dojox.layout.ExpandoPane" splitter="true" duration="125" region="bottom" title="relative data" style="height:375px;" onLoad="myOnLoad" id="bottomPane" jsId="bottomPane" >
		<table   style=" position:absolute;top:0px; width:90%">
	<tr height="25px" width="100%">
		
							<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   orga2orgaPeoples List</b></td>
			<td align="right" >
						<span id="rowCountorga2orgaPeoples"></span>&nbsp;&nbsp;
						<button dojoType="dijit.form.myButton" onclick="upPageorga2orgaPeoples();"  id="but6orga2orgaPeoples" disabled='true' jsId="but6orga2orgaPeoples" iconClass="upPageIcon" >pageup</button>
						<button dojoType="dijit.form.myButton" onclick="downPageorga2orgaPeoples();" id="but7orga2orgaPeoples" disabled='true' jsId="but7orga2orgaPeoples" iconClass="downPageIcon" >pagedown</button>
																																<button dojoType="dijit.form.myButton" onclick="saveorga2orgaPeoples();"  iconClass="saveIcon" ></button>
								</td>
		</tr>
	</table>			
					<div id="gridorga2orgaPeoples" dojoType="dojox.Grid" autoWidth="false"  jsId="gridorga2orgaPeoples"	model="modelorga2orgaPeoples"  structure="layoutorga2orgaPeoples"  ></div>
				
				</div> 
</div>	
</body>
<script type="text/javascript">trans18tag();</script>
</html>
 