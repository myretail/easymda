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
			dojo.require("projectDojo.Orga");
	//??¡è???????????????¨¨?¡§		
							dojo.require("projectDojo.OrgaPeoples");
			
		 function orga2orgaPeoplesFloatPara(id){
		  //this.ID=id;
		  this.deletedataorga2orgaPeoples=new Array();
		  this.querydataorga2orgaPeoples=new Array();
		  this.pagenumberorga2orgaPeoples=1;
		  this.totalCountorga2orgaPeoples=0;
		  this.pagesizeorga2orgaPeoples=10;
		  this.orderByorga2orgaPeoples='0';
		  this.queryvoorga2orgaPeoples=new Object();
		  //this.oddstyle='';
		  this.modelorga2orgaPeoples = new dojox.grid.data.Table(null, this.querydataorga2orgaPeoples);
		  this.gridorga2orgaPeoples=''
	 }
	 
	 var orga2orgaPeoplesFloatArray=new Array();
	
     </script>
		        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>

 					<script type="text/javascript" src="../orga/orga2orgaPeoplesFloatAFTab.js"></script>
		
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
		//field????????¨°???js??toArray¡Á???querydate??
	    cells: [ [
						{name: 'openFloat', styles: 'text-align: center;', width: 3, get:function(inRowIndex){return '<img src="../image/EmbedLink.gif" style="cursor:pointer"  onclick="openFloat('+inRowIndex+',event);"  height="16" width="16" >';}},
                { name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
				  				  {name: i18nStr.orgaName, field: 2,width: 10}
						  						  				,   {name: i18nStr.orgaCode, field: 3,width: 10}
						  						  				,   {name: i18nStr.sno, field: 4,width: 10}
						  						  				,   {name: i18nStr.remark, field: 5,width: 10}
						  						  				 ,  {name: i18nStr.parentId,field:6, width: 8}
						  				
					]]}];	 
					
					
					
					
					
//end-------?????¡À¨ª????,??float????------------------------------------------------------------------------------------
var onloadmy=function(){
										buildorga2orgaPeoples(mainID);
						}					
var mainID;
var floatIndex=0;
var flag=0;//0,1

function openFloat(indexRow,e){
	mainID=querydataOrga[indexRow][1];
	var FloatID ="openFloat_"+mainID;//??¨°???float????
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
			//href:"OrgaQueryAFFloat.html"
		},div);
		dojo.style(fp.domNode,{
			width:"1000px",
			height:"600px",
			top:80+30*floatIndex, left:120+30*floatIndex,
			position:"absolute",
			zIndex:"980"
		});
		openFloat=fp;
											buildorga2orgaPeoples(mainID);
								fp.startup();
	fp.show();


