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
			dojo.require("projectDojo.car");

	//??¡è???????????????¨¨?¡§		
														dojo.require("projectDojo.TaskForm");
						

     </script>
		        
     <script type="text/javascript" src="../js/soapclient.js"></script>
     <script type="text/javascript" src="../js/wlProject.js"></script>
     <script type="text/javascript" src="../js/myi18n.js"></script>
	 
 			<script type="text/javascript" src="../order/car2taskFormsAFTab.js"></script><!--org.andromda.cartridges.bpm4struts.metafacades.StrutsManageableEntityLogicImpl[TaskForm]-->
	  

 
 	<script type="text/javascript" >
	  var dojocar= new  projectDojo.car();
	  dojocar.initcar();
	//??¡è???????????????¨¨?¡§		
							
							 var dojoTaskForm= new  projectDojo.TaskForm();
				dojoTaskForm.initTaskForm();
							  
	  var urlcar = getUrl()+ "services/carManageService";
	  var deletedatacar =  new Array();
	  var querydatacar =  new Array();
	  var pagenumbercar=1;
	  var totalCountcar=0;
	  var pagesizecar=10;
	  var orderBycar='0';
	  var queryvocar=new Object();
	  var oddstyle='';
	  var modelcar = new dojox.grid.data.Table(null, querydatacar);
	  //var urle = getUrl()+ "services/BasicManageService";    
//begin-----?????¡À¨ª?¡§????¨ª??-------------------------------------------------------------------------------------------	  

//end-----?????¡À¨ª?¡§????)-------------------------------------------------------------------------------------------

//begin-------?????¡À¨ª????,??float????------------------------------------------------------------------------------------
 //???¡À????1212??layout??layoutstructure  (????layoutenumeration???????¨ª??!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			 
	var layoutSingleRowQuery=[{
		//field????????¨ª??¨ª??js??toArray¡Á???querydate??
	    cells: [ [

                { name: 'NO.', width: 2, styles: 'text-align: center;', get: function(inRowIndex){ return inRowIndex+1;} },//
				  				  {name: i18nStr.load,field:2, width: 8}
						  				
					]]}];	 

					
						   
					
					
					
//end-------?????¡À¨ª????,??float????------------------------------------------------------------------------------------

/*	dojo.connect(dijit.byId("carAFTab"), "selectChild", function(e){
			if (dijit.byId("carAFTab").selectedChildWidget.id=="car2taskForms"){
			buildcar2taskForms();
				}
		}); */
function myOnLoad(){
	clickRowTab();
}	

function resetNU(trueTab){
						NUcar2taskForms=true;
			}
function clickRowTab(){
							buildcar2taskForms();
			}
				
var mainID;
function getVOcar(queryvo){
	var totalCount=0;
      var pu = new SOAPClientParameters2();
      pu.add('carVO',queryvo) ;
      pu.add('pageNumber',pagenumbercar) ;
	    pu.add('pageSize',pagesizecar) ;
	    pu.add('orderBy',orderBycar) ;
      SOAPClient.invoke(urlcar,"getcar", pu, false,  function GetEnu_callBack(ul, soapResponse){      
           querydatacar=new Array();
		   querydatacar=dojocar.carVOtoArray_fun(ul,false);
           totalCountcar=ul[ul.length-1]["ns:id"]; 
      }); 
      querydatacar.splice(querydatacar.length-1,1);
      modelcar.setData(querydatacar);
      var totalpage=Math.ceil(new Number(totalCountcar)/pagesizecar);
	  
	if(totalpage>1){
		if(pagenumbercar==1){
			dijit.byId("but6car").setDisabled(true);
			dijit.byId("but7car").setDisabled(false);
		}else if(pagenumbercar==totalpage){
			dijit.byId("but6car").setDisabled(false);
			dijit.byId("but7car").setDisabled(true);
		}else{
			dijit.byId("but6car").setDisabled(false);
			dijit.byId("but7car").setDisabled(false);
		}
	}else{
		dijit.byId("but6car").setDisabled(true);
		dijit.byId("but7car").setDisabled(true);
	
	}
	if(pagesizecar==0){
		totalpage=1;
		dijit.byId("but6car").setDisabled(true);
		dijit.byId("but7car").setDisabled(true);
	}
	if(totalpage==1)pagenumbercar=1;
	
	 document.getElementById("rowCountcar").innerHTML=i18nStr.di+" "+pagenumbercar+" "+i18nStr.page+" / "+i18nStr.totle+" "+totalpage+" "+i18nStr.page+" / "+i18nStr.sum+" "+totalCountcar+" "+i18nStr.rowSize; 	
	  
	  
 }