dojo.connect(openFloat, "resize", function(e){
	var innerID=""+openFloat.id.replace("Orga","");
			orga2orgaPeoplesFloatArray[""+innerID].gridorga2orgaPeoples.resize({w: openFloat.domNode.clientWidth-16,h:openFloat.domNode.clientHeight-100});
		
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
		var signHeight = dijit.byId("gridOrga").domNode.clientHeight/allFloatArray.length;
		var tt=0;
		for (var i=0; i<allFloatArray.length;i++){
			dojo.style(allFloatArray[i].domNode,{
			width:dijit.byId("gridOrga").domNode.clientWidth,
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
		var signWidth = dijit.byId("gridOrga").domNode.clientWidth/allFloatArray.length;
		var tt=0;
		for (var i=0; i<allFloatArray.length;i++){
			//allFloatArray[i].resize({t:tt ,l : 0,w:dijit.byId("gridOrga").domNode.clientWidth,h:signHeight});
			dojo.style(allFloatArray[i].domNode,{
			width:signWidth,
			height:dijit.byId("gridOrga").domNode.clientHeight,
			top:0, left:tt,
			position:"absolute",
			zIndex:"980"
		});
			allFloatArray[i].show();
			tt=tt+signWidth;
		}
	}
}




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
 
function init(){
  getVOOrga(queryvoOrga);
}

 dojo.addOnLoad(init);   
function querybutton(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvoOrga.id=0 ;
              queryvoOrga=new Object();
								  if(queryorgaName.getDisplayedValue()!="")queryvoOrga.orgaName=queryorgaName.getDisplayedValue();//
											  if(queryorgaCode.getDisplayedValue()!="")queryvoOrga.orgaCode=queryorgaCode.getDisplayedValue();//
											  if(querysno.getDisplayedValue()!="")queryvoOrga.sno=querysno.getDisplayedValue();//
											  if(queryremark.getDisplayedValue()!="")queryvoOrga.remark=queryremark.getDisplayedValue();//
											  n=queryNumber_fun("parentId");
					  if(n==null){validstate=1;}else if(n.upSign!="%"){queryvoOrga.parentId=n;}  
							

			if(validstate==0){
              pagenumber=1;
			  getVOOrga(queryvoOrga);
              //getVO(queryvoOrga,pagenumber,pagesize,'0'); 
              //if(totalpage>1){dijit.byId("but7").setDisabled(false);}else{dijit.byId("but7").setDisabled(true);} 
             }      
       }
//totleinum=5
 //rowinum=1

</script>
</head>
<body class="tundra">

<div id="queryDiv" style="margin-right: 0px;  height: 100px; display:none;" >
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
						
															<input type="text" class="editerInput"  id="queryorgaName"  jsId="queryorgaName"   dojoType="dijit.form.TextBox"  />
													</td>
														<td align="right"  i18n="orgaCode" >orgaCode:</td>
						<td align="left"  colspan="3" >
													<input type="text" class="editerInput"  id="queryorgaCode"  jsId="queryorgaCode"   dojoType="dijit.form.TextBox"  />
												</td>  
													<td align="right"  i18n="sno" >sno:</td>
						<td align="left"  >
													<input type="text" class="editerInput"  id="querysno"  jsId="querysno"   dojoType="dijit.form.TextBox"  />
												</td>  
										  </tr>
			                <tr>
							<td align="right" i18n="remark" >remark:</td>
						<td align="left"  >
						
															<input type="text" class="editerInput"  id="queryremark"  jsId="queryremark"   dojoType="dijit.form.TextBox"  />
													</td>
																		<td align="right"  i18n="parentId" >parentId:</td>
							<td align="left" colspan="3" >
								<span id="queryparentIdImg0"  ><input type="text" class="editerNumber" jsId="queryparentId"  id="queryparentId"  dojoType="mydojo.NumberTextBox"  /></span>
								<span id="queryparentIdImg1"  style="{display:none}" ><input type="text" class="editerNumberSmall" jsId="queryparentId1"  id="queryparentId1"  dojoType="mydojo.NumberTextBox"  /></span>
								<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="queryparentIdImgup">></span>
								<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="queryparentIdImgdown" >></span>
								<span id="queryparentIdImg2div" style="{display:none}"> <input type="text" class="editerNumberSmall"  jsId="queryparentId2"  id="queryparentId2"  dojoType="mydojo.NumberTextBox"  /></span>
								<img src="../image/nStart.gif" onclick="queryType(this);" id="queryparentIdImg" class="imgStyle">
							</td>  
							
    <td align="right"    ></td><td align="right"    ></td></tr>

         <tr align="center"><td></td>
           <td colspan="1"> <button dojoType="dijit.form.Button" onclick="querybutton();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="1"><button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="3"></td></tr>
         </table>
	    </div>	
 <table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   Orga List</b></td>
		<td align="right" >
				<button dojoType="dijit.form.Button" onclick="querydisplay('queryDiv');" iconClass="openQueryIcon"  i18n="openQuery" >query</button>
				<span id="rowCountOrga"></span>
						<button dojoType="dijit.form.myButton" onclick="upPageOrga();"  id="but6Orga" disabled='true' jsId="but6Orga" iconClass="upPageIcon" ></button>
						<button dojoType="dijit.form.myButton" onclick="downPageOrga();" id="but7Orga" disabled='true' jsId="but7Orga" iconClass="downPageIcon" ></button>
						<div  dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
							  <div dojoType="dijit.Menu">
								  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChangeOrga(this.label);"></div>
								  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChangeOrga(this.label);"></div>
							  <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChangeOrga(this.label);"></div>
									<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChangeOrga(this.label);"></div>
									<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpageOrga();"></div>
							  </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
						</div>
			</div>    
	    <div style="{height:90%;width:100%}"  >
	         <div id="gridOrga"  dojoType="dojox.Grid" autoWidth="false"  jsId="gridOrga"	model="modelOrga"  structure="layoutSingleRowQuery" singleClickEdit="true" ></div>
		</td>
	</tr>
</table>    
      
</body>
<script type="text/javascript">trans18tag();</script>
</html>