var connecthandle=0 ;
var handle ;
function gridResize(){
			if(gridcar2taskForms!=undefined)gridcar2taskForms.resize({h: dijit.byId("bottomPane").domNode.clientHeight-90});
	 		gridcar.resize({h:document.body.clientHeight-dijit.byId("bottomPane").domNode.clientHeight-36});
}		
function init(){
  getVOcar(queryvocar);
  var m = dijit.byId("bottomPane"); 
  if(m._showing)m.toggle();
  
setTimeout(function(){
	gridcar.resize({h: document.body.clientHeight-86});
		dojo.connect(dijit.byId("bottomPane"), "_showEnd", function(e){
		if(connecthandle==0){
			handle=dojo.connect(dijit.byId("gridcar"), "doclick", function(e){
				mainID=querydatacar[e.rowIndex][1];
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
function querybuttoncar(){
              //var p = new SOAPClientParameters2();
              var d,n;
              var validstate=0;
              //queryvocar.id=0 ;
              queryvocar=new Object();
								  n=queryNumber_fun("carload");
					  if(n==null){validstate=1;}else if(n.upSign!="%"){queryvocar.load=n;}  
							

			if(validstate==0){
              pagenumber=1;
			  getVOcar(queryvocar);
              //getVO(queryvocar,pagenumber,pagesize,'0'); 
              //if(totalpage>1){dijit.byId("but7").setDisabled(false);}else{dijit.byId("but7").setDisabled(true);} 
             }      
       }

function pageSizeChangecar(mylabel){
	pagesizecar=mylabel;
	pagenumbercar=1;
	getVOcar(queryvocar);
}

function allpagecar(){
	pagesizecar=0;
	getVOcar(queryvocar);
}

function upPagecar(){
	pagenumbercar--;
	getVOcar(queryvocar);
}
function downPagecar(){
	pagenumbercar++;
	getVOcar(queryvocar);
}
//totleinum=1
 //rowinum=0


</script>
</head>
<body class="tundra">
<div id="bc" style="width:100%; height:100%;" dojoType="dijit.layout.BorderContainer">
<div dojoType="dijit.layout.ContentPane"  title="" region="center" id="topPane" 	 >
<div id="queryDivcar" style="margin-right: 0px;  height: 80px; display:none;" >
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
				<td align="right" i18n="load" >load:</td>
			<td align="left"  >
							<span id="querycarloadImg0"  ><input type="text" class="editerNumber"   jsId="querycarload"  id="querycarload"  dojoType="mydojo.NumberTextBox"  /></span>
							<span id="querycarloadImg1" style="{display:none}" ><input type="text"  class="editerNumberSmall" jsId="querycarload1"  id="querycarload1"  dojoType="mydojo.NumberTextBox"  /></span>
							<span hidefocus="true" style="{display:none}" onclick="selectSign(this);" id="querycarloadImgup">></span>
							<span hidefocus="false"  style="{display:none}" onclick="selectSign(this);" id="querycarloadImgdown" >></span>
							<span id="querycarloadImg2div" style="{display:none}"> <input type="text"  class="editerNumberSmall"  jsId="querycarload2"  id="querycarload2"  dojoType="mydojo.NumberTextBox"  /></span>
							<img src="../image/nStart.gif" onclick="queryType(this);" id="querycarloadImg" class="imgStyle">
							
						</td>
				
    <td align="right"    ></td><td align="right"    ></td><td align="right"    ></td><td align="right"    ></td></tr>

         <tr align="center"><td></td>
           <td colspan="1"> <button dojoType="dijit.form.Button" onclick="querybuttoncar();" iconClass="queryIcon"  i18n="query" >query</button></td>
           <td colspan="1"><button dojoType="dijit.form.Button"  i18n="reset" iconClass="resetIcon">reset</button></td><td colspan="3"></td></tr>
         </table>
	    </div>		
<table  width="100%">
	<tr height="25px" width="100%">
		<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   car List</b></td>
		<td align="right" >

				<button dojoType="dijit.form.Button" onclick="querydisplay('queryDivcar');" iconClass="openQueryIcon"  i18n="openQuery" >query</button>
				<span id="rowCountcar"></span>
						<button dojoType="dijit.form.myButton" onclick="upPagecar();"  id="but6car" disabled='true' jsId="but6car" iconClass="upPageIcon" >pageup</button><!--span dojoType="dijit.Tooltip" connectId="but6">pageup</span-->
						<button dojoType="dijit.form.myButton" onclick="downPagecar();" id="but7car" disabled='true' jsId="but7car" iconClass="downPageIcon" >pagedown</button><!--span dojoType="dijit.Tooltip" connectId="but7">pagedown</span-->
						<div  dojoType="dijit.form.myDropDownButton" iconClass="pageIcon" ><span>pageNumber</span>
							  <div dojoType="dijit.Menu">
								  <div dojoType="dijit.MenuItem" label="10"  iconClass="toPageIcon"		onClick="pageSizeChangecar(this.label);"></div>
								  <div dojoType="dijit.MenuItem"  label="30" iconClass="toPageIcon"		onClick="pageSizeChangecar(this.label);"></div>
							  <div dojoType="dijit.MenuItem"  label="50" iconClass="toPageIcon"		onClick="pageSizeChangecar(this.label);"></div>
									<div dojoType="dijit.MenuItem"  label="100" iconClass="toPageIcon"	onClick="pageSizeChangecar(this.label);"></div>
									<div dojoType="dijit.MenuItem"  label="noPage" iconClass="noPageIcon"	onClick="allpagecar();"></div>
							  </div><!--span dojoType="dijit.Tooltip" connectId="668"></span-->
						</div>
		</td>
	</tr>
</table>	       	
       <div id="gridcar"  dojoType="dojox.Grid" autoWidth="false"  jsId="gridcar"	model="modelcar"  structure="layoutSingleRowQuery"  ></div>
    </div>  
	<div dojoType="dojox.layout.ExpandoPane" splitter="true" duration="125" region="bottom" title="relative data" style="height:375px;" onLoad="myOnLoad" id="bottomPane" jsId="bottomPane" >
		<table   style=" position:absolute;top:0px; width:90%">
	<tr height="25px" width="100%">
		
							<td align="left"><img src="../image/imgTitle.jpg" class="imgTitleStyle" ><b>   car2taskForms List</b></td>
			<td align="right" >
						<span id="rowCountcar2taskForms"></span>&nbsp;&nbsp;
						<button dojoType="dijit.form.myButton" onclick="upPagecar2taskForms();"  id="but6car2taskForms" disabled='true' jsId="but6car2taskForms" iconClass="upPageIcon" >pageup</button>
						<button dojoType="dijit.form.myButton" onclick="downPagecar2taskForms();" id="but7car2taskForms" disabled='true' jsId="but7car2taskForms" iconClass="downPageIcon" >pagedown</button>
			</td>
		</tr>
	</table>			
					<div id="gridcar2taskForms" dojoType="dojox.Grid" autoWidth="false"  jsId="gridcar2taskForms"	model="modelcar2taskForms"  structure="layoutcar2taskForms"  ></div>
				
				</div> 
</div>	
</body>
<script type="text/javascript">trans18tag();</script>
</html>
 